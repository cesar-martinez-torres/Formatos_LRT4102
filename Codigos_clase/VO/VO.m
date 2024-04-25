% Configuración de la cámara web
cam = webcam;

% Configuración del número mínimo de descriptores
min_descriptores = 10;

% Captura la imagen inicial
disp('Presiona una tecla para capturar la imagen inicial...');
pause;
imagen_inicial = snapshot(cam);

% Mostramos la imagen inicial
figure;
imshow(imagen_inicial);
title('Imagen Inicial');

% Resaltamos algunos detalles
disp('Haz clic en al menos 10 puntos en la imagen y presiona Enter...');
[x, y] = ginput(min_descriptores);
hold on;
plot(x, y, 'ro', 'MarkerSize', 10, 'LineWidth', 2);
hold off;

% Captura la imagen después de dar un paso
disp('Presiona una tecla para capturar la imagen después del paso...');
pause;
imagen_despues_paso = snapshot(cam);

% Mostramos la imagen después del paso
figure;
imshow(imagen_despues_paso);
title('Imagen Después del movimiento');

% Resaltamos algunos detalles en esta nueva imagen
disp('Haz clic en los mismos puntos en la nueva imagen y presiona Enter...');
[x_despues, y_despues] = ginput(min_descriptores);
hold on;
plot(x_despues, y_despues, 'ro', 'MarkerSize', 10, 'LineWidth', 2);
hold off;

% Cierra la cámara web
clear cam;

% Comparación y cálculo de movimiento
points_inicial = detectSURFFeatures(rgb2gray(imagen_inicial), 'MetricThreshold', 1000);
points_despues = detectSURFFeatures(rgb2gray(imagen_despues_paso), 'MetricThreshold', 1000);

[features_inicial, valid_points_inicial] = extractFeatures(rgb2gray(imagen_inicial), points_inicial);
[features_despues, valid_points_despues] = extractFeatures(rgb2gray(imagen_despues_paso), points_despues);

index_pairs = matchFeatures(features_inicial, features_despues, 'Unique', true);

matched_points_inicial = valid_points_inicial(index_pairs(:, 1));
matched_points_despues = valid_points_despues(index_pairs(:, 2));

% Muestra los detalles comunes
figure;
showMatchedFeatures(imagen_inicial, imagen_despues_paso, matched_points_inicial, matched_points_despues);
legend('Detalles en la Imagen Inicial', 'Detalles en la Imagen Después del Paso');

% Cálculo del movimiento
desplazamiento_promedio_x = mean(matched_points_despues.Location(:, 1) - matched_points_inicial.Location(:, 1));
desplazamiento_promedio_y = mean(matched_points_despues.Location(:, 2) - matched_points_inicial.Location(:, 2));

% Muestra el desplazamiento calculado
fprintf('Desplazamiento promedio en x: %.2f\n', desplazamiento_promedio_x);
fprintf('Desplazamiento promedio en y: %.2f\n', desplazamiento_promedio_y);
 
% https://www.cvlibs.net/datasets/kitti/
 