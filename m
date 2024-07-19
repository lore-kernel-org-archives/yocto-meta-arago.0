Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52648C3DA61
	for <webhook@archiver.kernel.org>; Fri, 19 Jul 2024 02:53:32 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.10652.1721357610160654688
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 18 Jul 2024 19:53:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ZTOPNZcg;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46J2rTHc077896;
	Thu, 18 Jul 2024 21:53:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721357609;
	bh=4Z18j20bWh0PfEHjXMop0g30BGCP6yOgCPBFyYovnQs=;
	h=From:To:Subject:Date;
	b=ZTOPNZcgFczr07fiNGa9NCdKp3TUcNlZa2CLJxySC5IC1bPBskGPfRdRQeObjtjC6
	 ynu98ONBlzlaIdoLyFEkLPspMOwRqBuEzBANGoJ0NSeZFz+rv6Dsr7LylBLUeMa1Hf
	 2ad/zK6LTudxEnhnOUnILukw9fmIxr7J8h0h+nNo=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46J2rTjw028112
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 18 Jul 2024 21:53:29 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 18
 Jul 2024 21:53:28 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 18 Jul 2024 21:53:28 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46J2rSpb067405;
	Thu, 18 Jul 2024 21:53:28 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sUdkO-0007T7-F9; Thu, 18 Jul 2024 21:53:28 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] ti-llvm: Fix for buildpaths errors
Date: Thu, 18 Jul 2024 21:53:28 -0500
Message-ID: <20240719025328.28669-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 19 Jul 2024 02:53:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15460

Make sure that llvm-config does not have any absolute build paths within
the compiled binary.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
index 4b990b7f..395651d3 100644
--- a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
+++ b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
@@ -72,6 +72,10 @@ do_compile:class-native() {
 }
 
 do_compile:class-nativesdk() {
+    # Fix for buildpaths error referring to TMPDIR
+    sed -i 's:@LLVM_SRC_ROOT@::g' ${S}/tools/llvm-config/BuildVariables.inc.in
+    sed -i 's:@LLVM_OBJ_ROOT@::g' ${S}/tools/llvm-config/BuildVariables.inc.in
+
     cd ${LLVM_BUILD_DIR}
 
     # Fix libdir for multilib
-- 
2.17.1


