# ---- File: 11-1.R ----
rm(list=ls())

str(cars)
head(cars)

# 다음은 동일한 그래프, 레이블만 다름
plot(dist~speed, data=cars)    # 산점도를 통해 선형 관계 확인
plot(cars$speed, cars$dist)    # 산점도를 통해 선형 관계 확인

# lm: linear model
# 종속변수 ~ 독립변수
model <- lm(dist~speed, cars)  # 회귀모델 구하기
model

abline(model)                  # 회귀선을 산점도 위에 표시
abline(model, col = "blue", lty = "dashed", lwd = 2)

coef(model)
coef(model)[1]                 # b 값 출력, 절편
coef(model)[2]                 # W 값 출력, 계수

############################
model[1] # 절편과 계수
model[2] # 잔차(실제[관측]값 - 예측값) 목록
class(model)

predict(model) # 예측값
# 잔차 (실제[측정]값 - 예측값) 직접 계산
cars[, 2] - predict(model) 

# model의 잔차(res)와 
# 직접 계산해 본 잔차(self)로 데이터프레임 생성
df = data.frame(res=model[2], self=cars[, 2] - predict(model))
df


# ---- File: 11-2.R ----
b <- coef(model)[1]
W <- coef(model)[2]

speed <- 30            # 주행속도
dist <- W*speed + b
dist                   # 제동거리

speed <- 35            # 주행속도
dist <- W*speed + b
dist                   # 제동거리

speed <- 40            # 주행속도
dist <- W*speed + b
dist                   # 제동거리


# ---- File: 11-3.R ----
speed <- cars[,1]                   # 주행속도
pred <- W * speed + b
pred                                # 예상 제동거리

compare <- data.frame(pred, cars[,2], cars[,2] - pred)
compare

colnames(compare) <- c('예상','실제','오차')
head(compare)

# 간단히 다음으로 가능
pred = predict(model)

#############################
# 새로운 관측값
new_data <- data.frame(speed = c(10, 15, 20))  # 주행 속도 10, 15, 20

# 예측값 생성
predicted_distances <- predict(model, newdata = new_data)
predicted_distances

########################################
compare[,3]
res <- model[2]$residuals # 잔차(실제[관측]값 - 예측값) 목록
as.vector(res)

