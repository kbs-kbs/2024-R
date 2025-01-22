# ----- 4-1.R -----
job.type <- 'A'
job.type

if(job.type == 'B') {
  bonus <- 200          # 직무 유형이 B일 때 실행
} else {
  bonus <- 100          # 직무 유형이 B가 아닌 나머지 경우 실행
}
print(bonus)

#############################
x <- 5

if (x > 0)
  print("x는 양수입니다.") else
print("x는 0이거나 음수입니다.")

if (x > 0) print("x는 양수입니다.") else print("x는 0이거나 음수입니다.")

#### 오류 발생
x <- -5

if (x > 0) 
  print("양수입니다.") 
else 
  print("음수이거나 0입니다.")

########################

# ----- 4-2.R -----
job.type <- 'A'
bonus <- 100

if(job.type == 'A') {
  bonus <- 200            # 직무 유형이 A일 때 실행
}
print(bonus)


if (job.type == 'A') 
  bonus <- 300            # 직무 유형이 A일 때 실행

print(bonus)


# ----- 4-3.R -----
score <- 85

if (score > 90) {
  grade <- 'A' 
} else if (score > 80) {
  grade <- 'B' 
} else if (score > 70) {
  grade <- 'C' 
} else if (score > 60) {
  grade <- 'D' 
} else {
  grade <- 'F' 
}

print(grade)

# ----- 4-4.R -----
a <- 10
b <- 20
if (a>5 & b>5) {         # and 사용
  print (a+b)
}
if (a>5 | b>30) {        # or 사용
  print (a*b)
}


# ----- 4-5.R -----
a <- 10
b <- 20

if (a>b) {
  c <- a
} else {
  c <- b
}
print(c)

a <- 10
b <- 20

c <- ifelse(a>b, a, b)
print(c)


