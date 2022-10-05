# YJU 2WD-A반 6조 미니 프로젝트 :: 회원 관리 시스템  

#### 👋 영진전문대학교 2WD-A반 6조(피드백@Feedback)
2학기 미니 프로젝트인 **회원 관리 시스템 구현**을 목표로 만들어진 repository입니다.  
더불어 **Github를 활용한 협업**을 스터디하고 있습니다.

<br>

### 🐥 조원
<table>
  <tr> 
    <td align="center"><a href="https://github.com/WDJJH"><img src="https://avatars.githubusercontent.com/u/103156018?v=4" width="100px;" alt=""/></a>
    </td>
    <td align="center"><a href="https://github.com/da-pri"><img src="https://avatars.githubusercontent.com/u/102639884?v=4" width="100px;" alt=""/></a>
    </td>
    <td align="center"><a href="https://github.com/jjun9"><img src="https://avatars.githubusercontent.com/u/103375871?v=4" width="100px;" alt=""/></a>
    </td>
    <td align="center"><a href="https://github.com/LJH-3410"><img src="https://avatars.githubusercontent.com/u/103081988?v=4" width="100px;" alt=""/></a>
    </td>
    <td align="center"><a href="https://github.com/baegjhoon"><img src="https://avatars.githubusercontent.com/u/103083251?v=4" width="100px;" alt=""/></a>
    </td>
  </tr>
 <tr>
    <th align="center">전종훈</th>
    <th align="center">유다연</th>
    <th align="center">장준규</th>
    <th align="center">이지환</th>
    <th align="center">백정훈</th>
 </tr>
</table>

<br>

---

# 🔍 목차  

<br>  

# Github 관리 전략

## :pushpin: Commit Convention
[Type] | 설명 | 예시
:--:|:--:|:--:
Add | 기능 추가 :heavy_plus_sign: | "[Add] 중복체크 기능 추가"
Fix | 버그 수정 :bug: | "[Fix] 이미지가 뜨지 않던 문제 해결"
Chore | 간단한 코드 ・ 오타 수정 :zap: | "[Chore] 주석 오타 수정"
Update | 문서 업데이트 :pencil2: | "[Update] README.md OOO 추가"
Design | UI 디자인 변경 (CSS) :art: | "[Design] 로그인창 UI 수정"

---

## 개인 작업 진행 순서  
:fire: `main 브랜치`에서 수정하지 않도록 주의, **현재 브랜치를 확인**해주세요!  
:fire: `develop 브랜치`가 최신이니, `clone 시` `아래 명령어`를 사용해서 clone 하시고 작업하시면 됩니다!!  
```
git clone -b develop https://github.com/WDJJH/homePage.git
```  
😆 | `작업 전에 할 일`  ⭐️ 작업 별로 링크를 걸어두었으니 참고해 주세요 ⭐️
:--:|:-- 
1 | 작업을 진행할 [`branch를 생성`](#git-branch-전략) 합니다.  
2 | 반드시! [`checkout` 명령어](#개인-branch-생성--사용법)를 통해 **작업을 진행할 branch로 이동**해주세요.  
3 | 작업 전, [`develop 브랜치`를 `pull`](#개인-branch-생성--사용법) 받고 시작해주세요!
 
  
👏 | `작업을 다했다면 !`
:--:|:--
1 | `push 전에` 정상적으로 작동하는지, 눈에 보이는 오류는 없는지 확인합니다.
2 | `git add . ` <- 명령어로 모든 변경사항을 add 합니다.
3 | [`git commit -m "[Type] 작업 내용에 대한 요약" `](#pushpin-commit-convention) <- 명령어로 commit 합니다.
4 | `git push -u origin (브랜치이름) ` <- 명령어로 github에 push 합니다.
5 | 파일이 정상적으로 해당 branch에 들어갔는지 확인 -> [`PR양식에 맞춰 Pull requests`](#pushpin-pr-convention) 합니다.
6 | PR 후 카톡 남겨주시면 확인 후 merge 하겠습니다!

<br>  

## Git Branch 전략
```
main -- develop -- add/jjh     // main - develop - commit타입/이름
                \_ design/bjh  // 구조로 이루어져 있습니다.
```
* 모든 작업은 **각자의 branch에서** 이루어집니다.  
* 자신의 branch가 맞는지 매번 꼭 확인해 주세요!  

<br>

### 개인 Branch 생성 & 사용법
1. 작업을 진행할 **branch를 생성**합니다.  
2. 꼭! `checkout 명령어`를 통해 **작업을 진행할 브랜치로 이동**해주세요.  
3. 작업 전, 반드시 `develop 브랜치`를 `pull` 받고 시작합니다.
```
git branch 브랜치이름 (>> commit타입/이름)

git checkout 브랜치이름

git pull origin develop
```

