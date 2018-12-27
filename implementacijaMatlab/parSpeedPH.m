function sigma = parSpeedPH( u,v,t )
%parSpeedPH vrne parametrično hitrost ravninske krivulje s PH podane z
%Bernsteinovima polinomoma u in v pri parametru t

sigma = bezier(sigmaPH(u,v),t);

end

