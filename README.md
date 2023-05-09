# MyCreditManager

[원티드 프리온보딩 챌린지(5월) 사전미션]("https://yagomacademy.notion.site/iOS-ba2d0c0bb0b949c896cc28567706e969")

학생의 성적을 입력하고 평점을 출력하는 프로그램

<br>

# STEP 0. 순서도

<img src="https://user-images.githubusercontent.com/73203944/235344646-a41110ff-4665-4acc-8c3a-677421e9b232.png">

<br>

# STEP 1. Dictionary로 구현하기

학생의 성적 정보를 담을 변수(students)를 [String: [String: String]] 타입으로 만들어서 [학생의 이름: [과목: 성적]]으로 저장하도록 구현

## 구현 내용

- startProgram : 프로그램을 시작하여 사용자에게 메뉴를 입력 받는 함수

  함수 동작

  <img width=480 src="https://user-images.githubusercontent.com/73203944/235344598-430fe661-eaca-47f4-bebd-4bcf6f5a0ffd.png">

- addStudent : students에 학생을 추가하는 함수

  함수 동작

  <img width=480 src="https://user-images.githubusercontent.com/73203944/235344921-09a6b013-e96a-4f3f-95a0-5a876858fae3.png">

- deleteStudent : students의 학생을 삭제하는 함수

  함수 동작

  <img width=480 src="https://user-images.githubusercontent.com/73203944/235345123-6467a04a-5065-47c6-88fe-56291a7e6002.png">

- updateCredit : 이미 students에 추가된 학생의 성적을 입력하거나 수정하는 함수

  함수 동작

  <img width=480 src="https://user-images.githubusercontent.com/73203944/235345236-622d675f-724b-43b4-a52a-97d6d9885d60.png">

- deleteCredit : students에 존재하는 학생의 이미 입력된 과목의 성적을 삭제하는 함수

  함수 동작

  <img width=480 src="https://user-images.githubusercontent.com/73203944/235345350-9b377611-6f38-4001-aaba-40e39e4da78c.png">

- checkScore : students에 존재하는 학생의 성적을 조회하고 평점을 출력하는 함수

  함수 동작

  <img width=480 src="https://user-images.githubusercontent.com/73203944/235345470-fdecdc19-dbd8-413f-9b57-5e2aafa43dbf.png">

- 프로그램 종료 시

  <img width=480 src="https://user-images.githubusercontent.com/73203944/235345545-0f459a79-7a04-4502-b1be-e872ca33080c.png">

## 추가 구현한 부분

1. 소문자 x를 입력 받아도 프로그램이 종료되도록 구현
   <img width=480 src="https://user-images.githubusercontent.com/73203944/235345532-c86f962c-b68c-440a-bdf4-d811731352cd.png">

2. students가 비어있으면 메뉴 2~5는 동작하지 않도록 구현
   <img width=480 src="https://user-images.githubusercontent.com/73203944/235345672-5d1f19e1-89ef-4897-a7e1-726b04bd361f.png">

<br>

# STEP 2. 객체를 통해 구현하기

학생의 정보를 담을 Student struct와 성적에 대한 점수와 문자열값을 가지고 있는 Score enum, CreditManager class를 정의하여 구현

## struct Student

- name: String 타입으로 학생의 이름을 저장하는 프로퍼티
- credits: [String: Credit] 타입으로 과목명을 key로 하고 성적을 value로 하는 프로퍼티
- score: Double 타입의 연산 프로퍼티로, credits에 입력된 성적을 기반으로 평점을 계산하여 저장하는 프로퍼티

- init(\_:) : 매개인자로 name을 받아 Student의 name에 할당하는 메서드, 다른 프로퍼티의 경우 초기화 과정에서 할당 받을 수 없으므로 매개변수를 두지 않음

## enum Credit

- 각각의 성적에 대한 문자열을 rawValue로 하는 객체
- point : Double 타입 연산 프로퍼티로 각각의 성적에 대한 점수값을 return

## class CreditManager

- 구현된 메서드와 프로퍼티를 하나의 class에 담음
- students와 startProgram 메서드를 제외한 모든 메서드는 private 처리하여 함부로 접근할 수 없도록 함
- getText<T>(\_:) : 사용자에게 입력 받아 정의된 타입으로 적절히 처리하여 return 하는 메서드

## 변경된 로직

- updateCredit : inputCredit을 rawValue로 하는 Credit 객체를 credit에 담고 credit이 nil이면, 입력을 다시 하도록 메세지 출력

