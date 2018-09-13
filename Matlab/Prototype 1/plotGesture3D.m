% ---------------------------------------------------------
% Usage example : 
% plotGesture3D("Reference/Velocity.txt", "Captured/Velocity.txt")
% ---------------------------------------------------------

function [] = plotGesture3D(filenameReference, filenameCaptured)
%% Open files and specify format

format long;
formatSpec = '%f %f %f';
fileID_ref = fopen(filenameReference, 'r');
fileID_cap = fopen(filenameCaptured,  'r');

%% Get gesture data

A_ref = fscanf(fileID_ref, formatSpec, [3 inf]);
X_ref = A_ref(1, :)';
Y_ref = A_ref(2, :)';
Z_ref = A_ref(3, :)';

A_cap = fscanf(fileID_cap, formatSpec, [3 inf]);
X_cap = A_cap(1, :)';
Y_cap = A_cap(2, :)';
Z_cap = A_cap(3, :)';

%% Plot gestures

figure('Name', "Plot comparison between referenced and captured gestures (3D)", 'NumberTitle', 'off');

% Referenced axis X
subplot(1, 2, 1);
scatter3(X_ref, Y_ref, Z_ref, 'o', 'b');
axis equal
xlabel('X value');
ylabel('Y value');
zlabel('Z value');
title('Referenced gesture');

% on va affiches nos axes centrés sur l'origine
% on prend les valeurs min max sur chaque axes
lims = axis;
% on prand la valeur min de tous et max de tous
mini = min(lims);
maxi = max(lims);
%On va faire le plot des 3 axes avec ces grandeurs
hold on
plot3([mini maxi],[0 0],[0 0],'LineWidth', 3, 'Color', 'blue'); % for x-axis
text(maxi,0,0,'X axis','Color','blue','Fontsize',14);
plot3([0 0], [mini maxi],[0 0],'LineWidth', 3, 'Color', 'g'); % for y-axis
text(0,maxi,0,'Y axis','Color','green','Fontsize',14);
plot3([0 0],[0 0],[mini maxi],'LineWidth', 3, 'Color', 'r'); % for z-axis
text(0,0,maxi,'Z axis','Color','red','Fontsize',14);


% Referenced axis Y
subplot(1, 2, 2);
scatter3(X_cap, Y_cap, Z_cap, 'o', 'r');
axis equal
xlabel('X value');
ylabel('Y value');
zlabel('Z value');
title('Captured gesture');

% on va affiches nos axes centrés sur l'origine
% on prend les valeurs min max sur chaque axes
lims = axis;
% on prand la valeur min de tous et max de tous
mini = min(lims);
maxi = max(lims);
%On va faire le plot des 3 axes avec ces grandeurs
hold on
plot3([mini maxi],[0 0],[0 0],'LineWidth', 3, 'Color', 'blue'); % for x-axis
text(maxi,0,0,'X axis','Color','blue','Fontsize',14);
plot3([0 0], [mini maxi],[0 0],'LineWidth', 3, 'Color', 'g'); % for y-axis
text(0,maxi,0,'Y axis','Color','green','Fontsize',14);
plot3([0 0],[0 0],[mini maxi],'LineWidth', 3, 'Color', 'r'); % for z-axis
text(0,0,maxi,'Z axis','Color','red','Fontsize',14);

%% Close files

fclose(fileID_ref);
fclose(fileID_cap);

end

