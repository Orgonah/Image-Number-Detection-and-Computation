function output = denoise(image)
    [y_image, x_image,nothing] = size(image);
    % Padding
    p=1;
    red = image(:,:,1);
    green = image(:,:,2);
    blue = image(:,:,3);

    padded = padarray(image,[p p],"replicate");
    pred = padded(:,:,1);
    pgreen = padded(:,:,2);
    pblue = padded(:,:,3);

    bin = zeros([y_image, x_image]);
    for y=1:y_image
        for x=1:x_image
            if(red(y,x)==0 && blue(y,x)==0 && green(y,x)==0)
                bin(y,x)=1;
            end
        end
    end

    % Kernel Size
    W=3;
    a = W - ceil(W/2);

    % Kernel
    main_kernel = fspecial("gaussian",[W W],W/6);
    ored = zeros([y_image, x_image]);
    ogreen = zeros([y_image, x_image]);
    oblue = zeros([y_image, x_image]);
    for y=1:y_image
        for x=1:x_image
            s = bin(y,x);
            if(s == 1)
                kernel = main_kernel;
                sum = 0.0;
                for i=-a:a
                    for j=-a:a
                        if(pred(p+y+i, p+x+j)==0 && pgreen(p+y+i, p+x+j)==0 && pblue(p+y+i, p+x+j)==0)
                            kernel(i+a+1, j+a+1) = 0;
                        end
                        sum=sum+kernel(i+a+1, j+a+1);
                    end
                end
                if (sum == 0)
                    ored(y,x) = 255;
                    ogreen(y,x) = 255;
                    oblue(y,x) = 255;

                else
                    kernel = kernel.*(1/sum);
                   
                    for i=-a:a
                        for j=-a:a
                            ored(y,x) = ored(y,x) + kernel(i+a+1, j+a+1) * double(pred(p+y+i, p+x+j));
                            ogreen(y,x) = ogreen(y,x) + kernel(i+a+1, j+a+1) * double(pgreen(p+y+i, p+x+j));
                            oblue(y,x) = oblue(y,x) + kernel(i+a+1, j+a+1) * double(pblue(p+y+i, p+x+j));
                        end
                    end
                end
            else
                ored(y,x) = red(y,x);
                ogreen(y,x) = green(y,x);
                oblue(y,x) = blue(y,x);
            end
            
        end
    end
    Out = cat(3,ored,ogreen,oblue);

    output = uint8(Out);
end


