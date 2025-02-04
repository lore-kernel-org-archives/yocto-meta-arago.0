Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16216C02194
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 13:59:38 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.116890.1738677569445700263
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 04 Feb 2025 05:59:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Jno3TQMt;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 514DxSRe2404132
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Feb 2025 07:59:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738677568;
	bh=CjwgmYmuuFGXZptwwifDKfUmvSG6pEqmZ1+iBHbw2Do=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Jno3TQMtBDNxmiQD1ATZJcMbI8PtC2BM3FzKe7ApVwjWb3ym7yN2FHtDWUHtmptcM
	 hQ4zr8CL3A+pGTb5R/Hzxtfa1yY+2DRXRdby4SLoYJE7/Vw5hPEYAYiljg1fC3wSDW
	 7FdAhLoFUM0gDzZVmJohQn4+qT1foJmn4UvtiRjE=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 514DxSRg032130
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 4 Feb 2025 07:59:28 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Feb 2025 07:59:27 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Feb 2025 07:59:27 -0600
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 514DxRBp053424;
	Tue, 4 Feb 2025 07:59:27 -0600
From: Chirag Shilwant <c-shilwant@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Denys <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
Subject: [meta-arago][master/scarthgap][PATCH 1/1] meta-arago-distro: Add support for AM62L
Date: Tue, 4 Feb 2025 19:29:16 +0530
Message-ID: <20250204135916.974102-2-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250204135916.974102-1-c-shilwant@ti.com>
References: <20250204135916.974102-1-c-shilwant@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 04 Feb 2025 13:59:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15802

- AM62L is a k3 platform which doesn't have a Cortex-R5 core.
Hence, remove multiconfig dependency of K3R5 toolchain for am62lxx.

- Add bl1.bin in DEPLOY_IMAGES_NAME to ensure that the binary
is deployed under board-support/prebuilt-images of tisdk-core-bundle.

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 meta-arago-distro/classes/tisdk-bundle.bbclass             | 1 +
 meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-arago-distro/classes/tisdk-bundle.bbclass b/meta-arago-distro/classes/tisdk-bundle.bbclass
index 83fe31a0..a554a261 100644
--- a/meta-arago-distro/classes/tisdk-bundle.bbclass
+++ b/meta-arago-distro/classes/tisdk-bundle.bbclass
@@ -42,6 +42,7 @@ TOOLCHAIN_SUFFIX ?= "-sdk"
 
 # K3R5 baremetal toolchain recipe(s) to build and package as part of the tisdk bundle
 TOOLCHAIN_MC_DEP = ""
+TOOLCHAIN_MC_DEP:am62lxx = ""
 TOOLCHAIN_MC_DEP:k3 = "mc::k3r5:meta-toolchain-arago"
 TISDK_TOOLCHAIN_K3R5 ?= "${TOOLCHAIN_MC_DEP}"
 TOOLCHAIN_K3R5_SUFFIX ?= "-sdk"
diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
index edbea302..6c2afb9d 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.bb
@@ -11,6 +11,7 @@ DEPLOY_SPL_NAME:omapl138 = ""
 DEPLOY_SPL_NAME:k3 = "tispl.bin tiboot3.bin"
 
 DEPLOY_IMAGES_NAME:k3 = "bl31.bin bl32.bin Image fitImage fitImage-its-${MACHINE}"
+DEPLOY_IMAGES_NAME:append:am62lxx = " bl1.bin"
 DEPLOY_IMAGES_NAME:append:am65xx = " sysfw.itb"
 DEPLOY_IMAGES_NAME:append:j721e = " sysfw.itb"
 DEPLOY_IMAGES_NAME:append:am65xx-evm = " sysfw-am65x_sr2-gp-evm.itb"
-- 
2.34.1


