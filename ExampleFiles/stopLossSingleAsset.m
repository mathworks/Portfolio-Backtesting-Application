function [new_weights,user_data] = stopLossSingleAsset(current_weights,prices,user_data)

% start with the existing weights
new_weights = current_weights;

% find column of the asset
asset = char(user_data.Asset);
assetIdx = find(strncmpi(asset,prices.Properties.VariableNames,numel(asset)));
assetPrice = prices{end,assetIdx};

% determine if we're currently invested or in cash
inCash = sum(current_weights) < 1e-5;

if inCash

    % We are in cash, see if we should buy back in
    if assetPrice <= user_data.BuyInPrice

        % Buy back in
        new_weights(assetIdx) = 1;
        % Set new stop loss price
        user_data.StopLossPrice = assetPrice * (1 - user_data.StopLossPercent);
    end

else

    % We are in the stock, see if we should sell
    if assetPrice <= user_data.StopLossPrice

        % Sell the stock
        new_weights(assetIdx) = 0;
        % Set new buy-in price
        user_data.BuyInPrice = assetPrice * (1 - user_data.BuyInPercent);
    end

end

end