Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D5F9E66880
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 17:21:11 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.16])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21874.1766164870087387834
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 19 Dec 2025 09:21:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=pekM6yP/;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.62.16, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N7AIBzLwgCzoe9lIM/mbA6PLGaQ5dc+MiKhjA4/P56BAMdbPz7aAVceUTmRpHW1uV+/nsRZeLhd/Y1jl/UDnXutppx0horH8MNUQqd5tDwAcBUvxffbcJYDEPoISHFmqcFatvSQxuRw3c8Oq7YC2UDntO7ez39GUPV9dq0fjZBX95E9JrNLSSF5vk1sn9+dozLcARhDAiuOi4/pDGL7seywmeVgBVe8yAaGwXt9G0u6mqCgcecmIoSNmgIcAJuiFDzNdzxD5183U8gh5qs4yC3befmI5TCUsM/L54MwtgnedvTLASwbOYZAlm1kMo7YBrxAGKpEN/GffYjmXgRbqzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ttQ7Vue/sItJ+lNbyVV2Oa3x6ECNZ56OImn79l7RWIo=;
 b=lRTZtIweeLxzp8GeKXHVza4vzRkpto/EMJVOzLD18Dqrcw4+6zsTfHWlc4Cc2vJAP96B/pFPlvIVo6GHvjkNeM1kIU5nDM6SRH3dkweSpeVMqusAvLgyjjlCvSELRXz8/7iT0j4AnWq6ARaY4rmOA+nWYs3GpNUuU8A/BuJd6xB4ylAoIPD3Vr93+qO1ijmdo7rS6/Cqp7W5MZ1TGfT8X8eIWUmbY8OLx+HiYGnJ+5mMN3RFII+j9tobvb/9nPdWJrOJ7ms9lDW5kFarOrc49FKFghE2sLQ2RLhBt+uCj5bCmqc5B3aa+qv+0KcJRc+wHHnhc/p0cU5Jbhyk31xUFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ttQ7Vue/sItJ+lNbyVV2Oa3x6ECNZ56OImn79l7RWIo=;
 b=pekM6yP/mAv/QNF06SWqCF6v5d8iRwaQkhggwEb2dqaJsneKUK8f/x3ZD3+uHoGUgDpO4Mz6jDLwDC41vsI49kn6GZMVanvsOk9YEsk1w7JldnQmfLaO2vSBolSibs5NU097edzasNwRIBN5lDycSxsnWvEdV2umMKP1K+u3nd4=
