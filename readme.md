
## Fruit Type Classification Project 🍉🍌🥭
## Introduction

In the following capstone project for the Machine Learning Zoomcamp from **Alexey Grigorev** , I decided to do an image classification task of different kinds of fruits using the [fruits-360](https://www.kaggle.com/moltean/fruits) dataset, which provides <b> 131! </b> types of differents fruits, with some that may look pretty similar to the human eye, the dataset also presents the fruit images without any background , thus making it somewhat easier to train.





## Problem Description:


<b> The problem: </b> Fruits are often hard to classify manually given the wide variety of types, it can be a really burdensome challenge due to the mass in which fruits are produced, creating an automated classifier could help in the future, so that this task can be done instantly.

![alt](https://github.com/aenoboa1/ML_Zoomcamp-Capstone-Project/blob/master/img/notebooks/fruits.png)



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
| Notebook                      | [Explanatory notebook with EDA and Training of XCeption Model](https://github.com/aenoboa1/ML_Zoomcamp-Capstone-Project/blob/master/FruitsProject_XCeption.ipynb)  |
| Second Notebook                |  [Explanatory notebook with Traning and tunning of VGA16 Model](https://github.com/aenoboa1/ML_Zoomcamp-Capstone-Project/blob/master/FruitsProject_VGG.ipynb) |
| Third Notebook                |  [Notebook TF to TFLite Conversion](https://github.com/aenoboa1/ML_Zoomcamp-Capstone-Project/blob/master/tf-to_tfLITE.ipynb) |
|                   DockerFile            |  [dockerfile](https://github.com/aenoboa1/ML_Zoomcamp-Capstone-Project/blob/master/dockerfile) |
|                   XCeption Deployed Model            |  [Tflite Xception](https://github.com/aenoboa1/ML_Zoomcamp-Capstone-Project/blob/master/models/XCeption_V1_Fruits.tflite) |
|              Lambda Function                 |  [Lambda function](https://github.com/aenoboa1/ML_Zoomcamp-Capstone-Project/blob/master/lambda_function.py) |
|              test.py                 |  [To test a fruit prediction](https://github.com/aenoboa1/ML_Zoomcamp-Capstone-Project/blob/master/test.py) |


**Project Structure:**
```
ML_Zoomcamp-Capstone-Project/ # Main Folder
├── data # directory where the data should be placed
│   ├── fruits-360 # data directory
│   │   ├── papers
│   │   ├── preview
│   │   ├── Test
│   │   ├── test-multiple_fruits
│   │   └── Training
│   └── fruits-360-original-size # alternative dataset still in works (do not use)
├── img  # images for readme
│   ├── deployment # images of deployment
│   ├── notebooks # images from the notebook
│   └── test_own_fruits #url images of fruits that can be tested
├── models # models tflite and .h5
└── __pycache__

```

## Models used and accuracy obtained:
In my project I decided to use two CNN architectures: **VGG16** and **XCeption**, both are considered quite good for image classification tasks, and should make the task of classifying tons of fruit images duable.

VGG16:



![alt](https://i.imgur.com/lsCtfIh.png)



XCeption:


![alt](https://i.imgur.com/SjFqYq8.png)


### Accuracy by model:


| Model           | Train  | Validation | Test   |
|-----------------|--------|------------|--------|
| XCeption Vanila | 99.60% | 94.48 %    | 90.45% |
| Tuned XCeption  | 99.07% | 96.41%     | 92.94% |
| VGG16 Vanila    | 99.60% | 96.50%     | 91.99% |
| VGG16 Tuned     | 99.46  | 97.33%     | 95.53% |


Model chosen for deployment: **XCeption**
In this case I choose XCeption because, even though VGG16 was obtaining a higher accuracy, it failed to generalize to images outside the main dataset, this should be further optimized.

## Deployment:

The model was deployed using TFLite, You can see the output for the image I prepared like this:
![lambda](https://github.com/aenoboa1/ML_Zoomcamp-Capstone-Project/blob/master/img/deployment/lambda_image.png)

### Virtual Environment : `Pipenv 2021.5.29` 

<b>Python version: ` Python 3.8`🐍  </b>


Versions/requirements used inside the virtual environment:

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


### Running this Docker image locally


To build the docker image I prepared from this project, move inside the main directory, and run the following command :

```console
$ docker build -t fruits-model .
```

You should see:
![docker](https://github.com/aenoboa1/ML_Zoomcamp-Capstone-Project/blob/master/img/deployment/docker.png?raw=true)


Now run the docker build mapping the port 8080 to your host computer.

`docker run -it --rm -p 8080:8080 fruits-model
`
You should see:


![docker2](https://github.com/aenoboa1/ML_Zoomcamp-Capstone-Project/blob/master/img/deployment/docker2.png?raw=true)

Inside another terminal session, run the following command inside the main folder of the project:

`python test.py
`

You should see(This really long input):
![docker2](https://github.com/aenoboa1/ML_Zoomcamp-Capstone-Project/blob/master/img/deployment/docker3.png?raw=true)

This is the output for the image I prepared, we can see that is indeed a :banana: <br>

**The image in reference:**
<img src="https://i.imgur.com/Wj4Lajm.png" alt="drawing" width="200"/>


 This image for testing I downloaded from Google ( it's not from the dataset), you can try your own images too, just change the ` data = {'url': 'https://i.imgur.com/Wj4Lajm.png'} `
 Inside `test.py` for the image url of your choice.


## Deployment in the cloud | AWS Lambda λ

The repository was created with the following command:
`aws ecr create-repository --repository-name fruits-tflite-images
`
**Output:**
![docker2](https://github.com/aenoboa1/ML_Zoomcamp-Capstone-Project/blob/master/img/deployment/lambda.png?raw=true)

Pushing the docker image to the cloud:

![docker4](https://github.com/aenoboa1/ML_Zoomcamp-Capstone-Project/blob/master/img/deployment/docker4.png?raw=true)


Testing the aws lambda function:
![lambda](https://github.com/aenoboa1/ML_Zoomcamp-Capstone-Project/blob/master/img/deployment/lambda3.png?raw=true)


## Run this yourself | AWS Lambda λ

In this fruits project, I used AWS Lambda to deploy my docker container to the cloud , I followed the steps described in zoomcamp week 9 from Alexey Grigorev . To run this easily , you should simply uncomment the following lines from `test.py`

```python

#url = 'http://localhost:8080/2015-03-31/functions/function/invocations'
url= "https://w832b3ab81.execute-api.us-east-1.amazonaws.com/Test/predict"

```



Now, simply run

`python test.py`

Inside the main Folder, you should see the following output:
![lambda](https://github.com/aenoboa1/ML_Zoomcamp-Capstone-Project/blob/master/img/deployment/lambda5.png?raw=true)



## References:

[1] https://github.com/alexeygrigorev/mlbookcamp-code "Alexey Grigorev"

[2] Chollet, F. (2021). Deep learning with Python. Simon and Schuster.