function rsiSignal = genRSISignal(pricesTT)
    symbols = pricesTT.Properties.VariableNames;
    rsiSignalNameEnding = '_RSI';
    rsiSignal = timetable;
    for i = 1:numel(symbols)
        symi = symbols{i};
        rsiValues = rsindex(pricesTT.(symi));
        rsiBuySell = zeros(size(rsiValues));
        rsiBuySell(rsiValues < 30) = 1;
        rsiBuySell(rsiValues > 70) = -1;
        % Build a timetable for each symbol, then aggregate the symbols together.
        rsiSignali = timetable(pricesTT.Dates,...
            rsiBuySell,...
            'VariableNames',{sprintf('%s%s',symi,rsiSignalNameEnding)});
        rsiSignal = synchronize(rsiSignal,rsiSignali);
    end
end
