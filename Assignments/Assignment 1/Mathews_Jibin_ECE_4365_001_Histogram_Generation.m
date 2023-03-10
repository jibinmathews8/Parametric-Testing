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
data = data_file(1,1:300);

%% Calculate Bins: sqrt(# of measurements)
num_bins = round(sqrt(length(data)));

%% Mean and Standard Deviation
mean_data = mean(data);
std_data = std(data);
disp(" Mean of data is: ");
disp(mean_data);
disp(" Standard Deviation of data is: ");
disp(std_data);

 x_values = linspace(min(data), max(data), 300);
 y_fit = normpdf(x_values,mean_data,std_data);


%% Gaussian Distribution (Use Min and Max)
figure(1)
%h = histogram(data,num_bins, 'Normalization','pdf',FaceColor='cyan');
h = histogram(data', "BinWidth",.1,"NumBins",num_bins, "Normalization","pdf",FaceColor='blue');
% Probability Density Function
% Bin_value = (# elements in bin) / ( #elements in input data * width
% of bin)
hold on;
[counts, edges] = histcounts(data, num_bins, 'Normalization', 'pdf');
cdf = cumsum(counts) / sum(counts); % Cumulative Sum
plot(edges(2:end), cdf, 'green');

hold on;
plot(x_values, y_fit,'red');
xlabel('Data');
ylabel('Frequency');
title('Histogram with Gaussian Distribution');
legend('Data','Cumulative Probability','Gaussian Distribution');

%% Check for Normal Distribution
% figure(2)
% qqplot(data,prob_dist)
% normplot(data)
% Since data points fall approximately on line data is normally distributed