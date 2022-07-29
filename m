Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6EADC00144
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 19:45:04 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.1297.1659123897760549877
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 29 Jul 2022 12:44:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=eN7tksYN;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26TJisDD117567;
	Fri, 29 Jul 2022 14:44:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1659123894;
	bh=Yt2CHc+mxJYw4D4Bjk6kzkRfOr3pCSURBexjV3yLihQ=;
	h=From:To:Subject:Date;
	b=eN7tksYNuPDZQQMYvfhKL0rsMzOJTJKCsNe5d9pFUrV+gL3hHjrz5Q2T+1pr5D/N1
	 UOHsrGC+34GSMTz7J/9yViOrm7PL3sUY6PXxWpjXm/OGp/Bj6VsBInZBpBfht0a9SR
	 /KjOcbnIwXttGpzgmhJNyS5HYayS5Rlcj4j0Kufk=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26TJiscB020936
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 29 Jul 2022 14:44:54 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 29
 Jul 2022 14:44:54 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 29 Jul 2022 14:44:54 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26TJisow019927;
	Fri, 29 Jul 2022 14:44:54 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1oHVuo-0003ym-Cu; Fri, 29 Jul 2022 14:44:54 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][dunfell][PATCH] ti-linux-fw: Create K3_IMAGE_GEN_BRANCH
 variable
Date: Fri, 29 Jul 2022 14:44:54 -0500
Message-ID: <20220729194454.15257-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 29 Jul 2022 19:45:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13969

For the upcoming CICD flow we need to control the branch for
all of the needed packages.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-bsp/ti-linux-fw/ti-linux-fw.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 8aaf1559..0d947b49 100644
--- a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -29,9 +29,11 @@ K3_IMAGE_GEN_SRCREV ?= "85a70059fc24242ea03653a5014b98100e4da2d6"
 SRCREV_imggen = "${K3_IMAGE_GEN_SRCREV}"
 SRCREV_FORMAT = "imggen"
 
+K3_IMAGE_GEN_BRANCH ?= "master"
+
 SRC_URI = " \
 	git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH} \
-	git://git.ti.com/k3-image-gen/k3-image-gen.git;protocol=git;branch=master;destsuffix=imggen;name=imggen \
+	git://git.ti.com/k3-image-gen/k3-image-gen.git;protocol=git;branch=${K3_IMAGE_GEN_BRANCH};destsuffix=imggen;name=imggen \
 "
 
 S = "${WORKDIR}/git"
-- 
2.17.1


