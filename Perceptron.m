%Edgar Moises Hernandez-Gonzalez
%Creado: 06/02/18
%Modificado: 04/04/19
%Perceptron simple con procedimiento de convergencia (regla delta)

clear %limpiar variables
clc %limpiar pantalla

%entradas y salidas deseadas, 4 datos de 2 entradas (variables) y la salida = 1 clase
entradas=  [0 0;
            0 1;
            1 0;
            1 1];
objetivos= [-1;
            -1;
            -1;
            1];
entradas=entradas'; %transpuesta
objetivos=objetivos'; %transpuesta

[f,c]=size(entradas); %f = #variables Xi...Xn y c = numero de datos
pesos=rand(1,f) %pesos
bias=rand; %bias
COEF_APREN=0.7; %coeficiente de aprendizaje
for epocas=1:5 %epocas
    for i=1:c
        net(i)=0;
        for j=1:f %sumatoria
            net(i)=net(i)+entradas(j,i)*pesos(1,j);
        end
        net(i)=net(i)-bias; %net para pasarla a la funcion de activacion
        if (net(i)>=0) %funcion de activacion escalon simetrico
            salidas(i)=1;
        else
            salidas(i)=-1;
        end
        delta=objetivos(i)-salidas(i); %regla delta
        for j=1:f %ajuste de los pesos
            pesos(1,j)=pesos(1,j)+COEF_APREN*delta*entradas(j,i);
        end
        bias=bias-COEF_APREN*delta; %ajuste del bias
    end
    disp(['iteracion: ',int2str(epocas)]);
    pesos
    salidas
end

% %Probar red neuronal entrenada, descomente si desea probar
% probar=input('Ingrese vector a probar: ')';%ingrese vector a probar
% prueba=(probar(1,1)*pesos(1,1)+probar(2,1)*pesos(1,2))-bias;%net de la prueba
% if(prueba>=0)%funcion escalon
%    1
% else
%    -1
% end