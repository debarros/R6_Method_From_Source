#MainScript2.R
library(R6)
library(data.table)

MyClass = R6Class(
  classname = "myclass",
  private = list(Table = NA,Frame = NA),
  public = list(
    initialize = function(){},
    setTable = function(x){private$Table = x},
    getTable = function(){
      MyData = vector(mode = "list", length = length(private$DATA))
      for(i in 1:length(private$Table)){
        MyData[[i]] = private$Table[[i]]
      }
      MyData = rbindlist(MyData)
      return(MyData)
    },
    getTable2 = function(){source("getTable2.R", local = T)},
    setFrame = function(x){private$Frame = x},
    getFrame = function(){
      MyData = private$Frame
      return(MyData)
    },
    getFrame2 = function(){source("getFrame2.R", local = T)}
  )
)


data1 = data.frame(v1 = rnorm(5,1,2), v2 = rnorm(5,1,2))
data2 = data.frame(v1 = rnorm(5,1,2), v2 = rnorm(5,1,2))
data3 = data.frame(v1 = rnorm(5,1,2), v2 = rnorm(5,1,2))


current = MyClass$new()
current$setTable(list("first" = data1, "second" = data2, "third" = data3))
current$setFrame(data1)
current$getTable()
current$getTable2()
current$getFrame()
current$getFrame2()


