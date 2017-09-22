#import "MyObjectiveCObject.h"

static inline MyObjectiveCObject *obj(void *user_data) {
    return (__bridge MyObjectiveCObject*)user_data;
}

static int theCallBack(int length, const StructDefinedInPlainCHeader *structArray, void *user_data) {
	return [obj(user_data) theCallBack:(StructDefinedInPlainCHeader*)structArray arrayLenght:length];
}

static MethodsToBeCalledBackFromPlainC screen_callbacks = {
	.callback  = theCallBack
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
        printf("  struct: {SomeArrayField:[%d,%d], someCharField:%d}\n", structArray[i].someArrayField[0], structArray[i].someArrayField[1], structArray[0].someCharField);
    }
    printf("\n");
    receiveDataInPlainC(structArray, length);
    return 1;
}

- (int)theCallBack:(StructDefinedInPlainCHeader *)structArray arrayLenght:(int)length {
    printf("inside theCallBack (Objective C):\n");
    for (int i=0; i<length; i++) {
        printf("  struct: {SomeArrayField:[%d,%d], someCharField:%d}\n", structArray[i].someArrayField[0], structArray[i].someArrayField[1], structArray[0].someCharField);
    }
    printf("\n");
    return 1;
}

@end
