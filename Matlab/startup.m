function [] = startup()
    %This startup file adds all the functional vortex evolutions to the
    %path. 
    clear
    clc 
    close all
    addpath(strcat(pwd,'/Functions'))
    addpath(strcat(pwd,'/Functions/GAIL_Dev-2.3.2'))
    GAIL_Install
end

