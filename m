Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 4D68F52090
	for <meta-arago@arago-project.org>;
	Tue, 27 Aug 2013 19:18:05 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7RJI4UQ023800
	for <meta-arago@arago-project.org>; Tue, 27 Aug 2013 14:18:04 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7RJI4O1022943
	for <meta-arago@arago-project.org>; Tue, 27 Aug 2013 14:18:04 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 27 Aug 2013 14:18:04 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7RJHxoq028646;
	Tue, 27 Aug 2013 14:18:03 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 27 Aug 2013 14:51:28 -0500
Message-ID: <1377633092-29917-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1377633092-29917-1-git-send-email-fcooper@ti.com>
References: <1377633092-29917-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 2/6 v2] sourceipk: Add ability to preserve Git repository
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
X-List-Received-Date: Tue, 27 Aug 2013 19:18:05 -0000
Content-Type: text/plain

* When a git repository is unpacked the repository located in the WORKDIR is
  cloned from the git repository located in the downloads directory.
* Various references and settings are set within the repo which makes it
  impossible for the git repository packaged by sourceipk to be useable on any
  computer other than the original computer that the sourceipk was created in.
* This patch allows the git repository to be preserved and fixed up to become
  a fully functional portable git repository.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
Version 2 changes:
Fix commit message typo and add comment removal to this patch.

 meta-arago-distro/classes/sourceipk.bbclass |   35 +++++++++++++++++++++++----
 1 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/meta-arago-distro/classes/sourceipk.bbclass b/meta-arago-distro/classes/sourceipk.bbclass
index 1844ff3..1ea0577 100644
--- a/meta-arago-distro/classes/sourceipk.bbclass
+++ b/meta-arago-distro/classes/sourceipk.bbclass
@@ -59,17 +59,42 @@ SRCIPK_SECTION ?= "${SECTION}"
 # Default SRCIPK_INCLUDE_EXTRAFILES is to include the extra files
 SRCIPK_INCLUDE_EXTRAFILES ?= "1"
 
-# Remove git repositories before packaging up the sources
-clear_git() {
+SRCIPK_PRESERVE_GIT ?= "false"
+
+adjust_git() {
+
+    orig_dir="$PWD"
 
     cd ${S}
 
     if [ -d ".git" ]
     then
-        rm -rf .git
+
+        # Grab path to cloned local repository
+        old=`git remote -v | grep "(fetch)" | cut -d ' ' -f 1   | cut -c 7- | tr -d ' '`
+
+        if [ -d $old -a "${SRCIPK_PRESERVE_GIT}" = "true" ]
+        then
+            cd $old
+
+            # Grab actual url used to create the repository
+            orig=`git remote -v | grep "(fetch)" | cut -d ' ' -f 1   | cut -c 7- | tr -d ' '`
+
+            cd -
+
+            git remote set-url origin $orig $old
+
+            # Repackage the repository so its a proper clone of the original (remote) git repository
+            git repack -a -d
+            rm .git/objects/info/alternates
+
+        else
+            rm -rf .git
+        fi
+
     fi
 
-    cd -
+    cd $orig_dir
 
 }
 
@@ -97,7 +122,7 @@ sourceipk_do_create_srcipk() {
     if [ ${CREATE_SRCIPK} != "0" ]
     then
 
-        clear_git
+        adjust_git
 
         tmp_dir="${WORKDIR}/sourceipk-tmp"
         srcipk_dir="${WORKDIR}/sourceipk-data"
-- 
1.7.0.4


