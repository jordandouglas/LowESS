if (!require(rjson , quietly = T)) install.packages("rjson")
library(rjson)
if (!require(seqinr , quietly = T)) install.packages("seqinr")
library(seqinr)




# Load in C1.fasta
if (!file.exists("C1.fasta")){
	stop(paste("Cannot find C1.fasta\n"))
}
fasta = read.fasta("C1.fasta")


# Check rows and columns
if (length(fasta) != 20){
	stop(paste("Please ensure there are 20 taxa in C1.fasta!\n"))
}
if (length(fasta[[1]]) != 100){
	stop(paste("Please ensure there are 100 sites in C1.fasta!\n"))
}






# Create json
JSON = list()






# Prepare sequences in xml
seqs = toupper(sapply(fasta, function(ele) paste(ele, collapse="")))
xml = paste0('\t\t<sequence spec="Sequence" totalcount="4" taxon="', names(fasta), '" value="',  seqs, '"/>', collapse="\n")


JSON[["data"]] = xml
	

# Write JSON
JSON_str = as.character(rjson::toJSON(JSON, indent=1))
write(JSON_str, "C1.json")
cat("Saved to C1.json\n")
