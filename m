Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AC57E6400D
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 19:46:50 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.7472.1732218401174510330
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 21 Nov 2024 11:46:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=eVzsWdCR;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: jm@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4ALJkdmx075442
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 21 Nov 2024 13:46:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1732218399;
	bh=h6/mMULKtF9AjwTmL+RtXKhvgmQULudLo8kQWRVmSpE=;
	h=From:To:CC:Subject:Date;
	b=eVzsWdCR57uYbHv+enU+d23JdftE+G/3045eBeDYJvsSEykaiWjbZGAMwas7YJNw0
	 PmSVSIOgsOAAIc5l7jZRrPSS/29c9hjws2AfVeq0d5V8WLzWwKwGAh2J2nuiNrTaOM
	 fr0gNQtIod2b5Wt0BiFaQJQ2bFiMYyyw5zC9WyJ0=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4ALJkdEN053872
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 21 Nov 2024 13:46:39 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 21
 Nov 2024 13:46:39 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 21 Nov 2024 13:46:39 -0600
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4ALJkdwo021449;
	Thu, 21 Nov 2024 13:46:39 -0600
From: Judith Mendez <jm@ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>,
        Denys Dmytriyenko
	<denys@konsulko.com>, Randolph Sapp <rs@ti.com>,
        Praneeth Bajjuri
	<praneeth@ti.com>, Judith Mendez <jm@ti.com>
Subject: [meta-arago][master/kirkstone/scarthgap][PATCH v3] ti-test: Add hwspinlocktest
Date: Thu, 21 Nov 2024 13:46:39 -0600
Message-ID: <20241121194639.1234420-1-jm@ti.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 21 Nov 2024 19:46:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15630

Add hwspinlock recipe to build out of tree module hwspinlock test.

Signed-off-by: Judith Mendez <jm@ti.com>
---
Changes since RESEND v2:
- add Upstream-Status tag to patches
---
 .../recipes-core/packagegroups/ti-test.bb     |  1 +
 ...Fix-Makefile-for-to-build-with-yocto.patch | 47 +++++++++++++++++++
 .../0002-Add-support-for-AM62-SoCs.patch      | 32 +++++++++++++
 .../hwspinlocktest/hwspinlocktest_0.1.bb      | 18 +++++++
 4 files changed, 98 insertions(+)
 create mode 100644 meta-arago-test/recipes-kernel/hwspinlocktest/files/0001-Fix-Makefile-for-to-build-with-yocto.patch
 create mode 100644 meta-arago-test/recipes-kernel/hwspinlocktest/files/0002-Add-support-for-AM62-SoCs.patch
 create mode 100644 meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb

diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
index 695bed5c..91ebec44 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -17,6 +17,7 @@ TI_TEST_BASE = "\
     evtest \
     fio \
     git \
+    hwspinlocktest \
     hdparm \
     i2c-tools \
     iozone3 \
diff --git a/meta-arago-test/recipes-kernel/hwspinlocktest/files/0001-Fix-Makefile-for-to-build-with-yocto.patch b/meta-arago-test/recipes-kernel/hwspinlocktest/files/0001-Fix-Makefile-for-to-build-with-yocto.patch
new file mode 100644
index 00000000..c1ca9ca8
--- /dev/null
+++ b/meta-arago-test/recipes-kernel/hwspinlocktest/files/0001-Fix-Makefile-for-to-build-with-yocto.patch
@@ -0,0 +1,47 @@
+From 0a085bff54c3f02c20412c5f5a4060c2acb20d4c Mon Sep 17 00:00:00 2001
+From: Judith Mendez <jm@ti.com>
+Date: Mon, 18 Nov 2024 10:26:55 -0600
+Subject: [PATCH 1/2] Fix Makefile for to build with yocto
+
+Fix Makefile that builds hwspinlocktest out-of-tree-module
+for yocto recipie to be able to build the module.
+
+Upstream-Status: Inactive-Upstream [private repo]
+Signed-off-by: Judith Mendez <jm@ti.com>
+---
+ Makefile | 18 ++++++++++--------
+ 1 file changed, 10 insertions(+), 8 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 23ee629..d8fe76d 100644
+--- a/Makefile
++++ b/Makefile
+@@ -3,15 +3,17 @@
+ # TI OMAP HwSpinlock Unit Test
+ #
+ 
+-obj-m = omap_hwspinlock_test.o
++obj-m := omap_hwspinlock_test.o
++
++SRC := $(shell pwd)
+ 
+ all:
+-ifeq ($(KERNELDIR),)
+-	@echo "Error: KERNELDIR not set, exiting..."
+-	@echo "Eg: make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- KERNELDIR=<linux-kernel rootdir>"
+-	@exit 1
+-endif
+-	make ${MAKE_OPTS} -C $(KERNELDIR) M=$(PWD) modules
++	$(MAKE) -C $(KERNEL_SRC) M=$(SRC)
++
++modules_install:
++	$(MAKE) -C $(KERNEL_SRC) M=$(SRC) modules_install
+ 
+ clean:
+-	$(RM) -r *.o *.ko *.mod* *.dwo .*.dwo .*.cmd *.symvers modules.order
++	rm -f *.o *~ core .depend .*.cmd *.ko *.mod.c
++	rm -f Module.markers Module.symvers modules.order
++	rm -rf .tmp_versions Modules.symvers
+-- 
+2.47.0
+
diff --git a/meta-arago-test/recipes-kernel/hwspinlocktest/files/0002-Add-support-for-AM62-SoCs.patch b/meta-arago-test/recipes-kernel/hwspinlocktest/files/0002-Add-support-for-AM62-SoCs.patch
new file mode 100644
index 00000000..bd4cc667
--- /dev/null
+++ b/meta-arago-test/recipes-kernel/hwspinlocktest/files/0002-Add-support-for-AM62-SoCs.patch
@@ -0,0 +1,32 @@
+From 5ea20dff1aba059cc49e11031f731a422f3fd114 Mon Sep 17 00:00:00 2001
+From: Judith Mendez <jm@ti.com>
+Date: Mon, 18 Nov 2024 14:57:45 -0600
+Subject: [PATCH 2/2] Add support for AM62* SoCs
+
+The K3 AM62* SoCs have a hwspinlock IP in MAIN domain.
+Extend the test to add the desired SoC compatible so that
+the test can be exercised on these new SoC families.
+
+Upstream-Status: Inactive-Upstream [private repo]
+Signed-off-by: Judith Mendez <jm@ti.com>
+---
+ omap_hwspinlock_test.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/omap_hwspinlock_test.c b/omap_hwspinlock_test.c
+index b180138..46fcc08 100644
+--- a/omap_hwspinlock_test.c
++++ b/omap_hwspinlock_test.c
+@@ -199,6 +199,9 @@ static const struct hwspinlock_data soc_data[] = {
+ 	{ "ti,j7200",	256, },
+ 	{ "ti,am642",	256, },
+ 	{ "ti,j721s2",	256, },
++	{ "ti,am625",	256, },
++	{ "ti,am62a7",	256, },
++	{ "ti,am62p5",	256, },
+ 	{ /* sentinel */ },
+ };
+ 
+-- 
+2.47.0
+
diff --git a/meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb b/meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb
new file mode 100644
index 00000000..888e3e00
--- /dev/null
+++ b/meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Build hwspinlock test as an external Linux kernel module"
+DESCRIPTION = "${SUMMARY}"
+LICENSE = "GPL-2.0-only | BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/git/LICENSE;md5=bfa02c83df161e37647ee23a2c7eacd4"
+
+inherit module
+
+SRC_URI = "git://github.com/sumananna/omap-hwspinlock-test;protocol=https;branch=master \
+		   file://0001-Fix-Makefile-for-to-build-with-yocto.patch \
+		   file://0002-Add-support-for-AM62-SoCs.patch "
+SRCREV = "20f15e79a3a0197e06328c252d23aec225de21ed"
+
+S = "${WORKDIR}/git"
+
+# The inherit of module.bbclass will automatically name module packages with
+# "kernel-module-" prefix as required by the oe-core build environment.
+
+RPROVIDES:${PN} += "kernel-module-hwspinlocktest"
-- 
2.47.0


