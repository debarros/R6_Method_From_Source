#getDATA2.R

MyData = vector(mode = "list", length = length(private$DATA))
for(i in 1:length(private$Table)){
  MyData[[i]] = private$Table[[i]]
}
MyData = rbindlist(MyData)
return(MyData)