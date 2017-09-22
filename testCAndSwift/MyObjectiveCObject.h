#import <Cocoa/Cocoa.h>
#import <Foundation/Foundation.h>
#import "plainC.h"

@interface MyObjectiveCObject : NSObject

- (int)pushScrollbackLine:(StructDefinedInPlainCHeader*)cells cols:(int)cols;
- (int)popScrollbackLine:(StructDefinedInPlainCHeader*)cells cols:(int)cols;

@end
