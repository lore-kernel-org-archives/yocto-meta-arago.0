Return-Path: <e-ruei1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 16D2352A41
	for <meta-arago@arago-project.org>;
	Tue, 10 Sep 2019 18:15:04 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8AIDwWv016266
	for <meta-arago@arago-project.org>; Tue, 10 Sep 2019 13:13:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568139238;
	bh=1agjasEgWyMIjD19dsk9jQ3MNor/HmAJpt1DZquO/iU=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Hm2g73UCbTGUukEis0lTATG+cQ3rfQDlCD/wg+PvS9P8ZPcF2TGXGomd3Z9v/lzzl
	V7WJoAu2EGbXQyMXffu+dL0h4Ar1okuqMJ6lz0ERTl6ffL1PGfjO6Whm+Y//ZfukBQ
	NzI1iNgs9Z3CNvQ/krZpf9k9zfkWqBPaKg6GTwQg=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8AIDwtW060064
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 10 Sep 2019 13:13:58 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 10 Sep 2019 13:13:57 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 10 Sep 2019 13:13:57 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8AIDunx035961
	for <meta-arago@arago-project.org>; Tue, 10 Sep 2019 13:13:57 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 10 Sep 2019 14:11:27 -0400
Message-ID: <20190910181131.8808-6-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190910181131.8808-1-e-ruei1@ti.com>
References: <20190910181131.8808-1-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH 5/9] HACK: weston: undefine HAVE_GBM_MODIFIERS unconditionally
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
X-List-Received-Date: Tue, 10 Sep 2019 18:15:06 -0000
Content-Type: text/plain

HAVE_GBM_MODIFIERS has not been fully supported by MESA-based egl yet.

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 ...mposito-drm-undef-HAVE_GBM_MODIFIERS.patch | 29 +++++++++++++++++++
 .../wayland/weston_5.0.0.bbappend             |  3 +-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 recipes-graphics/wayland/weston/0001-HACK-composito-drm-undef-HAVE_GBM_MODIFIERS.patch

diff --git a/recipes-graphics/wayland/weston/0001-HACK-composito-drm-undef-HAVE_GBM_MODIFIERS.patch b/recipes-graphics/wayland/weston/0001-HACK-composito-drm-undef-HAVE_GBM_MODIFIERS.patch
new file mode 100644
index 0000000..56a78e4
--- /dev/null
+++ b/recipes-graphics/wayland/weston/0001-HACK-composito-drm-undef-HAVE_GBM_MODIFIERS.patch
@@ -0,0 +1,29 @@
+From e406b4141c23fb762a14a09d565c363ebaccb5a4 Mon Sep 17 00:00:00 2001
+From: Eric Ruei <e-ruei1@ti.com>
+Date: Sun, 1 Sep 2019 08:28:27 -0400
+Subject: [PATCH] HACK: composito-drm: undef HAVE_GBM_MODIFIERS
+
+HAVE_GBM_MODIFIERS is defined, but not fully supported by the gbm module
+yet.
+
+Signed-off-by: Eric Ruei <e-ruei1@ti.com>
+---
+ libweston/compositor-drm.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libweston/compositor-drm.c b/libweston/compositor-drm.c
+index d92ecfcd..88f845a8 100644
+--- a/libweston/compositor-drm.c
++++ b/libweston/compositor-drm.c
+@@ -68,6 +68,8 @@
+ #include "linux-dmabuf-unstable-v1-server-protocol.h"
+ #include "linux-explicit-synchronization.h"
+ 
++#undef HAVE_GBM_MODIFIERS
++
+ #ifndef DRM_CLIENT_CAP_ASPECT_RATIO
+ #define DRM_CLIENT_CAP_ASPECT_RATIO	4
+ #endif
+-- 
+2.17.1
+
diff --git a/recipes-graphics/wayland/weston_5.0.0.bbappend b/recipes-graphics/wayland/weston_5.0.0.bbappend
index 379f110..e95f38b 100644
--- a/recipes-graphics/wayland/weston_5.0.0.bbappend
+++ b/recipes-graphics/wayland/weston_5.0.0.bbappend
@@ -1,7 +1,8 @@
-PR_append = ".tisdk0"
+PR_append = ".tisdk1"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 SRC_URI += " \
 	file://0001-Add-soc-performance-monitor-utilites.patch \
+	file://0001-HACK-composito-drm-undef-HAVE_GBM_MODIFIERS.patch \
 "
-- 
2.17.1


