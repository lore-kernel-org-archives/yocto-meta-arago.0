Return-Path: <s-adivi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D91EBCDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 05:14:05 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.48277.1697778839249565249
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 19 Oct 2023 22:13:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=sPVFjqRl;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: s-adivi@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39K5Ds4B056080;
	Fri, 20 Oct 2023 00:13:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697778835;
	bh=66V2bS9f7Bd3nleEatrCchzQddeooNcaEiOzf4Qi3Uc=;
	h=From:To:CC:Subject:Date;
	b=sPVFjqRl0BVy3Iwhr7mpvrbJaxV7/964YhzsnSdLmMkxnq1jQdWgibHrntsRsz2Zp
	 UQye82SpXrX6cEoklWSmufuHvDpWP6GWM7E4Ar/T38YD7EIohmBy6gF30EAiVn4bws
	 3QfBtl/hgR9yCHxdQZJItbosq8WSPImxgIYQG7Sw=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39K5DsiL034891
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 20 Oct 2023 00:13:54 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 20
 Oct 2023 00:13:54 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 20 Oct 2023 00:13:54 -0500
Received: from SHIELD01.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39K5DpuY087688;
	Fri, 20 Oct 2023 00:13:51 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <denis@denix.org>,
        <reatmon@ti.com>, <c-shilwant@ti.com>, <a-limaye@ti.com>
CC: <g-gupta@ti.com>, <khasim@ti.com>, <p-bhagat@ti.com>
Subject: [meta-arago][kirkstone][PATCH v2] tisdk-default-image: Add Matrix GUI only for legacy platforms
Date: Fri, 20 Oct 2023 10:43:44 +0530
Message-ID: <20231020051344.3806198-1-s-adivi@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 20 Oct 2023 05:14:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14962

Today, only ti33x and ti43x family platforms ship matrix-gui in the SDK.
It is removed for all other platforms in SDK layers. So add it only for
required platforms.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
Instead of just adding matrix packagegroups to IMAGE_INSTALL, create a
variable and add that to IMAGE_INSTALL just like CHROMIUM does it.

 .../recipes-core/images/tisdk-default-image.bb      | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
index 787fac95..21ccca83 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
@@ -24,8 +24,6 @@ IMAGE_INSTALL += "\
     ${@['','packagegroup-arago-tisdk-opencl'][oe.utils.all_distro_features(d, 'opencl', True, False) and bb.utils.contains('MACHINE_FEATURES', 'dsp', True, False, d)]} \
     packagegroup-arago-tisdk-connectivity \
     packagegroup-arago-tisdk-crypto \
-    packagegroup-arago-tisdk-matrix \
-    packagegroup-arago-tisdk-matrix-extra \
     packagegroup-arago-tisdk-multimedia \
     packagegroup-arago-tisdk-addons \
     packagegroup-arago-tisdk-addons-extra \
@@ -36,6 +34,16 @@ IMAGE_INSTALL += "\
     packagegroup-arago-tisdk-sysrepo \
 "
 
+MATRIX_OOB = ""
+MATRIX_OOB:append:ti33x = " \
+    packagegroup-arago-tisdk-matrix \
+    packagegroup-arago-tisdk-matrix-extra \
+"
+MATRIX_OOB:append:ti43x = " \
+    packagegroup-arago-tisdk-matrix \
+    packagegroup-arago-tisdk-matrix-extra \
+"
+
 export IMAGE_BASENAME = "tisdk-default-image"
 
 # Disable ubi/ubifs as the filesystem requires more space than is
@@ -79,5 +87,6 @@ IMAGE_INSTALL += "\
     ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "${PYTHON2APPS}", "", d)} \
     ${DEVTOOLS} \
     ${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'valgrind', '', d)} \
+    ${MATRIX_OOB} \
     docker \
 "
-- 
2.34.1


