time = InOutData.time;
data = InOutData.signals.values;
u = data(:,1);
y = data(:,2);
w = data(:,3);
sz = length(u);
w0 = 1;
w(1) = w0;
dw = diff(w)';
spikes = find(dw > 0);
blocks = diff([0,spikes,sz]);
cc = mat2cell([u y time],blocks);
fr = cellfun(@find_spikes,cc);

close all;
figure(1);
% stem(time, u, 'r', 'LineWidth',2);
plot(time, u, 'r', 'LineWidth',2);
grid on;
hold on;
% stem(time, y, 'k', 'LineWidth',2);
plot(time, y, 'k', 'LineWidth',2);

%figure(2);
plot(fr,'LineWidth',2);
legend({'input','output','frec'});