Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTP id 72DF052A7A
	for <meta-arago@arago-project.org>;
	Wed, 26 Mar 2014 19:57:09 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N32005GH7EOVY40@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 26 Mar 2014 14:56:53 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 0ECF0201CF; Wed,
	26 Mar 2014 15:56:48 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 26 Mar 2014 15:56:42 -0400
Message-id: <1395863802-31820-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] qt4-embedded-gles: skip package when sgx is not set in MACHINE_FEATURES
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
X-List-Received-Date: Wed, 26 Mar 2014 19:57:09 -0000

From: Denys Dmytriyenko <denys@ti.com>

qt4-embedded-gles depends on virtual/egl and libgles-omap3, but the latter has
strict COMPATIBLE_MACHINE setting. Latest versions of BitBake report these
missing dependencies as error during parsing, but treat as non-critical error
and proceeds with the build. Unfortunately, the return code is non-zero, even
though there were 0 build errors. One way to resolve this is to set similar
COMPATIBLE_MACHINE list for qt4-embedded-gles recipe, or check for "sgx" flag
in MACHINE_FEATURES.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-qt/qt4/qt4-embedded-gles_4.8.5.bbappend         | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-qt/qt4/qt4-embedded-gles_4.8.5.bbappend b/meta-arago-distro/recipes-qt/qt4/qt4-embedded-gles_4.8.5.bbappend
index f9e5810..e7a1dad 100644
--- a/meta-arago-distro/recipes-qt/qt4/qt4-embedded-gles_4.8.5.bbappend
+++ b/meta-arago-distro/recipes-qt/qt4/qt4-embedded-gles_4.8.5.bbappend
@@ -1,3 +1,14 @@
 require arago-qt4.inc
 
-PR := "${PR}.0"
+PR := "${PR}.1"
+
+# Some deps are missing when sgx is not set, skip this package
+python __anonymous() {
+    features = bb.data.getVar("MACHINE_FEATURES", d, 1)
+    if not features:
+        return
+    pkgn = bb.data.getVar("PN", d, 1)
+    pkgv = bb.data.getVar("PV", d, 1)
+    if "sgx" not in features:
+        raise bb.parse.SkipPackage('qt4-embedded-gles needs dependencies derived from "sgx" in MACHINE_FEATURES')
+}
-- 
1.8.3.2


