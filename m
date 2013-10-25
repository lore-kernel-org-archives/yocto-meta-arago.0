Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id A051A529F8
	for <meta-arago@arago-project.org>;
	Fri, 25 Oct 2013 19:38:58 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9PJcwcX015548
	for <meta-arago@arago-project.org>; Fri, 25 Oct 2013 14:38:58 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9PJcvSu026840
	for <meta-arago@arago-project.org>; Fri, 25 Oct 2013 14:38:57 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 25 Oct 2013 14:38:57 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9PJcskY030445;
	Fri, 25 Oct 2013 14:38:56 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 25 Oct 2013 15:31:52 -0500
Message-ID: <1382733112-3042-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] sourceipk: Fix git repo in copied sources not original sources
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
X-List-Received-Date: Fri, 25 Oct 2013 19:38:58 -0000
Content-Type: text/plain

* Fix the adjust_git function to be called after the copy of
  the original sources to the tmp_dir and to modify the git
  sources in the copy rather than the original.
* This also fixes an issue when trying to preserve the git
  repository for the kernel where the following would happen:
    1. sourceipk would run the first time and fix the git
       remote url in the ${S} directory
    2. during the compile phase the copy-defconfig functionality
       would try to re-package the sources.
    3. At this point the "old" directory found by sourceipk
       class would be a git:// url instead of a directory on
       the build system that pointed into the DL_DIR.
    4. This would fail the -d check and go into the else
       statement which would do rm -rf .git
    5. The .git directory would not be preserved.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 meta-arago-distro/classes/sourceipk.bbclass |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/classes/sourceipk.bbclass b/meta-arago-distro/classes/sourceipk.bbclass
index dbe0b70..b6ab37d 100644
--- a/meta-arago-distro/classes/sourceipk.bbclass
+++ b/meta-arago-distro/classes/sourceipk.bbclass
@@ -65,7 +65,7 @@ adjust_git() {
 
     orig_dir="$PWD"
 
-    cd ${S}
+    cd $tmp_dir/${SRCIPK_INSTALL_DIR}
 
     if [ -d ".git" ]
     then
@@ -122,8 +122,6 @@ sourceipk_do_create_srcipk() {
     if [ ${CREATE_SRCIPK} != "0" ]
     then
 
-        adjust_git
-
         tmp_dir="${WORKDIR}/sourceipk-tmp"
         srcipk_dir="${WORKDIR}/sourceipk-data"
         mkdir -p $tmp_dir/CONTROL
@@ -174,6 +172,10 @@ sourceipk_do_create_srcipk() {
             cp ${FILE} $tmp_dir/${SRCIPK_INSTALL_DIR}/
         fi
 
+        # Adjust the git repository if there is one.  Do this adjustment
+        # here so we don't have to modify the original sources.
+        adjust_git
+
         #Write the data tarball
         tar -C $tmp_dir --owner=0 --group=0 -czf $srcipk_dir/data.tar.gz .
 
-- 
1.7.0.4


