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
filename = 'Vthdata.csv';
data = csvread(filename);

%% Calculate Bins: sqrt(# of measurements)
num_bins = round(sqrt(length(data)));

%% Create Histogram
histogram(data, num_bins);
xlabel('Data');
ylabel('Frequency');
title('Histogram of Data');

%% Mean and Standard Deviation
mean_data = mean(data);
std_data = std(data);
disp(" Mean of data is: ");
disp(mean_data);
disp(" Standard Deviation of data is: ");
disp(std_data);

%% Gaussian Distribution (Use Min and Max)

x = linspace(min(data), max(data), 100);
y = normpdf(x, mean_data, std_data);
hold on;
plot(x, y,'red');
legend('Histogram', 'Gaussian Distribution');