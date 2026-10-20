# Overleaf runs latexmk -cd on a main document in a subfolder and runs BibTeX from the project root;
# let BibTeX find each paper's .bib and .bst files in its own folder (the trailing colon keeps the defaults).
$ENV{'BIBINPUTS'} = './cvpr:./radiology:' . ($ENV{'BIBINPUTS'} // '');
$ENV{'BSTINPUTS'} = './cvpr:./radiology:' . ($ENV{'BSTINPUTS'} // '');
