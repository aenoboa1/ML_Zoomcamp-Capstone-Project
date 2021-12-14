## Introduction

In the following capstone project, I decided to do an image classification task of different kinds of fruits using the [fruits-360](https://link) dataset, which provides <b> 131! </b> types of differents fruits, with some that may look pretty similar to the human eye, the dataset also presents the fruit images without any background , thus making it somewhat easier to train.





## Problem Description:


<b> The problem: </b> Fruits are often hard to classify manually given the wide variety of types, it can be a really burdensome challenge due to the mass, creating an automated classifier could help in the future, so that this task can be done instantly.
![alt](https://www.researchgate.net/publication/342916129/figure/fig2/AS:913043131207680@1594697854025/Illustration-of-few-images-from-Fruits-360-dataset.ppm)




### Dataset- Fruits 360

The dataset I choose for my project can be found <b>[here](https://www.kaggle.com/moltean/fruits) </b> you can download it using the kaggle website, to reply the notebooks you should place it inside `data folder`. Inside this dataset you can find tons of images containing different types of fruits, with the following structure

```
.
├── data
│   ├── fruits-360
│   │   ├── papers # Paper of the dataset
│   │   ├── preview # folder I created to store the data augmentation previews
│   │   ├── Test # Test folder with 22688 images of 131 fruits 
│   │   ├── test-multiple_fruits # Contains images with multiple fruits. This is a good test for real-world detection.
│   │   └── Training  # Training folder with 67692 images of 131 fruits
│   └── fruits-360-original-size
```
**Filename format:** image_index_100.jpg (e.g. 32_100.jpg) or r_image_index_100.jpg (e.g. r_32_100.jpg) or r2_image_index_100.jpg or r3_image_index_100.jpg. "r" stands for rotated fruit. "r2" means that the fruit was rotated around the 3rd axis. "100" comes from image size (100x100 pixels).

 <b> NOTE :</b> Don't use the data inside `fruits-360-original-size`. This a new version that is not yet completed by the author.



## Table of contents


Project Description:



| Description | Link  |
|-------------------------------|---|
| Notebook | [Explanatory notebook with EDA and Training of XCeption Model]()  |
| Second Notebook|  [Explanatory notebook with Traning and tunning of VGA16 Model]() |
|                   DockerFile            |  [dockerfile]() |
|              Pipenv file                 |  [Pipfile]() |
|              Train.py                 |  [Training of final XGBoost model script]() |
|              Predict.py                 |  [Predict app]() |
|              predict_test.py                 |  [To predict customer cancelling probability]() |

## Models used and accuracy obtained:

VGG16

XCeption


Model chosen for deployment: XCeption
## Deployment:

The model was deployed using TFLite, You can see the output for the image I prepared like this:
![lambda](https://github.com/aenoboa1/ML_Zoomcamp-Capstone-Project/blob/master/img/deployment/lambda_image.png)

### Virtual Environment : `Pipenv 2021.5.29` 

<b>Python version: ` Python 3.8`🐍  </b>


Versions/requirements used ins ide the virtual environment:

- ` keras-image-helper`
- `tflite-aws-lambda`

Before running this dockerbuild, please verify you got docker daemon running.



```console
 $ sudo systemctl start docker
```
OR:
```console
$ sudo /etc/init.d/docker start
```
For arch based systems:
```console
$ systemctl start docker.service
```


### DockerFile

To build the docker image I prepared from this project, move inside the main directory, and run the following command :

```$ docker build -t zoomcamp_project .
```

You should see:



## References:



