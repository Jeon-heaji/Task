## Task
----------------------------

* 20190311: [ 과제 ]
 - 이름과 나이를 입력 받아 자신을 소개하는 글을 출력하는 함수
 - 정수를 하나 입력받아 2의 배수 여부를 반환하는 함수
 - 정수를 두 개 입력 받아 곱한 결과를 반환하는 함수 (파라미터 하나의 기본 값은 10)
 - 4과목의 시험 점수를 입력받아 평균 점수를 반환하는 함수
 - 점수(문자 또는 숫자)를 입력받아 학점을 반환하는 함수 만들기 (90점 이상 A, 80점 이상 B, 70점 이상 C, 그 이하 F)
 - 점수(문자 또는 숫자)를 여러 개 입력받아 평균 점수에 대한 학점을 반환하는 함수 만들기 (90점 이상 A, 80점 이상 B, 70점 이상 C, 그 이하 F)
 
 -------------------------------
 
 * 20190312: [ 과제 ]

 - 두 개의 자연수를 입력받아 두 수를 하나의 숫자로 이어서 합친 결과를 정수로 반환하는 함수 
 (1과 5 입력 시 15,  29와 30 입력 시 2930,  6과 100 입력 시 6100)
 - 문자열 두 개를 입력받아 두 문자열이 같은지 여부를 판단해주는 함수
 - 자연수를 입력받아 그 수의 약수를 모두 출력하는 함수
 - 2 이상의 자연수를 입력받아, 소수인지 아닌지를 판별하는 함수
 - 자연수 하나를 입력받아 피보나치 수열 중에서 입력받은 수에 해당하는 자리의 숫자를 반환하는 함수 
 참고로 피보나치 수열은 이전 두 수의 합이 다음 수가 되는 수열
 (입력된 숫자가 4면 0, 1, 1, 2, 3, 5 ... 에서 4번째 위치인 2 출력.    )
 - 100 이하의 자연수 중 3과 5의 공배수를 모두 출력하는 함수
 
 ---------------------------------------------
 
 * 20190314: [ 과제 ]
 - 자연수를 입력받아 원래 숫자를 반대 순서로 뒤집은 숫자를 반환하는 함수
 ex) 123 -> 321 , 10293 -> 39201
 
 - 주어진 문자 배열에서 중복되지 않는 문자만을 뽑아내 배열로 반환해주는 함수
 ex) ["a", "b", "c", "a", "e", "d", "c"]  ->  ["b", "e" ,"d"]
 
 - 임의의 정수 배열을 입력받았을 때 홀수는 배열의 앞부분, 짝수는 배열의 뒷부분에 위치하도록 구성된 새로운 배열을 반환하는 함수
 ex) [2, 8, 7, 1, 4, 3] -> [7, 1, 3, 2, 8, 4]
 
 - 2개의 자연수와 사칙연산(+, -, *, /)을 가진 enum 타입 Arithmetic 을 입력 파라미터로 받아 해당 연산의 결과를 반환하는 함수 구현
 enum Arithmetic {
 case addition, subtraction, multiplication, division
 }
 func calculator(operand1: Int, operand2: Int, op: Arithmetic) -> Int {
 // 코드
 }
 
 - 별도로 전달한 식육목 모식도 라는 자료를 보고 Dictionary 자료형에 맞도록 중첩형태로 데이터를 저장하고
 + 해당 변수에서 표범 하위 분류를 찾아 사자와 호랑이를 출력하기
 
 -----------------------------------
 * 20190319: [ 과제 ]

 1. 다음과 같은 속성(Property)과 행위(Method)를 가지는 클래스 만들어보기.
 구현 내용은 자유롭게
 
 ** 강아지 (Dog)
 - 속성: 이름, 나이, 몸무게, 견종
 - 행위: 짖기, 먹기
 
 ** 학생 (Student)
 - 속성: 이름, 나이, 학교명, 학년
 - 행위: 공부하기, 먹기, 잠자기
 
 ** 아이폰(IPhone)
 - 속성: 기기명, 가격, faceID 기능 여부(Bool)
 - 행위: 전화 걸기, 문자 전송
 
 ** 커피(Coffee)
 - 속성: 이름, 가격, 원두 원산지
 

 2. 계산기 클래스를 만들고 다음과 같은 기능을 가진 Property 와 Method 정의해보기
 
 ** 계산기 (Calculator)
 - 속성: 현재 값
 - 행위: 더하기, 빼기, 나누기, 곱하기, 값 초기화
 
