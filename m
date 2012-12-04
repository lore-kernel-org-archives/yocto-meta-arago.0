Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 2D8635298B
	for <meta-arago@arago-project.org>;
	Tue,  4 Dec 2012 06:49:05 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so3372590oag.38
	for <meta-arago@arago-project.org>;
	Mon, 03 Dec 2012 22:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=8vI8NgxLM8IFbqDm7bnlUT0mcs4z+QZQFthhHv6l6Do=;
	b=jSihLXJlc4glESd363rGeNKaY8hcGVEJjsBAGG95kWRVxG6CsRDm3uobZJXPPmiIU+
	unpt+y69lmjMXMHBbfyjqdAjJ55KN+fkrbZzxrRNbHaJSNksZ33icYVIWFHZSmCEzWPt
	Ud2vyF2jyl2O7WFnjpi90vannq/VrNeqAhQcM8PSBbWQtj2m0stZFQxqtYkiFqACT4Ra
	PQ1+e8JLuKYGRGu4+pn3yfjnXgrr+NmJhV1IW1r3GZlfvSlVzfdt6Eu0PsEKqCr0iUBL
	VOSViYe/zkxK0mwTgwDGB7+DdPCjwSXIEVt8mJc1MfIvE5ZqBX0hXlLsVI81Wh//q53Q
	4xUg==
Received: by 10.182.88.3 with SMTP id bc3mr6242631obb.8.1354603741678;
	Mon, 03 Dec 2012 22:49:01 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id h13sm291623obp.2.2012.12.03.22.49.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 22:49:01 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Tue,  4 Dec 2012 00:48:54 -0600
Message-Id: <1354603735-14377-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [for-comment][PATCH 1/2] sourceipk.bbclass: Add sdk_tweaks function
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Dec 2012 06:49:05 -0000

* Add sdk_tweaks function.
* This function does the following:
    - Correct the remote url from oe's download directory to original git
      repository specified in the SRC_URI.
    - Create a branch since oe does a checkout via SRCREV/commit id. This
      caused the repo to not be in any branch.
    - Commit any patches applied on top of the git repository

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/classes/sourceipk.bbclass |   70 +++++++++++++++++++++++++++
 1 files changed, 70 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/classes/sourceipk.bbclass b/meta-arago-distro/classes/sourceipk.bbclass
index 09d6eb8..0b5cbdd 100644
--- a/meta-arago-distro/classes/sourceipk.bbclass
+++ b/meta-arago-distro/classes/sourceipk.bbclass
@@ -56,6 +56,12 @@ SRCIPK_SECTION ?= "${SECTION}"
 # Default SRCIPK_INCLUDE_EXTRAFILES is to include the extra files
 SRCIPK_INCLUDE_EXTRAFILES ?= "1"
 
+# Commit any changes to the git repository due to patches and create a new
+# SDK branch
+CREATE_SDK_BRANCH ?= "1"
+SDK_BRANCH_NAME ?= "sdk_05.06.00.00"
+SDK_BRANCH_COMMIT_MESSAGE = "Commit all patches added on top of the git repository"
+
 # Create a README file that describes the contents of the source ipk
 sourceipk_create_readme() {
     readme="$1/README.${PN}-src"
@@ -71,6 +77,68 @@ sourceipk_create_readme() {
     echo "      the \"patches\" directory" >> $readme
 }
 
+# Switch the remote repository pointed to by git from the oe's download
+# directory to the original git repository specified by the SRC_URI
+sdk_tweaks() {
+
+    source_location=$1
+    save_location=$PWD
+
+    cd $source_location
+
+    if [ -d ".git" ]
+    then
+        # Grab the location of the tracked repository
+        orig_location=`git remote -v | grep fetch | cut -c8- | rev | cut -c9- | rev`
+
+        # Check if the location of the tracked repository is on the host
+        # filesystem
+        if [ -d $orig_location ]
+        then
+            cd ${orig_location}
+            orig_url=`git remote -v | grep fetch | cut -c8- | rev | cut -c9- | rev`
+
+            cd $source_location
+            git remote set-url origin ${orig_url}
+        fi
+
+        if [ ${CREATE_SDK_BRANCH} != "0" ]
+        then
+            current_branch=`git branch | grep \* | cut -b 1-2 --complement`
+
+            if [ "$current_branch" != "${SDK_BRANCH_NAME}" ]
+            then
+                # Create SDK specific branch
+                git checkout -b ${SDK_BRANCH_NAME} > /dev/null 2>&1
+            fi
+
+            # Commit any changes to the git repository due to patches
+
+            # Check to see if the work directory is clean or dirty
+            if [ -n "$(git status --porcelain)" ]
+            then
+                git add -A
+
+                if [ "$current_branch" = "${SDK_BRANCH_NAME}" ]
+                then
+                    # Amend the commit if this function was ran more than once
+                    git commit --amend -m "${SDK_BRANCH_COMMIT_MESSAGE}"  > /dev/null 2>&1
+                else
+                    git commit -m "${SDK_BRANCH_COMMIT_MESSAGE}"  > /dev/null 2>&1
+                fi
+            fi
+        fi
+    fi
+
+    cd $save_location
+}
+
+do_change_origin() {
+   sdk_tweaks "${S}"
+}
+
+EXPORT_FUNCTIONS do_change_origin
+
 # Create the source ipk file.  The ipk is manually created here instead
 # of using the normal ipk system because some recipes will over write
 # the PACKAGES variable.  Thus if this class added a -src package
@@ -79,6 +147,8 @@ sourceipk_create_readme() {
 sourceipk_do_create_srcipk() {
     if [ ${CREATE_SRCIPK} != "0" ]
     then
+
+        do_change_origin
         tmp_dir="${WORKDIR}/sourceipk-tmp"
         srcipk_dir="${WORKDIR}/sourceipk-data"
         mkdir -p $tmp_dir/CONTROL
-- 
1.7.0.4


