#import <Cocoa/Cocoa.h>
#import <Foundation/Foundation.h>
#import "impl.h"

@interface TKTerminalScreen : NSObject

- (int)pushScrollbackLine:(VTermScreenCell*)cells cols:(int)cols;
- (int)popScrollbackLine:(VTermScreenCell*)cells cols:(int)cols;

@end
