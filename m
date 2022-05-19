Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 277CBC433F5
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 21:48:18 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web09.1547.1652996890633324851
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 19 May 2022 14:48:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=jswJPcB1;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24JLm9qu005080;
	Thu, 19 May 2022 16:48:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1652996889;
	bh=8i06UDlQgeX+yCUWcRSZN59QhQXuwcxR/cDuB/hUBCU=;
	h=From:To:Subject:Date;
	b=jswJPcB1JGQf3fR6OdWz31bWfi9WBJBUnzjH2lYWL4I8rxx6Nd2QurXnlkDjUMegD
	 VQtlSjF/wZv1w5wxYFuWh7UWXFZ9qg9lN2vKw2wwpl/SPK5tZTzHZRfNOwRXCOwDqf
	 gDIF4Fy4TPJK1KGOOO0CzjQcqBf2TEkQmXpbdr7Q=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24JLm9DL117109
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 May 2022 16:48:09 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 19
 May 2022 16:48:08 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 19 May 2022 16:48:08 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24JLm8Gn127536;
	Thu, 19 May 2022 16:48:08 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nro08-0000Ud-6h; Thu, 19 May 2022 16:48:08 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/dunfell][PATCH] matrix-gui: Disable auto-startup
 for am62xx-evm
Date: Thu, 19 May 2022 16:48:08 -0500
Message-ID: <20220519214808.1853-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 19 May 2022 21:48:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13870

There are some issues related to auto-starting the matrix-gui on
am62xx-evm.  It can still be run manually if desired.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
index e67decd6..4cbd7174 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
@@ -5,10 +5,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a886c9ef769b2d8271115d2502512e5d"
 
 SECTION = "multimedia"
 
-PR = "r37"
+PR = "r38"
 
 SYSTEMD_SERVICE_${PN} = "matrix-gui-2.0.service"
 
+SYSTEMD_AUTO_ENABLE_am62xx-evm = "disable"
+
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit systemd
-- 
2.17.1


