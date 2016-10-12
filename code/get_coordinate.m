function []=get_coordinate(A)
[~,r]=size(A);
I1=imcrop(A,[0 7 r 345]);
I2=imcrop(A,[0 338 r 345]);
I3=imcrop(A,[0 675 r 345]);
minimum=sum(sum(I2-I1).^2);
for x1 = -15:15
    for y1 = -5:5
        I2=circshift(I2,[x1 y1]);
        value=sum(sum(I2-I1).^2);
        if value < minimum
            minimum=value;
            x=x1;
            y=y1;
        end
        I2=circshift(I2,[-x1 -y1]);
    end
end
I2=circshift(I2,[x y]);
minimum=sum(sum(I3-I1).^2);
for x2 = -15:15
    for y2 = -5:5
        I3=circshift(I3,[x2 y2]);
        value=sum(sum(I3-I1).^2);
        if value < minimum
            minimum=value;
            x=x2;
            y=y2;
        end
        I3=circshift(I3,[-x2 -y2]);
    end
end
I3=circshift(I3,[x y]);
rgbImg = cat(3, I1, I2, I3);
figure,imshow(rgbImg);
end