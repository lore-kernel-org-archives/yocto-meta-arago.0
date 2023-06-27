Return-Path: <r-gunasekaran@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2A6EEB64D9
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 14:43:17 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.15379.1687876994446396034
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 27 Jun 2023 07:43:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=C0StyEZX;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: r-gunasekaran@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35REhCch013750;
	Tue, 27 Jun 2023 09:43:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687876992;
	bh=2ZsvRYgQW7CL9VGDjUXT6ieBFOIdym9fGMmjjVfca/8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=C0StyEZXSQqW1C83PAyY5jct0rPgkb7uQJIIV14vy9of8WSRQ9zKGPVYSH8UPzdE1
	 CRI7w3P+pyt6rNvm0N1nYOF1CDiqaVj4lyLt/DQ7Qy0/hlkp1wm9+s1nbp8ZGn5p53
	 gzqp6VZSG5zbqTZFWVlwx7i4LxVrbprgE4wYkajQ=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35REhCNQ034578
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 27 Jun 2023 09:43:12 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 27
 Jun 2023 09:43:12 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 27 Jun 2023 09:43:12 -0500
Received: from uda0500640.dal.design.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35REgnlm097343;
	Tue, 27 Jun 2023 09:43:10 -0500
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <reatmon@ti.com>, <g-gupta@ti.com>, <praneeth@ti.com>,
        <r-gunasekaran@ti.com>, <afd@ti.com>
Subject: [master/kirkstone][PATCH v4 8/8] tisdk-default-image: Add package group for netopeer/sysrepo
Date: Tue, 27 Jun 2023 20:12:49 +0530
Message-ID: <20230627144249.30543-9-r-gunasekaran@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230627144249.30543-1-r-gunasekaran@ti.com>
References: <20230627144249.30543-1-r-gunasekaran@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 27 Jun 2023 14:43:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14714

Add new package group for netopeer2, sysrepo, nw-configurator
and yang models.

Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
---

Changes since v3:
----------------
Fixed the patch as it was failing to apply cleanly

Changes since v2:
----------------
Removed "PACKAGE_ARCH" as this is not machine specific.

Changes since v1:
----------------
Added a new package group packagegroup-arago-tisdk-sysrepo instead of
using ARAGO_DEFAULT_IMAGE_EXTRA_INSTALL.

 .../recipes-core/images/tisdk-default-image.bb    |  1 +
 .../packagegroup-arago-tisdk-sysrepo.bb           | 15 +++++++++++++++
 2 files changed, 16 insertions(+)
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
index 00000000..c0bb599b
--- /dev/null
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-sysrepo.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Netopeer2 and Sysrepo packagegroup"
+LICENSE = "MIT"
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


