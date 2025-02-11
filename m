Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57387C021A2
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 14:53:23 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.7175.1739260699379600802
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 10 Feb 2025 23:58:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=XcYzJdBY;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: y-abhilashchandra@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51B7wILb284279
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-arago@lists.yoctoproject.org>; Tue, 11 Feb 2025 01:58:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739260698;
	bh=H1qgQukHKy0MX1u4TMlJ6id/SobBZmQUnqprYpY8Zno=;
	h=From:To:CC:Subject:Date;
	b=XcYzJdBYc1m5mDz9v3ePn6AFE+VypAA5itFfd1xuSR+LIGPpaZjvSRWJCfxgeisSm
	 1mX5s8Al43YHSMsPd+j+vYatogT5cO0d2WpCx4qxWJTBH0iVL5oyuHbzSC1HKmaBzK
	 /jrNZrvzh6zjW43auJfoi75dG4bxNAPAD0tOStNk=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51B7wIOU067093
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 11 Feb 2025 01:58:18 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 11
 Feb 2025 01:58:18 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 11 Feb 2025 01:58:17 -0600
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51B7wFlh074276;
	Tue, 11 Feb 2025 01:58:15 -0600
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <devarsht@ti.com>, <vaishnav.a@ti.com>,
        <u-kumar1@ti.com>, <r-donadkar@ti.com>, <a-limaye@ti.com>,
        <y-abhilashchandra@ti.com>
Subject: [meta-arago][master/scarthgap][PATCH] meta-arago-extras: v4l-utils: Add recipe for v1.28.1
Date: Tue, 11 Feb 2025 13:28:13 +0530
Message-ID: <20250211075813.970579-1-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 11 Feb 2025 14:53:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15837

An older recipe of v4l-utils (v1.26.1) is present in the meta-oe layer
for scarthgap.

TI's 6.12 based kernel has backported multistream routing APIs from
upstream kernel, which requires v4l-utils to be the latest released
version (v1.28.1).

Thus we override the recipe in this layer to the latest release of
v4l-utils.

Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
Single camera setup logs: http://serenity.dal.design.ti.com:7777/ohidowecig.yaml
Multi camera setup logs: http://serenity.dal.design.ti.com:7777/oqowimumeh.yaml

 ...l-media-ctl-header-and-library-files.patch | 78 +++++++++++++++++
 ...add-support-for-RGBIr-bayer-formats.patch} |  0
 .../v4l2apps/v4l-utils_%.bbappend             |  7 --
 .../v4l2apps/v4l-utils_1.28.1.bb              | 86 +++++++++++++++++++
 4 files changed, 164 insertions(+), 7 deletions(-)
 create mode 100644 meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/0001-media-ctl-Install-media-ctl-header-and-library-files.patch
 rename meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/{0001-media-ctl-add-support-for-RGBIr-bayer-formats.patch => 0002-media-ctl-add-support-for-RGBIr-bayer-formats.patch} (100%)
 delete mode 100644 meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils_%.bbappend
 create mode 100644 meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb

