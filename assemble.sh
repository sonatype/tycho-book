#!/bin/bash

mkdir -p target/site/reference
mkdir -p target/site/pdf
cp -r target/book-tycho.chunked/* target/site/reference
cp target/book-tycho.pdf target/site/pdf/tychobook-pdf.pdf
python template.py
rsync -e ssh -av target/site/* deployer@www.sonatype.com:/var/www/domains/sonatype.com/www/shared/books/tycho-book/
