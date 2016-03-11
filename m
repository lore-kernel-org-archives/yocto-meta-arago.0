Return-Path: <h-gou@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id BE184529D3
	for <meta-arago@arago-project.org>;
	Fri, 11 Mar 2016 22:02:19 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u2BM2J9d026658
	for <meta-arago@arago-project.org>; Fri, 11 Mar 2016 16:02:19 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2BM2JRo007027
	for <meta-arago@arago-project.org>; Fri, 11 Mar 2016 16:02:19 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 11 Mar 2016 16:02:19 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u2BM2I6J011570;	Fri, 11 Mar 2016 16:02:19 -0600
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 11 Mar 2016 17:02:12 -0500
Message-ID: <1457733732-18531-4-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1457733732-18531-1-git-send-email-h-gou@ti.com>
References: <1457733732-18531-1-git-send-email-h-gou@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] packagegroup-arago-gst*: add gstreamer1.0-plugins-hevc for keystone
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
X-List-Received-Date: Fri, 11 Mar 2016 22:02:20 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb | 6 +++++-
 .../recipes-core/packagegroups/packagegroup-arago-gst.bb            | 6 +++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb
index c76a2e1..8a331e4 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to build and install header and libs in sdk"
 LICENSE = "MIT"
-PR = "r11"
+PR = "r12"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -26,6 +26,10 @@ GST_1X_DEPS_append_dra7xx = " \
     gstreamer1.0-plugins-hevc-dev \
 "
 
+GST_1X_DEPS_append_keystone = " \
+    gstreamer1.0-plugins-hevc-dev \
+"
+
 RDEPENDS_${PN} = " \
     ${@base_conditional('GST_PROVIDER', '0.10', "${GST_010_DEPS}", "${GST_1X_DEPS}", d)} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
index ff71236..0ba7423 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to add gstreamer and gstreamer plugins"
 LICENSE = "MIT"
-PR = "r14"
+PR = "r15"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -32,6 +32,10 @@ GST_1X_DEPS_append_dra7xx = " \
     gstreamer1.0-plugins-hevc \
 "
 
+GST_1X_DEPS_append_keystone = " \
+    gstreamer1.0-plugins-hevc \
+"
+
 GST_PLUGINS_PREFIX = "${@base_conditional('GST_PROVIDER', '0.10', 'gst-plugins', 'gstreamer1.0-plugins', d)}"
 
 GSTREAMER_ACCEL_MM = ""
-- 
1.9.1


