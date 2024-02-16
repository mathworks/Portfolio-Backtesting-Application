function macdSignal = genMACDSignal(pricesTT)
    symbols = pricesTT.Properties.VariableNames;
    % Create a timetable of the MACD metric using the MACD function.
    macdTT = macd(pricesTT);
    % Create the MACD indicator signal timetable.
    macdSignalNameEnding = '_MACD';
    
    macdSignal = timetable;
    for i = 1:numel(symbols)
        symi = symbols{i};
        % Build a timetable for each symbol, then aggregate the symbols together.
        macdSignali = timetable(pricesTT.Dates,...
            double(macdTT.(symi) > 0),...
            'VariableNames',{sprintf('%s%s',symi,macdSignalNameEnding)});
        macdSignal = synchronize(macdSignal,macdSignali);
    end
end