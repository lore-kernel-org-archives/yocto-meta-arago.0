Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E7BFC27C65
	for <webhook@archiver.kernel.org>; Fri,  7 Jun 2024 02:01:16 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.32151.1717725671498838738
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 06 Jun 2024 19:01:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=A/4jN2m2;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45721A1S125994;
	Thu, 6 Jun 2024 21:01:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717725670;
	bh=b624YKtRTOKWFwnzcIr7KnMBS3NnyCaQDj0X+L29oMA=;
	h=From:To:Subject:Date;
	b=A/4jN2m29LWnIWXKWFl//9HjTahpAFwVxzE4GUgk9vNSxdk5/1fYeZmJPkmQCsPZu
	 iLkTbGmR7Tf2nZqDGWp8+D8G8FsVsdtIw3Ddk5ak8dq2+nb3vFieYHR/PFI57AJpxE
	 GIav387N09SyC7cI0Xy0GG9izB4aVW3jlqoZ/yfs=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45721AWr030355
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 6 Jun 2024 21:01:10 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Jun 2024 21:01:09 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Jun 2024 21:01:09 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 457219FI064538;
	Thu, 6 Jun 2024 21:01:09 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sFOuj-0000pu-Jt; Thu, 06 Jun 2024 21:01:09 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] arm-ddr-bandwidth: Fix installtion location
Date: Thu, 6 Jun 2024 21:01:09 -0500
Message-ID: <20240607020109.3174-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 07 Jun 2024 02:01:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15374

The script was installed in the wrong directory, but the
/usr/share/matrix-gui-2.0/apps needs to also exist.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../arm-ddr-bandwidth/arm-ddr-bandwidth.bb               | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta-arago-test/recipes-benchmark/arm-ddr-bandwidth/arm-ddr-bandwidth.bb b/meta-arago-test/recipes-benchmark/arm-ddr-bandwidth/arm-ddr-bandwidth.bb
index 9155e0bb..7b77216f 100644
--- a/meta-arago-test/recipes-benchmark/arm-ddr-bandwidth/arm-ddr-bandwidth.bb
+++ b/meta-arago-test/recipes-benchmark/arm-ddr-bandwidth/arm-ddr-bandwidth.bb
@@ -17,8 +17,13 @@ UNPACKDIR = "${S}"
 
 do_install() {
     install -d ${D}${datadir}/matrix-gui-2.0/apps
-    install -m 0755 ${S}/runLmDDRBandwidth.sh ${D}${datadir}/matrix-gui-2.0/apps/runLmDDRBandwidth.sh
+
+    install -d ${D}${bindir}
+    install -m 0644 ${S}/runLmDDRBandwidth.sh ${D}${bindir}/runLmDDRBandwidth.sh
 }
 
-FILES:${PN} = "${datadir}/matrix-gui-2.0/apps/runLmDDRBandwidth.sh"
+FILES:${PN} = " \
+    ${datadir}/matrix-gui-2.0/apps \
+    ${bindir}/runLmDDRBandwidth.sh \
+"
 
-- 
2.17.1


