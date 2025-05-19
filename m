Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7CD1C5479B
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 17:01:04 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.416.1747674059600735011
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 19 May 2025 10:00:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=pBI0c2gK;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54JH0vCP517743;
	Mon, 19 May 2025 12:00:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747674057;
	bh=B8NP94u/XzFYnCASXx0Tt6fVp0WyZaMlJdWDFiD27Jc=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=pBI0c2gKEmVEE1DthEZpy4cs5pwSZ175Squ9ZCwdP76IkFpuZO4xEEPAX+PF4YAci
	 BU2a08+KALwGO+nEOopKMWjNsGXesEOXgOA2blg9KbOJ+rrdMX6XgwEs1vQlt2tZ2O
	 WY+UsK9VJX2L6llZLyIr9HHQ6bOuovI6NZgbGqeE=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54JH0vIf3789326
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 19 May 2025 12:00:57 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 19
 May 2025 12:00:57 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 19 May 2025 12:00:57 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54JH0vvD110989;
	Mon, 19 May 2025 12:00:57 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uH3rF-0005qJ-1J; Mon, 19 May 2025 12:00:57 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 8/9] kernel-selftest: Wrap the bbappend in a compliant manner
Date: Mon, 19 May 2025 12:00:54 -0500
Message-ID: <20250519170055.22364-9-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250519170055.22364-1-reatmon@ti.com>
References: <20250519170055.22364-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 19 May 2025 17:01:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16217

Wrap the bbappend in a yocto-check-layer compliant manner so that only
if you are building this recipe under meta-ti-bsp with ti-soc in the
MACHINE_OVERRIDES would the bbappend apply.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...lftest.bbappend => kernel-selftest-ti.inc} |  0
 .../kernel-selftest/kernel-selftest.bbappend  | 49 ++-----------------
 2 files changed, 3 insertions(+), 46 deletions(-)
 copy meta-arago-test/recipes-kernel/kernel-selftest/{kernel-selftest.bbappend => kernel-selftest-ti.inc} (100%)

diff --git a/meta-arago-test/recipes-kernel/kernel-selftest/kernel-selftest.bbappend b/meta-arago-test/recipes-kernel/kernel-selftest/kernel-selftest-ti.inc
similarity index 100%
copy from meta-arago-test/recipes-kernel/kernel-selftest/kernel-selftest.bbappend
copy to meta-arago-test/recipes-kernel/kernel-selftest/kernel-selftest-ti.inc
diff --git a/meta-arago-test/recipes-kernel/kernel-selftest/kernel-selftest.bbappend b/meta-arago-test/recipes-kernel/kernel-selftest/kernel-selftest.bbappend
index a793196d..163a074d 100644
--- a/meta-arago-test/recipes-kernel/kernel-selftest/kernel-selftest.bbappend
+++ b/meta-arago-test/recipes-kernel/kernel-selftest/kernel-selftest.bbappend
@@ -1,47 +1,4 @@
-# Tests not enabled:
-#   openat2 has buildpath errors
+KERNEL_SELFTEST_TI = ""
+KERNEL_SELFTEST_TI:ti-soc = "kernel-selftest-ti.inc"
 
-TEST_LIST += "\
-    arm64 \
-    breakpoints \
-    capabilities \
-    cgroup \
-    clone3 \
-    core \
-    cpu-hotplug \
-    cpufreq \
-    efivarfs \
-    exec \
-    filesystems \
-    filesystems/binderfs \
-    filesystems/epoll \
-    firmware \
-    fpu \
-    ftrace \
-    futex \
-    gpio \
-    intel_pstate \
-    ipc \
-    kcmp \
-    kvm \
-    livepatch \
-    membarrier \
-    memfd \
-    mqueue \
-    mincore \
-    net \
-    net/mptcp \
-    ptrace \
-    resq \
-    rtc \
-    seccomp \
-    sigaltstack \
-    size \
-    tc-testing \
-    timers \
-    tmpfs \
-    tpm2 \
-    user_events \
-    vDSO \
-    watchdog \
-"
+require ${KERNEL_SELFTEST_TI}
-- 
2.17.1


