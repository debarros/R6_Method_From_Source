#MainScript.R
library(R6)

MyClass = R6Class(
  classname = "myclass",
  private = list(Frame = NA),
  public = list(
    initialize = function(){},
    setFrame = function(x){private$Frame = x},
    getFrame = function(){
      MyData = private$Frame
      return(MyData)
    },
    getFrame2 = function(){source("getFrame2.R", local = T)}
  )
)


data1 = data.frame(v1 = rnorm(5,1,2), v2 = rnorm(5,1,2))

current = MyClass$new()
current$setFrame(data1)
current$getFrame()
current$getFrame2()


