##############################################
# 여러 페이지 크롤링
##############################################
library(tidyverse)
library(stringr)

#국제시장
url <- "http://movie.naver.com/movie/point/af/list.nhn?st=mcode&sword=102875&target=&page="
h <- read_html(url) #윈도우의 경우 ms949

#empty vector
first_page_final <- NULL

#데스트10page loop
for(i in 1:10) {
  url <- paste0("http://movie.naver.com/movie/point/af/list.nhn?st=mcode&sword=102875&target=&page=",i)
  h <- read_html(url, encoding = "ms949")
  #코멘트
  comment_next <- html_nodes(h, xpath = "//*[@id='old_content']/table/tbody/tr/td[4]/text()")
  comment_next <- html_text(comment_next)
  comment_next <- str_trim(comment_next)
  comment_next <- comment_next[comment_next != ""]
  #평점
  rate_next <- html_nodes(h, ".point")
  rate_next <- html_text(rate_next)
  #날짜
  date_next <- html_nodes(h, xpath = "//*[@id='old_content']/table/tbody/tr/td[5]/text()")
  date_next <- html_text(date_next)
  #아이디
  id_next <- html_nodes(h, xpath = "//*[@id='old_content']/table/tbody/tr/td[5]/a/text()")
  id_next <- html_text(id_next)
  #데이터프레임으로 변환
  final_page <- data.frame(date_next, comment_next, rate_next, id_next)
  #결합
  first_page_final <- rbind(first_page_final, final_page)
}
