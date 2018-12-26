function B = ravninskaKrivuljaPH( u,v,x0,y0 )
% Opis :
% ravninskaKrivuljaPH vrne kontrolne toèke krivulje s Pitagorejskim hodogramom
% glede na polinomski funkciji u in v, ki sta podani v Bernsteinovi bazi,
% ter toèko p0
%
% Definicija :
% B = ravninskaKrivuljaPH( u,v,x0,y0 )
%
% Izhodni podatek :
% B ... matrika velikosti 2 x (2*max(m,n)+1) s koordinatami kontrolnih toèk
%
% Vhodni podatek :
% u ... vektor dolžine (n+1) koeficientov Bernsteinovega polinoma u stopnje n
% v ... vektor dolžine (m+1) koeficientov Bernsteinovega polinoma v stopnje m
% p0 ... koordinate prve kontrolne toèke
%
% w(t) = 1

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

Bx = power2bernstein([zeros(max(0,length(ay)-length(ax)),1), ax./(length(ax):-1:1),0]);
By = power2bernstein([zeros(max(0,length(ax)-length(ay)),1), ay./(length(ay):-1:1),0]);
B = [Bx+ones(1,length(Bx))*x0; By+ones(1,length(By))*y0]';
end