function [a,NEWfeatures] = my_rep_NEW(m)

    a = prdataset(m*im_box([],0,1)*im_resize([],[32,32])*im_box([],1,0));  % resize all the samples to 32*32 dimentionality
    label = getlabels(a);
    imgs = data2im(a);                                                     % change datafile to images
    
    num = size(imgs,4);                                                   
    feature_NEW = zeros(num, 59);                                         % initialize and extract HOG features 
    for i = 1: num
        img = imgs(:,:,:,i);
        feature_NEW(i,:) = extractLBPFeatures(img);                        
    end   
    a = prdataset(feature_NEW, label);                                     % create prdataset for HOG features                
    NEWfeatures= feature_NEW;
    
end