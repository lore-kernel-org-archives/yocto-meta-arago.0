Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EB7FCA0FED
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 23:38:56 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.2269.1757115531192308592
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 05 Sep 2025 16:38:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=v1icrg5F;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: a-christidis@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 585Nco3n3855634
	for <meta-arago@lists.yoctoproject.org>; Fri, 5 Sep 2025 18:38:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757115530;
	bh=Dra66EARzH7BFh2UTPGvd1h6bHLGHPrSB+0rtO3iQvg=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=v1icrg5FCYwY10u18g3Po5BcjHNCmufPL7CbUvfJ9U8JF11BfWL73WoP/oPDBXGQ6
	 56V0iyZqJdJoScb0gjAHKYCOX+LtpAO1bhCTOnz3sb23v9EiLcq7nApdejXEgwh2+x
	 CzDZY4xGMFC9MnltnI1mkd3m6WAajumFUEF50k3o=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 585NcoPV1982137
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Fri, 5 Sep 2025 18:38:50 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 5
 Sep 2025 18:38:50 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 5 Sep 2025 18:38:50 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 585Nco9Y1174327;
	Fri, 5 Sep 2025 18:38:50 -0500
From: <a-christidis@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
Subject: [meta-arago][master][PATCH v2 3/3] meta-arago-test: recipes-extended: opencl-clhpp v2.0.16 -> v2024.05.08
Date: Fri, 5 Sep 2025 18:38:49 -0500
Message-ID: <20250905233849.2506703-4-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250905233849.2506703-1-a-christidis@ti.com>
References: <20250905233849.2506703-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 05 Sep 2025 23:38:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16536

From: Antonios Christidis <a-christidis@ti.com>

Increase the version of the opencl c++ headers to v2024.05.08. This way
both c and c++ headers will be the same version.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---

v2:
- Implemented the changes in a yocto compliant way, not by creating a new recipe outright

 .../recipes-extended/opencl/opencl-clhpp_%.bbappend        | 4 ++++
 .../recipes-extended/opencl/opencl_clhpp-ti.inc            | 7 +++++++
 2 files changed, 11 insertions(+)
 create mode 100644 meta-arago-test/recipes-extended/opencl/opencl-clhpp_%.bbappend
 create mode 100644 meta-arago-test/recipes-extended/opencl/opencl_clhpp-ti.inc

diff --git a/meta-arago-test/recipes-extended/opencl/opencl-clhpp_%.bbappend b/meta-arago-test/recipes-extended/opencl/opencl-clhpp_%.bbappend
new file mode 100644
index 00000000..6e486f4c
--- /dev/null
+++ b/meta-arago-test/recipes-extended/opencl/opencl-clhpp_%.bbappend
@@ -0,0 +1,4 @@
+OPENCL_HEADERS_TI = ""
+OPENCL_HEADERS_TI:ti-soc = "opencl_clhpp-ti.inc"
+
+require ${OPENCL_HEADERS_TI}
diff --git a/meta-arago-test/recipes-extended/opencl/opencl_clhpp-ti.inc b/meta-arago-test/recipes-extended/opencl/opencl_clhpp-ti.inc
new file mode 100644
index 00000000..ed43170c
--- /dev/null
+++ b/meta-arago-test/recipes-extended/opencl/opencl_clhpp-ti.inc
@@ -0,0 +1,7 @@
+SRCREV  = "0bdbbfe5ecda42cff50c96cc5e33527f42fcbd45"
+PV = "2024.05.08"
+
+DEPENDS = "opencl-headers"
+
+EXTRA_OECMAKE:append = " -DOPENCL_CLHPP_BUILD_TESTING=OFF \
+			 -DBUILD_TESTING=OFF"
-- 
2.34.1


