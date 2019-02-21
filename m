Return-Path: <x0038811@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 6600052A52
	for <meta-arago@arago-project.org>;
	Thu, 21 Feb 2019 09:18:52 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x1L9IoPq089939
	for <meta-arago@arago-project.org>; Thu, 21 Feb 2019 03:18:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1550740730;
	bh=eugO/OuZIOpfkRD27OhsFw/kICjR14QIBPhEnciyEgg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=XWDEWCHPQto7tCCWeoVfwSZ+/P9W7ZNlArosrBqen0LwiuWUclKt04WD06eiIrNYw
	FQzdPGcV+cDrSrGGtRmL4iDxHO3Cpf6qwjNg4JG+JtsihqkfOyobh434N6tzV23usZ
	1HoIX/4aJ9Juh8HgNWrgnCmQV6gdwcQZzfRbWpig=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x1L9Iolh080438
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 21 Feb 2019 03:18:50 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Thu, 21 Feb 2019 03:18:49 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Thu, 21 Feb 2019 03:18:49 -0600
Received: from udx0038811.india.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x1L9IdpL009115;
	Thu, 21 Feb 2019 03:18:48 -0600
From: Ramprasad N <x0038811@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 21 Feb 2019 14:48:22 +0530
Message-ID: <1550740703-19443-8-git-send-email-x0038811@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1550740703-19443-1-git-send-email-x0038811@ti.com>
References: <1550740703-19443-1-git-send-email-x0038811@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master 7/8] gstreamer1.0-plugins-vpe: stop using -export-symbols-regex
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
X-List-Received-Date: Thu, 21 Feb 2019 09:18:55 -0000
Content-Type: text/plain

The old regex is no longer correct for GStreamer 1.14.
Rename PACKAGE name to avoid loading failure

Signed-off-by: Ramprasad N <x0038811@ti.com>
---
 ...figure.ac-stop-using-export-symbols-regex.patch | 52 ++++++++++++++++++++++
 .../gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb |  3 +-
 2 files changed, 54 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe/0001-gstvpe-configure.ac-stop-using-export-symbols-regex.patch

diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe/0001-gstvpe-configure.ac-stop-using-export-symbols-regex.patch b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe/0001-gstvpe-configure.ac-stop-using-export-symbols-regex.patch
new file mode 100644
index 0000000..d68c152
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe/0001-gstvpe-configure.ac-stop-using-export-symbols-regex.patch
@@ -0,0 +1,52 @@
+From d267a3b19dc6070fcb632c855f0fd51ad3f19bdb Mon Sep 17 00:00:00 2001
+From: Ramprasad N <x0038811@ti.com>
+Date: Thu, 7 Feb 2019 12:23:20 +0530
+Subject: [PATCH] gstvpe:configure.ac stop using -export-symbols-regex
+
+The old regex is no longer correct for GStreamer 1.14.
+PACKAGE defined as vpeplugin generates a symbol
+gst_plugin_vpeplugin_get_desc in GST 1.14. But while loading the
+the plugin it is not able find this symbol and results in
+undefined symbol as --export-symbols option is no more supported.
+
+Rename PACKAGE to vpe to get the expected symbol
+gst_plugin_vpe_get_desc
+
+Signed-off-by: Ramprasad N <x0038811@ti.com>
+---
+ configure.ac | 2 +-
+ src/gstvpe.c | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 7c95086..10a91a6 100644
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
+diff --git a/src/gstvpe.c b/src/gstvpe.c
+index e5f9ade..42c4362 100644
+--- a/src/gstvpe.c
++++ b/src/gstvpe.c
+@@ -1219,9 +1219,9 @@ plugin_init (GstPlugin * plugin)
+  * compile this code. GST_PLUGIN_DEFINE needs PACKAGE to be defined.
+  */
+ #ifndef PACKAGE
+-#define PACKAGE "vpeplugin"
++#define PACKAGE "vpe"
+ #endif
+ 
+-GST_PLUGIN_DEFINE (GST_VERSION_MAJOR, GST_VERSION_MINOR, vpeplugin,
++GST_PLUGIN_DEFINE (GST_VERSION_MAJOR, GST_VERSION_MINOR, vpe,
+     "Hardware accelerated video porst-processing using TI VPE (V4L2-M2M) driver on DRA7x SoC",
+     plugin_init, VERSION, "LGPL", "GStreamer", "http://gstreamer.net/")
+-- 
+1.9.1
+
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
index 2a654ef..ae7b25f 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
@@ -5,11 +5,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
 require gstreamer1.0-plugins-ti.inc
 
-PR = "${INC_PR}.19"
+PR = "${INC_PR}.20"
 SRCREV = "b9dba5a8bc7d14d55125abdce04672e3dc30bbdf"
 
 SRC_URI = "git://git.ti.com/glsdk/gst-plugin-vpe.git;protocol=git \
            file://ti-video.conf \
+           file://0001-gstvpe-configure.ac-stop-using-export-symbols-regex.patch \
 "
 
 do_install_append() {
-- 
1.9.1


