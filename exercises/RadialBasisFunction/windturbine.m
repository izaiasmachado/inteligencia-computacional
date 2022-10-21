dataset = importdata('aerogerador.dat');

x = dataset(:, 1);
y = dataset(:, 2);
N = length(x);

X = x';
D = y';
X = zscore(X);

q = 20;
rbf = RadialBasisFunction(q);
rbf = rbf.train(X, D);

y_prediction = rbf.predict(X);
plot(x, y, '*', x', y_prediction, '-k');

function output = zscore(x)
    output = (x - mean(x)) / std(x);
end
