% Air Quality Data Set -> https://archive.ics.uci.edu/ml/datasets/air+quality <- data used below

% Training data
P = -1:.005:1; % step to load data
T1 = xlsread('AiRQualityUCI.xlsx', 'J2:J402').'; % Reading a data fragment from the AirQualityUCI.xlsx file (the first 401 samples from column J, the parameter name is entered in the J1 cell)

% Network parameters
eg = 0.02; % sum-squared error goal
sc = .005; % spread constant -> step(P) < sc < range(P) -> (0.005, 2)

% Incremental network
net_i = newrb(P,T1,eg,sc);

% Full_network
net_p = newrbe(P,T1,sc);

% Testing
X = -1:.0005:1; % In the testing process, the step has been increased by an order of magnitude
Y_i = net_i(X);
Y_p = net_p(X);

% Display
plot(P,T1, 'b+',X,Y_i,'r',X,Y_p,'g');
legend({'Training data', 'Incremental network', 'Full network'})