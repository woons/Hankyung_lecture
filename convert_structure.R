##############################################
# 가로형 <-> 세로형 데이터 변환
##############################################
library(tidyverse)
library(ggplot2)

#가로형 데이터를 read
cross.table <- read.csv("education.csv", stringsAsFactors = F)

#데이터 구조 파악
str(cross.table)

#칼럼 이름은 영문으로
colnames(cross.table) <- c("year", "elementary", "middle", "high", "general")

#가로형에서 세로형 변환
long.table <- gather(cross.table, "category", "price", 2:5)

#세로형에서 가로형 변환
wide.table <- spread(long.table, "category", "price")

##################################################
# 배운거 실습 (가로형에서 세로형)
# 서울통계 : 실질임금 상승률/전년도 대비 증감률(%)
##################################################

practice.str <- read.csv("salary.csv", stringsAsFactors = F)



#시각화
ggplot(long.table, aes(x=year, y=price, group=category, colour =category)) +
  geom_line() +
  ggtitle("학생 1인당 사교육비 평균/학교 분류별")

#일러스트레이터에서 세부적인 디자인 작업
