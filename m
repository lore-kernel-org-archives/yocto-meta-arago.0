Return-Path: <g-tammana@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id F2A1052991
	for <meta-arago@arago-project.org>;
	Tue, 29 Sep 2020 18:50:02 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08TIl39x110721
	for <meta-arago@arago-project.org>; Tue, 29 Sep 2020 13:47:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1601405223;
	bh=5yEY1+0KxM/wkWIHqk2x9r9VXj6fhdF+CrN1rwCHnHc=;
	h=From:To:CC:Subject:Date;
	b=YJRwPzoh9X/uzAOfadmS/M+zVr6k+FnDobODmRZMx348sRu9LRf5jQSLaM+80Xr8X
	SNVwl91rfZFM/joR+9bpGQ/p/MUulZJP4BCDuREefGrW+pPDWXu8yzrVvwu/PprdJI
	hh0zK0IKvF6tD5QCqdlUbC9I/D1DuO4hSi88oWF8=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08TIl3mK047161
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 29 Sep 2020 13:47:03 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Tue, 29 Sep 2020 13:47:03 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Tue, 29 Sep 2020 13:47:03 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08TIl3JF032315;
	Tue, 29 Sep 2020 13:47:03 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.77.45])
	by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 08TIl3EW128988;
	Tue, 29 Sep 2020 13:47:03 -0500
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-arago@arago-project.org>, Denys Dmytriyenko <denys@ti.com>
Date: Tue, 29 Sep 2020 13:47:00 -0500
Message-ID: <20200929184700.10399-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [dunfell/master][PATCH v2] kmscube: enable gles3 targets conditionally
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
X-List-Received-Date: Tue, 29 Sep 2020 18:50:03 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Patch kmscube to enable gles3 targets conditionally, as not all glesv2
targets support glesv3.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
v2
  - %s/APPEND/apend

 .../0001-meson-check-for-gles3-support.patch  | 50 +++++++++++++++++++
 .../kmscube/kmscube_%.bbappend                |  7 +++
 2 files changed, 57 insertions(+)
 create mode 100644 meta-arago-distro/recipes-graphics/kmscube/kmscube/0001-meson-check-for-gles3-support.patch
 create mode 100644 meta-arago-distro/recipes-graphics/kmscube/kmscube_%.bbappend

diff --git a/meta-arago-distro/recipes-graphics/kmscube/kmscube/0001-meson-check-for-gles3-support.patch b/meta-arago-distro/recipes-graphics/kmscube/kmscube/0001-meson-check-for-gles3-support.patch
new file mode 100644
index 00000000..1ebeee07
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/kmscube/kmscube/0001-meson-check-for-gles3-support.patch
@@ -0,0 +1,50 @@
+From 9f7efd751a3cdceaeefa6c215a81aa6368857e40 Mon Sep 17 00:00:00 2001
+From: Gowtham Tammana <g-tammana@ti.com>
+Date: Mon, 28 Sep 2020 21:15:52 -0500
+Subject: [PATCH] meson: check for gles3 support
+
+Some cores don't support gles3, so compile gles3 targets
+conditionally.
+
+Upstream-Status: Pending
+
+Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
+---
+ meson.build | 22 +++++++++++++++-------
+ 1 file changed, 15 insertions(+), 7 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index df9c315..8bba902 100644
+--- a/meson.build
++++ b/meson.build
+@@ -91,12 +91,20 @@ else
+   message('Building without gstreamer support')
+ endif
+ 
+-executable('kmscube', sources, dependencies : dep_common, install : true)
++# GLES3 check
++gles3_h = false
++if dep_gles2.found()
++  gles3_h = cc.has_header('GLES3/gl3.h', dependencies: dep_gles2)
++endif
+ 
++executable('kmscube', sources, dependencies : dep_common, install : true)
+ 
+-executable('texturator', files(
+-	'common.c',
+-	'drm-legacy.c',
+-	'drm-common.c',
+-	'texturator.c',
+-), dependencies : dep_common, install : true)
++if gles3_h
++  message('Building with GLES3 support')
++  executable('texturator', files(
++    'common.c',
++    'drm-legacy.c',
++    'drm-common.c',
++    'texturator.c',
++  ), dependencies : dep_common, install : true)
++endif
+-- 
+2.17.1
+
diff --git a/meta-arago-distro/recipes-graphics/kmscube/kmscube_%.bbappend b/meta-arago-distro/recipes-graphics/kmscube/kmscube_%.bbappend
new file mode 100644
index 00000000..d11012a8
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/kmscube/kmscube_%.bbappend
@@ -0,0 +1,7 @@
+FILESEXTRAPATHS_append := "${THISDIR}/${PN}:"
+
+SRC_URI += " \
+file://0001-meson-check-for-gles3-support.patch \
+"
+
+PR_append = ".arago1"
-- 
2.28.0


