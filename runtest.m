clearvars
clc

%% Function selecting
func = 'cec22_func';
obj = str2func(func);
fcnid = 1; 
dim = 20;
lb = -100*ones(1,dim);
ub = 100*ones(1,dim);
%% Parameters
iterMax = 1e4;
runsMax = 30;
params = [0.8,50,0.5]; % parameters: [alpha, m, delta]
%% Optimization
f_best = zeros(runsMax,1);
x_best = zeros(runsMax,dim);
f_best_records = zeros(iterMax,runsMax);
parfor runs = 1:runsMax
    [f_best(runs,:),x_best(runs,:),f_best_records(:,runs)] ...
        = SIFO( func, fcnid, dim, lb, ub, iterMax, params);
end
%% Results
[~,ib] = min(f_best);
Xbest = x_best(ib,:);
Best = min(f_best)
Mean = mean(f_best)
Std = std(f_best)
%%
figure(1)
subplot(1,2,1)
xp = linspace(-100,100,1000);
yp = linspace(-100,100,1000);
[Xp,Yp] = meshgrid(xp,yp);
Zp = zeros(size(Xp));
for i = 1:length(Xp(:))
    Zp(i) = feval(obj, [Xp(i),Yp(i)]',fcnid);
end
surfc(Xp,Yp,Zp,'EdgeColor','none')
box on;
xlabel('x_1');
ylabel('x_2');
zlabel(['F_{',num2str(fcnid),'}(x_1,x_2)']);
title(['F',num2str(fcnid),', n=2'])
view(3)

subplot(1,2,2)
semilogy(mean(f_best_records,2),'r','LineWidth',1);hold on
grid on
ylabel('Average Best');
xlabel('Iteration');
title(['F',num2str(fcnid),', n=',num2str(dim)])
%%
table = [Mean,Std,Best]
figure(2)
semilogy(f_best_records)

