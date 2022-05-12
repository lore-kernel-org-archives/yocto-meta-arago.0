Return-Path: <a-m1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B351C433EF
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 15:29:06 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.94.1652369337428877319
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 12 May 2022 08:28:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=x+s7qpux;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: a-m1@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24CFSqFO004569;
	Thu, 12 May 2022 10:28:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1652369332;
	bh=j2WoLCHTXbRsI0gTra2qDlpFXCrvgHDsDatNIe06CNw=;
	h=From:To:CC:Subject:Date;
	b=x+s7qpuxXZrXOceLfpMxTCnqMzz8O7gdEW2LeG0pBnhzpFNgh+JvCjg0/YbDhuMtt
	 BOJbl18JeO7tUqKRONcWu3eb497Qed7vqBk+LVadC3jlWxk+txmOvDrVClXi/ZaV8L
	 v5+m6E4LsZuwRMDzle5tplp7RyfPB6g0maD7jiFg=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24CFSquk026082
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 12 May 2022 10:28:52 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 12
 May 2022 10:28:52 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 12 May 2022 10:28:52 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24CFSmIZ108005;
	Thu, 12 May 2022 10:28:49 -0500
From: Aparna M <a-m1@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <denis@denix.org>,
        <reatmon@ti.com>, <nm@ti.com>
CC: <devarsht@ti.com>, <s-adivi@ti.com>
Subject: [meta-arago][dunfell][PATCH] tisdk-core-bundle: Add ti-sci-firmware
 binary to prebuilt-images directory of SDK
Date: Thu, 12 May 2022 20:58:46 +0530
Message-ID: <20220512152846.661-1-a-m1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 12 May 2022 15:29:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13849

Add ti-sci-firmware binaries required for uboot build to the
prebuilt-images directory of SDK.

Signed-off-by: Aparna M <a-m1@ti.com>
---
 meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb | 3 +++
 1 file changed, 3 insertions(+)

This patch is dependent on
https://lists.yoctoproject.org/g/meta-ti/topic/dunfell_patch_ti_sci_fw/91058279

diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
index 9ebcbb0e..d5a11f36 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
@@ -21,6 +21,9 @@ DEPLOY_IMAGES_NAME_append_j7-evm = " sysfw.itb"
 DEPLOY_IMAGES_NAME_append_j7-hs-evm = " sysfw.itb"
 DEPLOY_IMAGES_NAME_append_am65xx-evm = " ti-sci-firmware-am65x-gp.bin sysfw-am65x-evm.itb sysfw-am65x_sr2-evm.itb"
 DEPLOY_IMAGES_NAME_append_j7-evm = " ti-fs-firmware-j721e-gp.bin"
+DEPLOY_IMAGES_NAME_append_am64xx-evm = " ti-sci-firmware-am64x-gp.bin"
+DEPLOY_IMAGES_NAME_append_am64xx-hs-evm = " ti-sci-firmware-am64x-hs-cert.bin ti-sci-firmware-am64x-hs-enc.bin fitImage-its.its"
+DEPLOY_IMAGES_NAME_append_am62xx-evm = " ti-fs-firmware-am62x-gp.bin ipc_echo_testb_mcu1_0_release_strip.xer5f"
 
 ARAGO_TISDK_IMAGE ?= "tisdk-core-bundle"
 export IMAGE_BASENAME = "${ARAGO_TISDK_IMAGE}"
-- 
2.17.1


