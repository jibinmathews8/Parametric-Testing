%{
Jibin Mathews
ECE 4365 001
Assignment 1: Histogram Generation

Description: 
1) histogram of values from attached data set with appropriate number of bins

2) mean and standard deviation associated with these data

3) Gaussian distribution that most closely describes these data

4) Plot of histogram with cumulative probability curve

5) Overlay of Gaussian curve from #3 with plot from #4

%}

%% Import and Read Data
filename = 'Vthdata (1).csv';
data_file = csvread(filename);
data = data_file(1,:);

%% Calculate Bins: sqrt(# of measurements)
num_bins = round(sqrt(length(data)));

%% Mean and Standard Deviation
mean_data = mean(data);
std_data = std(data);
disp(" Mean of data is: ");
disp(mean_data);
disp(" Standard Deviation of data is: ");
disp(std_data);

%% Function to fit probability distribution object to data
prob_dist = fitdist(data', 'Normal'); % Only for column vector so find transpose of data: data'
mean_fit = prob_dist.mu;
std_fit = prob_dist.sigma;

x_values = linspace(min(data), max(data), 1000);
y_fit = pdf(prob_dist, x_values);

%% Gaussian Distribution (Use Min and Max)
figure(1)
histogram(data,num_bins, 'Normalization', 'pdf',FaceColor='cyan'); 
% Probability Density Function
% Bin_value = (# elements in bin) / ( #elements in input data * width
% of bin)
hold on;
plot(x_values, y_fit,'red');
xlabel('x');
ylabel('y');
title('Histogram with Gaussian Distribution');
legend('Data', 'Gaussian Distribution');

%% Check for Normal Distribution
% figure(2)
% qqplot(data,prob_dist)
% normplot(data)
% Since data points fall approximately on line data is normally distributed