-------------------------------------------------- 
 
 * 20190321: [ 과제 ]
 1. 첨부된 이미지를 보고 상속을 이용해 구현해보기
 
 2. 첨부된 각 도형의 이미지를 참고하여 각 도형별 클래스를 만들고 
 각각의 넓이, 둘레, 부피를 구하는 프로퍼티와 메서드 구현하기
 (클래스 구현 연습)
 
 ---------------------------------------------------
 * 20190322:  [ 과제 ]

 - UISwitch : On, Off 가 바뀔 때마다 Label 의 내용이 On, Off 로 표시되도록 구현
 - UISegmentedControl : 선택 내용이 바뀔 때마다 Label 의 내용도 해당 타이틀 값으로 함께 변경되도록 구현
 참고로, 위 2개는 버튼과 달리 event 처리를 touchUpInside 가 아니라 valueChanged 라는 것을 활용해야 합니다.

----------------------------------------------------

* 20190325: [ 과제 ]

- AlertController 를 통해 Label 의 숫자를 1씩 올리거나 초기화하기
(위 내용을 스토리보드로  구현하기는 연습. 스토리보드 없이 완전히 코드로만으로 구현하는 것이 과제)
- 수업 실습 항목 3번 (3개의 빨강, 파랑, 초록색뷰 추가하기) 을 코드로 구현하기

------------------------------------------------

* 20190326: [ 과제 ]

1. 영상 참고 
> 텍스트 필드에 어떤 값을 입력하면 별도의 Label 에 입력된 텍스트 표시.
> 텍스트 필드가 활성화 되어 있을 땐 Label 의 텍스트 색상이 파란색이고, Font 크기는 40
> 텍스트 필드가 비활성화되면 Label 텍스트 색상이 빨간색이고, Font 크기는 20

2. ViewController 데이터 전달
> AViewController 와 BViewController 를 만들고 각각 하나의 Label 생성.
> AViewController 와 BViewController 를 전환할 때마다 각 Label 에 화면을 전환한 숫자 1씩 증가

-----------------------
* 20190329: [시험]
오후시험 - Example3 review

-------------------------

* 20190402: [ 과제 ]
1. 
func addTwoValues(a: Int, b: Int) -> Int {
return a + b
}
let task1: Any = addTwoValues(a: 2, b: 3)
위와 같이 task1 이라는 변수가 있을 때
task1 + task1 의 결과가 제대로 출력되도록 할 것

2. 스토리보드 이용할 것
- FirstVC 에 Dog, Cat, Bird 라는 이름의 Button을 3개 만들고 숫자를 표시하기 위한 Label 하나 생성
- SecondVC 에 UIImageView 하나와 Dismiss 를 위한 버튼 하나 생성
- FirstVC에 있는 버튼 3개 중 하나를 누르면 그 타이틀에 맞는 이미지를 SecondVC의 ImageView 에 넣기 
(이미지는 구글링 등을 통해 활용)
- 각 버튼별로 전환 횟수를 세서 개는 8회, 고양이는 10회, 새는 15회가 초과되면 화면이 전환되지 않도록 막기
(전환 횟수가 초과된 버튼은 그것만 막고, 횟수가 초과되지 않은 버튼으로는 전환 가능)
- 그리고 SecondVC 에 추가로 UIButton 을 하나 더 생성하여 그 버튼을 누를 때마다 전환 횟수를 계산하는 값이 개와 고양이, 새 모두에 대해 1회씩 추가되도록 구현

3. 
- FirstVC 에 텍스트가 -1인 UILabel 과 SecondVC 를 띄우기 위한 UIButton 생성
- SecondVC 에는 4개(10, 20, 30, 40)의 segment를 가진 UISegmentedControl,
그리고 FirstVC 로 돌아가기 위한 UIButton 생성
UISegmentedControl 에서 값을 선택한 뒤 버튼을 누르면 그 값이 FirstVC 의 Label 에 표시되도록 구현
--------------------------

* 20190404: [과제]
 1.
FirstVC 의 TextField 에 입력한 값을 SecondVC 의 Label에 표시하기
- UserDefaults 를 이용한 방법으로 구현
- Singleton 을 이용한 방법으로 구현
- Delegate 를 이용한 방법으로 구현
by.강사님

