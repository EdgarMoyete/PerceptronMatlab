%Edgar Moises Hernandez-Gonzalez
%Creado: 06/02/18
%Modificado: 04/04/19
%Perceptron simple con procedimiento de convergencia (regla delta)

%Funcion de Activacion Escalon Simetrico de 1 a -1
function [salidas, pesos, bias] = FPerceptron(entradas, objetivos, COEF_APREN, epocas)
    entradas=entradas'; %transpuesta
    objetivos=objetivos'; %transpuesta
    [f,c]=size(entradas); %f = #variables Xi...Xn y c = numero de datos
    pesos=rand(1,f) %pesos
    bias=rand; %bias
    for epocas=1:epocas %epocas
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
end