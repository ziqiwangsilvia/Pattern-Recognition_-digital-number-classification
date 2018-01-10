%% Load datafiles
original_dataset = prnist([0:9],[1:50:1000]);
large_dataset = my_rep(original_dataset);

%% HOG features
[large_dataset_HOG,HOGfeatures] = my_rep_HOG(original_dataset);     

%% NEW features
tic
[large_dataset_NEW,NEWfeatures] = my_rep_SIFT(original_dataset); 
toc
W = loglc;                                                                 % select classifier
W_NEW = large_dataset_NEW * W;                                             % creat mapping
e_loglc = nist_eval('my_rep_SIFT', W_NEW,10)

%% GABOR feaures

[large_dataset_NEW,GABORfeatures] = my_rep_GABOR(original_dataset);

W = loglc;                                                                 % select classifier
W_NEW = large_dataset_NEW * W;                                             % creat mapping
e_loglc = nist_eval('my_rep_GABOR', W_NEW,10)

%% PCA analysis
pca_30= scalem([],'variance') * pcam([],30);
    
%% cross-validation
edps = prcrossval(dataset_HOG,parzenc,8,'DPS');                            % error: 0.024
edps2 = prcrossval(dataset_HOG,ldc,8,'DPS');                               % error: 0.9
edps3 = prcrossval(dataset_HOG,qdc,8,'DPS');                               % error: 0.8358
edps4 = prcrossval(dataset_HOG,fisherc,8,'DPS');                           % error: 0.0364

%% evaluation on HOG features
W = loglc;                                                                 % select classifier
W_HOG = large_dataset_HOG * W;                                             % creat mapping
e_loglc = nist_eval('my_rep_HOG', W_HOG)

%% evaluation on NEW features
tic
W = svc;                                                                 % select classifier
W_NEW = large_dataset_NEW * W;                                             % creat mapping
e_loglc = nist_eval('my_rep_NEW', W_NEW)
toc
%% evaluation on pixels with PCA 
W = pca_30 * nmc;
W_pca = large_dataset * W;
e_pca_nmc = nist_eval('my_rep', W_pca)
