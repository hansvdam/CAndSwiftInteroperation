#import "TKTerminalScreen.h"

static inline TKTerminalScreen *obj(void *user_data) {
    return (__bridge TKTerminalScreen*)user_data;
}

static int term_sb_pushline(int cols, const VTermScreenCell *cells, void *user_data) {
	return [obj(user_data) pushScrollbackLine:(VTermScreenCell*)cells cols:cols];
}

static int term_sb_popline(int cols, VTermScreenCell *cells, void *user_data) {
	return [obj(user_data) popScrollbackLine:(VTermScreenCell*)cells cols:cols];
}

static VTermScreenCallbacks screen_callbacks = {
	.sb_pushline = term_sb_pushline,
	.sb_popline  = term_sb_popline,
};

@implementation TKTerminalScreen

- (int) pushScrollbackLine:(VTermScreenCell*)cells cols:(int)cols {
	return 1;
}

- (int) popScrollbackLine:(VTermScreenCell*)cells cols:(int)cols {
	return 1;
}

@end
