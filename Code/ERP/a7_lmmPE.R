rm(list=ls())   # 

library(lme4) 
library(lmerTest) 

data <- read.csv("Y:\\Working\\MyPaper\\BayesCentral\\DataAnalysis\\DataAnalysis20241114\\ERP\\findTrials\\lmmData.csv")


names(data) <-c("sub","currDur","prevDur","meanPE","modelPE","P3")


mod1 <- lmer(P3 ~ meanPE + (1|sub) + (0 +meanPE|sub), data=data, REML=T)          
summary(mod1)
anova(mod1)
dataClass = predict(mod1)


write.csv(dataClass,file = "Y:\\Working\\MyPaper\\BayesCentral\\DataAnalysis\\DataAnalysis20241114\\ERP\\findTrials\\PEmeanPre.csv", row.names = F)

mod2 <- lmer(P3 ~ modelPE + (1|sub) + (0 +modelPE|sub), data=data, REML=T)           
summary(mod2)
anova(mod2)

anova(mod1,mod2)
dataClass = predict(mod2)

write.csv(dataClass,file = "Y:\\Working\\MyPaper\\BayesCentral\\DataAnalysis\\DataAnalysis20241114\\ERP\\findTrials\\PEbayesPre.csv", row.names = F)

     