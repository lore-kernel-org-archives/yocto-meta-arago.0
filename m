Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 511F4C282DE
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 00:41:04 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.3542.1741653658573333381
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 10 Mar 2025 17:40:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=kiwroWtJ;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52B0euBx621705
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Mar 2025 19:40:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741653656;
	bh=JrLazILkZq7I6BRsPJGb9AWJLrCCK2YfOzuc4v5gVN4=;
	h=From:To:CC:Subject:Date;
	b=kiwroWtJMNcdLg2GNL60uv4kZ7byIFcVTkldFZ7GZx2ye3jGDjPXIncRqHZLECw5y
	 BdX42xrhrHIrzh06nQSHgQKr8W51cvsuTuS4k9yN8FqxZ9XsdOT8my2YWq4y9y1bsM
	 DTAelPOA5g+dNhkz93i10fQ3KM40uJ7gtymz0toI=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52B0euOb031444
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 10 Mar 2025 19:40:56 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 10
 Mar 2025 19:40:55 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 10 Mar 2025 19:40:55 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52B0etbX089538;
	Mon, 10 Mar 2025 19:40:55 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH] meta-arago-distro: add clpeak 1.1.4
Date: Mon, 10 Mar 2025 19:40:45 -0500
Message-ID: <20250311004044.3187610-2-rs@ti.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 11 Mar 2025 00:41:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15965

From: Randolph Sapp <rs@ti.com>

Add a recipe for clpeak 1.1.4. This has already been merged into
meta-openembedded master as of 3ff6af672037b8d0a1137406cce790edba109b7a.
We just need to carry it for the scarthgap release as a backport has not
been approved.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../recipes-graphics/opencl/clpeak_1.1.4.bb       | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-arago-distro/recipes-graphics/opencl/clpeak_1.1.4.bb

diff --git a/meta-arago-distro/recipes-graphics/opencl/clpeak_1.1.4.bb b/meta-arago-distro/recipes-graphics/opencl/clpeak_1.1.4.bb
new file mode 100644
index 00000000..8c05ad6d
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/opencl/clpeak_1.1.4.bb
@@ -0,0 +1,15 @@
+SUMMARY  = "OpenCL synthetic benchmarking tool"
+DESCRIPTION = "OpenCL benchmarking tool to measure peak capabilities"
+
+SRC_URI = "git://github.com/krrishnarraj/clpeak.git;protocol=https;branch=master"
+
+LICENSE  = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
+
+SRCREV = "527695de8393a3144863a0a07f9b92f1c734d1c4"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+DEPENDS += "opencl-clhpp virtual/opencl-icd"
-- 
2.48.1


