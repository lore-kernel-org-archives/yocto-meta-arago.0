Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id C660A529BF
	for <meta-arago@arago-project.org>;
	Tue, 10 Jul 2018 00:53:56 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6A0roEl010190
	for <meta-arago@arago-project.org>; Mon, 9 Jul 2018 19:53:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531184030;
	bh=yTij88+Wv72HWE1cj2WoDCbSi4/VAAHtZi6G0Qp53UU=;
	h=From:To:CC:Subject:Date;
	b=eTdVsiHRhG/sA3/KqxCqhGLqMtdwmdN86cuHDZfku50qQMQnnyFwcK5pw2GZxHwTA
	L9yoWthpmOPRKvf6srjZq6Vh1K3QELKGeeiRMiH1ZRHe/fewL6fB2OO7jzMmSwe5cC
	MUHYsP5x9xP3Zc8Baonz/k2QGQtncwOFfha9WTcc=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6A0roKb032346
	for <meta-arago@arago-project.org>; Mon, 9 Jul 2018 19:53:50 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 9 Jul 2018 19:53:49 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 9 Jul 2018 19:53:50 -0500
Received: from puget.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6A0rnaB002199;
	Mon, 9 Jul 2018 19:53:49 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 10 Jul 2018 00:52:24 +0000
Message-ID: <20180710005224.23878-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH] gstreamer1.0-plugins-base: remove HACK patch from 1.8.3
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
X-List-Received-Date: Tue, 10 Jul 2018 00:53:57 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...n-HACK-Change-default-value-of-flags.patch | 30 -------------------
 .../gstreamer1.0-plugins-base_1.8.3.bbappend  |  6 ----
 2 files changed, 36 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-playbin-HACK-Change-default-value-of-flags.patch
 delete mode 100644 meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.8.3.bbappend

diff --git a/meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-playbin-HACK-Change-default-value-of-flags.patch b/meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-playbin-HACK-Change-default-value-of-flags.patch
deleted file mode 100644
index 8a85b5de..00000000
--- a/meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-playbin-HACK-Change-default-value-of-flags.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 436543acab9441ebb121da74b6433eae43bc8786 Mon Sep 17 00:00:00 2001
-From: Pooja Prajod <a0132412@ti.com>
-Date: Fri, 24 Mar 2017 18:24:15 +0530
-Subject: [PATCH] HACK: playbin: Change default value of flags
-
-The deinterlace flag in playbin is causing
-high cpu load which in turn lowers fps of the playback.
-The behavior is not yet rootcaused. This is a workaround.
-
-Signed-off-by: Pooja Prajod <a0132412@ti.com>
----
- gst/playback/gstplaybin2.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gst/playback/gstplaybin2.c b/gst/playback/gstplaybin2.c
-index ad63600..13439e3 100644
---- a/gst/playback/gstplaybin2.c
-+++ b/gst/playback/gstplaybin2.c
-@@ -524,7 +524,7 @@ struct _GstPlayBinClass
- #define DEFAULT_SUBURI            NULL
- #define DEFAULT_SOURCE            NULL
- #define DEFAULT_FLAGS             GST_PLAY_FLAG_AUDIO | GST_PLAY_FLAG_VIDEO | GST_PLAY_FLAG_TEXT | \
--                                  GST_PLAY_FLAG_SOFT_VOLUME | GST_PLAY_FLAG_DEINTERLACE | \
-+                                  GST_PLAY_FLAG_SOFT_VOLUME | \
-                                   GST_PLAY_FLAG_SOFT_COLORBALANCE
- #define DEFAULT_N_VIDEO           0
- #define DEFAULT_CURRENT_VIDEO     -1
--- 
-1.9.1
-
diff --git a/meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.8.3.bbappend b/meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.8.3.bbappend
deleted file mode 100644
index aa6710f1..00000000
--- a/meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.8.3.bbappend
+++ /dev/null
@@ -1,6 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-SRC_URI_append = " \
-    file://0001-playbin-HACK-Change-default-value-of-flags.patch \
-"
-PR_append = ".arago0"
-- 
2.17.1


