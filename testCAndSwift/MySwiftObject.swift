//
//  MySwiftObject.swift
//  testCAndSwift
//
//  Created by Hans van Dam on 22/09/2017.
//  Copyright © 2017 damsoft. All rights reserved.
//

import Foundation

class MySwiftObject: MyObjectiveCObject {
    override func passDataTtOoPlainC(_ structArray: UnsafeMutablePointer<StructDefinedInPlainCHeader>, arrayLenght length: Int32) -> Int32 {
        return super.passDataTtOoPlainC(structArray, arrayLenght: length)
    }

    public var newScrollbackBuffer: [StructDefinedInPlainCHeader] = []

    override func theCallBack(_ structArray: UnsafeMutablePointer<StructDefinedInPlainCHeader>, modify: Bool, arrayLenght length: Int32) -> Int32 {
        for index in 0...Int(length)-1 {
            newScrollbackBuffer.append(structArray[index])
        }
        return super.theCallBack(structArray, modify: modify, arrayLenght: length)
    }


    override func printStructContents(_ structDefinedInPlainCHeader: StructDefinedInPlainCHeader) {
        super.printStructContents(structDefinedInPlainCHeader)
    }
}
