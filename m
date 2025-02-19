Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 832DCC021B2
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 15:42:04 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.25304.1739979720662878410
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 19 Feb 2025 07:42:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=dyDwuSeQ;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51JFfwuu334455
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Feb 2025 09:41:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739979718;
	bh=MB3mpIArLtrgVwSRHBcDBaLqxtxhNxXEGqrYXutUL1M=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=dyDwuSeQtdW1ADqg7T85bEEghCA4VBx/qbf/9WnqGBiSTVQZVU75yhZWtVXobLXoF
	 JvRMOCyNCSnrpJsJlmnvDd4BP25Iz73VHDYsjsgwkmlaEQueSoA3dFf6yDZT/FJYi2
	 IiGPQyk3tD2PgOxkqpTHLBU2KFSi1afoB5pGMB7Q=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51JFfvlH066023
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 19 Feb 2025 09:41:57 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 19
 Feb 2025 09:41:56 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 19 Feb 2025 09:41:56 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51JFfuZ6105866;
	Wed, 19 Feb 2025 09:41:56 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH 1/3] meta-arago-demos: remove this layer due to qt5 dep
Date: Wed, 19 Feb 2025 09:41:46 -0600
Message-ID: <20250219154148.2733385-2-rs@ti.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250219154148.2733385-1-rs@ti.com>
References: <20250219154148.2733385-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 19 Feb 2025 15:42:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15859

From: Randolph Sapp <rs@ti.com>

Remove this layer now that the current recipes are unreachable. These
were the last of the "demos" in this layer and they were only being
built for legacy devices. Demos should primarily be in layers above this
unless they are used for functionality testing.

These modifications are required as part of the effort to make this
layer less dependent on meta-qt5. Moving forward TI builds of arago will
enable and test Qt6 by default, but unlike before this will not be done
in a way that creates an explicit dependency in this layer. This should
allow customers and layers that consume or extend this layer to toggle
Qt support more easily.

This should come after a patch to remove this layer from the
oe-layersetup configs. If you run into any build issues, be sure to
update your bblayers.conf accordingly.

Signed-off-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-demos/COPYING.MIT                  | 17 -------
 meta-arago-demos/README                       | 38 --------------
 meta-arago-demos/SECURITY                     | 20 --------
 meta-arago-demos/conf/layer.conf              | 26 ----------
 .../acontis-atemsys_3.0.1.28.bb               | 18 -------
 .../recipes-apps/evse-hmi/evse-hmi_git.bb     | 25 ----------
 .../mmwavegesture-hmi_git.bb                  | 25 ----------
 .../pdm-anomaly-detection_git.bb              | 29 -----------
 .../point-cloud-viewer_git.bb                 | 35 -------------
 .../protection-relays-hmi_git.bb              | 25 ----------
 .../examples/qtwebbrowser_5.15.1.bb           | 49 -------------------
 11 files changed, 307 deletions(-)
 delete mode 100644 meta-arago-demos/COPYING.MIT
 delete mode 100644 meta-arago-demos/README
 delete mode 100644 meta-arago-demos/SECURITY
 delete mode 100644 meta-arago-demos/conf/layer.conf
 delete mode 100644 meta-arago-demos/recipes-apps/acontis-ethercat-demo/acontis-atemsys_3.0.1.28.bb
 delete mode 100644 meta-arago-demos/recipes-apps/evse-hmi/evse-hmi_git.bb
 delete mode 100644 meta-arago-demos/recipes-apps/mmwavegesture-hmi/mmwavegesture-hmi_git.bb
 delete mode 100644 meta-arago-demos/recipes-apps/pdm-anomaly-detection/pdm-anomaly-detection_git.bb
 delete mode 100644 meta-arago-demos/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
 delete mode 100644 meta-arago-demos/recipes-apps/protection-relays-hmi/protection-relays-hmi_git.bb
 delete mode 100644 meta-arago-demos/recipes-qt/examples/qtwebbrowser_5.15.1.bb

