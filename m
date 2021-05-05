Return-Path: <g-tammana@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id A94CF52CDF
	for <meta-arago@arago-project.org>;
	Wed,  5 May 2021 14:32:28 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 145EWwL0095846;
	Wed, 5 May 2021 09:32:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1620225179;
	bh=MZxOBtpxopwHwMBmWQ3o7+GOJevP9tHhkOHOq47Ff1s=;
	h=From:To:CC:Subject:Date;
	b=r6Q4SUKXHMWqjDbo7InleqRU4ALzwHC4PiT7bU1dssCQOTDfJSKTCeM0GMKhUfN40
	Gqg25yFRtckGK9CNa4MYzvozjWO2KGIjinARNzWxuEg8c/hpR6n0xi0EC4jdMOcoli
	dPK+vt+Xxl3CGb15uBmY3Gs1Fd8hWhMbUyVVIx94=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 145EWwFj011438
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 May 2021 09:32:58 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Wed, 5 May 2021 09:32:58 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Wed, 5 May 2021 09:32:58 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com
	[10.247.120.73])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 145EWwsC091052;
	Wed, 5 May 2021 09:32:58 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.81.224] (may be forged))
	by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id
	145EWwEu009501; Wed, 5 May 2021 09:32:58 -0500
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-arago@arago-project.org>, Praneeth Bajjuri <praneeth@ti.com>,
	<denys@konsulko.com>
Date: Wed, 5 May 2021 09:32:55 -0500
Message-ID: <20210505143256.11372-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [dunfell/master][PATCH 1/2] gstreamer1.0-plugins-bad: Fix gstdrm dependencies
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
X-List-Received-Date: Wed, 05 May 2021 14:32:29 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

drmallocator has no wayland dependency remove it as hard dependency.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 ...emove-wayland-as-required-dependency.patch | 32 +++++++++++++++++++
 .../gstreamer1.0-plugins-bad_1.16.%.bbappend  |  3 +-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gstdrm-Remove-wayland-as-required-dependency.patch

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gstdrm-Remove-wayland-as-required-dependency.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gstdrm-Remove-wayland-as-required-dependency.patch
new file mode 100644
index 00000000..be189619
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gstdrm-Remove-wayland-as-required-dependency.patch
@@ -0,0 +1,32 @@
+From e613160ef171aaaffb40c0b800b6c6def110ee18 Mon Sep 17 00:00:00 2001
+From: Gowtham Tammana <g-tammana@ti.com>
+Date: Tue, 4 May 2021 22:08:25 -0500
+Subject: [PATCH] gstdrm: Remove wayland as required dependency
+
+gstdrmallocator is using dumb buffer api for buffer allocation and as
+such there is no hard dependency on wayland. Remove it from required.
+
+Upstream-Status: Inappropriate [depends on drmallocator patches in
+meta-argo]
+
+Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
+---
+ gst-libs/gst/drm/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gst-libs/gst/drm/meson.build b/gst-libs/gst/drm/meson.build
+index 3310cc6..0700cab 100644
+--- a/gst-libs/gst/drm/meson.build
++++ b/gst-libs/gst/drm/meson.build
+@@ -6,7 +6,7 @@ gstdrm_headers = [
+ ]
+ install_headers(gstdrm_headers, subdir : 'gstreamer-1.0/gst/drm')
+ 
+-libdrm_dep = dependency('libdrm', version: '>= 2.4.55', required: get_option('wayland'))
++libdrm_dep = dependency('libdrm', version: '>= 2.4.55')
+ if libdrm_dep.found()
+   gstdrm = library('gstdrm-' + api_version,
+     gstdrm_sources,
+-- 
+2.31.1
+
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend
index 0533294c..64929729 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.%.bbappend
@@ -9,6 +9,7 @@ GSTDRM_WAYLANDSINK_PATCHES = " \
     file://0004-waylandsink-Add-drm-support-in-waylandsink.patch \
     file://0005-waylandsink-Add-input-device-support.patch \
     file://0001-wayland-drm-kms-add-support-for-meson-build-system.patch \
+    file://0001-gstdrm-Remove-wayland-as-required-dependency.patch \
 "
 
 SRC_URI_append_ti43x = " \
@@ -37,4 +38,4 @@ SRC_URI_append_j7-hs-evm = " \
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-PR_append = ".arago3"
+PR_append = ".arago4"
-- 
2.31.1


