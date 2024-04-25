% Limpieza y configuración inicial
clear;
close all;

% Calibración de la cámara
load('calibrationSession.mat');

% Configuración de la cámara web
cam = webcam;

% Captura la imagen 1
disp('Presiona una tecla para capturar la imagen 1...');
pause;
imagen_1 = snapshot(cam);


% Muestra la imagen 1 con los descriptores
points_1 = detectSURFFeatures(rgb2gray(imagen_1), 'MetricThreshold', 1000);
[features_1, valid_points_1] = extractFeatures(rgb2gray(imagen_1), points_1);

figure;
imshow(imagen_1);
hold on;
plot(valid_points_1);
title('Imagen 1 con Descriptores');
hold off;

% Captura la imagen 2
disp('Presiona una tecla para capturar la imagen 2...');
pause;
imagen_2 = snapshot(cam);

% Muestra la imagen 2 con los descriptores
points_2 = detectSURFFeatures(rgb2gray(imagen_2), 'MetricThreshold', 1000);
[features_2, valid_points_2] = extractFeatures(rgb2gray(imagen_2), points_2);

figure;
imshow(imagen_2);
hold on;
plot(valid_points_2);
title('Imagen 2 con Descriptores');
hold off;

% Comparación y cálculo de desplazamiento entre Imagen 1 y 2
index_pairs_1_2 = matchFeatures(features_1, features_2, 'Unique', true);
matched_points_1_2 = valid_points_1(index_pairs_1_2(:, 1));
matched_points_2_2 = valid_points_2(index_pairs_1_2(:, 2));

% Muestra los detalles comunes entre las imágenes 1 y 2
figure;
showMatchedFeatures(imagen_1, imagen_2, matched_points_1_2, matched_points_2_2, 'montage');
title('Detalles comunes entre Imagen 1 y 2');

% Cálculo del desplazamiento entre las imágenes 1 y 2
desplazamiento_promedio_x_1_2 = mean(matched_points_1_2.Location(:, 1) - matched_points_2_2.Location(:, 1));
desplazamiento_promedio_y_1_2 = mean(matched_points_1_2.Location(:, 2) - matched_points_2_2.Location(:, 2));

fprintf('Desplazamiento promedio de la Imagen 1 a la Imagen 2 en x: %.2f\n', desplazamiento_promedio_x_1_2);
fprintf('Desplazamiento promedio de la Imagen 1 a la Imagen 2 en y: %.2f\n', desplazamiento_promedio_y_1_2);

% Captura la imagen 3
disp('Presiona una tecla para capturar la imagen 3...');
pause;
imagen_3 = snapshot(cam);

% Muestra la imagen 3 con los descriptores
points_3 = detectSURFFeatures(rgb2gray(imagen_3), 'MetricThreshold', 1000);
[features_3, valid_points_3] = extractFeatures(rgb2gray(imagen_3), points_3);

figure;
imshow(imagen_3);
hold on;
plot(valid_points_3);
title('Imagen 3 con Descriptores');
hold off;

% Comparación y cálculo de desplazamiento entre Imagen 2 y 3
index_pairs_2_3 = matchFeatures(features_2, features_3, 'Unique', true);
matched_points_2_3 = valid_points_2(index_pairs_2_3(:, 1));
matched_points_3_3 = valid_points_3(index_pairs_2_3(:, 2));

% Muestra los detalles comunes entre las imágenes 2 y 3
figure;
showMatchedFeatures(imagen_2, imagen_3, matched_points_2_3, matched_points_3_3, 'montage');
title('Detalles comunes entre Imagen 2 y 3');

% Cálculo del desplazamiento entre las imágenes 2 y 3
desplazamiento_promedio_x_2_3 = mean(matched_points_2_3.Location(:, 1) - matched_points_3_3.Location(:, 1));
desplazamiento_promedio_y_2_3 = mean(matched_points_2_3.Location(:, 2) - matched_points_3_3.Location(:, 2));

fprintf('Desplazamiento promedio de la Imagen 2 a la Imagen 3 en x: %.2f\n', desplazamiento_promedio_x_2_3);
fprintf('Desplazamiento promedio de la Imagen 2 a la Imagen 3 en y: %.2f\n', desplazamiento_promedio_y_2_3);

% Captura la imagen 4
disp('Presiona una tecla para capturar la imagen 4...');
pause;
imagen_4 = snapshot(cam);

