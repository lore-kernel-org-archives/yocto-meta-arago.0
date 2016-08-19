Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id C4F3B52996
	for <meta-arago@arago-project.org>;
	Fri, 19 Aug 2016 22:16:01 +0000 (UTC)
Received: from vz-proxy-m007.mx.aol.com ([64.236.83.14])
	by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0OC60040VGICQE00@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 19 Aug 2016 17:15:49 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=MJxOpqxZADbEbEImuSX/mw==:117
	a=7z1cN_iqozsA:10 a=sozttTNsAAAA:8	a=yStQl7zfBJgcm_oPT54A:9
Received: by 100.15.86.14 with SMTP id 35cec7e7; Fri, 19 Aug 2016 22:15:49 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id 4A4191620E0;	Fri, 19 Aug 2016 18:15:48 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 19 Aug 2016 18:15:47 -0400
Message-id: <1471644947-30790-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] busybox: enable XZ options
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
X-List-Received-Date: Fri, 19 Aug 2016 22:16:02 -0000

From: Denys Dmytriyenko <denys@ti.com>

TODO: Need to sync up defconfig with latest upstream

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/busybox/busybox/defconfig         |    4 ++--
 .../recipes-core/busybox/busybox_%.bbappend        |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/busybox/busybox/defconfig b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
index fd41aad..699fb98 100644
--- a/meta-arago-distro/recipes-core/busybox/busybox/defconfig
+++ b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
@@ -121,7 +121,7 @@ CONFIG_FEATURE_HWIB=y
 #
 # Archival Utilities
 #
-# CONFIG_FEATURE_SEAMLESS_XZ is not set
+CONFIG_FEATURE_SEAMLESS_XZ=y
 CONFIG_FEATURE_SEAMLESS_LZMA=y
 CONFIG_FEATURE_SEAMLESS_BZ2=y
 CONFIG_FEATURE_SEAMLESS_GZ=y
@@ -161,7 +161,7 @@ CONFIG_FEATURE_TAR_NOPRESERVE_TIME=y
 # CONFIG_FEATURE_LZMA_FAST is not set
 # CONFIG_LZMA is not set
 # CONFIG_UNXZ is not set
-# CONFIG_XZ is not set
+CONFIG_XZ=y
 CONFIG_UNZIP=y
 
 #
diff --git a/meta-arago-distro/recipes-core/busybox/busybox_%.bbappend b/meta-arago-distro/recipes-core/busybox/busybox_%.bbappend
index d3c258c..4221179 100644
--- a/meta-arago-distro/recipes-core/busybox/busybox_%.bbappend
+++ b/meta-arago-distro/recipes-core/busybox/busybox_%.bbappend
@@ -3,4 +3,4 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 SRC_URI_append = " file://0001-rtcwake-Allow-poweroff-with-rtcwake-command.patch "
 
-PR_append = ".arago20"
+PR_append = ".arago21"
-- 
1.7.9.5


