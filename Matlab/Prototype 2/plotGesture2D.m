% ---------------------------------------------------------
% Usage example : 
% plotGesture2D("Reference/Velocity.txt", "Captured/Velocity.txt")
% ---------------------------------------------------------

function [] = plotGesture2D(filenameReference, filenameCaptured)
%% Open files and specify format

format long;
formatSpec = '%f %f %f';
fileID_ref = fopen(filenameReference, 'r');
fileID_cap = fopen(filenameCaptured,  'r');

%% Get gesture data

A_ref = fscanf(fileID_ref, formatSpec, [18 inf]);
X_ref = -A_ref(13, :)';
Y_ref = A_ref(14, :)';
Z_ref = -A_ref(15, :)';

A_cap = fscanf(fileID_cap, formatSpec, [18 inf]);
X_cap = -A_cap(13, :)';
Y_cap = A_cap(14, :)';
Z_cap = -A_cap(15, :)';

[~, nbLin_ref] = size(A_ref);
[~, nbLin_cap] = size(A_cap);

maxNbFrames = max(nbLin_ref, nbLin_cap);
minValueX = min(min(X_ref), min(X_cap));
maxValueX = max(max(X_ref), max(X_cap));
minValueY = min(min(Y_ref), min(Y_cap));
maxValueY = max(max(Y_ref), max(Y_cap));
minValueZ = min(min(Z_ref), min(Z_cap));
maxValueZ = max(max(Z_ref), max(Z_cap));

%% Plot gestures

figure('Name', "Plot comparison between referenced and captured gestures (2D)", 'NumberTitle', 'off');

% Referenced axis X
plotRefX = subplot(4, 2, 1);
plot(X_ref, 'b');
xlabel('Frame number');
ylabel('X value');
title('Referenced axis X');
% Referenced axis Y
plotRefY = subplot(4, 2, 3);
plot(Y_ref, 'b');
xlabel('Frame number');
ylabel('Y value');
title('Referenced axis Y');
% Referenced axis Z
plotRefZ = subplot(4, 2, 5);
plot(Z_ref, 'b');
xlabel('Frame number');
ylabel('Z value');
title('Referenced axis Z');

% Captured axis X
plotCapX = subplot(4, 2, 2);
plot(X_cap, 'r');
xlabel('Frame number');
ylabel('X value');
title('Captured axis X');
% Captured axis Y
plotCapY = subplot(4, 2, 4);
plot(Y_cap, 'r');
xlabel('Frame number');
ylabel('Y value');
title('Captured axis Y');
% Captured axis Z
plotCapZ = subplot(4, 2, 6);
plot(Z_cap, 'r');
xlabel('Frame number');
ylabel('Z value');
title('Captured axis Z');

% Set same axis scale
axis([plotRefX plotCapX],[0 maxNbFrames minValueX maxValueX])
axis([plotRefY plotCapY],[0 maxNbFrames minValueY maxValueY])
axis([plotRefZ plotCapZ],[0 maxNbFrames minValueZ maxValueZ])

% Comparison of the speeds (for velocity)
subplot(4, 2, [7 8]);
k = 1:maxNbFrames;
speed_ref = sqrt(X_ref + Y_ref + Z_ref);
speed_cap = sqrt(X_cap + Y_cap + Z_cap);
plot(k, speed_ref, 'b', k, speed_cap, 'r');
xlabel('Frame number');
ylabel('Speed [cm/s]');
legend('Reference', 'Capture')

%% Close files

fclose(fileID_ref);
fclose(fileID_cap);

end