% Muestra la imagen 4 con los descriptores
points_4 = detectSURFFeatures(rgb2gray(imagen_4), 'MetricThreshold', 1000);
[features_4, valid_points_4] = extractFeatures(rgb2gray(imagen_4), points_4);

figure;
imshow(imagen_4);
hold on;
plot(valid_points_4);
title('Imagen 4 con Descriptores');
hold off;

% Comparación y cálculo de desplazamiento entre Imagen 3 y 4
index_pairs_3_4 = matchFeatures(features_3, features_4, 'Unique', true);
matched_points_3_4 = valid_points_3(index_pairs_3_4(:, 1));
matched_points_4_4 = valid_points_4(index_pairs_3_4(:, 2));

% Muestra los detalles comunes entre las imágenes 3 y 4
figure;
showMatchedFeatures(imagen_3, imagen_4, matched_points_3_4, matched_points_4_4, 'montage');
title('Detalles comunes entre Imagen 3 y 4');

% Cálculo del desplazamiento entre las imágenes 3 y 4
desplazamiento_promedio_x_3_4 = mean(matched_points_3_4.Location(:, 1) - matched_points_4_4.Location(:, 1));
desplazamiento_promedio_y_3_4 = mean(matched_points_3_4.Location(:, 2) - matched_points_4_4.Location(:, 2));

fprintf('Desplazamiento promedio de la Imagen 3 a la Imagen 4 en x: %.2f\n', desplazamiento_promedio_x_3_4);
fprintf('Desplazamiento promedio de la Imagen 3 a la Imagen 4 en y: %.2f\n', desplazamiento_promedio_y_3_4);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Captura la imagen 5
disp('Presiona una tecla para capturar la imagen 5...');
pause;
imagen_5 = snapshot(cam);

% Muestra la imagen 5 con los descriptores
points_5 = detectSURFFeatures(rgb2gray(imagen_5), 'MetricThreshold', 1000);
[features_5, valid_points_5] = extractFeatures(rgb2gray(imagen_5), points_5);

figure;
imshow(imagen_5);
hold on;
plot(valid_points_5);
title('Imagen 5 con Descriptores');
hold off;

% Comparación y cálculo de desplazamiento entre Imagen 4 y 5
index_pairs_4_5 = matchFeatures(features_4, features_5, 'Unique', true);
matched_points_4_5 = valid_points_4(index_pairs_4_5(:, 1));
matched_points_5_5 = valid_points_5(index_pairs_4_5(:, 2));

% Muestra los detalles comunes entre las imágenes 4 y 5
figure;
showMatchedFeatures(imagen_4, imagen_5, matched_points_4_5, matched_points_5_5, 'montage');
title('Detalles comunes entre Imagen 4 y 5');

% Cálculo del desplazamiento entre las imágenes 4 y 5
desplazamiento_promedio_x_4_5 = mean(matched_points_4_5.Location(:, 1) - matched_points_5_5.Location(:, 1));
desplazamiento_promedio_y_4_5 = mean(matched_points_4_5.Location(:, 2) - matched_points_5_5.Location(:, 2));

fprintf('Desplazamiento promedio de la Imagen 4 a la Imagen 5 en x: %.2f\n', desplazamiento_promedio_x_4_5);
fprintf('Desplazamiento promedio de la Imagen 4 a la Imagen 5 en y: %.2f\n', desplazamiento_promedio_y_4_5);


% Captura la imagen 6
disp('Presiona una tecla para capturar la imagen 6...');
pause;
imagen_6 = snapshot(cam);

% Muestra la imagen 6 con los descriptores
points_6 = detectSURFFeatures(rgb2gray(imagen_6), 'MetricThreshold', 1000);
[features_6, valid_points_6] = extractFeatures(rgb2gray(imagen_6), points_6);

figure;
imshow(imagen_6);
hold on;
plot(valid_points_6);
title('Imagen 6 con Descriptores');
hold off;

% Comparación y cálculo de desplazamiento entre Imagen 5 y 6
index_pairs_5_6 = matchFeatures(features_5, features_6, 'Unique', true);
matched_points_5_6 = valid_points_5(index_pairs_5_6(:, 1));
matched_points_6_6 = valid_points_6(index_pairs_5_6(:, 2));

% Muestra los detalles comunes entre las imágenes 5 y 6
figure;
showMatchedFeatures(imagen_5, imagen_6, matched_points_5_6, matched_points_6_6, 'montage');
title('Detalles comunes entre Imagen 5 y 6');

