# ----- 4-15.R -----
apply(iris[,1:4], 1, mean)  # row 방향(MARGIN=1)으로 함수 적용
apply(iris[,1:4], MARGIN=1, mean)  # row 방향(MARGIN=1)으로 함수 적용
apply(iris[,1:4], 2, mean)  # col 방향(MARGIN=2)으로 함수 적용
apply(iris[,1:4], MARGIN=2, mean)  # col 방향(MARGIN=2)으로 함수 적용

apply(iris[,1:4], MARGIN=2, min)  # col 방향(MARGIN=2)으로 함수 적용
apply(iris[,1:4], MARGIN=2, max)  # col 방향(MARGIN=2)으로 함수 적용
apply(iris[,1:4], MARGIN=2, range)  # col 방향(MARGIN=2)으로 함수 적용

class(range(c(9, 3)))
range(c(9, 3))

# ----- 4-16.R -----
mymax <- function(x,y) {
  num.max <- x
  if (y > x) {
    num.max <- y
  }
  return(num.max) 
} 

# ----- 4-17.R -----
mymax(10,15)
a <- mymax(20,15)
b <- mymax(31,45)
a
b
print(a+b)

# ----- 4-18.R -----
mydiv <- function(x,y=2) {
  result <- x/y
  return(result) 
}

mydiv(x=10,y=3)           # 매개변수 이름과 매개변수값을 쌍으로 입력
mydiv(10,3)               # 매개변수값만 입력
mydiv(10)                 # x에 대한 값만 입력(y 값이 생략됨)

mydiv(x <- 10, y <- 6)     # 매개변수 이름과 매개변수값을 쌍으로 입력
mydiv(x = 10, y = 6)     # 매개변수 이름과 매개변수값을 쌍으로 입력

# ----- 4-19.R -----
myfunc <- function(x,y) {
  val.sum <- x+y
  val.mul <- x*y 
  return(list(val.sum, mul=val.mul)) 
}

result <- myfunc(5,8)
s <- result[[1]]        # 5, 8의 합 결과: 스칼라
m <- result$mul         # 5, 8의 곱 결과: 스칼라
cat('5+8=', s, '\n')
cat('5*8=', m, '\n')

# ----- 4-20.R -----
# setwd("d:/source")    # myfunc.R이 저장된 폴더
# 작업 폴더: 프로젝트 폴더 
source("Ch04/myfunc.R") # myfunc.R 안에 있는 함수 실행

# 함수 사용
a <- mydiv(20,4)      # 함수 호출
b <- mydiv(30,4)      # 함수 호출
a
b
a+b
mydiv(mydiv(20,2),5)  # 함수 호출

# ----- 4-21.R -----
score <- c(76, 84, 69, 50, 95, 60, 82, 71, 88, 84)
score

which(score==69)      # 성적이 69인 학생은 몇 번째에 있나
which(score>=85)      # 성적이 85 이상인 학생은 몇 번째에 있나
max(score)            # 최고 점수는 몇 점인가
which.max(score)      # 최고 점수는 몇 번째에 있나
min(score)            # 최저 점수는 몇 점인가
which.min(score)      # 최저 점수는 몇 번째에 있나

score[which(score==69)]   # 성적이 69인 성적
score[which.max(score)]   # 성적이 최대인 성적

# ----- 4-22.R -----
score <- c(76, 84, 69, 50, 95, 60, 82, 71, 88, 84)
idx <- which(score <= 60) # 성적이 60 이하인 값들의 인덱스
idx
score[idx] <- 61          # 성적이 60 이하인 값들은 61점으로 성적 상향 조정
score                     # 상향 조정된 성적 확인

idx <- which(score >= 80) # 성적이 80 이상인 값들의 인덱스
score.high <- score[idx]  # 성적이 80 이상인 값들만 추출하여 저장
score.high                # score.high의 내용 확인


# ----- 4-23.R -----
idx <- which(iris$Petal.Length > 5.0) # 꽃잎의 길이가 5.0 이상인 값들의 인덱스
idx
iris.big <- iris[idx,]              # 인덱스에 해당하는 값만 추출하여 저장
iris.big

# 데이터 객체의 구조를 간단하게 요약해서 보여주는 함수
str(iris.big)

# ----- 4-24.R -----
# which() 조건을 만족하는 요소의 인덱스(위치)를 반환하는 함수
m <- matrix(1:9, nrow = 3)
m

result <- which(m > 5)
# 값이 5보다 큰 요소의 위치
result <- which(m > 5, arr.ind = TRUE)
print(result)

result <- which(m > 5, arr.ind = FALSE)
print(result)

result <- which(matrix(11:19, nrow = 3) > 15, arr.ind = FALSE)
print(result)

# 1~4열의 값 중 5보다 큰 값의 행과 열의 위치
# arr.ind: 행렬이나 배열에서 사용. 
# TRUE로 설정하면 조건을 만족하는 요소의 행과 열 인덱스를 반환.
str(iris)
str(iris[,1:4]>5.0) # 논리인덱싱x, 논리 매트릭스를 생성하는 연산.
is.matrix(iris[,1:4]>5.0) # 데이터프레임이 매트릭스가 됨.

idx <- which(iris[,1:4]>5.0, arr.ind =TRUE)
idx
iris[,1:4][idx[1, 1], idx[1, 2]]
iris[1, 1]

idx <- which(iris[,1:4]>5.0)
idx

