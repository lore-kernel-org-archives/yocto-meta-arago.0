Return-Path: <res.sapp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0028CEB64D8
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 03:45:21 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web11.3795.1686714321071740665
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Jun 2023 20:45:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=MDPBLtB+;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: res.sapp@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6b2d356530eso3007243a34.0
        for <meta-arago@lists.yoctoproject.org>; Tue, 13 Jun 2023 20:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686714320; x=1689306320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=prCIqU9rSkVqSfvhS4+Jbe49K4Tv67iGHAFtukAworQ=;
        b=MDPBLtB+XtUbf/nXPDogJ57aMGk3C7uZIk2ZtDwivtBnKgHIHL2UPtJLTq+uJ9tGwR
         jslNG3vik6afWw9QPOL6I7vCAFtF5B9U0mp6AyXzIxC7GvzR2CwOlN4i63XzjBhkfWxR
         +t6oERF1zo6ZizqjUS2cvTJgAzHpqOsQ+Z3elvgd/8exCgl92dD2ISalWp+UfdE8W/Ew
         TWLd9Hp4hg0Mqz0QCQ9nDkUuTeyEQJbNpagz5oyothqhKr4kMvsA0MGk8SmZPxSxwLuB
         4+QXKQy6Sh8syiS7WV305O/+c48/0kPZEBRAd8crXoz4PeE7B7XbgSuDtt/mzp4MGcQ+
         4Oaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686714320; x=1689306320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=prCIqU9rSkVqSfvhS4+Jbe49K4Tv67iGHAFtukAworQ=;
        b=Cv70XwJCdNBdsizI/Hcb7KdaowfsK9imVFtsZQ6/1KbvcYLadFFtSG7p4MAay8670M
         EIszXUTNotLr4Hq6z6nhcZ12RWrJ5Si+gZzrBDa0MISQOTWTDc8s5+FmHGPKQr+oonko
         a00BeSNaE1Jd8Wwmivav807fdR5WJly5iGQEv2TNSAjg708W1Dd1Lla5h1sBId4A3jR3
         kLNL/kr6+fjTa6y3KlLVAK2mw0ZA3YiqxRr2LiZZtpM4USqvYeRxYQWVNeNB0o8f7euL
         IG1/LhTyqIt3m7CFW6R0LJxCqUTGEycW/k/pKH215mf7YXYgv/tcLvytGKbxDqo1T8oe
         9IvQ==
X-Gm-Message-State: AC+VfDwwB1bf9w2gUylit/0j32kWVTVCpWs01q9Tj90VKjRE/SKz8781
	SjXTNF7TXHsS3y1IOrGyPiE=
X-Google-Smtp-Source: ACHHUZ6wQNhBJZC4OUmOKQG6poEXah5irnhx7yKNQav0Aw+WsIEfo11MK/kkYrPZ0UtuMfxgvs4gFg==
X-Received: by 2002:a9d:6c1a:0:b0:6af:7856:5d55 with SMTP id f26-20020a9d6c1a000000b006af78565d55mr10054776otq.22.1686714320294;
        Tue, 13 Jun 2023 20:45:20 -0700 (PDT)
Received: from rig.lan ([104.182.101.14])
        by smtp.gmail.com with ESMTPSA id s9-20020a9d7589000000b006a662e9f074sm5367538otk.58.2023.06.13.20.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 20:45:20 -0700 (PDT)
From: Randolph Sapp <res.sapp@gmail.com>
To: denis@denix.org,
	reatmon@ti.com,
	afd@ti.com,
	nm@ti.com,
	rs@ti.com
Cc: meta-arago@lists.yoctoproject.org,
	Randolph Sapp <res.sapp@gmail.com>
Subject: [oe-layersetup][PATCHv2 12/16] oe-layertool-setup: replace all calls to echo with printf
Date: Tue, 13 Jun 2023 22:45:03 -0500
Message-ID: <20230614034507.598391-13-res.sapp@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230614034507.598391-1-res.sapp@gmail.com>
References: <20230614034507.598391-1-res.sapp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 14 Jun 2023 03:45:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14617

