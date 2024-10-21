Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92E96D15DB9
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 16:28:19 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.51062.1729528094250091961
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 21 Oct 2024 09:28:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=UWvUazNl;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49LGSCLh067444;
	Mon, 21 Oct 2024 11:28:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729528092;
	bh=QX1/T0k3sIGqpKbw8sE17khFhTInk8iyLsTIMvO4avQ=;
	h=From:To:Subject:Date;
	b=UWvUazNlPCI0mejvC3zMw8LdUs35fYaS99idiSlx0Trp2IgM6Pv9+IQGueg4+hMBh
	 X4r3C/5IJ03+g30MpkvDvgRhvcoTS/Rh8REIpeCh6l9gbSuf/i17rb8pWx2sfrmEGp
	 DEr8jS7QyniZ/YMZKQ/7mojX8GHmj0Ydxwq7Vlqo=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49LGSC3V125959;
	Mon, 21 Oct 2024 11:28:12 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Oct 2024 11:28:12 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Oct 2024 11:28:12 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49LGSCQX005555;
	Mon, 21 Oct 2024 11:28:12 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1t2vGO-0007KJ-4l; Mon, 21 Oct 2024 11:28:12 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/scarthgap][PATCH v2] kernel-selftest: Enable more tests
Date: Mon, 21 Oct 2024 11:28:12 -0500
Message-ID: <20241021162812.28123-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 21 Oct 2024 16:28:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15580

Our testing flow is looking to incorporate the kernel-selftests as a
test.  Enable a large number of selected cases.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Tweak the desired list after initial testing.  Remove mention of
    required upstream patches now that they are accepted.

 .../kernel-selftest/kernel-selftest.bbappend  | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 meta-arago-test/recipes-kernel/kernel-selftest/kernel-selftest.bbappend

diff --git a/meta-arago-test/recipes-kernel/kernel-selftest/kernel-selftest.bbappend b/meta-arago-test/recipes-kernel/kernel-selftest/kernel-selftest.bbappend
new file mode 100644
index 00000000..a793196d
--- /dev/null
+++ b/meta-arago-test/recipes-kernel/kernel-selftest/kernel-selftest.bbappend
@@ -0,0 +1,47 @@
+# Tests not enabled:
+#   openat2 has buildpath errors
+
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


