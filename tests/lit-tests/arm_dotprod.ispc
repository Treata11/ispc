// Test checks emitted code for ARM (aarch32) dot product instructions.

// RUN: %{ispc} %s --arch=arm --target=neon-i32x4 --cpu=cortex-a55 --emit-asm  -o - | FileCheck %s
// RUN: %{ispc} %s --arch=arm --target=neon-i32x8 --cpu=cortex-a55 --emit-asm  -o - | FileCheck %s

// REQUIRES: ARM_ENABLED && LINUX_HOST

// CHECK-LABEL: dot4add_u8u8___
// CHECK: udot

// CHECK-LABEL: dot4add_i8i8___
// CHECK: sdot

void dot4add_u8u8(uniform int a[], uniform int b[], uniform uint dst[]) {
    dst[programIndex] = dot4add_u8u8packed(a[programIndex], b[programIndex], programIndex);
}

void dot4add_i8i8(uniform uint a[], uniform uint b[], uniform int dst[]) {
    dst[programIndex] = dot4add_i8i8packed(a[programIndex], b[programIndex], programIndex);
}