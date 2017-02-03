#!/bin/sh

tar cjf solutions.zip --exclude .DS_Store ./solutions
gpg --output solutions.gpg --encrypt --armor --recipient dparillo@sdccd.edu solutions.zip
rm solutions.zip

tar cjf quiz.zip --exclude .DS_Store ./quiz
gpg --output quiz.gpg --encrypt --armor --recipient dparillo@sdccd.edu quiz.zip
rm quiz.zip

