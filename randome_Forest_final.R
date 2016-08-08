ff<-read.csv2("final.csv",header = TRUE)
str(ff)
ff$FIFA_Points_Home_Norm<-as.numeric(as.character(ff$FIFA_Points_Home_Norm))
ff$FIFA_Points_Away_Norm<-as.numeric(as.character(ff$FIFA_Points_Away_Norm))
ff$Attack_Home<-as.numeric(as.character(ff$Attack_Home))
ff$Attack_Away<-as.numeric(as.character(ff$Attack_Away))
ff$Defence_Home<-as.numeric(as.character(ff$Defence_Home))
ff$Defence_Away<-as.numeric(as.character(ff$Defence_Away))
ff1$FIFA_Points_Home_Norm<-as.numeric(as.character(ff1$FIFA_Points_Home_Norm))
ff_predict<-ff[1:36,c(7,8,14,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30)]
head(ff_predict)
ff<-ff[37:2400,c(7,8,14,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30)]
ff<-na.omit(ff)
library(randomForest)
set.seed(9850)
result<-randomForest(as.factor(Home_score)~FIFA_Points_Home_Norm+Attack_Home+Defence_Home+Recent_Home_Trend_1+Recent_Home_Trend_2+Recent_Home_Trend_3+Recent_Home_Trend_4+Recent_Home_Trend_5+FIFA_Points_Away_Norm+Attack_Away+Defence_Away+Recent_Away_Trend_1+Recent_Away_Trend_2+Recent_Away_Trend_3+Recent_Away_Trend_4+Recent_Away_Trend_5,data = ff,importance=TRUE,ntree=500)
result1<-randomForest(as.factor(Away_Score)~FIFA_Points_Away_Norm+Attack_Away+Defence_Away+Recent_Away_Trend_1+Recent_Away_Trend_2+Recent_Away_Trend_3+Recent_Away_Trend_4+Recent_Away_Trend_5+FIFA_Points_Home_Norm+Attack_Home+Defence_Home+Recent_Home_Trend_1+Recent_Home_Trend_2+Recent_Home_Trend_3+Recent_Home_Trend_4+Recent_Home_Trend_5,data = ff,importance=TRUE,ntree=500)
pred<-predict(result,ff_predict)
pred1<-predict(result1,ff_predict)
pred
pred1
library(xlsx)
write.xlsx(pred,"C:\\Users\\tha6um\\Documents\\Predictions\\result_random_forest_home_IMP1.xlsx")
write.xlsx(pred1,"C:\\Users\\tha6um\\Documents\\Predictions\\result1_random_forest_away_IMP1.xlsx")
