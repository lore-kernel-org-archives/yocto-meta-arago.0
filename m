Return-Path: <r-gunasekaran@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F535EB64D8
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 10:35:06 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.8139.1687430097243435123
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 22 Jun 2023 03:34:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=AT8uLH2m;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: r-gunasekaran@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35MAYtbJ124509;
	Thu, 22 Jun 2023 05:34:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687430095;
	bh=GUU4ilvCn7gdT0d6P9syEgNVXKneG+U9o8a9k14CPXk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=AT8uLH2mEdHwzi906JddUhGd+Cte3I0GCA4b9XSIqDb9uRwxnQtQ8qMiY3ezLGQ5/
	 z8gWmOx/RCtC5IR58jxRipHOYOxFGyj0G7bHeMGDznHXc6BTi8wLMW6oxUUdyrLQVN
	 Xc6nKEFtzvyY0brTG5UYhgPai2AkaBpIr7WzvDZY=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35MAYt3U023883
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 22 Jun 2023 05:34:55 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 22
 Jun 2023 05:34:55 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 22 Jun 2023 05:34:55 -0500
Received: from uda0500640.dal.design.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35MAYjlO061303;
	Thu, 22 Jun 2023 05:34:53 -0500
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <reatmon@ti.com>, <g-gupta@ti.com>,
        <r-gunasekaran@ti.com>, <praneeth@ti.com>
Subject: [master/kirkstone][PATCH v2 3/3] tisdk-default-image: Add package group for netopeer/sysrepo
Date: Thu, 22 Jun 2023 16:04:45 +0530
Message-ID: <20230622103445.31114-4-r-gunasekaran@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230622103445.31114-1-r-gunasekaran@ti.com>
References: <20230622103445.31114-1-r-gunasekaran@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 22 Jun 2023 10:35:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14677

Add new package group for netopeer2, sysrepo, nw-configurator
and yang models.

Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
---
 .../recipes-core/images/tisdk-default-image.bb  |  1 +
 .../packagegroup-arago-tisdk-sysrepo.bb         | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-sysrepo.bb

diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
index bb825e09..7769c97c 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
@@ -28,6 +28,7 @@ IMAGE_INSTALL += "\
     ti-analytics \
     ti-demos \
     ${ARAGO_DEFAULT_IMAGE_EXTRA_INSTALL} \
+    packagegroup-arago-tisdk-sysrepo \
 "
 
 export IMAGE_BASENAME = "tisdk-default-image"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-sysrepo.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-sysrepo.bb
new file mode 100644
index 00000000..14608dfe
--- /dev/null
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-sysrepo.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Netopeer2 and Sysrepo packagegroup"
+LICENSE = "MIT"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+inherit packagegroup
+
+ARAGO_NETOPEER_SYSREPO = "\
+    sysrepo \
+    netopeer2-server \
+    nw-configurator \
+    tsn-yang-models \
+"
+
+RDEPENDS:${PN} = "\
+    ${ARAGO_NETOPEER_SYSREPO} \
+"
-- 
2.17.1


