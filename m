Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4EA3C3ABC6
	for <webhook@archiver.kernel.org>; Thu,  8 May 2025 21:10:30 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.334.1746738626030944930
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 08 May 2025 14:10:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=fxqPjhqL;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 548LAMZd1186851
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 8 May 2025 16:10:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746738623;
	bh=UTKh6PFKOAnT6n/p2FzG/anB7nu/MLDjDu+m0ELux9g=;
	h=From:To:CC:Subject:Date;
	b=fxqPjhqLqjF29jkpMs2hDRY4PCq2SZ+58FRSn+IokD1CC3tSZi1b0+pfrA3ipIIYD
	 tYCWwJR+MeOa4ufhbch0O6qgqA8eKrl/KaCEOlDGJ6dJ9jhnCfl/RwfLgB1QsjaZ2f
	 JKpQkmd8EWEmqoXubdTUefw8R1Udk9mKjUVCMHNY=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 548LAMsa000546
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 May 2025 16:10:22 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 May 2025 16:10:22 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 May 2025 16:10:22 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 548LAMwg108832;
	Thu, 8 May 2025 16:10:22 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap/master][PATCHv2] mesa-demos: add a git version
Date: Thu, 8 May 2025 16:10:09 -0500
Message-ID: <20250508211009.1576476-1-rs@ti.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 08 May 2025 21:10:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16193

From: Randolph Sapp <rs@ti.com>

Add a newer git version of this package to fetch modifications that
allow us to build the EGL and GLES specific demos without the hard
Desktop GL and X11 dependencies.

These modification have not made it into a tag yet, but this recipe can
be removed once oe-core's version of the package passes
02eae079cb0b8186064d5b194ca4cc2995f099ee.

Set this git recipe as the preferred version when using the arago
distro.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../conf/distro/include/arago-prefs.inc       |  3 ++
 .../recipes-graphics/mesa/mesa-demos_git.bb   | 43 +++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 69bae7d7..98aa2552 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -17,3 +17,6 @@ PREFERRED_PROVIDER_nativesdk-llvm = "nativesdk-clang"
 PROVIDES:pn-clang = "llvm"
 PROVIDES:pn-clang-native = "llvm-native"
 PROVIDES:pn-nativesdk-clang = "nativesdk-llvm"
+
+# Bump mesa-demos to include some patches not in a tagged release
+PREFERRED_VERSION_mesa-demos = "9.0.0+git"
diff --git a/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb b/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb
new file mode 100644
index 00000000..a18d212e
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb
@@ -0,0 +1,43 @@
+SUMMARY = "Mesa demo applications"
+DESCRIPTION = "This package includes the demonstration application, such as glxgears. \
+These applications can be used for Mesa validation and benchmarking."
+HOMEPAGE = "http://mesa3d.org"
+BUGTRACKER = "https://bugs.freedesktop.org"
+
+LICENSE = "MIT & PD"
+LIC_FILES_CHKSUM = "file://src/xdemos/glxgears.c;beginline=1;endline=20;md5=a481fbdb2ac800ecb12405c33bcfacae \
+                    file://src/xdemos/glxdemo.c;beginline=1;endline=8;md5=b01d5ab1aee94d35b7efaa2ef48e1a06"
+
+SRC_URI = "git://gitlab.freedesktop.org/mesa/demos.git;protocol=https;branch=main"
+SRCREV = "02eae079cb0b8186064d5b194ca4cc2995f099ee"
+S = "${WORKDIR}/git"
+
+DEFAULT_PREFERENCE = "-1"
+PV = "9.0.0+git"
+
+inherit meson pkgconfig features_check
+REQUIRED_DISTRO_FEATURES = "opengl"
+
+EXTRA_OEMESON = "-Dwith-system-data-files=true"
+
+PACKAGECONFIG ?= "drm egl gles1 gles2 \
+                  ${@bb.utils.filter('DISTRO_FEATURES', 'vulkan x11 wayland', d)}"
+
+PACKAGECONFIG[drm] = "-Dlibdrm=enabled,-Dlibdrm=disabled,libdrm"
+PACKAGECONFIG[egl] = "-Degl=enabled,-Degl=disabled,virtual/egl"
+PACKAGECONFIG[gles1] = "-Dgles1=enabled,-Dgles1=disabled,virtual/libgles1"
+PACKAGECONFIG[gles2] = "-Dgles2=enabled,-Dgles2=disabled,virtual/libgles2"
+PACKAGECONFIG[glut] = "-Dwith-glut=${STAGING_EXECPREFIXDIR},-Dglut=disabled,freeglut"
+PACKAGECONFIG[osmesa] = "-Dosmesa=enabled,-Dosmesa=disabled,"
+PACKAGECONFIG[vulkan] = "-Dvulkan=enabled,-Dvulkan=disabled,vulkan-loader glslang-native"
+PACKAGECONFIG[wayland] = "-Dwayland=enabled,-Dwayland=disabled,virtual/libgl wayland wayland-native wayland-protocols libxkbcommon libdecor"
+PACKAGECONFIG[x11] = "-Dx11=enabled,-Dx11=disabled,virtual/libx11 libglu libxkbcommon libxcb"
+
+do_install:append() {
+	# it can be completely empty when all PACKAGECONFIG options are disabled
+	rmdir --ignore-fail-on-non-empty ${D}${bindir}
+
+	if [ -f ${D}${bindir}/clear ]; then
+		mv ${D}${bindir}/clear ${D}${bindir}/clear.mesa-demos
+	fi
+}
-- 
2.49.0


