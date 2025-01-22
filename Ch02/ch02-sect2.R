v3 <- seq(1,101,3)     
v3
v4 <- seq(0.1,1.0,0.1)   
v4

v5 <- rep(1,times=5)            # 1을 5번 반복
v5
v6 <- rep(1:5,times=3)          # 1에서 5까지 3번 반복
v6
v7 <- rep(c(1,5,9), times=3)    # 1, 5, 9를 3번 반복
v7
v8 <- rep(c(1,5,9), each=3)     # 1, 5, 9를 각각 3번 반복
v8

score <- c(90,85,70)                    # 성적
score
names(score)                            # score에 저장된 값들의 이름을 보이시오
names(score) <- c("John","Tom","Jane")  # 값들에 이름을 부여
names(score)                            # score에 저장된 값들의 이름을 보이시오
score                                   # 이름과 함께 값이 출력   

d <- c(1,4,3,7,8)
d[1]
d[2]
d[3]
d[4]
d[5]
d[6]

d <- c(1,4,3,7,8)
d[c(1,3,5)]             # 1, 3, 5번째 값 출력
d[1:3]                  # 처음 세 개의 값 출력
d[seq(1,5,2)]           # 홀수 번째 값 출력
d[-2]                   # 2번째 값 제외하고 출력
d[-c(3:5)]              # 3~5번째 값은 제외하고 출력

GNP <- c(2090,2450,960)
GNP
names(GNP) <- c("Korea","Japan","Nepal")
GNP
GNP[1]
GNP["Korea"]
GNP[c("Korea","Nepal")]
GNP[c(1, 3)]

