Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 7A7F152A33
	for <meta-arago@arago-project.org>;
	Wed,  6 Nov 2019 19:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E7D5540C0E;
	Wed,  6 Nov 2019 19:02:32 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id lDPvhD8jBmQs; Wed,  6 Nov 2019 19:02:32 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D5A3C40BF4;
	Wed,  6 Nov 2019 19:02:31 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 0C7F41742E5;
	Wed,  6 Nov 2019 14:02:29 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed,  6 Nov 2019 14:02:23 -0500
Message-Id: <1573066944-48181-9-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573066944-48181-1-git-send-email-denys@ti.com>
References: <1573066944-48181-1-git-send-email-denys@ti.com>
Subject: [RFC][PATCH 8/9] arago-tiny-image: simplify by re-using arago-image.inc
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
X-List-Received-Date: Wed, 06 Nov 2019 19:04:00 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/images/arago-tiny-image.bb        | 35 ++--------------------
 1 file changed, 3 insertions(+), 32 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-tiny-image.bb b/meta-arago-distro/recipes-core/images/arago-tiny-image.bb
index 465d322..5d1733e 100644
--- a/meta-arago-distro/recipes-core/images/arago-tiny-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-tiny-image.bb
@@ -1,16 +1,9 @@
-# Common pieces for Arago images
+ARAGO_SYSVINIT = "1"
 
-LICENSE = "MIT"
-
-COMPATIBLE_MACHINE = "ti-soc"
-
-IMAGE_FEATURES += "package-management splash"
+require arago-image.inc
 
 IMAGE_FSTYPES += "cpio"
 
-# 4KB per 1 inode should be enough
-EXTRA_IMAGECMD_ext2.gz += "-i 4096"
-
 # Install a small set of utils which can be used for diagnostics
 ARAGO_TINY_IMAGE_EXTRA_INSTALL ?= " \
 	parted \
@@ -21,31 +14,9 @@ ARAGO_TINY_IMAGE_EXTRA_INSTALL ?= " \
 	arago-feed-config \
 "
 
-IMAGE_INSTALL += " \
+IMAGE_INSTALL = " \
 	packagegroup-arago-sysvinit-boot \
 	${ARAGO_TINY_IMAGE_EXTRA_INSTALL} \
 "
 
 export IMAGE_BASENAME = "arago-tiny-image"
-
-IMAGE_LINGUAS = ""
-
-make_bootfiles_symlinks_relative() {
-    for f in "${IMAGE_ROOTFS}/boot"/*
-    do
-        [ -L "$f" ] || continue
-
-        l=$(readlink "$f")
-        if [ "${l:0:6}" == "/boot/" ]
-        then
-            ln -sf "${l##/boot/}" "$f"
-        elif ["${l:0:1}" == "/" ]
-        then
-            ln -sf "..$l" "$f"
-        fi
-    done
-}
-
-ROOTFS_POSTPROCESS_COMMAND += "make_bootfiles_symlinks_relative;"
-
-inherit core-image
-- 
2.7.4


