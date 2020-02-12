#!/usr/bin/env bash
# This script takes a path to a directory as an arg {1}
# Then searches that directory for .jar files
# For each .jar file found, create a new directory and extract it's contents to it

PROJECT_TARGET_DIR=${1}
EXTRACTED_DIR_PREFIX='EXTRACTED-'

if [[ -d ${PROJECT_TARGET_DIR} ]]
then

    cd ${PROJECT_TARGET_DIR}
    echo " - Scanning directory: '${PROJECT_TARGET_DIR}' for .jar files..."

    for i in *.jar; do
        extractedDir=${EXTRACTED_DIR_PREFIX}${i}

        mkdir ${extractedDir}
        cd ${extractedDir}

        echo " -- Extracting .jar files from ${i} into new directory: '${extractedDir}'..."
        jar xf ../${i}

        cd ..

    done

    open .
else
    echo " - Directory: '${PROJECT_TARGET_DIR}' does not exist"
fi
