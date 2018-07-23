library(ggplot2)
library(data.table)
df <- fread("~/Downloads/R-Course-HTML-Notes/R-for-Data-Science-and-Machine-Learning/Training Exercises/Capstone and Data Viz Projects/Data Visualization Project/Economist_Assignment_Data.csv", drop = 1)
head(df)
dl <- ggplot(df, aes(x = CPI, y = HDI, color=Region)) + geom_point()
print(dl)
## The economist's scatterplot had hollow-looking points. Let's try to change our points to the same thing.
dl <- ggplot(df, aes(x = CPI, y = HDI, color=Region)) + geom_point(size=2, shape=1)
print(dl)
dl2 <- dl + geom_smooth(aes(group = 1 ), method = 'lm', formula = y ~ log(x), se = F, color = 'red')
print(dl2)


