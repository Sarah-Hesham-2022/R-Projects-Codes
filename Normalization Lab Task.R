col1=c(1,2,3,4,5)
col2=c(10,20,30,40,50)
col3=c(100,200,300,400,500)
df=data.frame(col1,col2,col3)

normMin=function(df)
{
  
  (df-min(df))/(max(df)-min(df))
}

normSD=function(df)
{
  (df-mean(df))/sd(df)
  
}

newdata1=sapply(df[,-3],normMin)
print(newdata1)

newdata2=sapply(df[,-3],normSD)
print(newdata2)