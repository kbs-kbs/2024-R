v1 <- c(1,5,7,8,9)
v1
v1[2] <- 3              # v1의 2번째 값을 3으로 변경
v1
v1[c(1,5)] <- c(10,20)  # v1의 1, 5번째 값을 각각 10, 20으로 변경
v1

d <- c(1,4,3,7,8)
2*d 
d-5
3*d+4 

x <- c(1,2,3)
y <- c(4,5,6)
x+y               # 대응하는 원소끼리 더하여 출력
x*y               # 대응하는 원소끼리 곱하여 출력
z <- x + y        # x, y를 더하여 z에 저장
z

d <- c(1,2,3,4,5,6,7,8,9,10)
sum(d)                          # d에 포함된 값들의 합
sum(2*d)                        # d에 포함된 값들에 2를 곱한 후 합한 값
length(d)                       # d에 포함된 값들의 개수
mean(d[1:5])                    # 1~5번째 값들의 평균
max(d)                          # d에 포함된 값들의 최댓값
min(d)                          # d에 포함된 값들의 최솟값
sort(d)                         # 오름차순 정렬
sort(d, decreasing = FALSE)     # 오름차순 정렬
sort(d, decreasing = TRUE)      # 내림차순 정렬
v1 <- median(d)
v1
v2 <- sum(d)/length(d)
v2

# 패러미터에서는 = 선호
sort(d, decreasing <- TRUE)     # 오름차순 정렬

# 함수 위에서 키 F1
help(sort)

d <- c(1,2,3,4,5,6,7,8,9)
d>=5
d[d>5]                    # 5보다 큰 값
sum(d>5)                  # 5보다 큰 값의 개수를 출력
sum(d[d>5])               # 5보다 큰 값의 합계를 출력
d==5
condi <- d > 5 & d < 8    # 조건을 변수에 저장
d[condi]                  # 조건에 맞는 값들을 선택

ds <- c(90, 85, 70, 84)
my.info <- list(name='Tom', age=60, status=TRUE, score=ds)
my.info                 # 리스트에 저장된 내용을 모두 출력
my.info[[1]]            # 리스트의 첫 번째 값을 출력
my.info$name            # 리스트에서 값의 이름이 name인 값을 출력
my.info[[4]]            # 리스트의 네 번째 값을 출력

## factror
# Factors in R
# Factors are used to handle categorical variables and store them as levels. 
# They are useful in statistical modeling.

# Example Code
# Creating a factor variable
fruit <- factor(c("apple", "banana", "apple", "cherry", "banana", "cherry", "apple"))

# Displaying the factor
print("Factor Variable:")
print(fruit)

# Checking the levels of the factor
print("Levels:")
print(levels(fruit))

# Modifying levels
levels(fruit) <- c("Apple", "Banana", "Cherry")
print("Modified Levels:")
print(fruit)

# Converting a factor to numeric values
numeric_values <- as.numeric(fruit)
print("Numeric Values:")
print(numeric_values)

# Summary of the factor
print("Summary of Factor:")
print(summary(fruit))

# Adding a new level 'Mango'
fruit <- factor(fruit, levels = c("Apple", "Banana", "Cherry", "Mango"))
print("Levels after adding Mango:")
print(levels(fruit))

# Adding new levels 'Grape'
levels(fruit) <- c(levels(fruit), "Grape")
print("Levels after adding Grape:")
print(levels(fruit))

fruit
as.integer(fruit)

levels(fruit) <- sort(c(levels(fruit)))
fruit[8] <- "Grape"
fruit[9] <- "Mango"
as.integer(fruit)

##########################################

bt <- c('A', 'B', 'B', 'O', 'AB', 'A')  # 문자형 벡터 bt 정의
bt.new <- factor(bt)                    # 팩터 bt.new 정의
bt                                      # 벡터 bt의 내용 출력
bt.new                                  # 팩터 bt.new의 내용 출력
bt[5]                                   # 벡터 bt의 5번째 값 출력
bt.new[5]  

# 팩터 bt.new의 5번째 값 출력
levels(bt.new)                          # 팩터에 저장된 값의 종류를 출력
as.integer(bt.new)                      # 팩터의 문자값을 숫자로 바꾸어 출력
bt.new[7] <- 'B'                        # 팩터 bt.new의 7번째에 'B' 저장
bt.new[8] <- 'C'                        # 팩터 bt.new의 8번째에 'C' 저장
bt.new                                  # 팩터 bt.new의 내용 출력


# 순서형 팩터 생성
sizes <- c("small", "large", "medium", "small", "large")
ordered_sizes <- factor(sizes, levels = c("small", "medium", "large"), ordered = TRUE)

ordered_sizes

