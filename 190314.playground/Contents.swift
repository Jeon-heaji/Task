// 190314 과제
//- 자연수를 입력받아 원래 숫자를 반대 순서로 뒤집은 숫자를 반환하는 함수
//ex) 123 -> 321 , 10293 -> 39201
//
func reverseNum(num:Int) -> Int {
    var str = String(num)
    var temp: String = ""
    
    for x in str.reversed() {
        temp += String(x)
    }
    
    var out = 0
    if let x = Int(temp) {
        out = x
    }
    return out
}
reverseNum(num: 123)

//- 주어진 문자 배열에서 중복되지 않는 문자만을 뽑아내 배열로 반환해주는 함수
//ex) ["a", "b", "c", "a", "e", "d", "c"]  ->  ["b", "e" ,"d"]
//
let arr1 = ["a", "b", "c", "a", "e", "d", "c", "e"]

func aaa(chrArr: [String]) -> [String] {
    var dic1: [String: Int] = ["a": 2, "b": 1, "c": 2, "e": 1, "d": 1]
    
    for i in chrArr {
        if let x = dic1[i] {
            dic1[i] = 1 + x
        } else {
            dic1[i] = 1
        }
    }
    
    // ["a": 2, "b": 1, "c": 2, "e": 1, "d": 1]
    var temp: [String] = []
    for (key, value) in dic1 {
        if value == 1 {
            temp.append(key)
        }
    }
    
    return temp
}


aaa(chrArr: arr1)




//- 임의의 정수 배열을 입력받았을 때 홀수는 배열의 앞부분, 짝수는 배열의 뒷부분에 위치하도록 구성된 새로운 배열을 반환하는 함수
//ex) [2, 8, 7, 1, 4, 3] -> [7, 1, 3, 2, 8, 4]
let arr = [2, 8, 7, 1, 4, 3]

func number(a: [Int]) -> [Int] {
    var temp: [Int] = []
    
    for i in a {
        if i % 2 == 0 {
            temp.append(i)
        }else {
            temp.insert(i, at: 0)
        }
    }
    return temp
}

print(number(a: arr))

//
//- 2개의 자연수와 사칙연산(+, -, *, /)을 가진 enum 타입 Arithmetic 을 입력 파라미터로 받아 해당 연산의 결과를 반환하는 함수 구현
enum Arithmetic {
    case addition, subtraction, multiplication, division
}

func calculator(operand1: Int, operand2: Int, op: Arithmetic) -> Int {
    
    switch op {
    case .addition:
        return operand1 + operand2
    case .division:
        return operand1 / operand2
    case .multiplication:
        return operand1 * operand2
    case .subtraction:
        return operand1 - operand2
    }
    
}
calculator(operand1: 10, operand2: 10, op: .addition)
calculator(operand1: 10, operand2: 5, op: .division)


//- 별도로 전달한 식육목 모식도 라는 자료를 보고 Dictionary 자료형에 맞도록 중첩형태로 데이터를 저장하고
//    + 해당 변수에서 표범 하위 분류를 찾아 사자와 호랑이를 출력하기

let list = [
    "식육목": [
        "개과" : [
            "개" : ["자칼", "늑대", "북미산이리"],
            "여우": ["아메리카여우", "유럽여우"]
        ],
        "고양이과": [
            "고양이" : ["고양이", "살쾡이"],
            "표범" : ["사자", "호랑이"]
        ]
    ]
    
]
if let a = list["식육목"] {
    if let b = a["고양이과"] {
        if let c = b["표범"]{
            for i in c {
                print(i)
            }
        }
    }
}





//let list1 = ["식육목": ["개과" : ["개" : ["자칼", "늑대", "북미산이리"],"여우": ["아메리카여우", "유럽여우"]],"고양이과": ["고양이" : ["고양이", "살쾡이"],"표범" : ["사자", "호랑이"]]]]
//

