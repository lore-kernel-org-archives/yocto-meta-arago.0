Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by arago-project.org (Postfix) with ESMTP id 2DFBB5296F
	for <meta-arago@arago-project.org>;
	Tue, 24 Sep 2013 00:38:04 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MTL00MITTQZKJ63@vms173007.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 23 Sep 2013 19:37:48 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id A20BF2004C; Mon,
	23 Sep 2013 20:37:47 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 23 Sep 2013 20:37:46 -0400
Message-id: <1379983066-10782-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCHv2] sourceipk: do not dereference symlinks when packaging data to avoid breakage
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
X-List-Received-Date: Tue, 24 Sep 2013 00:38:04 -0000

From: Denys Dmytriyenko <denys@ti.com>

* Preserve the sources in its original state, even if there are broken symlinks.
* Process patches/ directory to dereference patch files there before packaging.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/classes/sourceipk.bbclass | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/classes/sourceipk.bbclass b/meta-arago-distro/classes/sourceipk.bbclass
index 1ea0577..dbe0b70 100644
--- a/meta-arago-distro/classes/sourceipk.bbclass
+++ b/meta-arago-distro/classes/sourceipk.bbclass
@@ -160,6 +160,14 @@ sourceipk_do_create_srcipk() {
             tar -C ${SRCIPK_SRC_DIR} -cO $excludes . | tar -C $tmp_dir/${SRCIPK_INSTALL_DIR} -xpf -
         fi
 
+        # Fix up patches/ directory to contain actual patches instead of symlinks
+        if [ -e $tmp_dir/${SRCIPK_INSTALL_DIR}/patches ]
+        then
+            mv $tmp_dir/${SRCIPK_INSTALL_DIR}/patches $tmp_dir/${SRCIPK_INSTALL_DIR}/patches-links
+            cp -rL $tmp_dir/${SRCIPK_INSTALL_DIR}/patches-links $tmp_dir/${SRCIPK_INSTALL_DIR}/patches
+            rm -rf $tmp_dir/${SRCIPK_INSTALL_DIR}/patches-links
+        fi
+
         if [ ${SRCIPK_INCLUDE_EXTRAFILES} != "0" ]
         then
             sourceipk_create_readme $tmp_dir/${SRCIPK_INSTALL_DIR}/
@@ -167,7 +175,7 @@ sourceipk_do_create_srcipk() {
         fi
 
         #Write the data tarball
-        tar -C $tmp_dir --owner=0 --group=0 -chzf $srcipk_dir/data.tar.gz .
+        tar -C $tmp_dir --owner=0 --group=0 -czf $srcipk_dir/data.tar.gz .
 
         # Create the debian-binary file
         echo "2.0" > $srcipk_dir/debian-binary
-- 
1.8.3.2


