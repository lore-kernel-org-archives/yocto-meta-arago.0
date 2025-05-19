Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9B62C3ABDD
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 17:01:14 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.431.1747674073857777786
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 19 May 2025 10:01:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Y1yqX84U;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54JH1BIk517798
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 May 2025 12:01:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747674071;
	bh=B8NP94u/XzFYnCASXx0Tt6fVp0WyZaMlJdWDFiD27Jc=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Y1yqX84Um8CPw0weuXHumMxFE+v4hy5nt0fiS30wQknCmTV+iWRb6YdOxSXzPbqDr
	 BP75GtWBWE3GEQHl0bfSzY+asAVjVOveTUARlYqKXoVVtpzSzDCO8hbkSLiCc18Bun
	 tl7V0UDWmC1LfpMLewNOOicNubYMvnUx5qGSy6N0=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54JH1BqL015608
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 May 2025 12:01:11 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 19
 May 2025 12:01:11 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 19 May 2025 12:01:11 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54JH1BgF111306;
	Mon, 19 May 2025 12:01:11 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uH3rT-0005sS-4d; Mon, 19 May 2025 12:01:11 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH 7/8] kernel-selftest: Wrap the bbappend in a compliant manner
Date: Mon, 19 May 2025 12:01:09 -0500
Message-ID: <20250519170110.22506-8-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250519170110.22506-1-reatmon@ti.com>
References: <20250519170110.22506-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 19 May 2025 17:01:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16227

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


