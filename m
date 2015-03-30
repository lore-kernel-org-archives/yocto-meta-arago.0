Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id 4BA42529D2
	for <meta-arago@arago-project.org>;
	Mon, 30 Mar 2015 22:16:41 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.236]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NM100LWEPV8LV30@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 30 Mar 2015 17:16:21 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=QtXpBu2Y c=1 sm=1 tr=0	a=SSUdfGXV8XCffJJ8+gLrig==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=emO1SXQWCLwA:10
	a=sozttTNsAAAA:8	a=JiZ5Zz3ktcg4vh6JznsA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 1512120177;	Mon,
	30 Mar 2015 18:16:20 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 30 Mar 2015 18:16:19 -0400
Message-id: <1427753779-747-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1427753779-747-1-git-send-email-denis@denix.org>
References: <1427753779-747-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] branding-core: stop AUTOREV-ing recipes for the release
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
X-List-Received-Date: Mon, 30 Mar 2015 22:16:42 -0000

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


