/*
 * Copyright 2002-2019 Intel Corporation.
 * 
 * This software is provided to you as Sample Source Code as defined in the accompanying
 * End User License Agreement for the Intel(R) Software Development Products ("Agreement")
 * section 1.L.
 * 
 * This software and the related documents are provided as is, with no express or implied
 * warranties, other than those that are expressly stated in the License.
 */

//
// Adapted from ManualExamples/proccount.cpp
// This tool counts the number of times a routine is executed, as well as
// the number of instructions executed in a routine *that involve memory operands*,
// and computes a hash of the memory access log for the routine
//

#include <fstream>
#include <iomanip>
#include <iostream>
#include <string.h>
#include "pin.H"
using std::ofstream;
using std::string;
using std::hex;
using std::setw;
using std::cerr;
using std::dec;
using std::endl;

/* TODO: use SHA-256 (need to make OpenSSL libraries work with Pin) */
UINT64 strm_hash(UINT64 key, UINT64 seed = 0x1a8b714c) {
    constexpr UINT64 c1 = 0xCC9E2D51;
    constexpr UINT64 c2 = 0x1B873593;
    constexpr UINT64 n = 0xE6546B64;

    UINT64 k = key;
    k = k * c1;
    k = (k << 15) | (k >> 17);
    k *= c2;

    UINT64 h = k ^ seed;
    h = (h << 13) | (h >> 19);
    h = h*5 + n;

    h ^= 4;

    h ^= (h>>16);
    h *= 0x85EBCA6B;
    h ^= (h>>13);
    h *= 0xC2B2AE35;
    h ^= (h>>16);
    return h;
}

ofstream outFile;

// Holds instruction count for a single procedure
typedef struct RtnCount
{
    string _name;
    string _image;
    ADDRINT _address;
    RTN _rtn;
    UINT64 _rtnCount;
    UINT64 _icount;
    UINT64 _mem_hash;
    struct RtnCount * _next;
} RTN_COUNT;

// Linked list of instruction counts for each routine
RTN_COUNT * RtnList = 0;

VOID count(UINT64 * counter)
{
    (*counter)++;
}

VOID update_hash(UINT64 * counter, UINT64 *mem_hash, VOID *displacement)
{
    (*counter)++;
    *mem_hash = strm_hash((UINT64)displacement, *mem_hash);
}
    
const char * StripPath(const char * path)
{
    const char * file = strrchr(path,'/');
    if (file)
        return file+1;
    else
        return path;
}

// Pin calls this function every time a new rtn is executed
VOID Routine(RTN rtn, VOID *v)
{
    
    // Allocate a counter for this routine
    RTN_COUNT * rc = new RTN_COUNT;

    // The RTN goes away when the image is unloaded, so save it now
    // because we need it in the fini
    rc->_name = RTN_Name(rtn);
    rc->_image = StripPath(IMG_Name(SEC_Img(RTN_Sec(rtn))).c_str());
    rc->_address = RTN_Address(rtn);
    rc->_icount = 0;
    rc->_rtnCount = 0;
    rc->_mem_hash = 0;

    // Add to list of routines
    rc->_next = RtnList;
    RtnList = rc;
            
    RTN_Open(rtn);
    
    // Insert a call at the entry point of a routine to increment the call count
    RTN_InsertCall(rtn, IPOINT_BEFORE, (AFUNPTR)count, IARG_PTR, &(rc->_rtnCount), IARG_END);
    
    // For each instruction of the routine
    for (INS ins = RTN_InsHead(rtn); INS_Valid(ins); ins = INS_Next(ins))
    {
        UINT32 memOperands = INS_MemoryOperandCount(ins);
        for (UINT32 memOp = 0; memOp < memOperands; memOp++)
        {
            ADDRINT displacement = INS_OperandMemoryDisplacement(ins, memOp);
            if ((INS_MemoryOperandIsRead(ins, memOp) || 
                INS_MemoryOperandIsWritten(ins, memOp))) {
                INS_InsertCall(ins, IPOINT_BEFORE, (AFUNPTR)update_hash, 
                    IARG_PTR, &(rc->_icount), 
                    IARG_PTR, &(rc->_mem_hash),
                    IARG_PTR, displacement, 
                    IARG_END);
                break;
            }
        }
    }

    
    RTN_Close(rtn);
}

// This function is called when the application exits
// It prints the name and count for each procedure
VOID Fini(INT32 code, VOID *v)
{
    std::cout << setw(23) << "Procedure" << " "
          << setw(15) << "Image" << " "
          //<< setw(18) << "Address" << " "
          << setw(12) << "Calls" << " "
          << setw(12) << "Mem accesses" << " "
          << setw(16) << "Log hash" << endl;

    for (RTN_COUNT * rc = RtnList; rc; rc = rc->_next)
    {
        if (rc->_icount > 0)
            std::cout << setw(23) << rc->_name << " "
                  << setw(15) << rc->_image << " "
                  //<< setw(18) << hex << rc->_address << dec <<" "
                  << setw(12) << rc->_rtnCount << " "
                  << setw(12) << rc->_icount << " " 
                  << setw(16) << hex << rc->_mem_hash << dec << endl;
    }

}

/* ===================================================================== */
/* Print Help Message                                                    */
/* ===================================================================== */

INT32 Usage()
{
    cerr << "This Pintool counts the number of times a routine is executed," << endl;
    cerr << "as well as the number of memory accesses per routine," << endl;
    cerr << "and computes a hash of the memory access log for the routine" << endl;
    cerr << endl << KNOB_BASE::StringKnobSummary() << endl;
    return -1;
}

/* ===================================================================== */
/* Main                                                                  */
/* ===================================================================== */

int main(int argc, char * argv[])
{
    // Initialize symbol table code, needed for rtn instrumentation
    PIN_InitSymbols();

    // Initialize pin
    if (PIN_Init(argc, argv)) return Usage();

    // Register Routine to be called to instrument rtn
    RTN_AddInstrumentFunction(Routine, 0);

    // Register Fini to be called when the application exits
    PIN_AddFiniFunction(Fini, 0);
    
    // Start the program, never returns
    PIN_StartProgram();
    
    return 0;
}
