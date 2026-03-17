Return-Path: <a-garg7@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43998FD7070
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 10:17:11 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.72765.1773742622734879203
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 03:17:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=CTwnztYb;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.56.48, mailfrom: a-garg7@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=go+k2aezXbJQsdkJGml9HRz1wWT6N/RiuvU+IwClG2fYPqlSduSrOqmR42GElqefSRPWxOUxj+ovjWZ9H8xlvzYWAV65xl1XskSHnqUnaF+C9QG5Yonuil0TRvLuRWAw42TTV509wJK3nbPhyD6CwxQpwEifGAUK8hsALwFn1yEwusTZbJLxWeeRV3V6CpvUyA2/hAcVFX4r9p9dNvrd8WIY+s+HJh/egzOaicK8NKjTeOhAdn83bqm+9ZYVl7DvZITbahp8h7v7FZxnkA97Q6aqPC+AFqOMR7TXJUi1OMmqO5Z1RrRsbX82ua6fzqCGrpvYQENnFR/jfEJ4kSYauA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hyqfE3Z4cd6L8Hh9LgATy/Kgyno5wQ1ODmD10IITaW0=;
 b=wPd7le6RF/d28cVptvLz9U5aEmKS+/sdWZZFZ3FG0hdaBOoO9lprpqBQtQPI1JrKvNVfU7W4w+NsX9dNSwh5ON34nIyl1ubEoIZ4pLeVNVFjjupXysZHC95Au0r/tXJzTN+k+h2z7MBpsTiauHcCZuynicCX4mSc8LlyZAFG4H2UGpCdnCNFgw3fmNIuMTG5kP2mQ0Vc2U7vnVindhwgkhjovkJdMrSzrc4MCDpkvn/x7R2hLZZGmSoJuf/eDvAyA3Lnmg9YRcSloncW+kBlAXX/hY0CLm92n837iiT1LIvN7lwZOrP4E0/cM3AVeDjwa2PMKZj//ZMFx3KMO2cTyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hyqfE3Z4cd6L8Hh9LgATy/Kgyno5wQ1ODmD10IITaW0=;
 b=CTwnztYbBN075WbrIxRZW4cJp6jsjSbbo4CKQBhXX8Z5ASiSCvsdsMEmaV2xUeA4XkXBXCCGOmuiztalVLADUPzfskkebKFid5zrPlH0Ik8LHhhGeXZgA+cdTIQx69lft8Tfqib/50XqfgwyNLDoNAe7PvgU6EqCXkk/mrGg5VA=
