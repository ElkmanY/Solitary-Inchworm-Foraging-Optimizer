clearvars
clc

%%

fcnid = 3;
obj2 = 'cec17_func';

dim = 30;
lb = -100*ones(1,dim);
ub = 100*ones(1,dim);
iterMax = 1e4;
runsMax = 1;
params = [2,1,0.5,100,0];

tic
for runs = 1:runsMax
    
    [f_best(runs,:),x_best(runs,:),f_best_records(:,runs)] ...
        = SIFO ( obj2,fcnid, dim, lb,ub, iterMax,params);

end
ct = toc/runsMax;


figure(1)
semilogy(mean(f_best_records,2),'r','LineWidth',2);
[~,ib] = min(f_best);
Xbest = x_best(ib,:)
Best = min(f_best)
Mean = mean(f_best)
Worst = max(f_best)
Std = std(f_best)
