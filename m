Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 36AFF520DF
	for <meta-arago@arago-project.org>;
	Mon, 30 Sep 2019 19:37:49 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8UJacT1087706
	for <meta-arago@arago-project.org>; Mon, 30 Sep 2019 14:36:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569872198;
	bh=DdGGXM0a10kk6svY6joL3AQmSA6jQQxNpdUPYW+Q6Jo=;
	h=From:To:CC:Subject:Date;
	b=esRM85T0BuMlYeGktRL12vbUu/w+1DsCT/7nl9cZi3kCLUzogvDwCuw/jGe2HvQGo
	hYfuQinn4AazW1c4hWYd5VOaLPkmt1ZQCYkmdThOMvL3aq75cbQKGkZxeS3amND728
	cFKjuSPL69fG58WvL1uK/khhAPZ9n1FMLLRvwhMU=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8UJac1C076744
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 30 Sep 2019 14:36:38 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 30 Sep 2019 14:36:28 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 30 Sep 2019 14:36:28 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8UJabwq096877;
	Mon, 30 Sep 2019 14:36:37 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 30 Sep 2019 19:20:52 +0000
Message-ID: <20190930192052.15379-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] gadget-init: remove
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
X-List-Received-Date: Mon, 30 Sep 2019 19:37:49 -0000
Content-Type: text/plain

This was sysvinit specific version of gadget-init script. As meta-ti
provides a systemd specific version, remove this deprecated one.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-tisdk/gadget-init/gadget-init.bb  | 21 ----------------
 .../gadget-init/gadget-init/init              | 25 -------------------
 2 files changed, 46 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-tisdk/gadget-init/gadget-init.bb
 delete mode 100644 meta-arago-distro/recipes-tisdk/gadget-init/gadget-init/init

diff --git a/meta-arago-distro/recipes-tisdk/gadget-init/gadget-init.bb b/meta-arago-distro/recipes-tisdk/gadget-init/gadget-init.bb
deleted file mode 100644
index b13befee..00000000
--- a/meta-arago-distro/recipes-tisdk/gadget-init/gadget-init.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-# This recipe is based on the recipe by Koen in meta-texasinstruments
-DESCRIPTION = "Scripts to initialize usb gadgets"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
-
-PR = "r3"
-
-SRC_URI = "file://init"
-
-INITSCRIPT_NAME = "storage-gadget-init"
-INITSCRIPT_PARAMS = "defaults 98"
-
-inherit update-rc.d
-
-do_install() {
-    install -d ${D}${sysconfdir}/init.d
-    install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/storage-gadget-init
-}
-
-FILES_${PN} = "${sysconfdir} ${bindir}"
-RRECOMMENDS_${PN} += "kernel-module-g-ether kernel-module-g-mass-storage"
diff --git a/meta-arago-distro/recipes-tisdk/gadget-init/gadget-init/init b/meta-arago-distro/recipes-tisdk/gadget-init/gadget-init/init
deleted file mode 100644
index 872f7f56..00000000
--- a/meta-arago-distro/recipes-tisdk/gadget-init/gadget-init/init
+++ /dev/null
@@ -1,25 +0,0 @@
-#!/bin/sh
-
-
-case "$1" in
-    start )
-        # If this is a 3 partition card mount the first and third
-        # partition.  Else only mount the first one.
-        if [ -e /dev/mmcblk0p1 -a -e /dev/mmcblk0p3 ]
-        then
-            modprobe g_mass_storage file=/dev/mmcblk0p1,/dev/mmcblk0p3
-        elif [ -e /dev/mmcblk0p1 ]
-        then
-            modprobe g_mass_storage file=/dev/mmcblk0p1
-        fi
-    ;;
-    stop )
-        lsmod | grep g_mass_storage > /dev/null
-        if [ "$?" == "0" ]
-        then
-            rmmod g_mass_storage
-        fi
-    ;;
-esac
-
-exit 0
-- 
2.17.1


