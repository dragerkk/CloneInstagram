# instagram_ios_won

# 20221029

## 첫 회의내용
- 서버오픈시간 결정
- 앱 개발 우선순위 결정
- api 어떤 부분을 만들지 결정

## 구현할 UI 구상

## 시작
- LoginVC UI 
- Alamofire, Tabman Library


# 20221030

## MainStoryboard - 로그인 관련 VC
- UI 마무리
- 텍스트필드 내용에 따른 버튼 활성/비활성
- 체크박스 토글 -- 시간남으면 다른 방법을 찾아볼 것.
- xib 간의 연결


# 20221031

## AppStoryboard - 나머지 VC
- HomeVC 생성, 로그인 스토리보드로부터 연결 (PasswordVC)
- HomeVC UI : collectionViews in TableView
- TabBar Added & TabBar UI finished.
- YPImagePicker Library

## 회의
- 더미데이터 만들기 역할분배
- 서버 진행상황 공유
- 홈화면 스토리 프로필 이미지 라운드처리를 클라쪽에서 먼저 시도해보기로 결정, 어려울 경우 이미지 자체를 수정해보도록 함
- api sheet 관련 의견공유



# 20221101

## HomeVC 문제 발생 - 해결
- CollectionView in Tableview 방식으로 UI를 구성했는데, 스크롤 중첩이슈 발생함
- CollectionView 섹션을 나눠서 구성하는 방식으로 UI 수정

## App Storyboard
- HomeVC UI fin
- RegisterVC UI fin

## Model 추가
- Constant : BASE_URL, 토큰 저장, 유저인덱스 저장
- Color : hex code를 사용할 수 있도록 UIColor에 메서드 추가, RegisterVC에서 사용

## 회의?
- api 추가(게시글 생성부분 이미지 업로드 / 게시글 업로드 분리)


# 20221102

## HomeStoryCell inset 문제 발생 - 해결?
- Inset을 부여하는 방식이 잘못되었던 건 아니지만 UI를 코드와 스토리보드를 함께 사용해서 구현하다보니 문제가 있는 부분을 찾기가 어려웠음.
- 멘토님의 도움으로 inset 문제를 해결, 새로운 클래스와 메서드를 만들어 viewDidLoad() 에서 사용해줌. layoutAttributes 부분 관련 메서드 

## Login API, Join API 연결

## MainStoryboard
- 로그인 관련 화면 추가 (실제 인스타 어플에서 필요로 하는 화면들; 추가)
- 로그인 관련 화면간 데이터 이동

## 회의
- 로그인 이메일,이름 둘 중 하나로 가능하도록 변경

## PasswordVC 문제점 해결
- 비밀번호 저장 커스텀 버튼 부분 하이라이트 부분 해결 : tintcolor = clear 부여, foreground color 부여

## ProfileVC UI 
- UI 완성
- Tabman title 부분 이미지로 하는 방법을 찾아냄, bar 부분을 ButtonBar 대신 TabBar를 사용하면 됨.

## ProfileRegisterVC -- 문제 발생
- registerTableView 인식이 안되는듯? outlet 제거하고 아예 변수 새로 만들어봐도 강제래핑 오류가 발생


# 20221103 

## Profile API 연결중

## ProfileRegisterVC -- 문제 해결
- ProfileRegisterVC 내부에 문제가 있었던 게 아니라 이전 뷰컨에서 넘기는 과정에서 let vc = ProfileRegisterVC() 의 방식으로 단순하게 인스턴스를 생성하여 연결했기 때문에, 스토리보드 상의 ProfileRegisterVC의 프로퍼티(연결된 테이블뷰)에 접근할 수가 없었다. 뷰컨트롤러를 연결하는 방식을 신중하게 고려하여 실수없도록 해야할 것이다.

## ProfileRegister Button, ProfileMenu Button - pagesheet로 연결 및 UI 완료



# 20221104

## ProfileVC - api 연결완료

## ProfileVC : 각 UI에 api response값으로 연결, viewdidload / viewwillappear에서 UI값을 연결하면 적용되지 않고 데이터를 불러오는 메서드 내에서 연결해야 적용됨.

## ProfileVC - UI 문제사항 발생
- 버튼 title / image 사이 간격 padding값이 적용안됨.

