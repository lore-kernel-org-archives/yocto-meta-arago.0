Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7961CC25B48
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 16:57:48 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.205787.1698339467256123057
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 26 Oct 2023 09:57:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=AyvyT6nI;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39QGvido123034;
	Thu, 26 Oct 2023 11:57:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1698339464;
	bh=gme0MO41PAHyBPsTxoMVz14IK36fihoa9w68+yEYzQ0=;
	h=From:To:Subject:Date;
	b=AyvyT6nILgkMMTreosNd7lpxP7W20a/3floYGQsrO1Ixmoj1ARYW63mp+oJX+5ax7
	 jSXBjxmEpwDCHvSp6U8mhPOnz3lGmrynAhTXEWlpLckGYq6ImM4ke/yaVySXrH0aJr
	 WJusO+P98Xe21BJLU8Iye6GAfIxM6NRH+Hz9pERU=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39QGvi6I100661
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 26 Oct 2023 11:57:44 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 26
 Oct 2023 11:57:44 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 26 Oct 2023 11:57:44 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39QGvir6128815;
	Thu, 26 Oct 2023 11:57:44 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qw3g0-0007kE-CX; Thu, 26 Oct 2023 11:57:44 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] Revert "tisdk-default-image: Add Matrix GUI only for legacy platforms"
Date: Thu, 26 Oct 2023 11:57:44 -0500
Message-ID: <20231026165744.29731-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 26 Oct 2023 16:57:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14971

This reverts commit 35387dd8dbc438b759d8de1ae195664272af9cd3.

There is at least one script from this package that is needed by our
bigger testing flow.  We will need to rework the packages beling
excluded by this patch so that the testing can still work even if these
package groups are not included.
---
 .../recipes-core/images/tisdk-default-image.bb      | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
index 0d2291b8..33ed0f57 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
@@ -23,6 +23,8 @@ IMAGE_INSTALL += "\
     ${@['','packagegroup-arago-tisdk-opencl'][oe.utils.all_distro_features(d, 'opencl', True, False) and bb.utils.contains('MACHINE_FEATURES', 'dsp', True, False, d)]} \
     packagegroup-arago-tisdk-connectivity \
     packagegroup-arago-tisdk-crypto \
+    packagegroup-arago-tisdk-matrix \
+    packagegroup-arago-tisdk-matrix-extra \
     packagegroup-arago-tisdk-multimedia \
     packagegroup-arago-tisdk-addons \
     packagegroup-arago-tisdk-addons-extra \
@@ -33,16 +35,6 @@ IMAGE_INSTALL += "\
     packagegroup-arago-tisdk-sysrepo \
 "
 
-MATRIX_OOB = ""
-MATRIX_OOB:append:ti33x = " \
-    packagegroup-arago-tisdk-matrix \
-    packagegroup-arago-tisdk-matrix-extra \
-"
-MATRIX_OOB:append:ti43x = " \
-    packagegroup-arago-tisdk-matrix \
-    packagegroup-arago-tisdk-matrix-extra \
-"
-
 export IMAGE_BASENAME = "tisdk-default-image"
 
 # Disable ubi/ubifs as the filesystem requires more space than is
@@ -86,6 +78,5 @@ IMAGE_INSTALL += "\
     ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "${PYTHON2APPS}", "", d)} \
     ${DEVTOOLS} \
     ${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'valgrind', '', d)} \
-    ${MATRIX_OOB} \
     docker \
 "
-- 
2.17.1


