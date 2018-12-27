function t = naravnaParametrizacijaPH( N, u,v, r )
%naravnaParametrizacijaPH vrne seznam parametrov t, med katerimi je lok
%krivulje podane z u in v enako dolg, N je stevilo korakov s od
%0 do 1, r je stevilo iteracij

ds = dolzinaPH(u,v,0,1)/N;
t = 0:1/N:1;

tstar = t;
for i = 2:N+1
    t(i) = tstar(i-1) + ds/parSpeedPH(u,v,tstar(i-1));
end

for k = 1:r
    tstar = t;
    for i = 2:N+1
        t(i) = tstar(i) - ...
            dolzinaPH(u,v,0,tstar(i))/...
            parSpeedPH(u,v,tstar(i));
    end
end

end

