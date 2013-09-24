Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 31F775296F
	for <meta-arago@arago-project.org>;
	Tue, 24 Sep 2013 00:37:29 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8O0bQ9V027626
	for <meta-arago@arago-project.org>; Mon, 23 Sep 2013 19:37:26 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8O0bQoi019829
	for <meta-arago@arago-project.org>; Mon, 23 Sep 2013 19:37:26 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 23 Sep 2013 19:37:26 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8O0bN0k007536;
	Mon, 23 Sep 2013 19:37:24 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 23 Sep 2013 20:19:54 -0500
Message-ID: <1379985594-25515-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] sourceipk.bbclass: Dereference sym links located in patches directory
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
X-List-Received-Date: Tue, 24 Sep 2013 00:37:33 -0000
Content-Type: text/plain

* Latest kernel sources included symbolic links that were broken and caused the
  tar command to fail.
* In certain circumstances broken symbolic links are valid and should be
  packaged up.
* However, any patch located in the "patches" directory should be dereference
* since the original file is located in the recipe's WORKDIR.
* Therefore, the sym link will be broken when accessed on a different computer.
* By using the dereference option with the cp command the patches directory can
  be dereferenced.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/classes/sourceipk.bbclass |   12 +++++++++++-
 1 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/classes/sourceipk.bbclass b/meta-arago-distro/classes/sourceipk.bbclass
index 1ea0577..3086670 100644
--- a/meta-arago-distro/classes/sourceipk.bbclass
+++ b/meta-arago-distro/classes/sourceipk.bbclass
@@ -166,8 +166,18 @@ sourceipk_do_create_srcipk() {
             cp ${FILE} $tmp_dir/${SRCIPK_INSTALL_DIR}/
         fi
 
+        # Dereference symbolic links to patches that are stored in patches directory
+        if [ -d "$tmp_dir/${SRCIPK_INSTALL_DIR}/patches" ]
+        then
+
+            mv $tmp_dir/${SRCIPK_INSTALL_DIR}/patches $tmp_dir/${SRCIPK_INSTALL_DIR}/patches_bak
+            cp -rL $tmp_dir/${SRCIPK_INSTALL_DIR}/patches_bak $tmp_dir/${SRCIPK_INSTALL_DIR}/patches
+            rm -rf $tmp_dir/${SRCIPK_INSTALL_DIR}/patches_bak
+        fi
+
+
         #Write the data tarball
-        tar -C $tmp_dir --owner=0 --group=0 -chzf $srcipk_dir/data.tar.gz .
+        tar -C $tmp_dir --owner=0 --group=0 -czf $srcipk_dir/data.tar.gz .
 
         # Create the debian-binary file
         echo "2.0" > $srcipk_dir/debian-binary
-- 
1.7.0.4


