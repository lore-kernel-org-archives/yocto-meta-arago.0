Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49474C25B75
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 06:38:55 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.77134.1717396734419791958
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 02 Jun 2024 23:38:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=GJ/SWL+c;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4536crF9049178
	for <meta-arago@lists.yoctoproject.org>; Mon, 3 Jun 2024 01:38:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717396733;
	bh=flx8Qm3j526bIGx326a/G77NC0AKKUIUZVVnmXBgY1I=;
	h=From:To:CC:Subject:Date;
	b=GJ/SWL+c69NlTIl0VSTLO6SkwWDd+K2VSG3GAsTeoBpljVms2vxvB0995qI7C7cPg
	 2yX+Pm2G/zBOet3q+HmmgmOmDEhNltggnb9XLvYlRc38eaGp5n9M72QVGaDOrNZLyx
	 A9w9jYCRntt3XIaW3FQDC+iYScJSw3s0bEQf7aHQ=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4536crIS008497
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Mon, 3 Jun 2024 01:38:53 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Jun 2024 01:38:53 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Jun 2024 01:38:53 -0500
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4536cq3V080638;
	Mon, 3 Jun 2024 01:38:53 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Gyan Gupta <g-gupta@ti.com>
Subject: [meta-arago][master/scarthgap][PATCH] recipes-core: packagegroup-arago-tisdk-addons: Add back kmscube
Date: Mon, 3 Jun 2024 12:08:46 +0530
Message-ID: <20240603063846.2815948-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 03 Jun 2024 06:38:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15350

- kmscube was earlier packaged as a run time dependency for matrix-gui.
But now as matrix-gui is removed [1], add kmscube manually.

- kmscube can be used by developers to quickly validate the GPU and display
after driver or userspace changes. So it is good to add it back.

[1]: https://git.ti.com/cgit/arago-project/meta-arago/commit/?h=master&id=e4b33fbc34aa90d156310b3cd1cb23f1d0cadab4

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons.bb             | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 8dbffa81..d25c9eb1 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -79,6 +79,7 @@ EXTRA_PACKAGES = " \
     nodejs-npm \
     protobuf \
     ccief-basic \
+    kmscube \
 "
 
 EXTRA_PACKAGES:omapl138 = " \
-- 
2.34.1


