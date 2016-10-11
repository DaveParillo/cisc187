#!/bin/sh

tar cyf solutions.zip --exclude .DS_Store ./solutions
gpg --output solutions.gpg --encrypt --armor --recipient dave.parillo@gmail.com solutions.zip
rm solutions.zip

tar cyf quiz.zip --exclude .DS_Store ./quiz
gpg --output quiz.gpg --encrypt --armor --recipient dave.parillo@gmail.com quiz.zip
rm quiz.zip

