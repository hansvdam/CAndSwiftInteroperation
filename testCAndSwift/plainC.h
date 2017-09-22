//
//  impl.h
//  testCAndSwift
//
//  Created by Hans van Dam on 21/09/2017.
//  Copyright © 2017 damsoft. All rights reserved.
//

#ifndef impl_h
#define impl_h

#include <stdio.h>
#include <stdint.h>

#endif /* impl_h */

typedef struct {
    uint32_t someArrayField[2];
    char     someCharField;
} StructDefinedInPlainCHeader;

typedef struct {
    int (*callback)(int cols, StructDefinedInPlainCHeader *cells, void *user);
} MethodsToBeCalledBackFromPlainC;

void  vterm_screen_set_callbacks(const MethodsToBeCalledBackFromPlainC *callbacks, void *user);

void receiveDataInPlainC(StructDefinedInPlainCHeader *structArray, int arrayLength);

StructDefinedInPlainCHeader bla(void);

void edit(void);

