#!/usr/bin/env bash
# This script takes searches a directory for .jar files, for each .jar file found create a new directory and extract it's contents to it

# Modify this to point to directory with jars
PROJECT_TARGET_DIR='/Users/w1702/Projects/quicksilver/target'
EXTRACTED_DIR_PREFIX='EX-'

echo "Project target directory set to: '${PROJECT_TARGET_DIR}'"
cd ${PROJECT_TARGET_DIR}

for i in *.jar; do
    extractedDir=${EXTRACTED_DIR_PREFIX}${i}

    echo " - Creating directory: '${extractedDir}'..."
    mkdir ${extractedDir}
    cd ${extractedDir}

    echo " - Extracting .jar files from ${i} into directory: '${extractedDir}'..."
    jar xf ../${i}

    cd ..

done

open .