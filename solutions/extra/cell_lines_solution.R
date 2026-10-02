# Data: Ujiie et al. (2025) Cancer Medicine, doi:10.1002/cam4.71373,
#       Supplementary Table S3
# License: CC BY 4.0 (https://creativecommons.org/licenses/by/4.0/)

library(readxl)

# 1. Read the table, skipping the title row
cell_lines <- read_excel("Ujiie2025_Supplementary Table S3.xlsx",
                         sheet = "Table S3", skip = 1)

# 2. Clean the column names (replaces clean_names())
names(cell_lines) <- gsub("([a-z0-9])([A-Z])", "\\1_\\2", names(cell_lines))  # camelCase -> camel_Case
names(cell_lines) <- tolower(names(cell_lines))                               # all lowercase
names(cell_lines) <- gsub("[^a-z0-9]+", "_", names(cell_lines))               # spaces, %, () ... -> "_"
names(cell_lines) <- gsub("^_|_$", "", names(cell_lines))                     # remove "_" at start/end
names(cell_lines)   # check the new names

# 3. Remove the "index" column (a 0-based Python row number, not useful)
cell_lines$index <- NULL

# 4. Turn "status" into a factor with a fixed order
cell_lines$status <- factor(cell_lines$status, levels = c("Included", "Excluded"))

# 5. Count the NAs in each column
colSums(is.na(cell_lines))

# NAs in prism_ic50 are structural : some of the "Excluded" miss PRISM values. 
# But why not all? What was the reason to be ecluded?
# Sometimes we cannot rely on is.na, we need to know the other metadata