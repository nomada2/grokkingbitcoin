#!/bin/bash

# Download and unzip AAPdfMaker into $AAMAKEPDFDIR
#
# git clone git@github.com:habuma/asciidoc-manning-templates.git
# into ${scriptdir}/buildbook

scriptdir=`dirname $0`
sourcedir=${scriptdir}
outputdir=${sourcedir}/build
buildtooldir=${scriptdir}/buildbook
AAMAKEPDFDIR=${buildtooldir}/AAMakePDF
MAKEPDF=${buildtooldir}/makepdf.sh
TEMPLATEDIR=${buildtooldir}/asciidoc-manning-templates

mkdir -p ${outputdir}
ln -sr ${sourcedir}/images ${outputdir}
ln -sr ${sourcedir}/style ${outputdir}

## AAMakePDF must be run from the AAMakePDF dir
#ln -sr ${MAKEPDF} ${AAMAKEPDFDIR}
#cp ${buildtooldir}/document.docbook45.erb ${TEMPLATEDIR}
for file in ${sourcedir}/grokking-bitcoin.adoc; do
        basename=`echo $file | sed 's/.*\/\([^\/]*\)\.adoc/\1/'`
	# This will generate a docbook xml file from the input
#	cat $file | asciidoctor -T ${TEMPLATEDIR} -b docbook45 - > ${outputdir}/${basename}.xml
#	cat $file | asciidoctor -b docbook5 - > ${outputdir}/${basename}.xml
	cat $file | asciidoctor -b html5 - > ${outputdir}/${basename}.html
	cat $file | asciidoctor -r asciidoctor-pdf -b pdf - > ${outputdir}/${basename}.pdf

	# This will create a .temp.xml file from the input .xml and
	# generate a pdf from that temp file.
#	${AAMAKEPDFDIR}/makepdf.sh ${outputdir}/$basename.xml ${outputdir}/$basename.pdf
done
#rm ${scriptdir}/'c:\sw\text.txt'