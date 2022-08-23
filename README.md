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
   2. tab bar의 등록 버튼 탭할 시 modal present 형식으로 보임
   3. collectionView 밑의 indicator 구현 방식
   4. tab man 이용할 때, conainer view 사용 시 각 탭의 크기는 항상 같은가용?? (홈 화면의 추천상품 - 브랜드)
   5. tableView나 collectionView 크기에 따라 scrollView가 변하게 하고 싶다면...? (My 화면 판매중 - 예약중 - 판매 완료 부분) - 4번 관련
   6. navigation bar uiview로 커스텀 storyboard
   7. 등록 화면 - 옵션 선택 화면 segmented control
   
</details>
