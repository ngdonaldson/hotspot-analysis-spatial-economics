
######################## Endogeneity/2SLS ###########################################
industry_clean <- na.omit(industry)
first_stage <- lm(gva ~  age + rent + skill + academic + wage + pop + tax + car
                  + market + emp + tech + hosp + recr + east + waste
                  , data = industry_clean)
summary(first_stage)

industry_clean$gva_w <- fitted.values(first_stage)

Two_SLS <- lm(spec ~ gva_w + age + skill + rent + academic + wage + pop + dist
              + tax + car + market + hosp + tech, data = industry_clean)
summary(second_stage)

stargazer(
  ols, Two_SLS, 
  type = "text", 
  add.lines = list(
    c("BIC", round(BIC(ols), 2), round(BIC(Two_SLS), 2)),
    c("AIC", round(AIC(ols), 2), round(AIC(Two_SLS), 2))
  ), 
  title = "OLS vs. 2SLS", 
  digits = 2, 
  out = "olsvs2SLS.html", 
  median = TRUE
)

res <- residuals(first_stage)
residual_OLS <- lm(spec ~ gva + age + skill + rent + academic + wage + pop + dist
                   + tax + car + market + hosp + tech + res, data = industry_clean)
summary(residual_OLS)