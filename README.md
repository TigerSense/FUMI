# FUMI
Functions of Multiple Instances, Extended Functions of Multiple Instances and Dictionary Learning using Functions of Multiple Instances

****************************************************************
NOTE: If you use this code, cite it: Changzhe Jiao, & Alina Zare. (2019, April 12). GatorSense/FUMI: Initial Release (Version v1.0). Zenodo. http://doi.org/10.5281/zenodo.2638304 [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.2638304.svg)](https://doi.org/10.5281/zenodo.2638304)

NOTE: If cFUMI and eFUMI Algorithms are used in any publication or presentation, the following reference must be cited:  
C. Jiao, A. Zare, "Functions of Multiple Instances for Learning Target Signatures," IEEE transactions on Geoscience and Remote Sensing, Vol. 53, No. 8, Aug. 2015, DOI: 10.1109/TGRS.2015.2406334

If DL-FUMI Algorithm is used in any publication or presentation, the following reference must be cited:  
C. Jiao, A. Zare, "Multiple Instance Dictionary Learning using Functions of Multiple Instances," in IEEE International Conference on Pattern Recognition, Cancun, Mexico, 2016. 
available: http://arxiv.org/abs/1511.02825

****************************************************************

The command to run the cFUMI algorithm:   

[E, P]=cFUMI(Inputdata,labels,parameters)  

% Inputs:  
%   Inputdata - hyperspectral image data, can be either in data cube or linear data  
%   parameters - struct - parameter structure which can be set using the 'cFUMI_parameters' function, see 'cFUMI_parameters' for more explanation  
%   labels - binary values, the same size as input data, indicates positive data point with logical '1'  
%  
% Outputs:  
%   E - Endmembers, d by M+1, d and M account for wavelength bands and number of background endmembers,respectively  
%   P - Proportion Values, M+1 by N, N accounts for the total number of input data  

The command to run the eFUMI algorithm:   

[E, P]=eFUMI(Inputdata,labels,parameters)  

% Inputs:  
%   Inputdata - hyperspectral image data, can be either in data cube or linear data  
%   parameters - struct - parameter structure which can be set using the 'eFUMI_parameters' function, see 'eFUMI_parameters' for more explanation  
%   labels - binary values, the same size as input data, indicates positive bags with logical '1'  
%  
% Outputs:  
%   E - Endmembers, d by M+1, d and M account for wavelength bands and number of background endmembers,respectively  
%   P - Proportion Values, M+1 by N, N accounts for the total number of input data  


The command to run the DL-FUMI algorithm:   

[E, P]=DLFUMI(Inputdata,labels,parameters)

% Inputs:
%   Inputdata - MIL data, d by N, d: number of data dimension, N, total number of data
%   parameters - struct - parameter structure which can be set using the 'DLFUMI_parameters' function, see 'DLFUMI_parameters' for more explanation  
%   labels - binary the same size as input data, indicates positive bag with logical '1'
%
% Outputs:
%   E - Estimated dictionary set, d by T+M, T is number of target concepts, M accounts for the number of background endmembers
%   P - Representation Values, T+M by N 



****************************************************************

Files explanation:  
Latest Revision: April 2016

************

'...\FUMI_code_and_demo':
README.md                                                                                     -  this file  
FUMI.pdf                             -  the referred paper  
Investigation of Small Increase in eFUMI Objective Function Value during Optimization.pdf      -  investigation of increase phenomenon in eFUMI objective function  


************

'...\FUMI_code_and_demo\cFUMI_code':  
cFUMI.m                                                             -  cFUMI (convex Functions of Multiple Instances), semi-supervised target concept learning algorithm  
cFUMI_Cond_Update.m                                                 -  the objective calculation function  
cFUMI_E_Update.m                                                    -  endmember matrix update function  
cFUMI_P_Update.m                                                    -  proportion matrix update function  
cFUMI_parameters.m                                                  -  parameters generating function used during the cFUMI algorithm, please change accordingly  
cFUMI_VCA_initialize.m                                              -  cFUMI initialization function  
FUMI_reshape.m                                                      -  reshape 3D hyperspectral data cube into linear data  
FUMI_unmix.m                                                        -  fully constrained least square unmixing function  
FUMI_viewresults.m                                                  -  proportion map display function  
normalize.m                                                         -  normalization function  
VCA.m                                                               -  Vertex Component Analysis algorithm, see reference of the referred paper for more details  


************

