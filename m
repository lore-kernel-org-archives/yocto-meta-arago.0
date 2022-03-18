Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60D6BC4332F
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 14:37:43 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.10318.1647614262327750126
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 07:37:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Gt4MJK6S;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: nm@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22IEbbJT028470;
	Fri, 18 Mar 2022 09:37:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647614257;
	bh=Lqf+P2HVFTu26paZ6z7/7yb3xXBT4z62LjCH/b6rG2k=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Gt4MJK6SykuzPSy+jUUPgRzDuO1ndSfKrWgOimnO9A1vhl0t2eEYg1l2TfV94m4KF
	 eVEhQhSoVC1i/9+vTQx0z9ZmukgD83u0s83VSxnc3plN+vLZPcu6//cYHVHBLH/GTB
	 6nG+WEBpAZgHV4bZeWhoZ2miRt7UY8YAAXKKHT6k=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22IEbbts007717
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Mar 2022 09:37:37 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 18
 Mar 2022 09:37:37 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 18 Mar 2022 09:37:37 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22IEbbpv065659;
	Fri, 18 Mar 2022 09:37:37 -0500
From: Nishanth Menon <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
CC: Dave Gerlach <d-gerlach@ti.com>,
        "Humphreys, Jonathan"
	<j-humphreys@ti.com>,
        praneeth <praneeth@ti.com>, minas <minas@ti.com>,
        "Hilman, Kevin" <khilman@ti.com>, "Patton, Schuyler" <spatton@ti.com>,
        "Devshatwar, Nikhil" <nikhil.nd@ti.com>,
        <meta-arago@lists.yoctoproject.org>, Nishanth Menon <nm@ti.com>
Subject: [dunfell/master PATCH V2 02/12] tisdk-tiny-image: Split common
 components into include file
Date: Fri, 18 Mar 2022 09:37:25 -0500
Message-ID: <20220318143735.17642-3-nm@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220318143735.17642-1-nm@ti.com>
References: <20220318143735.17642-1-nm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 18 Mar 2022 14:37:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13646

Lets split the common pieces for creating a tiny image into an include
file. This can then be used to incrementally build additional images
as well.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
Changes since v1:
* No change (just rebase)

V1: https://lore.kernel.org/all/20220309021316.28370-2-nm@ti.com/

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
2.31.1


