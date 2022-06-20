## Setting up a project

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
5.  (Optional) Set Preferences to 'Never' save workspace in RStudio.

A workspace is your current working environment in R which includes any
user-defined object. By default, all of these objects will be saved, and
automatically loaded, when you reopen your project. Saving a workspace to
`.RData` can be cumbersome, especially if you are working with larger datasets,
and it can lead to hard to debug errors by having objects in memory you forgot
you had. Therefore, it is often a good idea to turn this off. To do so, go to
Tools --\> 'Global Options' and select the 'Never' option for
'Save workspace to .RData' on exit.'

### Using the ProjectTemplate package

ProjectTemplate is a system for automating the thoughtless parts of a data analysis project:

- Organizing the files in your project.
- Loading all the R packages you’ll use.
- Loading all of your data sets into memory.
- Munging and preprocessing your data into a form that’s suitable for analysis.
