############################### Spatial Regression #######################################################################

# Estimation of spatial models
# SAR
w1_sar <- lagsarlm(spec ~ age + rent + skill + academic + wage + pop + tax + car
                   + gva + market + emp + tech + hosp + recr + east
                   , data = industry, weight_listw)
print(summary(w1_sar), signif.stars=T, digits=3)

# SEM
w1_sem <- errorsarlm(spec ~ age + rent + skill + academic + wage + pop + tax + car
                     + gva + market + emp + tech + hosp + recr + east
                     , data = industry, weight_listw)
print(summary(w1_sem), signif.stars=T, digits=3)

# Comparing basic model, SAR and SEM
stargazer(ols_robust, w1_sar, w1_sem, se=list(se), type="text"
          , model.names = TRUE,out = "Comparison .html"
          , keep.stat = c("n", "adj.rsq", "f", "wald")
          , add.lines=list(c("BIC", round(BIC(ols),1), round(BIC(w1_sar),1), round(BIC(w1_sem),1))
                           , c("AIC", round(AIC(ols),1), round(AIC(w1_sar),1), round(AIC(w1_sem),1))
                           , c("LogLik", round(logLik(ols),1), round(logLik(w1_sar),1), round(logLik(w1_sem),1)))
)

## Adding lagged explanatory variables
# SDM
w1_sdm <- lagsarlm(spec ~ age + rent + skill + academic + wage + pop + tax + car
                   + gva + market + emp + tech + hosp + recr + east
                   , data = industry, weight_listw, type="mixed")
print(summary(w1_sdm), signif.stars=T, digits=3)


# Testing model restrictions
# Given one model is a more simple version of the other we can test
# H0: both models have equal explanatory power, then the simpler one is to be preferred

# Can the SDM be restricted to the SEM?
LR.sarlm(w1_sdm, w1_sem)

# Can the SDM be restricted to the SAR?
LR1.sarlm(w1_sdm, w1_sar)
LR1.sarlm
class(w1_sar)
# SLX
w1_slx <- lmSLX(spec ~ age + rent + skill + academic + wage + pop + tax + car
                + gva + market + emp + tech + hosp + recr + age
                , data = industry, weight_listw)
print(summary(w1_slx), signif.stars=T, digits=3)

# Can the SDM be restricted to the SLX?
LR.Sarlm(w1_sdm, w1_slx)

#SDM Results
stargazer(
  w1_sdm,
  type = "text", 
  title = "Table: SDM Results", 
  digits = 2, 
  out = "SDM_results.html", 
  median = TRUE
)
# Comparing basic model and SDM
stargazer(ols_robust, w1_sdm, se=list(se), type="text"
          , model.names = TRUE, out = "ols_robust vs. SDM.html"
          , keep.stat = c("n", "adj.rsq", "f", "lr", "wald", "ser")
          , add.lines=list(c("BIC", round(BIC(ols),1), round(BIC(w1_sdm),1))
                           , c("AIC", round(AIC(ols),1), round(AIC(w1_sdm),1))
                           , c("LogLik", round(logLik(ols),1), round(logLik(w1_sdm),1)))
)

stargazer(ols, w1_sdm, se=list(se), type="text"
          , model.names = TRUE, out = "ols vs. SDM.html"
          , keep.stat = c("n", "adj.rsq", "f", "lr", "wald", "ser")
          , add.lines=list(c("BIC", round(BIC(ols),1), round(BIC(w1_sdm),1))
                           , c("AIC", round(AIC(ols),1), round(AIC(w1_sdm),1))
                           , c("LogLik", round(logLik(ols),1), round(logLik(w1_sdm),1)))
)

#Comparing Spatials
stargazer(w1_sar, w1_slx, w1_sdm, type="text"
          , model.names = TRUE, out = "Comparison Spatial.html"
          , keep.stat = c("n", "adj.rsq", "f", "lr", "wald", "ser")
          , add.lines=list(c("BIC", round(BIC(w1_sar),1), round(BIC(w1_slx),1), round(BIC(w1_sdm),1))
                           , c("AIC", round(AIC(w1_sar),1), round(AIC(w1_slx),1), round(AIC(w1_sdm),1))
                           , c("LogLik", round(logLik(w1_sar),1), round(logLik(w1_slx),1), round(logLik(w1_sdm),1)))
)

#Comparing SLX, SEM, SDM
stargazer(w1_slx, w1_sem, w1_sdm, type="text"
          , model.names = TRUE, out = "Comparison Spatial 2.html"
          , keep.stat = c("n", "adj.rsq", "f", "lr", "wald", "ser")
          , add.lines=list(c("BIC", round(BIC(w1_slx),1), round(BIC(w1_sem),1), round(BIC(w1_sdm),1))
                           , c("AIC", round(AIC(w1_slx),1), round(AIC(w1_sem),1), round(AIC(w1_sdm),1))
                           , c("LogLik", round(logLik(w1_slx),1), round(logLik(w1_sem),1), round(logLik(w1_sdm),1)))
)

stargazer(ols_robust, w1_slx, w1_sem, w1_sdm, type = "text",
          out = "Comparison_Spatial_2.html",
          column.labels = c("SLX", "SEM", "SDM"),
          keep.stat = c("n", "adj.rsq", "f", "lr", "wald", "ser"),
          add.lines = list(c("BIC", round(BIC(ols_robust), 1), round(BIC(ols_robust), 1), round(BIC(ols_robust), 1)),
                           c("BIC", round (BIC(ols_robust), 1), round(BIC(w1_slx), 1), round(BIC(w1_sem), 1), round(BIC(w1_sdm), 1)),
                           c("AIC", round (BIC(ols_robust), 1), round(AIC(w1_slx), 1), round(AIC(w1_sem), 1), round(AIC(w1_sdm), 1)),
                           c("LogLik", round(logLik(w1_slx), 1), round(logLik(w1_sem), 1), round(logLik(w1_sdm), 1)),
          )
)
