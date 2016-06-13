# Trading strategy for the S&P 500 index based on ARIMA models

This code implements a trading strategy based on ARIMA models. For each day, the strategy predicts the following day's closing price using an ARIMA model that is suitably selected each day. If the predicted price is greater than the current price, the strategy decides to go long; if the predicted price is less than the current price, it goes short.

The following chart shows the returns, when compared to the Buy-and-hold strategy:

![alt text](https://raw.githubusercontent.com/bolorsociedad/ARIMA-trading-strategy/master/Returns.png "Returns of the ARIM strategy when compared to the Buy & Hold strategy")

In the 2000-2008 period, the ARIMA strategy reported returns of about 10000%, which clearly outpermorms the Buy-and-hold strategy.

![alt text](https://raw.githubusercontent.com/bolorsociedad/ARIMA-trading-strategy/master/Annual%20returns%20strategy.png "Returns of the strategy in 3/2 years periods")

![alt text](https://raw.githubusercontent.com/bolorsociedad/ARIMA-trading-strategy/master/Annual%20returns%20SP500.png "Returns of S&P 400 in 3/2 years periods")

As we see, when analyzed the strategy in 3/2 years periods, the ARIMA strategy has outpermormed the S&P 500 in every period.
