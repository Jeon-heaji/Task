//: [Previous](@previous)
import Foundation
/*:
 ---
 ## Practice 1
 ---
 */

print("\n---------- [ Practice 1 ] ----------\n")

struct Pet {
    enum PetType {
        case dog, cat, snake, pig, bird
    }
    var type: PetType
    var age: Int
}

let myPet = [
    Pet(type: .dog, age: 13),
    Pet(type: .dog, age: 2),
    Pet(type: .dog, age: 7),
    Pet(type: .cat, age: 9),
    Pet(type: .snake, age: 4),
    Pet(type: .pig, age: 5),
]

// 1번

func sumDogAge(pets: [Pet]) -> Int {
    var count = 0
    for i in pets {
        if i.type == .dog {
            count += i.age
        }
        print(i)
    }
    return count
}
sumDogAge(pets: myPet)

// Higher-order Function

func sumDogAge1(pets: [Pet]) -> Int {
    return pets
        .filter { $0.type == .dog }
        .reduce(0) {$0 + $1.age}
}
sumDogAge1(pets: myPet)

// 2번
func oneYearOlder(of pets: [Pet]) -> [Pet] {
    var petArr = [Pet]()
    for pet in pets {
        let temp = Pet(type: pet.type, age: pet.age + 1)
        petArr.append(temp)
    }
    return petArr
}
oneYearOlder(of: myPet)

// Higher-order Function

func oneYearOlder1(of pets: [Pet]) -> [Pet] {
    return pets.map { Pet(type: $0.type, age: $0.age + 1)
    }
}
oneYearOlder1(of: myPet)
/*:
 ---
 ## Practice 2
 ---
 */

print("\n---------- [ Practice 2 ] ----------\n")
let immutableArray = Array(1...40)
var tempArr: [Int] = []

func immutableArr(arr: [Int]) -> [Int] {
    
    for (idx, value) in arr.enumerated() {
        tempArr += [idx * value]
    }
    return tempArr
}
immutableArr(arr: immutableArray)


var evenArr: [Int] = []
func isEven(arr1: [Int]) -> [Int] {
    
    for i in arr1 {
        if i % 2 == 0 {
            evenArr += [i]
        }
    }
    return evenArr
}
isEven(arr1: tempArr)


var addNum: [Int] = []
func addArr(arr2:[Int]) -> Int {
    var sum = 0
    for i in arr2 {
        sum += i
    }
    
    return sum
}
addArr(arr2: evenArr)


// Higher-order Function
let imu = immutableArray.enumerated()
    .map{ $0 * $1}
    .filter { $0 % 2 == 0}
    .reduce(0) { $0 + $1 }
print(imu)

/*:
 ---
 ## Practice 3
 ---
 */

print("\n---------- [ Practice 3 ] ----------\n")


//Q. map 과 flatMap, compactMap 을 이용하여 다음 결과를 출력해보세요.
let array: [[Int?]] = [[1, 2, 3], [nil, 5], [6, nil], [nil]]
print(array.map{ $0 })

let arr = array.map { $0 }
print(arr)
let arr1 = array.compactMap { $0.compactMap{$0} }
// [optional([1, 2, 3]), optional([nil, 5]), optional([6, nil]), optional([nil])]
print(arr1)

let arr2 = array.flatMap { $0 }
print(arr2)

let arr3 = arr2.compactMap { $0 }
print(arr3)

//: [Next](@next)