2. 
Singleton 에 red, green, blue 변수 생성.
firstview 에 UISlider 를 세개 생성하고 슬라이더 각각의 값을 Singleton 에 각각 저장.
secondview 에 backgroundcolor 를 singleton 에서 red, green, blue 값을 참조하여 보여주세요.
(코드로 구현하시오.)
by.클래스매니저님

--------------------

*20190405: [과제]

[ 로그인 페이지 필수 구현 기능 ]
1. 이미지와 동일하게 UI 구현  (스토리보드와 코드 자유)
2. 텍스트 필드는 UITextFieldDelegate 이용
3. 키보드에 textField 가 가릴 수 있으므로 키보드가 나타날 때는 텍스트필드 위로 끌어올리고 내려갈 때는 같이 내려가기
4. 미리 설정해둔 아이디와 비밀번호가 동일할 경우 로그인이 완료된 메인 화면으로 이동 
5. 메인 화면에서는 입력받은 아이디를 출력하는 Label 을 띄우고 다시 로그인 화면으로 돌아갈 수 있는 Sign Out 버튼 구성

[ 로그인 페이지 옵션 기능 ]
1. 미리 설정해둔 아이디와 비밀번호가 다를 경우 텍스트필드의 바탕화면을 일시적으로 빨갛게 만들었다가 원상 복구하기

(아래 2 ~ 3번은 delegate 메서드로 구현하기 어려워하실 것이므로 editingChanged를 이용해 먼저 구현)
(더 해보고 싶을 때 delegate 메서드로 추가 고민)
2. 텍스트필드에 입력할 수 있는 최대 글자 수는 20자까지
3. 아이디와 비밀번호는 모두 4 ~ 16자 사이여야 함  

[ 도전 과제 ]

회원가입 페이지를 만든 뒤 회원 가입한 유저의 아이디와 비밀번호를 추가하고
그것으로도 로그인 할 수 있도록 구현하기
by. 강사님

[클매과제]

영상과 같이 코드로 구현하시오.

1. UITabbarController에 두개의 ViewController를 생성
2. 첫번째 ViewController 에 UINavigationController 연결, 친구목록을 표현할 UILabel 생성
3. 친구추가 ViewController 에서 UITextField 를 생성하고 이름을 입력
4. TextField 에 입력된 값에 따라 AlertController 띄우기
5. 첫번째 ViewController 에 돌아왔을때 친구목록 Label 에 이름 표시

ps. (도전과제) 추가된 친구의 이름을 델리게이트패턴으로 구현해주세요~
by.클래스매니저님

------------------------------
*20190409: [과제]

1. 오토레이아웃 연습해보기 (별도 이미지 참고)
- 5개의 뷰를 생성하고 높이는 150으로 통일
- Safe Area Top 과 60 의 거리
- 가장 왼쪽의 뷰는 leading 20, 가장 오른쪽의 뷰는 trailing 20으로 설정하고 각 view 간의 거리는 8로 고정
- 각 위치에서 오른쪽에 있는 뷰는 왼쪽 뷰 width 의 0.7배에서 해당 위치의 인덱스만큼 뺀 값을 width 값으로 지님
e.g.
2번째 뷰의 width는 1번째 뷰 width의 0.7배보다 1 작게 설정
3번째 뷰의 width는 2번째 뷰 width의 0.7배보다 2 작게 설정
- storyboard
- code
by.강사님

2.
[클매과제]

*UIAlertController 와 비슷한 기능을 구현해봅시다.

1. FirstViewController 에서 버튼을 생성하고 present 를 통해 SecondVIewController 를 띄운다
2. 회색의 UIView 를 하나 생성하고 안에 색을 바꿀수있는 버튼과 FirstViewController 로 돌아올수있는 버튼을 구현하라.

FirstViewController 에서 SecondViewController 를 Present 할때

``let secondVC = SecondViewController()
secondVC.modalPresentationStyle = .overCurrentContext
present(secondVC, animated: true)```


위 코드를 작성.

``secondVC.modalPresentationStyle = .overCurrentContext```

는 present 하게 되었을때 이전 ViewController 를 뒤에 보여줍니다. (edited) 
by. 클래스매니저님

--------------------
* 20190410 [실습]
Sington_Example 
Delegate_Example
by.클래스매니저님
 