Replace all echo calls with `printf '%s\n'` since that handles arbitrary
string input much more reliably.

Signed-off-by: Randolph Sapp <res.sapp@gmail.com>
---
 oe-layertool-setup.sh | 137 +++++++++++++++++++++---------------------
 1 file changed, 69 insertions(+), 68 deletions(-)

diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
index e427393..e0cfe4e 100755
--- a/oe-layertool-setup.sh
+++ b/oe-layertool-setup.sh
@@ -128,14 +128,14 @@ check_input() {
     # Check that at least -i or -f was used
     if [ "$interactive" = "n" ] && [ -z "$inputfile" ]
     then
-        echo "ERROR: You must either use this script with the -i or -f options"
+        printf '%s\n' "ERROR: You must either use this script with the -i or -f options"
         usage
     fi
 
     # If an input file was given make sure it exists
     if [ ! -f "$inputfile" ]
     then
-        echo "ERROR: the file \"$inputfile\" given for inputfile does not exist"
+        printf '%s\n' "ERROR: the file \"$inputfile\" given for inputfile does not exist"
         usage 
     fi
 
@@ -154,29 +154,29 @@ check_input() {
 
 # Input is a line of the form OECORE.*=value
 parse_oecore_line() {
-    var=$(echo "$1" | cut -d= -f1)
-    val=$(echo "$1" | cut -d= -f2)
+    var=$(printf '%s\n' "$1" | cut -d= -f1)
+    val=$(printf '%s\n' "$1" | cut -d= -f2)
     export "$var"="$val"
 }
 
 # Input is a line of the form BITBAKE.*=value
 parse_bitbake_line() {
-    var=$(echo "$1" | cut -d= -f1)
-    val=$(echo "$1" | cut -d= -f2)
+    var=$(printf '%s\n' "$1" | cut -d= -f1)
+    val=$(printf '%s\n' "$1" | cut -d= -f2)
     export "$var"="$val"
 }
 
 # Input is a line of the form LOCALCONF:.*=value
 parse_localconf_line() {
-    localconf=$(echo "$1" | cut -d: -f2-100)
-    echo "$localconf" >> "$oebase/tmp_append_local.conf"
+    localconf=$(printf '%s\n' "$1" | cut -d: -f2-100)
+    printf '%s\n' "$localconf" >> "$oebase/tmp_append_local.conf"
 }
 
 # Input is a line of the form MOTD:<msg>
 parse_motd_line() {
-    motd=$(echo "$1" | cut -d: -f2-100)
-    echo "$motd" >> "$oebase/tmp_motd"
-    echo "$motd"
+    motd=$(printf '%s\n' "$1" | cut -d: -f2-100)
+    printf '%s\n' "$motd" >> "$oebase/tmp_motd"
+    printf '%s\n' "$motd"
 }
 
 
@@ -197,11 +197,11 @@ parse_repo_line() {
 
     # split the line on the comma separators
     # use the prefix if it was set.
-    export "${prefix}name"="$(echo "$1" | cut -d, -f1)"
-    export "${prefix}uri"="$(echo "$1" | cut -d, -f2)"
-    export "${prefix}branch"="$(echo "$1" | cut -d, -f3)"
-    export "${prefix}commit"="$(echo "$1" | cut -d, -f4)"
-    parsed_layers=$(echo "$1" | cut -d, -f5-)
+    export "${prefix}name"="$(printf '%s\n' "$1" | cut -d, -f1)"
+    export "${prefix}uri"="$(printf '%s\n' "$1" | cut -d, -f2)"
+    export "${prefix}branch"="$(printf '%s\n' "$1" | cut -d, -f3)"
+    export "${prefix}commit"="$(printf '%s\n' "$1" | cut -d, -f4)"
+    parsed_layers=$(printf '%s\n' "$1" | cut -d, -f5-)
 
     # If no layers= was used, then don't add any layers
     temp_layers="none"
@@ -210,9 +210,10 @@ parse_repo_line() {
     if [ -n "$parsed_layers" ]
     then
         temp_layers=""
-        temp=$(echo "$parsed_layers" | cut -d= -f2)
-        # temporarily reset the IFS value to : to split the layers
-        for x in $(IFS=":"; echo "$temp")
+        temp=$(printf '%s\n' "$parsed_layers" | cut -d= -f2)
+        # use tr to split the layers since we assume layer names don't have
+        # whitespace characters later anyway
+        for x in $(printf '%s\n' "$temp" | tr ':' ' ')
         do
             # Add the $name value to each layer so that we have consistency
             # with how the layers are represented between the saved value
@@ -262,13 +263,13 @@ parse_input_file() {
         fi
 
         # Skip comment lines
-        if echo "$line" | grep -q -e "^#"
+        if printf '%s\n' "$line" | grep -q -e "^#"
         then
             continue
         fi
 
         # If the line starts with OECORE then parse the OECORE setting
-        if echo "$line" | grep -q -e "^OECORE.*="
+        if printf '%s\n' "$line" | grep -q -e "^OECORE.*="
         then
             parse_oecore_line "$line"
             output="${output}${line}\n"
@@ -276,7 +277,7 @@ parse_input_file() {
         fi
 
         # If the line starts with BITBAKE then parse the BITBAKE setting
-        if echo "$line" | grep -q -e "^BITBAKE.*="
+        if printf '%s\n' "$line" | grep -q -e "^BITBAKE.*="
         then
             parse_bitbake_line "$line"
             output="${output}${line}\n"
@@ -284,7 +285,7 @@ parse_input_file() {
         fi
 
         # If the line starts with LOCALCONF: then parse the LOCALCONF: setting
-        if echo "$line" | grep -q -e "^LOCALCONF:.*"
+        if printf '%s\n' "$line" | grep -q -e "^LOCALCONF:.*"
         then
             parse_localconf_line "$line"
             output="${output}${line}\n"
@@ -292,7 +293,7 @@ parse_input_file() {
         fi
 
         # If the line starts with MOTD: then parse the MOTD: setting
-        if echo "$line" | grep -q -e "^MOTD:.*"
+        if printf '%s\n' "$line" | grep -q -e "^MOTD:.*"
         then
             parse_motd_line "$line"
             continue
@@ -335,9 +336,9 @@ configure_repo() {
 
     if [ -n "$temp" ]
     then
-        echo "This repository ($name) has already been configured with the following values:"
+        printf '%s\n' "This repository ($name) has already been configured with the following values:"
         printf '\t%s\n' "$temp"
-        echo "Skipping configuring duplicate repository"
+        printf '%s\n' "Skipping configuring duplicate repository"
         return 1
     fi
   
@@ -346,10 +347,10 @@ configure_repo() {
         get_repo_uri
     fi
 
-    echo ""
-    echo ""
-    echo "cloning repo $name"
-    echo ""
+    printf '%s\n' ""
+    printf '%s\n' ""
+    printf '%s\n' "cloning repo $name"
+    printf '%s\n' ""
 
     clone_repo
 
@@ -392,7 +393,7 @@ clone_repo() {
     else
         if ! "$scriptdir/git_retry.sh" clone "$uri" "$sourcedir/$name"
         then
-            echo "ERROR: Could not clone repository at $uri"
+            printf '%s\n' "ERROR: Could not clone repository at $uri"
             exit 1
         fi
     fi
@@ -411,7 +412,7 @@ get_repo_branch() {
         t_branches=$(git branch -r | sed '/origin\/HEAD/d')
         for b in $t_branches
         do
-            branches="${branches}$(echo "$b" | sed 's:.*origin/::g')\n"
+            branches="${branches}$(printf '%s\n' "$b" | sed 's:.*origin/::g')\n"
         done
         branches=$(printf '%s\n' "$branches" | sort | uniq)
 
@@ -440,7 +441,7 @@ EOM
 
         if [ "$found" != "1" ]
         then
-            echo "Invalid branch ($input) selected.  Please try again"
+            printf '%s\n' "Invalid branch ($input) selected.  Please try again"
         fi
     done
     branch=$input
@@ -521,8 +522,8 @@ verify_layers() {
     do
         if [ ! -f "$sourcedir/$l/conf/layer.conf" ]
         then
-            echo "ERROR: the $l layer in the $name repository could not be"
-            echo "       found.  Bailing out."
+            printf '%s\n' "ERROR: the $l layer in the $name repository could not be"
+            printf '%s\n' "       found.  Bailing out."
             exit 1
         fi
     done
@@ -575,7 +576,7 @@ select_layers() {
 
     if [ "$arg1" != "all" ]
     then
-        echo "arg1 = $arg1"
+        printf '%s\n' "arg1 = $arg1"
         # Prompt for which layers to configure
 cat << EOM
 
@@ -587,7 +588,7 @@ EOM
 
     for l in $t_layers
     do
-        printf '\t%s\n' "$(echo "$l" | sed "s:${name}\/::")"
+        printf '\t%s\n' "$(printf '%s\n' "$l" | sed "s:${name}\/::")"
     done
 
 cat << EOM
@@ -639,7 +640,7 @@ get_oecorelayerconf() {
 
         if [ ! -e "$OECORELAYERCONFPATH" ]
         then
-            echo "ERROR: Could not find the specified layer conf file $OECORELAYERCONFPATH"
+            printf '%s\n' "ERROR: Could not find the specified layer conf file $OECORELAYERCONFPATH"
         fi
 
         return
@@ -679,7 +680,7 @@ EOM
             OECORELAYERCONF=$input
             OECORELAYERCONFPATH=$sourcedir/$OECORELAYERCONF
         else
-            echo "ERROR: Could not find the specified layer conf file $input"
+            printf '%s\n' "ERROR: Could not find the specified layer conf file $input"
         fi
     done
 }
@@ -693,7 +694,7 @@ get_oecorelocalconf() {
 
         if [ ! -e "$OECORELOCALCONFPATH" ]
         then
-            echo "ERROR: Could not find the specified local conf file $OECORELOCALCONFPATH"
+            printf '%s\n' "ERROR: Could not find the specified local conf file $OECORELOCALCONFPATH"
             exit 1
         fi
 
@@ -734,7 +735,7 @@ EOM
             OECORELOCALCONF=$input
             OECORELOCALCONFPATH=$sourcedir/$OECORELOCALCONF
         else
-            echo "ERROR: Could not find the inputted sample file: $input"
+            printf '%s\n' "ERROR: Could not find the inputted sample file: $input"
             exit 1
         fi
     done
@@ -769,7 +770,7 @@ EOM
     do
         printf '\t%s \\\n' "$l" >> "$confdir/bblayers.conf"
     done
-    echo "\"" >> "$confdir/bblayers.conf"
+    printf '%s\n' "\"" >> "$confdir/bblayers.conf"
 }
 
 
@@ -792,8 +793,8 @@ EOM
     
     if [ -e "$confdir/local.conf" ]
     then
-        echo "WARNING: Found existing $confdir/local.conf"
-        echo "Saving a backup to $confdir/local.conf.bak" 
+        printf '%s\n' "WARNING: Found existing $confdir/local.conf"
+        printf '%s\n' "Saving a backup to $confdir/local.conf.bak" 
         cp -f "$confdir/local.conf" "$confdir/local.conf.bak"
     fi
 
@@ -819,16 +820,16 @@ EOM
     if [ -e "$oebase/tmp_append_local.conf" ]
     then
         {
-            echo "";
-            echo "#====================================================================";
-            echo "# LOCALCONF: settings from config file:";
-            echo "#   $inputfile";
-            echo "#";
-            echo "# Do not remove.";
-            echo "#--------------------------------------------------------------------";
+            printf '%s\n' "";
+            printf '%s\n' "#====================================================================";
+            printf '%s\n' "# LOCALCONF: settings from config file:";
+            printf '%s\n' "#   $inputfile";
+            printf '%s\n' "#";
+            printf '%s\n' "# Do not remove.";
+            printf '%s\n' "#--------------------------------------------------------------------";
             cat "$oebase/tmp_append_local.conf";
-            echo "#====================================================================";
-            echo "";
+            printf '%s\n' "#====================================================================";
+            printf '%s\n' "";
         } >> "$confdir/local.conf"
         rm "$oebase/tmp_append_local.conf"
     fi
@@ -838,9 +839,9 @@ print_motd() {
 
     if [ -e "$oebase/tmp_motd" ]
     then
-        echo ""
+        printf '%s\n' ""
         cat "$oebase/tmp_motd"
-        echo ""
+        printf '%s\n' ""
     fi
 }
 
@@ -854,7 +855,7 @@ print_image_names() {
         if [ "${FOLDER}" = "meta-arago" ]; then
             RECO="[recommended]"
         fi
-        echo "From ${FOLDER}${RECO}:"
+        printf '%s\n' "From ${FOLDER}${RECO}:"
         F_IMAGE_FOLDERS=$(find "${SOURCES}/${FOLDER}" -type d -a -iname images|grep recipes-core)
         for IMG_FOLDER in ${F_IMAGE_FOLDERS}
         do
@@ -863,11 +864,11 @@ print_image_names() {
                 for img in ${F_IMAGES}
                 do
                     name=$(basename "${img}"|sed 's/\.bb$//g')
-                    summary=$(grep SUMMARY "${img}"|cut -d '=' -f2| sed 's/["/]//g'|xargs  echo)
+                    summary=$(grep SUMMARY "${img}"|cut -d '=' -f2| sed 's/["/]//g')
                     if [ -z "${summary}" ]; then
                         summary="No Summary available"
                     fi
-                    echo "    ${name}: ${summary}"
+                    printf '%s\n' "    ${name}: ${summary}"
                 done
             fi
         done
@@ -927,9 +928,9 @@ export BUILDDIR="${builddir}"
 EOM
 
     if [ "$BITBAKE_INCLUSIVE_VARS" = "no" ]; then
-        echo "export BB_ENV_EXTRAWHITE=\"MACHINE DISTRO TCMODE TCLIBC http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS PARALLEL_MAKE GIT_PROXY_COMMAND GIT_PROXY_IGNORE SOCKS5_PASSWD SOCKS5_USER OEBASE META_SDK_PATH TOOLCHAIN_TYPE TOOLCHAIN_BRAND TOOLCHAIN_BASE TOOLCHAIN_PATH TOOLCHAIN_PATH_ARMV5 TOOLCHAIN_PATH_ARMV7 TOOLCHAIN_PATH_ARMV8 EXTRA_TISDK_FILES TISDK_VERSION ARAGO_BRAND ARAGO_RT_ENABLE ARAGO_SYSTEST_ENABLE ARAGO_KERNEL_SUFFIX TI_SECURE_DEV_PKG_CAT TI_SECURE_DEV_PKG_AUTO TI_SECURE_DEV_PKG_K3 ARAGO_SYSVINIT SYSFW_FILE ARAGO_JAILHOUSE_ENABLE\"" >> "$confdir/setenv"
+        printf 'export %s="%s"\n' 'BB_ENV_EXTRAWHITE' 'MACHINE DISTRO TCMODE TCLIBC http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS PARALLEL_MAKE GIT_PROXY_COMMAND GIT_PROXY_IGNORE SOCKS5_PASSWD SOCKS5_USER OEBASE META_SDK_PATH TOOLCHAIN_TYPE TOOLCHAIN_BRAND TOOLCHAIN_BASE TOOLCHAIN_PATH TOOLCHAIN_PATH_ARMV5 TOOLCHAIN_PATH_ARMV7 TOOLCHAIN_PATH_ARMV8 EXTRA_TISDK_FILES TISDK_VERSION ARAGO_BRAND ARAGO_RT_ENABLE ARAGO_SYSTEST_ENABLE ARAGO_KERNEL_SUFFIX TI_SECURE_DEV_PKG_CAT TI_SECURE_DEV_PKG_AUTO TI_SECURE_DEV_PKG_K3 ARAGO_SYSVINIT SYSFW_FILE ARAGO_JAILHOUSE_ENABLE' >> "$confdir/setenv"
     else
-        echo "export BB_ENV_PASSTHROUGH_ADDITIONS=\"MACHINE DISTRO TCMODE TCLIBC http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS PARALLEL_MAKE GIT_PROXY_COMMAND GIT_PROXY_IGNORE SOCKS5_PASSWD SOCKS5_USER OEBASE META_SDK_PATH TOOLCHAIN_TYPE TOOLCHAIN_BRAND TOOLCHAIN_BASE TOOLCHAIN_PATH TOOLCHAIN_PATH_ARMV5 TOOLCHAIN_PATH_ARMV7 TOOLCHAIN_PATH_ARMV8 EXTRA_TISDK_FILES TISDK_VERSION ARAGO_BRAND ARAGO_RT_ENABLE ARAGO_SYSTEST_ENABLE ARAGO_KERNEL_SUFFIX TI_SECURE_DEV_PKG_CAT TI_SECURE_DEV_PKG_AUTO TI_SECURE_DEV_PKG_K3 ARAGO_SYSVINIT SYSFW_FILE ARAGO_JAILHOUSE_ENABLE\"" >> "$confdir/setenv"
+        printf 'export %s="%s"\n' 'BB_ENV_PASSTHROUGH_ADDITIONS' 'MACHINE DISTRO TCMODE TCLIBC http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS PARALLEL_MAKE GIT_PROXY_COMMAND GIT_PROXY_IGNORE SOCKS5_PASSWD SOCKS5_USER OEBASE META_SDK_PATH TOOLCHAIN_TYPE TOOLCHAIN_BRAND TOOLCHAIN_BASE TOOLCHAIN_PATH TOOLCHAIN_PATH_ARMV5 TOOLCHAIN_PATH_ARMV7 TOOLCHAIN_PATH_ARMV8 EXTRA_TISDK_FILES TISDK_VERSION ARAGO_BRAND ARAGO_RT_ENABLE ARAGO_SYSTEST_ENABLE ARAGO_KERNEL_SUFFIX TI_SECURE_DEV_PKG_CAT TI_SECURE_DEV_PKG_AUTO TI_SECURE_DEV_PKG_K3 ARAGO_SYSVINIT SYSFW_FILE ARAGO_JAILHOUSE_ENABLE' >> "$confdir/setenv"
     fi
 }
 
@@ -937,15 +938,15 @@ EOM
 build_repo_line() {
     # clean up the layers to remove the repository name and add : divider
     temp_layers=""
-    for l in $(echo "$repo_layers" | sed "s:${name}::" | sed -e 's:^\/::')
+    for l in $(printf '%s\n' "$repo_layers" | sed "s:${name}::" | sed -e 's:^\/::')
     do
-        temp_layers="${temp_layers}$(echo "$l" | sed "s:${name}\/::"):"
+        temp_layers="${temp_layers}$(printf '%s\n' "$l" | sed "s:${name}\/::"):"
     done
 
     # Lastly clean off any trailing :
-    temp_layers=$(echo "$temp_layers" | sed 's/:$//')
+    temp_layers=$(printf '%s\n' "$temp_layers" | sed 's/:$//')
 
-    echo "$name,$uri,$branch,$commit,layers=$temp_layers"
+    printf '%s\n' "$name,$uri,$branch,$commit,layers=$temp_layers"
 }
 
 ###############
@@ -1016,9 +1017,9 @@ then
 
         save_layers
 
-        echo ""
-        echo ""
-        echo "Would you like to configure another repository? [y/n] "
+        printf '%s\n' ""
+        printf '%s\n' ""
+        printf '%s\n' "Would you like to configure another repository? [y/n] "
         read -r cont
     done
 fi
@@ -1039,7 +1040,7 @@ then
         mkdir -p "$dir"
     fi
     printf '%s\n' "$output" > "$outputfile"
-    echo "Output file is $outputfile"
+    printf '%s\n' "Output file is $outputfile"
 fi
 
 create_setenv_file
-- 
2.41.0


