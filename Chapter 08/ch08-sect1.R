# ch08-sect1.R

# 8-1.R
if (!require(treemap)) {
  install.packages("treemap")
}

library(treemap)    # treemap 패키지 불러오기

# 데이터셋 GNI2014
# iso3: 국가의 ISO 3166-1 알파-3 코드.
# country: 국가 이름.
# continent: 국가가 속한 대륙.
# population: 2014년의 인구 수.
# GNI: 2014년의 국민총소득 (백만 달러 단위).

data(GNI2014)                          # 데이터 불러오기
GNI2014
str(GNI2014)
head(GNI2014)                          # 데이터 내용보기

# Korea, Rep.
GNI2014[GNI2014$country == "Korea, Rep.", ]
GNI2014[which(GNI2014$country == "Korea, Rep."), ]
grep("Korea", GNI2014$country, ignore.case = TRUE)
GNI2014[grep("korea", GNI2014$country, ignore.case = TRUE), ]

treemap(GNI2014,
        index=c("continent","iso3"),   # 계층구조 설정(대륙-국가)
        vSize="population",            # 타일의 크기
        vColor="GNI",                  # 타일의 컬러
        type="value",                  # 타일 컬러링 방법
        title="World's GNI")           # 트리맵 제목

treemap(GNI2014,
        index=c("continent","iso3"),   # 계층구조 설정(대륙-국가)
        vSize="population",            # 타일의 크기
        vColor="GNI",                  # 타일의 컬러
        type="index",                  # 팔레트 색상으로 지정
        title="World's GNI")           # 트리맵 제목

# 디바이스 크기 조정
png("2222.png", width=1400, height=900)
treemap(GNI2014,
        index = c("continent", "iso3"),
        vSize = "population",
        vColor = "GNI",
        type = "value",
        title = "Large Treemap: Global Population and GNI")
dev.off()

# 8-2.R
library(treemap)                             # treemap 패키지 불러오기
st <- data.frame(state.x77)                  # 매트릭스를 데이터프레임으로 변환
str(st)
st

rownames(st)

st <- data.frame(st, stname=rownames(st))    # 주 이름에 대한 열 stname을 추가
str(st)

treemap(st,
        index=c("stname"),                   # 타일에 주 이름 표기
        vSize="Area",                        # 타일의 크기
        vColor="Income",                     # 타일의 컬러
        type="value",                        # 타일 컬러링 방법
        title="USA states area and income" ) # 트리맵의 제목

treemap(st,
        index=c("stname"),                   # 타일에 주 이름 표기
        vSize="Population",                  # 타일의 크기
        vColor="Murder",                     # 타일의 컬러
        type="value",                        # 타일 컬러링 방법
        title="USA states area and income" ) # 트리맵의 제목

# 8-3.R
st <- data.frame(state.x77)        # 매트릭스를 데이터프레임으로 변환

symbols(st$Illiteracy, st$Murder,  # 원의 x, y 좌표의 열
        circles=st$Population,     # 원의 반지름의 열
        inches=0.2,                # 원의 크기 조절값
        fg="skyblue",              # 원의 테두리 색
        bg="lightgray",            # 원의 바탕색
        lwd=1.5,                   # 원의 테두리선 두께
        xlab="rate of Illiteracy",
        ylab="crime(murder) rate",
        main="Illiteracy and Crime")

text(st$Illiteracy, st$Murder,     # 텍스트가 출력될 x, y 좌표
     rownames(st),                 # 출력할 텍스트
     cex=0.6,                      # 폰트 크기
     col="brown")                  # 폰트 컬러

# 살인률 최고 10개
st[order(st$Murder, decreasing = T), ][1:10, ]
# 문맹률 최고 10개
st[order(st$Illiteracy, decreasing = T), ][1:10, ]

# 8-4.R
head(mtcars)
mosaicplot(vs~gear, data = mtcars, color=TRUE, 
           main ="Gear and Vs")
mosaicplot(~gear+vs, data = mtcars, color=c("green","blue"),
           main ="Gear and Vs")

tbl = table(mtcars$gear, mtcars$vs)
tbl
mosaicplot(tbl, color=c("green","blue"),
           main ="Gear and Vs")

# 축 교환
tbl = table(mtcars$vs, mtcars$gear)
tbl
mosaicplot(tbl, color=c("green","blue"),
           main ="Gear and Vs")

# 데이터셋 로드
data(UCBAdmissions)
# 데이터셋 구조
str(UCBAdmissions)
class(UCBAdmissions)
is.table(UCBAdmissions)

# 차원 이름 확인
dimnames(UCBAdmissions)

UCBAdmissions
ucb <- UCBAdmissions
ucb[,,'A']

mosaicplot(~Gender+Admit, data = UCBAdmissions, color=TRUE, 
           main ="UC Berkeley Admissions")
mosaicplot(~Admit+Gender, data = UCBAdmissions, color=c("red","gray"), 
           main ="UC Berkeley Admissions")

# 종료

# 파이썬에서 다차원 배열은 모양이 (3, 4, 2)일 때
# 3개의 4행 2열 테이블이 보여짐
# R에서는 모양이 (3, 4, 2)일 때
# 3행 4열 2개 생성

