### Data Visualization with ggplot2

------------

 ### Learning Objectives

 * Produce scatter plots, boxplots, and time series plots using ggplot.
 * Set universal plot settings.
 * Describe what faceting is and apply faceting in ggplot.
 * Modify the aesthetics of an existing ggplot plot (including axis labels and color).
 * Build complex and customized plots from data in a data frame.
--------------

**`ggplot2`** is included in the **`tidyverse`** package and will be automatically loaded when you run `load.project()` 
if you have load_libraries set to TRUE in your global.dcf config file. 

## Plotting with **`ggplot2`**

**`ggplot2`** is a plotting package that provides helpful commands to create complex plots
from data in a data frame. 

**`ggplot2`** refers to the name of the package itself. When using the package we use the
function **`ggplot()`** to generate the plots, and so references to using the function will
be referred to as **`ggplot()`** and the package as a whole as **`ggplot2`** 

ggplot graphics are built layer by layer by adding new elements. Adding layers in
this fashion allows for extensive flexibility and customization of plots. Layers
are added using the `+` operator. 

To build a ggplot:

- pipe your dataframe into the `ggplot()` function

```{r}
mouse_data %>%
  ggplot()
```

- define an aesthetic mapping (using the aesthetic (`aes`) function), by
selecting the variables to be plotted and specifying how to present them in the
graph, e.g., as x/y positions or characteristics such as size, shape, color, etc. 

```{r}
mouse_data %>%
  ggplot()+
  aes(x = diet, y = weight_gain)
```

- add 'geoms' – graphical representations of the data in the plot (points,
  lines, bars). **`ggplot2`** offers many different geoms; we will use some
  common ones today, including:

  * `geom_point()` for scatter plots, dot plots, etc.
  * `geom_boxplot()` for, well, boxplots!
  * `geom_line()` for trend lines, time series, etc.  

```{r}
mouse_data %>%
  ggplot()+
  aes(x = diet, y = weight_gain)+
  geom_boxplot()
```

**Notes**

- Anything you put in the `ggplot()` function can be seen by any geom layers
  that you add (i.e., these are universal plot settings). This includes the x-
  and y-axis you set up in `aes()`.
- You can also specify aesthetics for a given geom independently of the
  aesthetics defined globally in the `ggplot()` function.
- The `+` sign used to add layers must be placed at the end of each line
  containing a layer. If, instead, the `+` sign is added in the line before the
  other layer, **`ggplot2`** will not add the new layer and will return an error
  message.

## Building your plots iteratively

Building plots with **`ggplot2`** is typically an iterative process. We start by
defining the dataset we'll use, lay out the axes, and choose a geom:

```{r}
mouse_data %>%
  ggplot()+
  aes(x = diet, y = weight_gain)+
  geom_boxplot()
```

Then, we start modifying this plot to extract more information from it. For
instance, we can add transparency (`alpha`) to avoid overplotting:

```{r}
mouse_data %>%
  ggplot()+
  aes(x = diet, y = weight_gain)+
  geom_boxplot()+
  geom_point(alpha = 0.7)
```

We can also add colors for all the points:

```{r}
mouse_data %>%
  ggplot()+
  aes(x = diet, y = weight_gain)+
  geom_boxplot()+
  geom_point(alpha = 0.7, colour = "blue")
```

Or to color each species in the plot differently, you could use a vector as an input to the argument **colour**. **`ggplot2`** will provide a different color corresponding to different values in the vector. Here is an example where we color with **`diet`**:


```{r}
mouse_data %>%
  ggplot()+
  aes(x = diet, y = weight_gain, colour = diet)+
  geom_boxplot()+
  geom_point(alpha = 0.7)
```

**Notes**

- Any aesthetic changes (colour, shape, size, etc) that **map** to the dataframe (e.g. colour by diet) have to go **inside** the `aes()` funciton.
- Any aesthetic changes that are **idependent** of the dataframe (e.g. alpha/transparency) go **outside** the `aes()` function

## **`ggplot2`** themes

Usually plots with white background look more readable when printed.
Every single component of a `ggplot` graph can be customized using the generic
`theme()` function, as we will see below. However, there are pre-loaded themes
available that change the overall appearance of the graph without much effort.

For example, we can change our previous graph to have a simpler white background
using the `theme_bw()` function:

```{r}
mouse_data %>%
  ggplot()+
  aes(x = diet, y = weight_gain, colour = diet)+
  geom_boxplot()+
  geom_point(alpha = 0.7)+
  theme_bw()
```

## Customization

Now, let's change names of axes to something more informative
and add a title to the figure:

```{r}
mouse_data %>%
  ggplot()+
  aes(x = diet, y = weight_gain, colour = diet)+
  geom_boxplot()+
  geom_point(alpha = 0.7)+
  theme_bw()+
  labs(title = "Weight gain by diet", 
       x = "Weight gain", 
       y = "Diet")
```

The axes have more informative names, but their readability can be improved by
increasing the font size. This can be done with the generic `theme()` function:

```{r}
mouse_data %>%
  ggplot()+
  aes(x = diet, y = weight_gain, colour = diet)+
  geom_boxplot()+
  geom_point(alpha = 0.7)+
  theme_bw()+
  labs(title = "Weight gain by diet", 
       x = "Weight gain", 
       y = "Diet")+
  theme(text = element_text(size=16))
```

If you like the changes you created better than the default theme, you can save
them as an object to be able to easily apply them to other plots you may create:

```{r}
my_theme <- theme(axis.text.x = element_text(size = 12, colour = "grey20"),
                  axis.text.y = element_text(size = 10, colour = "blue))
```

```{r}
mouse_data %>%
  ggplot()+
  aes(x = diet, y = weight_gain, colour = diet)+
  geom_boxplot()+
  geom_point(alpha = 0.7)+
  theme_bw()+
  labs(title = "Weight gain by diet", 
       x = "Weight gain", 
       y = "Diet")+
  my_theme
```

## Exporting plots

The `ggsave()` function allows you to easily change the
dimension and resolution of your plot by adjusting the appropriate arguments
(`width`, `height`, and `dpi`):

```{r}
mouse_data %>%
  ggplot()+
  aes(x = diet, y = weight_gain, colour = diet)+
  geom_boxplot()+
  geom_point(alpha = 0.7)+
  theme_bw()+
  labs(title = "Weight gain by diet", 
       x = "Weight gain", 
       y = "Diet")+
  my_theme
  
ggsave("weight_gain.jpg", width = 10, height = 8, units = "in")
```
