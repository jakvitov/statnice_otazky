import os
from pylatex import Document, Section, Subsection, Command

#Source path for latex documents
source_path = "../latex/"

#Recursive iteration trough the latex directory and compilation of all the latex documents
for root, dirs, files in os.walk(source_path):
    for file in files:
        compilation_file = os.path.join(root, file)
        print("Compiling tex file: " + compilation_file)
        #Creates path to analogical ouput pdf file
        target_dir = os.path.dirname(compilation_file).replace("latex", "pdfs")
        #If the target directory does not exist -> create it
        if os.path.exists(target_dir) == False:
            os.mkdir(target_dir)

        doc = Document()
        with open(compilation_file, 'r') as f:
            doc.append(f.read())    
        doc.generate_pdf(os.path.join(target_dir, file).removesuffix(".tex"), clean_tex=False)