clear

% Transforming training data for Anomaly Detection
% X = round(100*abs(randn(100,1)));

% Load cross-validation data (synthetic)
% Xval
% load('gendata.txt');
Xval = round(1000*abs(randn(90,1)));
Xval(find(Xval<10))=0;

% Load errors data
% B
load('errorsdata.txt');

% Load training data (synthetic)
% X
% load('train.txt');
X = round(100*abs(randn(100,1)));
X(find(X<10))=0;


% Flag data (ground truth)
yval = [zeros(size(Xval)); ones(size(B))];
Xval = [Xval; B];


% Transform data to be more gaussian-like
Xgauss = X.^0.05; %sqrt(X);
Xvalgauss = Xval.^0.05; %sqrt(Xval);

%  Estimate my and sigma2
[mu sigma2] = estimateGaussian(Xgauss);

%  Returns the density of the multivariate normal at each data point (row) 
%  of X
p = multivariateGaussian(Xgauss, mu, sigma2);


pval = multivariateGaussian(Xvalgauss, mu, sigma2);

[epsilon F1] = selectThreshold(yval, pval);


