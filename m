Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BCA0C7EE23
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 17:12:05 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.708.1684775522587265092
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 22 May 2023 10:12:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=dGvc4U6N;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34MHBwFt099680;
	Mon, 22 May 2023 12:11:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684775518;
	bh=EGNFIvC7TKivUiHlJjSPAKTJ5nqRb7sL4MFExc/enUQ=;
	h=From:To:CC:Subject:Date;
	b=dGvc4U6N5cUNpaz9WojIQKv+Ycjq2HlyYPU3i6LOCKuPApPyJn4bG3xPA98TVJGRE
	 lQa+jzy1pRlG/FlzwmLMZ+jXXsw48nh6Debuq7Zlnxtre7GCAJ1XN9hLMNDa+TYkCp
	 wXgdtJsrD3IYb0OLyuDoGAzn1XbNBWFldEtHaziQ=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34MHBw96029821
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 22 May 2023 12:11:58 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 22
 May 2023 12:11:58 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 22 May 2023 12:11:58 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34MHBv7R065724;
	Mon, 22 May 2023 12:11:57 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Ryan Eatmon <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Randolph Sapp <rs@ti.com>, Gyan Gupta <g-gupta@ti.com>
Subject: [PATCH] recipes-graphics: wayland: Add systemd service to launch weston on boot
Date: Mon, 22 May 2023 22:41:55 +0530
Message-ID: <20230522171155.15200-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 22 May 2023 17:12:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14427

- openembedded-core:kirkstone added a condition to package weston init.d script only when VIRTUAL-RUNTIME_init_manager isn't systemd which wasn't in dunfell. Hence, manually install and ship the weston init.d script.

- Add weston-init.service file which is a systemd service which will launch the weston init.d script. Make this service file run on boot by adding it to SYSTEMD_SERVICE.

- Reassign INITSCRIPT_NAME and INITSCRIPT_PARAMS values to nothing as weston-init.service will now be the service file.

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 .../wayland/weston-init.bbappend              | 20 ++++++++++++++-----
 .../wayland/weston-init/weston-init.service   | 10 ++++++++++
 2 files changed, 25 insertions(+), 5 deletions(-)
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-init/weston-init.service

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
index 28e7ae39..c294fba4 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
@@ -1,23 +1,33 @@
 FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
 
-PR:append = ".arago12"
+PR:append = ".arago13"
 
 SRC_URI:append = " \
     file://runWeston \
     file://wayland_env.sh \
     file://weston.ini \
+    file://weston-init.service \
 "
 
 do_install:append() {
     install -d ${D}${bindir}
     install -m 755 ${WORKDIR}/runWeston ${D}${bindir}
     rm -rf ${D}${systemd_system_unitdir}
-
+ 
     install -d ${D}${sysconfdir}/profile.d
     install -m 0644 ${WORKDIR}/weston.ini ${D}${sysconfdir}
     install -m 0644 ${WORKDIR}/wayland_env.sh ${D}${sysconfdir}/profile.d/
+    install -Dm755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/weston
+    sed -i 's#ROOTHOME#${ROOT_HOME}#' ${D}/${sysconfdir}/init.d/weston
+    
+    install -d ${D}${sysconfdir}/systemd/system
+    install -D -p -m0644 ${WORKDIR}/weston-init.service ${D}${sysconfdir}/systemd/system/weston.service
+    install -D -p -m0644 ${WORKDIR}/weston.socket ${D}${sysconfdir}/systemd/system
 }
 
-FILES:${PN}:remove = "${systemd_system_unitdir}/weston.service ${systemd_system_unitdir}/weston.socket"
-FILES:${PN} += "${sysconfdir}/profile.d/* ${sysconfdir}/weston.ini"
-SYSTEMD_SERVICE:${PN}:remove = "weston.service weston.socket"
+FILES:${PN} += "${sysconfdir}/profile.d/* ${sysconfdir}/weston.ini ${sysconfdir}/systemd/system/weston.service ${sysconfdir}/systemd/system/weston.socket"
+
+SYSTEMD_SERVICE:${PN} = "weston.service"
+
+INITSCRIPT_NAME = ""
+INITSCRIPT_PARAMS = ""
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init/weston-init.service b/meta-arago-distro/recipes-graphics/wayland/weston-init/weston-init.service
new file mode 100644
index 00000000..d4c7d472
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init/weston-init.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Systemd Service to Start Weston
+
+[Service]
+Type=forking
+ExecStart=/etc/init.d/weston start
+StandardOutput=journal
+
+[Install]
+WantedBy=multi-user.target 
-- 
2.34.1


