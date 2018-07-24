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
dl3 <- dl2 + geom_text(aes(label = Country))
# This prints way too many labels 
print(dl3)
## To resolve this problem, I will select a subset for which I will pick and choose which countries need representation on the plot.
pointsToLabel <- c("Russia", "Venezuela", "Iraq", "Myanmar", "Sudan",
                   "Afghanistan", "Congo", "Greece", "Argentina", "Brazil",
                   "India", "Italy", "China", "South Africa", "Spane",
                   "Botswana", "Cape Verde", "Bhutan", "Rwanda", "France",
                   "United States", "Germany", "Britain", "Barbados", "Norway", "Japan",
                   "New Zealand", "Singapore")
dl3 <- dl2 + geom_text(aes(label = Country), color = "gray20", 
                       data = subset(df, Country %in% pointsToLabel),check_overlap = TRUE)
dl4 <- dl3 + theme_bw()
print(dl4)
dl5 <- dl4 + scale_x_continuous(limits = c(.8,10.6), breaks = 1:15)
print(dl5)
##DONE!!

