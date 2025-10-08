Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2F16CAC5BB
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 14:45:44 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.595.1759934736400148063
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 08 Oct 2025 07:45:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=wF4wC/x7;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: a-christidis@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 598EjZF53996297
	for <meta-arago@lists.yoctoproject.org>; Wed, 8 Oct 2025 09:45:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759934735;
	bh=t9xoUiRBf3gpIb1aq1/SES65CYOizxQscY6ASXPuzKc=;
	h=From:To:Subject:Date;
	b=wF4wC/x7FwvmCueAs0CiLgqExPxFZKRydUlQCkvX2/QzMfsJZMmmnOvlVMriCbvy2
	 sbs7I6/5hhfxjs0mXZNH5MGZmJGNy3DLAE8UfCp6TafPsCbeCkAO98WcPg85P8JL+D
	 hT/okRXFRT3G2oYTlNma3PgDdHvAUOgtc84odW9w=
Received: from DFLE215.ent.ti.com (dfle215.ent.ti.com [10.64.6.73])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 598EjZnu3795399
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 8 Oct 2025 09:45:35 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 8 Oct
 2025 09:45:35 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 8 Oct 2025 09:45:35 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 598EjZMp2704813;
	Wed, 8 Oct 2025 09:45:35 -0500
From: <a-christidis@ti.com>
To: <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH] packagegroup-arago-tisdk-graphics-sdk-target: Add KTX and SDL2
Date: Wed, 8 Oct 2025 09:45:35 -0500
Message-ID: <20251008144535.2679476-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 08 Oct 2025 14:45:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16672

From: Antonios Christidis <a-christidis@ti.com>

Add development files for KTX and SDL2 within arago-tisdk.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 .../packagegroup-arago-tisdk-graphics-sdk-target.bb             | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
index e35f1766..cb19a171 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
@@ -16,4 +16,6 @@ RDEPENDS:${PN} = "\
     wayland-dev \
     weston-dev \
     ${@bb.utils.contains('MACHINE_FEATURES', 'gc320', 'ti-gc320-libs-dev', '', d)} \
+    libsdl2-dev \
+    ktx-software-dev \
 "
-- 
2.34.1


