## Introduction

In the following capstone project, I decided to do an image classification task of different kinds of fruits using the [fruits-360](https://link) dataset, which provides <b> 131! </b> types of differents fruits, with some that may look pretty similar to the human eye, the dataset also presents the fruit images without any background , thus making it somewhat easier to train.





## Problem Description:


The problem: Fruits are often hard to classify manually given the wide variety of types, it can be a really burdensome challenge due to the mass, creating an automated classifier could help in the future, so that this task can be done instantly.
![alt](https://www.researchgate.net/publication/342916129/figure/fig2/AS:913043131207680@1594697854025/Illustration-of-few-images-from-Fruits-360-dataset.ppm)




### Fruit types to be classified

The dataset I choose for my project can be found <b>[here](https://www.kaggle.com/moltean/fruits) </b> you can download it using the kaggle website. Inside this dataset you can find tons of images containing different types of fruits, with the following structure

```
.
└── fruits-360  # paper describing the dataset
    ├── papers # contains images with multiple fruits. Some of them are partially covered by other fruits. This is an excelent test for real-world detection.
    ├── preview
    ├── Test
    ├── test-multiple_fruits
    └── Training


├── papers
├── Test # Test folder with 22688 images of 131 fruits 
├── test-multiple_fruits # Contains images with multiple fruits. This is a good test for real-world detection.
└── Training # Training folder with 67692 images of 131 fruits

```

 <b> NOTE :</b> Don't use the data inside `fruits-360-original-size`. This a new version that is not yet completed by the author.

## Table of contents


Notebooks Description:



| Description | Link  |
|-------------------------------|---|
| Notebook | [Explanatory notebook with EDA and Training of XCeption Model]()  |
|                Hotel booking demand data set               |  [csv file]() |
|                   DockerFile commands           |  [dockerfile]() |
|              Pipenv file                 |  [Pipfile]() |
|              Train.py                 |  [Training of final XGBoost model script]() |
|              Predict.py                 |  [Predict app]() |
|              predict_test.py                 |  [To predict customer cancelling probability]() |

## Models used:

VGG16



XCeptionV3



## References:



