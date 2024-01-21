/* SPDX-License-Identifier: MPL-2.0 */
/* Copyright (c) 2023, Pribess (Heewon Cho).
 * Licensed under the MPL-2.0 License.
 * You may not use this file except in compliance with the License.
 */

#include <usft/essentials.h>

#include <usft/nolibc/string.h>

#include <kvm/lxboot.h>

void copy_boot_params() {
    memcpy(&boot_params.hdr, &hdr, sizeof(struct lxboot_setup_header));
}

void setup() {

    copy_boot_params();

    char a = (char)((boot_params.hdr.boot_flag & 0xFF00) >> 8) - 0x87;
    asm(
        "mov ah, 0x0E;"
        "mov al, %0;"
        "int 0x10;"
        :
        : "r" (a)
    );
    asm(
        "mov ah, 0x0E;"
        "mov al, 'H';"
        "int 0x10;"
    );
    asm(
        "mov ah, 0x0E;"
        "mov al, 'H';"
        "int 0x10;"
    );
   return;
}