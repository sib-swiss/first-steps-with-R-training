# Data: Bosnjakovic et al. (2025) bioRxiv, doi:10.1101/2025.07.10.663939
# License: CC BY 4.0 (https://creativecommons.org/licenses/by/4.0/)
# Modified for teaching: Bosnjakovic2025_metabolites_pos.txt

# Reading and formatting a metabolomics table from Excel

#### with read.delim() or read.table() you need a txt file format

file <- "Bosnjakovic2025_metabolites_pos.txt"

# Read only the 3 header rows
#   nrows = 3       -> read at most 3 rows, then stop
#   header = FALSE  -> do NOT use the first row as column names
#   colClasses = "character" -> read everything as text
meta <- read.delim(file, header = FALSE, nrows = 3,
                   colClasses = "character", fileEncoding = "UTF-8")

# Read the data
#   skip = 3        -> ignore the first 3 rows, read everything after them
abund <- read.delim(file, header = FALSE, skip = 3, fileEncoding = "UTF-8")

meta   # look at the header rows
str(abund)   # check the data: abundances should be numbers (num / int)

##### Better option?

# install.packages("readxl")

# Load the package that reads Excel files (.xlsx)
library(readxl)

# Save the file name in a variable, so we only type it once
file <- "Bosnjakovic2025_metabolites_dataset.xlsx"


# 1. Read the header and the data separately

# The sheet "metabolites_pos" has 3 header rows instead of 1.
# R expects only 1 header row, so we read the two parts separately.

# Read only the 3 header rows
#   n_max = 3          -> read at most 3 rows, then stop
#   col_names = FALSE  -> do NOT use the first row as column names
meta <- read_excel(file, sheet = "metabolites_pos",
                   n_max = 3, col_names = FALSE)

# Read the data (everything below the header)
#   skip = 3           -> ignore the first 3 rows, read everything after them
abund <- read_excel(file, sheet = "metabolites_pos",
                    skip = 3, col_names = FALSE)

meta   # look at the header rows: empty Excel cells appear as NA


# 2. Build one column name from the 3 header rows

# Take each header row and turn it into a simple text vector
#   meta[1, ]     -> row 1 of the table
#   unlist()      -> turn the row into a vector
#   as.character()-> make sure all values are text
row1 <- as.character(unlist(meta[1, ]))   # treatment   (e.g. "VC, BaP")
row2 <- as.character(unlist(meta[2, ]))   # condition   (e.g. "0.2% DMSO")
row3 <- as.character(unlist(meta[3, ]))   # label/time  (e.g. "Precursor Name", "24h")

# Replace NA (empty cells) with empty text "", so they don't appear in the names
row1[is.na(row1)] <- ""
row2[is.na(row2)] <- ""
row3[is.na(row3)] <- ""

# Paste the 3 rows together, column by column, separated by "_"
# e.g. "VC, BaP" + "0.2% DMSO" + "24h"  ->  "VC, BaP_0.2% DMSO_24h"
#      ""        + ""          + "Precursor Name" -> "__Precursor Name"
col_names <- paste(row1, row2, row3, sep = "_")
col_names   # look at the result

# Remove the extra "_" left at the start or end when a header cell was empty
#   "^_+" -> one or more "_" at the START of the text
#   "_+$" -> one or more "_" at the END of the text
#   "|"   -> means "or"
# e.g. "__Precursor Name"  ->  "Precursor Name"
col_names <- gsub("^_+|_+$", "", col_names)

# Some columns have exactly the same name (replicates).
# make.unique() adds .1, .2, ... to the duplicates
# e.g. "VC, BaP_0.2% DMSO_24h", "VC, BaP_0.2% DMSO_24h.1"
col_names <- make.unique(col_names)

# Use these names as the column names of the data table
colnames(abund) <- col_names
abund   # check the result


# 3. Read and clean the MOI identification sheet
# This sheet has a normal header (1 row), so read_excel works directly
moi <- read_excel(file, sheet = "MOI_identification")

# Problem: some cells contain non-breaking spaces ("\u00a0").
# They look like normal spaces but R treats them as different characters,
# so comparisons, filters and joins can fail without any warning.

# Find which columns contain text (TRUE) and which don't (FALSE)
text_cols <- sapply(moi, is.character)

# Apply the same cleaning to every text column
#   lapply() -> repeat the function on each selected column
moi[text_cols] <- lapply(moi[text_cols], function(x) {
  x <- gsub("\u00a0", " ", x)   # replace non-breaking spaces with normal spaces
  x <- gsub("\\s+", " ", x)     # replace any group of spaces/tabs/line breaks by one space
  trimws(x)                     # remove spaces at the start and end of the text
})

moi   # check the result


