function plotrodmikPH( u,v,x0,y0,t,d,naslov )
%plotrodmikPH izrise odmike od krivulje s pitagorejskim hodogramom
% definiranim z Bernsteinovima polinomoma u in v in zacetno tocko (x0, y0)
% za razdalje z vrednostmi v d
for j = d
    [w, Os] = racionalenOdmikPH(u,v,x0,y0,j);
    plotrbezier (Os,w,t,false)
end
title(naslov);

end

