Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D62BC27C5F
	for <webhook@archiver.kernel.org>; Fri,  7 Jun 2024 13:31:00 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.41707.1717767056175987456
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 07 Jun 2024 06:30:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=A1t+iz0W;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 457DUsZA003976;
	Fri, 7 Jun 2024 08:30:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717767054;
	bh=8CeJvdMkFs7rwaA4LnphEUYHwb2IcPQIXDy7PMLPhbg=;
	h=From:To:Subject:Date;
	b=A1t+iz0WUHClAb2veU7Z956SzkZ7lrsnPTgI6aDEcvEkYJhXUtIh2DnX8nlFKqth3
	 jQVMGz91Fp8CeBms9zAymtDZ1HUdz42OSmeWY4jYQxnGDF1RPN3GRQAGX318MadtvW
	 +l1QFG0bZ+pEIJjsHcRjfLTlfITYEZFMSHneidaM=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 457DUsXD016087
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 7 Jun 2024 08:30:54 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 7
 Jun 2024 08:30:54 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 7 Jun 2024 08:30:54 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 457DUsa9116639;
	Fri, 7 Jun 2024 08:30:54 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sFZgE-0008WO-Am; Fri, 07 Jun 2024 08:30:54 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH v2] arm-ddr-bandwidth: Fix installation location
Date: Fri, 7 Jun 2024 08:30:54 -0500
Message-ID: <20240607133054.32717-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 07 Jun 2024 13:31:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15377

The script was installed in the wrong directory, but the
/usr/share/matrix-gui-2.0/apps needs to also exist.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Fix commit message and fix install permissions on script.

 .../arm-ddr-bandwidth/arm-ddr-bandwidth.bb               | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta-arago-test/recipes-benchmark/arm-ddr-bandwidth/arm-ddr-bandwidth.bb b/meta-arago-test/recipes-benchmark/arm-ddr-bandwidth/arm-ddr-bandwidth.bb
index 9155e0bb..bf08c320 100644
--- a/meta-arago-test/recipes-benchmark/arm-ddr-bandwidth/arm-ddr-bandwidth.bb
+++ b/meta-arago-test/recipes-benchmark/arm-ddr-bandwidth/arm-ddr-bandwidth.bb
@@ -17,8 +17,13 @@ UNPACKDIR = "${S}"
 
 do_install() {
     install -d ${D}${datadir}/matrix-gui-2.0/apps
-    install -m 0755 ${S}/runLmDDRBandwidth.sh ${D}${datadir}/matrix-gui-2.0/apps/runLmDDRBandwidth.sh
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


