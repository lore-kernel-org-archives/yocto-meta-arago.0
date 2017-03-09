Return-Path: <anandb@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id E222152A77
	for <meta-arago@arago-project.org>;
	Thu,  9 Mar 2017 10:31:29 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v29AVTlE009666
	for <meta-arago@arago-project.org>; Thu, 9 Mar 2017 04:31:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489055489;
	bh=hrPxKIV2Ondv0nx24s07Nk3MTZwJZ18zo1xUZFmFG9Q=;
	h=From:To:CC:Subject:Date;
	b=r97DAyFNXY4aR68/BchsWzcI7iMrkzGbE5y5eYt0QHovywTJE2vQ4QvPox89TzPuu
	SBgB/JRhmXj5qTcJgzAbeuMDKa/zY/0lBKDe2Done53jjBT3wkkHHsn7g/uoTs9yv6
	sXh4lWTqQcmBGbFDVtiOSboeP7W90AKpZuuKgJfI=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v29AVTSc016783
	for <meta-arago@arago-project.org>; Thu, 9 Mar 2017 04:31:29 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 9 Mar 2017 04:31:29 -0600
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v29AVRtB005420;
	Thu, 9 Mar 2017 04:31:28 -0600
From: Anand Balagopalakrishnan <anandb@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 9 Mar 2017 16:01:26 +0530
Message-ID: <1489055486-121752-1-git-send-email-anandb@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v2 1/1] weston: restrict udev enumeration to /dev/dri/card0
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
X-List-Received-Date: Thu, 09 Mar 2017 10:31:30 -0000
Content-Type: text/plain

Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
---
 .../recipes-graphics/wayland/weston_1.11.0.bbappend      | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend
index d0691ad..60a752b 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend
@@ -2,19 +2,13 @@
 PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
 PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev libgbm mtdev"
 
-PR_append = ".arago16"
+PR_append = ".arago17"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 RDEPENDS_${PN} += "weston-conf"
 
-#SRC_URI += " \
-#	file://0001-weston1.9.0-Enabling-DRM-backend-with-multiple-displ.patch \
-#	file://0002-Weston1.9.0-Allow-visual_id-to-be-0.patch \
-#	file://0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-Q.patch \
-#	file://0004-Weston1.9.0-Fix-touch-screen-crash-issue.patch \
-#	file://0001-udev-seat-restrict-udev-enumeration-to-card0.patch \
-#	file://0001-Add-soc-performance-monitor-utilites.patch \
-#	file://0001-compositor-drm-support-RGB565-with-pixman-renderer.patch \
-#	file://0001-compositor-drm-fix-hotplug-weston-termination-proble.patch \
-#"
+
+SRC_URI += " \
+	file://0001-udev-seat-restrict-udev-enumeration-to-card0.patch \
+"
-- 
1.9.1


