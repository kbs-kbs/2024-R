# == Start of 10-5.R ==
if (!require("arules")) {
  install.packages("arules")
}
library(arules)                 # 아프리오리 알고리즘

if (!require("arulesViz")) {
  install.packages("arulesViz")
}
library(arulesViz)              # 연관규칙 시각화 도구

# 데이터 불러오기와 관찰
# setwd("D:/source")
# R에서 폴더 구분자는 /와 \\ 사용 가능
getwd()
ds <- read.csv("Ch10/BreadBasket_DMS.csv")    # 거래 데이터 읽기
# 다음도 가능: \\이 필요
# ds <- read.csv("Ch10\\BreadBasket_DMS.csv")    # 거래 데이터 읽기
str(ds)
head(ds)
unique(ds$Item)

# 'NONE' item 삭제
ds.new <- subset(ds, Item != 'NONE')
write.csv(ds.new, "Ch10\\BreadBasket_DMS_upd2.csv", row.names=F)

# 트랜잭션 포맷으로 데이터 읽기
# 인자, cols=list(c(transactionID, itemID))
trans <- read.transactions("Ch10\\BreadBasket_DMS_upd.csv", format="single", 
                           header=T, cols=c(3,4), sep=",", rm.duplicates=T)
trans                          # 트랜잭션 데이터 요약 정보

dimnames(trans)

dimnames(trans)[[2]]           # 상품 목록 확인
toLongFormat(trans)            # 거래별 상품 목록

inspect(head(trans, 10))       # 앞부분 10개 트랜잭션 출력
inspect(tail(trans, 10))       # 뒷부분 10개 트랜잭션 출력



# == End of 10-5.R ==

# == Start of 10-6.R ==
# 상품 판매 빈도
itemFrequencyPlot(trans, topN=10, type="absolute", xlab="상품명", 
                  ylab="절대 판매빈도", main="판매량 많은 상품", col="green")
itemFrequencyPlot(trans, topN=10, type="relative", xlab="상품명", 
                  ylab="상대 판매빈도", main="판매량 많은 상품", col="blue")

# 연관규칙 찾기
rules <- apriori(trans, parameter = list(supp = 0.001, conf = 0.7))
rules

summary(rules)
# 앞쪽 10개의 규칙 출력 
# options(digits = 2)**는 숫자의 표시 자리수를 지정하는 데 사용
# 출력되는 숫자의 총 유효숫자(significant digits)를 제한하는 역할
options(digits=2)              # 평가척도 값의 자리수 지정         
inspect(rules[1:5])
options(digits=5)              # 평가척도 값의 자리수 지정         
inspect(rules[1:10])
inspect(rules)

# 향상도 순위 출력 
lift.sort <- sort(rules, by='lift', decreasing = T)
inspect(lift.sort)
# 지지도 순위 출력 
support.sort <- sort(rules, by='support', decreasing = T)
inspect(support.sort)

# 신뢰도 상위 10개 규칙 출력 
rules.sort <- sort(rules, by='confidence', decreasing = T)
inspect(rules.sort[1:10])

# 산점도 (지지도-향상도) 
plot(rules.sort, measure=c("support", "lift"), shading="confidence")
plot(rules.sort, measure=c("confidence", "lift"), shading="support")
plot(rules.sort, measure=c("confidence", "lift"), jitter=T, shading="support")

# Graph plot
plot(rules.sort, method="graph")

# Grouped Matrix Plot
plot(rules.sort, method="grouped")

## 연관규칙 저장
write(rules.sort, file="Ch10\\BreadBasket_rules.csv",
      sep=',', quote=T, row.names=F)


# == End of 10-6.R ==

