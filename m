Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id EA76452A80
	for <meta-arago@arago-project.org>;
	Fri,  4 Dec 2015 22:03:59 +0000 (UTC)
Received: from gandalf.denix.org ([100.15.86.14]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPSA id <0NYU00GJPTA54FW0@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 04 Dec 2015 16:03:41 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=xDJgBcBrK5EN9DJ6g74wNQ==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=wUQvQvOEmiQA:10 a=sozttTNsAAAA:8
	a=z-8d1-Njs5DO0OpYeHoA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 27A6E161D36;	Fri,
	4 Dec 2015 17:03:41 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 04 Dec 2015 17:03:40 -0500
Message-id: <1449266620-22489-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] branding-core: lower opencl-monitor priority, due to affected performance
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
X-List-Received-Date: Fri, 04 Dec 2015 22:04:00 -0000

From: Denys Dmytriyenko <denys@ti.com>

This will make priority of other DSP FW images (e.g. DSPDCE) higher and result
in opencl-monitor not being the default one.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/branding-core.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/branding-core.inc b/meta-arago-distro/conf/distro/include/branding-core.inc
index 6661392..de4fbe6 100644
--- a/meta-arago-distro/conf/distro/include/branding-core.inc
+++ b/meta-arago-distro/conf/distro/include/branding-core.inc
@@ -10,3 +10,6 @@ SRCREV_pn-linux-ti-staging = "${AUTOREV}"
 SRCREV_pn-linux-ti-staging-rt = "${AUTOREV}"
 SRCREV_pn-u-boot-ti-staging = "${AUTOREV}"
 SRCREV_pn-ltp-ddt = "${AUTOREV}"
+
+# Lower opencl-monitor priority for now, due to affected performance
+ALTERNATIVE_PRIORITY_pn-opencl-monitor = "1"
-- 
2.2.0


