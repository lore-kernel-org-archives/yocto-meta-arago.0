Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C23DBC77B73
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 16:39:19 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.99282.1682959157510607939
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 01 May 2023 09:39:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=LIJgLrZV;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 341GdGVp025801;
	Mon, 1 May 2023 11:39:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682959156;
	bh=Ax1zx+/cbc6og3BSSCnSqAs7kp1hwft2y4yaR84J3JU=;
	h=From:To:Subject:Date;
	b=LIJgLrZVWLq7LbvS0nrgctUPV9/iJAiGhV6t5Swrxey72ZVpGXvSed3TRRDzteN/5
	 /UJtDZEOxhVVuWMsN/tt6uw2Sis8dCqekL/7E4Dug9XTFHTgs6wVbE5+oUuTNMSeUg
	 8Fa1cJwvPygN+fwP1riJxmDD2I8XGfP9eYz35W+o=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 341GdGNB096967
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 1 May 2023 11:39:16 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 1
 May 2023 11:39:16 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 1 May 2023 11:39:16 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 341GdGm7058699;
	Mon, 1 May 2023 11:39:16 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1ptWYW-0002lr-0b; Mon, 01 May 2023 11:39:16 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH] packagegroup-arago-gst: Disable vpe and ducati plugins
Date: Mon, 1 May 2023 11:39:15 -0500
Message-ID: <20230501163915.10612-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 01 May 2023 16:39:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14380

The code for the plugins uses dma allocation code that we add in with a
patch.  Theoretically we no longer need that code and can use some
upstreamed dma buffer allocation code.  The work to rewrite these
plugins to support the newer gstreamer versions needs to be scheduled.

In the meantime, disable using these plugins that cause build errors.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-gst.bb      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
index e8a639bd..2184ab58 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
@@ -27,8 +27,8 @@ GSTREAMER_DEPS:append:dra7xx = " \
 "
 
 GSTREAMER_ACCEL_MM = ""
-GSTREAMER_ACCEL_MM:omap-a15 = "${@bb.utils.contains('MACHINE_FEATURES', 'mmip', "gstreamer1.0-plugins-ducati", '', d)}"
-GSTREAMER_ACCEL_MM:append:dra7xx = "${@bb.utils.contains('MACHINE_FEATURES', 'mmip', " gstreamer1.0-plugins-vpe", '', d)}"
+#GSTREAMER_ACCEL_MM:omap-a15 = "${@bb.utils.contains('MACHINE_FEATURES', 'mmip', "gstreamer1.0-plugins-ducati", '', d)}"
+#GSTREAMER_ACCEL_MM:append:dra7xx = "${@bb.utils.contains('MACHINE_FEATURES', 'mmip', " gstreamer1.0-plugins-vpe", '', d)}"
 
 RDEPENDS:${PN} = "\
     ${GSTREAMER_DEPS} \
-- 
2.17.1


