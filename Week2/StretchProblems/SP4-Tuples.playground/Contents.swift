//: Playground - noun: a place where people can play

import UIKit

/*
Tuples

1. We want to check the odds that an individual was fishing on certain days of the week. create three arrays. One with Strings of names, one with the days of the week as Int, and another with Bools as odds. Ex: twoToOne = [true, false, false]
2. Then create a function with NO parameters that RETURNS three values -> name: String, day: Int, goneFishing: Bool.
3. In the function Create 3 random number variables that can be anything between 0 and each arrays length.
4. use each random number variable to return a random value in each array.
5. create a variable that holds what your function returns.
6. print out the returned values

Black Diamond

1. Repeat the above instead of creating 3 random number variables, find a way to store 3 random numbers between 0 and each array's length in only 1 variable.

2. Create a new project. This will be a singleView app with 3 buttons. One will say **Rock**, one will say **Paper**, one will say **Scissors**. When the user taps on the button, you will randomly determine what the computer plays, and announce to the user whether the user wins, loses, or ties. Find a way to incorporate Tuples into how you store your variables.

*/

let names = ["Kaleo", "Parker", "Daniel", "Ann"]

let daysOfTheWeek = [1, 2, 3, 4, 5, 6, 7]

let odds = [true, false, false]

func whoWentFishing() -> (name: String, day: Int, goneFishing: Bool) {
    
    let randomNum1 = Int(arc4random_uniform(UInt32(names.count)))
    let randomNum2 = Int(arc4random_uniform(UInt32(daysOfTheWeek.count)))
    let randomNum3 = Int(arc4random_uniform(UInt32(odds.count)))
    
    let randomName = names[randomNum1]
    let randomDay = daysOfTheWeek[randomNum2]
    let randomOdd = odds[randomNum3]
    
    return (randomName, randomDay, randomOdd)
    
}

whoWentFishing()
whoWentFishing().name


