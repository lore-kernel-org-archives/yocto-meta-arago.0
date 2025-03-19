Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83975C36001
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 21:27:40 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.6847.1742419650513354590
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 19 Mar 2025 14:27:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=k4VgmsO4;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: a-christidis@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52JLRTQR3030094
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <meta-arago@lists.yoctoproject.org>; Wed, 19 Mar 2025 16:27:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742419650;
	bh=hRP2VoI/uHCfVb78Pq1vsYoBpG0IJzKSYbbwehNQqS8=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=k4VgmsO4+/rQqr/x0wWnj61nQcqn+9fqUJuIZqfNql9c7A3bV5C/rOfeK1UdLsjmt
	 zOyn/Ul6cGVavkeJBvMZ7Z5QayNXBOpDWpW8OeBYruIlZrAbSET9EkD3R+tNkcXAEG
	 IEB0eL0m9UD7dQq2Elb/bnKKUieidQLoEe3eXINg=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52JLRTfk094194
	for <meta-arago@lists.yoctoproject.org>; Wed, 19 Mar 2025 16:27:29 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 19
 Mar 2025 16:27:29 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 19 Mar 2025 16:27:29 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52JLRT1v026491;
	Wed, 19 Mar 2025 16:27:29 -0500
From: <a-christidis@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
Subject: [meta-ti][scarthgap/master][PATCH v6 1/3] recipe-graphics: port gc320 driver to work on kernel 6.12
Date: Wed, 19 Mar 2025 16:27:27 -0500
Message-ID: <20250319212729.336516-2-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250319212729.336516-1-a-christidis@ti.com>
References: <20250319212729.336516-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 19 Mar 2025 21:27:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16096

From: Antonios Christidis <a-christidis@ti.com>

Changes made on the gc320 kernel mode driver in order to work with kernel
6.12. There is no other change in functionality with this update, and the
driver version remains the same.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 .../recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb b/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
index 818ed683..a6dc3e25 100644
--- a/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
+++ b/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
@@ -8,9 +8,9 @@ inherit module features_check
 REQUIRED_MACHINE_FEATURES = "gc320"
 
 # Need to branch out with ${PV} var
-BRANCH = "ti-${PV}-k5.10"
+BRANCH = "ti-${PV}-k6.12"
 
-SRCREV = "e2a10f31e255a65ec30a6e10b890e77d7e9cb107"
+SRCREV = "83afddf9dbf6a8458267b4dae21ee35bfb11f3d1"
 
 SRC_URI = "git://git.ti.com/git/graphics/ti-gc320-driver.git;protocol=https;branch=${BRANCH}"
 
-- 
2.34.1


