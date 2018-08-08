library(tidyverse)
library(rvest)


#trial run

#Specifying the url for desired website to be scrapped
url <- 'http://164.100.47.194/Loksabha/Questions/QResult15.aspx?qref=72435&lsno=16'

#Reading the HTML code from the website
webpage <- read_html(url)



#Using CSS selectors to scrap the relevant sections
q_min <- html_nodes(webpage,'#ContentPlaceHolder1_Label1')
starred_unstarred <- html_nodes(webpage,'#ContentPlaceHolder1_Label2') 
q_no <- html_nodes(webpage,'#ContentPlaceHolder1_Label3')
q_date <- html_nodes(webpage,'#ContentPlaceHolder1_Label4')
q_topic <- html_nodes(webpage,'#ContentPlaceHolder1_Label5')
q_asker <- html_nodes(webpage,'#ContentPlaceHolder1_Label7')
ans_min <- html_nodes(webpage,'#ContentPlaceHolder1_Label8')
q_text <- html_nodes(webpage,'#ContentPlaceHolder1_GridView2')
comb_text <- html_nodes(webpage,'.stylefontsize')

#Converting the ranking data to text
q_min <- html_text(q_min)
starred_unstarred <-  html_text(starred_unstarred)
q_no<- html_text (q_no)
q_date<- html_text (q_date)
q_topic<- html_text (q_topic)
q_asker<- html_text (q_asker)
ans_min<- html_text (ans_min)
q_text<- html_text (q_text)
comb_text<- html_text(comb_text)


q_min,starred_unstarred,q_no,q_date,q_topic,q_asker,ans_min,q_text,comb_text

number <- 123213

number <- as.numeric(0)
question <- cbind(q_min,starred_unstarred,q_no,q_date,q_topic,q_asker,ans_min,q_text,comb_text,number)

dataset <- questions[0,] 

question <- as.tibble(question)
#start creating function

url_part1 <- 'http://164.100.47.194/Loksabha/Questions/QResult15.aspx?qref='
url_part2 <- '&lsno=16'


get_date <- function(number) {
url <<- paste(url_part1,number,url_part2,sep="")
webpage <<- read_html(url)
#Using CSS selectors to scrap the relevant sections
q_min <<- html_nodes(webpage,'#ContentPlaceHolder1_Label1')
starred_unstarred <<- html_nodes(webpage,'#ContentPlaceHolder1_Label2') 
q_no <<- html_nodes(webpage,'#ContentPlaceHolder1_Label3')
q_date <<- html_nodes(webpage,'#ContentPlaceHolder1_Label4')
q_topic <<- html_nodes(webpage,'#ContentPlaceHolder1_Label5')
q_asker <<- html_nodes(webpage,'#ContentPlaceHolder1_Label7')
ans_min <<- html_nodes(webpage,'#ContentPlaceHolder1_Label8')
q_text <<- html_nodes(webpage,'#ContentPlaceHolder1_GridView2')
comb_text <<- html_nodes(webpage,'.stylefontsize')

q_min <<- html_text(q_min)
starred_unstarred <<-  html_text(starred_unstarred)
q_no <<- html_text (q_no)
q_date <<- html_text (q_date)
q_topic <<- html_text (q_topic)
q_asker <<- html_text (q_asker)
ans_min <<- html_text (ans_min)
q_text <<- html_text (q_text)
comb_text <<- html_text(comb_text)
comb_text <<- paste(comb_text, collapse = '')



questions <<- cbind(q_min,starred_unstarred,q_no,q_date,q_topic,q_asker,ans_min,q_text,comb_text,number)

questions <<- as.tibble(questions)

dataset <<- rbind(dataset,questions)
return(dataset)
}


get_date(52435)

for (number in 10000:52435) 