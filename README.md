# Managing medical image classification experiments with MATLAB Experiment Manager App
This repository shows an example of how to use MATLAB Experiment Manager for a medical image classification task.

## Experiment objective
To test the best combination of pretrained deep learning model and optimizer for a binary (*malignant* or *benign*) skin lesion classification task using transfer learning.

## Common components
### Dataset
Annotated images<sup>[1](#myfootnote1)</sup> from the [ISIC 2016](https://challenge.isic-archive.com/data) challenge, Task 3 (Lesion classification) dataset, consisting of 900 dermoscopic lesion images in JPEG format for training and validation, distributed in two classes (727 images were labeled as ‘benign’, 173 as ‘malignant’) plus 379 test images of the exact same format as the training data, and associated ground truth for all images.

### Common hyperparameters
- Dataset partition (e.g., 70% for training, 30% for validation)
- Loss function
- Mini-batch size
- Initial learning rate
- Learning rate schedule
- Number of epochs
- Validation patience
- Validation frequency
- Performance metrics
  
### Preprocessing scripts
- Image resizing (to the size expected by the input layer of each model)
- Image augmentation (e.g., translation, scaling and rotation)

## Variable sets
A total of nine (3 x 3) combinations of:
- Model: ResNet-18, GoogLeNet or SqueezeNet
- Optimizer: ‘adam’, ‘sgdm’, or ‘rmsprop’

## Requirements
- [X]  [MATLAB 2020a](https://www.mathworks.com/products/matlab.html) or later
- [X]  [Deep Learning Toolbox](https://www.mathworks.com/products/deep-learning.html)
- [X]  [Deep Learning Toolbox™ Model for GoogLeNet Network support package](https://www.mathworks.com/help/deeplearning/ref/googlenet.html) 
- [X]  [Deep Learning Toolbox™ Model for ResNet-18 Network support package](https://www.mathworks.com/help/deeplearning/ref/resnet18.html) 
- [X]  [Deep Learning Toolbox™ Model for SqueezeNet Network support package](https://www.mathworks.com/help/deeplearning/ref/squeezenet.html) 
- [ ]  [Parallel Computing Toolbox](https://www.mathworks.com/products/parallel-computing.html) (only required for training using a GPU)
## Suggested steps
1. Download or clone the repository.
2. Open MATLAB.
3. Edit the contents of the `dataFolder` variable in the `experiment1_setup.mlx` file to reflect the absolute path to your selected dataset<sup>[2](#myfootnote2)</sup>. 
4. Open the Experiment Manager app (you can type `experimentmanager` in the MATLAB Command Window or select the app from the "APPS" ribbon).
5. Select the "New Project" option and click on the "Create" button.
6. On the next screen, select the "Image Classification Using Transfer Learning" option and click on the "ADD" button.
7. Specify a folder for your project.
8. Edit the textbox containing the name of the Setup Function to reflect the name `experiment1_setup`.
9.  Configure (i.e., edit manually) the hyperparameters table to reflect your choice of `Solver` (`["adam" "sgdm" "rmsprop]`) and `Network` (`["squeezenet" "googlenet" "resnet18"]`) (see figure below). 

![](figures/EM1_edited.png)

10. Copy the resulting `experiment1_setup.mlx` file to the project folder created by the Experiment Manager app.
11. (Optionally) click the "Use Parallel" button to run experiments in parallel.
12. Click the "Run" button and watch the progress bars change as the different trials are run.
13. Once the experiment concludes, explore/sort/filter/annotate the results. 
14. Save and close the project.
## Additional remarks

- You are encouraged to expand and adapt the example to your needs.
- The choice of pretrained networks and their hyperparameters (learning rate, mini-batch size, number of epochs, etc.) is merely illustrative. 
- Most of the resulting Network/Solver combinations do not show a stellar performance and all of them show signs of overfitting (see figure below). 
- 
![](figures/EM2_edited.png). 

- You are encouraged to (use Experiment Manager to) tweak those choices and find a better solution.
## Notes
<a name="myfootnote1">[1]</a> This example uses a small subset of images to make it easier to get started without having to worry about large downloads and long training times.   

<a name="myfootnote2">[2]</a> You can choose to use either the `data` folder or the `balanced_data` folder: both contain subfolders labeled `benign` and `malignant`.