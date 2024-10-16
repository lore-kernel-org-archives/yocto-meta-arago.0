Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8D7DD2F7D7
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 22:58:40 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.36520.1729119511922494970
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 16 Oct 2024 15:58:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=B94az+G6;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: jm@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49GMwUpC047227;
	Wed, 16 Oct 2024 17:58:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729119510;
	bh=lYciV0wK0Bh7HNzX3RPzq0/j2fAwISTayUF2A5W+QmA=;
	h=From:To:CC:Subject:Date;
	b=B94az+G62Np0Fccr5OEnsMNDug09n3070oa7FkRj8ajeVpepTDu55ny1eNW3LEngZ
	 TB+YXLQYqEABB9uZnPGL707wA9cY7gA2eTCQscH3gXpHofGavoBIN08AFv3+O1Y+t5
	 63bv/fjxOoeLz6O+SW58W/aLVavB3iD6EPor1ASQ=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49GMwU4E023723
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 16 Oct 2024 17:58:30 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 16
 Oct 2024 17:58:30 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 16 Oct 2024 17:58:30 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49GMwUXD036592;
	Wed, 16 Oct 2024 17:58:30 -0500
From: Judith Mendez <jm@ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>,
        Denys Dmytriyenko
	<denys@konsulko.com>, Randolph Sapp <rs@ti.com>,
        Praneeth Bajjuri
	<praneeth@ti.com>, Judith Mendez <jm@ti.com>
Subject: [meta-ti][kirkstone/scarthgap][RFC PATCH] ti-test: Add hwspinlocktest
Date: Wed, 16 Oct 2024 17:58:29 -0500
Message-ID: <20241016225830.3178108-1-jm@ti.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 16 Oct 2024 22:58:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15577

Add hwspinlock recipe to build out of tree module hwspinlock test.

