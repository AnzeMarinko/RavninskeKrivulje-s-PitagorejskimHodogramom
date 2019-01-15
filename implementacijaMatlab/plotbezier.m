function plotbezier (B,t,kontrolniPoligon, naslov, barva)
% Opis :
% plotbezier nari�e Bezierjevo krivuljo za dane kontrolne
% tocke in seznam parametrov
%
%Definicija :
% plotbezier (B,t, kontrolniPoligon, naslov, barva)
%
%Vhodni podatki :
% B matrika velikosti n+1 x d, ki predstavlja kontrolne
% tocke Bezierjeve krivulje stopnje n v
% d- dimenzionalnem prostoru ,
% t seznam parametrov dol�ine k, pri katerih racunamo
% vrednost Bezierjeve krivulje
% kontrolniPoligon je logicna spremenljivka, �e je true izri�e kontrolni
% poligon

if size(B,2) == 2
    % bezierjeva krivulja
    b = bezier(B,t);
    if barva == ''
        plot(b(1,:),b(2,:));
    else
        plot(b(1,:),b(2,:),barva);
    end
    hold on;

    % kontrolni poligon
    if kontrolniPoligon == true
        plot(B(:,1),B(:,2),'r:.');
    end
end
if size(B,2) == 3
    % bezierjeva krivulja
    b = bezier(B,t);
    plot3(b(1,:),b(2,:),b(3,:));
    hold on;

    % kontrolni poligon
    if kontrolniPoligon == true
        plot3(B(:,1),B(:,2),B(:,3),'r:.');
    end
end
title(naslov);
daspect([1 1 1]);

end

