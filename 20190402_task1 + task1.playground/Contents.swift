//과제1

func addTwoValues(a: Int, b: Int) -> Int {
    return a + b
}
let task1: Any = addTwoValues(a: 2, b: 3)


var num: Int = task1 as! Int
num + num

//(task1 + task1)
//위와 같이 task1 이라는 변수가 있을 때
//task1 + task1 의 결과가 제대로 출력되도록 할 것
