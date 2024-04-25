Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4C2FC4345F
	for <webhook@archiver.kernel.org>; Thu, 25 Apr 2024 10:27:39 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.13632.1714040856124875489
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 25 Apr 2024 03:27:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=jrGUz75e;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43PARWVX022875;
	Thu, 25 Apr 2024 05:27:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1714040852;
	bh=8GprovOj2cB2nYAHxjXpx8p+QwiTrXEi+yEheudYM0E=;
	h=From:To:CC:Subject:Date;
	b=jrGUz75ebojAj4WQ2mpOPxrrLbMHM1TAAVjo8/1SunF/wG/31pKhEUv0u9XfpXInV
	 3f9KXXFA2wztvsM1+RwJeCzzk7IsB7JO3zZGE6kF9NIxrJ10IFkkGS+ldEvjuUhy0K
	 gcs3pIkNQ8fzqTi6dU61AERRAtPIt+lTuSJcbaxM=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43PARWr6092963
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 25 Apr 2024 05:27:32 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 25
 Apr 2024 05:27:32 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 25 Apr 2024 05:27:32 -0500
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43PARVh1087827;
	Thu, 25 Apr 2024 05:27:32 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Gyan Gupta <g-gupta@ti.com>
Subject: [meta-arago][master/scarthgap][PATCH] recipes-core: images: Remove WIC_CREATE_EXTRA_ARG
Date: Thu, 25 Apr 2024 15:57:28 +0530
Message-ID: <20240425102728.1295738-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 25 Apr 2024 10:27:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15312

- In meta-ti, we now have the wks file updated which
ensures that we don't mount boot FAT partition into
/boot directory of the rootfs [1]

- Hence, adding --no-fstab-update to WIC_CREATE_EXTRA_ARG
is no longer needed and we can remove it from tisdk-jailhouse-image.

[1]: https://git.ti.com/cgit/arago-project/meta-ti/commit/?h=scarthgap-next&id=42c238a42fe0c8d18a9063bd48501f409cdc093c

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb b/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb
index 339e4895..9558882e 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb
@@ -12,5 +12,3 @@ COMPATIBLE_MACHINE = "am62xx|am62pxx"
 IMAGE_INSTALL += " jailhouse"
 
 export IMAGE_BASENAME = "tisdk-jailhouse-image"
-
-WIC_CREATE_EXTRA_ARGS:append = " --no-fstab-update"
-- 
2.34.1