'...\FUMI_code_and_demo\DL_FUMI_code':  
DLFUMI.m                                                            -  DLFUMI (Dictionary Learning using Functions of Multiple Instances): semi-supervised target concept learning algorithm
DLFUMI_Cond_Update.m                                                -  the objective calculation function  
DLFUMI_E_Update_individual.m                                        -  dictionary set update function, atom by atom  
DLFUMI_initialize.m                                                 -  DLFUMI initialization function  
DLFUMI_P_Update.m                                                   -  representation matrix update function  
DLFUMI_parameters.m                                                 -  parameters generating function used during the DLFUMI algorithm, please change accordingly  
DLFUMI_Prob_Z_Update.m                                              -  probability estimate function to conduct the E-step of DLFUMI  
normalize.m                                                         -  normalization function  
my_OMP                                                              -  sparse coding function using orthogonal matching pursuit


************

'...\FUMI_code_and_demo\eFUMI_code':  
eFUMI.m                                                             -  eFUMI (extended Functions of Multiple Instances), semi-supervised target concept learning algorithm  
eFUMI_Cond_Update.m                                                 -  the objective calculation function  
eFUMI_E_Update.m                                                    -  endmember matrix update function  
eFUMI_P_Update.m                                                    -  proportion matrix update function  
eFUMI_parameters.m                                                  -  parameters generating function used during the eFUMI algorithm, please change accordingly  
eFUMI_Prob_Z_Update.m                                               -  probability estimate function to conduct the E-step of eFUMI  
eFUMI_VCA_initialize.m                                              -  eFUMI initialization function  
FUMI_reshape.m                                                      -  reshape 3D hyperspectral data cube into linear data  
FUMI_unmix.m                                                        -  fully constrained least square unmixing function  
FUMI_viewresults.m                                                  -  proportion map display function  
normalize.m                                                         -  normalization function  
VCA.m                                                               -  Vertex Component Analysis algorithm, see reference of the referred paper for more details  

************

'...\FUMI_code_and_demo\FUMI_demos':  
demo_generate_synthetic_data.m                                      -  generates different type of synthetic data used in the synthetic experiment part of the referred paper  
demo_FUMI_random_data_repeat_Fig_2.m                                -  repeats the synthetic experiment of cFUMI and eFUMI on random data, corresponds to results shown in Fig. 2 of the referred paper  
demo_cFUMI_noisy_data_repeat_Fig_3_a.m                              -  repeats the synthetic experiment of cFUMI on noisy data with SNR 10, 20, 30 and 40 dB, corresponds to results shown in Fig. 3(a) of the referred paper  
demo_eFUMI_noisy_data_repeat_Fig_3_b.m                              -  repeats the synthetic experiment of eFUMI on noisy data with SNR 10, 20, 30 and 40 dB, corresponds to results shown in Fig. 3(b) of the referred paper.  


************

'...\FUMI_code_and_demo\gen_synthetic_data_code':
add_noise_to_dB.m                                                   -  adds Gaussian white noise to synthetic data  
drchrnd.m                                                           -  generates random vector following Dirichlet distribution  
gen_individual_LMM_point.m                                          -  generates individual synthetic data point following the linear mixing model  
gen_multi_tar_mixed_data.m                                          -  generates synthetic data set following the definition of multiple instance learning problem  

************

'...\FUMI_code_and_demo\synthetic_data':
E_truth.mat                                                         -  groundtruth endmember and wavelength information used to generate synthetic data  
highly_mixed_data_pt_03.mat                                         -  highly mixed synthetic data with P_t_mean=0.3; bag-level and instance-level labels  
highly_mixed_data_pt_05.mat                                         -  highly mixed synthetic data with P_t_mean=0.5; bag-level and instance-level labels  
highly_mixed_data_pt_07.mat                                         -  highly mixed synthetic data with P_t_mean=0.7; bag-level and instance-level labels  
noisy_data_SNR_10.mat                                               -  noisy synthetic data with SNR=10 dB; bag-level and instance-level labels  
noisy_data_SNR_20.mat                                               -  noisy synthetic data with SNR=20 dB; bag-level and instance-level labels  
noisy_data_SNR_30.mat                                               -  noisy synthetic data with SNR=30 dB; bag-level and instance-level labels  
noisy_data_SNR_40.mat                                               -  noisy synthetic data with SNR=40 dB; bag-level and instance-level labels  
random_data.mat                                                     -  random synthetic data; bag-level and instance-level labels  


****************************************************************

For any questions, please contact:

 Alina Zare  
 Email Address:azare@ece.ufl.edu 
 University of Florida,  Department of Electrical and Computer Engineering 


****************************************************************
