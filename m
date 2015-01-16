Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id 5429E529D3
	for <meta-arago@arago-project.org>;
	Fri, 16 Jan 2015 22:49:49 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NIA00JNGKQKU810@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 16 Jan 2015 16:49:33 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=D9vw8UVm c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=YNv0rlydsVwA:10
	a=sozttTNsAAAA:8	a=JiZ5Zz3ktcg4vh6JznsA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id B38AE20150;	Fri,
	16 Jan 2015 17:49:32 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 16 Jan 2015 17:49:28 -0500
Message-id: <1421448569-27179-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1421448569-27179-1-git-send-email-denis@denix.org>
References: <1421448569-27179-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/3] branding-core: disable AUTOREV for the release
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
X-List-Received-Date: Fri, 16 Jan 2015 22:49:49 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/branding-core.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/branding-core.inc b/meta-arago-distro/conf/distro/include/branding-core.inc
index b759469..311998b 100644
--- a/meta-arago-distro/conf/distro/include/branding-core.inc
+++ b/meta-arago-distro/conf/distro/include/branding-core.inc
@@ -6,6 +6,6 @@
 # hence this file is mostly empty and used as a template
 
 # Auto rev important packages to pick up latest
-SRCREV_pn-linux-ti-staging = "${AUTOREV}"
-SRCREV_pn-u-boot-ti-staging = "${AUTOREV}"
-SRCREV_pn-ltp-ddt = "${AUTOREV}"
+#SRCREV_pn-linux-ti-staging = "${AUTOREV}"
+#SRCREV_pn-u-boot-ti-staging = "${AUTOREV}"
+#SRCREV_pn-ltp-ddt = "${AUTOREV}"
-- 
2.2.0


