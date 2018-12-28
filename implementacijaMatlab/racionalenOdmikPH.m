function [w, Os] = racionalenOdmikPH( u,v,x0,y0,d )
%racionalenOdmihPH vrne kontrolne tocke racionalnega odmika za razdaljo d
%krivulje s pitagorejskim hodogramom podane z Bernsteinovima polinomoma u
%in v ter zacetno tocko (x0,y0)

xy = ravninskaKrivuljaPH(u,v,x0,y0);
% P_k = (ws(k),xs(k),ys(k)), k=1,...,n+1
ws = ones(size(xy,1),1); xs = xy(:,1); ys = xy(:,2);
Ps = [ws, xs, ys];
% dPt_k = (dws(k),dxs(k),dys(k)), k=1,...,n
dws = diff(ws); dxs = diff(ys); dys = -diff(xs);
dPts = [dws, dxs, dys];
% n, sigma_k ...
n = length(dws); sigmas = sigmaPH(u,v);

Os = zeros(2*n, 3);
for k = 0:2*n-1
    for j = max(0,k-n):min(n-1,k)
        Os(k+1,:) = Os(k+1,:) + nchoosek(n-1,j)*nchoosek(n,k-j)/...
            nchoosek(2*n-1,k)*(sigmas(j+1)*Ps(k-j+1,:)+d*n*dPts(j+1,:));
    end
end
w = Os(:,1);
Os = [Os(:,2)./w, Os(:,3)./w];
end

