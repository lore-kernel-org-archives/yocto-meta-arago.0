Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AA95FB5EAB
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 08:30:38 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.70])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9240.1773822630087201637
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 18 Mar 2026 01:30:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=F51N90k8;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.62.70, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=clxQYaHMAjU1BqRNI5brYUUzgK0aO23MUPGD63ooUBvRf/VV2U0jxums3TEE9242btL+Q1Tf0Qj3mXoKMbceAWLQ2CjpSiRKQ0Zn92uq9XFl2lny0h8Y8R0agSpy+FAKILaSoPrambJHpBPL9FdIhv5clNKmkBkFQjAwohvsEhXEGdVogLx7x2Y0LPunHsMDueKsLs0N6kDw1UI+SKdfUQh9X66Bp7v55aJm48rloQQhXtJZN5mQLKQ/RkaoB6eDT3et7x1Ew5ibeK/HNWu5sJofxBObSo36JRL42Gptu9ATv9ZOVH6v4KqrR82ABjeG1J3aUb0nYMs2WppAjOPbNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CllnhtdhBJmjMsM/Gwu2HvuFGSAcXOnEAUlgGB3hAmg=;
 b=DRITmAjedmWtKxNIqcPiM7SUYkXohhOFOKQ+IeqlQcCUZntoGPI3zinYljG2FgOLWf4Jqw3oQl0y6r6gmhykGdqq/lJ+ba78nuWke0a3couxtWe5SASsst0xBol564i4/sxeyfsS8LNR2OW5mhG5Yp6ge1++PoSBAMq5DEBoZqoHOkJ+w4JkMbzDCsZYPNhacWffqhZF3TwC5kfsU7pACkbkAPkMCvfTKwgFWEF5jrEIUh8ebq1cj6hV1efQ21LHYqBSDKd+pllYKcAbY5CgD5n6HPc7PktqFrrg+Up94zQJoSDTNSH9JtEKp5IzGZf50v4DPPxuuJLW2UmMcb3+qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CllnhtdhBJmjMsM/Gwu2HvuFGSAcXOnEAUlgGB3hAmg=;
 b=F51N90k8RZN+N/zY8XqA2X5o6eFV95+RttGxtSd0QOA2mSQZnLBWeH3IuKYYkey4159wKzTlAA48fN5gA+fk3GxtgnM7CLUo4lpWl90jFW7UrrhjTM4XDHhtfcbxEYFRdBQxzaSZqhLzsbcHCRRSkEYRuBHgf1AR1CaNSwBAFuI=
