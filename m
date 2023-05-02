Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF6BC77B78
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 20:14:25 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.1068.1683058455492937524
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 02 May 2023 13:14:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=CHyaqQdS;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 342KEB9V058985;
	Tue, 2 May 2023 15:14:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1683058451;
	bh=veBxSkN6Wkw+LpR7FDWnzscJtZhM8uKY+yOFhuS+8Gs=;
	h=From:To:CC:Subject:Date;
	b=CHyaqQdSJorICxovlm8uzwFao12hhjPbcA7N04TjLrrO1QbfuJBAoyx3cUQMzKy9Q
	 k9dS6dPmQ0DvedNNHq0Y03oHw06t9n3UtAXmbxBKPuecXSEuVTs0p4r3DQjNosiQ7k
	 V5kVtIJLNL+/i6x8bcowDicrImhQsEeuXVVk5jTE=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 342KEBqZ030014
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 2 May 2023 15:14:11 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 2
 May 2023 15:14:11 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 2 May 2023 15:14:11 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 342KEBHE031512;
	Tue, 2 May 2023 15:14:11 -0500
From: <rs@ti.com>
To: <afd@ti.com>, <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH] packagegroup-arago-base-tisdk: replace dbus with dbus-broker
Date: Tue, 2 May 2023 15:14:09 -0500
Message-ID: <20230502201409.1750017-1-rs@ti.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 02 May 2023 20:14:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14389

From: Randolph Sapp <rs@ti.com>

Replace dbus with the faster and more favorable drop-in replacement,
dbus-broker. A handful of distros have made this change. Fedora being a
notable one.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
index 6a21bdd7..03e5a5f9 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
@@ -13,7 +13,7 @@ OPTEE_PKGS = " \
 "
 
 RDEPENDS:${PN} = "\
-    dbus \
+    dbus-broker \
     expat \
     glib-2.0 \
     libxml2 \
-- 
2.40.0


