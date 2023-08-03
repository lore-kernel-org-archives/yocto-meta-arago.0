Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29C8CC001DF
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 20:45:13 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.5111.1691095509575775290
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 03 Aug 2023 13:45:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=fpvQL0aL;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 373Kj7Wt020735;
	Thu, 3 Aug 2023 15:45:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1691095507;
	bh=x9eCQ2gUGK1R8i1wOufAxD9uWbLRzLKNa99V3Fv26Kw=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=fpvQL0aLALJ6S0GDNlH/IWeMEqxlp1BRmrhY/nbqmHaoYGUSHVdTK5uUIGLg23VxO
	 H0fjwh3Tp6s/TAy6dwHjA7z5GN/IwhDtMDX6tXEeoAZzHbFws+YA9oRsbRTY4LgFYt
	 sywBcNgdYG5v5ZOAq9n7qFF1FrCZ07/SCXwNJHAc=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 373Kj7LB017192
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 3 Aug 2023 15:45:07 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 3
 Aug 2023 15:45:07 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 3 Aug 2023 15:45:07 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 373Kj7If019707;
	Thu, 3 Aug 2023 15:45:07 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qRfBz-0002CI-Fe; Thu, 03 Aug 2023 15:45:07 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH 2/2] tisdk-tiny-image: Remove cpio as an image type
Date: Thu, 3 Aug 2023 15:45:07 -0500
Message-ID: <20230803204507.8402-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230803204507.8402-1-reatmon@ti.com>
References: <20230803204507.8402-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 03 Aug 2023 20:45:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14816

With the creation of tisdk-tiny-initramfs we no longer need this image
to create the cpio file.  Instead we will need the user to choose to use
the initramfs by adding the following to the local.conf at runtime:

INITRAMFS_IMAGE = "tisdk-tiny-initramfs"
INITRAMFS_IMAGE_BUNDLE = "1"

This will bundle the initramfs into the kernel and the tiny-image can be
used to boot the system and then flip over to the initramfs.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb b/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
index 8117ebc5..e90ebb76 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
@@ -14,10 +14,7 @@ require arago-tiny-image.inc
 
 IMAGE_FEATURES:remove = "package-management"
 
-IMAGE_FSTYPES += "cpio cpio.xz"
-
 IMAGE_INSTALL += " \
 	${ARAGO_TINY_IMAGE_EXTRA_INSTALL} \
 "
-
 export IMAGE_BASENAME = "tisdk-tiny-image"
-- 
2.17.1


