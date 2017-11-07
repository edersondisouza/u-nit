/*
 * Copyright (C) 2017 Intel Corporation
 * SPDX-License-Identifier: MIT
 */
#ifndef MOUNT_HEADER_
#define MOUNT_HEADER_

#include <stdbool.h>

bool mount_mount_filesystems(void);
void mount_umount_filesystems(void);

#endif
