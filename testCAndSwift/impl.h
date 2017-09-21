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

#endif /* impl_h */

typedef struct {
#define VTERM_MAX_CHARS_PER_CELL 6
    uint32_t chars[VTERM_MAX_CHARS_PER_CELL];
    char     width;
} VTermScreenCell;


VTermScreenCell bla(void);

void edit(void);

