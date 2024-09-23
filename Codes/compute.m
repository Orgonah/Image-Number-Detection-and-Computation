function output=compute(main_image,filename)  
    image = denoise(main_image);

    [y_image, x_image,nothing] = size(image);
    padded = padarray(image,[1 1],255);
    layer = uint8(zeros(y_image+2,x_image+2));
    num=0;
    for y=2:y_image+1
        for x=2:x_image+1
            if (padded(y,x,1)==255 && padded(y,x,2)~=255 && padded(y,x,3)~=255)
                if(layer(y,x)==0)
                    flag=false;
                    up = 1;
                    left = 0;
                    right = 0;
                    down = 0;
                    while(flag==false)
                        if(~all(padded(y-up,(x-left):(x+right),2) == 255))
                            up=up+1;
                        elseif(~all(padded(y+down,(x-left):(x+right),2) == 255))
                            down=down+1;
                        elseif(~all(padded((y-up):(y+down),x-left,2) == 255))
                            left=left+1;
                        elseif(~all(padded((y-up):(y+down),x+right,2) == 255))
                            right=right+1;
                        else
                            flag=true;
                        end
                    end 
                    layer((y-up):(y+down),(x-left):(x+right)) = 255;
                    % layer(y-up,(x-left):(x+right)) = 2;
                    % layer(y+down,(x-left):(x+right)) = 2;
                    % layer((y-up):(y+down),x-left) = 2;
                    % layer((y-up):(y+down),x+right) = 2;

                    num = num + number(padded((y-up):(y+down),(x-left):(x+right),:));
                    
                    % count = count+1;
                    % addr = append('../number/',filename, num2str(count),'.png');
                    % imwrite(padded((y-up):(y+down),(x-left):(x+right),:),addr);

                end

            elseif (padded(y,x,1)~=255 && padded(y,x,2)~=255 && padded(y,x,3)==255)
                if(layer(y,x)==0)
                    flag=false;
                    up = 1;
                    left = 0;
                    right = 0;
                    down = 0;
                    while(flag==false)
                        if(~all(padded(y-up,(x-left):(x+right),2) == 255))
                            up=up+1;
                        elseif(~all(padded(y+down,(x-left):(x+right),2) == 255))
                            down=down+1;
                        elseif(~all(padded((y-up):(y+down),x-left,2) == 255))
                            left=left+1;
                        elseif(~all(padded((y-up):(y+down),x+right,2) == 255))
                            right=right+1;
                        else
                            flag=true;
                        end
                    end 

                    layer((y-up):(y+down),(x-left):(x+right)) = 100;
                    % layer(y-up,(x-left):(x+right)) = 1;
                    % layer(y+down,(x-left):(x+right)) = 1;
                    % layer((y-up):(y+down),x-left) = 1;
                    % layer((y-up):(y+down),x+right) = 1;

                    num = num - number(padded((y-up):(y+down),(x-left):(x+right),:));  
                    
                    % count = count+1;
                    % addr = append('../number/',filename, num2str(count),'.png');
                    % imwrite(padded((y-up):(y+down),(x-left):(x+right),:),addr);
                end 
            end
        end
    end
    % for y=2:y_image+1
    %     for x=2:x_image+1
    %         if(layer(y,x)==1)
    %             Out(y,x,:)=[255,0,0];
    %         elseif(layer(y,x)==2)
    %             Out(y,x,:)=[0,0,255];
    %         end
    %     end
    % end

    print(main_image, num2str(num), filename);
    output=num;
end