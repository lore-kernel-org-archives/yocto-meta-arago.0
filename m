Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 330EB52970
	for <meta-arago@arago-project.org>;
	Thu,  6 Aug 2020 16:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E1BE540C21;
	Thu,  6 Aug 2020 16:17:01 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id YhNFivrupWWe; Thu,  6 Aug 2020 16:17:01 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C970540A9E;
	Thu,  6 Aug 2020 16:17:00 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 32611170D09;
	Thu,  6 Aug 2020 12:17:00 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu,  6 Aug 2020 12:16:59 -0400
Message-Id: <1596730619-55971-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [dunfell/master][PATCH] tisdk-rootfs-image: re-add packages that were previously in the default fs
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
X-List-Received-Date: Thu, 06 Aug 2020 16:19:48 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/images/tisdk-default-image.bb     | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
index ce4287a..bc77b97 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
@@ -32,3 +32,42 @@ export IMAGE_BASENAME = "tisdk-default-image"
 # available on the HW.
 IMAGE_FSTYPES_remove_keystone = "ubifs ubi"
 IMAGE_FSTYPES_remove_omapl138 = "ubifs ubi"
+
+# Below is the delta in packages between old fuller and a new smaller default rootfs
+CHROMIUM = ""
+CHROMIUM_append_omap-a15 = "\
+    chromium-ozone-wayland \
+"
+CHROMIUM_append_k3 = "\
+    chromium-ozone-wayland \
+"
+
+EXTRABROWSERS = " \
+    qtwebbrowser-examples \
+    qtwebengine-qmlplugins \
+    qtwebengine-examples \
+"
+
+PYTHON2APPS = " \
+    ${@bb.utils.contains('MACHINE_FEATURES','gpu',"${EXTRABROWSERS}",'',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', "${CHROMIUM}", '', d)} \
+"
+
+DEVTOOLS = " \
+    linux-libc-headers-dev \
+    build-essential \
+    packagegroup-core-tools-debug \
+    git \
+"
+
+OPENCL = " \
+    ${@bb.utils.contains('MACHINE_FEATURES','dsp','ti-opencl','',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-tisdk-opencl-extra','',d)} \
+"
+
+IMAGE_INSTALL += "\
+    ${@oe.utils.all_distro_features(d, "opencl", "${OPENCL}")} \
+    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "${PYTHON2APPS}", "", d)} \
+    ${DEVTOOLS} \
+    ${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'valgrind', '', d)} \
+"
-- 
2.7.4


