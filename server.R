

library(shiny)
library(stringr)
library(quanteda)

shinyServer(function(input, output) {
        
        n2<-readRDS(file="bigram.rds")
        n3<-readRDS(file="trigram.rds")
        abc<-NULL
        
        output$predicted <- renderText({
        abc<-tolower(input$text)
        chars2<-unlist(str_split(abc," "))
        chars<-length(chars2)
        last_one<-paste("^",word(abc,-1),sep="")
        last_two<-paste("^",word(abc,start=-2,end=-1),sep="")
        
        if (chars==1) {
        s1<-head(n2[grep(last_one ,n2$feature),],3)
        if (nrow(s1)>1){
        s2<-convert(dfm(s1$feature),to="data.frame")
        s3<-c(names(s2)[3]," | ",names(s2)[4]," | ",names(s2)[5])
        print(s3)}
        else {print("is | am | it")}
        } 
        
        else if (chars>1) {
        r1<-head(n3[grep(last_two, n3$feature),],3)
        if (nrow(r1)>1){
        r2<-convert(dfm(r1$feature),to="data.frame")
        r3<-c(names(r2)[4]," | ",names(r2)[5]," | ",names(r2)[6])
        print(r3)}
        else {print("is | am | it")}
    }

        else {
        print("hello world")
        }
    
  })
  
})
