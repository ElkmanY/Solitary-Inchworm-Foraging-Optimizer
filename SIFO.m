function [x_best,f_best,f_best_records] ...
    = SIFO(obj,dim,lb,ub,iterMax,params)
% Solitary inchworm foraging optimizer
%%
if nargin<6
    params = [0.8,50,0.5];
end
alpha = params(1);
m = params(2);
delta = params(3);
%%
ntry = 1;
xH = lhsdesign(ntry,dim).^(dim).*(ub-lb) + lb;
fx = feval(obj, xH);
[fb,ib] = min(fx);
xH = xH(ib,:);
fH = fb;
xT = xH;
fT = fH;
g = xH;
fg = fH;
G = g;
fG = fg;
L = alpha*(ub-lb);
h = L;
mu = zeros(1,dim);
sigma = ones(1,dim)*10;
E = 1;
Es = .001/iterMax/m;
Ef = 0.002;
Ew = 2;
km = 1;
%%
f_best_records = zeros(1,iterMax);
for iter = 1:iterMax
    if E >= Ew
        R = rand(1,dim);
        xi = mu -sqrt(2)*sigma.* erfinv((1 - R).* erf((mu + 1)/sqrt(2)./sigma) + R.* erf((mu - 1)/sqrt(2)./sigma));
        xv = xi.*(ub-lb) + lb;
        fv = feval(obj, xv);
        flag = fv<fH;
        mu_ = tanh(mu + 1/200*(-1).^(~flag)*(xv-xH));
        sigma2 = sigma.^2 + .01*(  mu.^2 - mu_.^2 + 1/200*(-1).^(~flag)*(xv.^2-xH.^2) );
        sigma2 = min(max(sigma2,1e-3),10);
        mu = mu_;
        sigma = sqrt(sigma2);
        xH = xH + 1./vecnorm(xv-xH).*(xv-xH).*h*rand(1)^(1/dim);
        xH = min(max(xH,lb),ub);
        fH = feval(obj, xH);
        b = exp(-2*E);
        xT = xT + (1-b)*(xH-xT);
        xT = min(max(xT,lb),ub);
        fT = feval(obj, xT);
        E = E - Ec(b);
    elseif E> 0
        p = zeros(m,dim);
        for i = 1:m
            if rand(1)<rand(1)
                p(i,:) = (2*rand(1,dim)-1).*h + xT;
            else
                U = rand(1,dim)<0.5;
                p(i,:) = (2*rand(1,dim)-1).*h + U.*G + (1-U).*xH;
            end
        end
        d = rand(m,1).^(1/dim).*(p - xH)./vecnorm((p - xH)')';
        q = xH + h.*d;
        fq = feval(obj, q);
        [~,ib] = min(fq);
        
        gamma = exp((iter-iterMax)/iterMax);
        xH = xH + delta*h.^(gamma).*(p(ib,:) - xH)/norm(p(ib,:) - xH);

        xH = min(max(xH,lb),ub);
        fH = feval(obj, xH);
        b = exp(-2*E);
        xT = xT + (1-b)*(xH-xT);
        xT = min(max(xT,lb),ub);
        fT = feval(obj, xT);
        E = E - Ec(b) - m*Es;
    else
        
        xT = xT + h*Levy(1,dim);
        xT = min(max(xT,lb),ub);
        fT = feval(obj, xT);
        xH = xT;
        fH = fT;
        g = xT;
        fg = fT;
        h = L;
        E = 1;
        km = iter;
    end
    dh = sin(-(iter-km)/2/iterMax*pi).^2;
    s = tanh((fg-fH)/fH);
    h =  h + dh.*s.*h;
    if fH<fg || fT<fg

        if fH<fT
            fg = fH;
            g = xH;
        else
            fg = fT;
            g = xT;
        end
        E = E*1 + 1*Ef;
    end
    if fg<fG
        G = g;
        fG = fg;
    end
    f_best_records(iter) = fG;
end
x_best = G;
f_best = fG;
end
%%
function E = Ec(b)
ymax = (((1-0.12)/2).^([0.3,0.4,0.5,0.6,0.7]))*[-10.79,64.421,-142.864,142.388,-52.931]';
ym = (((1-b)/2).^([0.3,0.4,0.5,0.6,0.7]))*[-10.79,64.421,-142.864,142.388,-52.931]';
K = 1e3;
E = ym/ymax/K;
end
function s = Levy(n,dim)
beta = 3/2;
sigma_u = ( gamma(1+beta)*sin(pi*beta/2)/(gamma((1+beta)/2))*beta*2^((beta-1)/2) )^(1/beta);
sigma_v = 1.5;
u = normrnd(0,sigma_u,n,dim);
v = normrnd(0,sigma_v,n,dim);
s = u./( (abs(v)).^(1/beta) );
end
