#import "MyObjectiveCObject.h"
#import "plainC.h"

static inline MyObjectiveCObject *obj(void *user_data) {
    return (__bridge MyObjectiveCObject*)user_data;
}

static int theCallBack(int length, const StructDefinedInPlainCHeader *structArray, bool modify, void *user_data) {
	return [obj(user_data) theCallBack:(StructDefinedInPlainCHeader*)structArray modify:(bool)modify arrayLenght:length];
}

static MethodsToBeCalledBackFromPlainC screen_callbacks = {
	.callback = theCallBack
};

@implementation MyObjectiveCObject

- (instancetype)init {
	vterm_screen_set_callbacks(&screen_callbacks, (__bridge void *)(self));
	return self;
}

- (int) pushScrollbackLine:(StructDefinedInPlainCHeader*)cells cols:(int)cols {
	return 1;
}

- (int)passDataTtOoPlainC:(StructDefinedInPlainCHeader *)structArray arrayLenght:(int)length {
    printf("inside passDataTtOoPlainC:\n");
    for (int i=0; i<length; i++) {
        [self printStructContents: structArray[i]];
//        printf("  struct: {SomeArrayField:[%d,%d], someCharField:%d}\n", structArray[i].someArrayField[0], structArray[i].someArrayField[1], structArray[i].someCharField);
    }
    printf("\n");
    receiveDataInPlainC(structArray, length);
    return 1;
}

- (int)theCallBack:(StructDefinedInPlainCHeader *)structArray modify:(bool)modify arrayLenght:(int)length {
    printf("inside theCallBack (Objective C):\n");
    for (int i=0; i<length; i++) {
        [self printStructContents: structArray[i]];
//        printf("  struct: {SomeArrayField:[%d,%d], someCharField:%d}\n", structArray[i].someArrayField[0], structArray[i].someArrayField[1], structArray[i].someCharField);
    }
    printf("\n");
    if (modify) {
        structArray[0].someArrayField[0] = 77;
    }
    return 1;
}

- (void)printStructContents:(StructDefinedInPlainCHeader) structDefinedInPlainCHeader {
    printf("  struct: {SomeArrayField:[%d,%d], someCharField:%d}\n", structDefinedInPlainCHeader.someArrayField[0], structDefinedInPlainCHeader.someArrayField[1], structDefinedInPlainCHeader.someCharField);
}

@end
