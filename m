Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id DEE2F5299F
	for <meta-arago@arago-project.org>;
	Tue, 22 Mar 2016 20:20:06 +0000 (UTC)
Received: from vz-proxy-l003.mx.aol.com ([64.236.82.150])
	by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O4G00CTVJ4YOR80@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 22 Mar 2016 15:19:46 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=0tGySW8maceftNfHUCUfCA==:117
	a=7OsogOcEt9IA:10 a=sozttTNsAAAA:8	a=Qbd34W_1eAqQqDLOa-4A:9
Received: by 100.15.86.14 with SMTP id 4cee6fe8; Tue, 22 Mar 2016 20:19:46 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 05416161F47;	Tue,
	22 Mar 2016 16:19:46 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 22 Mar 2016 16:19:45 -0400
Message-id: <1458677985-9692-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1458677985-9692-1-git-send-email-denis@denix.org>
References: <1458677985-9692-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] branding-core: disable AUTOREV-ing packages for the release
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
X-List-Received-Date: Tue, 22 Mar 2016 20:20:07 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/branding-core.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

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


