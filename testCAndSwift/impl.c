//
//  impl.c
//  testCAndSwift
//
//  Created by Hans van Dam on 21/09/2017.
//  Copyright © 2017 damsoft. All rights reserved.
//

#include "impl.h"

VTermScreenCell cell = {.chars = {14,15}, .width = 15 };

VTermScreenCell bla() {
    return cell;
}

void edit() {
    cell.chars[0] = 5;
}

