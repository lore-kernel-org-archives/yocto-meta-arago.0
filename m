Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8FAAC021B2
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 21:04:08 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.8096.1740085440551827922
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 20 Feb 2025 13:04:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=F5bt9/Od;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: a-christidis@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51KL40WG703881
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <meta-arago@lists.yoctoproject.org>; Thu, 20 Feb 2025 15:04:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740085440;
	bh=bQUuWPLntTGbR+WADP8t7Nwsa+WyIONTascvH1jQtlQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=F5bt9/Odgont/WnMzRRMPASaR6WMikLu6zq8AbF7UJ9kw2sEBPqgc1hawF/G5DHkS
	 9dWQyzTH+Xo5bT5g0nj3rJgOAQr8fXwv02heGtPNTyalPWuJsBaSHtUJqKjWi4ypB5
	 GZuYxFdP2L0pBXM9FZybBZ6JR4UHzY18SY11lAWo=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51KL3xRo105751
	for <meta-arago@lists.yoctoproject.org>; Thu, 20 Feb 2025 15:03:59 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Feb 2025 15:03:59 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Feb 2025 15:03:59 -0600
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51KL3xSR063386;
	Thu, 20 Feb 2025 15:03:59 -0600
From: <a-christidis@ti.com>
To: <reatmon@ti.com>, <c-shilwant@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH 3/3 v3] meta-arago-test: opencl_headers 2023.12.14 -> 2024.05.08
Date: Thu, 20 Feb 2025 15:03:59 -0600
Message-ID: <20250220210359.214628-4-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250220210359.214628-1-a-christidis@ti.com>
References: <20250220210359.214628-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 20 Feb 2025 21:04:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15879

From: Antonios Christidis <a-christidis@ti.com>

Version update for the opencl_headers. This version of the headers
is supported by the opencl-cts.

meta-openembedded rejected a backport of the headers recipe in master
to scarthgap due to their lts process. Where, new packages and major
package version changes are only allowed within the first 7 months
of a lts branch opening.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---

v3:
- Changed from adress, it was wrong.

v2:
- changed recipe structure in order to be yocto compliant 

 .../recipes-extended/opencl/opencl-headers_%.bbappend         | 4 ++++
 meta-arago-test/recipes-extended/opencl/opencl_headers-ti.inc | 1 +
 2 files changed, 5 insertions(+)
 create mode 100644 meta-arago-test/recipes-extended/opencl/opencl-headers_%.bbappend
 create mode 100644 meta-arago-test/recipes-extended/opencl/opencl_headers-ti.inc

diff --git a/meta-arago-test/recipes-extended/opencl/opencl-headers_%.bbappend b/meta-arago-test/recipes-extended/opencl/opencl-headers_%.bbappend
new file mode 100644
index 00000000..c890ecb7
--- /dev/null
+++ b/meta-arago-test/recipes-extended/opencl/opencl-headers_%.bbappend
@@ -0,0 +1,4 @@
+OPENCL_HEADERS_TI = ""
+OPENCL_HEADERS_TI:ti-soc = "opencl_headers-ti.inc"
+
+require ${OPENCL_HEADERS_TI}
diff --git a/meta-arago-test/recipes-extended/opencl/opencl_headers-ti.inc b/meta-arago-test/recipes-extended/opencl/opencl_headers-ti.inc
new file mode 100644
index 00000000..4dff02d9
--- /dev/null
+++ b/meta-arago-test/recipes-extended/opencl/opencl_headers-ti.inc
@@ -0,0 +1 @@
+SRCREV = "8275634cf9ec31b6484c2e6be756237cb583999d"
-- 
2.34.1


