Return-Path: <a0850405@a0850405-off1>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id F1F0D52AA7
	for <meta-arago@arago-project.org>;
	Thu,  5 Feb 2015 15:02:47 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t15F2kKa011089
	for <meta-arago@arago-project.org>; Thu, 5 Feb 2015 09:02:46 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t15F2jYQ024539
	for <meta-arago@arago-project.org>; Thu, 5 Feb 2015 09:02:45 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 5 Feb 2015 09:02:45 -0600
Received: from a0850405-off1 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t15F2jn6005286;
	Thu, 5 Feb 2015 09:02:45 -0600
Received: from a0850405 by a0850405-off1 with local (Exim 4.82)	(envelope-from
	<a0850405@a0850405-off1>)	id 1YJNx6-0000KQ-VN;
	Thu, 05 Feb 2015 10:02:45 -0500
From: Carlos Hernandez <ceh@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 5 Feb 2015 10:02:33 -0500
Message-ID: <1423148553-1225-1-git-send-email-ceh@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] busybox/defconfig: Enable options required by LAVA
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
X-List-Received-Date: Thu, 05 Feb 2015 15:02:48 -0000
Content-Type: text/plain

Linaro's Test Framework (LAVA) requires httpd and other options
enabled in busybox. Enable them so LAVA tests can be run on Arago
images.

Signed-off-by: Carlos Hernandez <ceh@ti.com>
---
 meta-arago-distro/recipes-core/busybox/busybox/defconfig | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/recipes-core/busybox/busybox/defconfig b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
index 2d54b83..e0d6540 100644
--- a/meta-arago-distro/recipes-core/busybox/busybox/defconfig
+++ b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
@@ -135,8 +135,8 @@ CONFIG_CPIO=y
 # CONFIG_FEATURE_CPIO_O is not set
 # CONFIG_FEATURE_CPIO_P is not set
 # CONFIG_DPKG is not set
-# CONFIG_DPKG_DEB is not set
-# CONFIG_FEATURE_DPKG_DEB_EXTRACT_ONLY is not set
+CONFIG_DPKG_DEB=y
+CONFIG_FEATURE_DPKG_DEB_EXTRACT_ONLY=y
 CONFIG_GUNZIP=y
 CONFIG_GZIP=y
 # CONFIG_FEATURE_GZIP_LONG_OPTIONS is not set
@@ -154,7 +154,7 @@ CONFIG_FEATURE_TAR_GNU_EXTENSIONS=y
 # CONFIG_FEATURE_TAR_LONG_OPTIONS is not set
 # CONFIG_FEATURE_TAR_TO_COMMAND is not set
 # CONFIG_FEATURE_TAR_UNAME_GNAME is not set
-# CONFIG_FEATURE_TAR_NOPRESERVE_TIME is not set
+CONFIG_FEATURE_TAR_NOPRESERVE_TIME=y
 # CONFIG_FEATURE_TAR_SELINUX is not set
 # CONFIG_UNCOMPRESS is not set
 # CONFIG_UNLZMA is not set
@@ -700,7 +700,7 @@ CONFIG_MICROCOM=y
 # CONFIG_RFKILL is not set
 # CONFIG_RUNLEVEL is not set
 # CONFIG_RX is not set
-# CONFIG_SETSID is not set
+CONFIG_SETSID=y
 CONFIG_STRINGS=y
 # CONFIG_TASKSET is not set
 # CONFIG_FEATURE_TASKSET_FANCY is not set
@@ -744,7 +744,7 @@ CONFIG_FEATURE_BRCTL_SHOW=y
 # CONFIG_FTPPUT is not set
 # CONFIG_FEATURE_FTPGETPUT_LONG_OPTIONS is not set
 CONFIG_HOSTNAME=y
-# CONFIG_HTTPD is not set
+CONFIG_HTTPD=y
 # CONFIG_FEATURE_HTTPD_RANGES is not set
 # CONFIG_FEATURE_HTTPD_USE_SENDFILE is not set
 # CONFIG_FEATURE_HTTPD_SETUID is not set
@@ -845,7 +845,7 @@ CONFIG_UDHCP_DEBUG=0
 # CONFIG_FEATURE_UDHCP_8021Q is not set
 CONFIG_UDHCPC_DEFAULT_SCRIPT="/usr/share/udhcpc/default.script"
 CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=80
-CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-R -n"
+CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-R -b"
 CONFIG_UDPSVD=y
 CONFIG_VCONFIG=y
 CONFIG_WGET=y
-- 
1.9.1


