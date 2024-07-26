Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48683C3DA7F
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 20:45:28 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.4485.1722026720557846156
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 26 Jul 2024 13:45:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=yc1dKMU/;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46QKjJsc016395;
	Fri, 26 Jul 2024 15:45:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722026719;
	bh=uCUJdwykpPP20el4P8hWEdAU8wMoCIsdffKuB5BGYOs=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=yc1dKMU/BBHdvT1qr5HUaBu8TFBrl9/udC5iEiXiv8+Ugz9fgy3ezNz7s1UDv+7gx
	 RJHwlYVNJM2Vv1BuCK/8FG5xSGU5yd/exotoKx7VEZuKqSQFIliDHdt6o621ZQTcSx
	 swVVaQjCiPbOVKgZx4nMdbeI973/3twGmiGK0pP8=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46QKjJ6Q015084
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 26 Jul 2024 15:45:19 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 26
 Jul 2024 15:45:19 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 26 Jul 2024 15:45:19 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46QKjJC0009841;
	Fri, 26 Jul 2024 15:45:19 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sXRoV-0002Kn-2L; Fri, 26 Jul 2024 15:45:19 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 1/2] clocl: Disable buildpaths check
Date: Fri, 26 Jul 2024 15:45:17 -0500
Message-ID: <20240726204518.8929-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240726204518.8929-1-reatmon@ti.com>
References: <20240726204518.8929-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 26 Jul 2024 20:45:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15469

The ti-llvm3.6 compiler is a custom TI compiler that has not
been updated for a number of years.  It does not currently
support reproducible builds.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-extras/recipes-ti/ocl/clocl_git.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-arago-extras/recipes-ti/ocl/clocl_git.bb b/meta-arago-extras/recipes-ti/ocl/clocl_git.bb
index 52deaab8..b6ad9782 100644
--- a/meta-arago-extras/recipes-ti/ocl/clocl_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/clocl_git.bb
@@ -33,3 +33,11 @@ do_install() {
 
 RDEPENDS:${PN} += "ti-cgt6x"
 BBCLASSEXTEND = "native nativesdk"
+
+# Disable the "buildpaths" check while we figure out how we are
+# going to address this issue.
+#
+# The ti-llvm3.6 compiler is a custom TI compiler that has not
+# been updated for a number of years.  It does not currently
+# support reproducible builds.
+INSANE_SKIP:${PN} += "buildpaths"
-- 
2.17.1


