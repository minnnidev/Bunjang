## 개발일지

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
        - 시간 분배를 잘해야 할 듯하다. 구현해야 할 UI가 겁나 많다.
        - 뭔가 부담감에 자꾸 고민하는 시간이 길어지는 것 같다.
        - 오늘도 목표한 것의 50퍼센트를 겨우 한 것 같다.
        - 어려운 부분은 일단 기록해 두고 할 수 있는 것부터 해치우자.
  
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
   <summary> 🍏 피드백 질문 </summary>

https://user-images.githubusercontent.com/108191001/185930775-6359950e-c531-4d45-a70d-c270443a37ca.MP4

   1. tab bar의 검색 탭할 시 push 뷰컨으로 보임
   2. tab bar의 등록 버튼 탭할 시 modal present 형식으로 보임 -> 해결 ⭕️
   3. collectionView 밑의 indicator 구현 방식 -> 후순위❗️
   4. tab man 이용할 때, conainer view 사용 시 각 탭의 크기는 항상 같은가용?? (홈 화면의 추천상품 - 브랜드)
   5. tableView나 collectionView 크기에 따라 scrollView가 변하게 하고 싶다면...? (My 화면 판매중 - 예약중 - 판매 완료 부분) - 4번 관련
   6. navigation bar uiview로 커스텀 storyboard -> ❌
   7. 등록 화면 - 옵션 선택 화면 segmented control -> 버튼으로 -> 해결 ⭕️
   
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
</details>

<details>
   <summary> 🍎 8.28 일 </summary>
</details>
       
<details>
   <summary> 🍏 피드백 질문 </summary>
      -  카카오 로그인 -> https://docs.google.com/spreadsheets/d/1MB0Sbl8Hq7Tr7LwspUTx0OcmT3Zyw-8sed1CSANKfbw/edit#gid=482859957
      (이해가 안 됨. . . . . . . ...... ㅜ)
   
      - collectionView 최근 검색어 순서
   https://user-images.githubusercontent.com/108191001/187187928-b3062254-e2b8-4a16-8a14-00bd57f46cf1.mov


     
   
</details>


