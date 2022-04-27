### Motivation for the Package 
Right now I am working on a research project determining common epitopes ("chunks" of an amino acid sequence that bind to an antigen) between different online epitope prediction tools. There are a various number of tools that predict B, T, MHCI and MHCII epitopes, which is fantastic! Ideally, the best epitope binds to all of these, which is why my package looks towards all the txt files located in a directory and recognizes the common sequences in all the txt files. There is no limit for the amount of txt files located in the directory.\

I find this extremely helpful and useful in my current research. I hope someone else can find this package useful as well. \

Please keep in mind that even though the main idea of the package is for epitope prediction, it can be used to determine any type of common strings in txt files. 

### Functions 
The package consists of a total of 3 functions and it includes several for loops. Even though the user only interacts with one function and the moment, all the function will be further explained in the "vignettes" directory 
 


### Epitope Analysis
Determines common strings (epitopes) found in different txt files which have been determined through online epitope prediction tools 

### Downloading the package 
There are many ways to download and use a package or repository from GitHub, but this is the one that I like to use: 

* Install devtools in R Studio 
* Enter the following commands in the console: 
  + Install_github("IreneArias/EpitopeAnalysis")
  + library(epitopeAnalysis)
  
##### BEFORE USING THE PACKAGE MAKE SURE YOU DO THE FOLLOWING: 
* Set your working directory to the data folder. You can do this by going into the top toolbar in R:
   + Session --> Set Working Directory --> Choose Directory 
* Choose the data directory which you downloaded from this repository. 
* Make sure all the data sets or files you want to analyze are in .txt format 