% Cálculo del desplazamiento entre las imágenes 5 y 6
desplazamiento_promedio_x_5_6 = mean(matched_points_5_6.Location(:, 1) - matched_points_6_6.Location(:, 1));
desplazamiento_promedio_y_5_6 = mean(matched_points_5_6.Location(:, 2) - matched_points_6_6.Location(:, 2));

fprintf('Desplazamiento promedio de la Imagen 5 a la Imagen 6 en x: %.2f\n', desplazamiento_promedio_x_5_6);
fprintf('Desplazamiento promedio de la Imagen 5 a la Imagen 6 en y: %.2f\n', desplazamiento_promedio_y_5_6);


% Captura la imagen 7
disp('Presiona una tecla para capturar la imagen 7...');
pause;
imagen_7 = snapshot(cam);

% Muestra la imagen 7 con los descriptores
points_7 = detectSURFFeatures(rgb2gray(imagen_7), 'MetricThreshold', 1000);
[features_7, valid_points_7] = extractFeatures(rgb2gray(imagen_7), points_7);

figure;
imshow(imagen_7);
hold on;
plot(valid_points_7);
title('Imagen 7 con Descriptores');
hold off;

% Comparación y cálculo de desplazamiento entre Imagen 6 y 7
index_pairs_6_7 = matchFeatures(features_6, features_7, 'Unique', true);
matched_points_6_7 = valid_points_6(index_pairs_6_7(:, 1));
matched_points_7_7 = valid_points_7(index_pairs_6_7(:, 2));

% Muestra los detalles comunes entre las imágenes 6 y 7
figure;
showMatchedFeatures(imagen_6, imagen_7, matched_points_6_7, matched_points_7_7, 'montage');
title('Detalles comunes entre Imagen 6 y 7');

% Cálculo del desplazamiento entre las imágenes 6 y 7
desplazamiento_promedio_x_6_7 = mean(matched_points_6_7.Location(:, 1) - matched_points_7_7.Location(:, 1));
desplazamiento_promedio_y_6_7 = mean(matched_points_6_7.Location(:, 2) - matched_points_7_7.Location(:, 2));

fprintf('Desplazamiento promedio de la Imagen 6 a la Imagen 7 en x: %.2f\n', desplazamiento_promedio_x_6_7);
fprintf('Desplazamiento promedio de la Imagen 6 a la Imagen 7 en y: %.2f\n', desplazamiento_promedio_y_6_7);

% Captura la imagen 8
disp('Presiona una tecla para capturar la imagen 8...');
pause;
imagen_8 = snapshot(cam);

% Muestra la imagen 8 con los descriptores
points_8 = detectSURFFeatures(rgb2gray(imagen_8), 'MetricThreshold', 1000);
[features_8, valid_points_8] = extractFeatures(rgb2gray(imagen_8), points_8);

figure;
imshow(imagen_8);
hold on;
plot(valid_points_8);
title('Imagen 8 con Descriptores');
hold off;

% Comparación y cálculo de desplazamiento entre Imagen 7 y 8
index_pairs_7_8 = matchFeatures(features_7, features_8, 'Unique', true);
matched_points_7_8 = valid_points_7(index_pairs_7_8(:, 1));
matched_points_8_8 = valid_points_8(index_pairs_7_8(:, 2));

% Muestra los detalles comunes entre las imágenes 7 y 8
figure;
showMatchedFeatures(imagen_7, imagen_8, matched_points_7_8, matched_points_8_8, 'montage');
title('Detalles comunes entre Imagen 7 y 8');

% Cálculo del desplazamiento entre las imágenes 7 y 8
desplazamiento_promedio_x_7_8 = mean(matched_points_7_8.Location(:, 1) - matched_points_8_8.Location(:, 1));
desplazamiento_promedio_y_7_8 = mean(matched_points_7_8.Location(:, 2) - matched_points_8_8.Location(:, 2));

fprintf('Desplazamiento promedio de la Imagen 7 a la Imagen 8 en x: %.2f\n', desplazamiento_promedio_x_7_8);
fprintf('Desplazamiento promedio de la Imagen 7 a la Imagen 8 en y: %.2f\n', desplazamiento_promedio_y_7_8);

% Captura la imagen 9
disp('Presiona una tecla para capturar la imagen 9...');
pause;
imagen_9 = snapshot(cam);

% Muestra la imagen 9 con los descriptores
points_9 = detectSURFFeatures(rgb2gray(imagen_9), 'MetricThreshold', 1000);
[features_9, valid_points_9] = extractFeatures(rgb2gray(imagen_9), points_9);

