Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id 47C455299E
	for <meta-arago@arago-project.org>;
	Tue, 17 Mar 2015 00:27:49 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.236]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NLB00JZFYM95Z80@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 16 Mar 2015 19:27:46 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=OqT4EJ7o c=1 sm=1 tr=0	a=SSUdfGXV8XCffJJ8+gLrig==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=emO1SXQWCLwA:10
	a=sozttTNsAAAA:8 a=NEAV23lmAAAA:8	a=fiCaFBho53mCJS7AwV4A:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 6C304200F0;	Mon,
	16 Mar 2015 20:27:45 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 16 Mar 2015 20:27:43 -0400
Message-id: <1426552064-10965-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH 1/2] smcroute: add 2.0.0 version
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
X-List-Received-Date: Tue, 17 Mar 2015 00:27:54 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-extended/smcroute/smcroute_2.0.0.bb             | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-arago-extras/recipes-extended/smcroute/smcroute_2.0.0.bb

diff --git a/meta-arago-extras/recipes-extended/smcroute/smcroute_2.0.0.bb b/meta-arago-extras/recipes-extended/smcroute/smcroute_2.0.0.bb
new file mode 100644
index 0000000..256feb5
--- /dev/null
+++ b/meta-arago-extras/recipes-extended/smcroute/smcroute_2.0.0.bb
@@ -0,0 +1,13 @@
+SUMMARY = "A static multicast route tool"
+HOMEPAGE = "https://github.com/troglobit/smcroute"
+SECTION = "console/network"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
+
+SRCREV = "d6280e64b27d5a4bd7f37dac36b455f4ae5f9ab3"
+
+SRC_URI = "git://github.com/troglobit/smcroute.git;branch=master;protocol=git"
+
+S = "${WORKDIR}/git"
+
+inherit autotools
-- 
2.2.0


