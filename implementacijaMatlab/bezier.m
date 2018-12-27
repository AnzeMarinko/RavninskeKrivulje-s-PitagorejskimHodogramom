function b = bezier (B,t)
% Opis :
% bezier vrne tocke na Bezierjevi krivulji pri danih
% parametrih
%
% Definicija :
% b = bezier (B,t)
%%Vhodna podatka :
% B matrika velikosti n+1 x d, ki predstavlja kontrolne
% tocke Bezierjeve krivulje stopnje n v
% d- dimenzionalnem prostoru ,
% t seznam parametrov dolžine k, pri katerih racunamo
% vrednost Bezierjeve krivulje
%
% Izhodni podatek :
% b matrika velikosti k x d, kjer i-ta vrstica
% predstavlja tocko na Bezierjevi krivulji pri
% parametru iz t na i- tem mestu
nd = size(B);
n = nd(1)-1; % imamo n toèk
d = nd(2);   % so v d-dimenzionalnem prostoru
b = zeros(d, length(t));

for i = 1:d
    for j = 1:length(t)
        d = decasteljau(B(:,i),t(j));
        b(i,j) = d(1,n+1);
    end
end

b;
end

