#!/bin/bash 

# Defining global variables 
DATA="prueba" 
BINARIZE="/home/grimmsink/freesurfer/bin/mri_binarize" 

# Selecting the hippocampal sections 
for folder in "$DATA"/subject*; do
 	subject=$(basename $folder)
 	echo "Processing $subject"

 	 # Selecting the auto_noCCseg.mgz file
 	aseg_file=$(find "$folder" -type f -name "aseg.auto_noCCseg.mgz" | head -n 1) 
	if [[ -z "$aseg_file" ]]; then 
echo "aseg.auto_noCCseg.mgz not found for $subject." 
continue
fi 

# Creating a new folder to store the hippocampal sections
mkdir -p "$folder/hippocampal_sections" 

# Extracting each side 
$BINARIZE --i "$aseg_file" --o $folder/hippocampal_sections/left_hippocampus.mgz" --match 17 
$BINARIZE --i "$aseg_file" --o $folder/hippocampal_sections/right_hippocampus.mgz"  --match 53 	 
echo "$subject COMPLETED!" 

done
