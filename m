Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id AC649529E4
	for <meta-arago@arago-project.org>;
	Fri, 14 Nov 2014 00:18:56 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NF000M7B67H4G20@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 13 Nov 2014 18:18:54 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=LdSLMYbn c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=sozttTNsAAAA:8
	a=nlfdPq-F-3h-uJ_ZzXIA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id BD2EA2008C;	Thu,
	13 Nov 2014 19:18:53 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 13 Nov 2014 19:18:53 -0500
Message-id: <1415924333-28695-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.1.2
Subject: [PATCH] nativesdk-qtbase_git.bbappend: re-add OEQt5Toolchain to SRC_URI
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
X-List-Received-Date: Fri, 14 Nov 2014 00:18:58 -0000

From: Denys Dmytriyenko <denys@ti.com>

The file is expected by do_install(), but _git version resets SRC_URI.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase_git.bbappend | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase_git.bbappend

diff --git a/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase_git.bbappend b/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase_git.bbappend
new file mode 100644
index 0000000..99f35c2
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/nativesdk-qtbase_git.bbappend
@@ -0,0 +1,6 @@
+PR_append = "-arago0"
+
+# CMake's toolchain configuration of nativesdk-qtbase
+SRC_URI += " \
+    file://OEQt5Toolchain.cmake \
+"
-- 
2.1.2


