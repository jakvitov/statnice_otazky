#!/bin/bash

#Source directory name
NAME=latex/

sudo apt-get install texlive-latex-base

#Recursive iteration trough directory files 
find "$NAME" -type f | while read -r file; do
    echo "Compiling ${file}"
    #Get the target directory 
    file_dir=$(dirname "$file")
    OUTPUT_PATH="${file_dir/latex/pdfs}"
    mkdir $OUTPUT_PATH
    #echo $file_dir
    
    pdflatex -output-directory=$OUTPUT_PATH -file-line-error -halt-on-error $file 

    echo "Cleaning compilation auxiliarities and logs."
    rm $OUTPUT_PATH/*\.aux
    rm $OUTPUT_PATH/*\.log

done



