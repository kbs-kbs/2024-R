# ---- File: 11-4.R ----
rm(list=ls())
gc()

# R 패키지 **car**
# "Companion to Applied Regression"의 약자
# 회귀 분석 및 통계 모델을 지원하는 
# 다양한 도구를 제공하는 인기 있는 패키지
if (!require("car")) {
  install.packages("car")
  library(car)
}

# education: 평균 교육 수준.
# income: 평균 수입.
# women: 여성 비율(백분율).
# prestige: 사회적 명성 점수.
# census: 직업 식별 번호.
# type: 직업 유형(프로페셔널, 화이트칼라, 블루칼라).
head(Prestige)
str(Prestige)
class(Prestige)
sum(is.na(Prestige))
Prestige[!complete.cases(Prestige), ]
# 사회적 명성이 높은 직업부터 출력
Prestige[order(Prestige$prestige, decreasing=T), ]

# 열 census, type은 제거
newdata <- Prestige[,c(1:4)]        # 회귀식 작성을 위한 데이터 준비
head(newdata)
plot(newdata, pch=16, col="blue",   # 산점도를 통해 변수 간 관계 확인
     main="Matrix Scatterplot")
pairs(newdata)

model <- lm(income ~ education + prestige + women, # 회귀식 도출
           data=newdata)

# Pr(>|t|): t-검정의 p-value. 계수 추정치가 통계적으로 유의한지 확인
# **Pr(>|t|)**
# 회귀 계수의 t-검정 결과에서 계산된 p-value로, 
# 독립 변수가 종속 변수에 통계적으로 유의한 영향을 
# 미치는지 확인하는 지표입니다. 값이 작을수록 해당 변수는 
# 통계적으로 유의미하다고 해석할 수 있습니다.

# Adjusted R-squared (수정된 결정계수): 0.6323
# 독립 변수들이 종속 변수의 변동성을 약 63.23% 설명.

# F-statistic 값이 클수록 독립 변수들이 종속 변수에 
# 유의미한 영향을 미칠 가능성이 높아집니다.
# p-value < 0.05를 통해 더 직관적으로 귀무가설 기각 여부를 판단
# p-value (< 2.2e-16): 모델 전체가 통계적으로 유의함 
# (독립 변수들이 종속 변수에 유의미한 영향을 미침)
summary(model)

# 주석처리: ctrl + shift + c 
# ---- File: 11-5.R ----
library(MASS)                           # stepAIC() 함수 제공

str(Prestige)
newdata2 <- Prestige[,c(1:5)]           # 모델 구축에 사용할 데이터셋 생성
head(newdata2)

mod2 <- lm(income ~ education + prestige + women + census, 
           data= newdata2)

summary(mod2)

####################
# Akaike Information Criterion: 작을수록 좋음
# (1) 첫 번째 단계: 초기 모델 (AIC=1607.93)
# 초기 모델: income ~ education + prestige + women + census
# 각 변수에 대해 제거했을 때의 결과를 평가.
# **<none>**은 현재 모델을 유지한 경우의 AIC 값입니다 (AIC=1607.93).
# 변수 제거 시 AIC 변화:
# - census: RSS가 감소 (AIC=1606.0). AIC가 줄어들므로 census를 제거.
# - education: AIC=1606.8로 약간 감소. education은 아직 유지.
# - prestige, - women: AIC가 크게 증가. 두 변수는 중요하므로 유지.
# 결론: census 변수를 제거하고, 다음 단계로 이동합니다.
#
# (2) 두 번째 단계: 변수 census 제거 후 (AIC=1606.03)
# 새로운 모델: income ~ education + prestige + women
# 다시 각 변수에 대해 제거 시 AIC 변화를 평가.
# 변수 제거 시 AIC 변화:
# - education: RSS가 약간 증가 (AIC=1605.0). 
#              AIC가 줄어들므로 education 제거.
# - prestige, - women: AIC가 크게 증가. 두 변수는 유지.
# 결론: education 변수를 제거하고, 다음 단계로 이동합니다.
# 
# (3) 세 번째 단계: 변수 education 제거 후 (AIC=1604.96)
# 새로운 모델: income ~ prestige + women
# 이 모델이 현재 최적 상태로 판단.
# 변수 제거 시 AIC 변화:
#   - prestige: RSS가 크게 증가 (AIC=1685.1). 유지.
# - women: RSS가 크게 증가 (AIC=1634.2). 유지.
# 결론: 추가로 제거할 변수가 없으므로 
#       최적 모델은 income ~ prestige + women으로 결정됩니다.

