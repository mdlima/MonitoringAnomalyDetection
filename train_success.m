% Assumes the data is loaded on the X vector
% Won't need flagged abnormal data

% clear

% Transforming training data for Anomaly Detection
% X = round(100*abs(randn(100,1)));

% Plots the input data
hist(X,100);

% Transform data to be more gaussian-like
% Xgauss = (X+1000).^0.05; %sqrt(X);
Xgauss = (X+1000).^0.1;
hist(Xgauss,100);
pause;

%  Estimate my and sigma2
[mu sigma2] = estimateGaussian(Xgauss);

%  Returns the density of the multivariate normal at each data point (row) 
%  of X
p = multivariateGaussian(Xgauss, mu, sigma2);


% Creates a synthetic vector with data in the same range from X, but adding up to 2 times X
Xplot = (0:(2*max(X)/100):2*max(X))';
% Xplot = (0:100:3000)';

pplot = multivariateGaussian((Xplot+1000).^0.1, mu, sigma2);

plot(X,p,".");
pause;

% plot(Xplot,pplot);


% [epsilon F1] = selectThreshold(yval, pval);


