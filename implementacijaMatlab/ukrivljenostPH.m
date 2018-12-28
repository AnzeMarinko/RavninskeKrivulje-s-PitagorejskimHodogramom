function kappa = ukrivljenostPH( u,v,t )
%ukrivljenostPH vrne ukrivljenost krivulje s pitagorejskim hodogramom
%definiranim z Bernsteinovima polinomoma u in v pri parametru t

au = bernstein2power(u);
av = bernstein2power(v);
lau = length(au);
lav = length(av);
dau = au(1:lau-1).*((lau-1):-1:1);
dav = av(1:lav-1).*((lav-1):-1:1);
aux = au'*dau;
avx = av'*dav;
ax = zeros(1, 2*max(lau,lav)-2);
for i = 1:lau
    for j = 1:lau-1
        ax(length(ax)-i-j+2) = ax(length(ax)-i-j+2) + aux(lau-i+1,lau-j);
    end
end
for i = 1:lav
    for j = 1:lav-1
        ax(length(ax)-i-j+2) = ax(length(ax)-i-j+2) - avx(lav-i+1,lav-j);
    end
end

kappa = bezier(power2bernstein(ax)',t)/parSpeedPH(u,v,t)^2;

end

