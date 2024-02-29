#ifndef DISTRIBUTED_SGX_SORT_ENCLAVE_SIM_CERT_H
#define DISTRIBUTED_SGX_SORT_ENCLAVE_SIM_CERT_H

static unsigned char SIM_PRIVKEY[303] = {
    0x2d, 0x2d, 0x2d, 0x2d, 0x2d, 0x42, 0x45, 0x47, 0x49, 0x4e, 0x20, 0x45, 0x43, 0x20, 0x50, 0x41,
    0x52, 0x41, 0x4d, 0x45, 0x54, 0x45, 0x52, 0x53, 0x2d, 0x2d, 0x2d, 0x2d, 0x2d, 0x0a, 0x42, 0x67,
    0x67, 0x71, 0x68, 0x6b, 0x6a, 0x4f, 0x50, 0x51, 0x4d, 0x42, 0x42, 0x77, 0x3d, 0x3d, 0x0a, 0x2d,
    0x2d, 0x2d, 0x2d, 0x2d, 0x45, 0x4e, 0x44, 0x20, 0x45, 0x43, 0x20, 0x50, 0x41, 0x52, 0x41, 0x4d,
    0x45, 0x54, 0x45, 0x52, 0x53, 0x2d, 0x2d, 0x2d, 0x2d, 0x2d, 0x0a, 0x2d, 0x2d, 0x2d, 0x2d, 0x2d,
    0x42, 0x45, 0x47, 0x49, 0x4e, 0x20, 0x45, 0x43, 0x20, 0x50, 0x52, 0x49, 0x56, 0x41, 0x54, 0x45,
    0x20, 0x4b, 0x45, 0x59, 0x2d, 0x2d, 0x2d, 0x2d, 0x2d, 0x0a, 0x4d, 0x48, 0x63, 0x43, 0x41, 0x51,
    0x45, 0x45, 0x49, 0x4a, 0x77, 0x46, 0x4e, 0x49, 0x57, 0x6c, 0x4f, 0x7a, 0x57, 0x43, 0x2b, 0x65,
    0x61, 0x74, 0x4c, 0x6e, 0x4a, 0x35, 0x4f, 0x64, 0x77, 0x49, 0x2f, 0x42, 0x35, 0x34, 0x79, 0x7a,
    0x7a, 0x35, 0x53, 0x34, 0x55, 0x76, 0x5a, 0x6a, 0x53, 0x68, 0x2b, 0x75, 0x61, 0x45, 0x6f, 0x41,
    0x6f, 0x47, 0x43, 0x43, 0x71, 0x47, 0x53, 0x4d, 0x34, 0x39, 0x0a, 0x41, 0x77, 0x45, 0x48, 0x6f,
    0x55, 0x51, 0x44, 0x51, 0x67, 0x41, 0x45, 0x2b, 0x65, 0x4a, 0x78, 0x33, 0x42, 0x35, 0x59, 0x68,
    0x4c, 0x48, 0x47, 0x56, 0x61, 0x6e, 0x63, 0x42, 0x6d, 0x7a, 0x4d, 0x47, 0x59, 0x30, 0x52, 0x5a,
    0x72, 0x6b, 0x2b, 0x39, 0x72, 0x33, 0x72, 0x37, 0x41, 0x6a, 0x7a, 0x36, 0x56, 0x74, 0x75, 0x34,
    0x52, 0x51, 0x65, 0x42, 0x66, 0x67, 0x6e, 0x56, 0x6a, 0x2f, 0x45, 0x0a, 0x35, 0x75, 0x43, 0x47,
    0x7a, 0x55, 0x78, 0x55, 0x49, 0x5a, 0x38, 0x64, 0x2f, 0x47, 0x6d, 0x47, 0x4a, 0x4d, 0x76, 0x46,
    0x61, 0x42, 0x4d, 0x49, 0x66, 0x4a, 0x46, 0x65, 0x38, 0x65, 0x36, 0x75, 0x65, 0x77, 0x3d, 0x3d,
    0x0a, 0x2d, 0x2d, 0x2d, 0x2d, 0x2d, 0x45, 0x4e, 0x44, 0x20, 0x45, 0x43, 0x20, 0x50, 0x52, 0x49,
    0x56, 0x41, 0x54, 0x45, 0x20, 0x4b, 0x45, 0x59, 0x2d, 0x2d, 0x2d, 0x2d, 0x2d, 0x0a, 0x00,
};

