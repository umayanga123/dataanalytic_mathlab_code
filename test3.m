sD = som_read_data('mydata.txt'); 
sD = som_normalize(sD ,'var');
sM = som_make(sD);
sM = som_autolabel(sM,sD,'vote');

[Pd,V,me] = pcaproj(sD.data,2);        % project the data
Pm        = pcaproj(sM.codebook,V,me); % project the prototypes
colormap(hot);

colormap(1-gray)
som_show(sM,'umat','all');

%[Pd,V,me]=pcaproj(sD,3);
%{
som_grid(sM,'Coord',pcaproj(sM,V,me),'marker','none','Label',sM.labels,'labelcolor','k');
hold on,grid on

colD = [ repmat([1 0 0],70,1); repmat([0 1 0],69 ,1);repmat([0 0 1],33,1);repmat([1 1 1],46,1)];
som_grid('rect',[218 ,1] ,'Line','none','Coord',Pd ,'Markercolor',colD);
%}



%{
M = som_denormalize(sM.codebook,sM);
colM = zeros(length(sM.codebook),3);
un = unique(sD.labels);
for i =1:3 , ind = find(strcmp(sM.labels, un(i))); colM(ind , i)=1;end


som_grid(sM , 'Coord',M(:,2:4),'MarkerSize',(M(:,1)-4)*5,'Markercolor',colM);
hold on , grid on
D = som_denormalize(sD.data,sD);
som_grid('rect',[150 1],'Coord',D(:,2:4) ,'Marker','x','MarkerSize',(D(:,1)-4)*5,'Line','none','Markercolor',colD);
%}




