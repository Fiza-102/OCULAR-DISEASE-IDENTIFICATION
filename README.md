# OCULAR-DISEASE-IDENTIFICATION

## Table of Contents
- [Overview](#overview)
- [Dataset](#dataset)
- [Prerequisites](#prerequisites)
- [Procedure](#procedure)
- [Results](#results)
## Overview
Fundus problems are the most typical causes of
blindness in people globally. The ophthalmic disease is noteworthy since it has features that are irreversible and might result in
long-term blindness. The majority of the identification models in use exclusively
concentrate on one particular ocular disease. Therefore, My
goal was to create a model for automatically classifying many
ocular diseases using fundus photos as input and reporting the
disease’s name if it is present.There are currently a number of models available, but the benefit is that I am using multilabeled picture datasets as opposed to binary-labeled data. The
multilabelled data covers disorders such as age-related macular
degeneration, cataract, diabetes, glucoma, pathological myopia,
and hypertension.The multilabelled data covers disorders such
as age-related macular degeneration (AMD), diabetes, glucoma,
pathological myopia, and hypertension.
## Dataset
The dataset utilised in this investigation is Ocular Disease
Intelligent Recognition. One of the most extensive public
resources on Kaggle for identifying eye illnesses is this
dataset. Classifications of ocular diseases are used to
group the fundus photos in this collection. Myopia (M),
hypertension (H), diabetes (D), cataract (C), glaucoma (G),
and age-related macular degeneration (A) are among the
conditions. Normal is the seventh one. The 5000 colour
fundus images in this dataset are split into training and testing
groups. All of the photographs for this project were scaled to
224x224.
## Prerequisites
MATLAB2022a, Pre-trained Model- ResNet-50, Multiclass SVM, Deep Learning
## Procedure 
I have taken a multi-class disease dataset .Feature extraction is done by Resnet-50
and VGG-16 while Classification is done by using Multi-class SVM.
- Collecting Dataset from kaggle
- Using equal number of images from unbalanced data
  categories labels
- Train and Test Split
- Model Building using ResNet-50
- Testing model
- Prediction using multiclass SVM

## Results
I have provided a novel approach to categorise
retinal fundus pictures into categories: myopia, hypertension, diabetes, cataract, glaucoma and age-related macular
degeneration using deep learning models (ResNet50) and multiclass SVM. To solve the problems
of CNN model training on a limited dataset, the pre-trained
models are initially employed for automated feature extraction.
Then SVM, which has previously demonstrated excellent
generalizability, is employed for disease classification. The
testset will be used to extract picture characteristics using
the same process. The classifier may then be given the test
features in order to evaluate how accurate the trained classifier
is. Hence, the Resnet-50 model for feature extraction and then
using multi-class SVM as a classifier to classify images gives
accuracy of 74%.
