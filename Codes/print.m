function print(image,number, filename)
    [y_image, x_image, nothing] = size(image);
    x = x_image/2 - 45;
    len = length(number);
    for i=1:len
        addr = append('../Templates/', number(i), '.png');
        num = imread(addr);
        num = imresize(num,[40 NaN]);
        [y_num, x_num] = size(num);
        y = y_image - 42;
        image(y+1:y+y_num,x+1:x+x_num,1) = num;
        image(y+1:y+y_num,x+1:x+x_num,3) = num;

        x = x+x_num+5;
    end
    addr = append('../Result/', filename(1:end-4),'_result.png');
    imwrite(image,addr);
end