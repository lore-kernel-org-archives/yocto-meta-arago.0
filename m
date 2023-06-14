Return-Path: <res.sapp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39498C001DE
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 03:45:22 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web10.3702.1686714314408225678
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Jun 2023 20:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=hKL5EYG4;
 spf=pass (domain: gmail.com, ip: 209.85.210.47, mailfrom: res.sapp@gmail.com)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6b2d9ea4901so3281126a34.1
        for <meta-arago@lists.yoctoproject.org>; Tue, 13 Jun 2023 20:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686714313; x=1689306313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hK0eIjYl0PsgEfvNEqt/SDejCbk/rpBf/0VtsOGEYBw=;
        b=hKL5EYG4heT8mhrRdONzIaVgk+YKmmppGS8T9wEMCZf4ApXtwjBmyWlfxvTGkjCMeR
         zQ/5BoQGxk8Kd3/Nf6FINSQffj1w22HjAMLFVPTOckL1+j+P8/JgArZFfEDpI/DokgRN
         AcI+ZLfce00lBSXnPo15ClNBo/6KfisEDjOTQMjsDybcZAphTVbkDNboK3sJxYLEc+GL
         DTtiZYQZQ4XSRi1jr//3ty7J/4g01dST1qvfRwh8rHiwyci2GZ0ZK4I58E0oJ+oWObxI
         0izHdjUA4sfISJYQoi4QOi/RdbL24dCyoWYPMA++E1kztLI0GMxG/ZdyfgdvIRXTc8cl
         rXow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686714313; x=1689306313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hK0eIjYl0PsgEfvNEqt/SDejCbk/rpBf/0VtsOGEYBw=;
        b=S0zjq8IzIsw9cQVP28RDfpB6RrdAkGgm8Fl4v2v84pb8jFL0ahVMXc7Qf/fbNJ3P75
         gcKSZO4guibrEwAc8smcAC94AX8BGxEjsEaWaWAs7VQwLE1kyEazT5jsyBH9Bm/FEyG7
         KEAfofH4MM2qljjVwry03lvwgd72nBRN5S0i4RNftRiIOwtMED4nvili2kHW66kTwVQN
         7xRfa2nULbB89oSbDj+DUxcTL4O2CWtbVRozEt8MWMupqev6kmm9/MsctHpLocGDxwjJ
         umpsFbEIkbg7DwQwHiUnxdVl6uVTJUFDAM23X50Si0ZvkN9UUngWTlLSB00zz60KR9zW
         QJGg==
X-Gm-Message-State: AC+VfDzNx73R0+l+ZO/oGMmncR/SwKEjFEX/NKffyw1yOO3bghLGql2m
	dvzUOpFtrLfem44BAC88CHGLLkXnU/XRe0Uo
X-Google-Smtp-Source: ACHHUZ7wnpUP9rHZ8intFEL8qKZJarDD4tjiqsnCMb8rO2kBsVcp+HjSiY1/jgRnHHuha2zXl5GbAw==
X-Received: by 2002:a9d:730a:0:b0:6ab:31ed:85ef with SMTP id e10-20020a9d730a000000b006ab31ed85efmr11642728otk.27.1686714313674;
        Tue, 13 Jun 2023 20:45:13 -0700 (PDT)
Received: from rig.lan ([104.182.101.14])
        by smtp.gmail.com with ESMTPSA id s9-20020a9d7589000000b006a662e9f074sm5367538otk.58.2023.06.13.20.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 20:45:13 -0700 (PDT)
From: Randolph Sapp <res.sapp@gmail.com>
To: denis@denix.org,
	reatmon@ti.com,
	afd@ti.com,
	nm@ti.com,
	rs@ti.com
Cc: meta-arago@lists.yoctoproject.org,
	Randolph Sapp <res.sapp@gmail.com>
Subject: [oe-layersetup][PATCHv2 02/16] oe-layertool-setup: prefer use of $() notation
Date: Tue, 13 Jun 2023 22:44:53 -0500
Message-ID: <20230614034507.598391-3-res.sapp@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230614034507.598391-1-res.sapp@gmail.com>
References: <20230614034507.598391-1-res.sapp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 14 Jun 2023 03:45:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14607

Shellcheck:
Use $(...) notation instead of legacy backticked `...`.

Signed-off-by: Randolph Sapp <res.sapp@gmail.com>
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
2.41.0


