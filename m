Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 358B1C3ABB6
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 00:22:21 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.65112.1746490936127463681
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 05 May 2025 17:22:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=eLl52uQa;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5460MC9p897815
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 May 2025 19:22:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746490932;
	bh=dHI/sNnEbk/whqnLSH8T9VxQywBY0MZvVLDiqlw1ojg=;
	h=From:To:CC:Subject:Date;
	b=eLl52uQa9k8zA/IdWT8sK5freA5ma8spc7/yH7mFEa3WFlc4LytdaMlYNB0met4y3
	 W4ddUVhSPatvVSrdv/zIkmNjaguxPchUdGY1Ds1TesFrISbcvsZYH+sowtzqDpJglt
	 ntGxDZDhKlDu4pAqtcUOaXSKsbnl2T6rM7ckSRh4=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5460MChb053390
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 May 2025 19:22:12 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 May 2025 19:22:11 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 May 2025 19:22:11 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5460MBIe106017;
	Mon, 5 May 2025 19:22:11 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap/master][PATCH] mesa-demos: add a git version
Date: Mon, 5 May 2025 19:22:03 -0500
Message-ID: <20250506002203.1766376-1-rs@ti.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 06 May 2025 00:22:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16178

From: Randolph Sapp <rs@ti.com>

Add a newer git version of this package to fetch modifications that
allow us to build the EGL and GLES specific demos without the hard
Desktop GL and X11 dependencies.

These modification have not made it into a tag yet, but this recipe can
be removed once oe-core's version of the package passes
02eae079cb0b8186064d5b194ca4cc2995f099ee.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../recipes-graphics/mesa/mesa-demos_git.bb   | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb

diff --git a/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb b/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb
new file mode 100644
index 00000000..5dd5a8ec
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
+inherit meson pkgconfig features_check
+# depends on virtual/egl, virtual/libgl ...
+REQUIRED_DISTRO_FEATURES = "opengl"
+
+EXTRA_OEMESON = "-Dwith-system-data-files=true"
+
+# Note: wayland is not included as the feature requires libdecor recipe,
+# which is not currently in core
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


