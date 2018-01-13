function a = my_rep_pixel(m)
    a = prdataset(m*im_box([],0,1)*im_resize([],[32,32])*im_box([],1,0));  % resize all the samples to 32*32 dimentionality
    label = getlabels(a);
    imgs = data2im(a);                                                     % change datafile to images
    num = size(imgs,4);                                                   
    
    feature_pixel = zeros(num, 16);
    for i = 1: num
        img = imgs(:,:,:,i);
        feature_pixel(i,:) =  [sum(sum(img(1:8, 1:8))), sum(sum(img(1:8, 9:16))), sum(sum(img(1:8, 17:24))), sum(sum(img(1:8, 25:32))),...
                               sum(sum(img(9:16, 1:8))), sum(sum(img(9:16, 9:16))), sum(sum(img(9:16, 17:24))), sum(sum(img(9:16, 25:32))),...
                               sum(sum(img(17:24, 1:8))), sum(sum(img(17:24, 9:16))), sum(sum(img(17:24, 17:24))), sum(sum(img(17:24, 25:32))),...
                               sum(sum(img(25:32, 1:8))), sum(sum(img(25:32, 9:16))), sum(sum(img(25:32, 17:24))), sum(sum(img(25:32, 25:32)))];                       
    end 
    
    a = prdataset(feature_pixel, label);                                     % create prdataset for pixel features                

end