 

 
 %generate_masks_from_atlas.m
%This script generate mask files from any atlases you prefer.
%K. Nemoto 25 April 2015


xA=spm_atlas('load');
S=spm_atlas('select',xA);


for i = 1:size(S,2)
    fname=strcat(S{i},'.nii');
    VM=spm_atlas('mask',xA,sprintf('%.3d',str2num(S{i}(9:10)))); %remember to check the xA label names or index
    
    VM.fname=fname;
    spm_write_vol(VM,spm_read_vols(VM));
    
end