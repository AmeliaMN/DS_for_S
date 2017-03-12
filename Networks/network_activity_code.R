library(network)
library(RColorBrewer)

e <- read.csv("edges.csv",head=F,as.is=T)

a <- unique(c(e[,1],e[,2]))
mat <- matrix(0,ncol=length(a),nrow=length(a))

for(i in 1:nrow(e)){

   mat[match(e[i,1],a),match(e[i,2],a)] = 1
   mat[match(e[i,2],a),match(e[i,1],a)] = 1
}

who = read.csv("who.csv",head=F,as.is=T)
col = rep(0,length(a))
w = who[match(a,who[,2]),1]
col = match(w,unique(who[,1]))
col[is.na(col)] = 0

n = network(mat)
pdf("us.pdf",width=12,height=12)
set.seed(3)
plot(n,vertex.col=c("#FFFFFFFF",brewer.pal(8,"Set2"))[col+1],usearrows=F,vertex.border=NA)
legend("bottomleft",fill=c("#FFFFFFFF",brewer.pal(8,"Set2")),legend=c("Out",unique(who[,1])),cex=0.8)
graphics.off()
system("open us.pdf")
pdf("us2.pdf",width=20,height=20)
plot(n,vertex.col=c("#11111111",brewer.pal(8,"Set2"))[col+1],vertex.border=NA,usearrows=F,edge.col="lightgrey",label=a,edge.lwd=0.1)
legend("bottomleft",fill=c("#11111111",brewer.pal(8,"Set2")),legend=c("Others",unique(who[,1])),border=F)
graphics.off()
system("open us2.pdf")


#For website
set.seed(5)
L = network.layout.fruchtermanreingold(n, 
                                       layout.par = list(
                                         repulse.rad =(267^(2.8)) ))*500

png("networkforwebsite2.png", width=4000, height=4000, bg="transparent")
plot(n, coord=L,
     vertex.col=c("#11111111",brewer.pal(8,"Set2"))[col+1],
     vertex.cex = 1,
     vertex.border=NA,
     usearrows=F,
     edge.col="lightgrey",
     edge.lwd=0.1,
     vertices.last=TRUE)
dev.off()
