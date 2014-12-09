Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id 7B512529BE
	for <meta-arago@arago-project.org>;
	Tue,  9 Dec 2014 15:19:55 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NGB003OYMK5JC00@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 09 Dec 2014 09:19:18 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=AKpDk7pY c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=A92cGCtB03wA:10
	a=sozttTNsAAAA:8 a=xq3W2uTSAAAA:8	a=fudJ3tK4Hf3QrM1WTl8A:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 3B1CA2018F;	Tue,
	9 Dec 2014 10:19:17 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 09 Dec 2014 10:19:16 -0500
Message-id: <1418138356-18436-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.1.2
Subject: [PATCH] v4l-utils, packagegroup-arago-test: add v4l-utils and v4l2-compliance
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
X-List-Received-Date: Tue, 09 Dec 2014 15:19:55 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-test.bb          | 3 ++-
 .../recipes-multimedia/v4l2apps/v4l-utils_1.0.1.bbappend           | 7 +++++++
 2 files changed, 9 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-multimedia/v4l2apps/v4l-utils_1.0.1.bbappend

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
index 6b67ccb..6af1321 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Extended task to get System Test specific apps"
 LICENSE = "MIT"
-PR = "r22"
+PR = "r23"
 
 inherit packagegroup
 
@@ -22,6 +22,7 @@ ARAGO_TEST = "\
     yavta \
     rng-tools \
     perf \
+    v4l-utils \
     "
 
 ARAGO_TI_TEST = "\
diff --git a/meta-arago-distro/recipes-multimedia/v4l2apps/v4l-utils_1.0.1.bbappend b/meta-arago-distro/recipes-multimedia/v4l2apps/v4l-utils_1.0.1.bbappend
new file mode 100644
index 0000000..bda8cae
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/v4l2apps/v4l-utils_1.0.1.bbappend
@@ -0,0 +1,7 @@
+SRC_URI = "git://linuxtv.org/v4l-utils.git"
+
+SRCREV = "3719cef229379f1f2cb2fe61f2359bdac6cff6b0"
+
+S = "${WORKDIR}/git"
+
+PR_append = "-arago0"
-- 
2.1.2


