Return-Path: <j-stiffler@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 2F22752A04
	for <meta-arago@arago-project.org>;
	Mon, 16 May 2016 16:08:42 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u4GG8f1B016011
	for <meta-arago@arago-project.org>; Mon, 16 May 2016 11:08:41 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4GG8fV9022422
	for <meta-arago@arago-project.org>; Mon, 16 May 2016 11:08:41 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 16 May 2016 11:08:41 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u4GG8fGn022982;	Mon, 16 May 2016 11:08:41 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 16 May 2016 12:08:33 -0400
Message-ID: <1463414913-28544-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] arago-image: make all symlinks relative in /boot
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
X-List-Received-Date: Mon, 16 May 2016 16:08:42 -0000
Content-Type: text/plain

* In krogoth, the device trees are installed as symlinks to absolute
  paths within the filesystem.
* This breaks loading the device trees over NFS as the symlinks will
  not resolve on the NFS server.
* Therefore replace the ROOTFS_POSTPROCESS_COMMAND
  make_zimage_symlink_relative with a more general routine to make all
  symlinks in /boot relative.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/recipes-core/images/arago-image.inc | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/meta-arago-distro/recipes-core/images/arago-image.inc
index 7fb5726..af28cd0 100644
--- a/meta-arago-distro/recipes-core/images/arago-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-image.inc
@@ -21,6 +21,22 @@ export IMAGE_BASENAME = "arago-image"
 
 IMAGE_LINGUAS = ""
 
-ROOTFS_POSTPROCESS_COMMAND += "make_zimage_symlink_relative;"
+make_bootfiles_symlinks_relative() {
+    for f in "${IMAGE_ROOTFS}/boot"/*
+    do
+        [ -L "$f" ] || continue
+
+        l=$(readlink "$f")
+        if [ "${l:0:6}" == "/boot/" ]
+        then
+            ln -sf "${l##/boot/}" "$f"
+        elif ["${l:0:1}" == "/" ]
+        then
+            ln -sf "..$l" "$f"
+        fi
+    done
+}
+
+ROOTFS_POSTPROCESS_COMMAND += "make_bootfiles_symlinks_relative;"
 
 inherit core-image
-- 
2.7.4


