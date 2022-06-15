Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D6A3C433EF
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 15:19:37 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.6105.1655306371094750244
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 15 Jun 2022 08:19:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Rq5ZPyIA;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25FFJSsJ121307;
	Wed, 15 Jun 2022 10:19:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1655306368;
	bh=z/KMbN7tXvB595dwvh014cEDAdcgdoeMAgzCmzf5ao0=;
	h=From:To:CC:Subject:Date;
	b=Rq5ZPyIA+PIOaEyXhbpHJmeZN4iqWZXNM4OJ0Q4vgz5ELmyXDUvM67bb8l/QGJjDQ
	 zNGcyfbIYNsvSHq70oqRSJfuS5D/S+qDkwCHIgPwAAobMwYFuzHaluAjVayRaRs63R
	 r2/AoPQDqXMZbBku4drj+9er0PNCeYJquYfJlZzw=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25FFJSE1065148
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 15 Jun 2022 10:19:28 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 15
 Jun 2022 10:19:28 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 15 Jun 2022 10:19:28 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25FFJRA4029148;
	Wed, 15 Jun 2022 10:19:27 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][dunfell/master][PATCH] optee: drop local forks that
 moved to meta-ti
Date: Wed, 15 Jun 2022 10:19:27 -0500
Message-ID: <20220615151927.17113-1-afd@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 15 Jun 2022 15:19:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13905

There is a light version dependency between optee-os and these
helper projects. They should be updated in the same layer that
updates optee-os (meta-ti). Drop them here.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-security/optee/optee-client_git.bbappend       | 7 -------
 .../recipes-security/optee/optee-examples_git.bbappend     | 7 -------
 .../recipes-security/optee/optee-test_git.bbappend         | 7 -------
 3 files changed, 21 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-security/optee/optee-client_git.bbappend
 delete mode 100644 meta-arago-distro/recipes-security/optee/optee-examples_git.bbappend
 delete mode 100644 meta-arago-distro/recipes-security/optee/optee-test_git.bbappend

diff --git a/meta-arago-distro/recipes-security/optee/optee-client_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-client_git.bbappend
deleted file mode 100644
index a9cb5898..00000000
--- a/meta-arago-distro/recipes-security/optee/optee-client_git.bbappend
+++ /dev/null
@@ -1,7 +0,0 @@
-
-PR_append = ".arago0"
-
-PV = "3.12.0+git${SRCPV}"
-
-SRCREV = "347144b79964233e718347e3f0fbe89ab5be46ae"
-
diff --git a/meta-arago-distro/recipes-security/optee/optee-examples_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-examples_git.bbappend
deleted file mode 100644
index 4299f180..00000000
--- a/meta-arago-distro/recipes-security/optee/optee-examples_git.bbappend
+++ /dev/null
@@ -1,7 +0,0 @@
-
-PR_append = ".arago0"
-
-PV = "3.12.0+git${SRCPV}"
-
-SRCREV = "9a755dcf4d8ef6117af59dfd1b1a82315cee58ca"
-
diff --git a/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
deleted file mode 100644
index 4bfcc89f..00000000
--- a/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
+++ /dev/null
@@ -1,7 +0,0 @@
-
-PR_append = ".arago0"
-
-PV = "3.12.0+git${SRCPV}"
-
-SRCREV = "7be42398e8848f09995abf8a9e9d8bb8840cc19a"
-
-- 
2.36.1


