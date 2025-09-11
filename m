Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 786E0CAC58E
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 21:06:57 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.465.1757624810310512064
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 11 Sep 2025 14:06:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=tdH07rsx;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: jm@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58BL6jWW829445;
	Thu, 11 Sep 2025 16:06:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757624805;
	bh=nTTrRVgmoBVRM1qK9UUENlDZf6IlurJ16fmrywa2YCw=;
	h=From:To:CC:Subject:Date;
	b=tdH07rsx8tv2B0mY7/fInVhxSPoO+gwpXa8xMSGp91qbrFwrPlgu5sEgqUKLvIx4W
	 2xQoDg0PuN7hMnPS/5Bbabp5hYQvt/LZEBEwoInBjo0PC74uycLrXmsZzaATcGasIS
	 ktF2n3gsn2soAOTW0kn9iAJ1wAEeZn3G6mxe9Ca0=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58BL6j8F1370872
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 11 Sep 2025 16:06:45 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 11
 Sep 2025 16:06:45 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 11 Sep 2025 16:06:45 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58BL6jx12549290;
	Thu, 11 Sep 2025 16:06:45 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Ryan Eatmon <reatmon@ti.com>
CC: Chirag Shilwant <c-shilwant@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Praneeth Bajjuri <praneeth@ti.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [master/scarthgap][PATCH] hwspinlocktest: Update hwspinlock recipe remote repo url
Date: Thu, 11 Sep 2025 16:06:45 -0500
Message-ID: <20250911210645.2142573-1-jm@ti.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 11 Sep 2025 21:06:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16569

The hwspinlock module is still not moved to git.ti.com. So a new
fork has been created to add support for am62sip platform.

Move now to new forked repo and remove patches that have already been
integrated to the new forked repo master branch.

Signed-off-by: Judith Mendez <jm@ti.com>
---
 ...test-Remove-hwspin_lock_get_id-calls.patch | 69 -------------------
 .../0002-Add-support-for-AM62-SoCs.patch      | 31 ---------
 .../hwspinlocktest/hwspinlocktest_0.1.bb      |  6 +-
 3 files changed, 2 insertions(+), 104 deletions(-)
 delete mode 100644 meta-arago-test/recipes-kernel/hwspinlocktest/files/0001-omap_hwspinlock_test-Remove-hwspin_lock_get_id-calls.patch
 delete mode 100644 meta-arago-test/recipes-kernel/hwspinlocktest/files/0002-Add-support-for-AM62-SoCs.patch

