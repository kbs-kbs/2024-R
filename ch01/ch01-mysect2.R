# 2-9
v1 <- 50:90 
v1 
v2 <- c(1, 2, 5, 50:90) 
v2

# 2-10
v3 <- seq(1, 101, 3)
v3
v4 <- seq(0.1, 1.0, 0.1)
v4

# 함수에 커서를 놓고 F1을 누르면 도큐먼트가 열리고 Help 탭에서 확인가능
# 머리글의 seq {base}는 base 패키지의 seq 함수라는 뜻

# 2-11
v5 <- rep(1,times=5) 
v5 
v6 <- rep(1:5,times=3) 
v6 
v7 <- rep(c(1,5,9), times=3) 
v7

rep(c("A", "B"), times=2, each=3, length.out=20)
# times나 length.out 둘 중에 하나만 쓰면 됨.
# 둘 다 쓸 경우 length.out이 우선적으로 적용됨.

# 2-12
score <- c(90,85,70) 
score 
names(score) 
names(score) <- c("John","Tom","Jane") # 값들에 이름을 부여
names(score)
score

# 2-13
d <- c(1, 4, 3, 7, 8) 
d[1] 
d[2] 
d[3] 
d[4] 
d[5] 
d[6]

score[1]
score[2]

# 2-14
d <- c(1, 4, 3, 7, 8)
d[c(1, 3, 5)]
d[1:3]
d[seq(1, 5, 2)]
d[-2] # 2번째 원소 제외
d[-c(3:5)]

x <- c(a=10, b=20, c=30)
x["a"]
x[-"a"] # 안됨
x[-c("a")] # 안됨
x[c("b", "c")]

# 2-15
GNP <- c(2090, 2450, 960)
GNP
names(GNP) <- c("Korea","Japan","Nepal")
GNP
GNP[1]
GNP["Korea"]
GNP[c("Korea","Nepal")]

# 2-16
v1 <- c(1,5,7,8,9)
v1
v1[2] <- 3 
v1
v1[c(1,5)] <- c(10,20) 
v1

# 2-17
d <- c(1,2,3,4,5,6,7,8,9,10)
sum(d) 
sum(2*d) 
length(d) 
mean(d[1:5]) 
max(d) 
min(d) 
sort(d) 
sort(d, decreasing = FALSE) 
sort(d, decreasing = TRUE) 
v1 <- median(d) # mean은 모든 값의 평균, median은 가운데 값. 단, 짝수개일 경우 가운데 두 값의 평균.
median(d[1:5])
mean(d)
v1
v2 <- sum(d)/length(d)
v2

# 2-20
d <- c(3,4,5,6,7,8,9, 10, 11) 
d>5 
d[d>5] # 5보다큰값
sum(d>5) # 5보다큰값의개수를출력 0+0+0+1+1+1+1+1+1
sum(d[d>5]) # 5보다큰값의합계를출력
d==5
condi <- d > 5 & d < 8 # 조건을변수에저장
d[condi]

# 2-21
# 리스트는 서로 다른 자료형의 값들을 1차원 배열에 저장하고 다룰 수 있음.
ds <- c(90, 85, 70, 84) 
my.info <- list(name='Tom', age=60, status=TRUE, score=ds) 
my.info
str(my.info) # 유용
my.info[1] # 원소 이름이 같이 출력
my.info[[1]] # 원소만 출력
my.info$name 
my.info[[4]] 
GNP[[1]] # 벡터도 마찬가지로 [[]]를 쓰면 이름을 포함하지 않고 출력

# 2-22
bt <- c('A', 'B', 'B', 'O', 'AB', 'A')
bt.new <- factor(bt)
bt
bt.new 
bt[5] 
bt.new[5] 
levels(bt.new)
levels(bt.new)[5] <- "C"
as.integer(bt.new) 
bt.new[7] <-'B'
bt.new[8] <-'C' 
bt.new
sort(levels(bt.new))
levels(bt.new) <- sort(levels(bt.new))
sort(levels(bt.new))
