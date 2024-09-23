clear; close all

imagefiles = dir('../Inputs/*.png');      
nfiles = length(imagefiles);
count = 0;
for i=1:nfiles
    %OPENING FILE
    currentfilename = imagefiles(i).name;
    imageAddr = append('../',currentfilename);
    currentimage = imread(imageAddr);

    % MAIN FUNCTION 
    number = compute(currentimage, currentfilename);

    % CHECKING
    disp(currentfilename);
    res = split(currentfilename(1:end-4), '_');
    if(number == str2num(cell2mat(res(end))))
        count=count+1;
    else
         disp('error')
    end
end   
disp(" ");
disp([num2str(count) '%']); 