- 그 외 students의 타입이 변경되면서 그에 따라 각 함수들의 로직 변경

## 고민한 점

- enum Credit는 점수를 계산하기 위한 Double값과 입출력에 사용될 String값이 두개 존재해야 했기 때문에, rawValue를 어떤 것으로 두고, 어떤 것을 프로퍼티로 둘 것인지에 대해 고민했다.

  - 처음에는 rawValue를 Double 타입으로 두었다. String 값을 입력 받아서 해당하는 case로 변환하는 메서드를 만들고, 각 case별로 String을 반환하는 프로퍼티까지 정의해야 해서 코드가 복잡해졌다.

  - rawValue를 String으로 두고, 해당하는 점수를 프로퍼티로 정의하니 코드가 한결 깔끔해졌다.

<br>

# STEP 3. Error 처리

CLI에서 실행되는 프로그램의 특성상 Error를 throw하지는 않고, 적절하게 description이 출력되도록 구현

## CreditManageError 객체의 정의

- invalidInput(InputType): 사용자의 입력이 잘못됨

  - menu : 메뉴 입력이 잘못됨
  - text : 입력해야 하는 텍스트 형식에 맞지 않음

- emptyStudents(FunctionType): students 배열이 비어있음. 각 메서드 별로 다른 문구를 출력하기 위해 메서드별 enum을 정의

- existStudent: 이미 추가된 학생의 이름을 추가함

- notFoundStudent: 존재하지 않는 학생 데이터의 삭제 혹은 수정을 시도함

- invalidGradeInput: 정의되지 않은 성적을 입력함

- notFoundSubject: 입력되지 않은 성적을 삭제함

- emptyCredits: 어떠한 성적도 입력되지 않은 학생의 성적을 조회함

<br>

# STEP 4. 코드 리팩토링

## CreditManageError 객체 분리

에러의 종류에 따라 CreditManageError를 3개의 에러객체로 분리했고, `CustomDebugStringConvertible` 프로토콜을 적용하여 `print(error)`만으로도 의도한 에러메세지가 출력되도록 했다.

- InputValueError: 사용자의 입력값이 올바르지 않은 경우 발생하는 에러

  - case menu: 메뉴의 입력값이 잘못된 경우
  - case text: 일반 텍스트 입력값이 잘못된 경우
  - case grade: 학생의 성적입력이 잘못된 경우

- EmptyDataError: 불러오려는 데이터가 비어있는 경우 발생하는 에러

  - case deleteStudent: 학생 삭제를 시도하였으나 students 데이터가 비어있는 경우
  - case updateCredit: 학생의 성적 입력(변경)을 시도하였으나 students 데이터가 비어있는 경우
  - case deleteCredit: 학생의 성적 삭제를 시도하였으나 students 데이터가 비어있는 경우
  - case checkScore: 학생의 성적 조회를 시도하였으나 students 데이터가 비어있는 경우
  - case emptyCredits(name:): 학생의 성적 조회를 시도하셨으나 credits 데이터가 비어있는 경우

- InvalidDataError: 추가/삭제하기 위해 접근하려는 데이터에 문제가 있는 경우 발생하는 에러
  - case duplicatedStudent(name:): 추가하려는 학생이 이미 등록된 경우
  - case notFoundStudent(name:): 조회하는 학생이 존재하지 않는 경우
  - case notFoundSubject(name:, subject:): 조회하려는 과목이 존재하지 않는 경우

<br>

## 모든 메서드의 else문 삭제

- 객체지향 생활체조 규칙2에 따라 else문을 삭제하여 불필요한 코드의 분기처리를 수정
- else문을 사용하게 되면, 코드의 진행에 분기가 생기면서 함수 하나가 하나의 기능만을 하도록 하기 어려우며, 분기된 코드는 가독성이 떨어지기 때문에 수정함

<br>

## 코드 가독성 향상을 위한 수정

- 조건문을 역전 시키기 위해 사용한 !를 삭제하고 == 연산자를 사용하여 정확히 어떤 Bool값인지 비교하도록 하여 가독성을 향상함

<br>

## CLI 환경에서 던져진 에러의 처리를 위해 Result type 사용

- CLI 환경에서는 에러가 던져지는 경우 프로그램이 종료되면서 메서드를 반복하기 어려움
- 따라서 Result 객체를 활용하여 실행되는 메서드의 success, failure 여부에 따라 프로그램을 계속 실행하거나 에러메세지를 출력 후 실행이 지속되도록 로직을 수정함
