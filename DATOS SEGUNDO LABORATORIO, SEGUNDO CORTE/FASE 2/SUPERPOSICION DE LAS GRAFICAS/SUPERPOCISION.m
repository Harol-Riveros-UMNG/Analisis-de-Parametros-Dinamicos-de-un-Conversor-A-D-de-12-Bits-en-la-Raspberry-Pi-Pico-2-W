% SUPERPOSICION DE LAS 4 PRUEBAS - ADC
clear; 
clc; 
close all;
%% Seleccionar la carpeta que contiene las 4 pruebas

carpeta_principal = uigetdir(pwd, 'Seleccione la carpeta que contiene PRUEBA 1, PRUEBA 2, PRUEBA 3 y PRUEBA 4');

if carpeta_principal == 0
    error('No se seleccionó ninguna carpeta.');
end

%% Nombres de las carpetas

carpetas = {'PRUEBA 1 (128)' 'PRUEBA 2 (256)' 'PRUEBA 3 (512)' 'PRUEBA 4 (1024)'};

% 1. DOMINIO DEL TIEMPO

figure('Color','w');
hold on;
grid on;

for i = 1:4

    % Construir ruta completa
    ruta = fullfile(carpeta_principal, carpetas{i}, 'adc_samples_250p0Hz_hann.csv');

    % Verificar que exista
    if ~isfile(ruta)
        error('No se encontró el archivo: %s', ruta);
    end

    % Leer CSV
    data_t = readtable(ruta);

    % Graficar
    plot(data_t.time_s * 1000, data_t.voltage_V, 'LineWidth', 1.2);

end

xlabel('Tiempo [ms]');
ylabel('Voltaje [V]');
title('Señales ADC superpuestas en el dominio del tiempo');

xlim([0 20]);

legend( 'Prueba 1 (128)', 'Prueba 2 (256)', 'Prueba 3 (512)', 'Prueba 4 (1024)', 'Location','best');

hold off;

% 2. DOMINIO DE LA FRECUENCIA

figure('Color','w');
hold on;
grid on;

for i = 1:4

    % Construir ruta completa
    ruta = fullfile(carpeta_principal, carpetas{i}, 'adc_fft_250p0Hz_hann.csv');

    % Verificar que exista
    if ~isfile(ruta)
        error('No se encontró el archivo: %s', ruta);
    end

    % Leer CSV
    data_f = readtable(ruta);

    % Graficar FFT
    plot(data_f.frequency_Hz, data_f.magnitude_dBFS, 'LineWidth', 1.2);

end

xlabel('Frecuencia [Hz]');
ylabel('Magnitud [dBFS]');
title('Espectros FFT superpuestos');

xlim([0 1000]);
ylim([-120 5]);

legend( 'Prueba 1 (128)', 'Prueba 2 (256)', 'Prueba 3 (512)', 'Prueba 4 (1024)', 'Location','best');

hold off;