data = importdata('Output.txt');
data = data.data;
delay = data(:,1);
pdf = data(:,2:end);

[nrow, ncol] = size(pdf);

% create a new figure object
fig = figure;

subplot(2,1,1);
for i = 1:ncol
	p(i) = plot(delay, pdf(:,i));
	hold on;
end
hold off;

cdf = cumtrapz(delay, pdf);

subplot(2,1,2);
for i = 1:ncol
	c(i) = plot(delay, cdf(:,i));
	hold on;
end
hold off;

% adjusting for saving as pdf
fig.PaperPositionMode='auto';
fig.PaperOrientation = 'landscape';
saveas(fig, 'plot_pdf_cdf.eps', 'epsc');

% create a new figure object
fig = figure;

subplot(2,1,1);
for i = 1:ncol
	c(i) = plot(delay, 1-cdf(:,i));
	hold on;
end
hold off;

subplot(2,1,2);
for i = 1:ncol
	p(i) = semilogy(delay, 1-cdf(:,i));
	hold on;
end

% adjusting for saving as pdf
fig.PaperPositionMode='auto';
fig.PaperOrientation = 'landscape';
saveas(fig, 'plot_cdf_1-cdf.eps', 'epsc');

exit
