Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF7C9CDB46E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 17:49:43 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.19235.1697132980979481014
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 12 Oct 2023 10:49:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ROSuExXV;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39CHndaj023862;
	Thu, 12 Oct 2023 12:49:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697132979;
	bh=8dZDmWgsXzbV0lTOAZOOWc1ETsdGS+DSm2Znk1R6iII=;
	h=From:To:CC:Subject:Date;
	b=ROSuExXVRA4dFZY30MCx/Ya2Hi+JlCwMcUspOKICm5D7nF5Di2F88YLLKOyjbsL/d
	 4HBe98/+3b30AYvTmx4ER+0g4Tze40CmBSr8mE2LlSvthDww2lPGvhoyLFMwbFFVCR
	 GPx3Uqf8+vkTfvIXoH+pLbidPicWRGTcGfX9RLmE=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39CHndhf007911
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 12 Oct 2023 12:49:39 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 12
 Oct 2023 12:49:39 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 12 Oct 2023 12:49:38 -0500
Received: from fllv0039.itg.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39CHnc5W013359;
	Thu, 12 Oct 2023 12:49:38 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH 1/2] packagegroups: base-tisdk: Remove iperf from packagegroup
Date: Thu, 12 Oct 2023 12:49:36 -0500
Message-ID: <20231012174937.2047374-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 12 Oct 2023 17:49:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14930

We want iperf3 which is already in this list, iperf is the older
v2.0 that is only needed by some old test scripts. It is already
included in the test packagegroups.

Without this patch we cannot build base or thinlinux images without
the meta-arago-test layer. That layer is not listed in the LAYERDEPENDS
and so should be considered optional for meta-arago-distro images.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../packagegroups/packagegroup-arago-base-tisdk.bb             | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
index 00f6db61..65fc015b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Additional packages beyond console packages shared by TI SDKs"
 LICENSE = "MIT"
-PR = "r23"
+PR = "r24"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -20,7 +20,6 @@ RDEPENDS:${PN} = "\
     libxml2 \
     libpcre \
     iptables \
-    iperf \
     iperf3 \
     netperf \
     arago-gpl-notice \
-- 
2.39.2


