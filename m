Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id E320352A1D
	for <meta-arago@arago-project.org>;
	Tue, 26 Jan 2016 03:21:18 +0000 (UTC)
Received: from gandalf.denix.org ([100.15.86.14]) by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPSA id <0O1J00A2GIN2LE10@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 25 Jan 2016 21:21:03 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=xDJgBcBrK5EN9DJ6g74wNQ==:117
	a=7aQ_Q-yQQ-AA:10 a=sozttTNsAAAA:8	a=fxJcL_dCAAAA:8
	a=yf3pfmU5zXhuSwtnu4IA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 6DE27161E18;	Mon,
	25 Jan 2016 22:21:02 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 25 Jan 2016 22:21:02 -0500
Message-id: <1453778462-1040-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] stress-ng: add 0.05.09
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
X-List-Received-Date: Tue, 26 Jan 2016 03:21:21 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-devtools/stress-ng/stress-ng_0.05.09.bb       | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-arago-extras/recipes-devtools/stress-ng/stress-ng_0.05.09.bb

diff --git a/meta-arago-extras/recipes-devtools/stress-ng/stress-ng_0.05.09.bb b/meta-arago-extras/recipes-devtools/stress-ng/stress-ng_0.05.09.bb
new file mode 100644
index 0000000..fcccc1e
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/stress-ng/stress-ng_0.05.09.bb
@@ -0,0 +1,15 @@
+SUMMARY = "stress-ng will stress test a computer system in various selectable ways"
+HOMEPAGE = "http://kernel.ubuntu.com/~cking/stress-ng/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = "http://kernel.ubuntu.com/~cking/tarballs/stress-ng/${P}.tar.gz"
+
+SRC_URI[md5sum] = "fe65047991f654ffaac3c59ea9537763"
+SRC_URI[sha256sum] = "d785b5f2df042d42c43ddfd5bbafa19151ed96f0c483d7f44c737f492b52ddd6"
+
+CFLAGS += "-Wall -Wextra -DVERSION='"$(VERSION)"' -O2"
+
+do_install() {
+	oe_runmake DESTDIR=${D} install
+}
-- 
2.2.0


