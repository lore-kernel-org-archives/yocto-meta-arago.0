Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01F25C021B6
	for <webhook@archiver.kernel.org>; Fri, 21 Feb 2025 20:41:57 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.33411.1740170514716728364
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 21 Feb 2025 12:41:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=yfEwsXim;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: a-christidis@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51LKfsNu388540
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-arago@lists.yoctoproject.org>; Fri, 21 Feb 2025 14:41:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740170514;
	bh=bQUuWPLntTGbR+WADP8t7Nwsa+WyIONTascvH1jQtlQ=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=yfEwsXimhGxIcNRvgKP7UY0gek4GK6Gel9pkCZziP2eDs7OvM8uZGUfy1oRogRUdJ
	 vBOBHgW4PQDN9jrgnS/bqp1epz/4ccBHL4s+wRjNkekJDJmxgaDI6Q/YB1TKvN3IOK
	 kbaAVkd0sg67snTvtPjryvPlURgcJ27c0DUrfSyU=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51LKfsIN077114
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Fri, 21 Feb 2025 14:41:54 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 21
 Feb 2025 14:41:53 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 21 Feb 2025 14:41:53 -0600
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51LKfrlY038613;
	Fri, 21 Feb 2025 14:41:53 -0600
From: <a-christidis@ti.com>
To: <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH v4 2/2] meta-arago-test: opencl_headers 2023.12.14 -> 2024.05.08
Date: Fri, 21 Feb 2025 14:41:53 -0600
Message-ID: <20250221204153.428129-3-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221204153.428129-1-a-christidis@ti.com>
References: <20250221204153.428129-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 21 Feb 2025 20:41:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15890

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


