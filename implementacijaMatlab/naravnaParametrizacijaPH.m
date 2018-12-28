function t = naravnaParametrizacijaPH( N, u,v, r )
%naravnaParametrizacijaPH vrne seznam parametrov t, med katerimi je lok
%krivulje podane z u in v enako dolg, N je stevilo korakov s od
%0 do 1, r je stevilo iteracij

ds = dolzinaPH(u,v,0,1)/N;
t = 0:1/N:1;

for i = N+1:-1:2
    t(i) = t(i-1) + ds/parSpeedPH(u,v,t(i-1));
end

for k = 1:r
    for i = 2:N+1
        t(i) = t(i) + ...
            ((i-1)*ds - dolzinaPH(u,v,0,t(i)))/...
            parSpeedPH(u,v,t(i));
    end
end
s = zeros(N+1,1);
for i = 1:N+1
    s(i) = dolzinaPH(u,v,0,t(i));
end
s = diff(s./dolzinaPH(u,v,0,1));
mean(s)
max(s)-min(s)
% -> [1/N, 0]?
end

