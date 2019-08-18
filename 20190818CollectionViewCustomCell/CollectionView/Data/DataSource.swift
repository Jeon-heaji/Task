import UIKit

class DataSource {
    // 일단 두개의 공원 배열 정보를 가지고 있음(plist에서 뽑아서내서 전체공원 배열로 처음 생성)
    private var parks = [Park]()
    private var immutableParks = [Park]()   // 공원 참조 역할
    
    // "States(주)"정보
    private var sections = [String]()
    
    // 카테고리 갯수(주(states)의 갯수)
    var numberOfSections: Int {
        return sections.count
    }
    
    // 전체 공원의 갯수
    var count: Int {
        return parks.count
    }
    
    // MARK:- Public
    // 객체 생성시 loadParksFromDisk()에서 전체 공원정보, 주(states) 정보 불러와서 저장
    init() {
        parks = loadParksFromDisk()
        immutableParks = parks      // 그리고 일단 변하지 않을 공원 정보도 저장
    }
    
    
    // MARK:- Private
    private func loadParksFromDisk() -> [Park] {
        // keepingCapacity: 용량유지
        sections.removeAll(keepingCapacity: false)
        // plist목록에서 뽑아내기
        if let path = Bundle.main.path(forResource: "NationalParks", ofType: "plist") {
            if let dictArray = NSArray(contentsOfFile: path) {
                var nationalParks: [Park] = []
                for item in dictArray {
                    if let dict = item as? NSDictionary {
                        let name = dict["name"] as! String
                        let state = dict["state"] as! String
                        let date = dict["date"] as! String
                        let photo = dict["photo"] as! String
                        let index = dict["index"] as! Int
                        let park = Park(name: name, state: state, date: date, photo: photo, index: index)
                        //섹션(states) 만들기
                        if !sections.contains(state) {
                            sections.append(state)
                        }
                        // 공원 객체 생성해서 배열에 넣기
                        nationalParks.append(park)
                    }
                }
                return nationalParks
            }
        }
        return []
    }
    
    // 인덱스경로 ---> (절대경로로 바꾸기)(섹션이 아닌)전체 공원 중에서 몇번째인지, 절대적 순서 Int로 변환
    private func absoluteIndexForIndexPath(_ indexPath: IndexPath) -> Int {
        var index = 0
        for i in 0..<indexPath.section {
            index += numberOfParksInSection(i)
        }
        index += indexPath.item
        return index
    }
    
    
    // 섹션(states)에 해당하는 공원의 수(배열뽑아내고 --> count)
    func numberOfParksInSection(_ index: Int) -> Int {
        let nationalParks = parksForSection(index)
        return nationalParks.count
    }
    
    
    // 섹션(states)에 해당하는 공원 배열 뽑아내기
    private func parksForSection(_ index: Int) -> [Park] {
        let section = sections[index]
        let parksInSection = parks.filter { (park: Park) -> Bool in
            return park.state == section
        }
        return parksInSection
    }
    
    
    // 데이터 모델을 다루는(manipulate) 많은 메서드들   ...so forth(등등)
    
    // 인덱스패스 뽑아내기 (섹션이 있을때) (섹션, 아이템)
    func indexPathForPark(_ park: Park) -> IndexPath {
        // 일단 섹션(states)의 인덱스를 알아내서
        let section = sections.index(of: park.state)!
        var item = 0
        // 섹션에 해당하는 공원을 for문을 돌려서 공원의 인덱스 뽑아냄
        for (index, currentPark) in parksForSection(section).enumerated() {
            if currentPark === park {
                item = index
                break
            }
        }
        return IndexPath(item: item, section: section)
    }
    
    
    // 인덱스패스로 공원(파크) 반환하는 메서드
    func parkForItemAtIndexPath(_ indexPath: IndexPath) -> Park? {
        if indexPath.section > 0 {
            //일단 섹션에 해당하는 공원 배열을 뽑아서 "nationalParks"에 저장
            let nationalParks = parksForSection(indexPath.section)
            return nationalParks[indexPath.item]
        } else {
            return parks[indexPath.item]
        }
    }
    
    
    // 섹션(states)의 이름을 반환하는 메서드
    func titleForSectionAtIndexPath(_ indexPath: IndexPath) -> String? {
        if indexPath.section < sections.count {
            return sections[indexPath.section]
        }
        return nil
    }
    
    
    // (🔶섹션이 없을때) 새로운 파크 생성 -> 맨위에 붙이고, 인덱스패스 알려주기
    func newRandomPark() -> IndexPath {
        // 기존의 공원 목록중에서 랜덤으로 한개 뽑아내기
        let index = Int.random(in: 0...immutableParks.count - 1)
        let parkToCopy = immutableParks[index]
        // 복사해서 새로운 공원 객체 한개 더 생성
        let newPark = Park(copying: parkToCopy)
        parks.append(newPark)
        return IndexPath(row: parks.count - 1, section: 0)
    }
    
    // (🔶섹션이 있을때) 새로운 파크 생성 -> 인덱스패스 알려주기
    func indexPathForNewRandomPark() -> IndexPath {
        // 기존의 공원 목록중에서 랜덤으로 한개 뽑아내기
        let index = Int.random(in: 0...immutableParks.count - 1)
        let parkToCopy = immutableParks[index]
        // 복사해서 새로운 공원 객체 한개 더 생성해서 배열에 붙이기
        let newPark = Park(copying: parkToCopy)
        parks.append(newPark)
        
        // 공원의 인덱스 순으로 정렬
        parks.sort { $0.index < $1.index }
        // 생성한 공원의 인덱스 리턴
        return indexPathForPark(newPark)
    }
    
    
    // (아이템 여러개 한꺼번에)지우기
    func deleteItemsAtIndexPaths(_ indexPaths: [IndexPath]) {
        // 절대 경로 배열
        var indexes = [Int]()
        // 절대경로로 바꾸어서 배열에 저장
        for indexPath in indexPaths {
            indexes.append(absoluteIndexForIndexPath(indexPath))
        }
        var newParks = [Park]()
        // "parks"에 저장된 공원 목록에서 "indexes"에 있는 것을 지워버림(실제로는 해당하는 것을 빼고 배열 다시 생성하는 방식)
        // 또는 (여러개 선택시)뒤에서부터 지워야 함(지우는 중간에 배열 순서가 바뀔 수 있기 때문)
        for (index, park) in parks.enumerated() {
            if !indexes.contains(index) {
                newParks.append(park)
            }
        }
        parks = newParks
        
        // (여러개 선택시) 뒤에서부터 지우기
        //        for i in indexes.sorted().reversed() {
        //            parks.remove(at: i)
        //        }
    }
    
    
    // 이동하기
    func moveParkAtIndexPath(_ indexPath: IndexPath, toIndexPath newIndexPath: IndexPath) {
        if indexPath == newIndexPath {
            return
        }
        let index = absoluteIndexForIndexPath(indexPath)
        let nationalPark = parks[index]
        nationalPark.state = sections[newIndexPath.section]
        let newIndex = absoluteIndexForIndexPath(newIndexPath)
        parks.remove(at: index)
        parks.insert(nationalPark, at: newIndex)
    }

}
