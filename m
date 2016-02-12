Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by arago-project.org (Postfix) with ESMTPS id 0C7D7529C2
	for <meta-arago@arago-project.org>;
	Fri, 12 Feb 2016 23:04:59 +0000 (UTC)
Received: from vz-proxy-l003.mx.aol.com ([64.236.82.148])
	by vms173013.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O2G00MSMIS6F350@vms173013.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 12 Feb 2016 17:04:55 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=hkQRW7prCrFMEwk2DGUM9Q==:117
	a=jFJIQSaiL_oA:10 a=sozttTNsAAAA:8	a=ClFGDA3YILnpzZsoEMAA:9
Received: by 100.15.86.14 with SMTP id 6abdd119; Fri, 12 Feb 2016 23:04:54 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id C05AC161E9A;	Fri,
	12 Feb 2016 18:04:53 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 12 Feb 2016 18:04:52 -0500
Message-id: <1455318293-30510-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH 1/2] busybox: enable more options for ps
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
X-List-Received-Date: Fri, 12 Feb 2016 23:05:03 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/busybox/busybox/defconfig  | 4 ++--
 meta-arago-distro/recipes-core/busybox/busybox_%.bbappend | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/busybox/busybox/defconfig b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
index 1eb9efc..2f50ad2 100644
--- a/meta-arago-distro/recipes-core/busybox/busybox/defconfig
+++ b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
@@ -898,8 +898,8 @@ CONFIG_PIDOF=y
 # CONFIG_PKILL is not set
 CONFIG_PS=y
 CONFIG_FEATURE_PS_WIDE=y
-# CONFIG_FEATURE_PS_TIME is not set
-# CONFIG_FEATURE_PS_ADDITIONAL_COLUMNS is not set
+CONFIG_FEATURE_PS_TIME=y
+CONFIG_FEATURE_PS_ADDITIONAL_COLUMNS=y
 # CONFIG_FEATURE_PS_UNUSUAL_SYSTEMS is not set
 CONFIG_RENICE=y
 CONFIG_BB_SYSCTL=y
diff --git a/meta-arago-distro/recipes-core/busybox/busybox_%.bbappend b/meta-arago-distro/recipes-core/busybox/busybox_%.bbappend
index 7c1193d..6e4e2aa 100644
--- a/meta-arago-distro/recipes-core/busybox/busybox_%.bbappend
+++ b/meta-arago-distro/recipes-core/busybox/busybox_%.bbappend
@@ -1,7 +1,7 @@
 # look for files in this layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PR_append = "-arago17"
+PR_append = "-arago18"
 
 SRC_URI += " \
 	file://inetd \
-- 
2.2.0


