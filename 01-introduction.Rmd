---
title: "Introduction"
author: "Data Carpentry contributors"
see [Data Carpentry R Ecology Lesson](https://datacarpentry.org/R-ecology-lesson/)
editor_options:
  markdown:
    wrap: 80
---
--------------------------------------------------------------------------------

> ### Learning Objectives
>
> -   Be able to explain what R and RStudio are, what they are used for, and how
>     they relate to each other.
> -   Describe the purpose of the RStudio Script, Console, Environment, and
>     Plots panes.
> -   Organize files and directories for a set of analyses as an R Project, and
>     understand the purpose of the working directory.
> -   Use the built-in RStudio help interface to search for more information on
>     R functions.
> -   Demonstrate how to provide sufficient information for troubleshooting with
>     the R user community.
--------------------------------------------------------------------------------

## What is R? What is RStudio?

The term "`R`" is used to refer to both the programming language and the
software that interprets the scripts written using it.

[RStudio](https://rstudio.com) is currently a very popular way to not only write
your R scripts but also to interact with the R software. To function correctly,
RStudio needs R and therefore both need to be installed on your computer.

## Why learn R?

### R does not involve lots of pointing and clicking, and that's a good thing

The learning curve might be steeper than with other software, but with R, the
results of your analysis do not rely on remembering a succession of pointing and
clicking, but instead on a series of written commands, and that's a good thing!
So, if you want to redo your analysis because you collected more data, you don't
have to remember which button you clicked in which order to obtain your results.
With a stored series of commands (this is your script), you can repeat running them and
R will process the new dataset exactly the same way as before.

Working with scripts makes the steps you used in your analysis clear, and the
code you write can be inspected by someone else who can give you feedback and
spot mistakes.

Working with scripts forces you to have a deeper understanding of what you are
doing, and facilitates your learning and comprehension of the methods you use.

### R code is great for reproducibility

Reproducibility is when someone else (including your future self) can obtain the
same results from the same dataset when using the same analysis.

R integrates with other tools to generate manuscripts from your code. If you
collect more data, or fix a mistake in your dataset, the figures and the
statistical tests in your manuscript are updated automatically.

An increasing number of journals and funding agencies expect analyses to be
reproducible, so knowing R will give you an edge with these requirements.

### R is interdisciplinary and extensible

With 10,000+ packages that can be installed to extend its capabilities, R
provides a framework that allows you to combine statistical approaches from many
scientific disciplines to best suit the analytical framework you need to analyze
your data. For instance, R has packages for image analysis, GIS, time series,
population genetics, and a lot more.

### R works on data of all shapes and sizes

The skills you learn with R scale easily with the size of your dataset. Whether
your dataset has hundreds or millions of lines, it won't make much difference to
you.

R is designed for data analysis. It comes with special data structures and data
types that make handling of missing data and statistical factors convenient.

R can connect to spreadsheets, databases, and many other data formats, on your
computer or on the web.

### R produces high-quality graphics

The plotting functionalities in R are endless, and allow you to adjust any
aspect of your graph to convey most effectively the message from your data.

### R has a large and welcoming community

Thousands of people use R daily. Many of them are willing to help you through
mailing lists and websites such as [Stack Overflow](https://stackoverflow.com/),
or on the [RStudio community](https://community.rstudio.com/).

### Not only is R free, but it is also open-source and cross-platform

Anyone can inspect the source code to see how R works. Because of this
transparency, there is less chance for mistakes, and if you (or someone else)
find some, you can report and fix bugs.

## Knowing your way around RStudio

Let's start by learning about [RStudio](https://www.rstudio.com/), which is an
Integrated Development Environment (IDE) for working with R.

The RStudio IDE open-source product is free under the [Affero General Public
License (AGPL) v3](https://www.gnu.org/licenses/agpl-3.0.en.html). The RStudio
IDE is also available with a commercial license and priority email support from
RStudio, PBC.

We will use RStudio IDE to write code, navigate the files on our computer,
inspect the variables we are going to create, and visualize the plots we will
generate. RStudio can also be used for other things (e.g., version control,
developing packages, writing Shiny apps) that we will not cover during the
workshop.

![RStudio interface screenshot. Clockwise from top left: Source,
Environment/History, Files/Plots/Packages/Help/Viewer,
Console.](img/rstudio-screenshot.png)

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

## Getting set up

It is good practice to keep a set of related data, analyses, and text
self-contained in a single folder, called the **working directory**. All of the
scripts within this folder can then use *relative paths* to files that indicate
where inside the project a file is located (as opposed to absolute paths, which
point to where a file is on a specific computer). Working this way allows you to
move your project around on your computer and share it with others
without worrying about whether or not the underlying scripts will still work.

RStudio provides a helpful set of tools to do this through its "Projects"
interface, which not only creates a working directory for you, but also
remembers its location (allowing you to quickly navigate to it) and optionally
preserves custom settings and (re-)open files to assist resume work after
a break. Go through the steps for creating an "R Project" for this tutorial
below.

1.  Start RStudio.
2.  Under the `File` menu, click on `New Project`. Choose `New Directory`, then
    `New Project`.
3.  Enter a name for this new folder (or "directory"), and choose a convenient
    location for it. This will be your **working directory** for the rest of the
    day (e.g., `~/data-carpentry`).
4.  Click on `Create Project`.
5.  Download the [code
    handout](https://datacarpentry.org/R-ecology-lesson/code-handout.R), place
    it in your working directory and rename it (e.g.,
    `data-carpentry-script.R`).
6.  (Optional) Set Preferences to 'Never' save workspace in RStudio.

A workspace is your current working environment in R which includes any
user-defined object. By default, all of these objects will be saved, and
automatically loaded, when you reopen your project. Saving a workspace to
`.RData` can be cumbersome, especially if you are working with larger datasets,
and it can lead to hard to debug errors by having objects in memory you forgot
you had. Therefore, it is often a good idea to turn this off. To do so, go to
Tools --\> 'Global Options' and select the 'Never' option for
'Save workspace to .RData' on exit.'

![Set 'Save workspace to .RData on exit' to
'Never'](img/rstudio-preferences.png)
