function new_weights = mktFcn(~,pricesTT)
% Market index rebalance function

% Invest only in the market index.
new_weights = zeros(size(pricesTT,2),1);
new_weights(1) = 1;

end