figure;
imshow(imagen_9);
hold on;
plot(valid_points_9);
title('Imagen 9 con Descriptores');
hold off;

% Comparación y cálculo de desplazamiento entre Imagen 8 y 9
index_pairs_8_9 = matchFeatures(features_8, features_9, 'Unique', true);
matched_points_8_9 = valid_points_8(index_pairs_8_9(:, 1));
matched_points_9_9 = valid_points_9(index_pairs_8_9(:, 2));

% Muestra los detalles comunes entre las imágenes 8 y 9
figure;
showMatchedFeatures(imagen_8, imagen_9, matched_points_8_9, matched_points_9_9, 'montage');
title('Detalles comunes entre Imagen 8 y 9');

% Cálculo del desplazamiento entre las imágenes 8 y 9
desplazamiento_promedio_x_8_9 = mean(matched_points_8_9.Location(:, 1) - matched_points_9_9.Location(:, 1));
desplazamiento_promedio_y_8_9 = mean(matched_points_8_9.Location(:, 2) - matched_points_9_9.Location(:, 2));

fprintf('Desplazamiento promedio de la Imagen 8 a la Imagen 9 en x: %.2f\n', desplazamiento_promedio_x_8_9);
fprintf('Desplazamiento promedio de la Imagen 8 a la Imagen 9 en y: %.2f\n', desplazamiento_promedio_y_8_9);

% Captura la imagen 10
disp('Presiona una tecla para capturar la imagen 10...');
pause;
imagen_10 = snapshot(cam);

% Muestra la imagen 10 con los descriptores
points_10 = detectSURFFeatures(rgb2gray(imagen_10), 'MetricThreshold', 1000);
[features_10, valid_points_10] = extractFeatures(rgb2gray(imagen_10), points_10);

figure;
imshow(imagen_10);
hold on;
plot(valid_points_10);
title('Imagen 10 con Descriptores');
hold off;

% Comparación y cálculo de desplazamiento entre Imagen 9 y 10
index_pairs_9_10 = matchFeatures(features_9, features_10, 'Unique', true);
matched_points_9_10 = valid_points_9(index_pairs_9_10(:, 1));
matched_points_10_10 = valid_points_10(index_pairs_9_10(:, 2));

% Muestra los detalles comunes entre las imágenes 9 y 10
figure;
showMatchedFeatures(imagen_9, imagen_10, matched_points_9_10, matched_points_10_10, 'montage');
title('Detalles comunes entre Imagen 9 y 10');

% Cálculo del desplazamiento entre las imágenes 9 y 10
desplazamiento_promedio_x_9_10 = mean(matched_points_9_10.Location(:, 1) - matched_points_10_10.Location(:, 1));
desplazamiento_promedio_y_9_10 = mean(matched_points_9_10.Location(:, 2) - matched_points_10_10.Location(:, 2));

