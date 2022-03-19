Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 188DFC433F5
	for <webhook@archiver.kernel.org>; Sat, 19 Mar 2022 12:33:24 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.6603.1647693202867627515
 for <meta-arago@lists.yoctoproject.org>;
 Sat, 19 Mar 2022 05:33:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ipiEFiSy;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22JCXHqm096584;
	Sat, 19 Mar 2022 07:33:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647693197;
	bh=bczirB+Pv8/EloKt3KSIHuSQzLfvd56q96lUubnwAY8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ipiEFiSyM0WfU/IIDOKj9tvamshMI+PhFiC71ng1NIoxze1Z9qDfr2FUwBVpEmP3H
	 MDcnkMfg9Ei6G5yVwtsuPsXM3IdqtWGyH5asAnMdK61yP/ualoTB+g3xILZpgyYFtW
	 6tKUaVXHkIWtzWWGgENSSh3LdrJDnzLaqfbevEXA=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22JCXH2e105939
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 19 Mar 2022 07:33:17 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Sat, 19
 Mar 2022 07:33:16 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Sat, 19 Mar 2022 07:33:16 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22JCXGP2115893;
	Sat, 19 Mar 2022 07:33:16 -0500
From: Nishanth Menon <nm@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <d-gerlach@ti.com>, <j-humphreys@ti.com>, <khilman@ti.com>,
        <meta-arago@lists.yoctoproject.org>, <minas@ti.com>,
        <nikhil.nd@ti.com>, <praneeth@ti.com>, <spatton@ti.com>,
        Nishanth Menon <nm@ti.com>
Subject: [master/dunfell PATCH V4 04/12] tisdk-base-image: Reformat
 documentation and clarify usage
Date: Sat, 19 Mar 2022 07:33:02 -0500
Message-ID: <20220319123310.8546-5-nm@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220319123310.8546-1-nm@ti.com>
References: <20220319123310.8546-1-nm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 19 Mar 2022 12:33:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13686

Reformat the documentation to indicate the summary and description
in a standardized manner.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
Changes Since V3: None.

V3: https://lore.kernel.org/all/20220318184045.11246-5-nm@ti.com/

 meta-arago-distro/recipes-core/images/tisdk-base-image.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-base-image.bb b/meta-arago-distro/recipes-core/images/tisdk-base-image.bb
index 76668831354f..8698816df52d 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-base-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-base-image.bb
@@ -1,5 +1,7 @@
-# Arago TI SDK base image with test tools
-# Suitable for initramfs
+SUMMARY = " Arago TI SDK base image with test tools"
+
+DESCRIPTION = "Arago SDK base image suitable for initramfs containing\
+ comprehensive test tools."
 
 require arago-image.inc
 
-- 
2.31.1


