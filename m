Return-Path: <denis@denix.org>
Received: from vms173009pub.verizon.net (vms173009pub.verizon.net
	[206.46.173.9])
	by arago-project.org (Postfix) with ESMTPS id C510552AC8
	for <meta-arago@arago-project.org>;
	Mon,  9 May 2016 16:56:58 +0000 (UTC)
Received: from vz-proxy-l002.mx.aol.com ([64.236.82.148])
	by vms173009.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O6X00HCB5QUHY00@vms173009.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 09 May 2016 11:56:54 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=hkQRW7prCrFMEwk2DGUM9Q==:117
	a=yrkiwgmsf1kA:10 a=sozttTNsAAAA:8	a=uPDDLDfFTz0VQp_-fToA:9
Received: by 100.15.86.14 with SMTP id 62f55146; Mon, 09 May 2016 16:56:54 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id E12D5161FF3;	Mon,
	9 May 2016 12:56:53 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 09 May 2016 12:56:53 -0400
Message-id: <1462813013-19924-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1462813013-19924-1-git-send-email-denis@denix.org>
References: <1462813013-19924-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] arago.conf, branding-core: bump distro version, disable autorev for rc1
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
X-List-Received-Date: Mon, 09 May 2016 16:56:59 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf                |  2 +-
 meta-arago-distro/conf/distro/include/branding-core.inc | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 6c92514..aedbca8 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -1,6 +1,6 @@
 # Name and version of the distribution
 DISTRO_NAME = "Arago"
-DISTRO_VERSION = "2016.03"
+DISTRO_VERSION = "2016.05"
 DISTRO_FEED_URI ?= "http://gtautoftp.gt.design.ti.com"
 FEEDURIPREFIX ?= "lcpd/core-sdk/nightly/deploy/ipk/"
 
diff --git a/meta-arago-distro/conf/distro/include/branding-core.inc b/meta-arago-distro/conf/distro/include/branding-core.inc
index 99bedcf..8463ea9 100644
--- a/meta-arago-distro/conf/distro/include/branding-core.inc
+++ b/meta-arago-distro/conf/distro/include/branding-core.inc
@@ -6,11 +6,11 @@
 # hence this file is mostly empty and used as a template
 
 # Auto rev important packages to pick up latest
-SRCREV_pn-linux-ti-staging = "${AUTOREV}"
-SRCREV_pn-linux-ti-staging-rt = "${AUTOREV}"
-SRCREV_pn-linux-ti-staging-systest = "${AUTOREV}"
-SRCREV_pn-u-boot-ti-staging = "${AUTOREV}"
-SRCREV_pn-ltp-ddt = "${AUTOREV}"
+#SRCREV_pn-linux-ti-staging = "${AUTOREV}"
+#SRCREV_pn-linux-ti-staging-rt = "${AUTOREV}"
+#SRCREV_pn-linux-ti-staging-systest = "${AUTOREV}"
+#SRCREV_pn-u-boot-ti-staging = "${AUTOREV}"
+#SRCREV_pn-ltp-ddt = "${AUTOREV}"
 
 # Lower opencl-monitor priority for now
 ALTERNATIVE_PRIORITY_pn-opencl-monitor = "1"
-- 
2.2.0


