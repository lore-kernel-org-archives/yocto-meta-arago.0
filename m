Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29DAEC76196
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 15:13:59 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.22221.1679066036116640612
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 17 Mar 2023 08:13:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=etsOcmzw;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32HFDsb9035107;
	Fri, 17 Mar 2023 10:13:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1679066034;
	bh=a79ZR5YC15I7hrU0QDfprq+ZLJCtg8L2gRWNmliKnFs=;
	h=From:To:Subject:Date;
	b=etsOcmzwiDUVmBeiam7Li9NYrMkg09ubg95+Rcm9CMBsDCicLKxJaFFxrKhZs3F25
	 aO47zdoscM1XHAytvgUvgFbDK0Mw7c3fw9tBm4gKafwnWNLXfE+L28cYfZBiSl0ePA
	 v7vwWpO00+6mWVL2zhNU22dll7T5CWAtPfc5FOlI=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32HFDsPP022178
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 17 Mar 2023 10:13:54 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 17
 Mar 2023 10:13:54 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 17 Mar 2023 10:13:54 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 32HFDs09008403;
	Fri, 17 Mar 2023 10:13:54 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1pdBmE-0006Vm-1S; Fri, 17 Mar 2023 10:13:54 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH] branding-ltsprep: LTS migration brand
Date: Fri, 17 Mar 2023 10:13:54 -0500
Message-ID: <20230317151354.24990-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 17 Mar 2023 15:13:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14258

Add a new brand to control picking the next LTS version of kernel and
u-boot while they are under development.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../conf/distro/include/branding-ltsprep.inc          | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-arago-distro/conf/distro/include/branding-ltsprep.inc

diff --git a/meta-arago-distro/conf/distro/include/branding-ltsprep.inc b/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
new file mode 100644
index 00000000..0db079d9
--- /dev/null
+++ b/meta-arago-distro/conf/distro/include/branding-ltsprep.inc
@@ -0,0 +1,11 @@
+
+PREFERRED_VERSION_linux-ti-staging = "6.1"
+PREFERRED_VERSION_linux-ti-staging-rt = "6.1"
+PREFERRED_VERSION_linux-ti-staging-systest = "6.1"
+PREFERRED_VERSION_u-boot-ti-staging = "2023.01"
+
+# GPU support requires out-of-tree SGX and RGX drivers not available in until
+# LTS prep is complete.  fall back to software rendering
+MACHINE_FEATURES:remove = "gpu"
+PREFERRED_PROVIDER_virtual/gpudriver = ""
+
-- 
2.17.1


