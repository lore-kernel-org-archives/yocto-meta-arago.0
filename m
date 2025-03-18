Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A56FC28B28
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 15:12:42 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.386.1742310758014062783
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 18 Mar 2025 08:12:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=IDhIu51d;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: a-christidis@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52IFCbDO2623769
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-arago@lists.yoctoproject.org>; Tue, 18 Mar 2025 10:12:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742310757;
	bh=tWBeNmLQCgp1GAZgmVcplEpIPxsPNRlcFLT0jm7qS+Y=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=IDhIu51dKMW63muQvWKVubumbq+BRpr1No2ALgMMZUzMcuQGDYQs//dR08RVQpAV6
	 ST5qMvUhhHlktffEBA1icIxLp3LK7Gf5ROphm/FCck8SBtiAnuAezUse8mObCKG1VO
	 giMyZluhE+5G5wuHVPGRgiUVxLMmXLwRKs4Gly78=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52IFCbqD018864
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 18 Mar 2025 10:12:37 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 18
 Mar 2025 10:12:36 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 18 Mar 2025 10:12:36 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52IFCa2X096063
	for <meta-arago@lists.yoctoproject.org>; Tue, 18 Mar 2025 10:12:36 -0500
From: <a-christidis@ti.com>
To: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap/master][PATCH 1/2] meta-arago-distro: Create opencl packagegroup for arago toolchain sdk
Date: Tue, 18 Mar 2025 10:12:35 -0500
Message-ID: <20250318151236.561373-2-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250318151236.561373-1-a-christidis@ti.com>
References: <20250318151236.561373-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 18 Mar 2025 15:12:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16084

From: Antonios Christidis <a-christidis@ti.com>

This package group contains opencl headers which should be included in the arago
toolchain sdk target.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 .../packagegroup-arago-opencl-sdk-target.bb            | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-opencl-sdk-target.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-opencl-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-opencl-sdk-target.bb
new file mode 100644
index 00000000..1678e15f
--- /dev/null
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-opencl-sdk-target.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Task to install opencl packages on sdk target"
+
+inherit packagegroup features_check
+
+REQUIRED_DISTRO_FEATURES = "opencl"
+
+RDEPENDS:${PN} = "\
+    opencl-clhpp-dev \
+    opencl-headers-dev \
+"
-- 
2.34.1


