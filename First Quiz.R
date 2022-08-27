m=matrix(c(1:20),ncol=4)
print(m)
Mymax=function(vec)
{
  e=-10000
  for(i in vec)
  {
    if(i>e)
      e=i
  }
  e
}
maxElement=apply(m,2,Mymax)
print(maxElement)