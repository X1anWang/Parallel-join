#ifndef __FOAV_H__
#define __FOAV_H__

// -DFOAV_ENABLE=0 to disable, -DFOAV_ENABLE=1 (or just -DFOAV_ENAVLE) to enable
#ifndef FOAV_ENABLE
// Defaults to enable
#define FOAV_ENABLE 1
#endif

#if FOAV_ENABLE == 0
#define FOAV_SAFE(var)
#define FOAV_SAFE2(var1,var2)
#define FOAV_SAFE_CNTXT(context, var)
#define FOAV_SAFE2_CNTXT(context,var1,var2)
#else
#define FOAV_SAFE(var) __asm__ ("# FOAV " #var " (%0)"::"X"(var):);
#define FOAV_SAFE2(var1,var2) __asm__ ("# FOAV " #var1 " (%0)\n\t# FOAV " #var2 " (%1)"::"X"(var1),"X"(var2):);
#define FOAV_SAFE_CNTXT(context, var) __asm__ ("# FOAV " #context " " #var " (%0)"::"X"(var):);
#define FOAV_SAFE2_CNTXT(context,var1,var2) __asm__ ("# FOAV " #context " " #var1 " (%0)\n\t# FOAV " #context " " #var2 " (%1)"::"X"(var1),"X"(var2):);
#endif

#endif
