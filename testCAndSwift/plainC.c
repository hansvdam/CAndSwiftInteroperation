//
//  impl.c
//  testCAndSwift
//
//  Created by Hans van Dam on 21/09/2017.
//  Copyright © 2017 damsoft. All rights reserved.
//

#include "plainC.h"

StructDefinedInPlainCHeader cell = {.someArrayField = {14,15}, .someCharField = 15 };

StructDefinedInPlainCHeader bla() {
    return cell;
}

void edit() {
    cell.someArrayField[0] = 5;
}

MethodsToBeCalledBackFromPlainC *localCallbacks;
void *localCallbackTarget;



void vterm_screen_set_callbacks(const MethodsToBeCalledBackFromPlainC *callbacks, void *user)
{
    localCallbacks = callbacks;
    localCallbackTarget = user;
}

void receiveAndRetransmitData(StructDefinedInPlainCHeader *structArray, int  arrayLength) {

}


