
addpath D:\projects\Matlab\vgg

rawP = [ 776.649963  -298.408539 -32.048386  993.1581875 132.852554  120.885834  -759.210876 1982.174000 0.744869  0.662592  -0.078377 4.629312012;
    431.503540  586.251892  -137.094040 1982.053375 23.799522   1.964373    -657.832764 1725.253500 -0.321776 0.869462  -0.374826 5.538025391;
    -153.607925 722.067139  -127.204468 2182.4950   141.564346  74.195686   -637.070984 1551.185125 -0.769772 0.354474  -0.530847 4.737782227;
    -823.909119 55.557896   -82.577644  2498.20825  -31.429972  42.725830   -777.534546 2083.363250 -0.484634 -0.807611 -0.335998 4.934550781;
    -715.434998 -351.073730 -147.460815 1978.534875 29.429260   -2.156084   -779.121704 2028.892750 0.030776  -0.941587 -0.335361 4.141203125;
    -417.221649 -700.318726 -27.361042  1599.565000 111.925537  -169.101776 -752.020142 1982.983750 0.542421  -0.837170 -0.070180 3.929336426;
    94.934860   -668.213623 -331.895508 769.8633125 -549.403137 -58.174614  -342.555359 1286.971000 0.196630  -0.136065 -0.970991 3.574729736;
    452.159027  -658.943909 -279.703522 883.495000  -262.442566 1.231108    -751.532349 1884.149625 0.776201  0.215114  -0.592653 4.235517090];


P = zeros(3,4,8);

for i=1:8
    for j=1:3
        P(j,1:4,i) = rawP(i,4*(j-1)+1:4*(j-1)+4);
    end
end

for i=1:8
    tempP = P(:,:,i);
    C(1:4,i) = null(tempP);
    C(1:4,i)=C(1:4,i)/C(4,i);
end


P1 = P(:,:,1);
P2 = P(:,:,2);

F = vgg_F_from_P(P1,P2);
F = F/F(3,3);


I1 = imread('cam00_00023_0000008550.png');
I2 = imread('cam01_00023_0000008550.png');

vgg_gui_F(I1,I2,F')