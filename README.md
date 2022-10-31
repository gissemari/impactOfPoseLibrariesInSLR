# Impact of Pose Libraries in SLR

This repository have all the data that we have been used to write our paper "Impact of Pose Estimation Models for landmark-based
Sign Language Recognition"

# Scripts

## To generate some of the paper figures

The python and matlab scripts used for ploting some figures of our paper are placed in "plots" folder

# Repositories used

The following sections are our repositories used to develop our paper

## Connecting points

Used to preprocess AEC, PUCP-DGI156 and WLASL with different kind of keypoint estimation models such as Mediapipe, Openpose and Wholepose(HRnet based model).
[Connecting Points Repository](https://github.com/JoeNatan30/ConnectingPoints)

## Spoter

We use this model that have Transformers architecture for Sign language recognition

[Spoter repository] ( https://github.com/CristianLazoQuispe/Spoter-SL)

## Joint module of SL-GCN model

we use the Joint SL-GCN module of this Sign language multi-modal architecture for Sign language recognition

[Multi-modal SLR repository] (https://github.com/JoeNatan30/CVPR21Chal-SLR)

This repository is a fork of the repository used by Chalearn 2021 winner that have some modification in the SL-GCN module to make work with Connecting points output data

## Statistical analysis

The quality analysis of the datasets and estimation models we used can be found in the file of this repository

[PSL-GAN repository] (https://github.com/StevRamos/PSL-GAN/blob/main/EDA/01%20-%20EDA.ipynb)
