import UIKit


var playgroundString = "Hello, playground"
let playgroundConstantString = "Can not change"

print(playgroundString)

var someNumber:Int = 1
let someDouble = 2.2



let name = "Mike"

let stringArray = [name, "John", "Sarah", "Sara"]

for currentString in stringArray {
    print(currentString)
}


// principle, interest, interestRate
// p * R = interest
// p = i/R

var principle:Double

let interest = 200.00

let interestRate = 0.08

principle = (interest / interestRate) * 12

for i in 1...10 {
    principle = principle * 1.04
}


