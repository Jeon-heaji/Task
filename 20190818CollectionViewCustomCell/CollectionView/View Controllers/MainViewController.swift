import UIKit

class MainViewController: UICollectionViewController {
  
	@IBOutlet private weak var addButton:UIBarButtonItem!
	@IBOutlet private weak var deleteButton:UIBarButtonItem!
	
	private let dataSource = DataSource()
	
  
  
	override func viewDidLoad() {
		super.viewDidLoad()
		// Set up a 3-column Collection View
		let width = view.frame.size.width / 3
		let layout = collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
		layout.itemSize = CGSize(width:width, height:width)
    
    // 헤더가 고정되도록
    layout.sectionHeadersPinToVisibleBounds = true
		// Refresh control
		let refresh = UIRefreshControl()
		refresh.addTarget(self, action: #selector(self.refresh), for: UIControl.Event.valueChanged)
		collectionView?.refreshControl = refresh
		// Toolbar
		navigationController?.isToolbarHidden = true
		// Edit
		navigationItem.leftBarButtonItem = editButtonItem
    
    // 제스쳐 레코그 나이져
    // 셀을 이동 가능하게 하는 속성(실제는 "true"가 디폴트로 되어있긴 함) 자동으로 제스쳐 인식
    installsStandardGestureForInteractiveMovement = true
	}

  
  
  
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "DetailSegue" {
			if let dest = segue.destination as? DetailViewController {
				dest.park = sender as? Park
			}
		}
	}
	
	override func setEditing(_ editing: Bool, animated: Bool) {
		super.setEditing(editing, animated: animated)
		addButton.isEnabled = !editing
		collectionView?.allowsMultipleSelection = editing
    collectionView.indexPathsForSelectedItems?.forEach {
      collectionView.deselectItem(at: $0, animated: false)
    }
  
    if !editing {
			navigationController?.isToolbarHidden = true
		}
		guard let indexes = collectionView?.indexPathsForVisibleItems else {
			return
		}
		for index in indexes {
			let cell = collectionView?.cellForItem(at: index) as! CollectionViewCell
			cell.isEditing = editing
		}
	}
	
	@IBAction func addItem() {
    
    // (섹션이 없을때)랜덤으로 새로운 공원 복사해서 생성하고, 그 해당 인덱스 알기 ===> 해당 인덱스에 아이템 끼워넣기
//    let index = dataSource.newRandomPark()
//    collectionView?.insertItems(at: [index])
    
    // 섹션이 있을때
		let index = dataSource.indexPathForNewRandomPark()
    let layout = collectionView?.collectionViewLayout as! FlowLayout
    layout.addedItem = index
    
    // To liven things up(활기차게 하기 위해) 애니메이션 넣기
    UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.65, initialSpringVelocity: 0.0, options: [], animations: {
      self.collectionView?.insertItems(at: [index])
    }) { finished in
      // 지속적으로 인덱스패스가 남아있는 것을 방지하기 위해
      layout.addedItem = nil
    }
  
	}
	
  
	@objc func refresh() {
		addItem()
		collectionView?.refreshControl?.endRefreshing()
	}
	
  
	@IBAction func deleteSelected() {
		if let selected = collectionView?.indexPathsForSelectedItems {
      
      // 지울때의 레이아웃 설정 및 선택된 아이템들(indices) 전달
      let layout = collectionView?.collectionViewLayout as! FlowLayout
      layout.deletedItems = selected
      dataSource.deleteItemsAtIndexPaths(selected)
			collectionView?.deleteItems(at: selected)
			navigationController?.isToolbarHidden = true
		}
	}
}

extension MainViewController {
  // 섹션 내에서 아이템의 갯수
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return dataSource.numberOfParksInSection(section)
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
    
//    if let park = dataSource.parkForItemAtIndexPath(indexPath) {
 //    cell.titleLabel.text = park.name
      cell.isEditing = isEditing
//    }
    
    //인덱스패스만 있으면 언제든지 데이터소스에서 공원 정보 가져오는(fetch)메서드 사용
		cell.park = dataSource.parkForItemAtIndexPath(indexPath)
		
		return cell
	}
	
	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		if !isEditing {
			let park = dataSource.parkForItemAtIndexPath(indexPath)
			performSegue(withIdentifier: "DetailSegue", sender: park)
		} else {
			navigationController?.isToolbarHidden = false
		}
	}
	
	override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
		if isEditing {
			if let selected = collectionView.indexPathsForSelectedItems, selected.count == 0 {
				navigationController?.isToolbarHidden = true
			}
		}
	}
 
  // 섹션의 갯수 정하는 메서드("states"의 갯수)
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    return dataSource.numberOfSections
  }
  
  // 보조뷰(즉, 섹션 헤더) 설정에 관한 메서드
  override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

    let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as! SectionHeader
    
    // 섹션 헤더뷰의 타이틀 설정
//    view.title = dataSource.titleForSectionAtIndexPath(indexPath)
    
    // 직접적인 객체 생성
    let section = Section()
    section.title = dataSource.titleForSectionAtIndexPath(indexPath)
    section.count = dataSource.numberOfParksInSection(indexPath.section)
    
    // 객체를 헤더뷰에 넣기
    view.section = section
    return view

  }
  
  // 이동한다음, 데이터들의 순서를 업데이트 해주는 메서드
  override func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
  
    // 데이터소스 클래스의 메서드를 이용해서 데이터 바꾸기
    dataSource.moveParkAtIndexPath(sourceIndexPath, toIndexPath: destinationIndexPath)

  }
 
}
