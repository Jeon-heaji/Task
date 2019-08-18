import UIKit

// 공원 정보를 담는 클래스

class Park {
	var name: String
	var state: String
	var date: String
	var photo: String
	var index: Int
	
	init(name: String, state: String, date: String, photo: String, index: Int) {
		self.name = name
		self.state = state
		self.date = date
		self.photo = photo
		self.index = index
	}
	
  // 공원을 복사해서, 똑같은 공원 객체를 만들어내는 편의 생성자
	convenience init(copying park: Park) {
		self.init(name: park.name, state: park.state, date: park.date, photo: park.photo, index: park.index)
	}
}
