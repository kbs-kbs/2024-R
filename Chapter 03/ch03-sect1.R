# 단축키

## 줄 실행 또는 부분선택 실행(다음 줄 이동): 
##         ctrl + Enter
## 줄 실행 또는 부분선택 실행(현재 줄 계속 위치): 
##         alt + Enter
## 소스전체실행(줄마다 소스 표시와 실행): 
##         ctrl + Shift + Enter
##         ctrl + Alt + R
## 소스전체실행(print 있어야 출력): 
##         ctrl + Shift + S
## 소스전체 실행코드
## source("ch03-sect1.R")
## print(paste("ch03-sect1.R", "실행"))

## <- (대입연산자) 
##         alt + -
## %>% (파이프 연산자) 삽입.
##         Ctrl + Shift + M
## 줄복사: shift + alt + 아래화살표
## 줄삭제: ctrl + D
## 취소:   ctrl + Z
## 줄이동: alt + 이동(위, 아래)화살표
## 선택된 줄 또는 현재 줄 주석/주석 해제
##         Ctrl + Shift + C

# 변수 등 메모리 목록
ls()

# 이전 메모리 제거, 환경창 확인
rm(list = ls())

# code 3-1
# R 행렬은 열(세로) 우선 채움
# 열은 통계학에서 변수라고 함
z <- matrix(1:20, nrow=4, ncol=5)
z 
z <- matrix(1:20, 4, 5)
z 

# code 3-2
# 행(가로) 우선 채움 byrow=TRUE
# 행은 통계학에서 관측값이라고 함
z2 <- matrix(1:20, nrow=4, ncol=5, byrow=TRUE)
z2      # 매트릭스 z2의 내용을 출력

# code 3-3
x <- 1:4                            # 벡터 x 생성
y <- 5:8                            # 벡터 y 생성
z <- matrix(1:20, nrow=4, ncol=5)   # 매트릭스 z 생성
z

m1 <- cbind(x,y)                    # x와 y를 열 방향으로 결합하여 매트릭스 생성
m1                                  # 매트릭스 m1의 내용을 출력
m2 <- rbind(x,y)                    # x와 y를 행 방향으로 결합하여 매트릭스 생성
m2                                  # 매트릭스 m2의 내용을 출력
m3 <- rbind(m2,x)                   # 매트릭스 m2와 벡터 x를 행 방향으로 결합
m3                                  # 매트릭스 m3의 내용을 출력
m4 <- cbind(z,x)                    # 매트릭스 z와 벡터 x를 열 방향으로 결합
m4                                  # 매트릭스 m4의 내용을 출력
m4[4, 'x']
m4[4, 6]
m4[[4, 6]]

# code 3-4
z <- matrix(1:20, nrow=4, ncol=5)   # 매트릭스 z 생성
z                                   # 매트릭스 z의 내용 출력

z[2,3]                              # 2행 3열에 있는 값
z[1,4]                              # 1행 4열에 있는 값
z[2,]                               # 2행에 있는 모든 값
z[,4]                               # 4열에 있는 모든 값

# code 3-5
z <- matrix(1:20, nrow=4, ncol=5)   # 매트릭스 z 생성
z                                   # 매트릭스 z의 내용 출력

z[2,1:3]                            # 2행의 값 중 1~3열에 있는 값
z[1,c(1,2,4)]                       # 1행의 값 중 1, 2, 4열에 있는 값
z[1:2,]                             # 1~2행에 있는 모든 값
z[,c(1,4)]                          # 1, 4열에 있는 모든 값

# code 3-6
score <- matrix(c(90,85,69,78,
                  85,96,49,95,
                  90,80,70,60),
                nrow=4, ncol=3)
score
rownames(score) <- c('John','Tom','Mark','Jane')
colnames(score) <- c('English','Math','Science')
score

# 매트릿스에도 원소 하나 하나에 이름을 붙일 수 있음
names(score) <- 's score'
names(score)
score['s score']

# 추가
names(score) <- letters[1:12]
score
score["c"]

# code 3-7
score[2, 1]
score['John','Math']                # John의 수학 성적
score['Tom',c('Math','Science')]    # Tom의 수학, 과학 성적
score['Mark',]                      # Mark의 모든 과목 성적
score[,'English']                   # 모든 학생의 영어 성적
rownames(score)                     # score의 행의 이름
colnames(score)                     # score의 열의 이름
colnames(score)[2]                  # score의 열의 이름 중 두 번째 값

print(paste("ch03-sect1.R", "실행 종료"))
