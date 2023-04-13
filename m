Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 073EAC77B76
	for <webhook@archiver.kernel.org>; Thu, 13 Apr 2023 23:18:32 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.6814.1681427910812441134
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 13 Apr 2023 16:18:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=BPRz30t7;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33DNITiP031259;
	Thu, 13 Apr 2023 18:18:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681427909;
	bh=tbyjbYUE9m6vUVeb6ErrAk9AAVMH5t5VPJKYjXdzeDs=;
	h=From:To:CC:Subject:Date;
	b=BPRz30t7wug7nCBdDNYzJQ7NyfjD7rrt8L7b7FvrXb/wKRuOh4cUnOKDAgCjq0DK6
	 92J6Rm0+11xCtCL1HdwOfiOYjvq7IUnkNSHtHmwzFKNkHmrBPulN1CMwFky3vf2J/q
	 CAPTzrlkS3c+QXMNMqAUbaV+Uo6AKGkpzue1oaIQ=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33DNITmW077294
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Apr 2023 18:18:29 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 13
 Apr 2023 18:18:29 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 13 Apr 2023 18:18:29 -0500
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33DNISXQ070821;
	Thu, 13 Apr 2023 18:18:28 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH] ltp-ddt: disable rpmsg-tests due to missing kernel header
Date: Thu, 13 Apr 2023 18:18:28 -0500
Message-ID: <20230413231828.19293-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 13 Apr 2023 23:18:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14314

This header file is not standard and we should not depend on it.
We can either remove this test from ltp-ddt or fix it after all
the kernels we test have it. Either way, disable it for now.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 ...t-ipc_test_suite-Disable-rpmsg-tests.patch | 27 +++++++++++++++++++
 .../ltp-ddt/ltp-ddt_20210524.bbappend         |  4 +++
 2 files changed, 31 insertions(+)
 create mode 100644 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0001-testcases-ddt-ipc_test_suite-Disable-rpmsg-tests.patch
 create mode 100644 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bbappend

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0001-testcases-ddt-ipc_test_suite-Disable-rpmsg-tests.patch b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0001-testcases-ddt-ipc_test_suite-Disable-rpmsg-tests.patch
new file mode 100644
index 00000000..7a6754f9
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0001-testcases-ddt-ipc_test_suite-Disable-rpmsg-tests.patch
@@ -0,0 +1,27 @@
+From c8bfd05d1f0b82ec596049a1a3f1de7da9993c5b Mon Sep 17 00:00:00 2001
+From: Andrew Davis <afd@ti.com>
+Date: Thu, 13 Apr 2023 18:08:53 -0500
+Subject: [PATCH] testcases/ddt/ipc_test_suite: Disable rpmsg tests
+
+These depend on out-of-tree kernel headers, disable until all kernels
+we test have this header.
+
+Upstream-Status: Inappropriate [temporary fix for LTS migration]
+Signed-off-by: Andrew Davis <afd@ti.com>
+---
+ testcases/ddt/ipc_test_suite/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/testcases/ddt/ipc_test_suite/Makefile b/testcases/ddt/ipc_test_suite/Makefile
+index 468e776d1..42f0fddf9 100644
+--- a/testcases/ddt/ipc_test_suite/Makefile
++++ b/testcases/ddt/ipc_test_suite/Makefile
+@@ -4,7 +4,7 @@ include $(top_srcdir)/include/mk/env_pre.mk
+ 
+ MAKE_TARGETS :=
+ 
+-SUBDIRS := src/rpmsg src/kernel/modules
++SUBDIRS := src/kernel/modules
+ 
+ include $(top_srcdir)/include/mk/generic_trunk_target.mk
+ 
diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bbappend b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bbappend
new file mode 100644
index 00000000..87429377
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bbappend
@@ -0,0 +1,4 @@
+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
+
+SRC_URI += "file://0001-testcases-ddt-ipc_test_suite-Disable-rpmsg-tests.patch"
+
-- 
2.39.2


