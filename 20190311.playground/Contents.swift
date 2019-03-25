//[ 과제 ]

//    - 이름과 나이를 입력 받아 자신을 소개하는 글을 출력하는 함수

func print1(name: String , age: Int) {
    print("\(name),\(age)")
}
print1(name: "전혜지", age: 10)

//       - 정수를 하나 입력받아 2의 배수 여부를 반환하는 함수
func evenNum(a: Int) -> Bool {
    
    return(a % 2 == 0)
    
    
}

print(evenNum(a: 10))

//            - 정수를 두 개 입력 받아 곱한 결과를 반환하는 함수 (파라미터 하나의 기본 값은 10)

func multiplication(a: Int, b : Int = 10) -> Int {
    return a * b
}
print(multiplication(a: 10))

//                - 4과목의 시험 점수를 입력받아 평균 점수를 반환하는 함수
func average(a: Int, b: Int, c: Int, d: Int) -> Int {
    return ((a + b + c + d)/4)
}
print(average(a: 50, b: 60, c: 70, d: 90))

//- 점수(문자 또는 숫자)를 입력받아 학점을 반환하는 함수 만들기 (90점 이상 A, 80점 이상 B, 70점 이상 C, 그 이하 F)
//9점...
func average2(number : Int ) -> String {
    if (number >= 90){
        return "A"
    }else if (number >= 80){
        return "B"
    }else if (number >= 70){
        return "C"
    }else {
        return "F"
    }
    
}
print(average2(number: 90))

//- 점수(문자 또는 숫자)를 여러 개 입력받아 평균 점수에 대한 학점을 반환하는 함수 만들기 (90점 이상 A, 80점 이상 B, 70점 이상 C, 그 이하 F)
// 10점...어려워요...

func average3(num : Int...) -> String {
    var sum = num.count
    for i in num {
        sum += i
    }
    let average3 = sum / num.count
    if (average3 >= 90){
        return "A"
    }else if (average3 >= 80){
        return "B"
    }else if (average3 >= 70){
        return "C"
    }else {
        return "F"
    }
    
}
print(average3(num: 70,80))
