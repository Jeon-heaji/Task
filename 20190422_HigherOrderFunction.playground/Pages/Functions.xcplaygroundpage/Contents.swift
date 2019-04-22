//: [Previous](@previous)
/*:
 ---
 ## forEach
 - 컬렉션의 각 요소(Element)에 동일 연산을 적용하며, 반환값이 없는 형태
 ---
 */


print("\n---------- [ forEach ] ----------\n")

let immutableArray = [1, 2, 3, 4]

for num in immutableArray {
  print(num, terminator: " ")
}
print()


immutableArray.forEach { num in
  print(num, terminator: " ")
}
print()


immutableArray.forEach {
  print($0, terminator: " ")
}
print()


func printParam(_ num: Int) {
  print(num, terminator: " ")
}
immutableArray.forEach(printParam(_:))      //이미 있는 함수를 건내줄수있다.
print()


/*:
 ---
 ### Question
 - forEach 와 for 문의 차이점은?
 - 1~10 까지의 숫자 중 짝수만 출력하다가 9가 되면 종료되도록 forEach를 이용해 구현해본 뒤 for 와 비교하여 설명
 ---
 */
let num = 1...10
for i in num {
    if i % 2 == 0 {
        if i > 9 {
            break
        }
        print(i, terminator: " ")
    }
}

print()

num.forEach { num in
    if num < 9 {
        if num % 2 == 0 {
            print(num, terminator: " ")
        }
    }
}

print()

num.forEach {
    print($0, terminator: " ")
}


/*:
 ---
 ## map
 - 컬렉션의 각 요소(Element)에 동일 연산을 적용하여, 변형된 새 컬렉션 반환
 ---
 */

print("\n---------- [ Map ] ----------\n")

let names = ["Chris", "Alex", "Bob", "Barry"]
names
  .map { $0 + "'s name" }       // let newNames = name.map { $0 + "'s name" }  print(newNames)
  .forEach { print($0) }                // 새로운 값으로

let intArr = Array<Int>(repeating: 2, count: 10)
let indexPlusElement = intArr.enumerated().map {            // enumerated (인덱스,valu)e
  return $0 + $1                                            // 0은 인덱스 , 1은 value  클로져 -> return 생략가능
}
print(indexPlusElement)



/*:
 ---
 ## filter
 - 컬렉션의 각 요소를 평가하여 조건을 만족하는 요소만을 새로운 컬렉션으로 반환
 ---
 */
print("\n---------- [ filter ] ----------\n")

// let names = ["Chris", "Alex", "Bob", "Barry"]

let containBNames = names
  .filter { (name) -> Bool in           // 조건을 만족하면 true, 만족하지 않으면 false
    return name.contains("B")
  }
print(containBNames)

names.filter {$0.contains("B")}

let countAlexNames = names
  .filter { $0 == "Alex" }
  .count
print(countAlexNames)


/*:
 ---
 ## reduce
 - 컬렉션의 각 요소들을 결합하여 단 하나의 타입을 지닌 값으로 반환.   e.g. Int, String 타입
 ---
 */
print("\n---------- [ reduce ] ----------\n")

/***************************************************
 (1...100)
   .reduce(<#T##initialResult: Result##Result#>, <#T##nextPartialResult: (Result, Int) throws -> Result##(Result, Int) throws -> Result#>)
 initialResult - 초기값                    // Result에는 내가 초기값
 nextPartialResult - (이전 요소까지의 결과값, 컬렉션이 지닌 현재 요소)
 ***************************************************/

let sum1to100 = (1...100)
  .reduce(0) { (sum: Int, next: Int) in     // sum은 0부터 시작
    return sum + next
    // 0 + 1 = 1 ,1이 리턴 되서 다시 sum에 반영되서
    // 1 + 2 = 3 , 3이 리턴되서 다시 sum에 반영..         앞에있는것은 초기값부터 시작해서 연산해서 담기는 값
  }
print(sum1to100)

//직접 더하는 형태 X
//(1...100).reduce(0) { (sum, next) in
//  sum += next
//}
// into: Result
let sum1 = (1...100).reduce(0) { $0 + $1 }      // 이렇게 변수에 담아서 사용 가능 바로 print찍어도 되고 더 줄일수도있다는데..

(1...100)
    .reduce(0) { $0 + $1 }

//var sum = 0
//for i in 1...100 {
//    sum += i
//}
//print(sum)


/*:
 ---
 ### Question
 - 문자열 배열을 reduce를 이용해 하나의 문자열로 합치기
 - 숫자 배열을 reduce를 이용해 하나의 문자열로 합치기
 ---
 */
