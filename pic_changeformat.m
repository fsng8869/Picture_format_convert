%% //////////////////////////////////////////////////
clc;clear;
old_format  = '*.jpg';%转换前的格式
new_format  = '.tif'; %转换后的格式
new_format2 =  new_format(2:end);

m = filesep;%文件分隔符
[~,filepath] = uigetfile(old_format); %打开文件对话框,获取路径
pgms         = dir([filepath,old_format]);%打开路径文件夹，获取目标格式文件
num_pgms     = length( pgms );%统计数量

%建立新文件夹
Newformat    = [filepath,new_format(2:end)];
if ~exist(Newformat,'dir'); mkdir(Newformat);end

%% 核心代码：将 old_format 转换为 new_format 图片，并保存
for i = 1 : num_pgms
    pgm_file = fullfile(filepath,pgms(i).name);
    pgm      = imread( pgm_file);

    % 第一步，解析文件名 pgm_file ,注意，pgm_file 包括路径+文件名+后缀，如 pgm_file = 'C:\Users\kitty\test\test.pgm'
    [ path , name , ext ] = fileparts( pgm_file ) ;

    % 第二步，生成新的文件名
    filename = strcat(name,new_format);

    % 第三步，生成文件全称
    new_file = fullfile(Newformat,m,filename);

    % 第四步，将 pgm 以 jpg_file 作为文件名，保存tif格式.
    imwrite(pgm,new_file,new_format2)
end
