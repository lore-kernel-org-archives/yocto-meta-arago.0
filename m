Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDC2FC3527C
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 18:40:51 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.13613.1647628849672358597
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 11:40:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=VNOOF6MQ;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22IIel5T101178;
	Fri, 18 Mar 2022 13:40:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647628847;
	bh=5GZXKRk2OU7VGZCnneqp+xKZAZhBekYs+fQOo3US9BE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=VNOOF6MQKLD5RA6c9iyWvcD6N0enIloTIdDozH5YNdkLat+utqiP9Z8tNLve4MKIl
	 c1tyLgw4uWGSw8Q+mjXh/csJGrmZmnq3ssimgPguN3Sxbbzca9LqmkG2EFg2AmhAFC
	 EutJTWn4dzbZAnnApMLy0+BVr9gz1huvt2od7EiQ=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22IIelGG024202
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Mar 2022 13:40:47 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 18
 Mar 2022 13:40:46 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 18 Mar 2022 13:40:46 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22IIekCj110479;
	Fri, 18 Mar 2022 13:40:46 -0500
From: Nishanth Menon <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
CC: Dave Gerlach <d-gerlach@ti.com>,
        "Humphreys, Jonathan"
	<j-humphreys@ti.com>,
        praneeth <praneeth@ti.com>, minas <minas@ti.com>,
        "Hilman, Kevin" <khilman@ti.com>, "Patton, Schuyler" <spatton@ti.com>,
        "Devshatwar, Nikhil" <nikhil.nd@ti.com>,
        <meta-arago@lists.yoctoproject.org>, Nishanth Menon <nm@ti.com>
Subject: [dunfell/master PATCH V3 02/12] tisdk-tiny-image: Split common
 components into include file
Date: Fri, 18 Mar 2022 13:40:35 -0500
Message-ID: <20220318184045.11246-3-nm@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220318184045.11246-1-nm@ti.com>
References: <20220318184045.11246-1-nm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 18 Mar 2022 18:40:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13664

Lets split the common pieces for creating a tiny image into an include
file. This can then be used to incrementally build additional images
as well.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
no changes since V2

V2: https://lore.kernel.org/all/20220318143735.17642-3-nm@ti.com/
 .../{tisdk-tiny-image.bb => arago-tiny-image.inc}     |  7 -------
 .../recipes-core/images/tisdk-tiny-image.bb           | 11 +++--------
 2 files changed, 3 insertions(+), 15 deletions(-)
 copy meta-arago-distro/recipes-core/images/{tisdk-tiny-image.bb => arago-tiny-image.inc} (50%)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb b/meta-arago-distro/recipes-core/images/arago-tiny-image.inc
similarity index 50%
copy from meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
copy to meta-arago-distro/recipes-core/images/arago-tiny-image.inc
index 28da0b60cc35..79c8f6075911 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-tiny-image.inc
@@ -4,13 +4,6 @@ require arago-image.inc
 
 IMAGE_FEATURES_remove = "package-management splash"
 
-IMAGE_FSTYPES += "cpio cpio.xz"
-
-ARAGO_TINY_IMAGE_EXTRA_INSTALL ?= ""
-
 IMAGE_INSTALL = " \
 	packagegroup-arago-sysvinit-boot \
-	${ARAGO_TINY_IMAGE_EXTRA_INSTALL} \
 "
-
-export IMAGE_BASENAME = "tisdk-tiny-image"
diff --git a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb b/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
index 28da0b60cc35..85ae3728e86e 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
@@ -1,15 +1,10 @@
-ARAGO_SYSVINIT = "1"
-
-require arago-image.inc
+ARAGO_TINY_IMAGE_EXTRA_INSTALL ?= ""
 
-IMAGE_FEATURES_remove = "package-management splash"
+require arago-tiny-image.inc
 
 IMAGE_FSTYPES += "cpio cpio.xz"
 
-ARAGO_TINY_IMAGE_EXTRA_INSTALL ?= ""
-
-IMAGE_INSTALL = " \
-	packagegroup-arago-sysvinit-boot \
+IMAGE_INSTALL += " \
 	${ARAGO_TINY_IMAGE_EXTRA_INSTALL} \
 "
 
-- 
2.17.1


