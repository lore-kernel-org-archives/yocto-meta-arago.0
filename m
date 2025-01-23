Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54738C0218B
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 17:25:52 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.16416.1737653143996607253
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 23 Jan 2025 09:25:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Q4ID+cSJ;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50NHPfkT406981
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 23 Jan 2025 11:25:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737653141;
	bh=d/NMjeXowkDqh8dMK67P9HboZkbIKAOt7qS+wf3pQZo=;
	h=From:To:CC:Subject:Date;
	b=Q4ID+cSJNTsc4gmFbSfhiFApKWNUvnWwqVTL7Le0tqpjEZ0FLXtBRhkHBT8S29CjU
	 BmYp0GzWWFSJf3wv0thCJNC00hWFifUnuJF9LPUcsdHXeTvMoRJyw2IcncSaBR65dR
	 /hsXG5/MomnVuZWNzlBwPqfWZMp3JeVW8U3SMm3A=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50NHPfKb012254;
	Thu, 23 Jan 2025 11:25:41 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 23
 Jan 2025 11:25:41 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 23 Jan 2025 11:25:41 -0600
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50NHPekv111077;
	Thu, 23 Jan 2025 11:25:41 -0600
From: Chirag <c-shilwant@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Andrew <afd@ti.com>, Ryan <reatmon@ti.com>, Denys <denis@denix.org>
Subject: [meta-arago][scarthgap][PATCH 0/1] Add TFLite Runtime
Date: Thu, 23 Jan 2025 22:55:08 +0530
Message-ID: <20250123172509.445473-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 23 Jan 2025 17:25:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15743

From: Chirag Shilwant <c-shilwant@ti.com>

Add a new recipe to enable TFLite support in meta-arago-extras.
This recipe uses the CMake build system and is based on the TensorFlow
Lite v2.16.2 release.

One important note about this recipe is that it requires internet connectivity
during the do_compile and do_configure stages. This is because the TensorFlow
Lite CMake build system fetches additional packages during these stages.

This patch is currently applicable to scarthgap only. The master branch may
require a minor update to accommodate the UNPACKDIR changes. I plan to post a
master-equivalent patch after some testing to ensure compatibility.

Testing:
- Verified that the recipe builds successfully for scarthgap for armv7 & armv8
- Performed DL inferencing on AM335x (armv7) & AM62x (armv8) via benchmark_model 

I would appreciate your review and feedback on this submission.

Regards,
Chirag

Chirag Shilwant (1):
  meta-arago-extras: Add recipe for TFLite Runtime

 ...eLists-for-building-_pywrap_tensorfl.patch |  37 ++++
 ...eLists-for-building-shared-object-li.patch |  55 +++++
 ...uild-issues-observed-in-TFlite-v2.16.patch |  36 ++++
 .../tensorflow-lite/tensorflow-lite_2.16.bb   | 203 ++++++++++++++++++
 4 files changed, 331 insertions(+)
 create mode 100644 meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/0001-lite-Update-CMakeLists-for-building-_pywrap_tensorfl.patch
 create mode 100644 meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/0002-lite-Update-CMakeLists-for-building-shared-object-li.patch
 create mode 100644 meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite/0003-CMakeLists-Fix-build-issues-observed-in-TFlite-v2.16.patch
 create mode 100644 meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.16.bb

-- 
2.34.1


