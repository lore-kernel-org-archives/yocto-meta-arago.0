Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72E8DC27C4F
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 21:50:33 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.85660.1719006626315353517
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 21 Jun 2024 14:50:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=VSOChnet;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45LLoNYi004986;
	Fri, 21 Jun 2024 16:50:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719006623;
	bh=Ymm+iGF7VDgSQhsxfQ6htHPBrmppc1MNSMlPa4mgn6E=;
	h=From:To:CC:Subject:Date;
	b=VSOChnetSdcDkv/Y6Hj2xKbBkMPCoFwgbyFkD0+WCEyxk29mU2qt9tNGRFXPEKLAy
	 PpQHYwgEXYDuH6xuKNOk8HYKy3iR8ot3RDeBPeHIj4OZ6C8rrZ6F/oAfCHEUJMt4KE
	 8z3TWSgwFUBrxwthEwDwFKzb2phPpITvFRXGGoGM=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45LLoNcv101067
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 21 Jun 2024 16:50:23 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 21
 Jun 2024 16:50:23 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 21 Jun 2024 16:50:23 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45LLoMDo104592;
	Fri, 21 Jun 2024 16:50:22 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <detheridge@ti.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap/master][PATCH] vulkan-cts: add workaround for createMeshShaderMiscTestsEXT
Date: Fri, 21 Jun 2024 16:49:02 -0500
Message-ID: <20240621214901.1733387-2-rs@ti.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 21 Jun 2024 21:50:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15410

From: Randolph Sapp <rs@ti.com>

Remove the CXX flag "-O2" for GCC 13 and 14 on aarch64 platforms.
There's a bug with ARM GCC that breaks the iteration of "types" in the
createMeshShaderMiscTestsEXT function. This issue is not present for
clang or x86_64 GCC 14.

It seems that the array is not initialized before the first iteration.
In testing this can result in a random value being used. This can
manifest in LINES type being processed twice, resulting in the following
error:

FATAL ERROR: Failed to initialize dEQP: Test case with non-unique name
'no_lines' added to group 'misc'.

Signed-off-by: Randolph Sapp <rs@ti.com>
---

Taking too long for this to hit master so the backport probably won't come in
time for scarthgap. Submitting this in the meantime.

 .../recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bbappend      | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 meta-arago-distro/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bbappend

diff --git a/meta-arago-distro/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bbappend b/meta-arago-distro/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bbappend
new file mode 100644
index 00000000..7af2057f
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bbappend
@@ -0,0 +1,2 @@
+# Workaround an optimization bug that breaks createMeshShaderMiscTestsEXT
+OECMAKE_CXX_FLAGS:remove:toolchain-gcc:aarch64 = "-O2"
-- 
2.45.1


