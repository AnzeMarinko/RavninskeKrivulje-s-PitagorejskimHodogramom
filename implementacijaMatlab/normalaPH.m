function norm = normalaPH( u,v,t )
%normalaPH vrne normiran vektor, ki je normala na krivuljo s pitagorejskim
%hodogramom definiranim z Bernsteinovima polinomoma u in v pri parametru t

tan = tangentaPH(u,v,t);
norm = [tan(2), -tan(1)];

end

