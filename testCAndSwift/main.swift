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

private func passStuffBackAndForth(theObject: MyObjectiveCObject) {
    var someCStructInstance = StructDefinedInPlainCHeader(someArrayField: (UInt32(3),UInt32(4)), someCharField: 5)
    var someCStructInstance2 = StructDefinedInPlainCHeader(someArrayField: (UInt32(7),UInt32(8)), someCharField: 9)
    var cArray: UnsafeMutablePointer<StructDefinedInPlainCHeader> = UnsafeMutablePointer<StructDefinedInPlainCHeader>.allocate(capacity: 2)
    var cArray2: UnsafeMutableBufferPointer<StructDefinedInPlainCHeader> = UnsafeMutableBufferPointer<StructDefinedInPlainCHeader>(start:cArray, count: 2)
    let swiftArray: [StructDefinedInPlainCHeader] = [someCStructInstance, someCStructInstance2]
    cArray2.initialize(from: swiftArray)
    theObject.passDataTtOoPlainC(cArray, arrayLenght: 2)

//
    print("now we chagen the data in someCStructInstance en then trigger the callback")

    triggerCallback(false)
    print("now pass the array in again:")
    theObject.passDataTtOoPlainC(cArray, arrayLenght: 2)
    theObject.printStructContents(someCStructInstance)

    print("now set the value in the array stored in the c-part of the program and trigger a callback:")
    setStoredArrayElement(0, 0, 44)
    triggerCallback(false)
    print("has the value in the original swift array also changed?: (no)") // all values were deep-copied on initing the c_array
    theObject.printStructContents(swiftArray[0])
    print("has the value in the original C-array array also changed?: (yes)") // only the pointer has been passed
    theObject.printStructContents(cArray[0])
    print("And the originating struct?: (no)")
    theObject.printStructContents(someCStructInstance)

    print("Now, in the callback in Objective C we modify the array stored in C after displaying the value. Then we trigger modification again")
    triggerCallback(true)
    triggerCallback(false)
}

print("*************** first with objective C:")
passStuffBackAndForth(theObject: MyObjectiveCObject())
print("*************** then with SWIFT:")
let mySwiftObject = MySwiftObject()
passStuffBackAndForth(theObject: mySwiftObject)
print("bla: " + String(mySwiftObject.newScrollbackBuffer[0].someArrayField.0))



