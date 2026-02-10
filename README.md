# hotspot-analysis-spatial-economics
Hotspot Analysis of Industry Location Factors - Spatialautoregression
# Hotspot Analysis in Spatial Economics  
**Industrial Location, Agglomeration & Knowledge Spillovers (Germany)**

## Overview
This project investigates the determinants of industrial location choice in Germany using
spatial econometric methods and geospatial analysis. The focus is on identifying spatial
clusters, agglomeration effects, and knowledge spillovers across German counties.

The analysis combines **R** for econometric modeling and **QGIS** for spatial visualization,
with particular emphasis on **Local Indicators of Spatial Association (LISA)** and spatial
regression models.

This repository showcases applied skills relevant to **transport economics, urban mobility,
regional development, and policy analysis**.

---

## Research Questions
- What factors drive industrial location choices across regions?
- To what extent do spatial spillovers and agglomeration effects matter?
- How do transport accessibility, wages, and technological infrastructure influence
  industrial clustering?

---

## Data
- **Geographical scope:** Germany (400 counties)
- **Year:** 2012 (cross-sectional)
- **Sources:**
  - INKAR regional socioeconomic database
  - VG2500 shapefile (Bundesamt für Kartographie und Geodäsie)

Key variable groups:
- Industrial specialization
- Knowledge spillovers (education, skills, wages)
- Transport accessibility and infrastructure
- Agglomeration and market potential
- Amenities, population, and policy controls

---

## Methodology
### Spatial Analysis
- Moran’s I (global spatial autocorrelation)
- LISA cluster and hotspot maps

### Econometric Models
- Ordinary Least Squares (OLS)
- Spatial Lag Model (SLX)
- Spatial Error Model (SEM)
- **Spatial Durbin Model (SDM)** (preferred specification)
- Instrumental Variables (2SLS) to address endogeneity

Spatial weight matrices are constructed using inter-county distance measures.

---

## Key Findings
- Significant spatial autocorrelation in industrial specialization
- Strong evidence of agglomeration effects and spatial spillovers
- Transport accessibility and wage levels play a major role in clustering
- Technological infrastructure exhibits significant spillover effects
- Educational variables show weaker spatial agglomeration than expected

---

## Tools & Technologies
- **R**: spatial econometrics, regression analysis, diagnostics
- **QGIS**: spatial joins, LISA visualization, hotspot mapping
- **Excel**: data cleaning and formatting

Key R packages:
- `spdep`
- `spatialreg`
- `sf`
- `ggplot2`

---

## Disclaimer
This repository is provided for **academic, educational, and portfolio purposes only**.

The analysis, code, and visualizations reflect the author’s work within an academic context
and do not represent official statistics, policy recommendations, or the views of any
institution.

Due to data licensing restrictions, raw datasets are not publicly shared. All results are
based on publicly available regional data sources and processed using reproducible methods.

The code is provided “as is” without warranty of any kind. Users are responsible for
verifying results before applying them to research, policy analysis, or decision-making.

Parts of this project were developed collaboratively as part of an academic seminar.


