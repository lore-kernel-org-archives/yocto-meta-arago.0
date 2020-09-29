Return-Path: <g-tammana@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 0D1DF52991
	for <meta-arago@arago-project.org>;
	Tue, 29 Sep 2020 13:12:31 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08TD9WAD014846
	for <meta-arago@arago-project.org>; Tue, 29 Sep 2020 08:09:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1601384973;
	bh=8wDDVnmggPowPz+vouLbjFX9YYjS9BYjTpLlM0A1Ed4=;
	h=From:To:CC:Subject:Date;
	b=JXiYLYJD+SxjCKc8qiCZo4cJmisPdBP9Pm8vhdX8tNf3pLoor6OcaBA5ACVVwOk6L
	Mzui2CZnqzBOym8HzbzHhFocO+WUmpKe/14YNT2NLUqEejRK91uKeFWC1Xxzoe7ol7
	6Jtxd0R3mD2ILRxYTpkyKDA3CZD38ZMRF0ygewtI=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08TD9WA4032646
	for <meta-arago@arago-project.org>; Tue, 29 Sep 2020 08:09:32 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Tue, 29 Sep 2020 08:09:32 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Tue, 29 Sep 2020 08:09:32 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com
	[10.247.120.73])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08TD9WYM051435;
	Tue, 29 Sep 2020 08:09:32 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.77.45])
	by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id
	08TD9W0k031767; Tue, 29 Sep 2020 08:09:32 -0500
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-arago@arago-project.org>, Denys Dmytriyenko <denys@ti.com>
Date: Tue, 29 Sep 2020 08:09:30 -0500
Message-ID: <20200929130930.13211-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/dunfell][PATCH] kmscube: enable gles3 targets conditionally
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
X-List-Received-Date: Tue, 29 Sep 2020 13:12:32 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Patch kmscube to enable gles3 targets conditionally, as not all glesv2
targets support glesv3.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 .../0001-meson-check-for-gles3-support.patch  | 50 +++++++++++++++++++
 .../kmscube/kmscube_%.bbappend                |  7 +++
 2 files changed, 57 insertions(+)
 create mode 100644 meta-arago-distro/recipes-graphics/kmscube/kmscube/0001-meson-check-for-gles3-support.patch
 create mode 100644 meta-arago-distro/recipes-graphics/kmscube/kmscube_%.bbappend

diff --git a/meta-arago-distro/recipes-graphics/kmscube/kmscube/0001-meson-check-for-gles3-support.patch b/meta-arago-distro/recipes-graphics/kmscube/kmscube/0001-meson-check-for-gles3-support.patch
new file mode 100644
index 00000000..67d7aca7
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
++  message('Building with GLES3 support')
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
index 00000000..7b27c894
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/kmscube/kmscube_%.bbappend
@@ -0,0 +1,7 @@
+FILESEXTRAPATHS_append := "${THISDIR}/${PN}:"
+
+SRC_URI += " \
+file://0001-meson-check-for-gles3-support.patch \
+"
+
+PR_APPEND = ".arago1"
-- 
2.17.1


