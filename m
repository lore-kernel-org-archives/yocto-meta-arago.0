Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F4C0C47DAF
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 23:42:52 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.8339.1705707765714409671
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 19 Jan 2024 15:42:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Bq5Hv5V+;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40JNgiVX030089;
	Fri, 19 Jan 2024 17:42:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1705707764;
	bh=v7HzGXB0B5zFp+pxvyPvrvH9mlWN15xTE+KYhse89vc=;
	h=From:To:Subject:Date;
	b=Bq5Hv5V+L7FgfSwyj1DsdOCwxYuoGyVhEicBjUmLfHNWSRD7GD5nMz68SSP+po6cj
	 pb5EyjZMaluqdKQf7h60xaOxA0zoXUtmzby9muXQ+q60g63jS9qGOEv4vhgQd7HLVk
	 y9yCyjj6nUF+dDqrH4DZzTfAupxIghuhOUHhpKas=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40JNgiGE002249
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 19 Jan 2024 17:42:44 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 19
 Jan 2024 17:42:43 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 19 Jan 2024 17:42:43 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40JNgh7a073063;
	Fri, 19 Jan 2024 17:42:43 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1rQyVX-0002rZ-SE; Fri, 19 Jan 2024 17:42:43 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] nativesdk-packagegroup-arago-tisdk-host: Remove nativesdk-python3-distutils
Date: Fri, 19 Jan 2024 17:42:43 -0600
Message-ID: <20240119234243.10594-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 19 Jan 2024 23:42:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15076

python 3.12.0 no longer includes distutils, so we cannot depend on it.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb     | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
index 859d9eab..a92b99c1 100644
--- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
@@ -27,7 +27,6 @@ EXTRA_TI_TOOLS = " \
 RDEPENDS:${PN} = "\
     nativesdk-packagegroup-sdk-host \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'nativesdk-wayland-dev', '', d)} \
-    nativesdk-python3-distutils \
     nativesdk-python3-numpy \
     nativesdk-git \
     nativesdk-mtd-utils-ubifs \
-- 
2.17.1


