// 190321 과제
//1. 첨부된 이미지를 보고 상속을 이용해 구현해보기
//

class Animal {
    var brain = true
    var legs:Int
    init(legs:Int) {
        self.legs = legs
    }
    
}
var animal = Animal(legs: 0)
animal.brain
animal.legs

print("-------------------------------------")

class Human: Animal {
    override init(legs: Int) {
        super.init(legs: 2)
    }
}
var human = Human(legs: 2)
human.brain
human.legs

class Pet: Animal {
    var fleas:Int
    init(fleas:Int) {
        self.fleas = fleas
        super.init(legs: 4)
    }
   
}
var pet = Pet(fleas: 0)

pet.legs
pet.fleas
pet.brain

print("-------------------------------------")

class Dog:Pet {
    
}
var dog = Dog(fleas: 8)
dog.fleas
dog.brain
dog.legs

print("-------------------------------------")

class Cat:Pet {
    
}
var cat = Cat(fleas: 4)
cat.fleas
cat.brain
cat.legs


//2. 첨부된 각 도형의 이미지를 참고하여 각 도형별 클래스를 만들고
//각각의 넓이, 둘레, 부피를 구하는 프로퍼티와 메서드 구현하기
//(클래스 구현 연습)
class Square {
    var s:Double
    init(s:Double) {
        self.s = s
    }
    
    func area() -> Double {
        return s * s
        
    }
    func perimeter() -> Double {
        return s * s * s * s
    }
}
var square = Square(s: 4)
square.area()
square.perimeter()

print("-------------------------------------")

class Rectangle: Square {
    var w: Double
    var l: Double
    init(w:Double, l:Double) {
        self.l = l
        self.w = w
        super.init(s: 0)
    }
    override func area() -> Double {
        return l * w
    }
    override func perimeter() -> Double {
        return (2 * l) + (2 * w)
    }

}
var rectangle = Rectangle(w: 2, l: 3)
rectangle.area()
rectangle.perimeter()

print("-------------------------------------")

class Circle {
    var r : Double
    init(r:Double) {
        self.r = r
    }
    func area() ->Double {
        return 3.14 * r * r
    }
    func circumferene() -> Double {
        return 2 * 3.14 * r
    }
}
var circle = Circle(r: 2.5)
circle.area()
circle.circumferene()

print("-------------------------------------")

class Triangle {
    var b: Double
    var h: Double
    init(b:Double, h:Double) {
        self.b = b
        self.h = h
    }
    
    func area() -> Double {
        return 0.5 * b * h
    }
}
print("-------------------------------------")
class Trapezoid: Triangle {
    var a: Double
    init(a:Double) {
        self.a = a
        super.init(b: 2.5, h: 2.5)
    }
    override func area() -> Double {
        return (a + b) * h * 0.5
    }
}
var trapezoid = Trapezoid(a: 2.5)
trapezoid.area()
print("-------------------------------------")
class Cube:Square {
    override init(s: Double) {
        super.init(s: 3)
    }
    func volume() -> Double {
        return s * s * s
    }
}
var cube = Cube(s: 3)
cube.volume()

print("-------------------------------------")

class RectangularSolid:Cube {
    var w:Double
    var l:Double
    var h:Double
    init(w:Double, l:Double, h:Double) {
        self.w = w
        self.l = l
        self.h = h
        super.init(s: 0)
    }
    override func area() -> Double {
        return l * w * h
    }
}
var rectangularSolid = RectangularSolid(w: 3, l: 4, h: 5)
rectangularSolid.volume()

print("-------------------------------------")

class CircularCylinder:Circle {
    var h:Double
    init(h:Double) {
        self.h = h
        super.init(r: 2.4)
    }
    func volume() -> Double {
        return 3.14 * r * r * h
    }
}
var circularCylinder = CircularCylinder(h: 3.2)
circularCylinder.volume()

print("-------------------------------------")

class Sphere {
    var r:Double
    init(r:Double) {
        self.r = r
    }
    func volume() -> Double {
        return (r * r * r * 3.14 * 4)/3
    }
  
}
var sphere = Sphere(r: 2.2)
sphere.volume()

print("-------------------------------------")

class Cone:Sphere {
    var h:Double
    init(h:Double) {
        self.h = h
        super.init(r: 3.2)
    }
    
    override func volume() -> Double {
        return (3.14 * r * r * h )/3
    }
}
var cone = Cone(h: 2.1)
cone.volume()
