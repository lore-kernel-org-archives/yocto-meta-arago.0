Return-Path: <g-tammana@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 33EB0520E4
	for <meta-arago@arago-project.org>;
	Wed, 28 Aug 2019 17:06:51 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7SH5nfp038592
	for <meta-arago@arago-project.org>; Wed, 28 Aug 2019 12:05:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1567011949;
	bh=QnqvGEFCg7UQtkFFxcSHtdwKRoxlnYj81ulwS/ao+wI=;
	h=From:To:CC:Subject:Date;
	b=cdENqvTJ1eK9eDswYAnFzb5ETQXOspBpIejEVo64A5FpE5e7Cxs8ojFVBqOr4cD9L
	gCTGJ/u7Nnn1mS/JvI/e5KYWjAuBhyEirEfd7jdk9DVesMpzepIaovr+sKAOwJbAmc
	O9OlokWrfZh8RKuvpEBgWn+P5P/iiTA2I47dK7rc=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7SH5ngH042696
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 28 Aug 2019 12:05:49 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 28 Aug 2019 12:05:49 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 28 Aug 2019 12:05:49 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7SH5mMf005060;
	Wed, 28 Aug 2019 12:05:48 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.77.97])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	x7SH5mZ09538; Wed, 28 Aug 2019 12:05:48 -0500 (CDT)
From: Gowtham Tammana <g-tammana@ti.com>
To: Denys Dmytriyenko <denys@ti.com>, <meta-arago@arago-project.org>
Date: Wed, 28 Aug 2019 12:07:46 -0500
Message-ID: <20190828170746.22461-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud][PATCH] weston: Remove restriction on udev enumeration
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
X-List-Received-Date: Wed, 28 Aug 2019 17:06:52 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The modesetting driver in certain instances could be enumerated later
than card0. Remove the restriction on search to just card0, as checks
are now in place to query on the modesetting capabilities on
enumerated devices.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 ...t-restrict-udev-enumeration-to-card0.patch | 39 -------------------
 .../wayland/weston_5.0.0.bbappend             |  3 +-
 2 files changed, 1 insertion(+), 41 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0001-udev-seat-restrict-udev-enumeration-to-card0.patch

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0001-udev-seat-restrict-udev-enumeration-to-card0.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0001-udev-seat-restrict-udev-enumeration-to-card0.patch
deleted file mode 100644
index 5ec9cd77..00000000
--- a/meta-arago-distro/recipes-graphics/wayland/weston/0001-udev-seat-restrict-udev-enumeration-to-card0.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From e57e9245dcb5d1349467c7fc36d153f3336f6a1a Mon Sep 17 00:00:00 2001
-From: Karthik Ramanan <a0393906@ti.com>
-Date: Mon, 12 Mar 2018 10:46:29 +0530
-Subject: [PATCH 1/4] udev-seat: restrict udev enumeration to card0
-
-In case of separate GPU and Display devices as found in embedded systems, we
-could have modeset node and render node controlled by different drivers.
-There is a distinct possibility that udev enumeration returns the DRM device
-corresponding to render node as the primary DRM device.
-
-Obviously, modeset operations cannot be done on the GPU DRM device.
-
-Restrict the udev enumeration to card0 and ensure that DRM device corresponding
-to display is returned as the primary DRM device.
-
-Upstream-Status: Pending
-
-Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
-Signed-off-by: Karthik Ramanan <a0393906@ti.com>
----
- libweston/compositor-drm.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libweston/compositor-drm.c b/libweston/compositor-drm.c
-index 1d38f05..649b4f5 100644
---- a/libweston/compositor-drm.c
-+++ b/libweston/compositor-drm.c
-@@ -2957,7 +2957,7 @@ find_primary_gpu(struct drm_backend *b, const char *seat)
- 
- 	e = udev_enumerate_new(b->udev);
- 	udev_enumerate_add_match_subsystem(e, "drm");
--	udev_enumerate_add_match_sysname(e, "card[0-9]*");
-+	udev_enumerate_add_match_sysname(e, "card0");
- 
- 	udev_enumerate_scan_devices(e);
- 	drm_device = NULL;
--- 
-1.9.1
-
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_5.0.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_5.0.0.bbappend
index 68a928ee..1bdcf7e4 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_5.0.0.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_5.0.0.bbappend
@@ -2,14 +2,13 @@
 PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
 PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev virtual/libgbm mtdev"
 
-PR_append = ".arago33"
+PR_append = ".arago34"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 RDEPENDS_${PN} += "weston-conf"
 
 SRC_URI += " \
-        file://0001-udev-seat-restrict-udev-enumeration-to-card0.patch \
         file://0002-weston-Allow-visual_id-to-be-0.patch \
         file://0003-weston-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch \
         file://0004-weston-Fix-touch-screen-crash-issue.patch \
-- 
2.23.0


