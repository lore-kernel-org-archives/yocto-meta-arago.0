Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 555C9C41513
	for <webhook@archiver.kernel.org>; Fri,  4 Aug 2023 14:25:49 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.12422.1691159141196244727
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 04 Aug 2023 07:25:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=bl7Y4rf4;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 374EPbXO119369;
	Fri, 4 Aug 2023 09:25:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1691159137;
	bh=5oAzARhqTfhjcVVq5ed7oMjjjV4hyyjGrVoUf7eW4hA=;
	h=From:To:Subject:Date;
	b=bl7Y4rf4yECuXz5rLg/S6+bMthDiPD1imMpjTeH9DKOBj409Pdb8EfF/z8aWEW5Vn
	 rQper+rvbjLycqdACfOPLXCRe3sl8uAgqrdRwdh7VkXYXDKo5F1AzqChEQcA5ILJ1Q
	 /i2zcMMJ64WCi/vpFUVXbl/43EyRyzXEwvnfbCcc=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 374EPb3l116438
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 4 Aug 2023 09:25:37 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 4
 Aug 2023 09:25:37 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 4 Aug 2023 09:25:37 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 374EPbJb029612;
	Fri, 4 Aug 2023 09:25:37 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qRvkH-0005kj-Dh; Fri, 04 Aug 2023 09:25:37 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH v2 1/3] tisdk-tiny-image: Set INITRAMFS_MAXSIZE
Date: Fri, 4 Aug 2023 09:25:35 -0500
Message-ID: <20230804142537.22072-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 04 Aug 2023 14:25:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14820

We have been running into issues where we add a package and then find
out that the tiny image grew too big for our requirements.  Turns out
there is a variable we can set to prevent this.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb b/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
index 8117ebc5..1f63ca0b 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
@@ -16,6 +16,9 @@ IMAGE_FEATURES:remove = "package-management"
 
 IMAGE_FSTYPES += "cpio cpio.xz"
 
+INITRAMFS_FSTYPES += "cpio cpio.xz"
+INITRAMFS_MAXSIZE = "65536"
+
 IMAGE_INSTALL += " \
 	${ARAGO_TINY_IMAGE_EXTRA_INSTALL} \
 "
-- 
2.17.1


