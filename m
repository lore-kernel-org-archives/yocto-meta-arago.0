Return-Path: <r-gunasekaran@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80C44C83003
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 11:56:08 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.11407.1686311762164414373
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 09 Jun 2023 04:56:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=uRo8Ouxe;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: r-gunasekaran@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 359Bu1kN027591
	for <meta-arago@lists.yoctoproject.org>; Fri, 9 Jun 2023 06:56:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686311761;
	bh=B3aPCfdQl2Y6YdEzACAhrNsCLJGG2ci1ibWEucJ2hr4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=uRo8OuxeEOSwHzxHu+X+WNzYH0r5mN4SmvspK+sv+ahKqpJkRJcnqYF6LTL04SblH
	 mljLkZIna4MUsd63b6kvkXu81d+S5ceAiKiG5O0gPdorDG2eEr0o+QQxvkgQtTVMdB
	 R4g5tJCqAj9fIoHmJvyrfe0Oa64KL4otCxUpyxLQ=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 359Bu1iB017166
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Fri, 9 Jun 2023 06:56:01 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 Jun 2023 06:56:01 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 Jun 2023 06:56:01 -0500
Received: from uda0500640.dal.design.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 359BtvaY022050;
	Fri, 9 Jun 2023 06:56:00 -0500
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <g-gupta@ti.com>, <r-gunasekaran@ti.com>
Subject: [master/kirkstone 1/3] meta-aragos-extras: sysrepo: Add TSN Yang models
Date: Fri, 9 Jun 2023 17:25:55 +0530
Message-ID: <20230609115557.1685-2-r-gunasekaran@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230609115557.1685-1-r-gunasekaran@ti.com>
References: <20230609115557.1685-1-r-gunasekaran@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 09 Jun 2023 11:56:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14566

Add a recipe to clone from the YangModels repo and install
the TSN Yang based models

Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
---
 .../tsn-yang-models/tsn-yang-models_git.bb    | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-arago-extras/recipes-sysrepo/tsn-yang-models/tsn-yang-models_git.bb

diff --git a/meta-arago-extras/recipes-sysrepo/tsn-yang-models/tsn-yang-models_git.bb b/meta-arago-extras/recipes-sysrepo/tsn-yang-models/tsn-yang-models_git.bb
new file mode 100644
index 00000000..21e2777f
--- /dev/null
+++ b/meta-arago-extras/recipes-sysrepo/tsn-yang-models/tsn-yang-models_git.bb
@@ -0,0 +1,25 @@
+# Recipe created by recipetool
+SUMMARY = "TSN based YANG models"
+DESCRIPTION = ""
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://README.md;md5=a89040f014c0c9c9360e29ddf88bf4a7"
+
+SRC_URI = "git://github.com/YangModels/yang.git;protocol=https;branch=main"
+
+PV = "1.0+git${SRCPV}"
+SRCREV = "d3f6ca02ec9ce7c96b55066d209d08adbe851897"
+
+S = "${WORKDIR}/git"
+
+FILES:${PN} += "/usr/share/yang/*"
+
+do_install:append () {
+    install -d ${D}/usr/share/yang/modules/netopeer2
+    install -o root -g root ${S}/standard/ietf/RFC/iana-if-type.yang ${D}/usr/share/yang/modules/netopeer2/iana-if-type@2017-01-19.yang
+    install -o root -g root ${S}/standard/ieee/draft/802.1/Qcw/ieee802-types.yang ${D}/usr/share/yang/modules/netopeer2/ieee802-types@2022-10-31.yang
+    install -o root -g root ${S}/standard/ieee/draft/802.1/Qcw/ieee802-dot1q-types.yang ${D}/usr/share/yang/modules/netopeer2/ieee802-dot1q-types@2022-10-31.yang
+    install -o root -g root ${S}/standard/ieee/draft/802.1/Qcw/ieee802-dot1q-bridge.yang ${D}//usr/share/yang/modules/netopeer2/ieee802-dot1q-bridge@2022-10-31.yang
+    install -o root -g root ${S}/standard/ieee/draft/802.1/Qcw/ieee802-dot1q-sched.yang ${D}//usr/share/yang/modules/netopeer2/ieee802-dot1q-sched@2022-08-18.yang
+    install -o root -g root ${S}/standard/ieee/draft/802.1/Qcw/ieee802-dot1q-sched-bridge.yang ${D}//usr/share/yang/modules/netopeer2/ieee802-dot1q-sched-bridge@2022-08-18.yang
+}
+
-- 
2.17.1


