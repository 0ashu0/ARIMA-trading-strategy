library(quantmod)
library(timeSeries)
library(forecast);

selectArima <- function(timeseries.ts) {
  aic<-matrix(NA,6,6);
  for(p in 0:5)
  {
    for(q in 0:5)
    {
      a.p.q<-arima(timeseries.ts,order=c(p,0,q));
      aic.p.q<-a.p.q$aic;
      aic[p+1,q+1]<-aic.p.q;
    }
  }
  inds = which(aic == min(aic), arr.ind=TRUE)-1;
  colnames(inds)<-c("p", "q");
  return(inds);
}



startDate="2000-01-01";

getSymbols("^GSPC", from=startDate);

GSPC=Cl(GSPC);

T=500;

money<-c(1000); #Start with 1000$

for (i in (T+1):(length(GSPC)-1)) {
  dateStart<-time(GSPC[i-T]);
  dateEnd<-time(GSPC[i]);
  data.ts<-diff(log(window(GSPC, start=dateStart, end=dateEnd)));
  pq<-selectArima(ts.ts);
  p=pq[1];
  q=pq[2];
  fit<-arima(ts.ts, c(p, 0, q));
  p=as.numeric(forecast(fit,h=1)[4])-as.numeric(data.ts[length(data.ts)]);
  
  margin<-0.1;
  if (p>0) {
    money<-c(money, money[length(money)]*as.numeric(GSPC[i+1])/as.numeric(GSPC[i]));
    cat("Buy. Money:" , money[length(money)], "\n");
  } else {
      money<-c(money, money[length(money)]*as.numeric(GSPC[i])/as.numeric(GSPC[i+1]));
      cat("Sell. Money:" , money[length(money)], "\n");
  }
  
}


plot(money, t="l");

annualReturns<-c();
for (i in seq(366, length(money), 365)) {
  annualReturns<-c(annualReturns, 100*(money[i]-money[i-365])/money[i-365]);
}

mp <- barplot(round(annualReturns, 1), main="Strategy annual returns (%)")
mtext(side = 1, at = mp, text = paste(round(annualReturns, 1),"%"), line = 1)




annualReturns<-c();
for (i in seq(366, length(money), 365)) {
  annualReturns<-c(annualReturns, 100*(as.vector(GSPC)[i]-as.vector(GSPC)[i-365])/as.vector(GSPC)[i-365]);
}

mp <- barplot(round(annualReturns, 1), main="S&P 500 annual returns (%)")
mtext(side = 1, at = mp, text = paste(round(annualReturns, 1),"%"), line = 1)


