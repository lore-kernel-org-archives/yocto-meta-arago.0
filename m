Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 01B9652981
	for <meta-arago@arago-project.org>;
	Wed, 13 Aug 2014 19:46:21 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7DJkLEu028743
	for <meta-arago@arago-project.org>; Wed, 13 Aug 2014 14:46:21 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7DJkLMV002313
	for <meta-arago@arago-project.org>; Wed, 13 Aug 2014 14:46:21 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 13 Aug 2014 14:46:20 -0500
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s7DJkJbo005400;	Wed, 13 Aug 2014 14:46:20 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id s7DJkFTs012731;	Thu, 14 Aug 2014 01:16:18 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 13 Aug 2014 14:46:09 -0500
Message-ID: <1407959172-16985-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1407959172-16985-1-git-send-email-fcooper@ti.com>
References: <1407959172-16985-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 3/6] weston: Add global environment variable script
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
X-List-Received-Date: Wed, 13 Aug 2014 19:46:22 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* There are important Wayland environment variables that needs to be set and
  those variables are only being set within Matrix's init script even though this
  should be set globally.
* Create a wayland_env.sh that contains these Qt specific environment variables
  and install it into /etc/profile.d which will insure these environment variables
  are global and the default.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-graphics/wayland/files/wayland_env.sh  |    6 ++++++
 .../recipes-graphics/wayland/weston_1.4.0.bbappend |   17 ++++++++++++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/files/wayland_env.sh

diff --git a/meta-arago-extras/recipes-graphics/wayland/files/wayland_env.sh b/meta-arago-extras/recipes-graphics/wayland/files/wayland_env.sh
new file mode 100644
index 0000000..201e264
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/wayland/files/wayland_env.sh
@@ -0,0 +1,6 @@
+#!/bin/sh
+
+### Wayland Environment Variables ###
+
+export XDG_RUNTIME_DIR=/run/user/root
+export WAYLAND_DISPLAY=wayland-0
diff --git a/meta-arago-extras/recipes-graphics/wayland/weston_1.4.0.bbappend b/meta-arago-extras/recipes-graphics/wayland/weston_1.4.0.bbappend
index d9e6108..5b499ba 100644
--- a/meta-arago-extras/recipes-graphics/wayland/weston_1.4.0.bbappend
+++ b/meta-arago-extras/recipes-graphics/wayland/weston_1.4.0.bbappend
@@ -1,4 +1,19 @@
 # When configured for fbdev compositor, make it the default
 PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
 
-PR_append = "-arago0"
+PR_append = "-arago1"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+
+SRC_URI += "file://wayland_env.sh"
+
+# Add custom Arago Wayland Environment script file
+do_install_append () {
+    install -d ${D}${sysconfdir}/profile.d
+    install -m 0644 ${WORKDIR}/wayland_env.sh ${D}${sysconfdir}/profile.d/
+}
+
+PACKAGES += "${PN}-conf"
+
+FILES_${PN}-conf += "${sysconfdir}/profile.d/*"
+RDEPENDS_${PN} += "${PN}-conf"
-- 
1.7.9.5


