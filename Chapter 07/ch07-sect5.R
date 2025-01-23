# 이전 메모리 제거
rm(list = ls())

# code 7-13
x <- 1:100
y <- sample(x, size=10, replace = FALSE)  # 비복원추출
y

####연습###################
sample(1:10, 10)
sample(1:5, 6) # replace = FALSE가 기본, 오류 발생
sample(1:5, 7, replace = TRUE)
###########################

# code 7-14
set.seed(1)
idx <- sample(1:nrow(iris), size=50, replace = FALSE)
idx # 행 번호 벡터
iris.50 <- iris[idx,]               # 50개의 행 추출
dim(iris.50)                        # 행과 열의 개수 확인
head(iris.50)

# 데이터 프레임, 테이블, 리스트 등과 같은 R 객체를
# 시각적으로 확인하기 위해 사용되는 함수
# RStudio와 같은 인터페이스에서 주로 활용
# 데이터를 스프레드시트와 유사한 형태로 새로운 창에 표시
View(iris.50)

# code 7-15
sample(1:20, size=5)
sample(1:20, size=5)
sample(1:20, size=5)

set.seed(100)
sample(1:20, size=5)
set.seed(100)
sample(1:20, size=5)
set.seed(100)
sample(1:20, size=5)

set.seed(100)
sample(1:4, size=5) # 오류
sample(1:4, size=5, replace=T)

## 추가 학습 #######################################
# require(): 패키지를 성공적으로 메모리에 로드하면
# TRUE를 반환하고, 그렇지 않으면 FALSE를 반환
if (!require(dplyr)) {
  install.packages("dplyr")
  library(dplyr)
}

sample_n(iris, 10)     # 10개
sample_frac(iris)      # 전체
sample_frac(iris, .1)  # 10%
####################################################

# code 7-16
# 조합 5C3 = 5*4*3 / 3*2 = 10개의 조합 발생
combn(1:5,3)         # 1~5에서 3개를 뽑는 조합

x = c("red","green","blue","black","white")
com <- combn(x, 2)   # x의 원소를 2개씩 뽑는 조합
com
is.matrix(com)
ncol(com) # 10

com[,1]
for(i in 1:ncol(com)) { # 조합을 출력
  cat(com[,i], "\n")
}

# choose() 조합의 수(종류)를 반환하는 함수 
choose(5, 3)
choose(5, 4)
choose(5, 2)

# 종료
