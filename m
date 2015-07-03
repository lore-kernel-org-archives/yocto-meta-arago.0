Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id 1FB4752AB6
	for <meta-arago@arago-project.org>;
	Fri,  3 Jul 2015 03:02:36 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NQW001OM5S37RK0@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 02 Jul 2015 22:02:35 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=S6gku9YP c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=zOBTXjUuO1YA:10
	a=sozttTNsAAAA:8	a=RczyuyoLjq4lrsHHyVEA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 18DE9161AE5;	Thu,
	2 Jul 2015 23:02:16 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 02 Jul 2015 23:01:55 -0400
Message-id: <1435892533-6046-37-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1435892533-6046-1-git-send-email-denis@denix.org>
References: <1435892533-6046-1-git-send-email-denis@denix.org>
Subject: [PATCH 36/54] libnl: install netlink-private headers
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
X-List-Received-Date: Fri, 03 Jul 2015 03:02:37 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-support/libnl/libnl_3.2.25.bbappend | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 meta-arago-distro/recipes-support/libnl/libnl_3.2.25.bbappend

diff --git a/meta-arago-distro/recipes-support/libnl/libnl_3.2.25.bbappend b/meta-arago-distro/recipes-support/libnl/libnl_3.2.25.bbappend
new file mode 100644
index 0000000..4885c7d
--- /dev/null
+++ b/meta-arago-distro/recipes-support/libnl/libnl_3.2.25.bbappend
@@ -0,0 +1,8 @@
+PR_append = "-arago0"
+
+do_install_append() {
+#   Install private files to allow libnl extensions
+    install -d ${D}${includedir}/netlink-private
+    cp -r ${S}/include/netlink-private/cache-api.h ${D}${includedir}/netlink-private/
+    cp -r ${S}/include/netlink-private/object-api.h ${D}${includedir}/netlink-private/
+}
-- 
2.2.0


