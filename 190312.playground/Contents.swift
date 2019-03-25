// 190312 과제
//- 두 개의 자연수를 입력받아 두 수를 하나의 숫자로 이어서 합친 결과를 정수로 반환하는 함수

func number(num1:Int, num2:Int) -> Int {
    let sum = String(num1) + String(num2)
    return Int(sum)!
}
number(num1: 10, num2: 10)
//(1과 5 입력 시 15,  29와 30 입력 시 2930,  6과 100 입력 시 6100)/


//    - 문자열 두 개를 입력받아 두 문자열이 같은지 여부를 판단해주는 함수
func str(str1:String, str2:String) -> Bool {
    if str1 == str2 {
        return true
    }else {
        return false
    }
}
str(str1: "하나", str2: "하나")
str(str1: "하나", str2: "둘")

//        - 자연수를 입력받아 그 수의 약수를 모두 출력하는 함수

func measure(_ number1:Int) {
    
    for i in 1...number1 {
        if number1 % i == 0 {
            print(i)
        }
    }
}
measure(10)
//        - 2 이상의 자연수를 입력받아, 소수인지 아닌지를 판별하는 함수

func sosu(_ num3:Int) -> Bool {
    guard num3 > 1 else { return false }
    guard num3 != 2 else { return true }
    for i in 2..<num3 {
        if num3 % i == 0 {
           return false
        }
    }
        return true
}
sosu(3)



//- 자연수 하나를 입력받아 피보나치 수열 중에서 입력받은 수에 해당하는 자리의 숫자를 반환하는 함수
//참고로 피보나치 수열은 이전 두 수의 합이 다음 수가 되는 수열
func fibonacciNum(_ index:Int) ->Int {
    var op1 = 0
    var op2 = 1
    
    for i in 0..<index {
        if i % 2 == 0 {
            op1 += op2
        }else {
            op2 += op1
        }
       }
    return index % 2 == 0 ? op1 : op2
}
fibonacciNum(6)



//- 100 이하의 자연수 중 3과 5의 공배수를 모두 출력하는 함수

func printNumber() {
    var answer = [Int]()
    for i in 1...100 {
        if i % 3 == 0 && i % 5 == 0 {
            answer.append(i)
        }
    }
    print(answer)
}
printNumber()


