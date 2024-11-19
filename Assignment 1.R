## Assignment 1 ##

#3. Installing and Initializing Packages:
install.packages("tidyverse")
library(tidyverse)
install.packages("renv")
renv::snapshot() 

# 4. Loading and Exploring Data:
data(iris)
head(iris)
summary(iris)
str(iris)

#5. Data Manipulation:
# create tibble format table
df <- tbl_df(iris) 
df
iris <- as_tibble(iris)
df <- iris
filter(df, Species == "versicolor")
filter(df, Petal.Length > 2)
filter(df, Petal.Length > 6 & Sepal.Length > 7)       
arrange(df, Sepal.Length, Petal.Width)
arrange(df, desc(Sepal.Length))
select(df, Species, Petal.Width, Petal.Length)
mutate(df, log.Sepal.length = log(Sepal.Length))
summarise(df, mean(Petal.Length))
group_by(df, Species) %>% count(n())
df %>% 
  group_by(Species) %>%
  summarise(mean(Petal.Length))

#6. Data Visualization with ggplot2:
ggplot(data=df, aes(x = Sepal.Length, y = Sepal.Width))+
  geom_point(aes(color=Species, shape=Species)) +
  xlab("Sepal Length") +
  ylab("Sepal Width") +
  ggtitle("Sepal Length-Width")

#9. Saving Library State:
renv::snapshot()
