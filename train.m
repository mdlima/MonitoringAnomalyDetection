clear

% Transforming training data for Anomaly Detection

% Load cross-validation data (synthetic)
% Xval
load('gendata.txt'); 

% Load errors data
% B
load('errorsdata.txt');

% Load training data (synthetic)
% X
load('train.txt');


% Flag data (ground truth)
yval = [zeros(size(Xval)); ones(size(B))];
Xval = [Xval; B];


% Transform data to be more gaussian-like
Xgauss = sqrt(X);
Xvalgauss = sqrt(Xval);

%  Estimate my and sigma2
[mu sigma2] = estimateGaussian(Xgauss);

%  Returns the density of the multivariate normal at each data point (row) 
%  of X
p = multivariateGaussian(Xgauss, mu, sigma2);


pval = multivariateGaussian(Xvalgauss, mu, sigma2);

[epsilon F1] = selectThreshold(yval, pval);


