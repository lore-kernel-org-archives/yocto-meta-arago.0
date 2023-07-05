Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51523EB64DA
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 16:34:27 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.22269.1688574857789950295
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 05 Jul 2023 09:34:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=NIb6QwA5;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 365GYFGZ043953;
	Wed, 5 Jul 2023 11:34:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1688574855;
	bh=AiOR8E4PHIXblRl4P8CxL0SLEEQQnTedekRq60LQE2w=;
	h=From:To:Subject:Date;
	b=NIb6QwA5uP0FQ8LhXhGWnnFiN0mMJyy3fxLziZQjpKJZoVmaEmB+gdJuBDZcKy2at
	 UbXPVAbVOjo3pyrr6vIsZAwmdILI2cv+Kz+1Aoe6u+T8tDoWzO3hBO63bl8oWt5nuf
	 tIL8aiB5hshNrLNrVaU5wa70IS63oMkNdeTHZfuU=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 365GYF7w099596
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Jul 2023 11:34:15 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Jul 2023 11:34:14 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Jul 2023 11:34:14 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 365GYER4026909;
	Wed, 5 Jul 2023 11:34:14 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qH5SI-0003Ch-Kv; Wed, 05 Jul 2023 11:34:14 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH] ti-llvm3.6: Add dependency on ncurses
Date: Wed, 5 Jul 2023 11:34:14 -0500
Message-ID: <20230705163414.12274-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 05 Jul 2023 16:34:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14750

After a long run of no build errors, we are suddenly seeing a build
error on this package related to the llvm-config program not being able
to find libtinfo.so.5.

Signed-off-by: Julien Panis <jpanis@baylibre.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
index 03240e68..4b990b7f 100644
--- a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
+++ b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
@@ -19,7 +19,7 @@ inherit pkgconfig
 
 LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=47e311aa9caedd1b3abf098bd7814d1d"
 
-DEPENDS += "libxml2 groff-native"
+DEPENDS += "ncurses libxml2 groff-native"
 DEPENDS:append:class-target = " valgrind"
 
 LLVM_DIR = "ti-llvm${PV}"
-- 
2.17.1


