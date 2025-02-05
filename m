Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 146C5C0219B
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 20:04:20 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.22465.1738785852828754697
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 05 Feb 2025 12:04:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=fsYbKvOY;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: a-christidis@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 515K4B6f3416768
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-arago@lists.yoctoproject.org>; Wed, 5 Feb 2025 14:04:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738785851;
	bh=Lw9pyjnVEAybuCVKdCfowvuZ/Yy9ZAdZQabS466InRk=;
	h=From:To:CC:Subject:Date;
	b=fsYbKvOY1BrNKwjd7/pF4ePrubcTvAVXQZ2128XBhvIS48Jl59MqL/MDNUIaCCwno
	 /YwQHZYMTiF6GYuNhdV3tsN36g18FG1eUm5GRpt6X89u3WH2QiTIQ9OI5uQtLXoW1I
	 hO1JzEN4JSZKUBC7nFSRaqhY4XnLca9gxewkscAs=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 515K4BVN004354
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 5 Feb 2025 14:04:11 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Feb 2025 14:04:11 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Feb 2025 14:04:11 -0600
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 515K4Bpk061044;
	Wed, 5 Feb 2025 14:04:11 -0600
From: <a-christidis@ti.com>
To: <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [PATCH 0/3] Introducing opencl testing 
Date: Wed, 5 Feb 2025 14:04:08 -0600
Message-ID: <20250205200411.686617-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 05 Feb 2025 20:04:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15816

From: Antonios Christidis <a0507488@uda0867391-2.dhcp.ti.com>

Hello ! 

This patch series, includes everything needed to start testing opencl. 
This includes: 
- Recipe to build opencl-cts 
- A patch for opencl-cts itself 
- A bbappend to bump the version of opencl-headers

Reasoning for the above 3 can be found on the individual patches. 

Antonios Christidis (3):
  meta-arago-test: Ignore Compiler Warnings Patch for OpenCL-CTS
  meta-arago-test: Introducing OpenCL testing
  meta-arago-test: opencl-headers version v2023.12.14->v2024.05.08

 .../recipes-core/packagegroups/ti-test.bb     |  1 +
 .../opencl/opencl-headers_%.bbappend          |  1 +
 .../files/0001-Ignore-Compiler-Warnings.patch | 35 +++++++++++
 ...Ignore-Compiler-Warnings-Patch-for-O.patch | 61 +++++++++++++++++++
 .../opencl/opencl-cts_2024.08.08.bb           | 27 ++++++++
 5 files changed, 125 insertions(+)
 create mode 100644 meta-arago-test/recipes-extended/opencl/opencl-headers_%.bbappend
 create mode 100644 meta-arago-test/recipes-graphics/opencl/files/0001-Ignore-Compiler-Warnings.patch
 create mode 100644 meta-arago-test/recipes-graphics/opencl/files/0001-meta-arago-test-Ignore-Compiler-Warnings-Patch-for-O.patch
 create mode 100644 meta-arago-test/recipes-graphics/opencl/opencl-cts_2024.08.08.bb

-- 
2.34.1


