/* SPDX-License-Identifier: MPL-2.0 */
/* Copyright (c) 2024, Pribess (Heewon Cho).
 * Licensed under the MPL-2.0 License.
 * You may not use this file except in compliance with the License.
 */

#include <common/x86/serial.h>

void serial_init() {
    #define PORT 0x3f8          // COM1

	outb(PORT + 1, 0x00);
	outb(PORT + 3, 0x80);
	outb(PORT + 0, 0x03);
	outb(PORT + 1, 0x00);
	outb(PORT + 3, 0x03);
}