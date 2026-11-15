# Transformer Insulation Moisture Classification using FDS

Frequency Domain Spectroscopy (FDS) analysis and machine learning for assessing moisture condition in transformer insulation.

**EE576 — High Voltage Engineering | University of Peradeniya | Group EE.21.HV.03**

[Project report](HV_Mini_Project_Group03.pdf) · [MATLAB analysis](Task%2002/) · [Classification records](Task%2003%2604/)

## Overview

Moisture, temperature, and oil conductivity influence the dielectric response of oil–paper transformer insulation. This coursework project investigates their effects on the loss tangent (tan δ), explores correlations across frequency measurements, and compares models for classifying insulation as **Dry**, **Intermediate**, or **Wet**.

The repository combines MATLAB analysis, datasets, saved figures, classification records, and a project presentation website.

## Workflow

1. **Study FDS characteristics:** compare the effects of moisture content, temperature, and oil conductivity on dielectric response.
2. **Explore the features:** analyse correlations between 22 FDS measurements and apply a log10 transform and standardisation.
3. **Reduce dimensionality:** use principal component analysis (PCA) to visualise the data and quantify retained variance.
4. **Classify insulation condition:** compare an SVM using two principal components with a tuned SVM using all 22 features.
5. **Explore neural networks:** compare a basic neural network with a version trained using SMOTE-based augmentation.

## Dataset and reported results

The existing project overview describes **70 samples**: 23 Dry, 23 Intermediate, and 24 Wet. Classification uses an **80/20 stratified split**, with 56 training samples and 14 test samples.

| Model | Reported test accuracy |
| --- | ---: |
| SVM using the first two principal components | 85.71% (12/14) |
| Tuned SVM using all 22 features | 92.86% (13/14) |
| Basic neural network | 85.71% (12/14) |
| Neural network with SMOTE-based augmentation | 92.86% (13/14) |

The project overview reports that the first two principal components explain **91.04%** of variance; the first three explain **97.90%**. The tuned all-feature SVM was selected as the primary classifier in the project.

These figures summarise the existing [project presentation source](index.html); they are not a fresh benchmark run. With only 14 test samples, one changed prediction moves accuracy by approximately 7.14 percentage points. The results are an exploratory coursework comparison, not evidence of performance on unseen field installations.

## Repository guide

| Location | Contents |
| --- | --- |
| [Task 01](Task%2001/) | FDS characteristics analysis and associated outputs |
| [Task 02](Task%2002/) | Excel dataset, MATLAB correlation and PCA scripts, and generated figures |
| [Task 03&04](Task%2003%2604/) | Classification PDF export, confusion matrix, and prediction spreadsheet |
| [Task 05](Task%2005/) | PDF exports documenting data generation and neural-network work |
| [Documents](Documents/) | Supporting project documents |
| [HV_Mini_Project_Group03.pdf](HV_Mini_Project_Group03.pdf) | Full group project report |
| [index.html](index.html) and [styles.css](styles.css) | Project presentation website |

## Run the MATLAB PCA example

### Requirements

- MATLAB with Statistics and Machine Learning Toolbox for functions such as `pca` and `zscore`.
- A MATLAB release supporting `exportgraphics`.
- The supplied `Group03_Task2_DataSheet.xlsx` file, kept in the `Task 02` folder.

Clone or download the repository. In MATLAB, set the repository root as the current folder, then run:

```matlab
cd('Task 02');
run('task2_pca_scree_plot.m');
```

The script reads columns 2–23 as the 22 FDS features, applies `log10` and standardisation, performs PCA, and writes PNG and PDF figures into `task2_outputs`. It also prints explained-variance values in the Command Window. Input feature values must be positive for the logarithmic transform.

Other scripts in the same folder cover correlation calculations, the correlation heatmap, PCA score plots, and summary calculations. Run them with `Task 02` as the current folder so relative dataset paths resolve correctly.

**Reproducibility note:** the MATLAB PCA example analyses the complete dataset for exploration. For predictive evaluation, fit preprocessing and PCA on training data only, then apply the fitted transformations to held-out data. The classification and neural-network folders currently contain PDF exports rather than runnable training source, so they document the experiments but do not provide a complete executable training pipeline.

## Explore the project

- Read the [full report](HV_Mini_Project_Group03.pdf) for the project discussion and references.
- Open `index.html` in a browser after downloading the repository to view the presentation; keep the folder structure intact for its linked figures.
- Inspect the [classification outputs](Task%2003%2604/) alongside the reported model comparison.

## Limitations and possible extensions

- Evaluate on a larger, independent dataset spanning different insulation conditions and measurement settings.
- Use repeated or nested validation to assess sensitivity to the data split and model tuning.
- Keep scaling, feature extraction, and synthetic augmentation inside the training process to prevent leakage.
- Provide executable training scripts and explicit environment versions to improve reproducibility.

## Academic context

This is a **group coursework project** for EE576 High Voltage Engineering at the University of Peradeniya, maintained here by Shakkya Gamage. Results are presented as group project outcomes; this README does not assign individual contributions.
