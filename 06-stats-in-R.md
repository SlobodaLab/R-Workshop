# Basic Statistics in R

This is a very basic introduction to using R to conduct statistics, but there are many other manipulations that can be made for more complex statistics. 

## Before We Start...

### Let's review how to inspect your data. For more information, refer back to https://slobodalab.github.io/R-Workshop/04-starting-in-R.html. 

* Size:
    * `dim(surveys)` - returns a vector with the number of rows in the first element,
          and the number of columns as the second element (the **dim**ensions of
          the object)
    * `nrow(surveys)` - returns the number of rows
    * `ncol(surveys)` - returns the number of columns

* Content:
    * `head(surveys)` - shows the first 6 rows
    * `tail(surveys)` - shows the last 6 rows

* Names:
    * `names(surveys)` - returns the column names (synonym of `colnames()` for `data.frame`
	   objects)
    * `rownames(surveys)` - returns the row names

* Summary:
    * `str(surveys)` - structure of the object and information about the class, length and
	   content of  each column
    * `summary(surveys)` - summary statistics for each column

### Let's also review variables and factors, For more information, refer back to (https://slobodalab.github.io/R-Workshop/04-starting-in-R.html)[https://slobodalab.github.io/R-Workshop/04-starting-in-R.html]. 
Remember that each *column* holds one variable of interest and each *row* holds data for one animal/sample. When considering your variables to be used in your statistical tests, you'll need to make sure that the data for this variable is in a column and that each factor level in your variable is assigned as a factor (discrete variables). To ensure that any variable is a factor, use `data$columnname = factor(data$columnname)`. 


### Let's also review some terms:

| Term | Definition |
| --- | --- |
| Function | A piece of code that does something specific stored as an object |
| Argument  | The parameters provided to a function to perform operations. Each argument provides unique info to how the function works |
| Package aka Library | A package of R scripts that someone else has created to do something in R - like an add-on or expansion pack in a game |

### Some additional packages you'll want to install or load:

car
lmerTest


## Learning Objectives
- Arguments used by **most** statistical tests
- Comparing the means of two groups 
  - Student’s t-test (parametric)
  - Wilcoxon rank test (non-parametric)
- Comparing the means of more than two groups
  - ANOVA test (analysis of variance, parametric): extension of t-test to compare more than two groups.
  - Kruskal-Wallis rank sum test (non-parametric): extension of Wilcoxon rank test to compare more than two groups
- Comparing the means of more than two groups, more than 1 independent variable - Linear Models
- Testing and visualizing your data

## Arguments used by **most** statistical tests

Most statistical tests that we'll use (T test, ANOVA, non-parametric tests, linear models) will have two main arguments: 

1. Data: your dataframe containing your data
2. Formula: your dependent (y) and independent variables (x) and how they are related.

For example:

```{r}
#The function for running a t.test is: t.test(data, formula). 
#There are 4 identical ways to do this: 

t.test(data = mouse_data, formula = weight_bm ~ diet)
t.test(mouse_data, weight_bm ~ diet)
t.test(weight_bm ~ diet, mouse_data)
mouse_data %>% 
  t.test(weight_bm ~ diet)

```

This is the same structure for most statistical test functions, just replace `t.test` with 

- `lm` - Linear model 
- `lmer` - linear mixed model
- `aov` - ANOVA
- `wilcox.test` - Wilcoxon test
- `kruskal.test` - Kruskal-Wallis test



## Which test do we use? and When? 

Statistical tests have assumptions about the data in order for the test to give reliable statistical output.

1. Data in each comparison group/variable show an normal distribution
2. Data in each group exhibit similar degrees of variability (Homoscedasticity)

|  | 2 Groups | >2 Groups | >1 independent variable
| --- | :---: | :---: | :---: |
| Parametric | T-test | ANOVA | Linear models
| Non-Parametric | Wilcoxon test | Kruskal-Wallis test |

**Parametric** - Follows all the assumptions of parametric testing about the *distribution* and *variability* of the data
**Non-parametric** - Does not follow the assumptions, distribution and variability of the data are unknown

