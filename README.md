# MyCreditManager 소개

[원티드 프리온보딩 챌린지(5월) 사전미션]("https://yagomacademy.notion.site/iOS-ba2d0c0bb0b949c896cc28567706e969")

학생의 성적을 입력하고 평점을 출력하는 프로그램

<br>

# Work STEPS

## STEP 0. 순서도

<img src="https://user-images.githubusercontent.com/73203944/235344646-a41110ff-4665-4acc-8c3a-677421e9b232.png">

<br>

## STEP 1. Dictionary로 구현하기

학생의 성적 정보를 담을 변수(students)를 [String: [String: String]] 타입으로 만들어서 [학생의 이름: [과목: 성적]]으로 저장하도록 구현

### 구현 내용

- startProgram : 프로그램을 시작하여 사용자에게 메뉴를 입력 받는 함수

  함수 동작
  <img src="https://user-images.githubusercontent.com/73203944/235344598-430fe661-eaca-47f4-bebd-4bcf6f5a0ffd.png">

- addStudent : students에 학생을 추가하는 함수

  함수 동작
  <img src="https://user-images.githubusercontent.com/73203944/235344921-09a6b013-e96a-4f3f-95a0-5a876858fae3.png">

- deleteStudent : students의 학생을 삭제하는 함수

  함수 동작
  <img src="https://user-images.githubusercontent.com/73203944/235345123-6467a04a-5065-47c6-88fe-56291a7e6002.png">

- updateCredit : 이미 students에 추가된 학생의 성적을 입력하거나 수정하는 함수

  함수 동작
  <img src="https://user-images.githubusercontent.com/73203944/235345236-622d675f-724b-43b4-a52a-97d6d9885d60.png">

- deleteCredit : students에 존재하는 학생의 이미 입력된 과목의 성적을 삭제하는 함수

  함수 동작
  <img src="https://user-images.githubusercontent.com/73203944/235345350-9b377611-6f38-4001-aaba-40e39e4da78c.png">

- checkScore : students에 존재하는 학생의 성적을 조회하고 평점을 출력하는 함수

  함수 동작
  <img src="https://user-images.githubusercontent.com/73203944/235345470-fdecdc19-dbd8-413f-9b57-5e2aafa43dbf.png">

- 프로그램 종료 시

  <img src="https://user-images.githubusercontent.com/73203944/235345545-0f459a79-7a04-4502-b1be-e872ca33080c.png">

### 추가 구현한 부분

1. 소문자 x를 입력 받아도 프로그램이 종료되도록 구현
   <img src="https://user-images.githubusercontent.com/73203944/235345532-c86f962c-b68c-440a-bdf4-d811731352cd.png">

2. students가 비어있으면 메뉴 2~5는 동작하지 않도록 구현
   <img src="https://user-images.githubusercontent.com/73203944/235345672-5d1f19e1-89ef-4897-a7e1-726b04bd361f.png">
