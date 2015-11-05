Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id DC30C52A89
	for <meta-arago@arago-project.org>;
	Thu,  5 Nov 2015 02:20:56 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NXB00D3AL671520@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 04 Nov 2015 20:20:32 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=qtqOOiqGOCEA:10 a=sozttTNsAAAA:8
	a=b01i9L7eAAAA:8	a=xJAKWHeMdN_y35Y_zgEA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id A9DDA161CCC;	Wed,
	4 Nov 2015 21:20:31 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 04 Nov 2015 21:20:31 -0500
Message-id: <1446690031-12578-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] cpuset: add version 1.5.6
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
X-List-Received-Date: Thu, 05 Nov 2015 02:20:57 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-support/cpuset/cpuset_1.5.6.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-arago-extras/recipes-support/cpuset/cpuset_1.5.6.bb

diff --git a/meta-arago-extras/recipes-support/cpuset/cpuset_1.5.6.bb b/meta-arago-extras/recipes-support/cpuset/cpuset_1.5.6.bb
new file mode 100644
index 0000000..16c6ab0
--- /dev/null
+++ b/meta-arago-extras/recipes-support/cpuset/cpuset_1.5.6.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Cpuset is a Python application to make using the cpusets facilities in the Linux kernel easier"
+SECTION = "console/utils"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+SRC_URI = "https://cpuset.googlecode.com/files/${P}.tar.gz"
+
+SRC_URI[md5sum] = "50a0251c31990bb4ad63312e356ffcb5"
+SRC_URI[sha256sum] = "800d9312bccb5b9802c04661464c6d8f14be8c677f68502e82558c6cb1b03413"
+
+S = "${WORKDIR}/${P}"
+
+CLEANBROKEN = "1"
+
+inherit distutils
-- 
2.2.0


