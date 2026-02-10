## R Scripts

This repository contains a set of R scripts implementing the full analytical workflow,
from data preparation to spatial econometric modeling and robustness checks.

Each script is modular and can be run independently after data preparation.

### data_cleaning.R
- Cleans and merges regional socioeconomic and geographic datasets
- Constructs key variables related to industrial specialization, wages,
  transport accessibility, agglomeration, and amenities
- Produces the final analysis-ready dataset used in all subsequent models

---

### distance_matrix.R
- Computes inter-regional distance matrices at the county level
- Constructs spatial weight matrices used in spatial econometric models
- Ensures consistency between geographic data and regression inputs

---

### MoransI and LISA.R
- Tests for global spatial autocorrelation using Moran’s I
- Generates Moran’s I scatterplots
- Computes Local Indicators of Spatial Association (LISA)
- Identifies spatial clusters and hotspots (high-high, low-low, high-low, low-high)

---

### spatial_regression.R
- Estimates baseline Ordinary Least Squares (OLS) models
- Implements spatial regression models:
  - Spatial Lag Model (SLX)
  - Spatial Error Model (SEM)
  - Spatial Durbin Model (SDM)
- Compares model performance and evaluates spatial spillover effects

---

### endogeneity.R
- Addresses potential endogeneity concerns using instrumental variables
- Implements Two-Stage Least Squares (2SLS) estimation
- Compares OLS and IV results to assess robustness of key coefficients

