Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 968B2C77B61
	for <webhook@archiver.kernel.org>; Tue, 25 Apr 2023 10:42:57 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.75771.1682419369958193404
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 25 Apr 2023 03:42:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=qUF38BfC;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: p-bhagat@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33PAgnhY004126
	for <meta-arago@lists.yoctoproject.org>; Tue, 25 Apr 2023 05:42:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682419369;
	bh=v/x6BDu3sv727DlkOfrqj5+Iv3+FKbp23qSpn/koeFI=;
	h=From:To:CC:Subject:Date;
	b=qUF38BfCYQkBaU5aV/ettG83XW7GBt02n9IqEzA+EV0uWoz+W9+vcNY1E/rXHiBA3
	 3bbRW1wqDv3pMve9MaRqv1F2SayLAA/SgEC1BIltOeRScEogx9APO6QR5h43TyUNxx
	 jy0hidsge+A+a2EWUrP9ePcfIMGaLDkwLwanU8N4=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33PAgnHw009265
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 25 Apr 2023 05:42:49 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 25
 Apr 2023 05:42:49 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 25 Apr 2023 05:42:49 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33PAgmmQ012582;
	Tue, 25 Apr 2023 05:42:48 -0500
From: paresh-ti <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>
CC: <c-shilwant@ti.com>, <s-adivi@ti.com>, <g-gupta@ti.com>
Subject: [kirkstone][PATCH] meta-arago-distro: Add Jailhouse support for am62xx
Date: Tue, 25 Apr 2023 16:12:41 +0530
Message-ID: <20230425104241.31410-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 25 Apr 2023 10:42:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14344

- Update arago conf to add support for jailhouse in am62xx.
- Update package group to add support for jailhouse for am62xx.

Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
Signed-off-by: paresh-ti <p-bhagat@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf                       | 3 +++
 meta-arago-distro/conf/distro/include/arago-prefs.inc          | 3 +++
 .../packagegroups/packagegroup-arago-tisdk-addons.bb           | 2 ++
 3 files changed, 8 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 094e67da..3e4c4644 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -121,6 +121,9 @@ PACKAGECONFIG:append:pn-cairo = " egl glesv2"
 PACKAGECONFIG:remove:pn-alsa-plugins = "pulseaudio"
 RDEPENDS:pulseaudio-server:remove = "alsa-plugins-pulseaudio-conf"
 
+# Configure RAMFS for jailhouse linux-demo
+JH_RAMFS_IMAGE = "tisdk-tiny-image"
+
 # Enable UI and scripting for perf
 PERF_FEATURES_ENABLE ?= "perf-scripting perf-tui"
 
diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 34c3c539..c632e111 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -19,3 +19,6 @@ PREFERRED_PROVIDER_wpa-supplicant = "wpa-supplicant"
 #PREFERRED_PROVIDER_wpa-supplicant:ti33x = "wpa-supplicant-wl18xx"
 #PREFERRED_PROVIDER_wpa-supplicant:ti43x = "wpa-supplicant-wl18xx"
 #PREFERRED_PROVIDER_wpa-supplicant:omap-a15 = "wpa-supplicant-wl18xx"
+
+CREATE_SRCIPK:pn-jailhouse ?= "1"
+SRCIPK_INSTALL_DIR:pn-jailhouse ?= "board-support/extra-drivers/${PN}-${PV}"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 8d8a36f6..271c05ab 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -52,6 +52,7 @@ UTILS:append:omap-a15 = " mmc-utils \
 UTILS:append:k3 = " mmc-utils \
                     switch-config \
                     irqbalance \
+                    jailhouse \
                     ti-rpmsg-char \
                     ti-rpmsg-char-examples \
                     statcol \
@@ -59,6 +60,7 @@ UTILS:append:k3 = " mmc-utils \
 
 UTILS:append:k3 = " ti-rtos-firmware"
 UTILS:append:am64xx = " pru-icss"
+UTILS:append:am62xx = " pru-icss jailhouse"
 UTILS:append:am65xx = " pru-icss"
 UTILS:append:j721e = " pru-icss"
 
-- 
2.17.1


