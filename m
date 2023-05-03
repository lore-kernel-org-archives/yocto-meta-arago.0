Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DB38C77B78
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 13:35:01 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.19400.1683120896825341253
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 03 May 2023 06:34:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=HmYbHHbw;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: p-bhagat@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 343DYtxk043618
	for <meta-arago@lists.yoctoproject.org>; Wed, 3 May 2023 08:34:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1683120895;
	bh=2Y2zyqXs6tzCfcKPnzhMTOaTXdHDOA6l5Cg+4SwQTzw=;
	h=From:To:CC:Subject:Date;
	b=HmYbHHbwwMSXUBMIqAIgA0/8ocQ1dsK4mJsX2wniUNhoP4MaBpLhQ5Qfp0onnWthc
	 fXyi8Ler46+K8IF32IvofN08ekvucfrbf1afO0YFZqceD+jhidkuc5A+IfoHLUE5J+
	 x7xtV7Z6an4tUUzNqyujB4FjKRXfxgfnKmHwKiNU=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 343DYtfr058699
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 3 May 2023 08:34:55 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 3
 May 2023 08:34:55 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 3 May 2023 08:34:55 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 343DYsIW013442;
	Wed, 3 May 2023 08:34:55 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>
CC: <khasim@ti.com>, <c-shilwant@ti.com>, <s-adivi@ti.com>, <g-gupta@ti.com>,
        <dannenberg@ti.com>
Subject: [kirkstone][PATCH v5] meta-arago-distro: Add Jailhouse support for am62xx
Date: Wed, 3 May 2023 19:04:37 +0530
Message-ID: <20230503133437.10469-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 03 May 2023 13:35:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14393

Update arago conf to add support for jailhouse in am62xx.
Update package group to add support for jailhouse for am62xx.
Optionally build jailhouse for am62xx if JAILHOUSE_ENABLE is set to 1.

Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf                      | 3 +++
 .../packagegroups/packagegroup-arago-tisdk-addons.bb          | 4 ++++
 2 files changed, 7 insertions(+)

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
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 8d8a36f6..f3e45bb2 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -59,6 +59,10 @@ UTILS:append:k3 = " mmc-utils \
 
 UTILS:append:k3 = " ti-rtos-firmware"
 UTILS:append:am64xx = " pru-icss"
+
+JAILHOUSE_ENABLE ?= "0"
+UTILS:append:am62xx = " ${@oe.utils.conditional("JAILHOUSE_ENABLE", "1", "jailhouse", "", d)}"
+
 UTILS:append:am65xx = " pru-icss"
 UTILS:append:j721e = " pru-icss"
 
-- 
2.17.1


