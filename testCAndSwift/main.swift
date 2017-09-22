//
//  main.swift
//  testCAndSwift
//
//  Created by Hans van Dam on 21/09/2017.
//  Copyright © 2017 damsoft. All rights reserved.
//

import Foundation
import Cocoa

print("Hello, World!")

// direct calls from Swift to plain C:
var v = bla();
print("v.chars[0]=" + String(v.someArrayField.0))
var localChars = v.someArrayField
var localV = v
edit()
var b = bla()
print("b.chars[0]=" + String(b.someArrayField.0))
print("localChars[0]=" + String(localChars.0))
print("localVChars=" + String(localV.someArrayField.0))

//calls via Objective C:
var objCObject = MyObjectiveCObject()

var cells = StructDefinedInPlainCHeader(someArrayField: (UInt32(5),UInt32(6)), someCharField: 2)
objCObject.popScrollbackLine(&cells, cols: 2)

