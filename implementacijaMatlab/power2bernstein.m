function b = power2bernstein( p )
% Opis :
% power2bernstein pretvori polinom , predstavljen s
% koeficienti v potencni bazi , v polinom , predstavljen
% v Bernsteinovi bazi
%
% Definicija :
% b = power2bernstein (p)
%
% Vhodni podatek :
% p seznam koeficientov dolžine n+1, ki po vrsti
% pripadajo razvoju polinoma stopnje n v potencni
% bazi od x^n do 1
%
% Izhodni podatek :
% b seznam koeficientov dolžine n+1, ki po vrsti
% pripadajo razvoju polinoma stopnje n v Bernsteinovi
% bazi od 0- tega do n- tega Bernsteinovega baznega
% polinoma

n = length(p)-1;
b = zeros(1, n+1);
for i = 0:n
    if p(n-i+1) ~= 0
        for j = i:n
            b(j+1) = b(j+1) + p(n-i+1)*nchoosek(j,i)/nchoosek(n,i);
        end
    end
end
    
b;    
end