static unsigned char SIM_CERT[639] = {
    0x30, 0x82, 0x02, 0x7b, 0x30, 0x82, 0x02, 0x21, 0xa0, 0x03, 0x02, 0x01, 0x02, 0x02, 0x14, 0x3e,
    0xc1, 0xcb, 0x89, 0x7a, 0x85, 0x58, 0x04, 0xb9, 0x43, 0x67, 0x3b, 0xfd, 0xb6, 0xa3, 0x0c, 0x06,
    0x8c, 0x95, 0xd9, 0x30, 0x0a, 0x06, 0x08, 0x2a, 0x86, 0x48, 0xce, 0x3d, 0x04, 0x03, 0x02, 0x30,
    0x81, 0x91, 0x31, 0x0b, 0x30, 0x09, 0x06, 0x03, 0x55, 0x04, 0x06, 0x13, 0x02, 0x55, 0x53, 0x31,
    0x13, 0x30, 0x11, 0x06, 0x03, 0x55, 0x04, 0x08, 0x0c, 0x0a, 0x43, 0x61, 0x6c, 0x69, 0x66, 0x6f,
    0x72, 0x6e, 0x69, 0x61, 0x31, 0x11, 0x30, 0x0f, 0x06, 0x03, 0x55, 0x04, 0x07, 0x0c, 0x08, 0x42,
    0x65, 0x72, 0x6b, 0x65, 0x6c, 0x65, 0x79, 0x31, 0x2b, 0x30, 0x29, 0x06, 0x03, 0x55, 0x04, 0x0a,
    0x0c, 0x22, 0x55, 0x6e, 0x69, 0x76, 0x65, 0x72, 0x73, 0x69, 0x74, 0x79, 0x20, 0x6f, 0x66, 0x20,
    0x43, 0x61, 0x6c, 0x69, 0x66, 0x6f, 0x72, 0x6e, 0x69, 0x61, 0x2c, 0x20, 0x42, 0x65, 0x72, 0x6b,
    0x65, 0x6c, 0x65, 0x79, 0x31, 0x2d, 0x30, 0x2b, 0x06, 0x03, 0x55, 0x04, 0x03, 0x0c, 0x24, 0x44,
    0x69, 0x73, 0x74, 0x72, 0x69, 0x62, 0x75, 0x74, 0x65, 0x64, 0x20, 0x53, 0x47, 0x58, 0x20, 0x53,
    0x6f, 0x72, 0x74, 0x20, 0x53, 0x69, 0x6d, 0x75, 0x6c, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x20, 0x4d,
    0x6f, 0x64, 0x65, 0x30, 0x20, 0x17, 0x0d, 0x32, 0x31, 0x30, 0x34, 0x31, 0x33, 0x30, 0x30, 0x32,
    0x35, 0x32, 0x35, 0x5a, 0x18, 0x0f, 0x32, 0x31, 0x32, 0x31, 0x30, 0x33, 0x32, 0x30, 0x30, 0x30,
    0x32, 0x35, 0x32, 0x35, 0x5a, 0x30, 0x81, 0x91, 0x31, 0x0b, 0x30, 0x09, 0x06, 0x03, 0x55, 0x04,
    0x06, 0x13, 0x02, 0x55, 0x53, 0x31, 0x13, 0x30, 0x11, 0x06, 0x03, 0x55, 0x04, 0x08, 0x0c, 0x0a,
    0x43, 0x61, 0x6c, 0x69, 0x66, 0x6f, 0x72, 0x6e, 0x69, 0x61, 0x31, 0x11, 0x30, 0x0f, 0x06, 0x03,
    0x55, 0x04, 0x07, 0x0c, 0x08, 0x42, 0x65, 0x72, 0x6b, 0x65, 0x6c, 0x65, 0x79, 0x31, 0x2b, 0x30,
    0x29, 0x06, 0x03, 0x55, 0x04, 0x0a, 0x0c, 0x22, 0x55, 0x6e, 0x69, 0x76, 0x65, 0x72, 0x73, 0x69,
    0x74, 0x79, 0x20, 0x6f, 0x66, 0x20, 0x43, 0x61, 0x6c, 0x69, 0x66, 0x6f, 0x72, 0x6e, 0x69, 0x61,
    0x2c, 0x20, 0x42, 0x65, 0x72, 0x6b, 0x65, 0x6c, 0x65, 0x79, 0x31, 0x2d, 0x30, 0x2b, 0x06, 0x03,
    0x55, 0x04, 0x03, 0x0c, 0x24, 0x44, 0x69, 0x73, 0x74, 0x72, 0x69, 0x62, 0x75, 0x74, 0x65, 0x64,
    0x20, 0x53, 0x47, 0x58, 0x20, 0x53, 0x6f, 0x72, 0x74, 0x20, 0x53, 0x69, 0x6d, 0x75, 0x6c, 0x61,
    0x74, 0x69, 0x6f, 0x6e, 0x20, 0x4d, 0x6f, 0x64, 0x65, 0x30, 0x59, 0x30, 0x13, 0x06, 0x07, 0x2a,
    0x86, 0x48, 0xce, 0x3d, 0x02, 0x01, 0x06, 0x08, 0x2a, 0x86, 0x48, 0xce, 0x3d, 0x03, 0x01, 0x07,
    0x03, 0x42, 0x00, 0x04, 0xf9, 0xe2, 0x71, 0xdc, 0x1e, 0x58, 0x84, 0xb1, 0xc6, 0x55, 0xa9, 0xdc,
    0x06, 0x6c, 0xcc, 0x19, 0x8d, 0x11, 0x66, 0xb9, 0x3e, 0xf6, 0xbd, 0xeb, 0xec, 0x08, 0xf3, 0xe9,
    0x5b, 0x6e, 0xe1, 0x14, 0x1e, 0x05, 0xf8, 0x27, 0x56, 0x3f, 0xc4, 0xe6, 0xe0, 0x86, 0xcd, 0x4c,
    0x54, 0x21, 0x9f, 0x1d, 0xfc, 0x69, 0x86, 0x24, 0xcb, 0xc5, 0x68, 0x13, 0x08, 0x7c, 0x91, 0x5e,
    0xf1, 0xee, 0xae, 0x7b, 0xa3, 0x53, 0x30, 0x51, 0x30, 0x1d, 0x06, 0x03, 0x55, 0x1d, 0x0e, 0x04,
    0x16, 0x04, 0x14, 0x8d, 0x1f, 0x74, 0xaf, 0x7d, 0x3f, 0x5e, 0xa0, 0x60, 0xfb, 0x3a, 0x02, 0xdb,
    0x91, 0x74, 0x6e, 0xcd, 0xa8, 0x49, 0xe8, 0x30, 0x1f, 0x06, 0x03, 0x55, 0x1d, 0x23, 0x04, 0x18,
    0x30, 0x16, 0x80, 0x14, 0x8d, 0x1f, 0x74, 0xaf, 0x7d, 0x3f, 0x5e, 0xa0, 0x60, 0xfb, 0x3a, 0x02,
    0xdb, 0x91, 0x74, 0x6e, 0xcd, 0xa8, 0x49, 0xe8, 0x30, 0x0f, 0x06, 0x03, 0x55, 0x1d, 0x13, 0x01,
    0x01, 0xff, 0x04, 0x05, 0x30, 0x03, 0x01, 0x01, 0xff, 0x30, 0x0a, 0x06, 0x08, 0x2a, 0x86, 0x48,
    0xce, 0x3d, 0x04, 0x03, 0x02, 0x03, 0x48, 0x00, 0x30, 0x45, 0x02, 0x21, 0x00, 0xa9, 0xb2, 0x80,
    0xf3, 0xfb, 0xa5, 0x40, 0x74, 0xbd, 0x38, 0x05, 0x6c, 0x6c, 0x79, 0x97, 0x4b, 0x10, 0xd9, 0x21,
    0xdd, 0x3b, 0xb9, 0x0f, 0xf0, 0x09, 0x71, 0xa8, 0x61, 0x6a, 0x93, 0x0f, 0xd3, 0x02, 0x20, 0x3b,
    0x30, 0x34, 0xd3, 0x46, 0x75, 0x02, 0x48, 0xfc, 0x97, 0xf1, 0xec, 0x2b, 0x92, 0x09, 0x2e, 0x30,
    0xb5, 0x25, 0x33, 0x56, 0xc3, 0x32, 0xd1, 0xc6, 0x3a, 0x92, 0xdd, 0x5d, 0xb2, 0x75, 0x51,
};

#endif /* distributed-sgx-sort/enclave/sim_cert.h */
