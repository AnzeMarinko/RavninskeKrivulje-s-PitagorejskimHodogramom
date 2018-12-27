function s = sigmaPH( u,v )
%sigmaPH vrne koeficiente bernsteinovega polinoma parametricne hitrosti
%   krivulje podane z u in v

au = bernstein2power(u);
av = bernstein2power(v);
lau = length(au);
lav = length(av);
aux = au'*au;
avx = av'*av;
au1 = zeros(2*lau-1,1);
for i = 1:lau
    for j = 1:lau
        au1(2*lau-i-j+1) = au1(2*lau-i-j+1) + aux(lau-i+1,lau-j+1);
    end
end

av1 = zeros(2*lav-1,1);
for i = 1:lav
    for j = 1:lav
        av1(2*lav-i-j+1) = av1(2*lav-i-j+1) + avx(lav-i+1,lav-j+1);
    end
end
s = power2bernstein([zeros(2*max(0,lav-lau),1); au1] + ...
                    [zeros(2*max(0,lau-lav),1); av1])';

end

