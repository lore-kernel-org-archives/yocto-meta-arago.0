Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51E4DC87FF2
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 20:05:17 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.8432.1686168314883161808
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 07 Jun 2023 13:05:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=qfP5HdAD;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 357K5BPh002214;
	Wed, 7 Jun 2023 15:05:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686168311;
	bh=Usdb5ij611CHGdBUuVcRARLMsuqWtAmYHy1M7SnH0wE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=qfP5HdADKpXaCsuRawrDw7PRXuLUfgBlzMiMRHblTWH1mpAr7lbnlPXELri7abwKN
	 itCKpIkehqCogcpwuLVjpj/D9XpQ6lGYAZFYa0G0Z0qOTjisXjbl7SI82bz05k/FMs
	 45ImZr+wHFW2iZNsbyTtmi/n1qo00ENT3azwVpwo=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 357K5AbI030610
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 Jun 2023 15:05:10 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 Jun 2023 15:05:10 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 Jun 2023 15:05:10 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 357K5AKv125548;
	Wed, 7 Jun 2023 15:05:10 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>, <afd@ti.com>, <nm@ti.com>
CC: <meta-arago@lists.yoctoproject.org>,
        StaticRocket
	<35777938+StaticRocket@users.noreply.github.com>
Subject: [oe-layersetup][PATCH 01/15] oe-layertool-setup: prefer use of $() notation
Date: Wed, 7 Jun 2023 15:04:50 -0500
Message-ID: <20230607200504.3810426-2-rs@ti.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230607200504.3810426-1-rs@ti.com>
References: <20230607200504.3810426-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 07 Jun 2023 20:05:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14534

From: StaticRocket <35777938+StaticRocket@users.noreply.github.com>

Shellcheck:
Use $(...) notation instead of legacy backticked `...`.

Signed-off-by: StaticRocket <35777938+StaticRocket@users.noreply.github.com>
---
 oe-layertool-setup.sh | 80 +++++++++++++++++++++----------------------
 1 file changed, 40 insertions(+), 40 deletions(-)

diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
index ef25ca0..cd4e242 100755
--- a/oe-layertool-setup.sh
+++ b/oe-layertool-setup.sh
@@ -45,8 +45,8 @@ interactive="n" # flag for interactive mode.  Default is n
 resethead="n" # flag for reset head mode.  Default is n
 layers="" # variable holding the layers to add to bblayers.conf
 output="" # variable holding the output to write to outputfile
-scriptdir=`pwd` # directory of this calling script
-oebase=`pwd` # variable to hold base directory
+scriptdir=$(pwd) # directory of this calling script
+oebase=$(pwd) # variable to hold base directory
 sourcedir="" # directory where repos will be cloned
 builddir="" # directory for builds
 confdir="" # directory for build configuration files
