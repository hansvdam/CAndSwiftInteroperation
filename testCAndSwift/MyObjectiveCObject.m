#import "MyObjectiveCObject.h"

static inline MyObjectiveCObject *obj(void *user_data) {
    return (__bridge MyObjectiveCObject*)user_data;
}

static int term_sb_pushline(int cols, const StructDefinedInPlainCHeader *cells, void *user_data) {
	return [obj(user_data) pushScrollbackLine:(StructDefinedInPlainCHeader*)cells cols:cols];
}

static int term_sb_popline(int cols, StructDefinedInPlainCHeader *cells, void *user_data) {
	return [obj(user_data) passDataTtOoPlainC:(StructDefinedInPlainCHeader *) cells arrayLenght:cols];
}

static MethodsToBeCalledBackFromPlainC screen_callbacks = {
	.sb_pushline = term_sb_pushline,
	.sb_popline  = term_sb_popline,
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
    receiveAndRetransmitData(structArray, length);
    return 1;
}

@end