## BirthVC - UI 문제 해결
- DatePicker 레이아웃이 잡히지 않는 줄 알았는데, Preferred Style이 자동으로 설정되어있어서 compact style로 자동으로 설정되었던 부분이었음. Wheels로 변경하여 인스타에서 사용하는 Date Picker 스타일로 변경함.



# 20221105

## Home post API, Following 관련 모델 생성
- 이슈 발생 : "The data couldn’t be read because it isn’t in the correct format"
- Following response에서는 올바른 형식이었으나 api 연결 실패함
- Home response에서 Body 부분 처리방법 찾아볼 것


# 20221106

## Home post API 문제 진행중 - 해결
- Home response -> GET 메서드에서 Body부분을 따로 보낼 수 없고 api 명세서가 잘못된 부분이었음. Body 부분 처리문제는 해결됨.
- "The data couldn’t be read because it isn’t in the correct format" 여전히 발생중, response 모델을 api 명세서와 동일하게 만들었으나 문제 발생중인 부분
- api 명세서와 다른 데이터타입이 문제였음. 해결

## Home UI - API 연결 : 문제 발생 -> 해결
- 컬렉션뷰 셀 안에 컬렉션뷰(이하 이미지컬렉션뷰)를 적용시켜 게시글 이미지를 불러오도록 했었음. 데이터 전달이 원하는 것처럼 되지 않았고 서버로부터 받은 데이터를 이미지컬렉션뷰로 전달하는 방법에 초점을 맞춤. 데이터 전달시점이 원하는대로 되지 않음
- 컬렉션뷰 셀 내부에서 이미지컬렉션뷰를 리로드하는 메서드를 따로 생성하여 상위 뷰컨트롤러에서 원하는 시점에 이미지컬렉션뷰를 리로드하는 방법으로 문제 해결함 

## kingfisher Library 적용


# 20221107

## Home post API 관련 
- 팔로잉한 친구들 게시글만 뜨지 않고, 본인 게시글도 뜨도록 수정요청 : 수정완료

## Profile VC - API 관련
- API - UI 연결
- 본인게시글 API 추가, UI 연결

## 이미지 업로드 관련
- 방법을 탐색 중..



# 20221108 

## 이미지 업로드 -- 해결
- multipartFormData를 사용하여 멀티 이미지 업로드. 
- multipartFormData.append 부분에서 withName과 더불어 fileName, mimeType 파라미터 값을 함께 전달해주자 업로드가 되었음. withName과 파일만 넘겼을 때는 업로드가 되지 않았었음

## 게시글 업로드
- api 연결완료 - 피드에 새로운 게시글 뜨는 것까지 확인

## 홈VC - 스토리 api 추가
- api 연결 및 UI 완료

## 로그인 관련 UI 개선
- 네비게이션바 숨김
- 생일 -> 텍스트필드 반영
- 약관동의 - 하위 3개버튼이 모두 선택된 경우 버튼 켜기
- 로그인 관련 뷰컨트롤러 - 하단 로그인 버튼 활성화(poptoRootVC)



# 20221109

## 프로필 - taggedVC - api 연결완료
- 해당 api가 만들어지지 않아서 다른 유저의 게시글 조회 api 연결함
- UI 작업 완료

## followVC
- custom naviBar
- 탭바 추가
- 탭바 타이틀에 follower count 반영할 수 있도록 api 연결, 현재 follower / following count에 맞추어 타이틀 반영할 수 있도록 작업 완료
- 처음에 present로 연결하여 탭바가 나타나지 않는 현상이 발생
: 상위 뷰컨트롤러에서 네비게이션으로 연결하여 문제 해결함

## followerVC, followingVC
- 관련 UI 작업 완료 (with TableView)
- api 연결

## 전반적인 UI 수정 (프로필 이미지 - cornerradius)

## follow 관련 api 수정요청 -- 반영됨

## 게시글 좋아요 기능 구현 & api 연결

## PWFindVC, ShopVC, SearchVC -- UI 작업 완료
- ShopVC : api 연결
- 나머지: api가 만들어지지 않음

## configVC UI 완료



# 20221110

## collectionView Cell에서 버튼 액션 - 화면 전환 안되는 이유? --- 해결
- cell 내부에서 delegate protocol : BtnAction을 만들고, 상위 뷰컨트롤러에서 delegate 지정, 액션 만들어줌

## CommentVC
- UI 완료

## 댓글 부분 문제발생 
- attributedText로 레이아웃 해결,

- 선택한 셀의 postId값을 다른 뷰컨트롤러로 전달 -- 해결



