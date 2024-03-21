function projeto()

function [dfx1, dfx2] = calcular_derivadas_parciais(of)
    syms x1 x2

    dfx1 = diff(of([x1; x2]), x1);
    dfx2 = diff(of([x1; x2]), x2);



f1=@(x) (x(1)^2-100)*(x(1)^2-81)+(x(2)^2-25)*(x(2)^2-16)-a*cos(x(1)-b)*cos(x(2)-c);

r = @(x) 100*(x(2)-x(1)^2)^2 + (1-x(1))^2;
f = @(x) ((x(1))^2 - 100)*((x(1))^2 - 61) + ((x(2))^2 - 25)*((x(2))^2 - 16) - 15*cos(x(1)-(7/5))*cos(x(2)-(9/2));
g = @(x) x(1)*(x(1) + 3)*(x(1) - 3)*(x(1) - 5) + x(2)*(x(2) + 3)*(x(2) - 3)*(x(2) - 5);

[df_x1, df_x2] = calcular_derivadas_parciais(f1);

df = df_x1, df_x2;

display(df)


% fazer funçao que chame os 3 metodos
% perguntar pelas derivadas
% perguntar por qual metodo devemos de começar