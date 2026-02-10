#####################Testing for Spatial Autocorrelation##################################

# Morans I Test for residual spatial autocorrelation
lm.morantest(ols, weight_listw, alternative="two.sided")
# Test for spatial correlation of the dependent variable
moran.test(industry$spec, weight_listw, alternative="two.sided")
# Visualization for spatial dependence in the dependent variable
moran.plot(industry$spec, weight_listw)

# Lagrange Multiplier Test
lm.LMtests(ols, weight_listw, test="all")


############################## LISA ###################################################
coordinates <- read.csv("coordinates.csv", header = TRUE, sep = ",")

industry <- industry %>%
  mutate(x = coordinates$x, y = coordinates$y)

industry_sf <- st_as_sf(industry, coords = c("x", "y"), crs = 4326)

lisa_results <- localmoran(industry_sf$spec, weight_listw)

# Adding LISA results
industry_sf$lisa <- lisa_results[, "Ii"]
industry_sf$lisa_pvalue <- lisa_results[, "Pr(z != E(Ii))"]

significance_level <- 0.05

industry_sf$lisa_cluster <- "Not Significant"

industry_sf$lisa_cluster[industry_sf$lisa > 0 & industry_sf$lisa_pvalue < significance_level] <- "High-High"
industry_sf$lisa_cluster[industry_sf$lisa < 0 & industry_sf$lisa_pvalue < significance_level] <- "Low-Low"
industry_sf$lisa_cluster[industry_sf$lisa > 0 & industry_sf$lisa_pvalue >= significance_level] <- "Low-High"
industry_sf$lisa_cluster[industry_sf$lisa < 0 & industry_sf$lisa_pvalue >= significance_level] <- "High-Low"


# Visualization
plot(industry_sf["lisa_cluster"], main = "LISA cluster map")

