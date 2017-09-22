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

var someCStructInstance = StructDefinedInPlainCHeader(someArrayField: (UInt32(3),UInt32(4)), someCharField: 5)
var someCStructInstance2 = StructDefinedInPlainCHeader(someArrayField: (UInt32(7),UInt32(8)), someCharField: 9)
var cArray: UnsafeMutablePointer<StructDefinedInPlainCHeader> = UnsafeMutablePointer<StructDefinedInPlainCHeader>.allocate(capacity: 2)
var cArray2: UnsafeMutableBufferPointer<StructDefinedInPlainCHeader> = UnsafeMutableBufferPointer<StructDefinedInPlainCHeader>(start:cArray, count: 2)
cArray2.initialize(from: [someCStructInstance,someCStructInstance2])
objCObject.passDataTtOoPlainC(cArray, arrayLenght: 2)

