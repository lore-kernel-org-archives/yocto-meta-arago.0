Return-Path: <res.sapp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13A94C3DA40
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 03:45:22 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web10.3704.1686714318384829340
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Jun 2023 20:45:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=M4gC/Cc3;
 spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: res.sapp@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6b160f3f384so3859741a34.3
        for <meta-arago@lists.yoctoproject.org>; Tue, 13 Jun 2023 20:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686714317; x=1689306317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xrZFUyPF39feiLJU0iStt3yG+Lb91ZJJpcuH6ua6kBw=;
        b=M4gC/Cc3/RIBB37KlUPB+X6HMoTi5WnIpx0Bkm1OUfnkT/tmVHLgp2XvkqOYliaPBx
         shYkwl3eT822DjGJbV5STLQl4k3qVXwAnwxbJmeP15JdrSc0vkKxhqZ2+M8o3zIrxkyb
         J5EeXUX6SW47VXXjjT8lJDVuqnoNEaOLXuMvHu4sulJD/pBPlBRdK6tLjJNTHW6vSlMa
         DHORukjgmJ52sVuaZtGgiTSeHx06cbrlmFGKe0X8IqU2vNbblWW2so8VXcvBo0XyyoNX
         BhEHjSl6u/uj3M+TlCjo71JzbXZqhq/jXSb9MFyj5racDaiJJR7fuakupjyxivJvyqvx
         xOrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686714317; x=1689306317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xrZFUyPF39feiLJU0iStt3yG+Lb91ZJJpcuH6ua6kBw=;
        b=LffwMcDaXUkAdKs4ab1Liypzfg+OijmyV/w9SfvYwBkUOdnrSHs6ikOMoYYjJY7z8K
         5WqkaGYmPgypLij0OuKFOASDTnaH5QH0sqRWRGrgOTHT2ZZweVM8cSyiiyRjGQNqskIE
         yqnjCbqnjQp4xMzKvMFM8UvSRZ7st2K6GhEMCVzuHvo80Eb71WzDfWAXmhpJMbiIwm/q
         q8xS27sPGeiCEkkZyUzq1ioutHNhLxLCq0q7W2OpGlltHPu2OOHVUYPwbDdx+3dEVh4H
         YTHniRJq5qeXs3RoTah0KyV801sFxIipPYtqZEJofmPg4O8DkGtJfKM6uB3Yu6ZQ8GMm
         JqXg==
X-Gm-Message-State: AC+VfDxHCZYPYE6BxA431cqoUqb7vN0fr4WpQRfEV5P0JlPunWc6ZpWf
	hx/db4/2pdYpB+pJlMV5joRsg3w6uUENVtxY
X-Google-Smtp-Source: ACHHUZ7ughOEy8YOVx2l9oA3dAdCD2t567NZP6J1LL0gvCGnhoJnE42iiAaAzYnq0n/bYjIUc1A2NQ==
X-Received: by 2002:a05:6830:1119:b0:6af:870c:b71d with SMTP id w25-20020a056830111900b006af870cb71dmr11271154otq.30.1686714317690;
        Tue, 13 Jun 2023 20:45:17 -0700 (PDT)
Received: from rig.lan ([104.182.101.14])
        by smtp.gmail.com with ESMTPSA id s9-20020a9d7589000000b006a662e9f074sm5367538otk.58.2023.06.13.20.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 20:45:17 -0700 (PDT)
From: Randolph Sapp <res.sapp@gmail.com>
To: denis@denix.org,
	reatmon@ti.com,
	afd@ti.com,
	nm@ti.com,
	rs@ti.com
Cc: meta-arago@lists.yoctoproject.org,
	Randolph Sapp <res.sapp@gmail.com>
Subject: [oe-layersetup][PATCHv2 08/16] oe-layertool-setup: guard all cd calls
Date: Tue, 13 Jun 2023 22:44:59 -0500
Message-ID: <20230614034507.598391-9-res.sapp@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230614034507.598391-1-res.sapp@gmail.com>
References: <20230614034507.598391-1-res.sapp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 14 Jun 2023 03:45:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14613