**Technically, each of the parametric tests is a form of linear model. See this great infographic about how to use      linear models**: (https://lindeloev.github.io/tests-as-linear/)[https://lindeloev.github.io/tests-as-linear/]

## How to test the distribution and variability of your data?

### Normality Testing

**Shapiro-Wilk test** - `shapiro.test(data$glucose)` 
  
  - best used for smaller sample sizes
  
**Kolmogorov-Smirnov** - `ks.test(data)`
  
  - best used for sample size >50 
  
  
Visually accessing the distribution of your data:

```{r}
ggplot(mouse_data, aes(sample = weight_bm, color = factor(diet)))+
  geom_histogram(binwidth = 2.5)

#you can adjust the asthetics using other ggplot layers, see visualizing your data tutorial  
```  

```{r}
ggplot(data, aes(sample = weight_bm, color = factor(diet)))+
  geom_qq()+
  geom_qq_line()

#you can adjust the asthetics using other ggplot layers, see visualizing your data tutorial  
``` 

### Variability Testing

**F-test** - `var.test(formula, data)`

  - for comparing 2 sets of data
  - normally distributed
  
**Bartlett's Test** - `bartlett.test(formula, data)`

  - more than 2 sets of data
  - normally distributed
  
**Levene's Test** - `leveneTest(formula, data)`

  - more than 2 sets of data
  - not normally distributed
  
**Fligner-Killeen Test** `fligner.test(formula, data)`

  - more than 2 sets of data
  - not normally distributed


## How to view the results of your statistical tests

When running the functions for the statistical tests above, the output will print in the console or inline in your code, but may not be saved as an object for you to call upon and look at further. Some outputs will not automatically print the entire statistical outputs from the test either, so you'll have to call them up manually. 

To do this, assign each of your statistical tests to a variable: 

```{r}
t_test <- t.test(data = mouse_data, formula = weight_bm ~ diet)
t_test
```

When you conduct an ANOVA, the initial output does not include the full ANOVA table, you'll need to use `summary()`:

```{r}
anova <- aov(data = mouse_data, formula = weight_bm ~ diet)
summary(anova)
```

When you conduct an lm, the initial output does not include the full ANOVA table, you'll need to use `summary()`:

```{r}
lm <- lm(data = data, formula = weight_bm ~ diet)
summary(lm)

data %>% 
  ggplot(aes(x = weight_bm, y = glucose))+
  geom_point()+
  stat_smooth(method = "lm")

```

## More than 1 independent variable? 

If you need to conduct a statistical test with more than 1 indendent variable, you'll need to conduct a multiple linear regression using `lm`.

To add more independent variables, just add to the formula: 

`y ~ x1*x2` OR `y ~ x1 + x2`

`*` and `+` are used similarly to symbols in mathematical operators between your independent variables. 

Use `*` for independent variables that you expect to interact

Use `+` for independent variables that you do not expect to interact

## Controlling for repeated measures

In repeated measures and longitudinal studies, the observations are clustered within a subject.  That means the observations, and their residuals, are not independent.  They’re correlated. 

When you control for subject as a factor in the model, you literally redefine what a residual is.  Instead of being the distance between a data point and the average for everyone, it’s the distance between a data point and the mean for that subject.

You could, theoretically, include Subject as a fixed factor, but that usually uses up most of the degrees of freedom.  If instead, you treat Subject as a random factor, you are still controlling for Subject, you’re still able to redefine the residuals and deal with non-independence, while using up only a few degrees of freedom.

To include random variables, you need to conduct a linear mixed model using `lmer` from the `lme4` or `lmerTest` package. 

Add random variables to your model using `|`. 

Random effects can include a random intercept, random slope, or both. 

![](images/07_models.png)

If you expect the effect of your independent variable to be the same within each group (e.g. each mouse) but the starting value to differ between groups you can include a random intercept in your model. 

To include a random intercept, add  (1 \| variable) to your model. 

```{r}
lm <- lmer(data = data, formula = glucose ~ weight_bm + (1 | diet))
summary(lm)

data %>% 
  ggplot(aes(x = weight_bm, y = glucose, color = diet))+
  geom_point()+
  stat_smooth(method = "lm")

```