@@ -154,27 +154,27 @@ check_input() {
 
 # Input is a line of the form OECORE.*=value
 parse_oecore_line() {
-    var=`echo $1 | cut -d= -f1`
-    val=`echo $1 | cut -d= -f2`
+    var=$(echo $1 | cut -d= -f1)
+    val=$(echo $1 | cut -d= -f2)
     eval $var=$val
 }
 
 # Input is a line of the form BITBAKE.*=value
 parse_bitbake_line() {
-    var=`echo $1 | cut -d= -f1`
-    val=`echo $1 | cut -d= -f2`
+    var=$(echo $1 | cut -d= -f1)
+    val=$(echo $1 | cut -d= -f2)
     eval $var=$val
 }
 
 # Input is a line of the form LOCALCONF:.*=value
 parse_localconf_line() {
-    localconf=`echo "$1" | cut -d: -f2-100`
+    localconf=$(echo "$1" | cut -d: -f2-100)
     echo "$localconf" >> $oebase/tmp_append_local.conf
 }
 
 # Input is a line of the form MOTD:<msg>
 parse_motd_line() {
-    motd=`echo "$1" | cut -d: -f2-100`
+    motd=$(echo "$1" | cut -d: -f2-100)
     echo "$motd" >> $oebase/tmp_motd
     echo "$motd"
 }
@@ -197,11 +197,11 @@ parse_repo_line() {
 
     # split the line on the comma separators
     # use the prefix if it was set.
-    eval $prefix"name"=`echo $1 | cut -d, -f1`
-    eval $prefix"uri"=`echo $1 | cut -d, -f2`
-    eval $prefix"branch"=`echo $1 | cut -d, -f3`
-    eval $prefix"commit"=`echo $1 | cut -d, -f4`
-    parsed_layers=`echo $1 | cut -d, -f5-`
+    eval $prefix"name"=$(echo $1 | cut -d, -f1)
+    eval $prefix"uri"=$(echo $1 | cut -d, -f2)
+    eval $prefix"branch"=$(echo $1 | cut -d, -f3)
+    eval $prefix"commit"=$(echo $1 | cut -d, -f4)
+    parsed_layers=$(echo $1 | cut -d, -f5-)
 
     # If no layers= was used, then don't add any layers
     temp_layers="none"
@@ -210,9 +210,9 @@ parse_repo_line() {
     if [ "x$parsed_layers" != "x" ]
     then
         temp_layers=""
-        temp=`echo $parsed_layers | cut -d= -f2`
+        temp=$(echo $parsed_layers | cut -d= -f2)
         # temporarily reset the IFS value to : to split the layers
-        for x in `IFS=":";echo $temp`
+        for x in $(IFS=":";echo $temp)
         do
             # Add the $name value to each layer so that we have consistency
             # with how the layers are represented between the saved value
@@ -319,7 +319,7 @@ parse_input_file() {
         # Create the repository line corresponding to the selections given.
         # In the case that no layers= option was passed then this will
         # create the layers= option corresponding to all layers being selected.
-        repo_line=`build_repo_line`
+        repo_line=$(build_repo_line)
 
         # Save the line in the output variable for if we create an output file
         output="$output""$repo_line\n"
@@ -338,7 +338,7 @@ configure_repo() {
 
     # Check if the repo with $name was already seen.  Use the , at the end
     # of the grep to avoid matching similar named repos.
-    temp=`printf '%s\n' $output | grep -e "^$name,"`
+    temp=$(printf '%s\n' $output | grep -e "^$name,")
 
     if [ "x$temp" != "x" ]
     then
@@ -417,12 +417,12 @@ get_repo_branch() {
 
         # Get a unique list of branches for the user to chose from
         # Also delete the origin/HEAD line that the -r option returns
-        t_branches=`git branch -r | sed '/origin\/HEAD/d'`
+        t_branches=$(git branch -r | sed '/origin\/HEAD/d')
         for b in $t_branches
         do
-            branches="$branches"`echo $b | sed 's:.*origin/::g'`"\n"
+            branches="$branches"$(echo $b | sed 's:.*origin/::g')"\n"
         done
-        branches=`printf "$branches\n" | sort | uniq`
+        branches=$(printf "$branches\n" | sort | uniq)
 
 cat << EOM
 
@@ -500,7 +500,7 @@ cat << EOM
 The $name repository has the following tags available:
 
 EOM
-    tags=`git tag`
+    tags=$(git tag)
     if [ "x$tags" = "x" ]
     then
         printf "\tNo tags found\n"
@@ -566,7 +566,7 @@ select_layers() {
 
     cd $sourcedir
     # Get a count of how many layers there are
-    count=`find $name -name "layer.conf" | grep -c layer.conf`
+    count=$(find $name -name "layer.conf" | grep -c layer.conf)
 
     case $count in
         0 )
@@ -581,7 +581,7 @@ select_layers() {
             ;;
     esac
 
-    t_layers=`find $name -name "layer.conf" | sed 's:\/conf\/layer.conf::'`
+    t_layers=$(find $name -name "layer.conf" | sed 's:\/conf\/layer.conf::')
 
     if [ "x$arg1" != "xall" ]
     then
@@ -597,7 +597,7 @@ EOM
 
     for l in $t_layers
     do
-        printf "\t"`echo $l | sed "s:${name}\/::"`"\n"
+        printf "\t"$(echo $l | sed "s:${name}\/::")"\n"
     done
 
 cat << EOM
@@ -656,7 +656,7 @@ get_oecorelayerconf() {
     fi
 
     cd $sourcedir
-    confs=`find . -name "bblayers.conf.sample"`
+    confs=$(find . -name "bblayers.conf.sample")
 
     done="n"
 
@@ -711,7 +711,7 @@ get_oecorelocalconf() {
     fi
 
     cd $sourcedir
-    confs=`find . -name "local.conf.sample"`
+    confs=$(find . -name "local.conf.sample")
 
     done="n"
 
@@ -813,7 +813,7 @@ EOM
     # Find if old DL_DIR was set
     if [ -e $confdir/local.conf.bak ]
     then
-        old_dldir=`cat $confdir/local.conf.bak | grep -e "^DL_DIR =" | sed 's|DL_DIR = ||' | sed 's/"//g'`
+        old_dldir=$(cat $confdir/local.conf.bak | grep -e "^DL_DIR =" | sed 's|DL_DIR = ||' | sed 's/"//g')
     else
         old_dldir="$oebase/downloads"
     fi
@@ -854,7 +854,7 @@ print_motd() {
 
 print_image_names() {
     SOURCES="${1}"
-    FOLDERS=`find "${SOURCES}" -type d -a -iname images|grep recipes-core|sed -e "s/.*sources\///g"|cut -d '/' -f1|sort -u -r`
+    FOLDERS=$(find "${SOURCES}" -type d -a -iname images|grep recipes-core|sed -e "s/.*sources\///g"|cut -d '/' -f1|sort -u -r)
     IMAGES=""
     for FOLDER in ${FOLDERS}
     do
@@ -863,15 +863,15 @@ print_image_names() {
             RECO="[recommended]"
         fi
         echo "From ${FOLDER}${RECO}:"
-        F_IMAGE_FOLDERS=`find "${SOURCES}/${FOLDER}" -type d -a -iname images|grep recipes-core`
+        F_IMAGE_FOLDERS=$(find "${SOURCES}/${FOLDER}" -type d -a -iname images|grep recipes-core)
         for IMG_FOLDER in ${F_IMAGE_FOLDERS}
         do
-            F_IMAGES=`find "${IMG_FOLDER}" -iname *.bb`
+            F_IMAGES=$(find "${IMG_FOLDER}" -iname *.bb)
             if [ -n "${F_IMAGES}" ]; then
                 for img in ${F_IMAGES}
                 do
-                    name=`basename "${img}"|sed 's/\.bb$//g'`
-                    summary=`grep SUMMARY "${img}"|cut -d '=' -f2| sed 's/["/]//g'|xargs  echo`
+                    name=$(basename "${img}"|sed 's/\.bb$//g')
+                    summary=$(grep SUMMARY "${img}"|cut -d '=' -f2| sed 's/["/]//g'|xargs  echo)
                     if [ -z "${summary}" ]; then
                         summary="No Summary available"
                     fi
@@ -911,7 +911,7 @@ cat > $confdir/setenv << EOM
 export OEBASE=${oebase}
 
 # try to find out bitbake directory
-BITBAKEDIR=\`find \${OEBASE}/sources -name "*bitbake*"\`
+BITBAKEDIR=\$(find \${OEBASE}/sources -name "*bitbake*")
 for f in \${BITBAKEDIR}
 do
     if [ -d \${f}/bin ]
@@ -922,7 +922,7 @@ done
 
 # check for any scripts directories in the top-level of the repos and add those
 # to the PATH
-SCRIPTS=\`find \${OEBASE}/sources -maxdepth 2 -name "scripts" -type d\`
+SCRIPTS=\$(find \${OEBASE}/sources -maxdepth 2 -name "scripts" -type d)
 for s in \${SCRIPTS}
 do
     PATH="\${s}:\$PATH"
@@ -945,13 +945,13 @@ EOM
 build_repo_line() {
     # clean up the layers to remove the repository name and add : divider
     temp_layers=""
-    for l in `echo $repo_layers | sed "s:${name}::" | sed -e 's:^\/::'`
+    for l in $(echo $repo_layers | sed "s:${name}::" | sed -e 's:^\/::')
     do
-        temp_layers="$temp_layers""`echo $l | sed "s:${name}\/::"`:"
+        temp_layers="$temp_layers""$(echo $l | sed "s:${name}\/::"):"
     done
 
     # Lastly clean off any trailing :
-    temp_layers=`echo $temp_layers | sed 's/:$//'`
+    temp_layers=$(echo $temp_layers | sed 's/:$//')
 
     echo "$name,$uri,$branch,$commit,layers=$temp_layers"
 }
@@ -980,7 +980,7 @@ mkdir -p $oebase
 # retrive the absolute path to the oebase directory incase
 # a relative path is passed in
 cd $oebase
-oebase=`pwd`
+oebase=$(pwd)
 cd -
 
 # Populate the following variables depending on the value of oebase
@@ -1019,7 +1019,7 @@ then
         # Create the repository line corresponding to the selections given.
         # In the case that no layers= option was passed then this will
         # create the layers= option corresponding to all layers being selected.
-        repo_line=`build_repo_line`
+        repo_line=$(build_repo_line)
 
         # Save the line in the output variable for if we create an output file
         output="$output""$repo_line\n"
@@ -1043,7 +1043,7 @@ if [ "x$outputfile" != "x" ]
 then
     # make sure that the directory for the output file exists
     cd $oebase
-    dir=`dirname $outputfile`
+    dir=$(dirname $outputfile)
     if [ ! -d $dir ]
     then
         mkdir -p $dir
-- 
2.40.1


