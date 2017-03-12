## ---- echo=FALSE, message=FALSE, warning=FALSE---------------------------
require(knitr)
opts_chunk$set(cache=TRUE, warning=FALSE, message=FALSE, fig.align='center')

## ------------------------------------------------------------------------
#install.packages("ggplot2")
library(ggplot2)

## ------------------------------------------------------------------------
str(diamonds)

## ---- plot.height=2------------------------------------------------------
qplot(x=carat, data=diamonds)

## ---- eval=FALSE---------------------------------------------------------
## qplot(x=carat, data=diamonds)

## ------------------------------------------------------------------------
qplot(x=clarity, fill=cut, data=diamonds)

## ------------------------------------------------------------------------
p1 <- ggplot(aes(x=clarity, fill=cut), data=diamonds)

## ---- message=FALSE, fig.height=3----------------------------------------
p1 + geom_bar()

## ------------------------------------------------------------------------
p1 + geom_bar(position="dodge")

## ------------------------------------------------------------------------
p1 + geom_bar(position="fill")

## ------------------------------------------------------------------------
p2 <- ggplot(aes(x=carat, y=depth), data=diamonds)
p2 + geom_point()

## ------------------------------------------------------------------------
p2 + geom_bin2d()

## ------------------------------------------------------------------------
p2 <- p2 + geom_bin2d()

## ------------------------------------------------------------------------
p2 <- p2 + xlab("Carat") + ylab("Depth") + 
 guides(fill=guide_legend(title="Number of diamonds"))
p2

## ------------------------------------------------------------------------
p2 + scale_fill_continuous(breaks=c(1500, 2500, 3500,4500))

## ------------------------------------------------------------------------
p2 + scale_fill_continuous(trans="log")

## ------------------------------------------------------------------------
p2 + scale_fill_continuous(trans="log", breaks=c(1,10,100,1000,5000))

## ------------------------------------------------------------------------
p2 + facet_wrap(~color)

## ------------------------------------------------------------------------
p2 + facet_grid(color~clarity)

## ------------------------------------------------------------------------
# install.packages("lubridate")
# install.packages("dplyr")
library(lubridate)
library(dplyr)

## ---- eval=FALSE---------------------------------------------------------
## ?economics

## ------------------------------------------------------------------------
econ <- economics
str(econ)
econ <- econ %>%
  mutate(date = ymd(date)) 
old <- econ %>%
  filter(year(date)<"1970")
old <- old %>%
  mutate(date = ymd(date))

## ------------------------------------------------------------------------
p3 <- ggplot(data=old) + geom_line(aes(x=date, y=pce))
p3

## ------------------------------------------------------------------------
# install.packages("scales") 
library(scales)

## ------------------------------------------------------------------------
p3 + 
  scale_x_date(breaks = date_breaks("3 months"), 
                   labels = date_format("%b %Y"))

## ------------------------------------------------------------------------
p3 + 
  scale_x_date(breaks = date_breaks("6 months"), 
                   labels = date_format("%B %y"))

## ---- eval=FALSE---------------------------------------------------------
## baseplot <- ggplot() +
##   aes(x=citystate, y=Freq, fill = Response, order=Response) +
##   facet_wrap(~year, nrow=3)+geom_bar(data = trial2$neg, stat = "identity") +
##   scale_fill_manual(breaks=c("Not at all satisfied", "2", "3", "4",
##                              "Extremely satisfied"), values=colorsB,
##                     name="Response") +
##   geom_bar(data = trial2$pos, stat = "identity") + coord_flip() +
##   ggtitle("Community satisfaction") + xlab("") +ylab("") +
##   scale_y_continuous(limits=c(-0.5, 1),
##                      breaks=seq(from=-0.5, to=0.75, by=0.25),
##                      labels=c("50%", "25%", "0", "25%", "50%", "75%")) +
##   theme(legend.text=element_text(size=14),
##         legend.title=element_text(size=16),
##         axis.text=element_text(size=14),
##         strip.text=element_text(size=14))
## baseplot

## ------------------------------------------------------------------------
# install.packages("RColorBrewer")
library(RColorBrewer)
display.brewer.all(n=5, type="qual")

## ------------------------------------------------------------------------
p1 + geom_bar(position="dodge") + scale_fill_brewer(palette="Dark2")

## ------------------------------------------------------------------------
p1 <- p1 + geom_bar(position="dodge") + scale_fill_brewer(palette="Dark2")
ggsave(p1, filename="mycoolplot.jpg")

## ------------------------------------------------------------------------
atus <- read.csv("../Data/atus.csv")

## ------------------------------------------------------------------------
library(readr)
docs <- read_csv("../Data/PartD_Providers.csv")

qplot(COST_SUM, data = docs)

## ------------------------------------------------------------------------
qplot(COST_SUM, data = docs, geom = "histogram")

## ------------------------------------------------------------------------
qplot(CLAIM_COUNT, data = docs, geom = "density")

## ------------------------------------------------------------------------
qplot(CLAIM_COUNT, BRAND_COUNT, data = docs)

## ------------------------------------------------------------------------
qplot(CLAIM_COUNT, BRAND_COUNT, data = docs, geom = "line")

## ------------------------------------------------------------------------
qplot(CLAIM_COUNT, BRAND_COUNT, data = docs, geom = "smooth")

## ------------------------------------------------------------------------
qplot(CLAIM_COUNT, BRAND_COUNT, data = docs, geom = c("point", "smooth"))

