library(ggplot2)
library(gcookbook)
library(dplyr)
library(ggthemes)
library(scales)
options(max.print=100)

data <- read.csv("data/csv/coe2t115.csv", stringsAsFactors=FALSE)

p.data <- data %>%
         select(P6B2,FAC) %>%
         filter(P6B2>0,P6B2<40000)
         
ggplot()+
  aes(x=p.data$P6B2, weight=p.data$FAC,)+  
  geom_histogram(fill="#008FD5", binwidth=2000, width=0.9) +
  ggtitle("Distribución de salarios en México, MXN") +
  ylab("Cantidad de personas")+
  xlab("Salario")+
  coord_flip()       +       
  scale_x_continuous(labels = comma)+
  scale_y_continuous(labels = comma)+
  scale_x_reverse() +
  scale_color_fivethirtyeight()+
  theme_fivethirtyeight() 
  
ggplot()+
  aes(x=p.data$P6B2, weight=p.data$FAC,y = ..density..)+  
  geom_line(stat="density",colour="#008FD5",na.rm=TRUE, adjust=4, size=1.5, fill=NA) +
  ggtitle("Distribución de salarios en México, MXN") +
  ylab("Cantidad de personas")+
  xlab("Salario")+     
  scale_x_continuous(labels = comma)+
  scale_color_fivethirtyeight()+
  theme_fivethirtyeight()     +
  theme(axis.text.y=element_blank(),axis.ticks=element_blank() )