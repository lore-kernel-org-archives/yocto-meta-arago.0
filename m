Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E20C5C00144
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 22:54:16 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.4095.1659394450002457496
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 01 Aug 2022 15:54:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=x6J5EPCn;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 271Ms7Bk070726;
	Mon, 1 Aug 2022 17:54:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1659394447;
	bh=jy6vw8saqX/2Z5Y36H9L/Kks9DJZp09xu5i5+6KeBjM=;
	h=From:To:CC:Subject:Date;
	b=x6J5EPCnqrc7tURpavGYx4vWuOdZSdTyjjXKpFgQKdJ4RnlQ8OKm03ESuNpKu0IKJ
	 cniCIIv9QTaxwIDnHt5SG7c1tnAUajoTHXWnsM2sb4/PBpBGa8PzJ44WwQ4AcDUsvy
	 hOmv8qplLxLYMt6rPGud6ZAU+eN0d1UDkLGY1Pzw=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 271Ms6Bx057650
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 1 Aug 2022 17:54:07 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 1
 Aug 2022 17:54:06 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 1 Aug 2022 17:54:06 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 271Ms5WY043441;
	Mon, 1 Aug 2022 17:54:05 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][dunfell/kirkstone/master][PATCH] qtwebengine:
 bison-native dependency is upstream now remove this bbappend
Date: Mon, 1 Aug 2022 17:54:05 -0500
Message-ID: <20220801225405.29609-1-afd@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 01 Aug 2022 22:54:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13971

The dependency on bison-native was fixed in a patch by Denys and is now
in Dunfell/kirkstone/Master, remove this and the now empty bbappend.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend | 4 ----
 1 file changed, 4 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend

diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend
deleted file mode 100644
index 6459bbf7..00000000
--- a/meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend
+++ /dev/null
@@ -1,4 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-PR_append = ".arago1"
-
-DEPENDS += "bison-native"
-- 
2.36.1


