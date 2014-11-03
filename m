Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id 3E0B652AD1
	for <meta-arago@arago-project.org>;
	Mon,  3 Nov 2014 18:51:38 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NEH00MC88DBLI00@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 03 Nov 2014 12:51:27 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=HrPBwPXX c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=sozttTNsAAAA:8
	a=cBzh1a_p2s0fqdiWbYgA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 3FCD520086;	Mon,
	3 Nov 2014 13:51:10 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 03 Nov 2014 13:51:08 -0500
Message-id: <1415040669-16780-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.1.2
Subject: [PATCH 1/2] packagegroup*: fix recipes for machine-specific requirement
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
X-List-Received-Date: Mon, 03 Nov 2014 18:51:38 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb       | 4 +---
 .../recipes-core/packagegroups/packagegroup-arago-gst.bb              | 4 +++-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
index 16b5df1..704e840 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
@@ -1,11 +1,9 @@
 DESCRIPTION = "Additional packages beyond console packages shared by TI SDKs"
 LICENSE = "MIT"
-PR = "r13"
+PR = "r14"
 
 inherit packagegroup
 
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
 RDEPENDS_${PN} = "\
     dbus \
     expat \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
index a5367ea..b12687f 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
@@ -1,9 +1,11 @@
 DESCRIPTION = "Task to add gstreamer and gstreamer plugins"
 LICENSE = "MIT"
-PR = "r8"
+PR = "r9"
 
 inherit packagegroup
 
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 GSTREAMER = " \
     gstreamer \
     gst-plugins-base \
-- 
2.1.2


