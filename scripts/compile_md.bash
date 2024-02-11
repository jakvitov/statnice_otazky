current_date=$(date -u '+%Y-%m-%dT%H:%M:%SZ')
echo "Started markdown compile at ${current_date}"

sudo apt-get install pandoc

NAME=markdown/

mkdir pdfs
rm pdfs/err.log

#Recursive iteration trough directory files 
find "$NAME" -type f | while read -r file; do
    echo "Compiling markdown ${file}"
    #Get the target directory 
    file_dir=$(dirname "$file")
    OUTPUT_PATH="${file_dir/markdown/pdfs}"
    mkdir $OUTPUT_PATH
    
    res_file=${file/markdown/pdfs}
    res_file=${res_file/md/pdf}
    #Remove non printable characters
    echo "Creating res file ${res_file}"

    err=$(pandoc -f markdown+smart -t latex -o ${res_file} ${file} 2>&1 >./temp)
    rm ./temp
    if [ $? -eq 0 ]; then
        echo "Compilation of ${file} OK."
    else 
        echo "Error in compilation of ${file}. Exit code $?:"
        echo \n >> pdfs/err.log
        echo "Error in compilation of ${file}:" >> pdfs/err.log
        echo $err >> pdfs/err.log
    fi

done


