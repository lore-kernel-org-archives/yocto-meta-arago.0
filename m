Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F94DC87FCB
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 18:19:49 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.88365.1753726784416259684
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 28 Jul 2025 11:19:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=DLAuN9de;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: afd@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56SIJhWT2362193;
	Mon, 28 Jul 2025 13:19:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753726783;
	bh=IHrbEcDC/rwBlhfxYJbnv2Yy2bI2lHLX/o20/cGMH9M=;
	h=From:To:CC:Subject:Date;
	b=DLAuN9deaZGUDcWdtU4H/o5nnkYHKcvWGUynwWI81R1fXF7hbrX7YEnQRcV3a+s1H
	 8yeTg7GcELPSB8imqpt2uFU4ItFqCYHOeCxXOcFl7iAnqVvTUoUc+Z2YTLVeZMQ/S1
	 oEW6t8iwW+apqBMh5JdGYv0kEmJYSkabmuHcIzaY=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56SIJhVv1238637
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 28 Jul 2025 13:19:43 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 28
 Jul 2025 13:19:42 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 28 Jul 2025 13:19:42 -0500
Received: from ula0226330.lan ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56SIJgOG2180972;
	Mon, 28 Jul 2025 13:19:42 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH v2 1/2] meta-arago-test: Add optee-test, strongswan, and libgpiod-tools to image
Date: Mon, 28 Jul 2025 13:19:41 -0500
Message-ID: <20250728181942.579152-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 28 Jul 2025 18:19:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16331

These packages are used by ltp-ddt and the test framework. These are
added to the default Arago images, but when doing upstream testing with
Poky these packages are missing. Add these to the base testing layer.

Signed-off-by: Andrew Davis <afd@ti.com>
---

Changes for v2:
 - Add conditional on OPTEEMACHINE

 meta-arago-test/recipes-core/packagegroups/ti-test.bb        | 2 ++
 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb | 1 +
 2 files changed, 3 insertions(+)

diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
index fb4c3e4c..a44dd8d7 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -42,6 +42,7 @@ TI_TEST_BASE = "\
     nbench-byte \
     netperf \
     openntpd \
+    ${@"optee-test" if d.getVar('OPTEEMACHINE') else ""} \
     pcitest \
     perf \
     powertop \
@@ -54,6 +55,7 @@ TI_TEST_BASE = "\
     stream \
     stress \
     stress-ng \
+    strongswan \
     tcpdump \
     v4l-utils \
     xdp-tools-arago \
diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
index a5468d4c..4f8767ca 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
@@ -33,6 +33,7 @@ RDEPENDS:${PN} += "\
     pm-qa \
     serialcheck \
     memtester \
+    libgpiod-tools \
 "
 
 do_install:prepend() {
-- 
2.39.2


