function signalTT = generateSignals(pricesTT)    
    % SMA: Simple Moving Average Crossover
    smaSignal = genSMASignal(pricesTT);
    % MACD: Moving Average Convergence/Divergence
    macdSignal = genMACDSignal(pricesTT);
    % RSI: Relative Strength Index
    rsiSignal = genRSISignal(pricesTT);

    % Combine signals into signalTT
    signalTT = timetable;
    signalTT = synchronize(signalTT, smaSignal);
    signalTT = synchronize(signalTT, macdSignal);
    signalTT = synchronize(signalTT, rsiSignal);
end