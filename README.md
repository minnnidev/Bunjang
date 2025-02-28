## 번개장터 클론 코딩 프로젝트

**프로젝트명**: 번개장터 클론코딩</br>
**사용 언어**: Swift/Storyboard</br>
**기간**: 8월 20일(토) ~ 9월 2일(금)</br>
**목표**: 번개장터 앱 처음부터 끝까지 클론코딩해 보기</br>

|파트|닉네임|
|------|----|
|서버|에단 님, 워니 님|
|iOS| 다나(it's Me)! 😆|

</br>

### 사용한 api
📎 https://docs.google.com/spreadsheets/d/1MB0Sbl8Hq7Tr7LwspUTx0OcmT3Zyw-8sed1CSANKfbw/edit#gid=0

### 기능 정리
📎 https://www.notion.so/ee6a52cece2d4c718e1c38116867d9cd

</br>
</br>


### 개발일지

<details>
   <summary> 🍎 8.20 토</summary>
    
https://user-images.githubusercontent.com/108191001/185752099-8c16169c-60e7-4b61-9308-387ad5f228b4.mov

    최종 목표: 홈 화면 구현 끝내기
    
    ☑️ 완료 
        - 카테고리 컬렉션 뷰 구현 완료
        - 배너 부분 구현 완료
        - tabman 이용하여 추천상품 탭, 추천상품 안에 컬렉션 뷰 구현 완료
        - tabman 이용하여 브랜드 탭 구현 완료
    
    ❌ 미해결
        - 배너 부분 자체는 구현 완료하였으나 navigation bar 부분과 어떻게 연결해야 할지 모르겠음 ➡️ 완료
        - 이때 스크롤 시 navigation bar custom 필요
        - 카테고리 컬렉션 뷰 밑 indicator 고민
        - sticky header
    
    🤔 느낀점
        - 시간 분배를 잘해야 할 듯하다. 구현해야 할 UI가 겁나 많다!
        - 어려운 부분은 일단 기록해 두고 할 수 있는 것부터 해치우자
  
</details>

<details>
   <summary> 🍎 8.21 일</summary>

https://user-images.githubusercontent.com/108191001/185796249-6cd5d69f-b211-468f-863a-27c3086c5ff0.mov

    최종 목표: 상품 상세 화면, 등록 화면, 검색 화면 UI구현 완료하기
    
    ☑️ 완료
      - 상품 선택 시 나오는 디테일 화면
      - 검색 화면 
      - 등록 화면 (디테일 부족)
        
    
    ❌ 미해결
      - 등록 화면 디테일 부족 ➡️ 완료
      - tab bar에서 등록 버튼 누를 시 modal 형식으로 나오는데 이를 구현하는 방법
   
</details>

<details>
   <summary> 🍎 8.22 월 </summary>
   
https://user-images.githubusercontent.com/108191001/185931317-7506625c-7a28-4382-b2c5-c1b5f8180f00.mov

    최종 목표: 등록 화면 디테일, 홈 화면 배너
    
    ☑️ 완료
      - 등록 화면 디테일 부분(태그 부분 제외)
      - 배너 화면
      - 스크롤 시 내비게이션 화면 커스텀
        
    
    ❌ 미해결
      - collectionView 밑 horizontal indicator 부분 구현
      - 검색 화면은 push 되어 나오는 것처럼, 등록 화면은 modal 처럼 나옴 -> 구현 방법?
      - 옵션 선택 화면 디테일
   
</details>

<details>
   <summary> 🍎 8.23 월 </summary>

https://user-images.githubusercontent.com/108191001/186191373-64e58d23-0253-4c5f-a34c-274a4286a6fb.mov

    최종 목표: 등록 화면 디테일, 피드백 부분 해결
    
    ☑️ 완료
    - tab bar에서 등록 탭할 시 modal 형식으로 보여주기
    - My tab: UI 구현
    - 등록 tab: 옵션 선택 버튼 탭할 시 나오는 modal 창 디테일 변경
    - 상품 조회 API 연동
      
       
    ❌ 미해결
    - tab bar에서 검색 화면 탭할 시 navigation push 형식으로 보여주기
 
</details>

<details>
   <summary> 🍎 8.24 화 </summary>
  
   - 회원가입
   
https://user-images.githubusercontent.com/108191001/186443805-b08e87a2-4aad-48ca-af80-a8605faf4e1a.mov

   - 상품 검색
   
https://user-images.githubusercontent.com/108191001/186444144-0b495939-531c-4c70-871b-e12ef142b156.mov

   - 상품 디테일 뷰
   
https://user-images.githubusercontent.com/108191001/186444372-29c94fa1-11e5-44a1-9e2c-71ff8539182f.mov

   
    최종 목표: 상품 검색 API 연동, 상품 디테일뷰 UI, 로그인 API 연동, 회원가입 UI
    
    ☑️ 완료
      - <상품 디테일뷰> tag 구현, 이미지 page indicator
      - <검색 탭> 상품 검색 UI 완료  / 상품 검색 API 연동 완료
      - <결제> 결제 탭 UI 구현 중
      - 회원가입 API는 연동 완료
      
       
    ❌ 미해결
      - 로그인 API -> 지금 해도 되는 건지 아닌지 너무 애매... 함 ㅠ
      - sticky header
      - 검색 시 필터 버튼(정확도순/최신순 ... ~)  누를 시 나오는 보기 옵션에서 3열/2열/1열 옵션은 아직 구현하지 않음
      - 서버분들이 개발하신 API가 진짜 번장 앱의 회원가입의 방식과 달라서 UI 디테일 구현 부족 ㅠ -> 추후에 구현해 주신다고 함~! 나는 어떻게 할까 고민 중...
 
</details>

<details>
   <summary> 🍎 8.25 목 </summary>

    최종 목표: 상품 디테일 뷰, my 탭
    아 중간에 레이아웃 깨지는 오류 나와서 상품 디테일 뷰 처음부터 다시 만들었다... 진짜 심장 배밖으로 나올 뻔
    
    ☑️ 완료
    <My 탭>
      - 사용자 판매중&예약중&판매 완료 UI
      - 사용자 판매 목록 조회 api 엮기
      - state에 따라 이미지 변경 
    <상품>
       - 상점 화면 조회 api 엮기

    ❌ 미해결
    - 상점에서 상품을 조회하면 현재 클릭된 상품도 같이 나옴 -> 어떻게 할지 서버분이랑 이야기 나눠야 함
 
</details>

<details>
   <summary> 🍎 8.26 금 </summary>

https://user-images.githubusercontent.com/108191001/186914546-1f639940-0df2-4c77-aed4-fc24c8d61e87.mov

https://user-images.githubusercontent.com/108191001/186915154-b0c10867-49bd-43f5-9204-b8d22e58952c.mov

https://user-images.githubusercontent.com/108191001/186915269-e15b43fa-8345-4fab-926c-601e4f03ff42.mov

https://user-images.githubusercontent.com/108191001/186915711-3fd258b7-8abd-40e5-93a2-c859e8c94678.mov

    ☑️ 완료
      - my 탭 - 프로필 탭 - 상태변경 UI 구현
      - 상점 화면 출력 API 엮기
      - 최근 본 상품 UI + 최근 본 상품 API 엮기
      - 브랜드 보러가기 탭 이후 UI 구현 
      - 브랜드 관련 API 엮기
      - 브랜드 - 팔로우 API 엮기
  
    ❌ 미해결
       - 회원 정보 수정을 해야 하는데 Patch 하는 게 너무 헷갈린다...! 
       - 각종 navigation bar들 디테일과 정리 부족
 
</details>

<details>
   <summary> 🍎 8.27 토 </summary>
   
   <img width="323" alt="스크린샷 2022-08-30 오전 2 26 36" src="https://user-images.githubusercontent.com/108191001/187261596-9da50dba-5a5c-4dec-979b-52bdc99355f7.png">
   <img width="323" alt="스크린샷 2022-08-30 오전 2 27 10" src="https://user-images.githubusercontent.com/108191001/187261795-d5a8d950-4aa4-4432-838b-302d19e374ac.png">
   
      ☑️ 완료
         - 상품 등록 api 엮기
         - 카테고리 화면 구현
</details>

<details>
   <summary> 🍎 8.28 일 </summary>

https://user-images.githubusercontent.com/108191001/187262071-aef3d76a-86eb-4d9b-b810-2dd34a4ae812.mov

https://user-images.githubusercontent.com/108191001/187262138-f066b4f2-4ce9-4be5-84e4-db96984cdb21.mov

      ☑️ 완료
         - 상점 출력 화면 UI
         - 상점 출력 api 엮기
         - 최근 검색어 구현
      
</details>


<details>
   <summary> 🍎 8.29 월 </summary>
   
https://user-images.githubusercontent.com/108191001/187262797-4de86abb-49df-4051-a426-399fa214e6c3.mov

https://user-images.githubusercontent.com/108191001/187262888-18b4ef94-a28f-46bc-93e1-c03fabf15bcf.mov

      ☑️ 완료
         - 상점 문의 등록 api 엮기
         - 판매자 목록에서 검색 api 엮기 
         - 찜 기능 api
         - 상품 등록 디테일 수정
         - 등록 화면 tag collection view 구현
      
</details>

<details>
   <summary> 🍎 8.30 화 </summary>

      ☑️ 완료
         - 구매하기 UI 구현 -> api는 따로 없어서 더미데이터 이용
         - 네트워크 통신할 때마다 loading indicator 넣어주기
      
</details>
       
<details>
   <summary> 🍎 8.31 수 </summary>

      ☑️ 완료
         - 회원가입 + 본인인증 부분 UI구현
         - alert message 필요한 곳
         - 본인인증 로그인 api 엮기
      
</details>
       
       
<details>
   <summary> 🍎 9.1 목 </summary>

      ☑️ 완료
         - 회원가입 부분 디테일
         - 팔로우 api들 구현
         - 카카오 로그인 구현
         - 내 상점 미리보기 구현
         - 영상 찍기 ❗️
         
         *본 템플릿의 저작권은 (주)소프트스퀘어드에 있습니다. 상업적 용도의 사용을 금합니다.*
</details>


