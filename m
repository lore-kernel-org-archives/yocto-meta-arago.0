Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECD36C77B60
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 10:29:17 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.16067.1682677752158629740
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 28 Apr 2023 03:29:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=pfQc1nOD;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: p-bhagat@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33SATBmh043138
	for <meta-arago@lists.yoctoproject.org>; Fri, 28 Apr 2023 05:29:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682677751;
	bh=bmP10cGUS98cQdZjM7EgUgmViwiE6eoyk+nIjySpH9A=;
	h=From:To:CC:Subject:Date;
	b=pfQc1nODoJpIFGJn+8GcJbLYPOZZeJ4BZ2e2Ujteb59p22gvAFhKdHp9CDukPbVIQ
	 CX27Hr/pFTvs8iK3BEtR8/IrWwrmxMU4LpQXHI4LfAtp296UB/B8xNDiwK+BumMF5L
	 +WOeNG/SGnnT8bLHOkuWBe/l9zTv+CUtWBbuK+04=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33SATBmp108928
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Fri, 28 Apr 2023 05:29:11 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 28
 Apr 2023 05:29:10 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 28 Apr 2023 05:29:10 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33SATAJU004693;
	Fri, 28 Apr 2023 05:29:10 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>
CC: <khasim@ti.com>, <c-shilwant@ti.com>, <s-adivi@ti.com>, <g-gupta@ti.com>,
        <dannenberg@ti.com>
Subject: [kirkstone][PATCH v4] meta-arago-distro: Add Jailhouse support 
Date: Fri, 28 Apr 2023 15:57:17 +0530
Message-ID: <20230428102717.11150-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 28 Apr 2023 10:29:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14378

Update arago conf to add support for jailhouse in am62xx.
Update package group to add support for jailhouse for am62xx.

Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf                       | 3 +++
 .../packagegroups/packagegroup-arago-tisdk-addons.bb           | 1 +
 2 files changed, 4 insertions(+)

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
index 8d8a36f6..6c58f209 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -59,6 +59,7 @@ UTILS:append:k3 = " mmc-utils \
 
 UTILS:append:k3 = " ti-rtos-firmware"
 UTILS:append:am64xx = " pru-icss"
+UTILS:append:am62xx = " jailhouse"
 UTILS:append:am65xx = " pru-icss"
 UTILS:append:j721e = " pru-icss"
 
-- 
2.17.1