diff --git a/meta-arago-demos/COPYING.MIT b/meta-arago-demos/COPYING.MIT
deleted file mode 100644
index fb950dc6..00000000
--- a/meta-arago-demos/COPYING.MIT
+++ /dev/null
@@ -1,17 +0,0 @@
-Permission is hereby granted, free of charge, to any person obtaining a copy 
-of this software and associated documentation files (the "Software"), to deal 
-in the Software without restriction, including without limitation the rights 
-to use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
-copies of the Software, and to permit persons to whom the Software is 
-furnished to do so, subject to the following conditions:
-
-The above copyright notice and this permission notice shall be included in 
-all copies or substantial portions of the Software.
-
-THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
-IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
-FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
-AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
-LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
-OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN 
-THE SOFTWARE.
diff --git a/meta-arago-demos/README b/meta-arago-demos/README
deleted file mode 100644
index b6181c73..00000000
--- a/meta-arago-demos/README
+++ /dev/null
@@ -1,38 +0,0 @@
-meta-arago-demos provides demo applications to showcase in TI SDK products
-
-This layer works with the latest Yocto Project release (currently 5.0+) and tracks
-the stable/maintenance branches (currently "scarthgap") of the corresponding layers:
-
-URI: git://git.openembedded.org/openembedded-core
-branch: scarthgap
-revision: HEAD
-layers: meta
-
-URI: git://git.yoctoproject.org/meta-ti
-branch: scarthgap
-revision: HEAD
-layers: meta-ti-bsp, meta-ti-extras
-
-URI: git://git.yoctoproject.org/meta-arm
-branch: scarthgap
-revision: HEAD
-layers: meta-arm, meta-arm-toolchain
-
-URI: git://git.openembedded.org/meta-openembedded
-branch: scarthgap
-revision: HEAD
-layers: meta-oe, meta-networking, meta-python
-
-URI: https://github.com/meta-qt5/meta-qt5
-branch: scarthgap
-revision: HEAD
-
-Send pull requests, patches, comments or questions to:
-meta-arago@lists.yoctoproject.org
-
-Please note - meta-arago mailing list requires subscription for posting:
-https://lists.yoctoproject.org/g/meta-arago
-
-Layer maintainers:
-Ryan Eatmon <reatmon@ti.com>
-Denys Dmytriyenko <denys@konsulko.com>
diff --git a/meta-arago-demos/SECURITY b/meta-arago-demos/SECURITY
deleted file mode 100644
index 2e38d80e..00000000
--- a/meta-arago-demos/SECURITY
+++ /dev/null
@@ -1,20 +0,0 @@
-How to Report a Potential Vulnerability?
-========================================
-
-If you would like to report a public issue (for example, one with a released
-CVE number), please report it to the mailing list:
-
-  https://lists.yoctoproject.org/g/meta-arago
-
-If you are dealing with a not-yet released or urgent issue, please send a
-message to one of the maintainers listed in the README.  Include as many
-details as possible:
-  - the layer or software module affected
-  - the recipe and its version
-  - any example code, if available
-
-Branches maintained with security fixes
----------------------------------------
-
-See https://wiki.yoctoproject.org/wiki/Releases for the list of current
-releases.  We only accept patches for the LTS releases and the master branch.
diff --git a/meta-arago-demos/conf/layer.conf b/meta-arago-demos/conf/layer.conf
deleted file mode 100644
index f551af28..00000000
--- a/meta-arago-demos/conf/layer.conf
+++ /dev/null
@@ -1,26 +0,0 @@
-# We have a conf and classes directory, append to BBPATH
-BBPATH .= ":${LAYERDIR}"
-
-# We have a recipes directory, add to BBFILES
-BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
-
-BBFILE_COLLECTIONS += "meta-arago-demos"
-BBFILE_PATTERN_meta-arago-demos := "^${LAYERDIR}/"
-BBFILE_PRIORITY_meta-arago-demos = "10"
-
-LAYERSERIES_COMPAT_meta-arago-demos = "scarthgap"
-
-LAYERDEPENDS_meta-arago-demos = " \
-    core \
-    meta-ti-bsp \
-    meta-ti-extras \
-    openembedded-layer \
-    networking-layer \
-    meta-python \
-    arm-toolchain \
-    qt5-layer \
-"
-
-SIGGEN_EXCLUDERECIPES_ABISAFE += " \
-    gstreamer1.0-plugins-bad \
-"
diff --git a/meta-arago-demos/recipes-apps/acontis-ethercat-demo/acontis-atemsys_3.0.1.28.bb b/meta-arago-demos/recipes-apps/acontis-ethercat-demo/acontis-atemsys_3.0.1.28.bb
deleted file mode 100644
index 897db273..00000000
--- a/meta-arago-demos/recipes-apps/acontis-ethercat-demo/acontis-atemsys_3.0.1.28.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "acontis atemsys kernel module for EtherCAT master"
-HOMEPAGE = "https://www.acontis.com/en/ethercat-for-ti-processors.html"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=65dd37ccb3e888dc57e47d925b80b38a"
-
-SRC_URI = "https://www.acontis.com/files/support/ethercat/EC-Master-Atemsys-V${PV}-Linux.tar.gz;subdir=${P}"
-SRC_URI[md5sum] = "d8d92ae671c5cf78ae22bc5386d7f44f"
-SRC_URI[sha256sum] = "dd3d83eb984b17b8378e0a5e5dfae8c77e25c5428a26319f59f44f805aff9e89"
-
-COMPATIBLE_MACHINE = "am335x-evm|am57xx-evm"
-
-PR = "r0"
-
-S = "${WORKDIR}/${P}/yocto/meta-acontis/recipes-kernel/atemsys/files"
-
-inherit module
-
-EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}"'
diff --git a/meta-arago-demos/recipes-apps/evse-hmi/evse-hmi_git.bb b/meta-arago-demos/recipes-apps/evse-hmi/evse-hmi_git.bb
deleted file mode 100644
index 3550a3e7..00000000
--- a/meta-arago-demos/recipes-apps/evse-hmi/evse-hmi_git.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY = "HMI demo for electronic vehicle charging station (EVSE) using QT QWidget tools"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://main.cpp;beginline=1;endline=33;md5=a9cde3921a8be42ed79ab74661799104"
-
-DEPENDS += "qtbase"
-
-inherit qmake5
-
-# Qt uses atomic instructions not supported in thumb mode
-ARM_INSTRUCTION_SET = "arm"
-
-PV = "1.0"
-PR = "r1"
-
-BRANCH = "master"
-SRC_URI = "git://git.ti.com/git/sitara-linux/evse-hmi.git;protocol=https;branch=${BRANCH}"
-
-SRCREV = "d8c309d2832735f8df84db9993a01d861fdc02d7"
-
-S = "${WORKDIR}/git"
-
-do_install() {
-    install -d ${D}${bindir}
-    install -m 755 evse_hmi ${D}${bindir}
-}
diff --git a/meta-arago-demos/recipes-apps/mmwavegesture-hmi/mmwavegesture-hmi_git.bb b/meta-arago-demos/recipes-apps/mmwavegesture-hmi/mmwavegesture-hmi_git.bb
deleted file mode 100644
index ec7d5c3f..00000000
--- a/meta-arago-demos/recipes-apps/mmwavegesture-hmi/mmwavegesture-hmi_git.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY = "Gesture baed HMI demo using mmWave IWR1642 chip and Sitara AM device"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://main.cpp;beginline=1;endline=33;md5=e7e749ff1989b18db836e5d9910a37e9"
-
-inherit qmake5
-
-# Qt uses atomic instructions not supported in thumb mode
-ARM_INSTRUCTION_SET = "arm"
-
-PV = "1.0"
-PR = "r0"
-
-BRANCH = "master"
-SRC_URI = "git://git.ti.com/git/sitara-linux/mmwavegesture-hmi.git;protocol=https;branch=${BRANCH}"
-
-SRCREV = "0881fc8bc5b3c3411af7b69c3837a8b3a1fbedc5"
-
-S = "${WORKDIR}/git"
-
-DEPENDS += "qtbase qtdeclarative qtserialport"
-
-do_install() {
-    install -d ${D}${bindir}
-    install -m 755 mmwavegesture_hmi ${D}${bindir}
-}
diff --git a/meta-arago-demos/recipes-apps/pdm-anomaly-detection/pdm-anomaly-detection_git.bb b/meta-arago-demos/recipes-apps/pdm-anomaly-detection/pdm-anomaly-detection_git.bb
deleted file mode 100644
index 1ed29577..00000000
--- a/meta-arago-demos/recipes-apps/pdm-anomaly-detection/pdm-anomaly-detection_git.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-SUMMARY = "Predictive maintenance demo for anomaly detection using Recurrent Neural Network (RNN)"
-LICENSE = "BSD-3-Clause & MIT & GPL-3.0-only"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e88016d2cbc82d0d2efbb0865891e9d6"
-
-inherit qmake5
-
-# Qt uses atomic instructions not supported in thumb mode
-ARM_INSTRUCTION_SET = "arm"
-
-PV = "1.0"
-PR = "r2"
-
-BRANCH = "master"
-SRC_URI  = "git://git.ti.com/git/apps/pdm-anomaly-detection.git;protocol=https;branch=${BRANCH}"
-
-SRCREV = "2ccf0e5e5aaac73166d52374650a25652bd6aed2"
-
-S = "${WORKDIR}/git"
-
-DEPENDS += "qtbase qtdeclarative qtcharts"
-
-do_install() {
-    install -d ${D}${datadir}/ti/examples/pdm
-    install -m 755 RnnPdmAnomalyDetection ${D}${datadir}/ti/examples/pdm
-    install -m 644 ${S}/coeff.bin ${D}${datadir}/ti/examples/pdm
-    install -m 644 ${S}/logs/* ${D}${datadir}/ti/examples/pdm
-}
-
-FILES:${PN} += "${datadir}/ti/examples/pdm"
diff --git a/meta-arago-demos/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb b/meta-arago-demos/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
deleted file mode 100644
index 9211c653..00000000
--- a/meta-arago-demos/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-DESCRIPTION = "Point cloud viewer"
-HOMEPAGE = "https://git.ti.com/processor-sdk/point-cloud-viewer/"
-LICENSE = "TI-TSPA"
-LIC_FILES_CHKSUM := "file://PointCloudViewer_manifest.html;md5=7ea694db2dd8d82fd91a18cab8c2c2db"
-
-PR = "r2"
-
-COMPATIBLE_MACHINE = "dra7xx"
-
-BRANCH = "master"
-
-SRC_URI = "git://git.ti.com/git/processor-sdk/point-cloud-viewer.git;protocol=https;branch=${BRANCH}"
-
-SRCREV = "f0af54e63a6c802b4f8f0657873e74f1cb486e86"
-
-PV = "2.2"
-
-S = "${WORKDIR}/git"
-
-DEPENDS += "opencv"
-RDEPENDS:${PN} = "libxkbcommon"
-
-do_install() {
-    install -d ${D}${bindir}
-    install -m 755 ${S}/point_cloud_viewer ${D}${bindir}
-
-    install -d ${D}${datadir}/ti/pointclouds
-    install -m 644 ${S}/example_point_cloud.xyz ${D}${datadir}/ti/pointclouds
-}
-
-FILES:${PN} += "\
-    ${datadir}/ti/pointclouds \
-"
-
-INSANE_SKIP:${PN} = "already-stripped file-rdeps"
diff --git a/meta-arago-demos/recipes-apps/protection-relays-hmi/protection-relays-hmi_git.bb b/meta-arago-demos/recipes-apps/protection-relays-hmi/protection-relays-hmi_git.bb
deleted file mode 100644
index 62770aaa..00000000
--- a/meta-arago-demos/recipes-apps/protection-relays-hmi/protection-relays-hmi_git.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY = "HMI demo for Protection Relays using QT  tools"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://main.cpp;beginline=1;endline=33;md5=a9cde3921a8be42ed79ab74661799104"
-
-DEPENDS += "qtbase"
-
-inherit qmake5
-
-# Qt uses atomic instructions not supported in thumb mode
-ARM_INSTRUCTION_SET = "arm"
-
-PV = "1.0"
-PR = "r0"
-
-BRANCH = "master"
-SRC_URI = "git://git.ti.com/git/sitara-linux/protection-relays-hmi.git;protocol=https;branch=${BRANCH}"
-
-SRCREV = "b116b5628a68ba3b6db88435023cf034504655d3"
-
-S = "${WORKDIR}/git"
-
-do_install() {
-    install -d ${D}${bindir}
-    install -m 755 protection_relays_hmi ${D}${bindir}
-}
diff --git a/meta-arago-demos/recipes-qt/examples/qtwebbrowser_5.15.1.bb b/meta-arago-demos/recipes-qt/examples/qtwebbrowser_5.15.1.bb
deleted file mode 100644
index 9c84870b..00000000
--- a/meta-arago-demos/recipes-qt/examples/qtwebbrowser_5.15.1.bb
+++ /dev/null
@@ -1,49 +0,0 @@
-SUMMARY = "Qt Touch-Friendly WebBroswer"
-HOMEPAGE = "http://blog.qt.io/blog/2016/07/18/qt-webbrowser-1-0/"
-SECTION = "multimedia"
-LICENSE = "GPL-3.0-only & GFDL-1.3"
-LIC_FILES_CHKSUM = " \
-    file://LICENSE.GPLv3;md5=a40e2bb02b1ac431f461afd03ff9d1d6 \
-    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
-"
-
-DEPENDS += "qtbase qtdeclarative qtwebengine"
-PACKAGES += "${PN}-examples"
-
-PR = "r0"
-
-BRANCH = "dev"
-SRC_URI = "git://code.qt.io/qt-apps/qtwebbrowser.git;protocol=git;branch=${BRANCH}"
-SRCREV = "a09ec269e8b296d39d78b45ae251edb3d7bada41"
-
-S = "${WORKDIR}/git"
-
-inherit qmake5
-
-# Qt uses atomic instructions not supported in thumb mode
-ARM_INSTRUCTION_SET = "arm"
-
-do_install() {
-    install -d ${D}${bindir}
-    install -d ${D}${datadir}/examples/webengine/webbrowser/src
-    install -m 0755 src/qtwebbrowser ${D}${bindir}/qtwebbrowser
-    cp -R --no-dereference --preserve=mode,links ${S}/* ${D}${datadir}/examples/webengine/webbrowser/.
-}
-
-FILES:${PN} +=  "${bindir}/qtwebbrowser"
-FILES:${PN}-examples +=  "${datadir}/examples/webengine/webbrowser/*"
-
-RDEPENDS:${PN} += " \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'qtwayland-qmlplugins', '', d)} \
-    qtvirtualkeyboard-qmlplugins \
-    qtdeclarative-qmlplugins \
-    qtquickcontrols-qmlplugins \
-    qtgraphicaleffects-qmlplugins \
-    qtmultimedia-qmlplugins \
-    qtwebengine-qmlplugins \
-    ttf-dejavu-common \
-    ttf-dejavu-sans \
-    ttf-dejavu-sans-mono \
-    liberation-fonts \
-    ca-certificates \
-"
-- 
2.48.1


