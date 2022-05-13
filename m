Return-Path: <a-m1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAA6FC433F5
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 07:49:38 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.5601.1652428175400652292
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 13 May 2022 00:49:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Q2lCcTce;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: a-m1@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24D7nWBl028734;
	Fri, 13 May 2022 02:49:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1652428172;
	bh=HpZDQspbgOjbksnMRFWRAqNzV2E7VtTBirpee+rHD2g=;
	h=From:To:CC:Subject:Date;
	b=Q2lCcTcexIc9wDJobLi90Vg5ejeA4zdcoW6vi0JVup9yDKJNYHFpyThg6JHjz2cJK
	 7H84qN+JDMNcwFNMPScOHgBTiX9xEZUtOSN4qMzA9jF55AMTvgirz1YtM7vtmx4MMg
	 3AtHRXFvt8fX83b0gqo1FHKmEbO+N1poPwBrXjiw=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24D7nWco123986
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 May 2022 02:49:32 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 13
 May 2022 02:49:31 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 13 May 2022 02:49:31 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24D7nSpw019975;
	Fri, 13 May 2022 02:49:29 -0500
From: Aparna M <a-m1@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <denis@denix.org>,
        <reatmon@ti.com>, <nm@ti.com>
CC: <devarsht@ti.com>, <s-adivi@ti.com>
Subject: [meta-arago][dunfell][PATCH 0/5] Add support in toplevel Makefile of
 SDK
Date: Fri, 13 May 2022 13:19:18 +0530
Message-ID: <20220513074923.28761-1-a-m1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 13 May 2022 07:49:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13855

Add support in toplevel makefile of SDK for:
- uboot build for am62xx-evm with DM firmware packaged with tispl.bin
- fitImage.itb build required for HS devices. Cureently adding support
  for am64xx-hs-evm.
- Combining sysfw.itb with tiboot3.bin to generate combined tiboot3.bin
  for k3 devices.
- sysfw-image build for am62xx-evm
- Rename UBOOT_MACHINE for am62xx-evm R5

Aparna M (5):
  ti-tisdk-makefile: Makefile_u-boot-spl: Add support for u-boot-a53
    build for am62xx-evm
  ti-tisdk-makefile: Makefile_linux-fitimage: Add support to build
    fitImage.itb for am64xx-hs-evm
  ti-tisdk-makefile: Makefile_sysfw-image: Add support for combined
    tiboot3.bin build in k3 devices
  ti-tisdk-makefile: Makefile_sysfw-image: Add support for am62xx-evm
  ti-tisdk-makefile: Rename UBOOT_MACHINE for R5 for am62xx-evm

 .../ti-tisdk-makefile/Makefile_linux-fitimage | 32 +++++++++++++++++++
 .../ti-tisdk-makefile/Makefile_sysfw-image    | 21 +++++++-----
 .../ti-tisdk-makefile/k3/Makefile_u-boot-spl  | 16 +++++++---
 .../ti-tisdk-makefile_1.0.bb                  |  8 ++++-
 4 files changed, 64 insertions(+), 13 deletions(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux-fitimage

-- 
2.17.1


