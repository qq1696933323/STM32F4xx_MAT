function startup()
% startup set path for STM32F4xx toolset 
%

%Add path with subfolders
addpath(genpath(pwd));
%And save path
savepath;
%Add ST custom 
sl_refresh_customizations;

% [EOF] startup.m
