Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15462C8300C
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 20:05:17 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.8311.1686168314400722297
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 07 Jun 2023 13:05:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=J0fWl6Jd;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 357K5BKL002219;
	Wed, 7 Jun 2023 15:05:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686168311;
	bh=CgiqDIJx8qPrpzoKWMmehNc3E985EwjbWkCqVXC5kOY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=J0fWl6JdVtNx1xGreDCzMB8iu0NI5ezcdjzPLYeI+wEjah2bOzWUTCtwuhQGfrCvb
	 Zlex87ZtEzoIp6OcDlt3T153VSCEPNJ7GDGdWGI4UnDotN+XaVos6uaqMd0zsQpI56
	 fxM9a3LSSeIiNC/xWjCU+uvQBJzDT1/idU7h3W+U=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 357K5BPJ070105
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 Jun 2023 15:05:11 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 Jun 2023 15:05:11 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 Jun 2023 15:05:11 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 357K5AL0125548;
	Wed, 7 Jun 2023 15:05:10 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>, <afd@ti.com>, <nm@ti.com>
CC: <meta-arago@lists.yoctoproject.org>,
        StaticRocket
	<35777938+StaticRocket@users.noreply.github.com>
Subject: [oe-layersetup][PATCH 04/15] oe-layertool-setup: fix all quoting, switch eval to export
Date: Wed, 7 Jun 2023 15:04:53 -0500
Message-ID: <20230607200504.3810426-5-rs@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14525

From: StaticRocket <35777938+StaticRocket@users.noreply.github.com>

Quote everything to prevent unexpected splitting and globbing. Also
switch out eval for export where we can. Export is capable of much less
runtime shenanigans than eval is.

Signed-off-by: StaticRocket <35777938+StaticRocket@users.noreply.github.com>
---
 oe-layertool-setup.sh | 222 +++++++++++++++++++++---------------------
 1 file changed, 111 insertions(+), 111 deletions(-)

diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
index 3e6ac4e..abe3f12 100755
--- a/oe-layertool-setup.sh
+++ b/oe-layertool-setup.sh
@@ -133,7 +133,7 @@ check_input() {
     fi
 
     # If an input file was given make sure it exists
-    if [ ! -f $inputfile ]
+    if [ ! -f "$inputfile" ]
     then
         echo "ERROR: the file \"$inputfile\" given for inputfile does not exist"
         usage 
@@ -142,10 +142,10 @@ check_input() {
     # If directories do not exist then create them
     for f in sourcedir builddir confdir
     do
-        eval t="$"$f
-        if [ ! -d $t ]
+        eval t="\$${f}"
+        if [ ! -d "$t" ]
         then
-            mkdir -p $t
+            mkdir -p "$t"
         fi
     done
 
@@ -154,28 +154,28 @@ check_input() {
 
 # Input is a line of the form OECORE.*=value
 parse_oecore_line() {
-    var=$(echo $1 | cut -d= -f1)
-    val=$(echo $1 | cut -d= -f2)
-    eval $var=$val
+    var=$(echo "$1" | cut -d= -f1)
+    val=$(echo "$1" | cut -d= -f2)
+    export "$var"="$val"
 }
 
 # Input is a line of the form BITBAKE.*=value
 parse_bitbake_line() {
-    var=$(echo $1 | cut -d= -f1)
-    val=$(echo $1 | cut -d= -f2)
-    eval $var=$val
+    var=$(echo "$1" | cut -d= -f1)
+    val=$(echo "$1" | cut -d= -f2)
+    export "$var"="$val"
 }
 
 # Input is a line of the form LOCALCONF:.*=value
 parse_localconf_line() {
     localconf=$(echo "$1" | cut -d: -f2-100)
-    echo "$localconf" >> $oebase/tmp_append_local.conf
+    echo "$localconf" >> "$oebase/tmp_append_local.conf"
 }
 
 # Input is a line of the form MOTD:<msg>
 parse_motd_line() {
     motd=$(echo "$1" | cut -d: -f2-100)
-    echo "$motd" >> $oebase/tmp_motd
+    echo "$motd" >> "$oebase/tmp_motd"
     echo "$motd"
 }
 
@@ -197,11 +197,11 @@ parse_repo_line() {
 
     # split the line on the comma separators
     # use the prefix if it was set.
-    eval $prefix"name"=$(echo $1 | cut -d, -f1)
-    eval $prefix"uri"=$(echo $1 | cut -d, -f2)
-    eval $prefix"branch"=$(echo $1 | cut -d, -f3)
-    eval $prefix"commit"=$(echo $1 | cut -d, -f4)
-    parsed_layers=$(echo $1 | cut -d, -f5-)
+    export "${prefix}name"="$(echo "$1" | cut -d, -f1)"
+    export "${prefix}uri"="$(echo "$1" | cut -d, -f2)"
+    export "${prefix}branch"="$(echo "$1" | cut -d, -f3)"
+    export "${prefix}commit"="$(echo "$1" | cut -d, -f4)"
+    parsed_layers=$(echo "$1" | cut -d, -f5-)
 
     # If no layers= was used, then don't add any layers
     temp_layers="none"
@@ -210,14 +210,14 @@ parse_repo_line() {
     if [ -n "$parsed_layers" ]
     then
         temp_layers=""
-        temp=$(echo $parsed_layers | cut -d= -f2)
+        temp=$(echo "$parsed_layers" | cut -d= -f2)
         # temporarily reset the IFS value to : to split the layers
-        for x in $(IFS=":";echo $temp)
+        for x in $(IFS=":"; echo "$temp")
         do
             # Add the $name value to each layer so that we have consistency
             # with how the layers are represented between the saved value
             # and the dynamically parsed values
-            temp_layers="$temp_layers""$name/$x "
+            temp_layers="${temp_layers}${name}/${x} "
         done
     fi
 
@@ -225,25 +225,25 @@ parse_repo_line() {
     # to all and we will fill in the actual layers in the later steps.
     if [ -z "$temp_layers" ]
     then
-        eval $prefix"repo_layers"="all"
+        export "${prefix}repo_layers"="all"
     elif [ "$temp_layers" = "none" ]
     then
-        eval $prefix"repo_layers"="none"
+        export "${prefix}repo_layers"="none"
     else
-        eval $prefix"repo_layers"='$temp_layers'
+        export "${prefix}repo_layers"="$temp_layers"
     fi
 }
 
 
 parse_input_file() {
-    if [ -e $oebase/tmp_append_local.conf ]
+    if [ -e "$oebase/tmp_append_local.conf" ]
     then
-        rm $oebase/tmp_append_local.conf
+        rm "$oebase/tmp_append_local.conf"
     fi
 
-    if [ -e $oebase/tmp_motd ]
+    if [ -e "$oebase/tmp_motd" ]
     then
-        rm $oebase/tmp_motd
+        rm "$oebase/tmp_motd"
     fi
 
     while read line
@@ -262,41 +262,41 @@ parse_input_file() {
         fi
 
         # Skip comment lines
-        echo $line | grep -e "^#" > /dev/null
+        echo "$line" | grep -e "^#" > /dev/null
         if [ "$?" = "0" ]
         then
             continue
         fi
 
         # If the line starts with OECORE then parse the OECORE setting
-        echo $line | grep -e "^OECORE.*=" > /dev/null
+        echo "$line" | grep -e "^OECORE.*=" > /dev/null
         if [ "$?" = "0" ]
         then
-            parse_oecore_line $line
-            output="$output""$line\n"
+            parse_oecore_line "$line"
+            output="${output}${line}\n"
             continue
         fi
 
         # If the line starts with BITBAKE then parse the BITBAKE setting
-        echo $line | grep -e "^BITBAKE.*=" > /dev/null
+        echo "$line" | grep -e "^BITBAKE.*=" > /dev/null
         if [ "$?" = "0" ]
         then
-            parse_bitbake_line $line
-            output="$output""$line\n"
+            parse_bitbake_line "$line"
+            output="${output}${line}\n"
             continue
         fi
 
         # If the line starts with LOCALCONF: then parse the LOCALCONF: setting
-        echo $line | grep -e "^LOCALCONF:.*" > /dev/null
+        echo "$line" | grep -e "^LOCALCONF:.*" > /dev/null
         if [ "$?" = "0" ]
         then
             parse_localconf_line "$line"
-            output="$output""$line\n"
+            output="${output}${line}\n"
             continue
         fi
 
         # If the line starts with MOTD: then parse the MOTD: setting
-        echo $line | grep -e "^MOTD:.*" > /dev/null
+        echo "$line" | grep -e "^MOTD:.*" > /dev/null
         if [ "$?" = "0" ]
         then
             parse_motd_line "$line"
@@ -305,7 +305,7 @@ parse_input_file() {
 
         # Since the line is not a comment or an OECORE setting let's assume
         # it is a repository information line and parse it
-        parse_repo_line $line
+        parse_repo_line "$line"
 
         configure_repo
 
@@ -322,11 +322,11 @@ parse_input_file() {
         repo_line=$(build_repo_line)
 
         # Save the line in the output variable for if we create an output file
-        output="$output""$repo_line\n"
+        output="${output}${repo_line}\n"
 
         save_layers
 
-    done < $inputfile
+    done < "$inputfile"
 }
 
 
@@ -393,12 +393,12 @@ configure_repo() {
 clone_repo() {
     # check if the repo already exists.  if so then fetch the latest updates,
     # else clone it
-    if [ -d $sourcedir/$name ]
+    if [ -d "$sourcedir/$name" ]
     then
-        cd $sourcedir/$name
-        $scriptdir/git_retry.sh fetch --all
+        cd "$sourcedir/$name"
+        "$scriptdir/git_retry.sh" fetch --all
     else
-        $scriptdir/git_retry.sh clone $uri $sourcedir/$name
+        "$scriptdir/git_retry.sh" clone "$uri" "$sourcedir/$name"
         if [ "$?" != "0" ]
         then
             echo "ERROR: Could not clone repository at $uri"
@@ -413,14 +413,14 @@ get_repo_branch() {
 
     while [ "$found" = "0" ]
     do
-        cd $sourcedir/$name
+        cd "$sourcedir/$name"
 
         # Get a unique list of branches for the user to chose from
         # Also delete the origin/HEAD line that the -r option returns
         t_branches=$(git branch -r | sed '/origin\/HEAD/d')
         for b in $t_branches
         do
-            branches="$branches"$(echo $b | sed 's:.*origin/::g')"\n"
+            branches="${branches}$(echo "$b" | sed 's:.*origin/::g')\n"
         done
         branches=$(printf '%s\n' "$branches" | sort | uniq)
 
@@ -456,17 +456,17 @@ EOM
 }
 
 checkout_branch() {
-    cd $sourcedir/$name
+    cd "$sourcedir/$name"
 
     # Check if a local branch already exists to track the remote branch.
     # If not then create a tracking branch and checkout the branch
     # else just checkout the existing branch
-    git branch | grep $branch > /dev/null
+    git branch | grep "$branch" > /dev/null
     if [ "$?" != "0" ]
     then
-        git checkout origin/$branch -b $branch --track
+        git checkout "origin/$branch" -b "$branch" --track
     else
-        git checkout $branch
+        git checkout "$branch"
     fi
 
     # Now that we are on the proper branch pull the remote branch changes if
@@ -476,14 +476,14 @@ checkout_branch() {
     if [ "$resethead" = "y" ]
     then
         # Instead of merging, reset to remote branch to avoid conflicts due to rebase
-        git reset --hard origin/$branch
+        git reset --hard "origin/$branch"
     else
-        git merge origin/$branch
+        git merge "origin/$branch"
     fi
 }
 
 checkout_commit() {
-    cd $sourcedir/$name
+    cd "$sourcedir/$name"
     if [ "$commit" != "HEAD" ]
     then
         git checkout $commit
@@ -492,7 +492,7 @@ checkout_commit() {
 
 get_repo_commit() {
   # prompt for what commit to use with HEAD as default
-    cd $sourcedir/$name
+    cd "$sourcedir/$name"
 cat << EOM
 
 
@@ -526,10 +526,10 @@ EOM
 }
 
 verify_layers() {
-    cd $sourcedir
+    cd "$sourcedir"
     for l in $repo_layers
     do
-        if [ ! -f $sourcedir/$l/conf/layer.conf ]
+        if [ ! -f "$sourcedir/$l/conf/layer.conf" ]
         then
             echo "ERROR: the $l layer in the $name repository could not be"
             echo "       found.  Bailing out."
@@ -543,7 +543,7 @@ save_layers() {
     # Add the repo layers to the layers list
     for l in $repo_layers
     do
-        layers="$layers""$sourcedir/$l "
+        layers="${layers}${sourcedir}/$l "
     done
 }
 
@@ -564,9 +564,9 @@ select_layers() {
         return
     fi
 
-    cd $sourcedir
+    cd "$sourcedir"
     # Get a count of how many layers there are
-    count=$(find $name -name "layer.conf" | grep -c layer.conf)
+    count=$(find "$name" -name "layer.conf" | grep -c layer.conf)
 
     case $count in
         0 )
@@ -581,7 +581,7 @@ select_layers() {
             ;;
     esac
 
-    t_layers=$(find $name -name "layer.conf" | sed 's:\/conf\/layer.conf::')
+    t_layers=$(find "$name" -name "layer.conf" | sed 's:\/conf\/layer.conf::')
 
     if [ "$arg1" != "all" ]
     then
@@ -597,7 +597,7 @@ EOM
 
     for l in $t_layers
     do
-        printf '\t%s\n' "$(echo $l | sed "s:${name}\/::")"
+        printf '\t%s\n' "$(echo "$l" | sed "s:${name}\/::")"
     done
 
 cat << EOM
@@ -647,7 +647,7 @@ get_oecorelayerconf() {
     then
         OECORELAYERCONFPATH=$scriptdir/$OECORELAYERCONF
 
-        if [ ! -e $OECORELAYERCONFPATH ]
+        if [ ! -e "$OECORELAYERCONFPATH" ]
         then
             echo "ERROR: Could not find the specified layer conf file $OECORELAYERCONFPATH"
         fi
@@ -655,7 +655,7 @@ get_oecorelayerconf() {
         return
     fi
 
-    cd $sourcedir
+    cd "$sourcedir"
     confs=$(find . -name "bblayers.conf.sample")
 
     done="n"
@@ -683,7 +683,7 @@ EOM
 
         read input
 
-        if [ -e $input ]
+        if [ -e "$input" ]
         then
             done="y"
             OECORELAYERCONF=$input
@@ -701,7 +701,7 @@ get_oecorelocalconf() {
     then
         OECORELOCALCONFPATH=$scriptdir/$OECORELOCALCONF
 
-        if [ ! -e $OECORELOCALCONFPATH ]
+        if [ ! -e "$OECORELOCALCONFPATH" ]
         then
             echo "ERROR: Could not find the specified local conf file $OECORELOCALCONFPATH"
             exit 1
@@ -710,7 +710,7 @@ get_oecorelocalconf() {
         return
     fi
 
-    cd $sourcedir
+    cd "$sourcedir"
     confs=$(find . -name "local.conf.sample")
 
     done="n"
@@ -738,7 +738,7 @@ EOM
 
         read input
 
-        if [ -e $input ]
+        if [ -e "$input" ]
         then
             done="y"
             OECORELOCALCONF=$input
@@ -767,19 +767,19 @@ NOTE: Any additional entries to this file will be lost if the $0
 
 EOM
     # First copy the template file
-    cp -f $OECORELAYERCONFPATH $confdir/bblayers.conf
+    cp -f "$OECORELAYERCONFPATH" "$confdir/bblayers.conf"
 
     # Now add the layers we have configured to the BBLAYERS variable
-cat >> $confdir/bblayers.conf << EOM
+cat >> "$confdir/bblayers.conf" << EOM
 
 # Layers configured by oe-core-setup script
 BBLAYERS += " \\
 EOM
     for l in $layers
     do
-        printf '\t%s \\\n' "$l" >> $confdir/bblayers.conf
+        printf '\t%s \\\n' "$l" >> "$confdir/bblayers.conf"
     done
-    echo "\"" >> $confdir/bblayers.conf
+    echo "\"" >> "$confdir/bblayers.conf"
 }
 
 
@@ -800,20 +800,20 @@ NOTE: You will probably want to change the default MACHINE setting in the
 
 EOM
     
-    if [ -e $confdir/local.conf ]
+    if [ -e "$confdir/local.conf" ]
     then
         echo "WARNING: Found existing $confdir/local.conf"
         echo "Saving a backup to $confdir/local.conf.bak" 
-        cp -f $confdir/local.conf $confdir/local.conf.bak
+        cp -f "$confdir/local.conf" "$confdir/local.conf.bak"
     fi
 
     # First copy the template file
-    cp -f $OECORELOCALCONFPATH $confdir/local.conf
+    cp -f "$OECORELOCALCONFPATH" "$confdir/local.conf"
 
     # Find if old DL_DIR was set
-    if [ -e $confdir/local.conf.bak ]
+    if [ -e "$confdir/local.conf.bak" ]
     then
-        old_dldir=$(cat $confdir/local.conf.bak | grep -e "^DL_DIR =" | sed 's|DL_DIR = ||' | sed 's/"//g')
+        old_dldir=$(cat "$confdir/local.conf.bak" | grep -e "^DL_DIR =" | sed 's|DL_DIR = ||' | sed 's/"//g')
     else
         old_dldir="$oebase/downloads"
     fi
@@ -824,30 +824,30 @@ EOM
         dldir=$old_dldir
     fi
 
-    sed -i "s|^DL_DIR.*|DL_DIR = \"${dldir}\"|" $confdir/local.conf
+    sed -i "s|^DL_DIR.*|DL_DIR = \"${dldir}\"|" "$confdir/local.conf"
 
-    if [ -e $oebase/tmp_append_local.conf ]
+    if [ -e "$oebase/tmp_append_local.conf" ]
     then
-        echo "" >> $confdir/local.conf
-        echo "#====================================================================" >> $confdir/local.conf
-        echo "# LOCALCONF: settings from config file:" >> $confdir/local.conf
-        echo "#   $inputfile" >> $confdir/local.conf
-        echo "#" >> $confdir/local.conf
-        echo "# Do not remove." >> $confdir/local.conf
-        echo "#--------------------------------------------------------------------" >> $confdir/local.conf
-        cat $oebase/tmp_append_local.conf >> $confdir/local.conf
-        echo "#====================================================================" >> $confdir/local.conf
-        echo "" >>  $confdir/local.conf
-        rm $oebase/tmp_append_local.conf
+        echo "" >> "$confdir/local.conf"
+        echo "#====================================================================" >> "$confdir/local.conf"
+        echo "# LOCALCONF: settings from config file:" >> "$confdir/local.conf"
+        echo "#   $inputfile" >> "$confdir/local.conf"
+        echo "#" >> "$confdir/local.conf"
+        echo "# Do not remove." >> "$confdir/local.conf"
+        echo "#--------------------------------------------------------------------" >> "$confdir/local.conf"
+        cat "$oebase/tmp_append_local.conf" >> "$confdir/local.conf"
+        echo "#====================================================================" >> "$confdir/local.conf"
+        echo "" >>  "$confdir/local.conf"
+        rm "$oebase/tmp_append_local.conf"
     fi
 }
 
 print_motd() {
 
-    if [ -e $oebase/tmp_motd ]
+    if [ -e "$oebase/tmp_motd" ]
     then
         echo ""
-        cat $oebase/tmp_motd
+        cat "$oebase/tmp_motd"
         echo ""
     fi
 }
@@ -866,7 +866,7 @@ print_image_names() {
         F_IMAGE_FOLDERS=$(find "${SOURCES}/${FOLDER}" -type d -a -iname images|grep recipes-core)
         for IMG_FOLDER in ${F_IMAGE_FOLDERS}
         do
-            F_IMAGES=$(find "${IMG_FOLDER}" -iname *.bb)
+            F_IMAGES=$(find "${IMG_FOLDER}" -iname '*.bb')
             if [ -n "${F_IMAGES}" ]; then
                 for img in ${F_IMAGES}
                 do
@@ -901,17 +901,17 @@ For example:
 
 Common targets are:
 EOM
-print_image_names ${sourcedir}
+print_image_names "${sourcedir}"
 
 
     # Write the setenv file
-cat > $confdir/setenv << EOM
+cat > "$confdir/setenv" << EOM
 # Set OEBASE to where the build and source directories reside
 # NOTE: Do NOT place a trailing / on the end of OEBASE.
-export OEBASE=${oebase}
+export OEBASE="${oebase}"
 
 # try to find out bitbake directory
-BITBAKEDIR=\$(find \${OEBASE}/sources -name "*bitbake*")
+BITBAKEDIR=\$(find "\${OEBASE}/sources" -name "*bitbake*")
 for f in \${BITBAKEDIR}
 do
     if [ -d \${f}/bin ]
@@ -922,7 +922,7 @@ done
 
 # check for any scripts directories in the top-level of the repos and add those
 # to the PATH
-SCRIPTS=\$(find \${OEBASE}/sources -maxdepth 2 -name "scripts" -type d)
+SCRIPTS=\$(find "\${OEBASE}/sources" -maxdepth 2 -name "scripts" -type d)
 for s in \${SCRIPTS}
 do
     PATH="\${s}:\$PATH"
@@ -931,13 +931,13 @@ done
 unset BITBAKEDIR
 unset SCRIPTS
 export PATH
-export BUILDDIR=${builddir}
+export BUILDDIR="${builddir}"
 EOM
 
     if [ "$BITBAKE_INCLUSIVE_VARS" = "no" ]; then
-        echo "export BB_ENV_EXTRAWHITE=\"MACHINE DISTRO TCMODE TCLIBC http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS PARALLEL_MAKE GIT_PROXY_COMMAND GIT_PROXY_IGNORE SOCKS5_PASSWD SOCKS5_USER OEBASE META_SDK_PATH TOOLCHAIN_TYPE TOOLCHAIN_BRAND TOOLCHAIN_BASE TOOLCHAIN_PATH TOOLCHAIN_PATH_ARMV5 TOOLCHAIN_PATH_ARMV7 TOOLCHAIN_PATH_ARMV8 EXTRA_TISDK_FILES TISDK_VERSION ARAGO_BRAND ARAGO_RT_ENABLE ARAGO_SYSTEST_ENABLE ARAGO_KERNEL_SUFFIX TI_SECURE_DEV_PKG_CAT TI_SECURE_DEV_PKG_AUTO TI_SECURE_DEV_PKG_K3 ARAGO_SYSVINIT SYSFW_FILE ARAGO_JAILHOUSE_ENABLE\"" >> $confdir/setenv
+        echo "export BB_ENV_EXTRAWHITE=\"MACHINE DISTRO TCMODE TCLIBC http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS PARALLEL_MAKE GIT_PROXY_COMMAND GIT_PROXY_IGNORE SOCKS5_PASSWD SOCKS5_USER OEBASE META_SDK_PATH TOOLCHAIN_TYPE TOOLCHAIN_BRAND TOOLCHAIN_BASE TOOLCHAIN_PATH TOOLCHAIN_PATH_ARMV5 TOOLCHAIN_PATH_ARMV7 TOOLCHAIN_PATH_ARMV8 EXTRA_TISDK_FILES TISDK_VERSION ARAGO_BRAND ARAGO_RT_ENABLE ARAGO_SYSTEST_ENABLE ARAGO_KERNEL_SUFFIX TI_SECURE_DEV_PKG_CAT TI_SECURE_DEV_PKG_AUTO TI_SECURE_DEV_PKG_K3 ARAGO_SYSVINIT SYSFW_FILE ARAGO_JAILHOUSE_ENABLE\"" >> "$confdir/setenv"
     else
-        echo "export BB_ENV_PASSTHROUGH_ADDITIONS=\"MACHINE DISTRO TCMODE TCLIBC http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS PARALLEL_MAKE GIT_PROXY_COMMAND GIT_PROXY_IGNORE SOCKS5_PASSWD SOCKS5_USER OEBASE META_SDK_PATH TOOLCHAIN_TYPE TOOLCHAIN_BRAND TOOLCHAIN_BASE TOOLCHAIN_PATH TOOLCHAIN_PATH_ARMV5 TOOLCHAIN_PATH_ARMV7 TOOLCHAIN_PATH_ARMV8 EXTRA_TISDK_FILES TISDK_VERSION ARAGO_BRAND ARAGO_RT_ENABLE ARAGO_SYSTEST_ENABLE ARAGO_KERNEL_SUFFIX TI_SECURE_DEV_PKG_CAT TI_SECURE_DEV_PKG_AUTO TI_SECURE_DEV_PKG_K3 ARAGO_SYSVINIT SYSFW_FILE ARAGO_JAILHOUSE_ENABLE\"" >> $confdir/setenv
+        echo "export BB_ENV_PASSTHROUGH_ADDITIONS=\"MACHINE DISTRO TCMODE TCLIBC http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS PARALLEL_MAKE GIT_PROXY_COMMAND GIT_PROXY_IGNORE SOCKS5_PASSWD SOCKS5_USER OEBASE META_SDK_PATH TOOLCHAIN_TYPE TOOLCHAIN_BRAND TOOLCHAIN_BASE TOOLCHAIN_PATH TOOLCHAIN_PATH_ARMV5 TOOLCHAIN_PATH_ARMV7 TOOLCHAIN_PATH_ARMV8 EXTRA_TISDK_FILES TISDK_VERSION ARAGO_BRAND ARAGO_RT_ENABLE ARAGO_SYSTEST_ENABLE ARAGO_KERNEL_SUFFIX TI_SECURE_DEV_PKG_CAT TI_SECURE_DEV_PKG_AUTO TI_SECURE_DEV_PKG_K3 ARAGO_SYSVINIT SYSFW_FILE ARAGO_JAILHOUSE_ENABLE\"" >> "$confdir/setenv"
     fi
 }
 
@@ -945,13 +945,13 @@ EOM
 build_repo_line() {
     # clean up the layers to remove the repository name and add : divider
     temp_layers=""
-    for l in $(echo $repo_layers | sed "s:${name}::" | sed -e 's:^\/::')
+    for l in $(echo "$repo_layers" | sed "s:${name}::" | sed -e 's:^\/::')
     do
-        temp_layers="$temp_layers""$(echo $l | sed "s:${name}\/::"):"
+        temp_layers="${temp_layers}$(echo "$l" | sed "s:${name}\/::"):"
     done
 
     # Lastly clean off any trailing :
-    temp_layers=$(echo $temp_layers | sed 's/:$//')
+    temp_layers=$(echo "$temp_layers" | sed 's/:$//')
 
     echo "$name,$uri,$branch,$commit,layers=$temp_layers"
 }
@@ -975,11 +975,11 @@ do
 done
 
 # create passed in directory if it doesn't exist
-mkdir -p $oebase
+mkdir -p "$oebase"
 
 # retrive the absolute path to the oebase directory incase
 # a relative path is passed in
-cd $oebase
+cd "$oebase"
 oebase=$(pwd)
 cd -
 
@@ -1022,7 +1022,7 @@ then
         repo_line=$(build_repo_line)
 
         # Save the line in the output variable for if we create an output file
-        output="$output""$repo_line\n"
+        output="${output}${repo_line}\n"
 
         save_layers
 
@@ -1042,13 +1042,13 @@ config_oecorelocalconf
 if [ -n "$outputfile" ]
 then
     # make sure that the directory for the output file exists
-    cd $oebase
-    dir=$(dirname $outputfile)
-    if [ ! -d $dir ]
+    cd "$oebase"
+    dir=$(dirname "$outputfile")
+    if [ ! -d "$dir" ]
     then
-        mkdir -p $dir
+        mkdir -p "$dir"
     fi
-    printf '%s\n' "$output" > $outputfile
+    printf '%s\n' "$output" > "$outputfile"
     echo "Output file is $outputfile"
 fi
 
-- 
2.40.1


