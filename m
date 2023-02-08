Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4FC4C05027
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 23:35:07 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.1116.1675899306855680284
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 08 Feb 2023 15:35:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=wGr+Uo0D;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 318NZ6Kh059587;
	Wed, 8 Feb 2023 17:35:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675899306;
	bh=HOY0Ifv9E6mW7eQ11Bg6Umz3s3ZN4UpO4dhIMqdwqkw=;
	h=From:To:CC:Subject:Date;
	b=wGr+Uo0DdQlNsaxYdkZccWXjB+DfuV4CT38ub8dlJQBlTF8RpszLyNUeDb4jMne7h
	 1EwU+Z9sboccXi6V3w/EbmqKYyY7X42vaT0uk2XJISX+Lv2SNTVXNDVwRBQ+tvlxeR
	 53J2lUTg61lveH/kJ14I5/HYY9IJ9C+j2JiPCpF4=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 318NZ5M1025332
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Feb 2023 17:35:06 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 8
 Feb 2023 17:35:05 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 8 Feb 2023 17:35:05 -0600
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 318NZ4LB048312;
	Wed, 8 Feb 2023 17:35:05 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][kirkstone/master][PATCH] kmscube: Remove no longer needed bbappend for kmscube
Date: Wed, 8 Feb 2023 17:35:04 -0600
Message-ID: <20230208233504.19817-1-afd@ti.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 08 Feb 2023 23:35:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14211

We now can build the latest upstream kmscube without any bbappends.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../0001-meson-check-for-gles3-support.patch  | 50 -------------------
 .../kmscube/kmscube_%.bbappend                | 11 ----
 2 files changed, 61 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-graphics/kmscube/kmscube/0001-meson-check-for-gles3-support.patch
 delete mode 100644 meta-arago-distro/recipes-graphics/kmscube/kmscube_%.bbappend

diff --git a/meta-arago-distro/recipes-graphics/kmscube/kmscube/0001-meson-check-for-gles3-support.patch b/meta-arago-distro/recipes-graphics/kmscube/kmscube/0001-meson-check-for-gles3-support.patch
deleted file mode 100644
index 1ebeee07..00000000
--- a/meta-arago-distro/recipes-graphics/kmscube/kmscube/0001-meson-check-for-gles3-support.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 9f7efd751a3cdceaeefa6c215a81aa6368857e40 Mon Sep 17 00:00:00 2001
-From: Gowtham Tammana <g-tammana@ti.com>
-Date: Mon, 28 Sep 2020 21:15:52 -0500
-Subject: [PATCH] meson: check for gles3 support
-
-Some cores don't support gles3, so compile gles3 targets
-conditionally.
-
-Upstream-Status: Pending
-
-Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
----
- meson.build | 22 +++++++++++++++-------
- 1 file changed, 15 insertions(+), 7 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index df9c315..8bba902 100644
---- a/meson.build
-+++ b/meson.build
-@@ -91,12 +91,20 @@ else
-   message('Building without gstreamer support')
- endif
- 
--executable('kmscube', sources, dependencies : dep_common, install : true)
-+# GLES3 check
-+gles3_h = false
-+if dep_gles2.found()
-+  gles3_h = cc.has_header('GLES3/gl3.h', dependencies: dep_gles2)
-+endif
- 
-+executable('kmscube', sources, dependencies : dep_common, install : true)
- 
--executable('texturator', files(
--	'common.c',
--	'drm-legacy.c',
--	'drm-common.c',
--	'texturator.c',
--), dependencies : dep_common, install : true)
-+if gles3_h
-+  message('Building with GLES3 support')
-+  executable('texturator', files(
-+    'common.c',
-+    'drm-legacy.c',
-+    'drm-common.c',
-+    'texturator.c',
-+  ), dependencies : dep_common, install : true)
-+endif
--- 
-2.17.1
-
diff --git a/meta-arago-distro/recipes-graphics/kmscube/kmscube_%.bbappend b/meta-arago-distro/recipes-graphics/kmscube/kmscube_%.bbappend
deleted file mode 100644
index df1ca872..00000000
--- a/meta-arago-distro/recipes-graphics/kmscube/kmscube_%.bbappend
+++ /dev/null
@@ -1,11 +0,0 @@
-FILESEXTRAPATHS:append := "${THISDIR}/${PN}:"
-
-SRCREV = "76bb57d539cb43d267e561024c34e031bf351e04"
-
-SRC_URI += " \
-file://0001-meson-check-for-gles3-support.patch \
-"
-
-CFLAGS += "-fcommon"
-
-PR:append = ".arago2"
-- 
2.39.1


