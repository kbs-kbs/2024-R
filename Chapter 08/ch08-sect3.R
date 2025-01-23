# ch08-sect3.R

# R 언어에서 t-SNE(t-Distributed Stochastic Neighbor Embedding)
# 알고리즘을 구현한 패키지입니다. t-SNE는 고차원 데이터를 
# 저차원(보통 2D 또는 3D)으로 임베딩하는 데 사용되는 
# 비선형 차원 축소 방법으로, 데이터의 구조적 패턴을 
# 시각화하는 데 매우 유용

# 필요한 패키지 설치
if (!require("Rtsne")) {
  install.packages("Rtsne")
}

# 패키지 로드
library(Rtsne)
library(ggplot2)


# 중복된 행 번호 찾기
ds <- iris[,-5]             # 품종 정보 제외
duplicated_rows <- which(duplicated(ds) | duplicated(ds, fromLast = TRUE))
duplicated_rows
ds[duplicated_rows, ]
iris[duplicated_rows, ]
# 결과 출력
print(duplicated_rows)

# 데이터 준비
ds <- iris[,-5]             # 품종 정보 제외
dup <- which(duplicated(ds)) # 중복 데이터 확인
dup
ds <- ds[-dup,]             # 중복 데이터 제거
str(ds)
ds.y <- iris$Species[-dup]  # 중복을 제외한 품종 정보

# t-SNE 실행 (2차원)
tsne_2d <- Rtsne(ds, dims=2, perplexity=10)
# 결과
tsne_2d$Y

# 2차원 축소 결과 시각화
df.tsne_2d <- data.frame(tsne_2d$Y)
ggplot(df.tsne_2d, aes(x=X1, y=X2, color=ds.y)) +
  geom_point(size=2)

install.packages(c("rgl", "car"))
# car(Companion to Applied Regression) 패키지는 
# R에서 회귀 분석과 통계 분석을 위한 도구를 제공하는 
# 강력한 패키지
library("car")

# R: R 프로그래밍 언어
# GL: OpenGL(Open Graphics Library)의 약자
# 3D 그래프 생성 및 시각화 패지지
library("rgl") # R Graphics Library

# mgcv는 일반화 가법 모델(Generalized Additive Models, GAM)을 
# 지원하는 R 패키지
# 일반화 가법 모델(GAM, Generalized Additive Models)
library("mgcv") # Mixed GAM Computation Vehicle

# t-SNE 실행 (3차원)
tsne_3d <- Rtsne(ds, dims=3, perplexity=10)
df.tsne_3d <- data.frame(tsne_3d$Y)

# 3차원 산점도 시각화
points <- as.integer(ds.y)
color <- c('red','green','blue')

# 3차원 산점도: 회귀면 없음
scatter3d(x=df.tsne_3d$X1, y=df.tsne_3d$X2, z=df.tsne_3d$X3,
          point.col=color[points], surface=FALSE)

# 3차원 산점도: 회귀면 포함
scatter3d(x=df.tsne_3d$X1, y=df.tsne_3d$X2, z=df.tsne_3d$X3,
          point.col=color[points], surface=TRUE)

## 추가 학습 ############
data(iris)
ds <- iris[, -5]  # 품종 정보 제외
ds <- ds[-which(duplicated(ds)),]             # 중복 데이터 제거
ds.y <- iris$Species[-dup]  # 중복을 제외한 품종 정보

# 작은 perplexity
tsne_small <- Rtsne(ds, dims = 2, perplexity = 5)

# 중간 perplexity
tsne_medium <- Rtsne(ds, dims = 2, perplexity = 10)

# 큰 perplexity
tsne_large <- Rtsne(ds, dims = 2, perplexity = 20)

# 결과 시각화
par(mfrow = c(1, 3))  # 3개의 그래프를 한 화면에 배치
plot(tsne_small$Y, col = ds.y, main = "Perplexity = 5", pch = 19)
plot(tsne_medium$Y, col = ds.y, main = "Perplexity = 10", pch = 19)
plot(tsne_large$Y, col = ds.y, main = "Perplexity = 20", pch = 19)

par(mfrow = c(1, 1))  # 1개의 그래프를 한 화면에 배치


