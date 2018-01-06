%% Load datafiles
a = prnist([0:9],[1:1000]);
c = im_resize(a, [32, 32]);                                                % rezize all the data into same dimensions
b = data2im(c);                                                            % change data into images
d = prdataset(c);                                                          % create prdataset
%show(b{1});
%% extract HOG features
labels = [zeros(1000,1); ones(1000,1); 2*ones(1000,1); 3*ones(1000,1); 4*ones(1000,1);...
    5*ones(1000,1); 6*ones(1000,1); 7*ones(1000,1); 8*ones(1000,1); 9*ones(1000,1)];
                                                                           % creat labels for prdataset
feature_HOG = zeros(10000, 324);                                           % initialize and extract HOG features
for i = 1: 10000
    img = b{i};
    feature_HOG(i,:) = extractHOGFeatures(img);
end

dataset_HOG = prdataset(feature_HOG, labels);                              % create prdataset for HOG features                
%% PCA analysis

map = pcam(d, 10);
dataset_PCA = d*map;
    
%% cross-validation
edps = prcrossval(dataset_HOG,parzenc,8,'DPS');                            % error? 0.024
edps2 = prcrossval(dataset_HOG,ldc,8,'DPS');                               % error: 0.9
edps3 = prcrossval(dataset_HOG,qdc,8,'DPS');                               % error: 0.8358
edps4 = prcrossval(dataset_HOG,fisherc,8,'DPS');                           % error: 0.0364