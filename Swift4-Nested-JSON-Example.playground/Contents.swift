//: Swift 4 Decoder Fanciness

import UIKit
import Foundation

/*
 Welcome to a very largely, nested JSON example utilizing Swift 4
 Codable class. This example should demonostrate one way to go about decoded nested JSON responses into your native Swift
 structs/classes for easy access and manipulation
*/


//-- Step 1: Make Swift data structure --//
//-- FIRST OBJECT --//
struct FirstRootObj: Codable {
    let FirstObj: FirstObjNested
}

struct FirstObjNested: Codable {
    let firstSubObj: FirstObjNestedSub
    let secondSubObj: FirstObjNestedSub
    let thirdSubObj: FirstObjNestedSub
    let fourthSubObj: FirstObjNestedSub
    let fifthSubObj: FirstObjNestedSub
    let sixthSubObj: FirstObjNestedSub
}

struct FirstObjNestedSub: Codable {
    let val1: String
    let val2: String
    let val3: [Float]
}

//-- SECOND OBJECT --//
struct SecondRootObj: Codable {
    let SecondObj: BigValObj
}

struct BigValObj: Codable {
    let bigVal: BigSubVal
}

struct BigSubVal: Codable {
    let bigSubVal: BigSubValObj
}

struct BigSubValObj: Codable {
    let bigSubValObj: BigSubValObjContent
    let bigSubPropObj: BigSubPropObjContent
}

struct BigSubValObjContent: Codable {
    let miniVal: String
    let miniValObj: MiniValObjContent
}

struct BigSubPropObjContent: Codable {
    let propName: String
    let bigSubPropObjItems: BigSubPropObjItems
}

struct BigSubPropObjItems: Codable {
    let propItem1: PropItem
    let propItem2: PropItem
    let propItem3: PropItem
    let propItem4: PropItem
    let propItem5: PropItem
    let propItem6: PropItem
    let propItem7: PropItem
}

struct PropItem: Codable {
    let propItemObj: PropItemObjValue
    let propNum: String
}

struct PropItemObjValue: Codable {
    let tinyPropValue1: String
    let tinyPropValue2: String
    let tinyPropValue3: String
    let tinyPropValue4: String
}

struct MiniValObjContent: Codable {
    let tinyValObj1: TinyValObjContent
    let tinyValObj2: TinyValObjContent
}

struct TinyValObjContent: Codable {
    let tinyContentObj: TinyData
    let tinyVal2: String
}

struct TinyData: Codable {
    let tinyOne: String
    let tinyTwo: String
    let tinyThree: String
    let tinyFour: String
}

//-- THIRD OBJECT --//
struct ThirdRootObj: Codable {
    let ThirdObj: ThirdObjNested
}

struct ThirdObjNested: Codable {
    let greetingObj1: GreetingObj
    let greetingObj2: GreetingObj
    let greetingObj3: GreetingObj
    let greetingObj4: GreetingObj
    let greetingObj5: GreetingObj
    let greetingObj6: GreetingObj
}

struct GreetingObj: Codable {
    let hi: String
    let bye: String
    let name: String
}

// Step 2: Create a Decoder //
let jsonURL = Bundle.main.url(forResource: "decoder", withExtension: "json")
let jsonData = try? Data(contentsOf: jsonURL!)
let jsonDecoder = JSONDecoder()


// Step 3: D E C O D E //
let firstRootObjDecoded = try! jsonDecoder.decode(FirstRootObj.self, from: jsonData!)

let secondRootObjDecoded = try! jsonDecoder.decode(SecondRootObj.self, from: jsonData!)

let thirdRootObjDecoded = try! jsonDecoder.decode(ThirdRootObj.self, from: jsonData!)

// Step 4: See The Results :) //
print(firstRootObjDecoded.FirstObj)
print("==========================================================")
print(secondRootObjDecoded.SecondObj)
print("==========================================================")
print(thirdRootObjDecoded.ThirdObj)
