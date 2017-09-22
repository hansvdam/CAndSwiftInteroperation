#import <Cocoa/Cocoa.h>
#import <Foundation/Foundation.h>
#import "plainC.h"

@interface MyObjectiveCObject : NSObject

// 'TtOo' stands for 'To', but otherwise wh get all this 'intelligent' preposition interprestation by the swift-compiler :/
- (int)passDataTtOoPlainC:(StructDefinedInPlainCHeader *)structArray arrayLenght:(int)length;

- (int)theCallBack:(StructDefinedInPlainCHeader *)structArray modify:(bool)modify arrayLenght:(int)length;

- (void)printStructContents:(StructDefinedInPlainCHeader) structDefinedInPlainCHeader;

@end
