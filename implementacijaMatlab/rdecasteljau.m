function b = rdecasteljau (B,w,t)
% Opis :
% rdecasteljau vrne tocko na racionalni Bezierjevi
% krivulji , ki je izracunana z de Casteljaujevim
% postopkom , prirejenim za racionalni primer
%
% Definicija :
% b = rdecasteljau (B,w,t)
%
% Vhodni podatki :
% B matrika , katere vrstica predstavlja koordinate
% kontrolne tocke racionalne Bezierjeve krivulje ,
% w seznam uteži racionalne Bezierjeve krivulje ,
% t število , ki doloca vrednost delilnega parametra v
% de Casteljaujevem postopku
%
% Izhodni podatek :
% b vrstica , ki predstavlja tocko na racionalni
% Bezierjevi krivulji pri parametru t

n = size(B,1) - 1;
d = size(B,2);

b = NaN(n+1, d);
w1 = w;
w2 = w;
for i = 0:n
    b(i+1,:) = B(i+1,:);
end

for r = 1:n
    for i = 0:(n-r)
        w2(i+1) = (1-t)*w1(i+1) + t*w1(i+2);
        b(i+1,:) = ((1-t)*w1(i+1)/w2(i+1)).*b(i+1,:);
        b(i+1,:) = b(i+1,:) + (t*w1(i+2)/w2(i+1)).*b(i+2,:);
        w1(i+1) = w2(i+1);
    end
end

b = b(1,:);

end

