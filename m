Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85036C25B74
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 05:44:28 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.14290.1717479864240083818
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 03 Jun 2024 22:44:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=J+cG5cEk;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: c-shilwant@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4545iNas032817
	for <meta-arago@lists.yoctoproject.org>; Tue, 4 Jun 2024 00:44:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717479863;
	bh=4wgDTK1HARUNdbrfxOLFvm2Fzs+CpolME9wu7beFMsI=;
	h=From:To:CC:Subject:Date;
	b=J+cG5cEkmzBNKZNGdB03Dv+BRT6Kl0fW6pCvi/e9miwBY6VcbRzGgwOZmPzGgMlex
	 xouiYzbKxzEOsQ+1rWdYX9drBBq3AaNwYj2jjlflj3DfrOwoZ7NvKHgcvj66P5fMtY
	 d2F1LNmBN+BSfZ5I4kARkknDMg4yWADlkZKa+14g=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4545iNK9046631
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 4 Jun 2024 00:44:23 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Jun 2024 00:44:23 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Jun 2024 00:44:23 -0500
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4545iMti025334;
	Tue, 4 Jun 2024 00:44:23 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Gyan Gupta <g-gupta@ti.com>
Subject: [meta-arago][master/scarthgap][PATCH v2] recipes-core: packagegroup-arago-tisdk-addons: Add back kmscube
Date: Tue, 4 Jun 2024 11:14:20 +0530
Message-ID: <20240604054420.3772763-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 04 Jun 2024 05:44:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15357

- kmscube was earlier packaged as a run time dependency for matrix-gui.
But now as matrix-gui is removed [1], add kmscube manually.

- kmscube can be used by developers to quickly validate the GPU and display
after driver or userspace changes. So it is good to add it back.

[1]: https://git.ti.com/cgit/arago-project/meta-arago/commit/?h=master&id=e4b33fbc34aa90d156310b3cd1cb23f1d0cadab4

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
v2: Add kmscube in tisdk-graphics packagegroup to limit it's scope
    to platforms with graphics stack

 .../packagegroups/packagegroup-arago-tisdk-graphics.bb           | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
index 381fa950..a82db154 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
@@ -19,6 +19,7 @@ GFX_UTILS:append:omap-a15  = "\
 RDEPENDS:${PN} = "\
     libegl \
     glmark2 \
+    kmscube \
     ${@bb.utils.contains('MACHINE_FEATURES', 'gc320', 'ti-gc320-tests', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', "${GFX_WAYLAND}", '', d)} \
     ${GFX_UTILS} \
-- 
2.34.1


