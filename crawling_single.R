##############################################
# 서울연구원은 참고할만한
# 통계자료가 많기 때문에 스크래핑 하기 좋음
##############################################

library(rvest)
library(tidyverse)

##############################################
# 첫번째, 표를 긁어오기
##############################################

# 스크래핑할 URL 객체에 저장
url <- "https://www.si.re.kr/node/56694"
# 해당URL의 html 읽어보기
h <- read_html(url)

# h객체에 html 들어온 것을 확인했으면 table 가져오기
table <- html_table(h)

# table을 확인해보면 list 7개로 들어온 것을 알 수 있는데
# 표가 2개이기 때문에 1, 5번 표를 선택할 수 있다
table_1 <- data.frame(table[1])
colnames(table_1) <- c("year", "1995", "2000", "2005", "2010", "2015")

table_2 <- data.frame(table[5])
colnames(table_2) <- c("type", "year", "single", "apt", "couple", "multi", "etc", "total")

write.csv(table_1, "table1.csv")

##############################################
# 두번째, html 요소를 가져오기
##############################################

#url저장
url2 <- "http://ticket2.movie.daum.net/movie/movieranklist.aspx"

#html문서를 GET
h2 <- read_html(url2)

#가져온 html속에서 class가 ".ling_g"가 제목인것을 파악한 후 텍스트로 가져옴
movie.title <- html_nodes(h2, ".link_g") %>% 
  html_text %>% 
  data.frame 
  
movie.score <- html_nodes(h2, ".emph_grade") %>% 
  html_text %>% 
  as.numeric %>% 
  data.frame