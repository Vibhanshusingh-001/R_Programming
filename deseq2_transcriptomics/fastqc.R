getwd()
# Read the text file
data <- read.table("fastqc_data.txt", sep = "\t", header = TRUE, fill = TRUE)

data <- read.table("fastqc_data.txt", sep = "\t", header = TRUE)

# Write to a CSV file
write.csv(data, "fastqc_data.csv", row.names = FALSE)




lines <- readLines("fastqc_data.txt")

# Get the "Basic Statistics" section as a small table
start <- grep(">>Basic Statistics", lines)
end <- grep(">>END_MODULE", lines)[1]  # assumes Basic Statistics is the first module

# Skip the header line (#Measure	Value)
basic_stats_lines <- lines[(start + 2):(end - 1)]

# Split lines into key-value pairs
basic_stats <- do.call(rbind, strsplit(basic_stats_lines, "\t"))
colnames(basic_stats) <- c("Measure", "Value")

# Write to CSV
write.csv(basic_stats, "basic_statistics.csv", row.names = FALSE)




grep("^>>", lines, value = TRUE)





# Read all lines from the FastQC file
lines <- readLines("fastqc_data.txt")

# Function to extract a section by name
extract_section <- function(section_name, lines) {
  # Locate the start and end of the section
  start_line <- grep(paste0(">>", section_name), lines)
  end_line <- grep(">>END_MODULE", lines)
  end_line <- end_line[which(end_line > start_line)[1]]  # First END after start
  
  # Extract relevant lines (skip module header lines)
  section_lines <- lines[(start_line + 1):(end_line - 1)]
  
  # Remove comment lines (usually start with '#')
  section_lines <- section_lines[!grepl("^#", section_lines)]
  
  # Split lines into fields by tab
  split_data <- strsplit(section_lines, "\t")
  
  # Convert to data frame
  df <- as.data.frame(do.call(rbind, split_data), stringsAsFactors = FALSE)
  
  return(df)
}

# Example: Extract "Per base sequence quality" section
per_base_quality <- extract_section("Per base sequence quality", lines)
colnames(per_base_quality) <- c("Base", "Mean", "Median", "Lower_Quartile", "Upper_Quartile", "10th_Percentile", "90th_Percentile")

# Example: Extract "Per sequence GC content" section
gc_content <- extract_section("Per sequence GC content", lines)
colnames(gc_content) <- c("GC_Content", "Count")

# Example: Extract "Sequence Length Distribution" section
seq_len_dist <- extract_section("Sequence Length Distribution", lines)
colnames(seq_len_dist) <- c("Length", "Count")

# Write sections to CSV files
write.csv(per_base_quality, "per_base_sequence_quality.csv", row.names = FALSE)
write.csv(gc_content, "gc_content.csv", row.names = FALSE)
write.csv(seq_len_dist, "sequence_length_distribution.csv", row.names = FALSE)
