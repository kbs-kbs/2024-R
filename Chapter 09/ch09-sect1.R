# == Start of 9-1.R ==
rm(list = ls())

if (!require(ggmap)) {
  install.packages("ggmap")
  library(ggmap)
}

library(ggplot2)

# 구글키 등록 
# register_google(key='AIzaSyAswQPQNwwiqJataTBpgM')  
register_google(key='AIzaSyCIyj47e5iM')  

gc <- geocode(enc2utf8("종로구"))             # 지점의 경도 위도
gc

# 구글키 없이 실행, 안됨
# lon <- 126.9773
# lat <- 37.59492
# gc <- data.frame(lon, lat)
# gc

cen <- as.numeric(gc)                         # 경도 위도를 숫자로
cen

# 직접 입력
# cen <- c(126.97936, 37.57295)

map <- get_googlemap(center=cen)              # 지도 생성
ggmap(map)                                    # 지도 화면에 보이기

######################
ggmap(get_googlemap(center=c(127, 36)))                                    

# == End of 9-1.R ==

# == Start of 9-2.R ==
# library(ggmap)
# register_google(key='AIzaSyCK...E9urxjSpPOA')    # 구글키 등록

gc <- geocode(enc2utf8("설악산"))                  # 지점의 경도 위도
cen <- as.numeric(gc)                              # 경도 위도를 숫자로

# zoom은 클수록 자세히...
map <- get_googlemap(center=cen,                   # 지도의 중심점 좌표
                     zoom=9,                       # 지도 확대 정도
                     size=c(640,640),              # 지도의 크기
                     maptype="roadmap")            # 지도의 유형
ggmap(map)                                         # 지도 화면에 보이기

map <- get_googlemap(center=cen,                   # 지도의 중심점 좌표
                     zoom=5,                       # 지도 확대 정도
                     size=c(640,640),              # 지도의 크기
                     maptype="terrain")            # 지도의 유형
ggmap(map)                                         # 지도 화면에 보이기

map <- get_googlemap(center=cen,                   # 지도의 중심점 좌표
                     zoom=6,                       # 지도 확대 정도
                     size=c(640,640),              # 지도의 크기
                     maptype="satellite")            # 지도의 유형
ggmap(map)                                         # 지도 화면에 보이기

map <- get_googlemap(center=cen,                   # 지도의 중심점 좌표
                     zoom=7,                       # 지도 확대 정도
                     size=c(640,640),              # 지도의 크기
                     maptype="hybrid")            # 지도의 유형
ggmap(map)                                         # 지도 화면에 보이기

# == End of 9-2.R ==

# == Start of 9-3.R ==
# library(ggmap)
# register_google(key='AIzaSyCK...E9urxjSpPOA')   # 구글키 등록

cen <- c(-118.233248, 34.085015)
map <- get_googlemap(center=cen)                  # 지도 생성
ggmap(map)                                        # 지도 화면에 보이기

map <- get_googlemap(center=cen, zoom=15)         # 지도 생성
ggmap(map)                                        # 지도 화면에 보이기


# 구글 맵에서 장소를 오른쪽 버튼 클릭, 복사
cen <- c(126.868108, 37.500672)
map <- get_googlemap(center=cen, zoom=18)         # 지도 생성
ggmap(map)                                        # 지도 화면에 보이기


cen <- c(42.65123280829528, 18.091471597437906)
map <- get_googlemap(center=cen, zoom=8)         # 지도 생성
ggmap(map)                                        # 지도 화면에 보이기

# == End of 9-3.R ==

# == Start of 9-4.R ==
# library(ggmap)
# register_google(key='AIzaSyCK...E9urxjSpPOA')   # 구글키 등록

gc <- geocode(enc2utf8("용인"))                   # 지점의 경도와 위도
cen <- as.numeric(gc)                             # 경도와 위도를 숫자로
map <- get_googlemap(center=cen,                  # 지도의 중심
                     maptyp="roadmap",            # 지도의 형태
                     marker=gc)                   # 마커의 위치
ggmap(map)                                        # 지도 화면에 보이기

# == End of 9-4.R ==

# == Start of 9-5.R ==
# library(ggmap)
# register_google(key='AIzaSyCK...E9urxjSpPOA') # 구글키 등록
library(ggplot2)

names <- c("용두암","성산일출봉","정방폭포",
           "중문관광단지","한라산1100고지","차귀도")
addr <- c("제주시 용두암길 15",
          "서귀포시 성산읍 성산리",
          "서귀포시 동홍동 299-3",
          "서귀포시 중문동 2624-1",
          "서귀포시 색달동 산1-2",
          "제주시 한경면 고산리 125")
gc <- geocode(enc2utf8(addr)) # 주소를 경도와 위도로 변환

gc
as.data.frame(gc)

# 관광지 명칭과 좌표값으로 데이터프레임 생성
df <- data.frame(name=names,
                 lon=gc$lon,
                 lat=gc$lat)
df

cen <- c(mean(df$lon),mean(df$lat)) # 지도의 중심점
map <- get_googlemap(center=cen, # 지도 가져오기
                     maptype="roadmap", # 지도의 형태
                     zoom=10, # 지도의 확대 크기
                     size=c(640,640), # 지도의 크기
                     marker=gc) # 마커의 위치
ggmap(map) # 지도와 마커 화면에 보이기

# 명소 이름 지도 위에 표시하기
gmap <- ggmap(map)
gmap + geom_text(data=df, # 지도 위에 텍스트 표시
                 aes(x=lon,y=lat), # 텍스트 위치(관광지 좌표)
                 size=5, # 텍스트 크기
                 label=df$name) # 텍스트 내용

# == End of 9-5.R ==

# == Start of 9-6.R ==
# install.packages("ggmap")
# library(ggmap)
# library(ggplot2)

# 구글키 등록 
# register_google(key='AIzaSyCK...E9urxjSpPOA')  

wind
str(wind)
head(wind)

# 데이터 준비
sp <- sample(1:nrow(wind),50)                    # 50개 데이터 샘플링
df <- wind[sp,]
head(df)

cen <- c(mean(df$lon), mean(df$lat))             # 지도의 중심점 계산
gc <- data.frame(lon=df$lon, lat=df$lat)         # 측정 위치 좌표값 데이터
head(gc)

# 측정 위치에 마커 표시하기
map <- get_googlemap(center=cen,
                     maptype="roadmap",
                     zoom=6,
                     marker=gc)
ggmap(map)

# 풍속을 원의 크기로 표시하기
map <- get_googlemap(center=cen,           # 마커 없는 지도 가져오기
                     maptype="roadmap",
                     zoom=6)
gmap <- ggmap(map)                         # 지도를 저장
gmap +
  geom_point(data=df,                      # 풍속을 원의 크기로 표시
             aes(x=lon,y=lat,size=spd),
             alpha=0.5,
             col="blue") +
  scale_size_continuous(range = c(1, 14))  # 원의 크기 조절

gmap + 
  geom_point(data=df,                      # 풍속을 원의 크기로 표시
             aes(x=lon,y=lat,size=spd),
             alpha=0.3,
             col="green") +
  scale_size_continuous(range = c(1, 14))  # 원의 크기 조절

gmap + 
  geom_point(data=df,                      # 풍속을 원의 크기로 표시
             aes(x=lon,y=lat,size=spd),
             alpha=0.3,
             col="red")

# == End of 9-6.R ==

