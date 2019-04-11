// 20190411_ 과제1

//1. 생성자 구현
//- Vehicle 클래스에 지정 이니셜라이져(Designated Initializer) 추가
//- Car 클래스에 modelYear 또는 numberOfSeat가 0 이하일 때 nil을 반환하는 Failable Initializer 추가
//- Bus 클래스에 지정 이니셜라이져를 추가하고, maxSpeed를 100으로 기본 할당해주는 편의 이니셜라이져 추가


class Vehicle {
    let name: String
    let maxSpeed: Int
    
    init(name: String, maxSpeed: Int) {
        self.name = name
        self.maxSpeed = maxSpeed
    }
}
let vehicle = Vehicle(name: "홍길동", maxSpeed: 10)
vehicle.name
vehicle.maxSpeed

class Car: Vehicle {
    var modelYear: Int
    var numberOfSeats: Int
    
    init?(modelYear: Int, numberOfSeats: Int) {
        guard numberOfSeats > 0 || modelYear > 0 else { return nil }
        self.modelYear = modelYear
        self.numberOfSeats = numberOfSeats
        super.init(name: "홍길동", maxSpeed: 200)
    }
}

if let car = Car(modelYear: 2019, numberOfSeats: 10) {
    car
    print(car)
    car.name
    car.modelYear
    car.numberOfSeats
}


class Bus: Vehicle {
    let isDoubleDecker: Bool
    
    init(isDoubleDecker: Bool, name: String, maxSpeed: Int) {
        self.isDoubleDecker = isDoubleDecker
        super.init(name: name, maxSpeed: maxSpeed)
    }
    convenience init(isDoubleDecker: Bool, name: String) {
        self.init(isDoubleDecker: isDoubleDecker, name: name, maxSpeed: 100)
    }
}
let bus = Bus(isDoubleDecker: true, name: "홍길동")
bus.maxSpeed
bus.name