diff --git a/meta-arago-test/recipes-kernel/hwspinlocktest/files/0001-omap_hwspinlock_test-Remove-hwspin_lock_get_id-calls.patch b/meta-arago-test/recipes-kernel/hwspinlocktest/files/0001-omap_hwspinlock_test-Remove-hwspin_lock_get_id-calls.patch
deleted file mode 100644
index d4448397..00000000
--- a/meta-arago-test/recipes-kernel/hwspinlocktest/files/0001-omap_hwspinlock_test-Remove-hwspin_lock_get_id-calls.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From fb986ed355cd488da64da9eb94d0f260bb329d5b Mon Sep 17 00:00:00 2001
-From: Ryan Eatmon <reatmon@ti.com>
-Date: Fri, 11 Apr 2025 13:49:11 -0500
-Subject: [PATCH] omap_hwspinlock_test: Remove hwspin_lock_get_id() calls
-
-The hwspin_lock_get_id() function was removed in the most recent
-kernel [1].  We can safely stop using this function even for older kernels,
-so go ahead and take these changes.
-
-[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=fec04edb74126f21ac628c7be763c97deb49f69d
-
-Upstream-Status: Inactive-Upstream [private repo]
-
-Signed-off-by: Ryan Eatmon <reatmon@ti.com>
----
- omap_hwspinlock_test.c | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/omap_hwspinlock_test.c b/omap_hwspinlock_test.c
-index b180138..f3e0912 100644
---- a/omap_hwspinlock_test.c
-+++ b/omap_hwspinlock_test.c
-@@ -26,12 +26,12 @@ struct hwspinlock_data {
-	const unsigned int max_locks;
- };
-
--static int hwspin_lock_test(struct hwspinlock *hwlock)
-+static int hwspin_lock_test(struct hwspinlock *hwlock, int lock_num)
- {
-	int i;
-	int ret;
-
--	pr_err("\nTesting lock %d\n", hwspin_lock_get_id(hwlock));
-+	pr_err("\nTesting lock %d\n", lock_num);
-	for (i = 0; i < count; i++) {
-		ret = hwspin_trylock(hwlock);
-		if (ret) {
-@@ -82,7 +82,7 @@ static int hwspin_lock_test_all_locks(unsigned int max_locks)
-			continue;
-		}
-
--		ret1 = hwspin_lock_test(hwlock);
-+		ret1 = hwspin_lock_test(hwlock, i);
-		if (ret1) {
-			pr_err("hwspinlock tests failed on lock %d\n", i);
-			ret = ret1;
-@@ -147,17 +147,17 @@ static int hwspin_lock_test_all_phandle_locks(unsigned int max_locks)
-			continue;
-		}
-
--		ret1 = hwspin_lock_test(hwlock);
-+		ret1 = hwspin_lock_test(hwlock, i);
-		if (ret1) {
-			pr_err("hwspinlock test failed on DT lock %d, ret = %d\n",
--			       hwspin_lock_get_id(hwlock), ret1);
-+			       hwlock_id, ret1);
-			ret = ret1;
-		}
-
-		ret1 = hwspin_lock_free(hwlock);
-		if (ret1) {
-			pr_err("hwspin_lock_free failed on lock %d\n",
--			       hwspin_lock_get_id(hwlock));
-+			       hwlock_id);
-			ret = ret1;
-		}
-	}
---
-2.17.1
diff --git a/meta-arago-test/recipes-kernel/hwspinlocktest/files/0002-Add-support-for-AM62-SoCs.patch b/meta-arago-test/recipes-kernel/hwspinlocktest/files/0002-Add-support-for-AM62-SoCs.patch
deleted file mode 100644
index 30d9886a..00000000
--- a/meta-arago-test/recipes-kernel/hwspinlocktest/files/0002-Add-support-for-AM62-SoCs.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 5ea20dff1aba059cc49e11031f731a422f3fd114 Mon Sep 17 00:00:00 2001
-From: Judith Mendez <jm@ti.com>
-Date: Mon, 18 Nov 2024 14:57:45 -0600
-Subject: [PATCH 2/2] Add support for AM62* SoCs
-
-The K3 AM62* SoCs have a hwspinlock IP in MAIN domain.
-Extend the test to add the desired SoC compatible so that
-the test can be exercised on these new SoC families.
-
-Upstream-Status: Inactive-Upstream [private repo]
-Signed-off-by: Judith Mendez <jm@ti.com>
----
- omap_hwspinlock_test.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/omap_hwspinlock_test.c b/omap_hwspinlock_test.c
-index b180138..46fcc08 100644
---- a/omap_hwspinlock_test.c
-+++ b/omap_hwspinlock_test.c
-@@ -199,6 +199,9 @@ static const struct hwspinlock_data soc_data[] = {
-	{ "ti,j7200",	256, },
-	{ "ti,am642",	256, },
-	{ "ti,j721s2",	256, },
-+	{ "ti,am625",	256, },
-+	{ "ti,am62a7",	256, },
-+	{ "ti,am62p5",	256, },
-	{ /* sentinel */ },
- };
-
---
-2.47.0
diff --git a/meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb b/meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb
index 454f0131..50892379 100644
--- a/meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb
+++ b/meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb
@@ -6,13 +6,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bfa02c83df161e37647ee23a2c7eacd4"
 inherit module
 
 SRC_URI = "\
-    git://github.com/sumananna/omap-hwspinlock-test;protocol=https;branch=master \
+    git://github.com/jmenti/omap-hwspinlock-test-jm;protocol=https;branch=master \
     file://0001-Fix-Makefile-for-to-build-with-yocto.patch \
-    file://0002-Add-support-for-AM62-SoCs.patch \
-    file://0001-omap_hwspinlock_test-Remove-hwspin_lock_get_id-calls.patch \
 "
 
-SRCREV = "20f15e79a3a0197e06328c252d23aec225de21ed"
+SRCREV = "125cf8e0e874d3ccb314c542331f01a719f1538a"
 
 # The inherit of module.bbclass will automatically name module packages with
 # "kernel-module-" prefix as required by the oe-core build environment.
-- 
2.51.0


