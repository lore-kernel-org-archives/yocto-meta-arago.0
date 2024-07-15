Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77C26C3DA4B
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:34:22 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.423.1721072055973254498
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 15 Jul 2024 12:34:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Qg616GCI;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46FJYExS106128;
	Mon, 15 Jul 2024 14:34:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721072054;
	bh=QIsPTsDQKH+WQA4Rvj/IrSZPpOnS82u1oMPRGp1fwVQ=;
	h=From:To:Subject:Date;
	b=Qg616GCIz3e5Y8Qr3J2WdsjrYrBARMP01JFEA9qx/GaMFOfv7p8yC71z2U0wbq0cY
	 xx/fMS19Ryfd20B7ONfyhhA6QfvkBn9tjGXBX8xcWHpQX1eGjVfgLc1BW2iQlsoW/C
	 CyyWun25VMWNg17OJCzLS48BjfQf2xqh3rOnrAOw=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46FJYEmH029632
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 15 Jul 2024 14:34:14 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 15
 Jul 2024 14:34:14 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 15 Jul 2024 14:34:14 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46FJYED0115401;
	Mon, 15 Jul 2024 14:34:14 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sTRSg-0000XO-9X; Mon, 15 Jul 2024 14:34:14 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] gnutls: Add INSANE_SKIP for incompatible-license
Date: Mon, 15 Jul 2024 14:34:14 -0500
Message-ID: <20240715193414.2022-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 15 Jul 2024 19:34:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15440

A recent change in master has promoted a lot more warnings into errors.
Set the INSANE_SKIP variable since we are using INCOMPATIBLE_LICENSE.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/recipes-support/gnutls/gnutls_%.bbappend | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-distro/recipes-support/gnutls/gnutls_%.bbappend b/meta-arago-distro/recipes-support/gnutls/gnutls_%.bbappend
index 4ad4f70a..44d1e3fa 100644
--- a/meta-arago-distro/recipes-support/gnutls/gnutls_%.bbappend
+++ b/meta-arago-distro/recipes-support/gnutls/gnutls_%.bbappend
@@ -3,3 +3,5 @@ PR:append = ".arago0"
 # Set INCOMPATIBLE_LICENSE to GPLv3 to allow gnutls to use the non GPLv2
 # version of gettext.
 INCOMPATIBLE_LICENSE = "GPL-3.0*"
+
+INSANE_SKIP:${PN} += "incompatible-license"
-- 
2.17.1