# Multiple R-squared:   0.64,	Adjusted R-squared:  0.6327 
# Multiple R-squared
# 정의:
#   모델의 설명력을 나타내며, 독립 변수가 종속 변수의 변동성을
#   얼마나 설명하는지를 보여줍니다.
#   값은 0에서 1 사이에 위치하며, 
#   값이 1에 가까울수록 모델이 종속 변수의 변동성을 잘 
#   설명하고 있음을 의미합니다.
# Adjusted R-squared
# 정의:
#   Multiple R-squared의 단점을 보완한 지표로, 
#   독립 변수의 개수와 데이터의 자유도를 고려하여 
#   모델의 설명력을 조정한 값입니다.
#   모델에 불필요한 독립 변수를 추가했을 때, 설명력 증가가 미미하면 
#   값이 감소하도록 설계되었습니다.
mod3 <- stepAIC(mod2)                   # 변수 선택 진행
mod3                                    # 변수 선택 후 결과 확인

summary(mod3)                           # 회귀모델 상세 내용 확인

###################
# 위와 동일
mod2 <- lm(income ~ ., 
           data= newdata2)

summary(mod2)

# ---- File: 11-6.R ----
iris.new <- iris
iris.new$Species <- as.integer(iris.new$Species) # 범주형 자료를 정수로 변환
iris.new$Species

head(iris)
head(iris.new)

mod.iris <- glm(Species ~ ., data = iris.new)    # 로지스틱 회귀모델 도출
summary(mod.iris)                                # 회귀모델의 상세 내용 확인


# ---- File: 11-7.R ----
# 예측 대상 데이터 생성(데이터프레임)
unknown <- data.frame(rbind(c(5.1, 3.5, 1.4, 0.2)))
unknown

names(unknown) <- names(iris)[1:4]
unknown                             # 예측 대상 데이터

pred <- predict(mod.iris, unknown)  # 품종 예측
pred                                # 예측 결과 출력
round(pred,0)                       # 예측 결과 출력(소수 첫째 자리에서 반올림)

# 실제 품종명 알아보기
pred <- round(pred,0)
pred

levels(iris$Species)
levels(iris$Species)[pred]        

####### 세 개의 관측값을 예측 ###############
r1 = c(5.1, 3.5, 1.4, 0.2)
r2 = c(5.7, 2.8, 3.5, 1.2)
r3 = c(7.3, 3.5, 6.3, 2.6)

unknown <- data.frame(rbind(r1, r2, r3))
unknown

names(unknown) <- names(iris)[1:4]
unknown                             # 예측 대상 데이터

pred <- predict(mod.iris, unknown)  # 품종 예측
pred                                # 예측 결과 출력
round(pred,0)                       # 예측 결과 출력(소수 첫째 자리에서 반올림)

# 실제 품종명 알아보기
pred <- round(pred,0)
pred

levels(iris$Species)
levels(iris$Species)[pred]        


# ---- File: 11-8.R ----
test <- iris[,1:4]                  # 예측 대상 데이터 준비
pred <- predict(mod.iris, test)     # 모델을 이용한 예측
# 다음으로도 가능, 기존의 데이터이므로
# pred <- predict(mod.iris)     # 모델을 이용한 예측
pred <- round(pred,0)
pred                                # 예측 결과 출력

answer <- as.integer(iris$Species)  # 실제 품종 정보
pred == answer                      # 예측 품종과 실제 품종이 같은지 비교
iris[pred != answer, ]              # 

acc <- mean(pred == answer)         # 예측 정확도 계산
acc                                 # 예측 정확도 출력

146 / 150
sum(pred == answer) / nrow(iris)

