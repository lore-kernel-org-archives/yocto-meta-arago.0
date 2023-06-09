Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C13CBC7EE37
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 18:54:34 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.2703.1686336865731303926
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 09 Jun 2023 11:54:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=m6iQpY9+;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 359IsOou104631;
	Fri, 9 Jun 2023 13:54:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686336864;
	bh=iVMrxYUaJpnqcvewv66Ab3h3pIJSZNrBscG0gKGzVZE=;
	h=From:To:CC:Subject:Date;
	b=m6iQpY9+Ok9Bxm94pFuTyDirD9wwaVHy/NQkPdRsMFr/FtXhPlWhZGnKGqOe5Ns13
	 7Es8AJJnPKSZ6C03up55GSpBYh3aQa4RWrBGo6Cl5XVSWyGr0N/TN3shFQypImaOFD
	 GnH6NMWWnAvJod7K3Na38Wp6V2ufNVdS2FLESIN0=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 359IsO13002198
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 Jun 2023 13:54:24 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 Jun 2023 13:54:24 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 Jun 2023 13:54:24 -0500
Received: from lelv0327.itg.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 359IsNMY035371;
	Fri, 9 Jun 2023 13:54:23 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH 1/4] big-data-ipc-demo: Remove M4 toolchain export
Date: Fri, 9 Jun 2023 13:54:19 -0500
Message-ID: <20230609185422.132654-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 09 Jun 2023 18:54:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14580

This is not needed and might have been a copy paste error.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-apps/big-data-ipc-demo/big-data-ipc-demo_git.bb      | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-arago-demos/recipes-apps/big-data-ipc-demo/big-data-ipc-demo_git.bb b/meta-arago-demos/recipes-apps/big-data-ipc-demo/big-data-ipc-demo_git.bb
index 99434246..c68d7152 100644
--- a/meta-arago-demos/recipes-apps/big-data-ipc-demo/big-data-ipc-demo_git.bb
+++ b/meta-arago-demos/recipes-apps/big-data-ipc-demo/big-data-ipc-demo_git.bb
@@ -38,7 +38,6 @@ EXTRA_OEMAKE = "\
     LINUX_SYSROOT_DIR="${STAGING_KERNEL_DIR}/include/uapi -I${STAGING_KERNEL_DIR}/include" \
     gnu.targets.arm.A15F="${GCC_ARM_NONE_TOOLCHAIN}" \
     ti.targets.elf.C66="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
-    ti.targets.arm.elf.M4="${M4_TOOLCHAIN_INSTALL_DIR}" \
 "
 
 do_compile() {
-- 
2.39.2


