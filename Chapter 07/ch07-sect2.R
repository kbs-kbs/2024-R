# 이전 메모리 제거
rm(list = ls())

# code 7-7
state.x77 # matrix with 50 rows and 8 columns
str(state.x77) # 행 열 이름 확인
is.matrix(state.x77)
is.array(state.x77)
is.data.frame(state.x77)

st <- data.frame(state.x77)
str(st)
colnames(st)

boxplot(st$Income)
boxplot.stats(st$Income)$out # 이상값
boxplot(st$Income)$out

out.box <- boxplot(st$Income)
out.box
is.list(out.box) # 리스트 확인

quantile(st$Income)
quantile(st$Income, 0:3/4)
round(quantile(st$Income, 0:3/4))
summary(st$Income) # 기초 통계량

st <- data.frame(state.x77)
# 결과 구조
# $stats: 상자그림의 다섯 가지 요약값
# (최솟값, 1사분위수, 중앙값, 3사분위수, 최댓값).
# $n: 데이터의 관측값 개수.
# $conf: 95% 신뢰구간으로, 중앙값의 추정값이 해당 범위 내에 있을 가능성이 95%임을 의미.
# $out: 이상치(outliers) 값.
boxplot.stats(st$Income)
boxplot.stats(st$Income)$stats
boxplot.stats(st$Income)$n
boxplot.stats(st$Income)$conf # 신뢰구간 95% 내의 평균값 범위
boxplot.stats(st$Income)$out

#############################################
boxplot(st$Income)$stats
boxplot(st$Income)$n
boxplot(st$Income)$conf
boxplot(st$Income)$out
#############################################

# code 7-8
out.val <- boxplot.stats(st$Income)$out    # 특이값 추출
st$Income[st$Income %in% out.val] <- NA    # 특이값을 NA로 대체
head(st)
newdata <- st[complete.cases(st),]         # NA가 포함된 행 제거
head(newdata)

