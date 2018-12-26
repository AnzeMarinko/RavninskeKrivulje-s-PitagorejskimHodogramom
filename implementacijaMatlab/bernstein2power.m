function p = bernstein2power( b )
% Opis :
% bernstein2power pretvori polinom , predstavljen s
% koeficienti v Bernsteinovi bazi , v polinom , predstavljen
% v potenèni bazi
%
% Definicija :
% p = bernstein2power (b)
%
% Izhodni podatek :
% b seznam koeficientov dolžine n+1, ki po vrsti
% pripadajo razvoju polinoma stopnje n v Bernsteinovi
% bazi od 0- tega do n- tega Bernsteinovega baznega
% polinoma
%
% Vhodni podatek :
% p seznam koeficientov dolžine n+1, ki po vrsti
% pripadajo razvoju polinoma stopnje n v potencni
% bazi od x^n do 1

n = length(b)-1;
p = zeros(1, n+1);
for i = 0:n
    if b(i+1) ~= 0
        for j = i:n
            p(n-j+1) = p(n-j+1) + b(i+1)* nchoosek(j,i)*nchoosek(n,j)*(-1)^(i+j);
        end
    end
end
    
p;    
end