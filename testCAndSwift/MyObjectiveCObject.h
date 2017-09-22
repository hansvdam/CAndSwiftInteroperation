#import <Cocoa/Cocoa.h>
#import <Foundation/Foundation.h>
#import "plainC.h"

@interface MyObjectiveCObject : NSObject

- (int)pushScrollbackLine:(StructDefinedInPlainCHeader*)cells cols:(int)cols;
// 'TtOo' stands for 'To', but otherwise wh get all this 'intelligent' preposition interprestation by the swift-compiler :/
- (int)passDataTtOoPlainC:(StructDefinedInPlainCHeader *)structArray arrayLenght:(int)length;

@end
