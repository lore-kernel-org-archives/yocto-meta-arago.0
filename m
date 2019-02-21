Return-Path: <x0038811@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 405875298F
	for <meta-arago@arago-project.org>;
	Thu, 21 Feb 2019 09:18:51 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x1L9Inv2122322
	for <meta-arago@arago-project.org>; Thu, 21 Feb 2019 03:18:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1550740729;
	bh=EWHcHhdd2dBjqrpex9XpTwhFsHZYD2e0YK9YoePJubc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=FG2QPfdpdcEhTcZgnGnSaMrdJ0wBy/pv82J53abGJXyQDE3/xrHi233NK15Li7EWu
	u19MXGRbuNzzqBzeqItJIU9CAlv34FFNfNWrcZyV9a4XiqehHbRPfnusZcUnmHRZNm
	vdX57a4w5n44fymbYqeYrGD8lnv7FA/0TwmImBaU=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x1L9ImwH116392
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 21 Feb 2019 03:18:48 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Thu, 21 Feb 2019 03:18:48 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Thu, 21 Feb 2019 03:18:48 -0600
Received: from udx0038811.india.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x1L9IdpK009115;
	Thu, 21 Feb 2019 03:18:47 -0600
From: Ramprasad N <x0038811@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 21 Feb 2019 14:48:21 +0530
Message-ID: <1550740703-19443-7-git-send-email-x0038811@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1550740703-19443-1-git-send-email-x0038811@ti.com>
References: <1550740703-19443-1-git-send-email-x0038811@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master 6/8] gstreamer1.0-plugins-ducati: stop using -export-symbols-regex
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
X-List-Received-Date: Thu, 21 Feb 2019 09:18:54 -0000
Content-Type: text/plain

The old regex is no longer correct for GStreamer 1.14.

Signed-off-by: Ramprasad N <x0038811@ti.com>
---
 ...onfigure.ac-stop-using-export-symbols-reg.patch | 28 ++++++++++++++++++++++
 .../gstreamer1.0-plugins-ducati_git.bb             |  3 ++-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati/0001-gstducati-configure.ac-stop-using-export-symbols-reg.patch

diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati/0001-gstducati-configure.ac-stop-using-export-symbols-reg.patch b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati/0001-gstducati-configure.ac-stop-using-export-symbols-reg.patch
new file mode 100644
index 0000000..4104e24
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati/0001-gstducati-configure.ac-stop-using-export-symbols-reg.patch
@@ -0,0 +1,28 @@
+From acee970074eb12116c1d494242a6a9cf51470638 Mon Sep 17 00:00:00 2001
+From: Ramprasad N <x0038811@ti.com>
+Date: Thu, 7 Feb 2019 12:22:17 +0530
+Subject: [PATCH] gstducati: configure.ac stop using -export-symbols-regex
+
+The old regex is no longer correct for GStreamer 1.14.
+
+Signed-off-by: Ramprasad N <x0038811@ti.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 8a44019..b9f0de7 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -135,7 +135,7 @@ AC_SUBST(GST_ALL_LDFLAGS)
+ 
+ dnl this really should only contain flags, not libs - they get added before
+ dnl whatevertarget_LIBS and -L flags here affect the rest of the linking
+-GST_PLUGIN_LDFLAGS="-module -avoid-version -export-symbols-regex '^[_]*gst_plugin_desc\$\$' $GST_ALL_LDFLAGS"
++GST_PLUGIN_LDFLAGS="-module -avoid-version $GST_ALL_LDFLAGS"
+ AC_SUBST(GST_PLUGIN_LDFLAGS)
+ 
+ AC_CONFIG_FILES([Makefile src/Makefile])
+-- 
+1.9.1
+
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
index 556dc31..7c054ef 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
@@ -4,12 +4,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
 require gstreamer1.0-plugins-ti.inc
 
-PR = "${INC_PR}.29"
+PR = "${INC_PR}.30"
 SRCREV = "19e911bb45757d8341ffd7819ca783ca04f5e3b1"
 
 BRANCH ?= "master"
 
 SRC_URI = "git://git.ti.com/glsdk/gst-plugin-ducati.git;protocol=git;branch=${BRANCH} \
+	   file://0001-gstducati-configure.ac-stop-using-export-symbols-reg.patch \
           "
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-- 
1.9.1


