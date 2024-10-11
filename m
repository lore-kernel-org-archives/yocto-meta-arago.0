Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C4F1D0EE20
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 18:27:22 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.19190.1728671234559347101
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 11 Oct 2024 11:27:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=nBD+tLIY;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49BIRDUV130522;
	Fri, 11 Oct 2024 13:27:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1728671233;
	bh=NiUZ4rHcaqHfuJNWsxBPvSENltfNqBYuLMNC+ErEdsI=;
	h=From:To:Subject:Date;
	b=nBD+tLIY9b7ZiCwL958MnxoMowwGGdZ74AGZFKkdVghvipTLSGALFCUoUxxKJXcFC
	 5Zyo3sxVpMtf9VCcii5XfrjeoOfrJG6cG639I0+Z8IfJLzY5UMSJGkicXM5Jnp+rrM
	 ycKmsilifyQdny/f52aq/ME5LrFz//6f9weZHH3g=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49BIRDH9099567
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Oct 2024 13:27:13 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Oct 2024 13:27:13 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Oct 2024 13:27:13 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49BIRD8Q086550;
	Fri, 11 Oct 2024 13:27:13 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1szKM5-0003t5-1n; Fri, 11 Oct 2024 13:27:13 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/scarthgap][PATCH] kernel-selftest: Enable more tests
Date: Fri, 11 Oct 2024 13:27:13 -0500
Message-ID: <20241011182713.14904-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 11 Oct 2024 18:27:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15567

Our testing flow is looking to incorporate the kernel-selftests as a
test.  Enable a large number of selected cases.

This patch requires a set of corrseponding patches on meta-openembeded
in upstream:

[master] https://lists.openembedded.org/g/openembedded-devel/message/112802
[scarthgap] https://lists.openembedded.org/g/openembedded-devel/message/112803

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../kernel-selftest/kernel-selftest.bbappend  | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 meta-arago-test/recipes-kernel/kernel-selftest/kernel-selftest.bbappend

diff --git a/meta-arago-test/recipes-kernel/kernel-selftest/kernel-selftest.bbappend b/meta-arago-test/recipes-kernel/kernel-selftest/kernel-selftest.bbappend
new file mode 100644
index 00000000..68b4b668
--- /dev/null
+++ b/meta-arago-test/recipes-kernel/kernel-selftest/kernel-selftest.bbappend
@@ -0,0 +1,45 @@
+TEST_LIST += "\
+    arm64 \
+    breakpoints \
+    capabilities \
+    cgroup \
+    clone3 \
+    core \
+    cpu-hotplug \
+    cpufreq \
+    efivarfs \
+    exec \
+    filesystems \
+    filesystems/binderfs \
+    filesystems/epoll \
+    firmware \
+    fpu \
+    ftrace \
+    futex \
+    gpio \
+    intel_pstate \
+    ipc \
+    kcmp \
+    kvm \
+    livepatch \
+    membarrier \
+    memfd \
+    mqueue \
+    mincore \
+    net \
+    net/mptcp \
+    openat2 \
+    ptrace \
+    resq \
+    rtc \
+    seccomp \
+    sigaltstack \
+    size \
+    tc-testing \
+    timers \
+    tmpfs \
+    tpm2 \
+    user_events \
+    vDSO \
+    watchdog \
+"
-- 
2.17.1


