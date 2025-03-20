Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5526BC36007
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 18:20:44 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.2125.1742494843845677588
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 20 Mar 2025 11:20:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=sh6VGpQ6;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52KIKg7E705162
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Mar 2025 13:20:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742494842;
	bh=2GJxgrRUT6JVQ4MZKnOiE1GuCSt/q7O4fbm2ay6+rdQ=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=sh6VGpQ6ReS7/4kaXlUbkc1EQ9gfaZ7PM9eVTPQr2oJOOHndGCPMaDbJyyUDCCwA3
	 mpqDi2BbIgawpmFXHLlrU0aiVV5rf6V0KwD3Irn4M2mdYZyas1nlcEqzNE/KVBXBzF
	 U2a5yI5L3p0XahMPnrB7Ps+yyUBLKu5ObEaH2SZw=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52KIKg2A054709
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 20 Mar 2025 13:20:42 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Mar 2025 13:20:42 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Mar 2025 13:20:41 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52KIKg4R095693;
	Thu, 20 Mar 2025 13:20:42 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tvKVW-0000d7-1k; Thu, 20 Mar 2025 13:20:42 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 4/8]  nativesdk-packagegroup-arago-tisdk-host: Wrap various packages in a compliant manner
Date: Thu, 20 Mar 2025 13:20:37 -0500
Message-ID: <20250320182041.2349-5-reatmon@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16136

Previous clean ups wrapped some recipe .bbappend files in a compliant
manner and effectively hid the changes behind having "arago" in the
DISTRO_OVERRIDE.  This same kind wrapping is needed when including the
package in the package group.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
index 177fa668..b20bcb7e 100644
--- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
@@ -10,9 +10,12 @@ PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
 EXTRA_TI_TOOLS = " \
     nativesdk-ti-cgt6x \
     nativesdk-ti-cgt-pru \
+    nativesdk-gcc-arm-baremetal \
+"
+
+UTILS:append:arago = " \
     nativesdk-open62541-examples \
     nativesdk-open62541-tests \
-    nativesdk-gcc-arm-baremetal \
 "
 
 RDEPENDS:${PN} = "\
-- 
2.17.1


