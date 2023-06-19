# Searching for pathological phylogenetic analyses

*Monday 3 July, 2023*


The theme is to identify the conditions that make a Bayesian phylogenetic analysis converge  to equilibrium poorly during MCMC. This may arise from conflicting signals in the data, an over-specified or under-specified model, or it could simply be due to the existing MCMC proposal kernels being ill-equipped to traverse the posterior space efficiently. 


The two challenges in this competition share the same objective: find the conditions which give the **smallest** effective sample size (ESS) per million states. The ESS of the posterior density will be printed in the output and can also be measured in Tracer. 

## Challenge 1: Dataset

**Objective:** Create a nucleotide multiple sequence alignment, with 100 sites and 20 taxa, which gives the smallest ESS when run on `C1.xml` in BEAST 2. 
This model consists of the Jukes-Cantor substitution model, a strict clock, and a Yule tree prior. 
Do not edit the XML file.
A benchmark dataset has been provided `benchmark.fasta` which can be used as a starting point to create a new alignment.

Strategies that may give a pathological dataset:

1. Non-tree-like?
2. Variable mutation rates?
3. Variable speciation rates?
4. Gaps?
5. Anything else?


## Challenge 2: Model

**Objective:** Create a BEAST 2 XML file using any of the models available in any released BEAST 2 package available in beauti, such that the ESS is as small as possible when run on `benchmark.fasta`.  You must use this dataset (`benchmark.fasta`) and only this dataset. You cannot upload the dataset many times and use it in different partitions.  You also cannot change any of the operators or operator weights, and you cannot edit the XML file by hand. Set the chain length to 10 million states. Please ensure that the MCMC finishes in under 2 hours.

Let's see which model is the slowest!


## Procedure

1. Clone the repository
    ```
   git clone https://github.com/jordandouglas/LowESS
    ```

2. Create a folder with your name and use that as your working directory. Make a README file
   ```
   cd LowESS
   mkdir MY_NAME
   cd MY_NAME
   touch README.md
   ```

3. For challenge 1, the XML file is already provided. All you need is to make a fasta file, called `C1.fasta`. To test your fasta file, first run the Rscript to put the fasta contents into a json file, and then run BEAST 2 using the json file: 
   ```
   Rscript ../fasta2json.R
   ~/beast/bin/beast -overwrite -df C1.json ../C1.xml
   ```


4. Also generate a figure of the multiple sequence alignment `C1.png`. This can be done using many software applications, including the programs below
 
   https://www.ncbi.nlm.nih.gov/projects/msaviewer/

    https://www.ebi.ac.uk/Tools/msa/mview/
   
   

5. For challenge 2, you must create your own XML file. Use the dataset `C2.fasta` in the root directory. The XML file should be called `C2.xml`.
   Please also specify any BEAST 2 packages being used in `README.md`
   
6. To submit the final results, please upload three files: `MY_NAME/C1.fasta`,  `MY_NAME/C1.png`, and `MY_NAME/C2.xml`:
   ```
   git add C1.fasta
   git add C1.png
   git add C2.xml
   git add README.md
   git commit -m "competition submission"
   git push
   ```

7. After the competition ends, 10 replicates of each challenge will be run per person, and the results will be announced afterwards. The mean ESS/state of the posterior density, after a 50% burn-in, will be used. 


   
