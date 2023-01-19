# I will apply visualization on a dataset that I have
#and your HW is to reapply this to your selected datasets
#and submit both your new R-code along with screenshots, similar to mine showing 
#all report results from all Rstudio GUIs

data<-read.csv("D:/TASKS/rstudio tasks/carl/university_rank2.csv")
str(data)
sum(is.na(data))

# This quiz we will look at ggplo2 library visualizations 
# Our examples are from the link http://r-statistics.co/Top50-Ggplot2-Visualizations-MasterList-R-Code.html
install.packages("ggplot2")
# load package and data
options(scipen=999)  # turn-off scientific notation like 1e+48
library(ggplot2)
theme_set(theme_bw())  # pre-set the bw theme.
# This chart has midwest example, change it with ur dataname

# Scatterplot
gg <- ggplot(data, aes(x=R_C_PCT_CLASSES_GT_50, y=IS_RANKED)) + 
  geom_point(aes(col=R_C_PCT_CLASSES_GT_50, size=IS_RANKED)) + 
  geom_smooth(method="loess", se=F) + 
  xlim(c(0, 10)) + 
  ylim(c(0, 300)) + 
  labs(subtitle="R_C_PCT_CLASSES_GT_50 Vs IS_RANKED", 
       y="IS_RANKED", 
       x="R_C_PCT_CLASSES_GT_50", 
       title="Scatterplot", 
       caption = "Source: USNEWS")

plot(gg)

# scatter plot with encoding
# Scatterplot
# install 'ggalt' pkg
 devtools::install_github("hrbrmstr/ggalt")
options(scipen = 999)``
library(ggplot2)
library(ggalt)
data_select <- data[data$IS_RANKED >1 & data$IS_RANKED <300 & 
                      data$R_C_AVG_PCT_RETENTION >50 &
                      data$R_C_AVG_PCT_RETENTION <100, ]

# Plot
ggplot(data, aes(x=data$IS_RANKED, y=data$R_C_AVG_PCT_RETENTION)) + 
  geom_point(aes(col=data$V_DISPLAY_SCORE, size=data$PRED_GRAD_RATE)) +   # draw points
  geom_smooth(method="loess", se=F) + 
  xlim(c(0, 10)) + 
  ylim(c(0, 300)) +    # draw smoothing line
  geom_encircle(aes(x=data_select$IS_RANKED, y=data_select$R_C_AVG_PCT_RETENTION), 
                data=data_select,
                color="red", 
                size=2, 
                expand=0.08) +   # encircle
  labs(subtitle="R_C_PCT_CLASSES_GT_50 Vs IS_RANKED", 
       y="IS_RANKED", 
       x="R_C_PCT_CLASSES_GT_50", 
       title="Scatterplot + Encircle", 
       caption = "Source: USNEWS")
