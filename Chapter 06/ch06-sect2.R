# 이전 메모리 제거
rm(list = ls())
dev.off()


# code 6-4
beers = c(5,2,9,8,3,7,3,5,3,5)                 # 자료 입력
bal <- c(0.1,0.03,0.19,0.12,0.04,0.0095,0.07,  # 자료 입력
         0.06,0.02,0.05)
tbl <- data.frame(beers,bal)                   # 데이터프레임 생성
tbl

# bal: y축에 표시될 종속변수
# beers: x축에 표시될 독립변수
# ~: y를 x의 함수로 나타냄.

plot(bal~beers, data=tbl)                 # 산점도
plot(bal~beers, tbl)                     # 산점도

res <- lm(bal~beers,data=tbl) # 회귀식 도출 즉, a, b를 구해서 일차함수 만들기
res # (intercept): y절편 beers(x): 기울기
summary(res) # Pr(>|t|)을 보면 y절편은 비교적 부정확, 기울기는 비교적 정확(*)한 것을 알수 있음.

plot(bal~beers, tbl) 
abline(res)                                    # 회귀선 그리기

plot(bal~beers, tbl) 
abline(res, col="red", lwd=2) # 덧그리기 때문에 위 코드가 필요

cor(beers,bal)                                 # 상관계수 계산
cor(bal, beers)                                 # 상관계수 계산

# code 6-5
cor(iris[,1:4])               # 4개 변수 간 상관성 분석