Received: from BYAPR07CA0043.namprd07.prod.outlook.com (2603:10b6:a03:60::20)
 by CY8PR10MB7242.namprd10.prod.outlook.com (2603:10b6:930:79::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.27; Tue, 17 Mar
 2026 10:16:59 +0000
Received: from SJ1PEPF000023D2.namprd02.prod.outlook.com
 (2603:10b6:a03:60:cafe::35) by BYAPR07CA0043.outlook.office365.com
 (2603:10b6:a03:60::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.25 via Frontend Transport; Tue,
 17 Mar 2026 10:16:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF000023D2.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 10:16:58 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 05:16:57 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 05:16:57 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Mar 2026 05:16:57 -0500
Received: from a0507033-hp.dhcp.ti.com (a0507033-hp.dhcp.ti.com [10.24.69.112])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62HAGqY22517054;
	Tue, 17 Mar 2026 05:16:55 -0500
From: Aksh Garg <a-garg7@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <denys@konsulko.com>, <c-shilwant@ti.com>,
	<s-vadapalli@ti.com>, <danishanwar@ti.com>
Subject: [meta-arago][master][PATCH v2 1/2] ti-test: Remove the pcitest application for 6.18 kernel build
Date: Tue, 17 Mar 2026 15:46:50 +0530
Message-ID: <20260317101651.273730-2-a-garg7@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260317101651.273730-1-a-garg7@ti.com>
References: <20260317101651.273730-1-a-garg7@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D2:EE_|CY8PR10MB7242:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bfe5a96-43fb-4dfb-2185-08de840e52de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	+SNNXq2xvIQ97fBzdXZdVNS3Hj40N22rEYidDa5WQN8RqvPtwcM8sHfmwkxoJDBWWwI8dYjkl/l4urD42paWXYR9jnkz5xXym6iuTxekvVEZYjvVIS943sRjH1fsXdsDokn2k/G8nOeSSWtgOn9Gk3e4NrSbgpKHrxnx2GH23BrYMwxB65qW7uw5n0yTaem2e3/eEvyn74vyKSwLIszrV7G0ROr/p26S73u7a+xBqBMljHW0e/+eN86mneJ5gyclE7gsRsDySWee/XNnLpEg64AO4h7mrAYyLVA9Lrb06zCFgUUCrUB+kKePYbN1nK08npCa24T/7JnWGe5kW71MlBPnV8g+xaTSiYeElKNRLIeq6S3Ny7I+y9hOwHYc+USx5YBpdw+eGY4Dsb/C2NmuhIwLTDbetpgrOmGxb60G5jMsXk4gsWssqcBSamb1lFBHX99QZrZUWji0rzki2FkEd9Zi0Ih3hI+9zQVRd6n2VR9nDJqEH9fRXD0B776rQKiF3mknLnF1daen8V31eMezI5iunwOr6+OUbFmvVcl6R6uM5iqoz0Z2YiuYMpzOo8/m1Xlt2I44zbwyd5jLspw9Ez645ywqBDDdklO1A9fJPvKwslZm/Xu5aRXt/EFhIgJvPiF4UmBxTYeiuow2kICT0xB+yVsRxWU1+TrqtwZbsYOVSDh0BM/r+lGK29/KSyQwcEFn0HKabBWKo7v6SkuQFbx+44NZ21Y2SuodRqEDrj4ouLDKfikHnetS77vuBIQYbiPr8LW85+06ZZNNOFpp/w==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	XPghHL3BUQuMCSL+PGWhPAQAN3PCFzyH9/iSSGdLoclnVib6EE+fdwMD0cionfpI3sYDSCbaXWv7UxrxpxoOYojKQWGmYplpUgQF7/yW5cdKiv4nWVjMePSNW2i6NLnj2bcTfukItjZ7OnmRfnvFNwRUax8CY1gIoGDP+Xhv4M8ImmXjsTn0yXkVFjG+efH7ulzrhcvIqBC0S/6vbj9bquIjdHYs/QxekNJE7wCmg3Nk0uoeCgVPw5FeThcznzCUg0SSEs74I82nWlRiqItWP0KqY7aOrbmZ5Y3WKjdhZTyZI5t0EwTuvVTVipy0+enuPOF96K+noXERKpF2J3ZAhzyU4RdZ/9oXuGd6GYRa+elbm6TkPYNqGrUjdXMk4Qj8Jur0DVryAahaHBzijLvC9C7usZGv8PZN8C0FXmP/+w0N5LYjZInS0je6TLJxBntA
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 10:16:58.6630
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bfe5a96-43fb-4dfb-2185-08de840e52de
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023D2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7242
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 17 Mar 2026 10:17:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17359

The 'pcitest' application, used to test the PCIe endpoint functionality,
is obsolete on the 6.18 kernel. Hence, remove the pcitest application
from packagegroups.

Signed-off-by: Aksh Garg <a-garg7@ti.com>
---

Changes from v1 to v2:
- Fixed the issue with backward compatibility of 'pcitest' application

v1: https://lists.yoctoproject.org/g/meta-arago/message/17290

 .../recipes-core/packagegroups/packagegroup-arago-bootstrap.bb  | 2 ++
 meta-arago-test/recipes-core/packagegroups/ti-test.bb           | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-bootstrap.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-=
arago-bootstrap.bb
index e7a28eb80575..3eb2e3491828 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-boots=
trap.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-boots=
trap.bb
@@ -30,6 +30,8 @@ UTILS =3D " \
 	 phytool \
 "
=20
+UTILS:remove:bsp-ti-6_18 =3D "pcitest"
+
 UTILS:append:ti-soc =3D " \
     mtd-utils-ubifs-tests \
 "
diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-a=
rago-test/recipes-core/packagegroups/ti-test.bb
index 65cf7f1ea614..c3e29280fcf9 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -51,6 +51,8 @@ TI_TEST_BASE =3D "\
     stress-ng \
 "
=20
+TI_TEST_BASE:remove:bsp-ti-6_18 =3D "pcitest"
+
 TI_TEST_BASE:append:armv7a =3D " \
     cpuburn-neon \
 "
--=20
2.34.1


