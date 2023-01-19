#INTRODUCTION TO DATA ANALYTICS USING R PROGRAMMING 
# SECTION 1.1 TEXT ANALYSIS USING R 
# STEPS IN TEXT ANALYSIS- 


# IMPORTING DATA
library(readtext)
# url to Inaugural Address demo data that is provided by the readtext package
filepath <- "C:\\Users\\User\\OneDrive\\Documents\\jj.csv"
rt <- readtext(filepath, text_field = "texts")
View(rt)

# The stringr and stringi packages
# . In R, the stringi package is often used for sentence and word disambiguation
library(stringi)
library(stringr)
x <- c("The first string", 'The <font size="6">second string</font>' )
x<-stri_replace_all(x,"", regex = "<.*?>")
x
# Remove unnecessary spaces from strings.
x<-stri_trim(x)
x
# change strings to upper or lower cases
lower<-stri_trans_tolower(x)
lower
upper<-stri_trans_toupper(x)
upper
tittle<-stri_trans_totitle(x)
tittle

# Pre- processing with the quanteda package. Tokenization is the process of splitting a text into tokesns.
# Most often tokens are words, because these are the most common semantically meaningful components of texts.

library("quanteda")
### Tokenization
course<-"Actuary joji studies actuarial science"
course1<-stri_trans_totitle(course)
course1
course2<-tokens(course1)
course2
### Normalization: Lowercasing and stemming.
low_course<-stri_trans_tolower(course)
tokens1<-tokens(low_course)
stem_course<-tokens_wordstem(tokens1)
stem_course

### Removing stopwords
sw<-stopwords(language = "english")
sw
remove_stopwords<-tokens_remove(stem_course,sw)
remove_stopwords
dfm(remove_stopwords)
### Document text Matrix using  tm and quanteda and tidytext packages.
library(tm)
text <- c(d1 = "An example of preprocessing techniques",
          d2 = "An additional example",
          d3 = "A third example")
dtm <- dfm(text, # input text
           tolower = TRUE, stem = TRUE, # set lowercasing and stemming to TRUE
           remove = stopwords("english")) # provide the stopwords for deletion
dtm
### creating corpus from texts
fulltext <- corpus(rt) # create quanteda corpus
dtm1 <- dfm(fulltext, tolower = TRUE, stem = TRUE, # create dtm with preprocessing
           remove_punct = TRUE,remove = stopwords("english"))
dtm1

### Filtering and weighting