// 아래 둘 모두 reduce를 이용해 "123" 이라는 문자열이 되도록 만들기
let arr = ["1", "2", "3"]

arr.reduce("") { (num1: String, num2: String) in
    return num1 + num2
}

let arr1 = [1, 2, 3]

arr1.reduce("") { (num3: String, num4: Int) in
    return num3 + String(num4)
}





/*:
 ---
 ## compactMap
 - 컬렉션의 요소 중 옵셔널이 있을 경우 제거
 ---
 */
print("\n---------- [ compactMap ] ----------\n")

let optionalStringArr = ["A", nil, "B", nil, "C"]
print(optionalStringArr.compactMap { $0 })



let numbers = [-2, -1, 0, 1, 2]
let positiveNumbers = numbers.compactMap { $0 >= 0 ? $0 : nil }     // 양수면 그대로 출력, nil이면 X
print(positiveNumbers)



/*:
 ---
 ## flatMap
 - 중첩된 컬렉션을 하나의 컬렉션으로 병합
 ---
 */
print("\n---------- [ flatMap ] ----------\n")

let nestedArr = [[1, 2, 3], [1, 5, 99], [1, 1]]
print(nestedArr)
print(nestedArr.flatMap { $0 })     // 하나의 배열로 병합


let nestedArr2 = [[[1,2,3], [4,5,6], [7, 8, 9]], [[10, 11, 12], [13, 14]]]
print(nestedArr2)
let flattenNumbers1 = nestedArr2.flatMap { $0 }     // [[]] 두개로줄었고
print(flattenNumbers1)

let flattenNumbers2 = flattenNumbers1.flatMap { $0 }        // 그 걸 다시 flaMap해주면 [] 한개로 병합됨
print(flattenNumbers2)

//let nestedDic = [[[1:1]]]     // 딕셔너리로 해보기

/*:
 ---
 ### Question
 - 아래의 배열을 compactMap, flatMap을 쓰지 않고 그와 동일한 결과가 나오도록 구현
 ---
 */
// compactMap
// let numbers = [-2, -1, 0, 1, 2]
// [0,1,2]
var tempArr: [Int] = []
for i in numbers {
    if i >= 0 {
        tempArr.append(i)
    }
    print(tempArr)
}


let removeNil1 = numbers
    .map { $0 >= 0 ? $0 : nil }
    .filter{ $0 != nil }
    .map { $0!}
print(removeNil1)

//numbers.forEach { $0 }

// flatMap
//let nestedArr = [[1, 2, 3], [1, 5, 99], [1, 1]]   // [[Int]]
//print(nestedArr.flatMap { $0 })       // [1,2,3,1,5,99,1,1]





nestedArr







/*:
 ---
 ### Answer
 ---
 */

print("\n---------- [ A. for vs forEach ] ----------\n")

/***************************************************
 for문은 반복문이므로 break, continue 키워드 사용
 forEach문은 함수(클로져)이므로 break, continue 대신 return 키워드 사용
 ***************************************************/

for i in 1...10 {
  guard i != 9 else { break }
  guard i % 2 == 0 else { continue }
  print(i, terminator: " ")
}
print()

(1...10).forEach {
  guard $0 < 9 else { return }
  guard $0 % 2 == 0 else { return }
  print($0, terminator: " ")
}
print()


print("\n---------- [ A. reduce ] ----------\n")

let merge1 = ["1", "2", "3"].reduce("") { $0 + $1 }
print(merge1)

let merge2 = [1, 2, 3].reduce("") { $0 + String($1) }
print(merge2)

//위 내용을 Full Syntax 로 표현했을 때
//[1, 2, 3]
//  .reduce("") { (str: String, num: Int) in
//    return str + String(num)
//  }






/***************************************************
 compactMap, flatMap 을 쓰지 않고 그와 동일한 동작 구현
 (아래 코드는 실제 swift 내부 구현 방식)
 ***************************************************/
print("\n---------- [ A. compactMap ] ----------\n")

let removeNil = numbers
  .map { $0 >= 0 ? $0 : nil }
  .filter { $0 != nil }
  .map { $0! }
print(removeNil)


print("\n---------- [ A. flatMap ] ----------\n")

nestedArr
  .map { $0 }
  .reduce([], +)

// 실제 swift 내부 구현 코드는 joined 함수를 이용
let flattenArr = nestedArr
  .map { $0 }
  .joined()
print(Array(flattenArr))



//: [Next](@next)
