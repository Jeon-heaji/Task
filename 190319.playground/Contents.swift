// 190319 과제

//1. 다음과 같은 속성(Property)과 행위(Method)를 가지는 클래스 만들어보기.
//구현 내용은 자유롭게
//
// ** 강아지 (Dog)
// - 속성: 이름, 나이, 몸무게, 견종
//- 행위: 짖기, 먹기
class Dog {
    var name: String
    var age: Int
    var weight: Double
    var kinds: String
    init(name: String, age: Int, weight: Double, kinds: String) {
        self.name = name
        self.age = age
        self.weight = weight
        self.kinds = kinds
    }
    func howl() {
        print("\(name)가 짖는다")
    }
    func eat() {
        print("\(name)가 먹는다")
    }
}

//** 학생 (Student)
//- 속성: 이름, 나이, 학교명, 학년
//- 행위: 공부하기, 먹기, 잠자기
class Student {
    var name: String
    var age: Int
    var schoolName: String
    var grade: String
    init(name:String, age:Int, schoolName:String, grade:String) {
        self.name = name
        self.age = age
        self.schoolName = schoolName
        self.grade = grade
    }
    func study() {
        print("\(name)은 공부중!")
    }
    func eat() {
        print("\(name)은 먹는중!")
        
    }
    func sleep() {
        print("\(name)은 자는중!")
    }
}

//** 아이폰(IPhone)
//- 속성: 기기명, 가격, faceID 기능 여부(Bool)
//- 행위: 전화 걸기, 문자 전송
//
class Iphone {
    var diviceName: String
    var price: String
    var faceId: Bool
    init(diviceName: String, price: String, faceId: Bool) {
        self.diviceName = diviceName
        self.price = price
        self.faceId = true
    }
    func dialing(){
        print("전화중!")
    }
    func message(){
        print("문자전송!")
    }
}
let iphone = Iphone(diviceName: "iphone8", price: "200만원", faceId: true)
//** 커피(Coffee)
//- 속성: 이름, 가격, 원두 원산지
class Coffe {
    var name: String
    var price: String
    var beanOrigin: String
    init(name:String, price:String, beanOrigin:String) {
        self.name = name
        self.price = price
        self.beanOrigin = beanOrigin
    }
}
//2. 계산기 클래스를 만들고 다음과 같은 기능을 가진 Property 와 Method 정의해보기
//

//** 계산기 (Calculator)
//- 속성: 현재 값
//- 행위: 더하기, 빼기, 나누기, 곱하기, 값 초기화
//ex)
//let calculator = Calculator() // 객체생성
//
//calculator.value // 0
//
//calculator.add(10) // 10
//calculator.add(5) // 15
//
//calculator.subtract(9) // 6
//calculator.subtract(10) // -4
//
//calculator.multiply(4) // -16
//calculator.multiply(-10) // 160
//
//calculator.divide(10) // 16
//calculator.reset() // 0

class Calculator {
    var value:Double = 0
    func add(_ a:Double) -> Double {
        value = value + a
        return value
    }
    func subtract(_ b:Double) -> Double {
        value = value - b
        return value
    }
    func multiply(_ c:Double) -> Double {
        value = value * c
        return value
    }
    func divide(_ d:Double) -> Double {
        value = value / d
        return value
    }
    func reset() -> Double {
        value = 0
        return value
    }
}
let calculator = Calculator()
calculator.value // 0
calculator.add(10) // 10
calculator.add(5) //15

calculator.subtract(9) // 6
calculator.subtract(10) // -4
calculator.multiply(4) // -16
calculator.multiply(-10) // 160
calculator.divide(10) // 16
calculator.reset() // 0
