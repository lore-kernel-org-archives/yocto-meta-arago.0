Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3411AC36001
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 18:20:44 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.2123.1742494843280719281
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 20 Mar 2025 11:20:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=NwiXB5qG;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52KIKgZ1686036
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Mar 2025 13:20:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742494842;
	bh=OnSlLo6TptYwify0gPe2Rnrw2hmzM+vNHk4AO3HBhHY=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=NwiXB5qGkYHYDo41QkSh3pyuLAzLuUaIQUAgqURR6MSxqR3ONVzNJMkrejYbP5JXr
	 Zfcj13phjlhv43yqHLmvs/WbmghvmlWQRYwv8cyfdLUhpPE/gJvPms75tepp5jtE4E
	 GehrWHLQax5FXE9XnHoiIIInbLXb8CCuua+eCfMw=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52KIKgJ7054706
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 20 Mar 2025 13:20:42 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Mar 2025 13:20:41 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Mar 2025 13:20:41 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52KIKfQF095690;
	Thu, 20 Mar 2025 13:20:41 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tvKVV-0000cu-Pz; Thu, 20 Mar 2025 13:20:41 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 2/8] packagegroup-arago-bootstrap: Wrap various packages in a compliant manner
Date: Thu, 20 Mar 2025 13:20:35 -0500
Message-ID: <20250320182041.2349-3-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250320182041.2349-1-reatmon@ti.com>
References: <20250320182041.2349-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 20 Mar 2025 18:20:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16134

Previous clean ups wrapped some recipe .bbappend files in a compliant
manner and effectively hid the changes behind having "ti-soc" in the
MACHINE_OVERRIDES.  This same kind wrapping is needed when including the
package in the package group.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../packagegroups/packagegroup-arago-bootstrap.bb            | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bootstrap.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bootstrap.bb
index 50f759be..3c05895a 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bootstrap.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bootstrap.bb
@@ -19,7 +19,6 @@ UTILS = " \
 	 libdrm-tests \
 	 rt-tests \
 	 iozone3 \
-	 mtd-utils-ubifs-tests \
 	 net-tools \
 	 ethtool  \
 	 pciutils \
@@ -30,6 +29,10 @@ UTILS = " \
 	 devmem2 \
 	 phytool \
 "
+	 
+UTILS:append:ti-soc = " \
+    mtd-utils-ubifs-tests \
+"
 
 UTILS:append:ti33x = " \
     omapconf \
-- 
2.17.1


