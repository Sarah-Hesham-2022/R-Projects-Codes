data=cars
View(data)

Euclidean=function(df)
{
  x=sqrt(sum(((df[1]-df[2])*(df[1]-df[2]))))
  return(x)
}

Manhattan=function(df)
{
  x=sum(abs(df[1]-df[2]))
  return(x)
  
}

print(Euclidean(data))
print(Manhattan(data))

normMin=function(df)
{
  
  (df-min(df))/(max(df)-min(df))
}
data=sapply(data,normMin)
View(data)

model=kmeans(data,3)
print(model$centers)