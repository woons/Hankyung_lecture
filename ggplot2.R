##############################################
# 차트 제작 (데이터는 내장데이터)
##############################################
library(gcookbook)

#Bar Chart 제작
#gcookbook의 pg_mean 데이터 활용
str(cabbage_exp)
ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) + 
  geom_bar(stat = "identity", position = "dodge") #dodge를 쓰지 않으면 누적막대가 된다

#음수와 양수를 표현
bar.data <- climate %>% filter(Source == "Berkeley" & Year >= 1900)
bar.data$test <- bar.data$Anomaly10y >= 0 #True/False 구분(fill)
ggplot(bar.data, aes(Year, Anomaly10y, fill=test)) +
  geom_bar(stat = "identity", position = "identity") + 
  ylab("value") + 
  xlab("year")


#Histogram 제작
#diamonds 데이터 활용
str(diamonds)
ggplot(diamonds, aes(x=cut)) + geom_histogram(stat = "count") #histogram의 성격상 count

#Linegraph는 앞서 실습한 사교육비 데이터 활용
#group을 묶어주는 것을 유의
ggplot(long.table, aes(x=year, y=price, group=category, colour =category)) +
  geom_line() +
  ggtitle("학생 1인당 사교육비 평균/학교 분류별")
