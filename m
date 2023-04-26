Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF861C7618E
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 09:35:47 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.3814.1682501745215440932
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 26 Apr 2023 02:35:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=hMjGwQzd;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: p-bhagat@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33Q9ZiES082779
	for <meta-arago@lists.yoctoproject.org>; Wed, 26 Apr 2023 04:35:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682501744;
	bh=MT2S+WU96HM4jDKQhca+LXuMYOoloWtPn3qY4QYNcv0=;
	h=From:To:CC:Subject:Date;
	b=hMjGwQzdQsCinKc/C1DHSGtnOw25RBYuCHbPO/FJNqRFalPUtp6xcE/Ji5aSIr+5z
	 pqjcQOBbGoa87Az4pIYjLpsl9TFeAq21ADDfs2PqLQMob5+jM9D0YS7tZXQgD9Hhjc
	 MnhQaxzB005pCyhsJlR+dpPxLMXw9MlefdHPy+Gw=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33Q9Zii5005988
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 26 Apr 2023 04:35:44 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 26
 Apr 2023 04:35:43 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 26 Apr 2023 04:35:43 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33Q9Zg32104405;
	Wed, 26 Apr 2023 04:35:43 -0500
From: paresh-ti <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>
CC: <c-shilwant@ti.com>, <s-adivi@ti.com>, <g-gupta@ti.com>
Subject: [kirkstone][PATCH v2] meta-arago-distro: Add Jailhouse support for am62xx
Date: Wed, 26 Apr 2023 15:05:33 +0530
Message-ID: <20230426093533.14848-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 26 Apr 2023 09:35:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14346

- Update arago conf to add support for jailhouse in am62xx.
- Update package group to add support for jailhouse for am62xx.

Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
Signed-off-by: paresh-ti <p-bhagat@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf                       | 3 +++
 meta-arago-distro/conf/distro/include/arago-prefs.inc          | 3 +++
 .../packagegroups/packagegroup-arago-tisdk-addons.bb           | 1 +
 3 files changed, 7 insertions(+)

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
index 8d8a36f6..66fa6451 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -59,6 +59,7 @@ UTILS:append:k3 = " mmc-utils \
 
 UTILS:append:k3 = " ti-rtos-firmware"
 UTILS:append:am64xx = " pru-icss"
+UTILS:append:am62xx = " pru-icss jailhouse"
 UTILS:append:am65xx = " pru-icss"
 UTILS:append:j721e = " pru-icss"
 
-- 
2.17.1


