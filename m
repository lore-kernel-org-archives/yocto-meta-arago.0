Return-Path: <denis@denix.org>
Received: from vms173009pub.verizon.net (vms173009pub.verizon.net
	[206.46.173.9])
	by arago-project.org (Postfix) with ESMTPS id 1E3635299C
	for <meta-arago@arago-project.org>;
	Mon, 16 May 2016 15:06:46 +0000 (UTC)
Received: from vz-proxy-l002.mx.aol.com ([64.236.82.148])
	by vms173009.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O79001CWZAK3T50@vms173009.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 16 May 2016 10:06:30 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=hkQRW7prCrFMEwk2DGUM9Q==:117
	a=yrkiwgmsf1kA:10 a=sozttTNsAAAA:8	a=9h1AMVjbTNk0i0QgXcoA:9
Received: by 100.15.86.14 with SMTP id 364936ba; Mon, 16 May 2016 15:06:30 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 06CD3162005;	Mon,
	16 May 2016 11:06:20 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 16 May 2016 11:06:19 -0400
Message-id: <1463411179-3382-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] branding: start using bleeding branding for AUTOREV-ing components
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
X-List-Received-Date: Mon, 16 May 2016 15:06:46 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/branding-bleeding.inc | 9 +++++++++
 meta-arago-distro/conf/distro/include/branding-core.inc     | 7 -------
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/branding-bleeding.inc b/meta-arago-distro/conf/distro/include/branding-bleeding.inc
index 67f9f22..e946f01 100644
--- a/meta-arago-distro/conf/distro/include/branding-bleeding.inc
+++ b/meta-arago-distro/conf/distro/include/branding-bleeding.inc
@@ -1 +1,10 @@
 # Special "bleeding" branding for experimenting and testing unreleased components
+
+require branding-core.inc
+
+# Auto rev important packages to pick up latest
+SRCREV_pn-linux-ti-staging = "${AUTOREV}"
+SRCREV_pn-linux-ti-staging-rt = "${AUTOREV}"
+SRCREV_pn-linux-ti-staging-systest = "${AUTOREV}"
+SRCREV_pn-u-boot-ti-staging = "${AUTOREV}"
+SRCREV_pn-ltp-ddt = "${AUTOREV}"
diff --git a/meta-arago-distro/conf/distro/include/branding-core.inc b/meta-arago-distro/conf/distro/include/branding-core.inc
index 99bedcf..a506e3c 100644
--- a/meta-arago-distro/conf/distro/include/branding-core.inc
+++ b/meta-arago-distro/conf/distro/include/branding-core.inc
@@ -5,13 +5,6 @@
 # The policy is for the "Core" brand to be the default,
 # hence this file is mostly empty and used as a template
 
-# Auto rev important packages to pick up latest
-SRCREV_pn-linux-ti-staging = "${AUTOREV}"
-SRCREV_pn-linux-ti-staging-rt = "${AUTOREV}"
-SRCREV_pn-linux-ti-staging-systest = "${AUTOREV}"
-SRCREV_pn-u-boot-ti-staging = "${AUTOREV}"
-SRCREV_pn-ltp-ddt = "${AUTOREV}"
-
 # Lower opencl-monitor priority for now
 ALTERNATIVE_PRIORITY_pn-opencl-monitor = "1"
 
-- 
2.2.0


