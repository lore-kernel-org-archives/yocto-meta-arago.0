Return-Path: <karthik.ramanan@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id AA17752A27
	for <meta-arago@arago-project.org>;
	Mon, 13 Mar 2017 18:31:51 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2DIVpIX004010
	for <meta-arago@arago-project.org>; Mon, 13 Mar 2017 13:31:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489429911;
	bh=ariJ3qLxAEWevt6O7a5959eAGMGCaSZZq9gaBnUrBEA=;
	h=From:To:CC:Subject:Date;
	b=D/PTsZXmhBxbvXDviR3A3ZXB3uRqH2/arqR4rsHLx5WOhDHw6crxwMf8LrvSMa0P4
	BZSC6ynF82+WAyMdkOpnNv/bqXHMp3dmfYbXscXu1oek8EtV9Hvt6o6pEbAwjRR7L9
	82ew0wOeOvZE7l+RMOTAWpNs8pPMIRlkggD0nN1c=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2DIVpY8007202
	for <meta-arago@arago-project.org>; Mon, 13 Mar 2017 13:31:51 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 13 Mar 2017 13:31:50 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2DIVnNX008423;
	Mon, 13 Mar 2017 13:31:50 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 14 Mar 2017 00:01:44 +0530
Message-ID: <1489429904-13863-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [master] weston: Add SoC performance monitoring utilities
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
X-List-Received-Date: Mon, 13 Mar 2017 18:31:51 -0000
Content-Type: text/plain

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../recipes-graphics/wayland/weston_1.11.0.bbappend              | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend
index f8329c8..9b52df0 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend
@@ -2,7 +2,7 @@
 PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
 PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev libgbm mtdev"
 
-PR_append = ".arago22"
+PR_append = ".arago25"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
@@ -17,3 +17,10 @@ SRC_URI += " \
 	file://0001-compositor-drm-fix-hotplug-weston-termination-proble.patch \
 	file://0001-compositor-drm-support-RGB565-with-pixman-renderer.patch \
 "
+
+
+# SoC Performance Monitoring Utility
+SRC_URI += " \
+        file://0001-Add-soc-performance-monitor-utilites.patch \
+"
+
-- 
1.9.1


