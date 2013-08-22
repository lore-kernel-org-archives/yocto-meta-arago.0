Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id BC46152A93
	for <meta-arago@arago-project.org>;
	Thu, 22 Aug 2013 21:38:43 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7MLcg6W008248
	for <meta-arago@arago-project.org>; Thu, 22 Aug 2013 16:38:42 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7MLcgsm028179
	for <meta-arago@arago-project.org>; Thu, 22 Aug 2013 16:38:42 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 22 Aug 2013 16:38:42 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7MLca8e016403;
	Thu, 22 Aug 2013 16:38:40 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 22 Aug 2013 17:10:31 -0500
Message-ID: <1377209433-10830-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1377209433-10830-1-git-send-email-fcooper@ti.com>
References: <1377209433-10830-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 2/4] sourceipk: Add ability to preserve Git repository
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
X-List-Received-Date: Thu, 22 Aug 2013 21:38:43 -0000
Content-Type: text/plain

* When a git repository is unpacked the repository located in the WORKDIR is
  cloned from the git repository located in the downloads directory.
* Various references and settings are set within the repo which makes it
  impossible for the git repository packaged by sourceipk to be useable on any
  computer other than the original computer that the sourceipk was created in.
* This patche allows the git repository to be preserved and fixed up to become
  a fully functional portable git repository.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/classes/sourceipk.bbclass |   34 +++++++++++++++++++++++---
 1 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/classes/sourceipk.bbclass b/meta-arago-distro/classes/sourceipk.bbclass
index 1844ff3..0f0c633 100644
--- a/meta-arago-distro/classes/sourceipk.bbclass
+++ b/meta-arago-distro/classes/sourceipk.bbclass
@@ -59,17 +59,43 @@ SRCIPK_SECTION ?= "${SECTION}"
 # Default SRCIPK_INCLUDE_EXTRAFILES is to include the extra files
 SRCIPK_INCLUDE_EXTRAFILES ?= "1"
 
+SRCIPK_PRESERVE_GIT ?= "false"
+
 # Remove git repositories before packaging up the sources
-clear_git() {
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
 
@@ -97,7 +123,7 @@ sourceipk_do_create_srcipk() {
     if [ ${CREATE_SRCIPK} != "0" ]
     then
 
-        clear_git
+        adjust_git
 
         tmp_dir="${WORKDIR}/sourceipk-tmp"
         srcipk_dir="${WORKDIR}/sourceipk-data"
-- 
1.7.0.4