Make the scrip exit early if any cd calls fail in the main process.
Return 1 in the case a function fails to cd.

Signed-off-by: Randolph Sapp <res.sapp@gmail.com>
---
 oe-layertool-setup.sh | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
index a87a423..6908fe2 100755
--- a/oe-layertool-setup.sh
+++ b/oe-layertool-setup.sh
@@ -386,9 +386,8 @@ configure_repo() {
 clone_repo() {
     # check if the repo already exists.  if so then fetch the latest updates,
     # else clone it
-    if [ -d "$sourcedir/$name" ]
+    if cd "$sourcedir/$name" 2> /dev/null
     then
-        cd "$sourcedir/$name"
         "$scriptdir/git_retry.sh" fetch --all
     else
         if ! "$scriptdir/git_retry.sh" clone "$uri" "$sourcedir/$name"
@@ -405,7 +404,7 @@ get_repo_branch() {
 
     while [ "$found" = "0" ]
     do
-        cd "$sourcedir/$name"
+        cd "$sourcedir/$name" || return 1
 
         # Get a unique list of branches for the user to chose from
         # Also delete the origin/HEAD line that the -r option returns
@@ -448,7 +447,7 @@ EOM
 }
 
 checkout_branch() {
-    cd "$sourcedir/$name"
+    cd "$sourcedir/$name" || return 1
 
     # Check if a local branch already exists to track the remote branch.
     # If not then create a tracking branch and checkout the branch
@@ -474,7 +473,7 @@ checkout_branch() {
 }
 
 checkout_commit() {
-    cd "$sourcedir/$name"
+    cd "$sourcedir/$name" || return 1
     if [ "$commit" != "HEAD" ]
     then
         git checkout $commit
@@ -483,7 +482,7 @@ checkout_commit() {
 
 get_repo_commit() {
   # prompt for what commit to use with HEAD as default
-    cd "$sourcedir/$name"
+    cd "$sourcedir/$name" || return 1
 cat << EOM
 
 
@@ -517,7 +516,7 @@ EOM
 }
 
 verify_layers() {
-    cd "$sourcedir"
+    cd "$sourcedir" || return 1
     for l in $repo_layers
     do
         if [ ! -f "$sourcedir/$l/conf/layer.conf" ]
@@ -555,7 +554,7 @@ select_layers() {
         return
     fi
 
-    cd "$sourcedir"
+    cd "$sourcedir" || return 1
     # Get a count of how many layers there are
     count=$(find "$name" -name "layer.conf" | grep -c layer.conf)
 
@@ -646,7 +645,7 @@ get_oecorelayerconf() {
         return
     fi
 
-    cd "$sourcedir"
+    cd "$sourcedir" || return 1
     confs=$(find . -name "bblayers.conf.sample")
 
     done="n"
@@ -701,7 +700,7 @@ get_oecorelocalconf() {
         return
     fi
 
-    cd "$sourcedir"
+    cd "$sourcedir" || return 1
     confs=$(find . -name "local.conf.sample")
 
     done="n"
@@ -970,9 +969,9 @@ mkdir -p "$oebase"
 
 # retrive the absolute path to the oebase directory incase
 # a relative path is passed in
-cd "$oebase"
+cd "$oebase" || exit 1
 oebase=$(pwd)
-cd -
+cd - || exit 1
 
 # Populate the following variables depending on the value of oebase
 sourcedir="$oebase/sources"
@@ -1031,7 +1030,7 @@ config_oecorelocalconf
 if [ -n "$outputfile" ]
 then
     # make sure that the directory for the output file exists
-    cd "$oebase"
+    cd "$oebase" || exit 1
     dir=$(dirname "$outputfile")
     if [ ! -d "$dir" ]
     then
-- 
2.41.0


