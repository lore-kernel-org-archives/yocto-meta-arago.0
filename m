Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DF59C369A2
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 19:20:53 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.35204.1744399252662860498
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 11 Apr 2025 12:20:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Ra3FG/wP;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53BJKpOA2161419
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 14:20:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744399251;
	bh=Fuo5sePQVEuCrDmYgDaRXM8243Kort0Ib8dfCgvoh2s=;
	h=From:To:Subject:Date;
	b=Ra3FG/wPP+f8q6tbStY/UeQjOPLlz4nu1QIYFcOay55ghWipdnpd8Q8N2iVamxz8J
	 6fWD/QmsYia6W0l8HB5FK9ABXRfvBIgbdBpJgoSwVbBQDyVDQLazuOKopfRfMS/mj+
	 rWzXIpOZYgqB8/ys1tEuGokdyaNMu2xBPHkDZcuI=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53BJKpqt039659
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Apr 2025 14:20:51 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Apr 2025 14:20:50 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Apr 2025 14:20:50 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53BJKo8I131071;
	Fri, 11 Apr 2025 14:20:50 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1u3Jvm-0005jw-Il; Fri, 11 Apr 2025 14:20:50 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/scarthgap][PATCH] hwspinlocktest: Fix build against latest kernel
Date: Fri, 11 Apr 2025 14:20:50 -0500
Message-ID: <20250411192050.22024-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 11 Apr 2025 19:20:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16166

A recent change in the kernel removed a function that this test was
calling.  This patch removes the calls to that function and modifies the
flow to not need it.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...test-Remove-hwspin_lock_get_id-calls.patch | 70 +++++++++++++++++++
 .../hwspinlocktest/hwspinlocktest_0.1.bb      | 10 ++-
 2 files changed, 77 insertions(+), 3 deletions(-)
 create mode 100644 meta-arago-test/recipes-kernel/hwspinlocktest/files/0001-omap_hwspinlock_test-Remove-hwspin_lock_get_id-calls.patch

diff --git a/meta-arago-test/recipes-kernel/hwspinlocktest/files/0001-omap_hwspinlock_test-Remove-hwspin_lock_get_id-calls.patch b/meta-arago-test/recipes-kernel/hwspinlocktest/files/0001-omap_hwspinlock_test-Remove-hwspin_lock_get_id-calls.patch
new file mode 100644
index 00000000..7a8deb4e
--- /dev/null
+++ b/meta-arago-test/recipes-kernel/hwspinlocktest/files/0001-omap_hwspinlock_test-Remove-hwspin_lock_get_id-calls.patch
@@ -0,0 +1,70 @@
+From fb986ed355cd488da64da9eb94d0f260bb329d5b Mon Sep 17 00:00:00 2001
+From: Ryan Eatmon <reatmon@ti.com>
+Date: Fri, 11 Apr 2025 13:49:11 -0500
+Subject: [PATCH] omap_hwspinlock_test: Remove hwspin_lock_get_id() calls
+
+The hwspin_lock_get_id() function was removed in the most recent
+kernel [1].  We can safely stop using this function even for older kernels,
+so go ahead and take these changes.
+
+[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=fec04edb74126f21ac628c7be763c97deb49f69d
+
+Upstream-Status: Inactive-Upstream [private repo]
+
+Signed-off-by: Ryan Eatmon <reatmon@ti.com>
+---
+ omap_hwspinlock_test.c | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/omap_hwspinlock_test.c b/omap_hwspinlock_test.c
+index b180138..f3e0912 100644
+--- a/omap_hwspinlock_test.c
++++ b/omap_hwspinlock_test.c
+@@ -26,12 +26,12 @@ struct hwspinlock_data {
+ 	const unsigned int max_locks;
+ };
+ 
+-static int hwspin_lock_test(struct hwspinlock *hwlock)
++static int hwspin_lock_test(struct hwspinlock *hwlock, int lock_num)
+ {
+ 	int i;
+ 	int ret;
+ 
+-	pr_err("\nTesting lock %d\n", hwspin_lock_get_id(hwlock));
++	pr_err("\nTesting lock %d\n", lock_num);
+ 	for (i = 0; i < count; i++) {
+ 		ret = hwspin_trylock(hwlock);
+ 		if (ret) {
+@@ -82,7 +82,7 @@ static int hwspin_lock_test_all_locks(unsigned int max_locks)
+ 			continue;
+ 		}
+ 
+-		ret1 = hwspin_lock_test(hwlock);
++		ret1 = hwspin_lock_test(hwlock, i);
+ 		if (ret1) {
+ 			pr_err("hwspinlock tests failed on lock %d\n", i);
+ 			ret = ret1;
+@@ -147,17 +147,17 @@ static int hwspin_lock_test_all_phandle_locks(unsigned int max_locks)
+ 			continue;
+ 		}
+ 
+-		ret1 = hwspin_lock_test(hwlock);
++		ret1 = hwspin_lock_test(hwlock, i);
+ 		if (ret1) {
+ 			pr_err("hwspinlock test failed on DT lock %d, ret = %d\n",
+-			       hwspin_lock_get_id(hwlock), ret1);
++			       hwlock_id, ret1);
+ 			ret = ret1;
+ 		}
+ 
+ 		ret1 = hwspin_lock_free(hwlock);
+ 		if (ret1) {
+ 			pr_err("hwspin_lock_free failed on lock %d\n",
+-			       hwspin_lock_get_id(hwlock));
++			       hwlock_id);
+ 			ret = ret1;
+ 		}
+ 	}
+-- 
+2.17.1
+
diff --git a/meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb b/meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb
index 888e3e00..104c2d15 100644
--- a/meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb
+++ b/meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb
@@ -5,9 +5,13 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/git/LICENSE;md5=bfa02c83df161e37647ee23a2c
 
 inherit module
 
-SRC_URI = "git://github.com/sumananna/omap-hwspinlock-test;protocol=https;branch=master \
-		   file://0001-Fix-Makefile-for-to-build-with-yocto.patch \
-		   file://0002-Add-support-for-AM62-SoCs.patch "
+SRC_URI = "\
+    git://github.com/sumananna/omap-hwspinlock-test;protocol=https;branch=master \
+    file://0001-Fix-Makefile-for-to-build-with-yocto.patch \
+    file://0002-Add-support-for-AM62-SoCs.patch \
+    file://0001-omap_hwspinlock_test-Remove-hwspin_lock_get_id-calls.patch \
+"
+
 SRCREV = "20f15e79a3a0197e06328c252d23aec225de21ed"
 
 S = "${WORKDIR}/git"
-- 
2.17.1


