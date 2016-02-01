Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id 406D2529C7
	for <meta-arago@arago-project.org>;
	Mon,  1 Feb 2016 20:57:02 +0000 (UTC)
Received: from gandalf.denix.org ([100.15.86.14]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPSA id <0O1V003RQZI7FMV0@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 01 Feb 2016 14:56:46 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=xDJgBcBrK5EN9DJ6g74wNQ==:117
	a=jFJIQSaiL_oA:10 a=sozttTNsAAAA:8	a=YZRA6BItdeVLk80DytoA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 28930161E4E;	Mon,
	1 Feb 2016 15:56:31 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 01 Feb 2016 15:56:30 -0500
Message-id: <1454360190-6501-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1454360190-6501-1-git-send-email-denis@denix.org>
References: <1454360190-6501-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] branding-core.inc: disable "sgx" in preparation for DDK 1.14 merge
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
X-List-Received-Date: Mon, 01 Feb 2016 20:57:03 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/branding-core.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/branding-core.inc b/meta-arago-distro/conf/distro/include/branding-core.inc
index de4fbe6..ee3e34d 100644
--- a/meta-arago-distro/conf/distro/include/branding-core.inc
+++ b/meta-arago-distro/conf/distro/include/branding-core.inc
@@ -13,3 +13,7 @@ SRCREV_pn-ltp-ddt = "${AUTOREV}"
 
 # Lower opencl-monitor priority for now, due to affected performance
 ALTERNATIVE_PRIORITY_pn-opencl-monitor = "1"
+
+# Temporarily disable "sgx" machine feature for all SOCs while building
+# latest 4.1 integration kernel, until DDK 1.14 merges are finished
+MACHINE_FEATURES := "${@d.getVar('MACHINE_FEATURES', True).replace('sgx', '')}"
-- 
2.2.0


