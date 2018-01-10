function [a,GABORfeatures] = my_rep_GABOR(m)
%MY_REP_SIFT Summary of this function goes here
%   Detailed explanation goes here

    a = prdataset(m*im_box([],0,1)*im_resize([],[32,32])*im_box([],1,0));  % resize all the samples to 32*32 dimentionality
    label = getlabels(a);
    imgs = data2im(a);                                                     % change datafile to images

    num = size(imgs,4);                                                   
    feature_NEW = zeros(num, 46240);                                         % initialize and extract HOG features 
    gaborArray = gaborFilterBank(5,8,15,15);
    for i = 1: num
        img = imgs(:,:,:,i);
        tempfeature = gaborFeatures(img,gaborArray,1,1);
        feature_NEW(i,:) = tempfeature;                        
    end   
    a = prdataset(feature_NEW, label);                                     % create prdataset for HOG features                
    GABORfeatures= feature_NEW;
end


