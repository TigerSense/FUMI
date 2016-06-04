function [X,P,labels_bag,labels_point,bag_number]=gen_multi_tar_mixed_data(E_t,E_minus,num_pbags,num_nbags,num_points,n_tar,N_b,Pt_mean,sigma,expect_SdB)

%This function generates synthetic data set following the definition of multiple instance learning problem

% REFERENCE :
% C. Jiao, A. Zare, 
% “Functions of Multiple Instances for Learning Target Signatures,”  
% IEEE transactions on Geoscience and Remote Sensing, DOI: 10.1109/TGRS.2015.2406334
%
% SYNTAX : [X,P,labels_bag,labels_point]=gen_multi_tar_mixed_data(E_t,E_minus,num_pbags,num_nbags,num_points,n_tar,N_b,Pt_mean,sigma,expect_SdB)

%Inputs:
%   E_T -target endemmber set
%   E_minus - background endmember set
%   num_pbags - number of positive bags
%   num_n_bags - number of negative bags
%   num_points - number of total points per bag
%   n_tar - number of target points per positive bag
%   N_b - minimal number of constituent background endmembers per point
%   Pt_mean - mean target proportion value 
%   sigma - proportion variance
%   expect_SdB - desired SNR

%Outputs:
%   X - dataset in column vectors
%   P - proportion set in column vectors
%   labels_bag - bag level label per data point
%   labels_point - instance level label per data point
%   bag_number - bag number per data point


% Author: Changzhe Jiao, Alina Zare
% University of Missouri, Department of Electrical and Computer Engineering
% Email Address: cjr25@mail.missouri.edu; zarea@missouri.edu
% Created: October, 2013
% Latest Revision: January, 2015
%
% This product is Copyright (c) 2015 University of Missouri
% All rights reserved.
%
% Redistribution and use in source and binary forms, with or without
% modification, are permitted provided that the following conditions
% are met:
%
%   1. Redistributions of source code must retain the above copyright
%      notice, this list of conditions and the following disclaimer.
%   2. Redistributions in binary form must reproduce the above copyright
%      notice, this list of conditions and the following disclaimer in the
%      documentation and/or other materials provided with the distribution.
%   3. Neither the name of the University nor the names of its contributors
%      may be used to endorse or promote products derived from this software
%      without specific prior written permission.
%
% THIS SOFTWARE IS PROVIDED BY THE UNIVERSITY OF MISSOURI AND
% CONTRIBUTORS ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES,
% INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
% MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
% DISCLAIMED.  IN NO EVENT SHALL THE UNIVERSITY OR CONTRIBUTORS
% BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
% EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
% LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES,
% LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
% HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
% CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
% OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
% SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


X=[];
P=[];
labels_bag=[];
labels_point=[];
bag_number = [];

%loop in positive bags

for i=1:num_pbags
    
    % generate true positive points
    for j=1:n_tar
        temp_bag_label=1;
        temp_point_label=1;
        labels_bag(i,j)=temp_bag_label;
        labels_point(i,j)=temp_point_label;
        [x,p]=gen_individual_LMM_point(E_t,E_minus,temp_bag_label,temp_point_label,N_b,Pt_mean,sigma,expect_SdB);
        X(:,(i-1)*num_points+j)=x;
        P(:,(i-1)*num_points+j)=p;
        bag_number((i-1)*num_points+j) = i;
    end
    
    % generate false positive points
    for j=n_tar+1:num_points
        temp_bag_label=1;
        temp_point_label=0;
        labels_bag(i,j)=temp_bag_label;
        labels_point(i,j)=temp_point_label;
        [x,p]=gen_individual_LMM_point(E_t,E_minus,temp_bag_label,temp_point_label,N_b,Pt_mean,sigma,expect_SdB);
        X(:,(i-1)*num_points+j)=x;
        P(:,(i-1)*num_points+j)=p;
        bag_number((i-1)*num_points+j) = i;
    end    
    
end
%loop in negative bags
for i=num_pbags+1:num_pbags+num_nbags
    %generate background points
    for j=1:num_points
        temp_bag_label=0;
        temp_point_label=0;
        labels_bag(i,j)=temp_bag_label;
        labels_point(i,j)=temp_point_label;
        [x,p]=gen_individual_LMM_point(E_t,E_minus,temp_bag_label,temp_point_label,N_b,Pt_mean,sigma,expect_SdB);
        X(:,(i-1)*num_points+j)=x;
        P(:,(i-1)*num_points+j)=p;
        bag_number((i-1)*num_points+j) = i;
    end    
    
end
    
    
end

