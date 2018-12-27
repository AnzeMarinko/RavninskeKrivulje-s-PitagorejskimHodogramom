function s = dolzinaPH( u,v,a,b )
%dolzinaPH vrne dolzino loka krivulje s PH podane z Bernsteinovima
%polinomoma u in v od parametra a do b

sigmas = sigmaPH(u,v);
n = length(sigmas);
koefs = zeros(n+1,1);
for i = 1:n
    koefs(i+1) = sum(sigmas(1:i))/n;
end
s = bezier(koefs,b) - bezier(koefs,a);

end

