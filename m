Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4210EC19F32
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 16:16:55 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.17040.1741191409290133448
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 05 Mar 2025 08:16:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=wlh2+6FE;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: a-christidis@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 525GGm593996216
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-arago@lists.yoctoproject.org>; Wed, 5 Mar 2025 10:16:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741191408;
	bh=nGgZraEH8jGHdkMEmTVuKFnRSrTIlyxQqUZUEa+QkqI=;
	h=From:To:Subject:Date;
	b=wlh2+6FEQvNrGf3n+AnyVoJdmUI37QeIN3s0kdEb2hcSTAqxhcsywfqmy6kyrt7+e
	 8i9qwZ+SJyimT0Zk3GyYWKlpeDY2bySt9mxmq3Txx9eZ8V8Ynyb/B/p7IJE58SY757
	 m7PVFSjhrku77ysEhnLNr3XIhORBX25gU1s4EPFk=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 525GGmAn017475
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 5 Mar 2025 10:16:48 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Mar 2025 10:16:48 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Mar 2025 10:16:49 -0600
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 525GGmq1118890
	for <meta-arago@lists.yoctoproject.org>; Wed, 5 Mar 2025 10:16:48 -0600
From: <a-christidis@ti.com>
To: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap/master][PATCH]  packagegroup-arago-tisdk-graphics : Add ti-gc320-libs-dev package
Date: Wed, 5 Mar 2025 10:16:48 -0600
Message-ID: <20250305161648.351534-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 05 Mar 2025 16:16:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15944

From: Antonios Christidis <a-christidis@ti.com>

Reformat the packagegroup, by creating the GFX_GC320 variable which now
includes ti-gc320-tests and the ti-gc320-libs-dev package. This is needed as
the -dev package includes the symb link for the library.

This patch goes hand in hand with a patch series sent to meta-ti porting gc320
to kernel 6.12 .

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-graphics.bb    | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
index a82db154..60806446 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
@@ -16,11 +16,17 @@ GFX_UTILS:append:omap-a15  = "\
     glsdk-util-scripts \
 "
 
+GFX_GC320 = "\
+    ti-gc320-libs-dev\
+    ti-gc320-tests\
+"
+    
+
 RDEPENDS:${PN} = "\
     libegl \
     glmark2 \
     kmscube \
-    ${@bb.utils.contains('MACHINE_FEATURES', 'gc320', 'ti-gc320-tests', '', d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'gc320', "${GFX_GC320}", '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', "${GFX_WAYLAND}", '', d)} \
     ${GFX_UTILS} \
 "
-- 
2.34.1


