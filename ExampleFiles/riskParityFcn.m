function new_weights = riskParityFcn(~,pricesTT)
% Risk parity rebalance function

% Invest only in assets. First column of pricesTT is the market index.
assetReturns = tick2ret(pricesTT(:,2:end));
assetCov = cov(assetReturns{:,:});

% Do not invest in the market index.
new_weights = [0; riskBudgetingPortfolio(assetCov)];

end