Received: from CH5PR04CA0023.namprd04.prod.outlook.com (2603:10b6:610:1f4::23)
 by CY5PR10MB6141.namprd10.prod.outlook.com (2603:10b6:930:37::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 17:21:05 +0000
Received: from CH3PEPF0000000C.namprd04.prod.outlook.com
 (2603:10b6:610:1f4:cafe::cd) by CH5PR04CA0023.outlook.office365.com
 (2603:10b6:610:1f4::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.9 via Frontend Transport; Fri,
 19 Dec 2025 17:21:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH3PEPF0000000C.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 17:21:05 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 11:21:03 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 11:21:03 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 19 Dec 2025 11:21:03 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BJHL3U91273105;
	Fri, 19 Dec 2025 11:21:03 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vWeA3-00000001WUL-15c2;
	Fri, 19 Dec 2025 11:21:03 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] FIXME: systemd: Remove new OSC prompt feature
Date: Fri, 19 Dec 2025 11:21:03 -0600
Message-ID: <20251219172103.363206-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000C:EE_|CY5PR10MB6141:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c34b1cd-c4e5-4e0a-d36e-08de3f22fdc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hp5YZMCx0/E2sDXxCaXJOXKIDp1smykREM4ScBF1oYyyQj1Ow5vzPjLKvblX?=
 =?us-ascii?Q?0LEdSmcwqAnRM9z66hWNu4STrl7Xu3YnX3QIuWDdYxUQn8Wmevg6mn39ATcM?=
 =?us-ascii?Q?z379Ond1jyBN43hVqybBrWRLtwsnzSwExxtTG9WUFj3CYwItt4cTXEHifZWV?=
 =?us-ascii?Q?4s/ZoKzbXmImz/N2jZOex1b1HGYcsTXS6PlE6yj55IK4QNfaH7IBiHQ3BSE7?=
 =?us-ascii?Q?KYtSImX6PPnEoHd8GFG6TD4IJJYji2DywTMuT6mAmsdFSWyAkdAHkOg/EqVj?=
 =?us-ascii?Q?dt1cB8ussz8vLwCIGVs7Tsy3DV/EcdYbH6IgXORtX/WFqEbkLWUY3x+wdqOE?=
 =?us-ascii?Q?Ftjebu5tgmJJ8MAUxf+u3pORIW3SofKmbkOeb0agi84OStAGuctAgcqBbtLX?=
 =?us-ascii?Q?Nnf4lnIBlrC6GKPQZg5Uhqj5NvW1TtzUiUAgHI7Up5p3Q2HMUwXSsY78U+Os?=
 =?us-ascii?Q?Xj/bTbKtvqVsKjRKp16TtC9rCVRZKYSCdTinGm5AX2Qr2VfPamD0izBVYQTO?=
 =?us-ascii?Q?Vn+IlNrghKZNtjAODa3p4ZO8SA1/W6r2m42Lm6cW7+0gs2WMSryqq7GXT24D?=
 =?us-ascii?Q?rNy80Oi4vI8zPuZDcAspU13/J1N3M2HkTrGlDKuIUapyTqlsU3R5dZVdqBez?=
 =?us-ascii?Q?QndHJJDlY61t/CY14IwT69p0/ld25fE1CNkVB9nftELjV4E5pKZFGl+mC/KM?=
 =?us-ascii?Q?4jc0Ulldd413RN60JiH/hYP4ugzzIIlWGj5LaGPyrvHko+p/Jz3DIOg3mTdq?=
 =?us-ascii?Q?QU9bpgxJjT4r1csdhU4myOPcQjKI0EOeo96b9jcKZooIgTi4u8uvQtJY6fd2?=
 =?us-ascii?Q?G1pkFF0PS5cK1BJOzhW0oTy2pYvYvjKuXj7AoPexPI8T18Eij2mvQV65mL8z?=
 =?us-ascii?Q?hle3HpueLGopcwrdGqqR/apanAqLQOSzIBb9AX/Bebxl2LgnqiTzlnjfcSkq?=
 =?us-ascii?Q?pbEXAF1/b2P9UGLn6u+V6uEPoFQOAqh9xwbPGkNgZyjX6dCkzaG5AlbbdHxN?=
 =?us-ascii?Q?PMezn6LKz1NzGNyd8JHd5NVj2OoN5MGmxM7nqW9VzVDapcnepOVIdjJIfn/J?=
 =?us-ascii?Q?/rJJeU62foZPYg2sMT3zksoaJBYtqXla8cRXYJxaSG8ar/vKCCelNbCCrWbL?=
 =?us-ascii?Q?GI/X7wMqVswu7kLn+mglZd6PY6STaM1AQL1lBtZvAgVm3yQnR3ZJ8S4+Rwzu?=
 =?us-ascii?Q?BAmOVvwsdTrHkLGHMu/Nityh/p30jllKZO8lj4Eo3PiOyq+tIltKE4lFeqMz?=
 =?us-ascii?Q?YZ+VDdo1EaX8w9zqF0KBYhgsCUqA2C9fxf+/a1kF5RIrFXvZl4WF/WjnPYA6?=
 =?us-ascii?Q?/qqF+RT7LkjzMCCu/eiiVAxsSLUx/xOFeSnWJEw/JwqYlji0PBtQQxWNNFqK?=
 =?us-ascii?Q?7ZOvb151cf2ZXpzjmK20/pPFLaQdb2ZvFgfDakPirHhb/ADvQg71fNXjVfRp?=
 =?us-ascii?Q?UXzg8MhvcN2jlZ/G4t229idvpIJeJpn//BGOGevtEezHpKmpX5gQzvP/6DLT?=
 =?us-ascii?Q?e9U/KK2t5+m/0Q0RAE43tr/FYz3un196z4IVGTqz0nsYecw8tPQ4WheLIANq?=
 =?us-ascii?Q?lRC9cAEz46nH+ysmGfA=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 17:21:05.1650
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c34b1cd-c4e5-4e0a-d36e-08de3f22fdc9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF0000000C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6141
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 19 Dec 2025 17:21:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16899

Our testing flow is blocked because of the OSC prompt code that was
added to systemd 258.1.  This feature seeks to put a lot more extra
information on the prompt using escape sequences, but it is conflicting
with our board setup in some way.  All of the escaped sequences are
being printed at the prompt which makes our testing detection code
fail.

We need to get this fixed in the long run, but we also need to be able
to pass CICD in the meantime.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/recipes-core/systemd/systemd-arago.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-arago-distro/recipes-core/systemd/systemd-arago.inc b/met=
a-arago-distro/recipes-core/systemd/systemd-arago.inc
index 6e5baef7..3c31b92d 100644
--- a/meta-arago-distro/recipes-core/systemd/systemd-arago.inc
+++ b/meta-arago-distro/recipes-core/systemd/systemd-arago.inc
@@ -27,4 +27,9 @@ do_install:append() {
=20
     install -d ${D}${sysconfdir}/systemd/
     install -m 0644 ${UNPACKDIR}/timesyncd.conf ${D}${sysconfdir}/systemd/
+
+    # Remove new prompt code that is polluting the testing output
+    rm ${D}/${nonarch_libdir}/tmpfiles.d/20-systemd-osc-context.conf
+    rm ${D}/${nonarch_libdir}/systemd/profile.d/80-systemd-osc-context.sh
+    rm ${D}/${sysconfdir}/profile.d/80-systemd-osc-context.sh
 }
--=20
2.43.0


