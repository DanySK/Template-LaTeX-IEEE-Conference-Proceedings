#!/usr/bin/env sh

# Find a .tex file containing \documentclass
TEX_FILE="$(find . -type f -name "*.tex" -exec grep -q '\\documentclass' {} \; -print -quit)"
# Rename such file with the name of the repository as read from git remote
REPO_NAME="$(git remote get-url origin | sed -n 's#.*/\([^.]*\)\.git#\1#p')"
mv "$TEX_FILE" "$REPO_NAME.tex"
# Setup the bibliography
echo "Setting up bibliography..."
curl -sL https://raw.githubusercontent.com/DanySK/Curriculum-Vitae/master/bibliography.bib -o bibliography.bib
sed -i 's/_/\\_/g' bibliography.bib
sed -i 's/\\bibliography{IEEEexample}/\\bibliography{bibliography}/g' "$REPO_NAME.tex"
sed -i '/\\begin{thebibliography}/, /\\end{thebibliography}/d' "$REPO_NAME.tex"
sed -i 's/\\cite{[^}]*}//g' "$REPO_NAME.tex"
# Setup acronym
echo "Setting up acronyms..."
cat > myacronyms.sty <<EOF
% !TEX root = $REPO_NAME.tex
\\usepackage{acronym}
\acrodef{API}{Application Programming Interface}
EOF
# Setup todonotes
echo "Setting up todonotes..."
cat > mytodonotes.sty <<EOF
% !TEX root = $REPO_NAME.tex
\\usepackage{todonotes}
\\newcommand{\\danilo}[1]{\\todo[inline,linecolor=blue,backgroundcolor=blue!25,bordercolor=blue]{\\textbf{Danilo:} #1}}
EOF
# Inject todonotes, acronym, and cleveref in the document
echo "Injecting todonotes, acronym, and cleveref in the document..."
sed -i '/\\begin{document}/i \
\\usepackage[hidelinks]{hyperref} \
\\usepackage{myacronyms} \
\\usepackage{mytodonotes} \
\\usepackage{cleveref}' "$REPO_NAME.tex"
# Ignore the produced paper
echo "$REPO_NAME.pdf" >> .gitignore
