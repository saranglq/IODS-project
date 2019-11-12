
library(ggplot2)

a <- qplot(lrn14$age,
      geom="histogram",
      binwidth = 1.3,  
      main = "Histogram for Age", 
      xlab = "Age",  
      fill=I("blue"), 
      col=I("red"), 
      alpha=I(.2)) 

aspect_ratio <- 1
height <-7
b = a + ggsave(file = "data/imagese2/histage.png", height = 7 , width = 7 * aspect_ratio)

a <- qplot(lrn14$attitude,
      geom="histogram",
      binwidth = 1.3,  
      main = "Histogram for Attitude", 
      xlab = "Attitude",  
      fill=I("blue"), 
      col=I("red"), 
      alpha=I(.2)) 

aspect_ratio <- 1
height <-7
b = a + ggsave(file = "data/imagese2/histattitude.png", height = 7 , width = 7 * aspect_ratio)

a <- qplot(lrn14$deep,
      geom="histogram",
      binwidth = 0.1,  
      main = "Histogram for Deep", 
      xlab = "Deep",  
      fill=I("blue"), 
      col=I("red"), 
      alpha=I(.2)) 

aspect_ratio <- 1
height <-7
b = a + ggsave(file = "data/imagese2/histdeep.png", height = 7 , width = 7 * aspect_ratio)

a <- qplot(lrn14$stra,
      geom="histogram",
      binwidth = 0.1,  
      main = "Histogram for Strategy", 
      xlab = "Strategy",  
      fill=I("blue"), 
      col=I("red"), 
      alpha=I(.2)) 

aspect_ratio <- 1
height <-7
b = a + ggsave(file = "data/imagese2/histstra.png", height = 7 , width = 7 * aspect_ratio)

a <- qplot(lrn14$surf,
      geom="histogram",
      binwidth = 0.1,  
      main = "Histogram for Surface", 
      xlab = "Surface",  
      fill=I("blue"), 
      col=I("red"), 
      alpha=I(.2)) 


aspect_ratio <- 1
height <-7
b = a + ggsave(file = "data/imagese2/histsurf.png", height = 7 , width = 7 * aspect_ratio)

a <- qplot(lrn14$points,
      geom="histogram",
      binwidth = 1.1,  
      main = "Histogram for Points", 
      xlab = "Points",  
      fill=I("blue"), 
      col=I("red"), 
      alpha=I(.2)) 

aspect_ratio <- 1
height <-7
b = a + ggsave(file = "data/imagese2/histpoints.png", height = 7 , width = 7 * aspect_ratio)

library(GGally)
library(ggplot2)

p <- ggpairs(lrn14, mapping = aes(col = gender, alpha = 0.3), lower = list(combo = wrap("facethist", bins = 20))) + theme(text = element_text(size=30))
p

aspect_ratio <- 1
height <-20
ggsave(file = "data/imagese2/pairsplot.png", plot = p, height = 20 , width = 20 * aspect_ratio, dpi = 300)

regression_points <- lm(points ~ attitude + stra + surf, data = lrn14)
summary (regression_points)

regression_points <- lm(points ~ attitude , data = lrn14)
summary (regression_points)

par(mfrow = c(1,1))
plot(regression_points, which = c(1,2,5))

scatter.smooth(x = lrn14$points, y = lrn14$attitude, xlab = "Points", ylab = "Attitude", main="Points ~ Attitude")
?scatter.smooth
