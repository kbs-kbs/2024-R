# ----- 4-6.R -----
for(i in 1:5) {
  print('*')
}


# ----- 4-7.R -----
for(i in 6:10) {
  print(i)
}


# ----- 4-8.R -----
for(i in 1:9) {
  cat('2 *', i, '=', 2*i, '\n') 
}

for(i in 1:9) {
  cat('2 *', i,'=', 2*i, ' ') 
}


# ----- 4-9.R -----
for (i in 1:20) {
  if (i%%2 == 0) {     # 짝수인지 확인
    print(i)
  }
}

# ----- 4-10.R -----
sum <- 0
for (i in 1:100) {
  sum <- sum + i    # sum에 i 값을 누적
}
print(sum)


# ----- 4-11.R -----
norow <- nrow(iris)                             # iris의 행의 수
mylabel <- c()                                  # 비어있는 벡터 선언

for(i in 1:norow) {
  if (iris$Petal.Length[i] <= 1.6) {            # 꽃잎의 길이에 따라 레이블 결정
    mylabel[i] <- 'L'
  } else if (iris$Petal.Length[i] >= 5.1) {
    mylabel[i] <- 'H'
  } else {
    mylabel[i] <- 'M'
  }
}
print(mylabel)                                  # 레이블 출력
newds <- data.frame(iris$Petal.Length, mylabel) # 꽃잎의 길이와 레이블 결합
head(newds)                                     # 새로운 데이터셋 내용 출력


# ----- 4-12.R -----
sum <- 0
i <- 1
while(i <=100) {
  sum <- sum + i      # sum에 i 값을 누적
  i <- i + 1          # i 값을 1 증가시킴
}
print(sum)


# ----- 4-13.R -----
sum <- 0
for(i in 1:10) {
  sum <- sum + i
  if (i>=5) break
}
sum # 1 + ... + 5


# ----- 4-14.R -----
sum <- 0
for(i in 1:10) {
  if (i%%2==0) next
  sum <- sum + i
}
sum

##### repeat 무한반복

repeat {
  num <- as.numeric(readline(prompt = "숫자를 입력하세요 (0을 입력하면 종료): "))
  if (num == 0) {
    cat("프로그램을 종료합니다.\n")
    break
  }
  cat("입력한 숫자:", num, "\n")
}



