Adapted from [Data Carpentry R Ecology Lesson](https://datacarpentry.org/R-ecology-lesson/)
--------------------------------------------------------------------------------

 ### Learning Objectives

 -   Be able to explain what R and RStudio are, what they are used for, and how
     they relate to each other.
 -   Describe the purpose of the RStudio Script, Console, Environment, and
     Plots panes.
 -   Organize files and directories for a set of analyses as an R Project, and
     understand the purpose of the working directory.
 -   Use the built-in RStudio help interface to search for more information on
     R functions.
 -   Demonstrate how to provide sufficient information for troubleshooting with
     the R user community.
--------------------------------------------------------------------------------

## What is R? What is RStudio?

The term "`R`" is used to refer to both the programming language and the
software that interprets the scripts written using it.

[RStudio](https://rstudio.com) is currently a very popular way to not only write
your R scripts but also to interact with the R software. To function correctly,
RStudio needs R and therefore both need to be installed on your computer.

## Why learn R?

### R code is reproducible

Reproducibility is when someone else (including your future self) can obtain the
same results from the same dataset when using the same analysis. 

Working with scripts makes the steps you used in your analysis clear, and the
code you write can be inspected by someone else who can give you feedback and
spot mistakes.

Working with scripts forces you to have a deeper understanding of what you are
doing, and facilitates your learning and comprehension of the methods you use.

R integrates with other tools to generate manuscripts from your code. If you
collect more data, or fix a mistake in your dataset, the figures and the
statistical tests in your manuscript are updated automatically.

### R is extensible

There are over 10,000 packages that can be installed to extend the capabilities of R. Some of the packages that we will be using include:
- the [Tidyverse](https://www.tidyverse.org/): a collection of packages designed for data science including [ggplot2](https://ggplot2.tidyverse.org/) for creating beautiful graphics
- [ProjectTemplate](http://projecttemplate.net/index.html) for organizing your project (see [Project Organization](03-project-organization.md))
- [here](https://here.r-lib.org/) to enable easy file referencing withing projects

### R produces high-quality graphics

The plotting functionalities in R are endless, and allow you to adjust any
aspect of your graph to convey most effectively the message from your data.

### R has a large and welcoming community

Thousands of people use R daily. Many of them are willing to help you through
mailing lists and websites such as [Stack Overflow](https://stackoverflow.com/),
or on the [RStudio community](https://community.rstudio.com/).

## Knowing your way around RStudio

Let's start by learning about [RStudio](https://www.rstudio.com/), which is an
Integrated Development Environment (IDE) for working with R.

We will use RStudio IDE to write code, navigate the files on our computer,
inspect the variables we are going to create, and visualize the plots we will
generate. 

![RStudio interface screenshot. Clockwise from top left: Source,
Environment/History, Files/Plots/Packages/Help/Viewer,
Console.](images/RStudio-screenshot.png)

RStudio is divided into 4 "panes":

-   The **Source** for your scripts and documents (top-left, in the default
    layout)
-   Your **Environment/History** (top-right) which shows all the objects in
    your working space (Environment) and your command history (History)
-   Your **Files/Plots/Packages/Help/Viewer** (bottom-right)
-   The R **Console** (bottom-left)

The placement of these panes and their content can be customized (see menu,
Tools -\> Global Options -\> Pane Layout). For ease of use, settings such as
background color, font color, font size, and zoom level can also be adjusted in
this menu (Global Options -> Appearance).

One of the advantages of using RStudio is that all the information you need to
write code is available in a single window. Additionally, with many shortcuts,
autocompletion, and highlighting for the major file types you use while
developing in R, RStudio will make typing easier and less error-prone.
