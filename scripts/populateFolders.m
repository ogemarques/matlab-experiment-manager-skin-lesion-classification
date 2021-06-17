%% Populate folders for training images based on zip files from ISBI2016 ISIC Part 3

%% Go to 'root' folder
cd '/Users/oge/Projects/MATLAB/SkinLesion'

%% Create folders (only once)
status = exist('benign', 'dir');
if (status == 7)
    disp('Folder already exists');
else
    mkdir benign;
end

status = exist('malignant', 'dir');
if (status == 7)
    disp('Folder already exists');
else
    mkdir malignant;
end

%% Import from CSVs into tables
importFromCSV

%% Traverse table with training data GT info and move files to correct folders

training_data = ISBI2016ISICPart3TrainingGroundTruth; %friendly alias
[rows, cols] = size(training_data);

for i=1:rows
    filename = "ISBI2016_ISIC_Part3_Training_Data/" + training_data.filename(i) + ".jpg";
    label = training_data.ground_truth(i);
    if (label == 'benign')
        movefile(filename,'benign');
        % move file to 'benign' folder
    elseif (label == 'malignant')
        movefile(filename,'malignant');
        % move file to 'malignant' folder
    else
        disp('Error reading ground truth!!!');
    end
end

%% Check folder sizes

benignFolderInfo = dir('benign/ISIC*.jpg');
malignantFolderInfo = dir('malignant/ISIC*.jpg');

[bCount, ~] = size(benignFolderInfo);
[mCount, ~] = size(malignantFolderInfo);

% assert(bCount + mCount - 4 == 900) % -4 is a hack to account for '.' and '..'

assert(bCount + mCount == 900)
