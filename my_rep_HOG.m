function a = my_rep_HOG(m)

    a = prdataset(m*im_box([],0,1)*im_resize([],[32,32])*im_box([],1,0));  % resize all the samples to 32*32 dimentionality
    label = getlabels(a);
    imgs = data2im(a);                                                     % change datafile to images
    
    num = size(imgs,4);                                                   
    feature_HOG = zeros(num, 324);                                         % initialize and extract HOG features 
    for i = 1: num
        img = imgs(:,:,:,i);
        feature_HOG(i,:) = extractHOGFeatures(img);                        
    end   
    a = prdataset(feature_HOG, label);                                     % create prdataset for HOG features                

     
end