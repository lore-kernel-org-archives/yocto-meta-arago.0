Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11503C3527D
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 18:40:52 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.13612.1647628849623124384
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 11:40:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=L21xiXMi;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22IIelXF044439;
	Fri, 18 Mar 2022 13:40:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647628847;
	bh=wWBqKNUqACXkgDvHa1+k0gKpzAxj7QITIIs8txwwsSY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=L21xiXMijphTxMZffhikp6y9tdFOXSofA/OJM8KF7CCxSWxaAnwsj4ZxlWBd1tQ0w
	 MDrpSJhzGJzmdsBSr91yk+nbQbkldbuIIVX2w0SbPgVyMgzgzL+uS1nqWKfX7er/dm
	 SsZQrpgboHm9lh+dxWmZ56z/nM2eAJqaQUd7c/pA=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22IIelae108923
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Mar 2022 13:40:47 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 18
 Mar 2022 13:40:46 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 18 Mar 2022 13:40:46 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22IIekeM103513;
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
Subject: [dunfell/master PATCH V3 05/12] tisdk-default-image: Reformat
 documentation and clarify usage
Date: Fri, 18 Mar 2022 13:40:38 -0500
Message-ID: <20220318184045.11246-6-nm@ti.com>
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
 <meta-arago@lists.yoctoproject.org>; Fri, 18 Mar 2022 18:40:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13661

Reformat the documentation to indicate the summary and description
in a standardized manner.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
Changes since v2: Update to use SUMMARY and DESCRIPTION

V2: https://lore.kernel.org/all/20220318143735.17642-6-nm@ti.com/
 meta-arago-distro/recipes-core/images/tisdk-default-image.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
index 152f8572afcb..a84e752c0402 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
@@ -1,4 +1,7 @@
-# Arago TI SDK full filesystem image
+SUMMARY = "Arago TI SDK full filesystem image"
+
+DESCRIPTION = "Complete Arago TI SDK filesystem image containing complete\
+ applications and packages to entitle the SoC."
 
 require arago-image.inc
 
-- 
2.17.1


