Return-Path: <r-gunasekaran@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C58AC0015E
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 10:04:16 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.9465.1687860251509988359
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 27 Jun 2023 03:04:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=qx7OmdBb;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: r-gunasekaran@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35RA4ArV078726;
	Tue, 27 Jun 2023 05:04:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687860250;
	bh=fPIieGHNBOUMiKZIgSSxNzayCh4zL74hQEEwlsKkjuo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=qx7OmdBbbkawnzHwYX5gGjHK6xJ6Quq51YmDf60HQkvgOe1y9pTiuSZG1bykb4in5
	 gdTFLSwRM49XWxMgHpUzrwjVLzLqmbWEOlnpX2T1y16XdzSvNrCwWf/yiD188S27Wg
	 5me7j2VGSw4VCDBrayFGHF/Ktz0rnm8pU1NkRLxE=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35RA4AxP008395
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 27 Jun 2023 05:04:10 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 27
 Jun 2023 05:04:09 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 27 Jun 2023 05:04:09 -0500
Received: from uda0500640.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35RA3klh115122;
	Tue, 27 Jun 2023 05:04:07 -0500
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <reatmon@ti.com>, <g-gupta@ti.com>,
        <r-gunasekaran@ti.com>, <praneeth@ti.com>
Subject: [master/kirkstone][PATCH v3 8/8] tisdk-default-image: Add package group for netopeer/sysrepo
Date: Tue, 27 Jun 2023 15:33:45 +0530
Message-ID: <20230627100345.24340-9-r-gunasekaran@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230627100345.24340-1-r-gunasekaran@ti.com>
References: <20230627100345.24340-1-r-gunasekaran@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 27 Jun 2023 10:04:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14703

Add new package group for netopeer2, sysrepo, nw-configurator
and yang models.

Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
---

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
PACKAGE_ARCH+++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
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