fprintf('Desplazamiento promedio de la Imagen 9 a la Imagen 10 en x: %.2f\n', desplazamiento_promedio_x_9_10);
fprintf('Desplazamiento promedio de la Imagen 9 a la Imagen 10 en y: %.2f\n', desplazamiento_promedio_y_9_10);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Grafica los desplazamientos acumulativos
figure;
plot([0, desplazamiento_promedio_x_1_2, desplazamiento_promedio_x_1_2 + desplazamiento_promedio_x_2_3, ...
      desplazamiento_promedio_x_1_2 + desplazamiento_promedio_x_2_3 + desplazamiento_promedio_x_3_4, ...
      desplazamiento_promedio_x_1_2 + desplazamiento_promedio_x_2_3 + desplazamiento_promedio_x_3_4 + desplazamiento_promedio_x_4_5, ...
      desplazamiento_promedio_x_1_2 + desplazamiento_promedio_x_2_3 + desplazamiento_promedio_x_3_4 + desplazamiento_promedio_x_4_5 + desplazamiento_promedio_x_5_6, ...
      desplazamiento_promedio_x_1_2 + desplazamiento_promedio_x_2_3 + desplazamiento_promedio_x_3_4 + desplazamiento_promedio_x_4_5 + desplazamiento_promedio_x_5_6 + desplazamiento_promedio_x_6_7, ...
      desplazamiento_promedio_x_1_2 + desplazamiento_promedio_x_2_3 + desplazamiento_promedio_x_3_4 + desplazamiento_promedio_x_4_5 + desplazamiento_promedio_x_5_6 + desplazamiento_promedio_x_6_7 + desplazamiento_promedio_x_7_8, ...
      desplazamiento_promedio_x_1_2 + desplazamiento_promedio_x_2_3 + desplazamiento_promedio_x_3_4 + desplazamiento_promedio_x_4_5 + desplazamiento_promedio_x_5_6 + desplazamiento_promedio_x_6_7 + desplazamiento_promedio_x_7_8 + desplazamiento_promedio_x_8_9, ...
      desplazamiento_promedio_x_1_2 + desplazamiento_promedio_x_2_3 + desplazamiento_promedio_x_3_4 + desplazamiento_promedio_x_4_5 + desplazamiento_promedio_x_5_6 + desplazamiento_promedio_x_6_7 + desplazamiento_promedio_x_7_8 + desplazamiento_promedio_x_8_9 + desplazamiento_promedio_x_9_10], ...
     [0, desplazamiento_promedio_y_1_2, desplazamiento_promedio_y_1_2 + desplazamiento_promedio_y_2_3, ...
      desplazamiento_promedio_y_1_2 + desplazamiento_promedio_y_2_3 + desplazamiento_promedio_y_3_4, ...
      desplazamiento_promedio_y_1_2 + desplazamiento_promedio_y_2_3 + desplazamiento_promedio_y_3_4 + desplazamiento_promedio_y_4_5, ...
      desplazamiento_promedio_y_1_2 + desplazamiento_promedio_y_2_3 + desplazamiento_promedio_y_3_4 + desplazamiento_promedio_y_4_5 + desplazamiento_promedio_y_5_6, ...
      desplazamiento_promedio_y_1_2 + desplazamiento_promedio_y_2_3 + desplazamiento_promedio_y_3_4 + desplazamiento_promedio_y_4_5 + desplazamiento_promedio_y_5_6 + desplazamiento_promedio_y_6_7, ...
      desplazamiento_promedio_y_1_2 + desplazamiento_promedio_y_2_3 + desplazamiento_promedio_y_3_4 + desplazamiento_promedio_y_4_5 + desplazamiento_promedio_y_5_6 + desplazamiento_promedio_y_6_7 + desplazamiento_promedio_y_7_8, ...
      desplazamiento_promedio_y_1_2 + desplazamiento_promedio_y_2_3 + desplazamiento_promedio_y_3_4 + desplazamiento_promedio_y_4_5 + desplazamiento_promedio_y_5_6 + desplazamiento_promedio_y_6_7 + desplazamiento_promedio_y_7_8 + desplazamiento_promedio_y_8_9, ...
      desplazamiento_promedio_y_1_2 + desplazamiento_promedio_y_2_3 + desplazamiento_promedio_y_3_4 + desplazamiento_promedio_y_4_5 + desplazamiento_promedio_y_5_6 + desplazamiento_promedio_y_6_7 + desplazamiento_promedio_y_7_8 + desplazamiento_promedio_y_8_9 + desplazamiento_promedio_y_9_10], ...
     '-o', 'LineWidth', 2);

title('Desplazamiento acumulado en 2D');
xlabel('Desplazamiento acumulado en x');
ylabel('Desplazamiento acumulado en y');
grid on;

% Muestra la secuencia de imágenes
figure;
subplot(3, 4, 1);
imshow(imagen_1);
title('Imagen 1');

subplot(3, 4, 2);
imshow(imagen_2);
title('Imagen 2');

subplot(3, 4, 3);
imshow(imagen_3);
title('Imagen 3');

subplot(3, 4, 4);
imshow(imagen_4);
title('Imagen 4');

subplot(3, 4, 5);
imshow(imagen_5);
title('Imagen 5');

subplot(3, 4, 6);
imshow(imagen_6);
title('Imagen 6');

subplot(3, 4, 7);
imshow(imagen_7);
title('Imagen 7');

subplot(3, 4, 8);
imshow(imagen_8);
title('Imagen 8');

subplot(3, 4, 9);
imshow(imagen_9);
title('Imagen 9');

subplot(3, 4, 10);
imshow(imagen_10);
title('Imagen 10');
% Guarda las imágenes en archivos PNG
imwrite(imagen_1, 'imagen_1.png');
imwrite(imagen_2, 'imagen_2.png');
imwrite(imagen_3, 'imagen_3.png');
imwrite(imagen_4, 'imagen_4.png');

% Cierra la cámara web
clear cam;