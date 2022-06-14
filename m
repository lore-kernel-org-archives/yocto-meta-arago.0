Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1CFCC43334
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 21:55:26 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.2865.1655243720081154102
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 14 Jun 2022 14:55:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ljP2dD6V;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25ELtH4x015505;
	Tue, 14 Jun 2022 16:55:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1655243717;
	bh=Ut+8iieMYiIBaUwCY++jLpoAkmwoWnOLM2Gx1My7iAk=;
	h=From:To:CC:Subject:Date;
	b=ljP2dD6Vr1isLmZO/1uXOXLVoKM96hIaHNtB3KUGRrSlxD9RWDIauu9IoIaQ6c7AK
	 58rN3lvQ2x/PnNmAZhYDqSbFK81eid0BiDyhNGX47k7f5tdEZeXrnwcX0F+IpNz71P
	 A3tMQ/g5SULvccVSuqfzSjw8Z2cFo8zlYp3pMsug=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25ELtHEW055985
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 14 Jun 2022 16:55:17 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 14
 Jun 2022 16:55:16 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 14 Jun 2022 16:55:16 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25ELtGJI080483;
	Tue, 14 Jun 2022 16:55:16 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][dunfell][PATCH v4 1/2] trusted-firmware-a: Update to latest
 upstream master
Date: Tue, 14 Jun 2022 16:55:14 -0500
Message-ID: <20220614215515.30820-1-afd@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 14 Jun 2022 21:55:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13899

For TF-A we work against upstream first, our fork has only been
used in the rare cases we need to ship a feature before we can
get it upstream. This is not currently the case so lets switch
to upstream repo until there is a need for our fork.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
index 68bfa899..207f3dac 100644
--- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
+++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
@@ -1,8 +1,6 @@
 PV_k3 = "2.6"
 LIC_FILES_CHKSUM_k3 = "file://license.rst;md5=1dd070c98a281d18d9eefd938729b031"
-BRANCH_k3 = "ti-atf"
-SRC_URI_k3 = "git://git.ti.com/atf/arm-trusted-firmware.git;branch=${BRANCH};name=tfa"
-SRCREV_tfa_k3 = "6541aa24f834daa80da701e0054dfe3a16cda0ce"
+SRCREV_tfa_k3 = "453abc80b2eacbf2816c838e47e40f063227d934"
 COMPATIBLE_MACHINE_k3 = "k3"
 TFA_BUILD_TARGET_k3 = "all"
 TFA_INSTALL_TARGET_k3 = "bl31"
-- 
2.36.1


