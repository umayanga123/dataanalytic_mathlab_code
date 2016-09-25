sD = som_read_data('mydata.txt'); 
sD = som_normalize(sD ,'var');
sM = som_make(sD);
sM = som_autolabel(sM,sD,'vote');




[K,P] = som_estimate_gmm(sM,sD);
[pd,Pdm,pmd] = som_probability_gmm(sD,sM,K,P);

%    Here is the probability density function value for the first data
%    sample (x=sD.data(:,1)) in terms of each map unit (m):

som_cplane(sM,Pdm(:,1))
colorbar
title('p(x|m)')




sM = som_supervised(sD,'small');

som_show(sM,'umat','all');
som_show_add('label',sM.labels,'TextSize',8,'TextColor','r')

sD2 = som_label(sD,'clear','all'); 
sD2 = som_autolabel(sD2,sM);       % classification
ok = strcmp(sD2.labels,sD.labels); % errors
100*(1-sum(ok)/length(ok))         % error percentage (%)

echo off