Signed-off-by: Judith Mendez <jm@ti.com>
---
 .../recipes-core/packagegroups/ti-test.bb     |   1 +
 .../hwspinlocktest/files/LICENSE              |  29 ++
 .../hwspinlocktest/files/Makefile             |  19 ++
 .../files/omap_hwspinlock_test.c              | 251 ++++++++++++++++++
 .../hwspinlocktest/hwspinlocktest_0.1.bb      |  18 ++
 5 files changed, 318 insertions(+)
 create mode 100644 meta-arago-test/recipes-kernel/hwspinlocktest/files/LICENSE
 create mode 100644 meta-arago-test/recipes-kernel/hwspinlocktest/files/Makefile
 create mode 100644 meta-arago-test/recipes-kernel/hwspinlocktest/files/omap_hwspinlock_test.c
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
diff --git a/meta-arago-test/recipes-kernel/hwspinlocktest/files/LICENSE b/meta-arago-test/recipes-kernel/hwspinlocktest/files/LICENSE
new file mode 100644
index 00000000..f5351a25
--- /dev/null
+++ b/meta-arago-test/recipes-kernel/hwspinlocktest/files/LICENSE
@@ -0,0 +1,29 @@
+BSD 3-Clause License
+
+Copyright (c) 2019, Suman Anna
+All rights reserved.
+
+Redistribution and use in source and binary forms, with or without
+modification, are permitted provided that the following conditions are met:
+
+1. Redistributions of source code must retain the above copyright notice, this
+   list of conditions and the following disclaimer.
+
+2. Redistributions in binary form must reproduce the above copyright notice,
+   this list of conditions and the following disclaimer in the documentation
+   and/or other materials provided with the distribution.
+
+3. Neither the name of the copyright holder nor the names of its
+   contributors may be used to endorse or promote products derived from
+   this software without specific prior written permission.
+
+THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
+DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
+FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
+DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
+SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
+CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
+OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
diff --git a/meta-arago-test/recipes-kernel/hwspinlocktest/files/Makefile b/meta-arago-test/recipes-kernel/hwspinlocktest/files/Makefile
new file mode 100644
index 00000000..d8fe76dc
--- /dev/null
+++ b/meta-arago-test/recipes-kernel/hwspinlocktest/files/Makefile
@@ -0,0 +1,19 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+#
+# TI OMAP HwSpinlock Unit Test
+#
+
+obj-m := omap_hwspinlock_test.o
+
+SRC := $(shell pwd)
+
+all:
+	$(MAKE) -C $(KERNEL_SRC) M=$(SRC)
+
+modules_install:
+	$(MAKE) -C $(KERNEL_SRC) M=$(SRC) modules_install
+
+clean:
+	rm -f *.o *~ core .depend .*.cmd *.ko *.mod.c
+	rm -f Module.markers Module.symvers modules.order
+	rm -rf .tmp_versions Modules.symvers
diff --git a/meta-arago-test/recipes-kernel/hwspinlocktest/files/omap_hwspinlock_test.c b/meta-arago-test/recipes-kernel/hwspinlocktest/files/omap_hwspinlock_test.c
new file mode 100644
index 00000000..b1801389
--- /dev/null
+++ b/meta-arago-test/recipes-kernel/hwspinlocktest/files/omap_hwspinlock_test.c
@@ -0,0 +1,251 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * OMAP hardware spinlock test driver
+ *
+ * Copyright (C) 2014-2021 Texas Instruments Incorporated - https://www.ti.com
+ *	Suman Anna <s-anna@ti.com>
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/err.h>
+#include <linux/sched.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+
+#include <linux/hwspinlock.h>
+
+/* load-time options */
+static int count = 2;
+module_param(count, int, 0444);
+
+struct hwspinlock_data {
+	const char *compatible;
+	const unsigned int max_locks;
+};
+
+static int hwspin_lock_test(struct hwspinlock *hwlock)
+{
+	int i;
+	int ret;
+
+	pr_err("\nTesting lock %d\n", hwspin_lock_get_id(hwlock));
+	for (i = 0; i < count; i++) {
+		ret = hwspin_trylock(hwlock);
+		if (ret) {
+			pr_err("%s: Initial lock failed\n", __func__);
+			return -EFAULT;
+		}
+		pr_err("trylock #1 status[%d] = %d\n", i, ret);
+
+		/* Verify lock actually works - re-acquiring it should fail */
+		ret = hwspin_trylock(hwlock);
+		pr_err("trylock #2 status[%d] = %d\n", i, ret);
+		if (!ret) {
+			/* Keep locks balanced even in failure cases */
+			hwspin_unlock(hwlock);
+			hwspin_unlock(hwlock);
+			pr_err("%s: Recursive lock succeeded unexpectedly\n",
+			       __func__);
+			return -EFAULT;
+		}
+
+		/* Verify unlock by re-acquiring the lock after releasing it */
+		hwspin_unlock(hwlock);
+		ret = hwspin_trylock(hwlock);
+		pr_err("trylock after unlock status[%d] = %d\n", i, ret);
+		if (ret) {
+			pr_err("%s: Unlock failed\n", __func__);
+			return -EINVAL;
+		}
+
+		hwspin_unlock(hwlock);
+	}
+
+	return 0;
+}
+
+static int hwspin_lock_test_all_locks(unsigned int max_locks)
+{
+	int i;
+	int ret = 0, ret1 = 0;
+	struct hwspinlock *hwlock = NULL;
+
+	pr_err("Testing %d locks\n", max_locks);
+	for (i = 0; i < max_locks; i++) {
+		hwlock = hwspin_lock_request_specific(i);
+		if (!hwlock) {
+			pr_err("request lock %d failed\n", i);
+			ret = -EIO;
+			continue;
+		}
+
+		ret1 = hwspin_lock_test(hwlock);
+		if (ret1) {
+			pr_err("hwspinlock tests failed on lock %d\n", i);
+			ret = ret1;
+			goto free_lock;
+		}
+
+free_lock:
+		ret1 = hwspin_lock_free(hwlock);
+		if (ret1) {
+			pr_err("hwspin_lock_free failed on lock %d\n", i);
+			ret = ret1;
+		}
+	}
+
+	return ret;
+}
+
+static const struct of_device_id omap_hwspinlock_test_of_match[] = {
+	{ .compatible = "ti,omap-hwspinlock-test",   },
+	{ .compatible = "ti,omap4-hwspinlock-test",  },
+	{ .compatible = "ti,omap5-hwspinlock-test",  },
+	{ .compatible = "ti,dra7-hwspinlock-test",   },
+	{ .compatible = "ti,am33xx-hwspinlock-test", },
+	{ .compatible = "ti,am43xx-hwspinlock-test", },
+	{ .compatible = "ti,am654-hwspinlock-test",  },
+	{ /* end */ },
+};
+
+static int hwspin_lock_test_all_phandle_locks(unsigned int max_locks)
+{
+	struct device_node *np = NULL;
+	struct hwspinlock *hwlock = NULL;
+	int ret = 0, ret1 = 0;
+	unsigned int i;
+	int num_locks;
+	int hwlock_id;
+
+	np = of_find_matching_node_and_match(NULL,
+					     omap_hwspinlock_test_of_match,
+					     NULL);
+	if (!np) {
+		pr_err("\nNo test node provided\n");
+		return 0;
+	}
+
+	num_locks = of_count_phandle_with_args(np, "hwlocks", "#hwlock-cells");
+	pr_err("Number of phandles = %d max_locks = %d\n",
+	       num_locks, max_locks);
+
+	for (i = 0; i < num_locks; i++) {
+		hwlock_id = of_hwspin_lock_get_id(np, i);
+		if (hwlock_id < 0) {
+			pr_err("unable to get hwlock_id : %d\n", hwlock_id);
+			ret = -EINVAL;
+			continue;
+		};
+
+		hwlock = hwspin_lock_request_specific(hwlock_id);
+		if (!hwlock) {
+			pr_err("unable to get hwlock\n");
+			ret = -EINVAL;
+			continue;
+		}
+
+		ret1 = hwspin_lock_test(hwlock);
+		if (ret1) {
+			pr_err("hwspinlock test failed on DT lock %d, ret = %d\n",
+			       hwspin_lock_get_id(hwlock), ret1);
+			ret = ret1;
+		}
+
+		ret1 = hwspin_lock_free(hwlock);
+		if (ret1) {
+			pr_err("hwspin_lock_free failed on lock %d\n",
+			       hwspin_lock_get_id(hwlock));
+			ret = ret1;
+		}
+	}
+
+	return ret;
+}
+
+static
+unsigned int omap_hwspinlock_get_locks(const struct hwspinlock_data *data)
+{
+	unsigned int locks = 0;
+
+	while (data->compatible) {
+		if (of_machine_is_compatible(data->compatible)) {
+			locks = data->max_locks;
+			break;
+		}
+		data++;
+	}
+
+	return locks;
+}
+
+static const struct of_device_id omap_hwspinlock_of_match[] = {
+	{ .compatible = "ti,omap4-hwspinlock", },
+	{ .compatible = "ti,am654-hwspinlock", },
+	{ .compatible = "ti,am64-hwspinlock",  },
+	{ /* end */ },
+};
+
+static const struct hwspinlock_data soc_data[] = {
+	{ "ti,omap4",	32, },
+	{ "ti,omap5",	32, },
+	{ "ti,dra7",	256, },
+	{ "ti,am33xx",	128, },
+	{ "ti,am43",	128, },
+	{ "ti,am654",	256, },
+	{ "ti,j721e",	256, },
+	{ "ti,j7200",	256, },
+	{ "ti,am642",	256, },
+	{ "ti,j721s2",	256, },
+	{ /* sentinel */ },
+};
+
+static int omap_hwspinlock_test_init(void)
+{
+	struct device_node *np;
+	unsigned int max_locks;
+	int ret;
+
+	pr_err("\n** HwSpinLock Unit Test Module initiated **\n");
+
+	max_locks = omap_hwspinlock_get_locks(soc_data);
+	if (!max_locks) {
+		pr_err("\nNot a compatible platform\n");
+		return -ENODEV;
+	}
+
+	np = of_find_matching_node_and_match(NULL, omap_hwspinlock_of_match,
+					     NULL);
+	if (!np || !of_device_is_available(np)) {
+		pr_err("\nNo HwSpinlock node provided/enabled\n");
+		return -ENODEV;
+	}
+
+	pr_err("\n***** Begin - Test All Locks ****\n");
+	ret = hwspin_lock_test_all_locks(max_locks);
+	if (ret)
+		pr_err("hwspin_lock_test_all_locks failed, ret = %d\n", ret);
+	pr_err("\n***** End - Test All Locks ****\n");
+
+	pr_err("\n***** Begin - Test All pHandle Locks ****\n");
+	ret = hwspin_lock_test_all_phandle_locks(max_locks);
+	if (ret)
+		pr_err("hwspin_lock_test_all_locks failed, ret = %d\n", ret);
+	pr_err("\n***** End - Test All pHandle Locks ****\n");
+
+	return 0;
+}
+
+static void omap_hwspinlock_test_exit(void)
+{
+	pr_err("\n** HwSpinLock Unit Test Module finished **\n");
+}
+
+module_init(omap_hwspinlock_test_init);
+module_exit(omap_hwspinlock_test_exit);
+
+MODULE_LICENSE("Dual BSD/GPL");
+MODULE_DESCRIPTION("Hardware spinlock Test driver for TI SoCs");
+MODULE_AUTHOR("Suman Anna <s-anna@ti.com>");
diff --git a/meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb b/meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb
new file mode 100644
index 00000000..2edd93f6
--- /dev/null
+++ b/meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Build hwspinlock test as an external Linux kernel module"
+DESCRIPTION = "${SUMMARY}"
+LICENSE = "GPL-2.0-only | BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=bfa02c83df161e37647ee23a2c7eacd4"
+
+inherit module
+
+SRC_URI = "file://Makefile \
+           file://omap_hwspinlock_test.c \
+           file://LICENSE \
+          "
+
+S = "${WORKDIR}"
+
+# The inherit of module.bbclass will automatically name module packages with
+# "kernel-module-" prefix as required by the oe-core build environment.
+
+RPROVIDES:${PN} += "kernel-module-hwspinlocktest"
-- 
2.47.0


