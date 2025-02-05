Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04466C02198
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 20:04:20 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.22463.1738785852248295234
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 05 Feb 2025 12:04:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=CYULZKVV;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: a-christidis@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 515K4B6A3486767
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-arago@lists.yoctoproject.org>; Wed, 5 Feb 2025 14:04:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738785851;
	bh=q3cNaDBlQNelq+ngNEvOWK3y0uxtXMlvMoyvNPThE38=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=CYULZKVV2siq8Q5HDJKzBCA18gNCgyE0junOVQmjAO7yLep/MRj9vUEZpA4+d6i0R
	 O34uc4ONCcWVkGWwTH0hioO1pZbvVjdDuSk0krw/np0ngat4eMt8jOndjez9AhsNMh
	 bhMt45AP1bPFU7Apta5YbW9nL4j7+MBFiW6K7jEI=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 515K4BTH019206
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 5 Feb 2025 14:04:11 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Feb 2025 14:04:11 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Feb 2025 14:04:11 -0600
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 515K4Bpn061044;
	Wed, 5 Feb 2025 14:04:11 -0600
From: <a-christidis@ti.com>
To: <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [PATCH 3/3] meta-arago-test: opencl-headers version v2023.12.14->v2024.05.08
Date: Wed, 5 Feb 2025 14:04:11 -0600
Message-ID: <20250205200411.686617-4-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250205200411.686617-1-a-christidis@ti.com>
References: <20250205200411.686617-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 05 Feb 2025 20:04:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15813

From: Antonios Christidis <a0507488@uda0867391-2.dhcp.ti.com>

This version of the headers is required for OpenCl-CTS.

Carry this bbappend, as a version pump wasn't possible on the upstream meta-oe
layer. As per the LTS process.

Signed-Off-By: Antonios Christidis <a-christidis@ti.com>
---
 .../recipes-extended/opencl/opencl-headers_%.bbappend            | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 meta-arago-test/recipes-extended/opencl/opencl-headers_%.bbappend

diff --git a/meta-arago-test/recipes-extended/opencl/opencl-headers_%.bbappend b/meta-arago-test/recipes-extended/opencl/opencl-headers_%.bbappend
new file mode 100644
index 00000000..4dff02d9
--- /dev/null
+++ b/meta-arago-test/recipes-extended/opencl/opencl-headers_%.bbappend
@@ -0,0 +1 @@
+SRCREV = "8275634cf9ec31b6484c2e6be756237cb583999d"
-- 
2.34.1


