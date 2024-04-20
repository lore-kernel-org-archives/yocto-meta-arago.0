Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D14DFC4345F
	for <webhook@archiver.kernel.org>; Sat, 20 Apr 2024 12:53:37 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.11405.1713617612472306455
 for <meta-arago@lists.yoctoproject.org>;
 Sat, 20 Apr 2024 05:53:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=UbRrQ7RN;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43KCrS4G019278;
	Sat, 20 Apr 2024 07:53:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1713617608;
	bh=AG5cPiYckHQlVY0xbJTYELisKUVgzQtjZQlpdr92zu0=;
	h=From:To:CC:Subject:Date;
	b=UbRrQ7RNBqmKxAQJ5iksAn4MrXP0LJPiDUQrzuJuI9h/juqHeB0mmU83lIkk/lMs0
	 GeCrA01Ihkxni3poxWHqZE2rCUSUlI5V02rS6/hQWUt73s3PUsT3J/4ma7K39ppq6M
	 3txIBayljotSZg/vcO4ozPWEsoVcKiuIv0SCVTLY=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43KCrSgx053498
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 20 Apr 2024 07:53:28 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 20
 Apr 2024 07:53:27 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 20 Apr 2024 07:53:27 -0500
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43KCrQOJ095509;
	Sat, 20 Apr 2024 07:53:27 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Gyan Gupta <g-gupta@ti.com>
Subject: [meta-arago][master/scarthgap][PATCH] meta-arago-distro: recipes-core: Add no-fstab-update option to WIC_CREATE_EXTRA_ARG
Date: Sat, 20 Apr 2024 18:23:18 +0530
Message-ID: <20240420125318.397900-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 20 Apr 2024 12:53:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15298

- Ideally running `ls /boot/` in filesystem should list contents from /rootfs/boot partition
but currently it lists the contents of /boot partition of the WIC Image.

Eg - Incase of AM64x,
```
    root@am64xx-evm:~# ls /boot/
    EFI  Image  tiboot3-am64x-gp-evm.bin  tiboot3-am64x_sr2-hs-evm.bin  tiboot3-am64x_sr2-hs-fs-evm.bin  tiboot3.bin  tispl.bin  u-boot.img  uEnv.txt

```

- To fix this issue, add --no-fstab-update flag to WIC_CREATE_EXTRA_ARG in arago-image.inc
to prevent WIC image from adding an additional entry in /etc/fstab.

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 meta-arago-distro/recipes-core/images/arago-image.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/meta-arago-distro/recipes-core/images/arago-image.inc
index 00308b57..2a34a709 100644
--- a/meta-arago-distro/recipes-core/images/arago-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-image.inc
@@ -31,4 +31,6 @@ BAD_RECOMMENDATIONS += " \
 "
 BAD_RECOMMENDATIONS += "${@oe.utils.conditional("INIT_MANAGER", "sysvinit", "", "busybox-syslog", d)}"
 
+WIC_CREATE_EXTRA_ARGS += " --no-fstab-update"
+
 inherit core-image remove-net-rules
-- 
2.34.1


