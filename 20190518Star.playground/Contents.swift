import UIKit

// 첫째 줄에는 별 1개 둘째 줄에는 별 2개 , N번째 줄에는 별 N개를 찍는문제
// 첫째줄에 N(1<= N <= 100) 이 주어진다. 예제입력3
//  *
//  **
//  ***
print("----------1----------")
func some(a: Int) {
    var str = ""
    for _ in 1...a {
        str += "*"
        print(str)
    }
}
some(a: 5)

print("----------2----------")


func some1(b: Int) {
    var star = ""
    for i in 1...b {
        var str = ""
        for _ in 1...(b - i + 1) {
            str += " "
        }
        star += "*"
        print(str,star)
    }
}
some1(b: 5)

print("----------3----------")

func test(c: Int) {
    var str = ""
    for i in 1...c {
        var star = ""
        for _ in 1...(c - i + 1) {
            star.append("*")
        }
        str.append(" ")
        print(str,star)
    }
}
test(c: 5)

print("----------4----------")

func test1(a: Int) {
    var str = ""
    for i in 1...a {
        var star = ""
        for _ in 1...(a - i + 1) {
            star.append("*")
        }
        str.append(" ")
        print(star, str)
    }
}
test1(a: 5)
