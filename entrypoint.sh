#!/bin/sh

if [ ! -f "${INPUT_MD_SRC}" ]
then
    echo ${INPUT_MD_SRC} not found!
    exit 1
elif [ -f "${INPUT_MD_SRC}" ]
then
    cp "${INPUT_MD_SRC}" /tmp/temp.md
else
    echo "Something unknown happened"
    exit 1
fi

if [ -f "${INPUT_PDF_DST}" ]
then
    rm -f ${INPUT_PDF_DST}
fi

if [ ! -z "${INPUT_LINE_BREAK}" ]
then
    sed -i "${INPUT_LINE_BREAK}i\\\\\newpage" /tmp/temp.md
fi

pandoc ${INPUT_OPTS} -f markdown /tmp/temp.md -o ${INPUT_PDF_DST}
exit $?
