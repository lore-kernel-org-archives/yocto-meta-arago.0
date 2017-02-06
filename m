Return-Path: <h-gou@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id C99D152AEB
	for <meta-arago@arago-project.org>;
	Mon,  6 Feb 2017 17:32:25 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v16HWEc7018480
	for <meta-arago@arago-project.org>; Mon, 6 Feb 2017 11:32:14 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v16HW9pg026717
	for <meta-arago@arago-project.org>; Mon, 6 Feb 2017 11:32:09 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 6 Feb 2017 11:32:08 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v16HW3ix029378;	Mon, 6 Feb 2017 11:32:06 -0600
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 6 Feb 2017 12:32:00 -0500
Message-ID: <1486402320-29803-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [morty/krogoth][PATCH] packagegroup-arago-gst*: add gstreamer1.0-plugins-dsp66
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
X-List-Received-Date: Mon, 06 Feb 2017 17:32:29 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb   | 4 +++-
 .../recipes-core/packagegroups/packagegroup-arago-gst.bb              | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb
index 84e7244..739371f 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to build and install header and libs in sdk"
 LICENSE = "MIT"
-PR = "r13"
+PR = "r14"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -16,10 +16,12 @@ GSTREAMER_DEPS = " \
 
 GSTREAMER_DEPS_append_dra7xx = " \
     gstreamer1.0-plugins-hevc-dev \
+    gstreamer1.0-plugins-dsp66-dev \
 "
 
 GSTREAMER_DEPS_append_keystone = " \
     gstreamer1.0-plugins-hevc-dev \
+    gstreamer1.0-plugins-dsp66-dev \
 "
 
 RDEPENDS_${PN} = " \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
index d34051e..4fc0255 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to add gstreamer and gstreamer plugins"
 LICENSE = "MIT"
-PR = "r16"
+PR = "r17"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -19,10 +19,12 @@ GSTREAMER_DEPS = " \
 
 GSTREAMER_DEPS_append_dra7xx = " \
     gstreamer1.0-plugins-hevc \
+    gstreamer1.0-plugins-dsp66 \
 "
 
 GSTREAMER_DEPS_append_keystone = " \
     gstreamer1.0-plugins-hevc \
+    gstreamer1.0-plugins-dsp66 \
 "
 
 GSTREAMER_ACCEL_MM = ""
-- 
1.9.1


