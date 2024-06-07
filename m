Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB75DC27C5E
	for <webhook@archiver.kernel.org>; Fri,  7 Jun 2024 02:00:16 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.32131.1717725614793337873
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 06 Jun 2024 19:00:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ttlao6HB;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45720DnA115638;
	Thu, 6 Jun 2024 21:00:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717725613;
	bh=S4YmVP5jGcGTnTyi+xFJlEOSv/b7JmO+vEfpaion6q4=;
	h=From:To:Subject:Date;
	b=ttlao6HBU8f+xLuZK0umTeKOfUYw3sO0lmEbhwJGhRkltNxTYs4Z/HyzDaHs/Ko2p
	 jiKsF5sCzoQT7P1H9UQdepuAgg4gYrYfYu5iIn1CKrQ59gQngrij82c8hqu3O+h+tH
	 NYU++gKdhin+/f9FzQwZ9en0xYJNQ+jdveMqQ62I=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45720DoY010339
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 6 Jun 2024 21:00:13 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Jun 2024 21:00:13 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Jun 2024 21:00:13 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45720DbB062166;
	Thu, 6 Jun 2024 21:00:13 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sFOtp-0000n1-1N; Thu, 06 Jun 2024 21:00:13 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH] arm-ddr-bandwidth: Fix installtion location
Date: Thu, 6 Jun 2024 21:00:12 -0500
Message-ID: <20240607020012.2995-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 07 Jun 2024 02:00:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15373

The script was installed in the wrong directory, but the
/usr/share/matrix-gui-2.0/apps needs to also exist.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../arm-ddr-bandwidth/arm-ddr-bandwidth.bb               | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta-arago-test/recipes-benchmark/arm-ddr-bandwidth/arm-ddr-bandwidth.bb b/meta-arago-test/recipes-benchmark/arm-ddr-bandwidth/arm-ddr-bandwidth.bb
index 78f80b55..b6766d56 100644
--- a/meta-arago-test/recipes-benchmark/arm-ddr-bandwidth/arm-ddr-bandwidth.bb
+++ b/meta-arago-test/recipes-benchmark/arm-ddr-bandwidth/arm-ddr-bandwidth.bb
@@ -16,8 +16,13 @@ S = "${WORKDIR}"
 
 do_install() {
     install -d ${D}${datadir}/matrix-gui-2.0/apps
-    install -m 0644 ${S}/runLmDDRBandwidth.sh ${D}${datadir}/matrix-gui-2.0/apps/runLmDDRBandwidth.sh
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


