function output=number(subimage)
    subimage = subimage(:,:,2);
    out = 0;
    max = 0;
    for i=1:9
        addr = append('../templates/', num2str(i),'.png');
        num = imread(addr);
        PSNR = psnr(num,imresize(subimage,size(num)));
        if(PSNR>max)
            max=PSNR;
            out = i;
        end
    end
    output = out;
    
end