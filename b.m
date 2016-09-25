
sD = som_read_data('mydata.txt'); 
sD = som_normalize(sD ,'var');

sM = som_make(sD);
sM = som_autolabel(sM,sD,'vote');

[Pd,V,me]=pcaproj(sD,17);
%%som_grid(sM,'Coord',pcaproj(sM,V,me),'marker','none','Label',sM.labels,'labelcolor','k');

colD = [ repmat([1 0 0],50 , 1); repmat([0 1 0],50 ,1);repmat([0 0 1],50,1)];
som_grid('rect',[150 ,1] , 'Line','none','Coord' ,Pd , 'markercolor','colD');