Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id 6C2C152A7A
	for <meta-arago@arago-project.org>;
	Thu, 12 May 2016 00:56:14 +0000 (UTC)
Received: from vz-proxy-l003.mx.aol.com ([64.236.82.155])
	by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O71008RNH8WAR10@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 11 May 2016 19:55:59 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=i+tV1o3iWEoTTvx3QNPGxA==:117
	a=yrkiwgmsf1kA:10 a=sozttTNsAAAA:8	a=h0zCtIXVpdAefVAf4tIA:9
Received: by 100.15.86.14 with SMTP id 5fa0621c; Thu, 12 May 2016 00:55:59 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id D2FD4161FDF;	Wed,
	11 May 2016 20:55:43 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 11 May 2016 20:55:43 -0400
Message-id: <1463014543-22245-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] branding-core: re-enable AUTOREV-ing of packages
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
X-List-Received-Date: Thu, 12 May 2016 00:56:14 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/branding-core.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/branding-core.inc b/meta-arago-distro/conf/distro/include/branding-core.inc
index 8463ea9..99bedcf 100644
--- a/meta-arago-distro/conf/distro/include/branding-core.inc
+++ b/meta-arago-distro/conf/distro/include/branding-core.inc
@@ -6,11 +6,11 @@
 # hence this file is mostly empty and used as a template
 
 # Auto rev important packages to pick up latest
-#SRCREV_pn-linux-ti-staging = "${AUTOREV}"
-#SRCREV_pn-linux-ti-staging-rt = "${AUTOREV}"
-#SRCREV_pn-linux-ti-staging-systest = "${AUTOREV}"
-#SRCREV_pn-u-boot-ti-staging = "${AUTOREV}"
-#SRCREV_pn-ltp-ddt = "${AUTOREV}"
+SRCREV_pn-linux-ti-staging = "${AUTOREV}"
+SRCREV_pn-linux-ti-staging-rt = "${AUTOREV}"
+SRCREV_pn-linux-ti-staging-systest = "${AUTOREV}"
+SRCREV_pn-u-boot-ti-staging = "${AUTOREV}"
+SRCREV_pn-ltp-ddt = "${AUTOREV}"
 
 # Lower opencl-monitor priority for now
 ALTERNATIVE_PRIORITY_pn-opencl-monitor = "1"
-- 
2.2.0


