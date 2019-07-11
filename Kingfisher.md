# Kingfisher

* 물총새 

## 물총새가 하는 많은 일들 

* Basic
* Transition
* Infinity
* Processor
* High Resolution
* GIF
* Indicator
* Image Data Provider
* Progressive JPEG

### Basic 

* UIImageView.kf.setImage()
	* 일반적으로 쓰는 가장 흔한 방법입니다. 여러가지 전달 인자가 있지만 with: 부분에 url만 전달해도 알아서 이미지를 로드합니다.
* UIImageView.kf.indicatorType
	* 인디케이터 타입을 정합니다. 
	* .none: 인디케이터를 없앱니다.
	* .activity: 기본 인디케이터를 적용합니다.
	* .image(imageData: ): gif 파일을 인디케이터로 씁니다.
	* .custom(indicator): 인디케이터 프로토콜(kf에서만듬)을 채택한 인디케이터를 만들어 인디케이터를 커스텀해서 씁니다.

### Transition
* 이미지가 로드될때 애니메이션을 줄 수있습니다.
* transition에 종류와 시간을 설정할 수 있습니다.

### Infinity 
* 이미지를 캐시해서 보여줄수 있다는 거같음.
* ImageResource(downloadURL:,cacheKey:)
	* downloadUrl 다운받을 url
	* cacheKey: 이미지가 캐시 될때 캐시 이름을 정할 수 있습니다. 비워져 있을때는 url.absoluteString 으로 전환되 저장이 됩니다. 기본값은 
nil입니다.

### Processor

* 이미지에 여러가지 효과들을 넣을 수가 있습니다. 
* 예제 파일 참조 
* 효과들을 여러개 겹쳐서 넣을 수가 있습니다.

### High Resolution

* 무거운 이미지를 가져올때 다운샘플링을 하는 예제입니다. 
* .processor(DownsamplingImageProcessor(size: CGSize(width: 250, height: 250)): 이미지를 사이즈에 지정된 값만큼 다운샘플링 합니다.
* 무거운 이미지를 가져올때 그냥 가져오게 되면 메모리가 부족해 크래쉬가 날 수있습니다. 하지만 킹피셔의 옵션을 사용해 이미지를 가져오면 원본이미지는 그대로 캐시해서 스토리지에 저장할 수 있고 보여질 이미지(메모리에 올라갈 이미지)들은 다운샘플링(화질을 저하)시켜서 보여줍니다.

### GIF

* UIImageView와 AnimatedImageView 의 차이를 비교합니다. 
* 애니메이션 이미지를 표시하기위한 UIImageView의 하위 클래스를 나타냅니다. AnimatedImageView는 일반적인 UIImageView (한 번에 모든 프레임을로드)에서 애니메이션 이미지를 표시하는 것과는 달리, 메모리 사용을 줄이기 위해 framePreloadCount로 정의 된 여러 프레임 만로드하려고 시도합니다. 메모리 사용량과 CPU 시간 사이의 균형을 제공합니다. 일반 이미지보기를 사용하여 GIF 데이터를로드 할 때 메모리 문제가 발생하면이 클래스를 사용해 볼 수 있습니다.
* options: [.onlyLoadFirstFrame]: 처음 사진만 로드합니다.


### Progressive JPEG

* 잘모르겠음