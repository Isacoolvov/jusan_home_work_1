#!/bin/bash
tar -cvf archive.tar words.txt z5_text_file.txt
mkdir MyNewTarDirectory
tar --directory=MyNewTarDirectory/ -xvf archive.tar
