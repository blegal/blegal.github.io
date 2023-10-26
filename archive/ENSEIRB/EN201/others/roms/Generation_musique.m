
%Par B. Legal complété par Rémy SOUBIRANE 2A - 2018-2019

%ENTER FILENAME BELLOW
filename = 'nom_du_fichier.wav';
%/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\

[y,Fs] = audioread(filename);

l = length(y);
if min(size(y)) == 2 %stereo/mono
    Z = zeros(1,2*l);
    for i = 1:l-1
        Z(2*i) = y(i,1);
        Z(2*i+1) = y(i,2);
    end
Z = Z + 1;
Z = Z * 16384; %tester avec 32768
Z = uint16(Z);

fileID = fopen('ENSEIRB.MMK','w');
fwrite(fileID,Z,'uint16');
fclose(fileID)

fileID = fopen('ENSEIRB.MMK');
a = fread(fileID, 44101, 'uint16');
fclose(fileID);

else
y = y + 1;
y = y * 32768;
y = uint16(y);

fileID = fopen('ENSEIRB.MMK','w');
fwrite(fileID,y,'uint16');
fclose(fileID)

fileID = fopen('ENSEIRB.MMK');
a = fread(fileID, 44101, 'uint16');
fclose(fileID);
end




