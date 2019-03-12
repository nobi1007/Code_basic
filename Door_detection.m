[mserRegions, mserConnComp]=detectMSERFeatures(i,'RegionAreaRange',[800 1500]);
mserStats = regionprops(mserConnComp, 'BoundingBox', 'Eccentricity', ...
    'Solidity', 'Extent', 'Euler', 'Image');

% Compute the aspect ratio using bounding box data.
bbox = vertcat(mserStats.BoundingBox);
w = bbox(:,3);
h = bbox(:,4);
aspectRatio = w./h;

% Threshold the data to determine which regions to remove. These thresholds
% may need to be tuned for other images.
filterIdx = aspectRatio' < 0.05; 
filterIdx = filterIdx | [mserStats.Eccentricity] < 0.995 ;
filterIdx = filterIdx | [mserStats.Solidity] < .3;
%filterIdx = filterIdx | [mserStats.Extent] < 0.2 | [mserStats.Extent] > 0.9;
filterIdx = filterIdx | [mserStats.EulerNumber] < -2;

% Remove regions
mserStats(filterIdx) = [];
mserRegions(filterIdx) = [];

% Show remaining regions
figure
imshow(img)
hold on
plot(mserRegions, 'showPixelList', false,'showEllipses',true)
title('After Removing Non-Text Regions Based On Geometric Properties')
hold off