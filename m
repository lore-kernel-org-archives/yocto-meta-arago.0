Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C41DC87FD2
	for <webhook@archiver.kernel.org>; Thu, 31 Jul 2025 21:03:33 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.73021.1753995807888785840
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 31 Jul 2025 14:03:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=OttSZq7i;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56VL3Q813532720;
	Thu, 31 Jul 2025 16:03:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753995806;
	bh=S6T2btc5UlHq83At3aIPX+z2YIA5GA2U81o4h8SEWxc=;
	h=From:To:Subject:Date;
	b=OttSZq7icVnrj0dPk2wh4iBvc1J/TkFeKRYsn1+AIicqo89b5yiiNFv1Awwa86fQF
	 +eSuDBwEhunRN2wVM2Xm9flDBSHDKO+EiYwH2HLFdfBHPFgoUTnBYZBcEAD6vhJASw
	 BGurD7wfgHGRzd++qH+B4NJNet5Nv4apmESt91D8=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56VL3QuH037527
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 31 Jul 2025 16:03:26 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 31
 Jul 2025 16:03:26 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 31 Jul 2025 16:03:26 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56VL3Q5O3516823;
	Thu, 31 Jul 2025 16:03:26 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uhaQv-0000jC-Re; Thu, 31 Jul 2025 16:03:25 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] ltp-ddt: Backport ltp patch
Date: Thu, 31 Jul 2025 16:03:25 -0500
Message-ID: <20250731210325.2494-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 31 Jul 2025 21:03:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16347

A recent change in the ltp version in oe-core [1] has broken the patch we
were pointing to in there.  Copy in the version we are expecting and
update the recipe to stop looking in oe-core for files since we have a
copy of the recipe anyway.

[1] https://git.openembedded.org/openembedded-core/commit/?id=6ad236f2fb724798ed62f6ad5f78b51d57496caa

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...001-Remove-OOM-tests-from-runtest-mm.patch | 32 +++++++++++++++++++
 .../ltp-ddt/ltp-ddt_20250130.bb               |  3 --
 2 files changed, 32 insertions(+), 3 deletions(-)
 create mode 100644 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-Remove-OOM-tests-from-runtest-mm.patch

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-Remove-OOM-tests-from-runtest-mm.patch b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-Remove-OOM-tests-from-runtest-mm.patch
new file mode 100644
index 00000000..5b6c780b
--- /dev/null
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/0001-Remove-OOM-tests-from-runtest-mm.patch
@@ -0,0 +1,32 @@
+From 768159aa53257d247645a12518778f50b8fdf578 Mon Sep 17 00:00:00 2001
+From: "Mingde (Matthew) Zeng" <matthewzmd@gmail.com>
+Date: Wed, 29 Jul 2020 08:47:09 -0400
+Subject: [PATCH] Remove OOM tests from runtest/mm
+
+Disable OOM tests, as they might cause oeqa ssh connection lost
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Mingde (Matthew) Zeng <matthew.zeng@windriver.com>
+[ pvorel: rebased for 20210927 ]
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+---
+ runtest/mm | 6 ------
+ 1 file changed, 6 deletions(-)
+
+diff --git a/runtest/mm b/runtest/mm
+index 6a8cd0b9d..8ce3f4416 100644
+--- a/runtest/mm
++++ b/runtest/mm
+@@ -76,12 +76,6 @@ ksm07 ksm07
+ 
+ cpuset01 cpuset01
+ 
+-oom01 oom01
+-oom02 oom02
+-oom03 oom03
+-oom04 oom04
+-oom05 oom05
+-
+ swapping01 swapping01 -i 5
+ 
+ thp01 thp01 -I 120
diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
index 4f8767ca..53d2332b 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
@@ -1,6 +1,3 @@
-FILESEXTRAPATHS:prepend := "${COREBASE}/meta/recipes-extended/ltp/ltp:"
-FILESEXTRAPATHS:prepend := "${TITESTBASE}/recipes-extended/ltp/ltp:"
-
 require ltp_${PV}.inc
 
 SUMMARY = "Embedded Linux Device Driver Tests based on Linux Test Project"
-- 
2.17.1


