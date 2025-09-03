Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DB5DCA1007
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 04:56:08 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.5090.1756875364933703115
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 02 Sep 2025 21:56:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=lSb98HLB;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: m-shah@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5834u4Un2749583
	for <meta-arago@lists.yoctoproject.org>; Tue, 2 Sep 2025 23:56:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756875364;
	bh=s3ikZdUEv3LfraOuzpR5OLAd7dAK74qtfR7d00KMLTo=;
	h=From:To:CC:Subject:Date:List-Post;
	b=lSb98HLBApDJULSUI3T4oaSwX1dxyKtaHJb6H5eHojpK5eUbNZ231dyVmWmldMREL
	 mMbYV2zJlrNMckgYkov+dWMbigbMjay+1AQo85k8oCHoKZmR09LuZXojahjVOdAc6h
	 sKIc3cGQDBSDuLNAUpoWPgclkQEqWseY30fxdCn8=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5834u4ge3342817
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 2 Sep 2025 23:56:04 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 2
 Sep 2025 23:56:03 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 2 Sep 2025 23:56:03 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.72.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5834tx7X998039;
	Tue, 2 Sep 2025 23:56:00 -0500
From: Moteen Shah <m-shah@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <vigneshr@ti.com>, <u-kumar1@ti.com>, <linux-patch-review@list.ti.com>,
        <reatmon@ti.com>, <a-limaye@ti.com>, <n-francis@ti.com>,
        <m-shah@ti.com>
Subject: [meta-arago][PATCH 0/1] Use tisdk-tiny-initramfs in the
Date: Wed, 3 Sep 2025 10:25:58 +0530
Message-ID: <20250903045559.830651-1-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Post: <mailto:linux-patch-review@list.ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 03 Sep 2025 04:56:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16515

Hello all,

The patch aims to package boot essential and some other modules
in tisdk-tiny-initramfs image which can later be used in the boot
process of all K3 platforms. 

The motivation behind the work is to probe modules(in boot time)
which could not be built in the upstream Linux kernel image, as
using it as inbuilt drivers will increase the kernel image size, 
which is undesirable by the upstream folks.

Hence, build those drivers as modules and package it inside initramfs
and later get it probed through initramfs-udev(device manager).

Moteen Shah (1):
  tisdk-tiny-initramfs.bb: Package initramfs scripts and modules in the
    image

 .../images/tisdk-tiny-initramfs.bb             | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

---
2.34.1


