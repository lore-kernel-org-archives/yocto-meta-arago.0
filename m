Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5D17C369DC
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 14:44:02 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.452.1746110641271802014
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 01 May 2025 07:44:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=SH07r/0C;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 541EhxHk022910
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 May 2025 09:44:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746110640;
	bh=9jPwFLQH+w6+Ttp6GJsxQPVXjwVCOM9C78SoHyOhKLM=;
	h=From:To:CC:Subject:Date;
	b=SH07r/0CvUWH5HEnOYhp3EVcZjXGjnzn8qdGfQlu1ew60l1mXYgbWGtzxUcohCgYR
	 2jOnafH5y0OfCSWpNRasL7lws7d86ew7NOg9vZAtKkaPQcN7jaAfiddk1bx39Os/kK
	 FDzOwgU46CWZ9LwZsnuiw4d6aqit/bNrCeuK/Us0=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 541Ehxgh056726
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 May 2025 09:43:59 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 1
 May 2025 09:43:59 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 1 May 2025 09:43:59 -0500
Received: from lelvsmtp5.itg.ti.com ([10.250.35.60])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 541Ehxqk100547;
	Thu, 1 May 2025 09:43:59 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH] meta-arago-test: Add optee-test, strongswan, and libgpiod-tools to image
Date: Thu, 1 May 2025 09:43:57 -0500
Message-ID: <20250501144357.355212-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 01 May 2025 14:44:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16172

These packages are used by ltp-ddt and the test framework. These are
added to the default Arago images, but when doing upstream testing with
Poky these packages are missing. Add these to the base testing layer.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-arago-test/recipes-core/packagegroups/ti-test.bb        | 2 ++
 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb | 1 +
 2 files changed, 3 insertions(+)

diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
index c8eaf266..e387b978 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -41,6 +41,7 @@ TI_TEST_BASE = "\
     nbench-byte \
     netperf \
     openntpd \
+    optee-test \
     pcitest \
     perf \
     powertop \
@@ -53,6 +54,7 @@ TI_TEST_BASE = "\
     stream \
     stress \
     stress-ng \
+    strongswan \
     tcpdump \
     v4l-utils \
     yavta \
diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250130.bb
index 1950ffe9..2c65e851 100644
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


