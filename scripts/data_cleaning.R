################## Data Exploration, Manipulation and Visualization #########################

#Data Input
industry <- read.csv("industrycross.csv", header = TRUE, sep = ";")

#Replace commas with periods in all relevant columns
cols_to_replace <- c("gva", "age","rent","skill","academic",
                     "wage","pop","tax", "car","den", "dist",
                     "spec","market", "emp", "tech", "hosp",
                     "recr", "waste")

for (col in cols_to_replace) {
  industry[[col]] <- gsub(",", ".", industry[[col]])
  industry[[col]] <- as.numeric(industry[[col]])
}


##Log-Transformations
industry <- industry %>%
  mutate(across(-c(ID, district, year, east), ~ as.numeric(gsub(",", ".", .)))
  )

exclude_columns <- c("ID", "district", "year", "east")

industry <- industry %>%
  mutate(across(-all_of(exclude_columns), log))


#Scatterplots

plot1 <- ggplot(data = industry, aes(x = gva, y = spec)) +
  geom_point(color = "black", size = 1) +  
  labs(
    x = "Gross Value Added", 
    y = "Specialization") +
  theme_minimal()

plot2 <- ggplot(data = industry, aes(x = pop, y = spec)) +
  geom_point(color = "black", size = 1) +  
  labs(
    x = "Population", 
    y = "Specialization") +
  theme_minimal()

plot3 <- ggplot(data = industry, aes(x = wage, y = spec)) +
  geom_point(color = "black", size = 1) +  
  labs(
    x = "Wage", 
    y = "Specialization") +
  theme_minimal()

plot4 <- ggplot(data = industry, aes(x = skill, y = spec)) +
  geom_point(color = "black", size = 1) +  
  labs(
    x = "Skill", 
    y = "Specialization") +
  theme_minimal()

plot5 <- ggplot(data = industry, aes(x = east, y = wage)) +
  geom_boxplot(color = "black", size = 1) +  
  labs( 
    x = "East", 
    y = "Wage") +
  theme_minimal()

plot6 <- ggplot(data = industry, aes(x = east, y = gva)) +
  geom_boxplot(color = "black", size = 1) +  
  labs(
    x = "East", 
    y = "GVA") +
  theme_minimal()

grid.arrange(plot1,
             plot2, 
             plot3, 
             plot5, 
             ncol = 2)

#Individual Presentation
plot1
plot2
plot3
plot4
plot5
plot6


#Descriptive Statistics
stargazer(industry,type="text", title= "Table: Descriptive Statistics", digits=2, out = "DescrStats .html", median = TRUE
)

#Correlation

cor_matrix <- cor(industry[c("gva","age","rent","skill","academic",
                             "wage","pop","tax", "cong",
                             "spec","market", "emp", "tech", "hosp",
                             "recr", "waste")], use = "complete.obs")
ggcorrplot(cor_matrix)

