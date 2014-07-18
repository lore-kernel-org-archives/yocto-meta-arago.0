Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 2D00E529F2
	for <meta-arago@arago-project.org>;
	Fri, 18 Jul 2014 18:18:02 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6III1GS018829
	for <meta-arago@arago-project.org>; Fri, 18 Jul 2014 13:18:01 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6IIHxKo007957
	for <meta-arago@arago-project.org>; Fri, 18 Jul 2014 13:18:01 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 18 Jul 2014 13:17:59 -0500
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s6IIHwU4010231;	Fri, 18 Jul 2014 13:17:59 -0500
Received: from sdit-build04.dal.design.ti.com (sdit-build04.dal.design.ti.com
	[10.247.66.55])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id s6IIHuEq029703;	Fri, 18 Jul 2014 23:47:57 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 18 Jul 2014 13:17:54 -0500
Message-ID: <1405707475-15375-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCHv2 1/4] sourceipk: allow packaging shallow git clone
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
X-List-Received-Date: Fri, 18 Jul 2014 18:18:02 -0000
Content-Type: text/plain

* Add another flag SRCIPK_SHALLOW_CLONE that will do a shallow
  clone of depth 1 to reduce the size of the git history.
    * The full history can be fetched again using either of the
      following commands based on the version of git being used
        - git pull --unshallow (New git versions)
        - git pull (older git versions)
* Clean up some of the variable names to make it more clear what
  they are storing.
* Create a generic function to determine the fetch reporitory

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
* Updated in version 2
    * Use -f option for removing alternatives file rather than
      using an if check of the file existence.
---
 meta-arago-distro/classes/sourceipk.bbclass |   97 ++++++++++++++++++++++++---
 1 file changed, 86 insertions(+), 11 deletions(-)

diff --git a/meta-arago-distro/classes/sourceipk.bbclass b/meta-arago-distro/classes/sourceipk.bbclass
index 20dda76..8fef2e9 100644
--- a/meta-arago-distro/classes/sourceipk.bbclass
+++ b/meta-arago-distro/classes/sourceipk.bbclass
@@ -61,32 +61,108 @@ SRCIPK_INCLUDE_EXTRAFILES ?= "1"
 
 SRCIPK_PRESERVE_GIT ?= "false"
 
-adjust_git() {
+# Create a shallow clone of the git repository to reduce the size of
+# the sourceipk
+SRCIPK_SHALLOW_CLONE ?= "false"
+
+# This function will return the fetch URL for a git repository passed as
+# the first parameter.
+get_remote() {
+    git_repo="$1"
+
+    if [ "$git_repo" == "" ]
+    then
+        echo "git_repo not passed to get_remote"
+        exit 1
+    fi
+
+    cd $git_repo
+
+    # Get the remote repository fetch URL
+    remote=`git remote -v | grep "(fetch)" | cut -d ' ' -f 1   | cut -c 7- | tr -d ' '`
+
+    # Since the echo'ed value of this statment is the returned value redirect
+    # the output of this command to /dev/null
+    cd - > /dev/null
+
+    # echo back the remote repository URL as the output of this function
+    echo $remote
+
+    return 0
+}
+
+# Some git repositories are very large and we do not want to ship the
+# full history.  Instead we want to limit history to reduce the size while
+# still keeping the git repository in place.  The full history can be
+# fetched using git pull --unshallow or just git pull
+# NOTE: This function depends on a git version >= 1.7.10.  It will work
+#       with older versions but the size will be larger because rather
+#       than just a single branch the limited history will be a depth of
+#       1 for all branches and tags.
+limit_git_history() {
+    # By default limit the history to 1 commit since the user can always
+    # use git pull --unshallow to fetch the rest of history.  The depth
+    # level of 1 is set to keep from tracking through all merges and
+    # pulling excess history
+    commits="1"
+
+    # Temporary directory to make shallow clones in
+    gitshallowclone="${WORKDIR}/temp-git-shallow-clone"
+
+    # Change directory to the git repository to be safe
+    cd $tmp_dir/${SRCIPK_INSTALL_DIR}
 
+    # Create a temporary directory to hold the shallow git clone
+    mkdir -p $gitshallowclone
+
+    remote=`get_remote $PWD`
+
+    git clone --depth $commits --branch ${BRANCH} file://$remote $gitshallowclone
+
+    # remove original kernel clone since we will replace it with the shallow
+    # clone
+    rm -rf $tmp_dir/${SRCIPK_INSTALL_DIR}/.git
+
+    # replace the original kernel git data with the shallow clone git data
+    mv $gitshallowclone/.git $tmp_dir/${SRCIPK_INSTALL_DIR}/
+    rm -rf $gitshallowclone
+
+    cd -
+}
+
+adjust_git() {
     orig_dir="$PWD"
 
     cd $tmp_dir/${SRCIPK_INSTALL_DIR}
 
     if [ -d ".git" ]
     then
+        # Get the location of the local repository
+        local_repo=`get_remote $PWD`
 
-        # Grab path to cloned local repository
-        old=`git remote -v | grep "(fetch)" | cut -d ' ' -f 1   | cut -c 7- | tr -d ' '`
-
-        if [ -d $old -a "${SRCIPK_PRESERVE_GIT}" = "true" ]
+        if [ -d $local_repo -a "${SRCIPK_PRESERVE_GIT}" = "true" ]
         then
-            cd $old
+            cd $local_repo
+
+            # If SRCIPK_SHALLOW_CLONE is true then make a shallow copy of the
+            # git repository and then fix up the git URLs
+            if [ "${SRCIPK_SHALLOW_CLONE}" == "true" ]
+            then
+                limit_git_history
+            fi
 
             # Grab actual url used to create the repository
-            orig=`git remote -v | grep "(fetch)" | cut -d ' ' -f 1   | cut -c 7- | tr -d ' '`
+            remote_repo=`get_remote $PWD`
 
             cd -
 
-            git remote set-url origin $orig $old
+            git remote set-url origin $remote_repo $local_repo
 
-            # Repackage the repository so its a proper clone of the original (remote) git repository
+            # Repackage the repository so its a proper clone of the original
+            # (remote) git repository
             git repack -a -d
-            rm .git/objects/info/alternates
+
+            rm -f .git/objects/info/alternates
 
         else
             rm -rf .git
@@ -95,7 +171,6 @@ adjust_git() {
     fi
 
     cd $orig_dir
-
 }
 
 # Create a README file that describes the contents of the source ipk
-- 
1.7.9.5


