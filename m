Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69A1ECA1002
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 12:43:40 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.38142.1756989818102342521
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 04 Sep 2025 05:43:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=zTG0IlBn;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: m-shah@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 584Chbvh3468525
	for <meta-arago@lists.yoctoproject.org>; Thu, 4 Sep 2025 07:43:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756989817;
	bh=dvu+09+YQYZ4pEy4t2C3MQiwfCnHKCBibjbPRJhBGwQ=;
	h=From:To:CC:Subject:Date:List-Post;
	b=zTG0IlBnGSgTsIyz1pLnLb0mHi7DNx4wBRT2zczQJZ6DQlX2LtoxZ+3BRdEZRotVy
	 bmLy9+riVxHecw/j1m9xObx7+YoTVqHzcazEGxxGwv7R1usi9bUU6JaN5An6D5QSG3
	 +F8jmlrtubww+zLvKWZ4EfDLI3/77nYlO6UrJLvo=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 584ChbDo118615
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 4 Sep 2025 07:43:37 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 4
 Sep 2025 07:43:35 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 4 Sep 2025 07:43:35 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.72.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 584ChVv13267526;
	Thu, 4 Sep 2025 07:43:32 -0500
From: Moteen Shah <m-shah@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <vigneshr@ti.com>, <u-kumar1@ti.com>, <linux-patch-review@list.ti.com>,
        <reatmon@ti.com>, <a-limaye@ti.com>, <n-francis@ti.com>,
        <m-shah@ti.com>, <praneeth@ti.com>, <jm@ti.com>
Subject: [meta-ti][PATCH 0/1 v2] Add recipes to build initramfs image
Date: Thu, 4 Sep 2025 18:13:30 +0530
Message-ID: <20250904124331.1075343-1-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Post: <mailto:linux-patch-review@list.ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 04 Sep 2025 12:43:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16520

The patch aims to add a new recipe which will package
boot essential and some other modules in image which
can later be used in the boot process of all K3 platforms. 

The motivation behind the work is to probe modules(in boot time)
which could not be built in the upstream Linux kernel image, as
using it as inbuilt drivers will increase the kernel image size, 
which is undesirable by the upstream folks.

Hence, build those drivers as modules and package it inside initramfs
and later get it probed through initramfs-udev(device manager).

Changes since v1: 
- Migrate the recipe to meta-ti so that it can be used in upstream
testing

Link to V1: https://lists.yoctoproject.org/g/meta-arago/message/16515

Moteen Shah (1):
  recipes-ti: initramfs: Make minimal initrd image

 .../initramfs/packagegroup-ti-initramfs.bb    |  5 ++
 .../recipes-ti/initramfs/ti-tiny-initramfs.bb | 49 +++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-initramfs.bb
 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/ti-tiny-initramfs.bb

-- 
2.34.1


