function new_weights = equalWeightFcn(~, pricesTT)
% Equal-weighted portfolio allocation
    nAssets = size(pricesTT, 2);
    new_weights = ones(1,nAssets);
    new_weights = new_weights / sum(new_weights);
end