Received: from BL0PR0102CA0002.prod.exchangelabs.com (2603:10b6:207:18::15) by
 CO1PR10MB4738.namprd10.prod.outlook.com (2603:10b6:303:93::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19; Wed, 18 Mar 2026 08:30:27 +0000
Received: from BL6PEPF00020E66.namprd04.prod.outlook.com
 (2603:10b6:207:18:cafe::2) by BL0PR0102CA0002.outlook.office365.com
 (2603:10b6:207:18::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Wed,
 18 Mar 2026 08:30:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL6PEPF00020E66.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Wed, 18 Mar 2026 08:30:27 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 03:30:26 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 03:30:26 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Mar 2026 03:30:26 -0500
Received: from pratham-TI.dhcp.ti.com (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62I8UH1W025981;
	Wed, 18 Mar 2026 03:30:24 -0500
From: Pratham Deshmukh <p-deshmukh@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>,
	Pratham Deshmukh <p-deshmukh@ti.com>
Subject: [meta-arago][master][PATCH v5 2/2] nnstreamer: Add runtime dependency from tests to main package
Date: Wed, 18 Mar 2026 14:00:15 +0530
Message-ID: <20260318083015.2295406-3-p-deshmukh@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260318083015.2295406-1-p-deshmukh@ti.com>
References: <20260318083015.2295406-1-p-deshmukh@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E66:EE_|CO1PR10MB4738:EE_
X-MS-Office365-Filtering-Correlation-Id: a4124aaf-4cec-4dc5-50a9-08de84c89bbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Q63p1JZGDPjpqH7ITtX363NJphW8YlmaE0GBYEBGIg8tSIwt4zBPgxgX4HIow3vK9LRaKSKfM4CE3mYd3OIMQBM5ODY1krPtMup/SD/E5r9ySn9z7XAPHzWdXuLW/SCOO5Asrm49PGCcOInBqbUoOOWvgJO3DBiBCwWav447jDDSlQ4jc7cXqiUbOxhY4U6JV0+aVLc0izswOpFiKj33j/aav8uu4QdeOovMVhzCI/T4C18C/8n9oxu+WxIgqeF8vlcvsyYNyWwRmy1kjCxLIW8rc9Zt5hlmmIFz7MM4DsjQVmwPm3PtrpFCYpnBVccaZBmah4LYL6/HyaDrect8vLCmlxCiSjjduBdW8dLjTNK2zjEYS8otXqYPARCIt7wIppNrwFZ/h6OUk3Tr5gPR6ttIYJKYi3+tHq27a2j3Xj6CVaLJkmmhyb0D1HxfttlUUKAu1HABtyzCYq9p83KOLe3bj6yc1lAk3XtjM1bGza95mdR3K9h3BNfnn+gfhyrsOMY3Z9gFiP70RCMwPGB/Z6wnnyxpTQ+6VNmFw53yBG0MbhtaLyBO2mF0btZRfvIpjatKwWFURIFxL5eOZ3J0evehEi6CmEqJQ1lf9x5Qow1rA/06xfH9waEmi79E9PJFJp3A9iosseKDgb9TGEHwKvxmHNpLBkYRSB4OYP1ueAuCjEaI4Z+AKpgsi18NXac9KxbjG2Wh1zyCQEf3LURaTsfbiebKDjcB/cSOQMEMRMk1ZheDSdceyWKcEjSnmucNHcrM+pj+/rm2AkhzBq0/FA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	mp7TtY7KQWnlaVDIReOqJERKYhmHYt4nkib+GtnMLphUCUMhR90n1v7VfOU4QvewAkg1o0MG48c01CN6YkQCpAodBY5S+GHCzYPg+Ns3KaR2TKlWmf2XxkNvYxMHgzhqDi8TNHt3RWU0w4AKYYw2c2MujN9k7EBJjr6Q8ppzxO0ABplejSbK3FPuHwYLdmf1OS7s1xhjWaqQB/5O4EsyMTdmyBf8rwC2oooN3cuuCrSEnhB+Tjrmdxv76JRhTf6eucr4f21U8ChoDkiPcDAV0pK7cLiKDwbKiyZ1VDEo3+6oNzRHWOK3bViqYyLSK+ZUjuOVMPoqmiThWiS5SE+K4YjC6xScP53a/WlaVJm6Zi43Lq/IIS+mJa4YLW+vTpa5S2qL0pRuTR/rBPrFHW04xROZUuMEtcMWiBiHwiUOZzag4+90WetSzITBRWuOv1Jb
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 08:30:27.3315
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4124aaf-4cec-4dc5-50a9-08de84c89bbe
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF00020E66.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4738
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 18 Mar 2026 08:30:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17397

Add RDEPENDS from nnstreamer-tests to nnstreamer to ensure the main
package is automatically installed when the test package is requested.
This establishes proper dependency relationship where test components
depend on the core functionality they are testing.

Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
---
Change Logs:
 v4 -> v5:
 - Split buildpaths fix and dependency changes into separate commits for
   better review and maintenance
 - Establish proper dependency directions where test components depend on=20
   core functionality for testing
 v3 -> v4:
 - Use RDEPENDS approach instead of package consolidation to maintain
   clean separation between runtime and test components.
 v2 -> v3:
 - Fix runitme dependencies issue for unittest_filter_onnxruntime.
 - Upgrade recipe to make it QA compliant.
 v1 -> v2:
 - Added fix commit hash in the commit message.

 .../recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb           | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6=
.0.bb b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb
index 0fd5cac9..4ad4373a 100644
--- a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb
+++ b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb
@@ -60,6 +60,8 @@ FILES:${PN} +=3D "\
 "
 INSANE_SKIP:${PN} +=3D "dev-so"
=20
+RDEPENDS:${PN}-tests =3D "nnstreamer"
+
 PACKAGES =3D+ "${PN}-tests"
=20
 FILES:${PN}-tests +=3D "\
--=20
2.34.1


