function tan = tangentaPH( u,v,t )
%tangentaPH vrne normiran tangentni vektor na krivuljo s pitagorejskim hodogramom
%definiranim z Bernsteinovima polinomoma u in v v tocki t

au = bernstein2power(u);
av = bernstein2power(v);
lau = length(au);
lav = length(av);
aux = au'*au;
avx = av'*av;
ax = zeros(1, 2*max(lau,lav)-1);
for i = 1:lau
    for j = 1:lau
        ax(length(ax)-i-j+2) = ax(length(ax)-i-j+2) + aux(lau-i+1,lau-j+1);
    end
end
for i = 1:lav
    for j = 1:lav
        ax(length(ax)-i-j+2) = ax(length(ax)-i-j+2) - avx(lav-i+1,lav-j+1);
    end
end

aBy = 2*au'*av;
ay = zeros(1, lau+lav-1);
for i = 1:lau
    for j = 1:lav
        ay(i+j-1) = ay(i+j-1) + aBy(i,j);
    end
end

Bx = power2bernstein([zeros(max(0,length(ay)-length(ax)),1), ax]);
By = power2bernstein([zeros(max(0,length(ax)-length(ay)),1), ay]);
tan = [bezier(Bx',t); bezier(By',t)]/parSpeedPH(u,v,t);

end

