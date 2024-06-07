Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52117C27C5F
	for <webhook@archiver.kernel.org>; Fri,  7 Jun 2024 13:31:10 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.42029.1717767065958529373
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 07 Jun 2024 06:31:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=KqguK3Qy;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 457DV4Oj086615;
	Fri, 7 Jun 2024 08:31:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717767064;
	bh=sol2CrbfNgh7pR/v24M7o1ZRrszo2RaTMO+W8ZlO7ps=;
	h=From:To:Subject:Date;
	b=KqguK3QygPrVfTrmNq0fY1SEIKNircUI7vaD1fPw2yQyNUDZoTIp/Ky0+SdifnauB
	 GQ2KUHplg098bsYwjmEsGdGeckAzzg/kyR50R6GcIAi16iHC4Hq5tut5u9pfXqUy4M
	 AId7GWeXfIBWHWeeoffEtfA3mSOuEnyX6eThZmI4=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 457DV40v070505
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 7 Jun 2024 08:31:04 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 7
 Jun 2024 08:31:03 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 7 Jun 2024 08:31:03 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 457DV3iT117179;
	Fri, 7 Jun 2024 08:31:03 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sFZgN-000063-M9; Fri, 07 Jun 2024 08:31:03 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH v2] arm-ddr-bandwidth: Fix installation location
Date: Fri, 7 Jun 2024 08:31:03 -0500
Message-ID: <20240607133103.326-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 07 Jun 2024 13:31:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15378

The script was installed in the wrong directory, but the
/usr/share/matrix-gui-2.0/apps needs to also exist.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Fix commit message and fix install permissions on script.

 .../arm-ddr-bandwidth/arm-ddr-bandwidth.bb               | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta-arago-test/recipes-benchmark/arm-ddr-bandwidth/arm-ddr-bandwidth.bb b/meta-arago-test/recipes-benchmark/arm-ddr-bandwidth/arm-ddr-bandwidth.bb
index 78f80b55..d88b3e6f 100644
--- a/meta-arago-test/recipes-benchmark/arm-ddr-bandwidth/arm-ddr-bandwidth.bb
+++ b/meta-arago-test/recipes-benchmark/arm-ddr-bandwidth/arm-ddr-bandwidth.bb
@@ -16,8 +16,13 @@ S = "${WORKDIR}"
 
 do_install() {
     install -d ${D}${datadir}/matrix-gui-2.0/apps
-    install -m 0644 ${S}/runLmDDRBandwidth.sh ${D}${datadir}/matrix-gui-2.0/apps/runLmDDRBandwidth.sh
+
+    install -d ${D}${bindir}
+    install -m 0755 ${S}/runLmDDRBandwidth.sh ${D}${bindir}/runLmDDRBandwidth.sh
 }
 
-FILES:${PN} = "${datadir}/matrix-gui-2.0/apps/runLmDDRBandwidth.sh"
+FILES:${PN} = " \
+    ${datadir}/matrix-gui-2.0/apps \
+    ${bindir}/runLmDDRBandwidth.sh \
+"
 
-- 
2.17.1