diff --git a/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/0001-media-ctl-Install-media-ctl-header-and-library-files.patch b/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/0001-media-ctl-Install-media-ctl-header-and-library-files.patch
new file mode 100644
index 00000000..6c946d8c
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/0001-media-ctl-Install-media-ctl-header-and-library-files.patch
@@ -0,0 +1,78 @@
+From 3867fcfa4389c7fa271705f1fd1d4bfb74bc1bd1 Mon Sep 17 00:00:00 2001
+From: Neel Gandhi <neel.gandhi@amd.com>
+Date: Wed, 5 Jun 2024 13:51:36 +0530
+Subject: [PATCH] media-ctl: Install media-ctl header and library files
+
+Install mediactl and v4l2subdev header and library
+files, which may be required by 3rd party applications
+to populate and control v4l2subdev device node tree
+
+Install of these files was removed in upstream commit
+0911dce53b08b0df3066be2c75f67e8a314d8729.
+
+Upstream-Status: Denied
+
+v4l-utils maintainers do not promise a stable API for this library, and
+do not currently have the time to do so. So exporting the API in this
+way is fine, as long as we understand that it will change and users of
+the API will need to adapt over time.
+
+Signed-off-by: Neel Gandhi <neel.gandhi@amd.com>
+Signed-off-by: Mark Hatle <mark.hatle@amd.com>
+---
+ utils/media-ctl/meson.build | 28 +++++++++++++++++++++-------
+ 1 file changed, 21 insertions(+), 7 deletions(-)
+
+diff --git a/utils/media-ctl/meson.build b/utils/media-ctl/meson.build
+index 3a7b0c9a..40669b4c 100644
+--- a/utils/media-ctl/meson.build
++++ b/utils/media-ctl/meson.build
+@@ -3,14 +3,24 @@ libmediactl_sources = files(
+     'mediactl-priv.h',
+ )
+ 
++libmediactl_api = files(
++    'mediactl.h',
++    'v4l2subdev.h',
++)
++
++install_headers(libmediactl_api, subdir: 'mediactl')
++
+ libmediactl_deps = [
+     dep_libudev,
+ ]
+ 
+-libmediactl = static_library('mediactl',
+-                             libmediactl_sources,
+-                             dependencies : libmediactl_deps,
+-                             include_directories : v4l2_utils_incdir)
++libmediactl = library('mediactl',
++                      libmediactl_sources,
++                      soversion: '0',
++                      version: '0.0.0',
++                      install : true,
++                      dependencies : libmediactl_deps,
++                      include_directories : v4l2_utils_incdir)
+ 
+ dep_libmediactl = declare_dependency(link_with : libmediactl)
+ 
+@@ -18,9 +28,13 @@ libv4l2subdev_sources = files('libv4l2subdev.c')
+ libv4l2subdev_sources += media_bus_format_names_h
+ libv4l2subdev_sources += media_bus_format_codes_h
+ 
+-libv4l2subdev = static_library('v4l2subdev',
+-                               libv4l2subdev_sources,
+-                               include_directories : v4l2_utils_incdir)
++libv4l2subdev = library('v4l2subdev',
++                        libv4l2subdev_sources,
++                        soversion: '0',
++                        version: '0.0.0',
++                        install : true,
++                        dependencies : dep_libmediactl,
++                        include_directories : v4l2_utils_incdir)
+ 
+ dep_libv4l2subdev = declare_dependency(link_with : libv4l2subdev)
+ 
+-- 
+2.34.1
+
diff --git a/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/0001-media-ctl-add-support-for-RGBIr-bayer-formats.patch b/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/0002-media-ctl-add-support-for-RGBIr-bayer-formats.patch
similarity index 100%
rename from meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/0001-media-ctl-add-support-for-RGBIr-bayer-formats.patch
rename to meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/0002-media-ctl-add-support-for-RGBIr-bayer-formats.patch
diff --git a/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils_%.bbappend b/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils_%.bbappend
deleted file mode 100644
index 9b74dc7c..00000000
--- a/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils_%.bbappend
+++ /dev/null
@@ -1,7 +0,0 @@
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
-
-SRC_URI:append = " \
-    file://0001-media-ctl-add-support-for-RGBIr-bayer-formats.patch \
-"
-
-PR:append = ".arago0"
diff --git a/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb b/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb
new file mode 100644
index 00000000..6f5707da
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb
@@ -0,0 +1,86 @@
+SUMMARY = "v4l2 and IR applications"
+LICENSE = "GPL-2.0-only & LGPL-2.1-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=48da9957849056017dc568bbc43d8975 \
+                    file://COPYING.libv4l;md5=d749e86a105281d7a44c2328acebc4b0"
+PROVIDES = "libv4l media-ctl"
+
+DEPENDS = "jpeg \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11', '', d)} \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa-lib', '', d)} \
+           ${@bb.utils.contains_any('PACKAGECONFIG', 'qv4l2 qvidcap', 'qtbase qtbase-native', '', d)}"
+
+DEPENDS:append:libc-musl = " argp-standalone"
+DEPENDS:append:class-target = " udev"
+LDFLAGS:append = " -pthread"
+# v4l2 explicitly sets _FILE_OFFSET_BITS=32 to get access to
+# both 32 and 64 bit file APIs.  But it does not handle the time side?
+# Needs further investigation
+GLIBC_64BIT_TIME_FLAGS = ""
+
+inherit meson gettext pkgconfig
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[qv4l2] = ",-Dqv4l2=disabled"
+PACKAGECONFIG[qvidcap] = ",-Dqvidcap=disabled"
+PACKAGECONFIG[v4l2-tracer] = ",-Dv4l2-tracer=disabled,json-c"
+
+SRC_URI = "\
+    git://git.linuxtv.org/v4l-utils.git;protocol=https;branch=stable-1.28 \
+    file://0001-media-ctl-Install-media-ctl-header-and-library-files.patch \
+    file://0002-media-ctl-add-support-for-RGBIr-bayer-formats.patch \
+"
+
+SRCREV = "757acdaec187d51803c2957d36df3d717a3529da"
+
+PV .= "+git"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OEMESON = "-Dudevdir=${base_libdir}/udev -Dv4l2-compliance-32=false -Dv4l2-ctl-32=false"
+
+# Disable the erroneous installation of gconv-modules that would break glib
+# like it is done in Debian and ArchLinux.
+EXTRA_OEMESON += "-Dgconv=disabled"
+
+VIRTUAL-RUNTIME_ir-keytable-keymaps ?= "rc-keymaps"
+
+PACKAGES =+ "media-ctl ir-keytable rc-keymaps libv4l libv4l-dev qv4l2 qvidcap"
+
+RPROVIDES:${PN}-dbg += "libv4l-dbg"
+
+FILES:media-ctl = "${bindir}/media-ctl ${libdir}/libmediactl.so.*"
+FILES:qv4l2 = "\
+    ${bindir}/qv4l2 \
+    ${datadir}/applications/qv4l2.desktop \
+    ${datadir}/icons/hicolor/*/apps/qv4l2.* \
+"
+FILES:qvidcap = "\
+    ${bindir}/qvidcap \
+    ${datadir}/applications/qvidcap.desktop \
+    ${datadir}/icons/hicolor/*/apps/qvidcap.* \
+"
+
+FILES:ir-keytable = "${bindir}/ir-keytable ${base_libdir}/udev/rules.d/*-infrared.rules"
+RDEPENDS:ir-keytable += "${VIRTUAL-RUNTIME_ir-keytable-keymaps}"
+RDEPENDS:qv4l2 += "\
+    ${@bb.utils.contains('PACKAGECONFIG', 'qv4l2', 'qtbase', '', d)}"
+RDEPENDS:qvidcap += "\
+    ${@bb.utils.contains('PACKAGECONFIG', 'qvidcap', 'qtbase', '', d)}"
+
+FILES:rc-keymaps = "${sysconfdir}/rc* ${base_libdir}/udev/rc*"
+
+FILES:${PN} = "${bindir} ${sbindir}"
+
+FILES:libv4l += "${libdir}/libv4l*${SOLIBS} ${libdir}/libv4l/*.so ${libdir}/libv4l/plugins/*.so \
+                 ${libdir}/libdvbv5*${SOLIBS} \
+                 ${libdir}/libv4l/*-decomp \
+                 ${libdir}/libv4l2tracer.so \
+"
+
+FILES:libv4l-dev += "${includedir} ${libdir}/pkgconfig \
+                     ${libdir}/libv4l*${SOLIBSDEV} ${libdir}/*.la \
+                     ${libdir}/v4l*${SOLIBSDEV} ${libdir}/libv4l/*.la ${libdir}/libv4l/plugins/*.la"
+
+PARALLEL_MAKE:class-native = ""
+BBCLASSEXTEND = "native"
-- 
2.34.1


