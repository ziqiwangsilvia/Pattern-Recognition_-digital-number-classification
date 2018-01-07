function a = my_rep(m)
    a = prdataset(m*im_box([],0,1)*im_resize([],[32,32])*im_box([],1,0));  % rezise all samples to 32*32 dimentionality  
end