Return-Path: <j-stiffler@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id A688E529B9
	for <meta-arago@arago-project.org>;
	Thu, 19 May 2016 15:16:39 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u4JFGdBZ008658
	for <meta-arago@arago-project.org>; Thu, 19 May 2016 10:16:39 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4JFGdvo008900
	for <meta-arago@arago-project.org>; Thu, 19 May 2016 10:16:39 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 19 May 2016 10:16:38 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u4JFGcGI018357;	Thu, 19 May 2016 10:16:38 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 19 May 2016 11:16:29 -0400
Message-ID: <1463670989-32676-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] sourceipk: fix git preservation against bitbake 1.30
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
X-List-Received-Date: Thu, 19 May 2016 15:16:39 -0000
Content-Type: text/plain

With previous versions of bitbake, the git repo in the workdir would
point its remote/origin to the local clone in the DL_DIR. The
sourceipk class would thus need to go to the local clone to get the
true upstream remote.

With bitbake commit 80ecd1c54d4c748cee3a7ce0d64013a346e7671e
(branch: 1.30), the workdir repo now points to the true upstream repo

This fixes the sourceipk git preservation that was broken due to this
change in bitbake. Additional changes were required in the limit git
history feature to ensure that the preserved git points to the commit
used within the build.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/classes/sourceipk.bbclass | 32 +++++++++++++----------------
 1 file changed, 14 insertions(+), 18 deletions(-)

diff --git a/meta-arago-distro/classes/sourceipk.bbclass b/meta-arago-distro/classes/sourceipk.bbclass
index 2d19a18..6e71196 100644
--- a/meta-arago-distro/classes/sourceipk.bbclass
+++ b/meta-arago-distro/classes/sourceipk.bbclass
@@ -128,7 +128,9 @@ limit_git_history() {
 
     remote=`get_remote $PWD`
 
-    git clone --depth ${SRCIPK_SHALLOW_DEPTH} --branch ${BRANCH} file://$remote $gitshallowclone
+    # Clone a shallow version of the workdir repo so that the preserved git
+    # points to the commit used in the build.
+    git clone --depth ${SRCIPK_SHALLOW_DEPTH} --branch ${BRANCH} file://$PWD/.git $gitshallowclone
 
     # remove original kernel clone since we will replace it with the shallow
     # clone
@@ -138,6 +140,16 @@ limit_git_history() {
     mv $gitshallowclone/.git $tmp_dir/${SRCIPK_INSTALL_DIR}/
     rm -rf $gitshallowclone
 
+    # Remove the local remote
+    git remote rm origin
+
+    # This is forceful, but unfortuantely, removing the origin remote does not
+    # remove all origin refs, and that causes problems.
+    rm -rf ./.git/refs/remotes/origin
+
+    # Point remote back to upstream
+    git remote add origin $remote
+
     cd -
 }
 
@@ -148,13 +160,8 @@ adjust_git() {
 
     if [ -d ".git" ]
     then
-        # Get the location of the local repository
-        local_repo=`get_remote $PWD`
-
-        if [ -d $local_repo -a "${SRCIPK_PRESERVE_GIT}" = "true" ]
+        if [ "${SRCIPK_PRESERVE_GIT}" = "true" ]
         then
-            cd $local_repo
-
             # If SRCIPK_SHALLOW_CLONE is true then make a shallow copy of the
             # git repository and then fix up the git URLs
             if [ "${SRCIPK_SHALLOW_CLONE}" == "true" ]
@@ -162,17 +169,6 @@ adjust_git() {
                 limit_git_history
             fi
 
-            # Grab actual url used to create the repository
-            remote_repo=`get_remote $PWD`
-
-            cd -
-
-            # Some crazy reason I need to add these two lines when doing a
-            # shallow copy. Otherwise, I had problems where git fetch wasn't
-            # properly fetching all the commits and extra remotes.
-            git remote rm origin
-            git remote add origin $remote_repo
-
             # Repackage the repository so its a proper clone of the original
             # (remote) git repository
             git repack -a -d
-- 
2.7.4


