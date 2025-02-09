#!/bin/bash
site=../site
content=content
headerA=../../inc/header-top.htm
headerB=../../inc/header-bottom.htm
sitenav=../../inc/nav.htm
meta=meta.htm
contentFile=content.htm
foot=../../inc/footer.htm
bottom=../../inc/html-bottom.htm
tally=0


rm -rf $site
mkdir -p $site

# List the index
#function setupindex {
#	echo "<h1>Full site index</h1>" > index/content.htm;
#	for f in *; do
#		if [ $f != 'index' ]; then
#			echo "<a href='${f}.html'>{${f}}</a><br>" >> index/content.htm;
#		fi
#	done
#	echo "Index built"
#}

#function sitenav {
#	echo "<nav class='sitenav'>" > ../inc/nav.htm;
#	for f in *; do
#		if [ $f != 'index' ]; then
#			echo "<a href='${f}.html'>{${f}}</a>" >>../inc/nav.htm;
#		fi
#	done
#	echo "</nav>" >> ../inc/nav.htm;
#	echo "nav"
#}

cd $content
#sitenav;
#setupindex;
for f in *; do
	cd $f;
	markup=''
	topPart=$(cat $headerA $meta $headerB);
	nav=$(cat $sitenav);
	contentText=$(cat $contentFile);
	closefile=$(cat $bottom);
	mainContent="<main>${contentText}</main>";
	sideBar="<aside>${markup}</aside>";

	if [ "$f" = "index" ]; then
		echo ${topPart}${nav}"${mainContent}"${sideBar}${closefile} > ../../$site/${f}.html
	else
		footer=$(cat $foot);
		echo ${topPart}${nav}"${mainContent}"${sideBar}${footer}${closefile} > ../../$site/${f}.html
	fi

	cd ..
	tally=$((tally+1))
done
echo "${tally} topics built"




