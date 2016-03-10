Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by arago-project.org (Postfix) with ESMTPS id 543B052AD3
	for <meta-arago@arago-project.org>;
	Thu, 10 Mar 2016 21:31:45 +0000 (UTC)
Received: from vz-proxy-l008.mx.aol.com ([64.236.82.152])
	by vms173007.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O3U00G3IEFTILL0@vms173007.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 10 Mar 2016 15:31:21 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=a3t/a0oOYlYu/nGe1mf8ZA==:117
	a=7OsogOcEt9IA:10 a=sozttTNsAAAA:8	a=qYbWhK9oLFz0rP6QhS4A:9
Received: by 100.15.86.14 with SMTP id 1e50deae; Thu, 10 Mar 2016 21:31:21 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 903A1161EE8;	Thu,
	10 Mar 2016 16:31:05 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 10 Mar 2016 16:31:05 -0500
Message-id: <1457645465-3011-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] image_types_md5, arago.conf: add xz.md5 support
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
X-List-Received-Date: Thu, 10 Mar 2016 21:31:46 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/classes/image_types_md5.bbclass | 6 +++++-
 meta-arago-distro/conf/distro/arago.conf          | 2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/classes/image_types_md5.bbclass b/meta-arago-distro/classes/image_types_md5.bbclass
index dfae60d..9e2c04f 100644
--- a/meta-arago-distro/classes/image_types_md5.bbclass
+++ b/meta-arago-distro/classes/image_types_md5.bbclass
@@ -1,5 +1,9 @@
 inherit image_types
 
 COMPRESSIONTYPES += "gz.md5"
-COMPRESS_CMD_gz.md5 = "md5sum ${IMAGE_NAME}.rootfs.${type}.gz > ${IMAGE_NAME}.rootfs.${type}.gz.md5"
+COMPRESS_CMD_gz.md5 = "${COMPRESS_CMD_gz}; md5sum ${IMAGE_NAME}.rootfs.${type}.gz > ${IMAGE_NAME}.rootfs.${type}.gz.md5"
 IMAGE_TYPES += "tar.gz.md5"
+
+COMPRESSIONTYPES += "xz.md5"
+COMPRESS_CMD_xz.md5 = "${COMPRESS_CMD_xz}; md5sum ${IMAGE_NAME}.rootfs.${type}.xz > ${IMAGE_NAME}.rootfs.${type}.xz.md5"
+IMAGE_TYPES += "tar.xz.md5"
diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index a967577..526e1a9 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -20,7 +20,7 @@ SDKPATH_REAL = "/usr/local/${SDK_NAME_PREFIX}-${SDK_VERSION}"
 SDKPATH = "${@"/tmp/"+"x"*96+"/"+"y"*96}"
 
 IMAGE_CLASSES += "image_types_md5"
-IMAGE_FSTYPES += "tar.gz.md5"
+IMAGE_FSTYPES += "tar.gz.md5 tar.xz.md5"
 
 # Mask any broken recipes (currently none)
 #BBMASK = ""
-- 
2.2.0


