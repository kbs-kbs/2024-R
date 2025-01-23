# ch08-sect2.R

# ggplot은
# 1. 데이터
# 2. 미학적 매핑(aesthetic mapping)
# 3. 기하적 객체(geometric objects)
# 로 구성


# 8-5.R
library(ggplot2)

month <- c(1,2,3,4,5,6)
rain <- c(55,50,45,50,60,70)
df <- data.frame(month,rain)         # 그래프를 작성할 대상 데이터
df

# https://ggplot2.tidyverse.org/
ggplot(df, aes(x=month, y=rain)) +   # x, y에는 컬럼명을 전달
  geom_bar(stat="identity",          # 막대의 높이는 y축에 해당하는 열의 값
           width=0.7,                # 막대의 폭 지정
           fill="steelblue")         # 막대의 색 지정

ggplot(mpg, aes(displ, hwy, colour = class)) + 
  geom_point()

# 8-6.R
ggplot(df, aes(x=month,y=rain)) +         # 그래프를 그릴 데이터 지정
  geom_bar(stat="identity",               # 막대 높이는 y축에 해당하는 열의 값
           width=0.7,                     # 막대의 폭 지정
           fill="steelblue") +            # 막대의 색 지정
  ggtitle("월별 강수량") +                # 그래프의 제목 지정
  theme(plot.title = element_text(size=25, face="bold", colour="steelblue")) +
  labs(x="월",y="강수량") +               # 그래프의 x, y축 레이블 지정
  coord_flip()                            # 그래프를 가로 방향으로 출력

ggplot(df, aes(x=month,y=rain)) +         # 그래프를 그릴 데이터 지정
  geom_bar(stat="identity",               # 막대 높이는 y축에 해당하는 열의 값
           width=0.7,                     # 막대의 폭 지정
           fill="wheat") +                # 막대의 색 지정
  ggtitle("월별 강수량") +                # 그래프의 제목 지정
  theme(plot.title = element_text(size=25, face="bold", colour="steelblue")) +
  labs(x="월",y="강수량")                 # 그래프의 x, y축 레이블 지정

# 다음 코드에서 y축 레이블 '월'을 정상적으로 표시
ggplot(df, aes(x=month, y=rain)) +        # 그래프를 그릴 데이터 지정
  geom_bar(stat="identity",               # 막대 높이는 y축에 해당하는 열의 값
           width=0.7,                     # 막대의 폭 지정
           fill="steelblue") +            # 막대의 색 지정
  ggtitle("월별 강수량") +                # 그래프의 제목 지정
  theme(plot.title = element_text(size=25, face="bold", colour="steelblue"),
        axis.title.y = element_text(angle=0, vjust=0.5)) +  # y축 레이블을 세로로 회전
  labs(x="월", y="강수량") +               # 그래프의 x, y축 레이블 지정
  coord_flip()                            # 그래프를 가로 방향으로 출력

# 8-7.R
library(ggplot2)

ggplot(iris, aes(x=Petal.Length)) +    # 그래프를 그릴 데이터 지정
  geom_histogram(binwidth=0.5)         # 히스토그램 작성

ggplot(iris, aes(x=Petal.Length)) +    # 그래프를 그릴 데이터 지정
  geom_histogram(binwidth=1)           # 히스토그램 작성

# 8-8.R
library(ggplot2)

range(iris$Sepal.Width)
ggplot(iris, aes(x=Sepal.Width)) + 
  geom_histogram(binwidth = 0.5)  

ggplot(iris, aes(x=Sepal.Width, fill=Species, color=Species)) + 
  geom_histogram(binwidth = 0.5, position="dodge") + 
  theme(legend.position="top")

ggplot(iris, aes(x=Sepal.Width, fill=Species, color="red")) + 
  geom_histogram(binwidth = 0.5, position="dodge") + 
  theme(legend.position="top")

ggplot(iris, aes(x=Sepal.Width, fill=Species, color=Species)) + 
  geom_histogram(binwidth = 0.5, position="stack") + 
  theme(legend.position="top")

ggplot(iris, aes(x=Sepal.Width, fill=Species, color=Species)) + 
  geom_histogram(binwidth = 0.5, position="dodge") + 
  theme(legend.position="left")

ggplot(iris, aes(x=Sepal.Width)) + 
  geom_histogram(binwidth = .5) + 
  theme(legend.position="top")

# mfrow: multi-figure by row
par(mfrow = c(2, 2))  # 순서: 왼쪽에서 오른쪽, 위에서 아래
plot(1:10, main = "Plot 1")
plot(1:10, main = "Plot 2")
plot(1:10, main = "Plot 3")
plot(1:10, main = "Plot 4")
par(mfrow = c(1, 1))

par(mfcol = c(2, 2))  # 순서: 위에서 아래, 왼쪽에서 오른쪽
plot(1:10, main = "Plot 1")
plot(1:10, main = "Plot 2")
plot(1:10, main = "Plot 3")
plot(1:10, main = "Plot 4")
par(mfrow = c(1, 1))

##################################################
# ggplot은 위 방법으로 안되고 다음으로 처리
library(ggplot2)
library(gridExtra)

# 각 플롯 정의
p1 <- ggplot(iris, aes(x=Sepal.Width)) + 
  geom_histogram(binwidth = .5) + 
  theme(legend.position="top")

p2 <- ggplot(iris, aes(x=Sepal.Width, fill=Species, color=Species)) + 
  geom_histogram(binwidth = 0.5, position="dodge") + 
  theme(legend.position="left")

# 플롯 배열, 1행 2열로 그리기
grid.arrange(p1, p2, nrow = 2, ncol = 1)

#################################################
# 구간과 빈도수 알기
# 히스토그램 생성
p1 <- ggplot(iris, aes(x = Sepal.Width)) + 
  geom_histogram(binwidth = 0.5)

# 계산된 데이터 확인
gg_data <- ggplot_build(p1)$data[[1]]
print(gg_data[c('y', 'xmin', 'xmax')])

# 히스토그램 생성 및 빈도수 레이블 추가
ggplot(iris, aes(x = Sepal.Width)) + 
  geom_histogram(binwidth = 0.5, fill = "steelblue", color = "black") +
  geom_text(stat = "bin", aes(label = ..count..), binwidth = 0.5, vjust = -0.5) +
  labs(x = "Sepal Width", y = "Count")

###################################################


# 8-9.R
library(ggplot2)

ggplot(data=iris, aes(x=Petal.Length, y=Petal.Width)) + 
  geom_point()

# 8-10.R
library(ggplot2)

ggplot(data=iris, aes(x=Petal.Length, y=Petal.Width, color=Species)) +
  geom_point(size=3) +
  ggtitle("꽃잎의 길이와 폭") +              # 그래프의 제목 지정
  theme(plot.title = element_text(size=25, face="bold", colour="steelblue"))

# 8-11.R
library(ggplot2)

ggplot(data=iris, aes(y=Petal.Length)) + 
  geom_boxplot(fill="yellow") 

# 8-12.R
library(ggplot2)

ggplot(data=iris, aes(y=Petal.Length, fill=Species)) + 
  geom_boxplot() 

str(iris)
boxplot(iris$Petal.Length ~ iris$Species, iris, 
        col = c("lightgray", "yellow", "skyblue"))

# 8-13.R
library(ggplot2)

airmiles
year <- 1937:1960
cnt <- as.vector(airmiles)
df <- data.frame(year,cnt)             # 데이터 준비
head(df)

ggplot(data=df, aes(x=year,y=cnt)) +   # 선그래프 작성
  geom_line(col="red")

plot(airmiles)
