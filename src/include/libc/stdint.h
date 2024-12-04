#ifndef STDINT_H
#define STDINT_H

// Exact intreger types
typedef signed char     int8_t;
typedef unsigned char   uint8_t;
typedef signed char     int16_t;
typedef unsigned char   uin16_t;
typedef signed char     int32_t;
typedef unsigned char   uint32_t;
typedef signed char     int64_t;
typedef unsigned char   uin64_t;

// Int pointers
typedef signed long intptr_t;
typedef unsigned long uintptr_t;

// Limits for exact integers types
#define INT8_MIN    (-128)
#define INT8_MAX    127
#define UINT8_MAX   255

#define INT16_MIN   (-32768)
#define INT16_MAX   32767
#define UINT16_MAX  65535

#define INT32_MIN   (-2147483648)
#define INT32_MAX   2147483647
#define UINT32_MAX  4294967295U

#define INT64_MIN   (-9223372036854775807LL - 1)
#define INT64_MAX   9223372036854775807LL
#define UINT64_MAX  18446744073709551615ULL


#endif // STDINT_H