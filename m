Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F9C2C021B5
	for <webhook@archiver.kernel.org>; Fri, 21 Feb 2025 22:25:09 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.35661.1740176699222172713
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 21 Feb 2025 14:24:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=BzCQYL1F;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: c-shilwant@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51LMOtd61014146
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Feb 2025 16:24:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740176695;
	bh=vkJh6b1ulT7b1lPLm0gZSaSSTMcg+pCQPxtl6O51ots=;
	h=From:To:CC:Subject:Date;
	b=BzCQYL1FDosW64NpIwm78shIEWFKuVMe9gdNa0/CRFCYhcT2j27n435gqJ0Dj/d8t
	 WqYwGQY/r7SaGkLiNOvI6AVrV9XpwEYcUqGV/yZdoZ6IJjUPN9O1bHZXl4GDpCbnxE
	 Yq3/8HnfC2tvWiOiuXqJvhCwFoTiOHZ6GUryccbE=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51LMOtGM011010
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 21 Feb 2025 16:24:55 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 21
 Feb 2025 16:24:55 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 21 Feb 2025 16:24:55 -0600
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51LMOs2I061497;
	Fri, 21 Feb 2025 16:24:54 -0600
From: Chirag Shilwant <c-shilwant@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Andrew <afd@ti.com>, Denys <denis@denix.org>,
        Ryan Eatmon
	<reatmon@ti.com>, Vijay <vijayp@ti.com>,
        Khasim <khasim@ti.com>
Subject: [meta-arago][scarthgap][PATCH v2 0/1] Add TFLite Runtime
Date: Sat, 22 Feb 2025 03:54:45 +0530
Message-ID: <20250221222446.4019819-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 21 Feb 2025 22:25:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15893

Add a new recipe to enable TFLite support in meta-arago-extras.
This recipe uses the CMake build system and is based on the TensorFlow
Lite v2.18.0 release.

This patch is currently applicable to scarthgap only. The master branch may
require a minor update to accommodate the UNPACKDIR changes. I plan to post a
master-equivalent patch after some testing to ensure compatibility.

Testing:
- Verified that the recipe builds successfully for scarthgap for armv7 & armv8
- Performed DL inferencing on AM335x (armv7) & AM62x (armv8) via benchmark_model 

I would appreciate your review and feedback on this submission.

Changes in v2,
* Addressed Denys's suggestion to avoid network connectivity after do_fetch
* Moved to TFLite v2.18 which is the latest release tag
* Addressed Andrew's suggestion posted on v1 patch [0]

[0]: https://patchwork.yoctoproject.org/project/arago/patch/20250123172509.445473-2-c-shilwant@ti.com/

Regards,
Chirag

Chirag Shilwant (1):
  meta-arago-extras: Add recipe for TFLite Runtime

 ...eLists-for-building-_pywrap_tensorfl.patch |  37 +++
 ...eLists-for-building-shared-object-li.patch |  61 +++++
 ...uild-issues-observed-in-TFlite-v2.18.patch |  36 +++
 .../tensorflow-lite/tensorflow2-lite.pc.in    |   6 +
 .../tensorflow-lite/tensorflow-lite_2.18.0.bb | 232 ++++++++++++++++++
 5 files changed, 372 insertions(+)
 create mode 100644 meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/0001-lite-Update-CMakeLists-for-building-_pywrap_tensorfl.patch
 create mode 100644 meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/0002-lite-Update-CMakeLists-for-building-shared-object-li.patch
 create mode 100644 meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/0003-CMakeLists-Fix-build-issues-observed-in-TFlite-v2.18.patch
 create mode 100644 meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/tensorflow2-lite.pc.in
 create mode 100644 meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.18.0.bb

-- 
2.34.1


