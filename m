Return-Path: <vigneshr@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0B17C433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 14:08:50 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.7763.1665497324672008056
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 11 Oct 2022 07:08:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ivxHiJB6;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: vigneshr@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29BE8hRf038940;
	Tue, 11 Oct 2022 09:08:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665497323;
	bh=MDfF0Nbgxrfwj7sNEY7WPW0AHD5U6//IqW5969rdqAQ=;
	h=From:To:CC:Subject:Date;
	b=ivxHiJB6CnM+GrpzgjUxHpUya3ddQAlASrra+0c+xaiEFtgczs5v/oAESkskhu+pW
	 hovxJskN8Zvr3eWzEjQqqo2SNTEAo4DJXG7oZV2qhkUWHDRpO0s3x3751KEpnZ0RR/
	 Pc/FyuS9ZwvaFCvhR25uxkJ4ix/fV8umrZjroV+0=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29BE8huq016992
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Oct 2022 09:08:43 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Tue, 11
 Oct 2022 09:08:43 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Tue, 11 Oct 2022 09:08:43 -0500
Received: from uda0132425.dhcp.ti.com (ileaxei01-snat2.itg.ti.com
 [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29BE8fBp122392;
	Tue, 11 Oct 2022 09:08:42 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <denys@konsulko.com>
Subject: [meta-arago][PATCH dunfell] irqbalance: Update to v1.8.0
Date: Tue, 11 Oct 2022 19:38:17 +0530
Message-ID: <20221011140817.2257359-1-vigneshr@ti.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 11 Oct 2022 14:08:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14067

irqbalance has fixes for ARM64 systems especially for when CONFIG_NUMA
is disabled, hence upgrade to v1.8.0 to take advantage of IRQ load
balancing on K3 SoCs

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 .../recipes-extended/irqbalance/irqbalance_git.bbappend       | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 meta-arago-distro/recipes-extended/irqbalance/irqbalance_git.bbappend

diff --git a/meta-arago-distro/recipes-extended/irqbalance/irqbalance_git.bbappend b/meta-arago-distro/recipes-extended/irqbalance/irqbalance_git.bbappend
new file mode 100644
index 000000000000..e87a65d65f47
--- /dev/null
+++ b/meta-arago-distro/recipes-extended/irqbalance/irqbalance_git.bbappend
@@ -0,0 +1,4 @@
+SRCREV = "99ae256d02b35778b406e598beedc8d827cdac18"
+PV = "1.8.0"
+
+PR_append = ".arago3"
-- 
2.38.0


