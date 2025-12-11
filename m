Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA8E4D4334A
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 20:26:52 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.214.1765484811950709066
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 11 Dec 2025 12:26:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=dyi4hHM/;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.209.44, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hmgeIu19AbHEYNlHUnytt+yaHhwsq0QLga0Xofcf6c3BENHspIikUfYVnpphuN3h9SSJTRwnULx9XGSY29PrhbequpyiDsTnf36MuwTnV16sm4DcPGK9u1Na+n3W4VrGQ7skyo9lZ94z8/2QMyDzyKOAi5T9KxXxcIM7eFYLV1pXkYb5xo02G0EetS9tehxeXDKMvoyU1knZv+6Ez5D6bWSN0pgePMe/he9IDsFdz5nFi5UuCAnJxKFerVl1+VBt0D/eDcdQZmfglFgtkOb5Gy1ozOr2aJneQ3rOcmWJ1NTJQNcuwk32AXmx3WrQjxWi5HsD5wUATJYogwFIeiPFdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A64qUOelJxglTl76xeE/992rvuGl4ezlLjh0tPsRaq4=;
 b=c3hnqKVK56z1UAgaREbVQfrkm4ELC6kTG/x5uT4TW9aKZeHAe2hLJidGaQYWf8+yELobsz3Ic7UryD/EOHdi6gZuCTu1fImuqvzqOcyqlKowFxdv9Ot4XrsUeROZNgHS64OP3goT8CtPAaQ7SSSNauPFmNUAaj4YszNmklg5d3rUxkbZQGyTXxIfWKk9Ngd0Y6wErtEf7KNyD1MnY0OqEZpl2OSr5x+TH/eg+bKcaeqKjArw89ncyYdxjtqoycmm3Ty9egt+r+r401WLZx7skZ4lN1wJgGGmlDWB/ZPlmQ+ia1sG35nRPeJyw1ENWVjM9Kn9xpwG9h510Hi/DgZkCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A64qUOelJxglTl76xeE/992rvuGl4ezlLjh0tPsRaq4=;
 b=dyi4hHM/ViFQ0TfkYPfHTdao2jlBzlWqqPMs8mWqAB5I0GVJiauvQ3KcNEfJgsW7wxzUPtU2KyO5T1tRfy7+8dW8p+AKXdokBfzuhruYp+ORr2H7cA7l3LNBCJcweAmdkZ4Xh/HFshWXulmhJf/ulfmJ0+lLNJop1nJw5cHwHUc=
Received: from PH7P220CA0106.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32d::7)
 by DM6PR10MB4155.namprd10.prod.outlook.com (2603:10b6:5:214::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Thu, 11 Dec
 2025 20:26:48 +0000
Received: from SJ1PEPF000023D3.namprd21.prod.outlook.com
 (2603:10b6:510:32d:cafe::d6) by PH7P220CA0106.outlook.office365.com
 (2603:10b6:510:32d::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.9 via Frontend Transport; Thu,
 11 Dec 2025 20:26:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF000023D3.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.0 via Frontend Transport; Thu, 11 Dec 2025 20:26:46 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 11 Dec
 2025 14:26:40 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 11 Dec
 2025 14:26:40 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 11 Dec 2025 14:26:40 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BBKQedg1064312;
	Thu, 11 Dec 2025 14:26:40 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vTnFI-0000000H5Lb-0qc0;
	Thu, 11 Dec 2025 14:26:40 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] tisdk-tiny-initramfs: Bump IMAGE_OVERHEAD_FACTOR
Date: Thu, 11 Dec 2025 14:26:40 -0600
Message-ID: <20251211202640.4072124-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D3:EE_|DM6PR10MB4155:EE_
X-MS-Office365-Filtering-Correlation-Id: 4675f6cb-2365-46f2-3bd3-08de38f39b02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Ofll3aXsLy7DjSeDf1fPDgnkGfPlaWpFq8aRPtn/kXMDkYskbGdd3lB7q/RG?=
 =?us-ascii?Q?La6EboZcwhIssQq5Qt0gVsj1bZcnHkDlfj8FNCrT6UTurJr7zw/A55ASbYLf?=
 =?us-ascii?Q?SwuIPShsZsRD129ShrlUCfCnoXSMFPZ8+qHE1Jl9GyZWwMeUIrtqYQIpJPZD?=
 =?us-ascii?Q?XtEDcVCNhistBkVFjF+vFpx+LZ4b01rVVV1CNqHqOQPnjq0PYFzDxqlysUJb?=
 =?us-ascii?Q?6WpW/gwn0qkVt53/78v5R3QMRS5l6zlu5XYci5mFhKr29NQ6Vf/0crHo1BRU?=
 =?us-ascii?Q?pLzYmmx9G/roHtNFnCICAXWb+HMyb9wfAO4F8rJo5yRDYksMBUhwXKQQ8XAh?=
 =?us-ascii?Q?i38j8yZfeHe1td21iJHhugCBWEJaYKanK6aVYZqkQL7+nCUaXjDZCRThSREs?=
 =?us-ascii?Q?64/1z6E5v2+kg+19euL7kQqc4RKpLJSVl36lXJYTu3gdiQ4ZReRO/upg9JSD?=
 =?us-ascii?Q?/19/1xzbt5JenxxCUQXLp7ZCKMQluCSzivr6kW1umwaE989ymHXL4DN1B4XT?=
 =?us-ascii?Q?RW70bJ6tTlPqBvSebFDi1YboHzRIaOO+TFEQ+S9nf1uIvx6XcJarDMB7jHSQ?=
 =?us-ascii?Q?pV0nANGwQGVMqkMrMQLn7avhS61AYMTVyhNARcuzn0ohn4y6ZTkILO/KVFiW?=
 =?us-ascii?Q?2IFwhi/HVoQcLouzDzoVtcb3K2nhiLNC9VuUfOg5FPC8su78CmBuVBHPzcJx?=
 =?us-ascii?Q?VBPxjCACi/U9pxt937+DCeHGSl2RnLKUQ4a7ty3mpbpyGfBYcFCASfKlHswc?=
 =?us-ascii?Q?zO96AlJ5ziDGtG7vsePeh1nwS9Av2g2PjsCejo66tZtNOiZmEybpWYPsuBun?=
 =?us-ascii?Q?K4fLIZr2oKLcOsNxkMEP3/ye+RWJLog00gCKD+GzcmsAhwh1KUYZkTUyGbNF?=
 =?us-ascii?Q?+xkbBgs2tMOOard6qJDFV1K4jHz9RtyhtdgJf/4IyVmVP/RZzZNR6VbMtLsb?=
 =?us-ascii?Q?2fe1pdT4f7UJOPEIXK0L/9sMaU/INAVSFXk4wrfwOy32rB60cwauxgl5RK4A?=
 =?us-ascii?Q?UL0OViuRiKTkKoLxw699O2nX2D6n3nEFm+oDS7xsis/7Kq3RFSSA37Qn9ahr?=
 =?us-ascii?Q?07jEl3edKNlkjCbNtWOpWtGW6FOK9DWD4TnGDNsZkIdIadyNU1Y/unejBg4q?=
 =?us-ascii?Q?vQW91SrJ5MN0uowmr6NBBw8SBcd05lD9FtWgJxc066KBfM64YgNbJ2XC8xCx?=
 =?us-ascii?Q?M+t2b/u5CyUMFOzqkHIy1Own4EI+wE4QLBk5AoX2lf26U2sX3NMg+RlB7aET?=
 =?us-ascii?Q?2bcb0A0bS9lur2g978w4U80tU89p923ZoV6g9SJV4hZQdPxTrqpaAsB3o5Xm?=
 =?us-ascii?Q?g5ByWFOaBYM1eyMeOTQWpwydKrvm+JRPxh8WBE+NeNA7zd5yeGMkWTADOiLC?=
 =?us-ascii?Q?xrXBKB4xOeVib8S91KWBSjTWOx1Kzu9WyiH4f85xK0KL4y+Kz0mskTlMiTfF?=
 =?us-ascii?Q?K9Qj/EfTCBQmlwAP0B9Z+3MenZcD3n6Yo/37+RmeEx3oyxSnbxMmkK63s70p?=
 =?us-ascii?Q?pGoAEF2vDlg/MCUDi/B29pE2m9pUCtiwsTeOPVD2Ur4kMCY51dpL0b8/CbiF?=
 =?us-ascii?Q?vI/DngnnAzJzGVqSuuM=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 20:26:46.1007
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4675f6cb-2365-46f2-3bd3-08de38f39b02
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023D3.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4155
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 11 Dec 2025 20:26:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16885

Bump the IMAGE_OVERHEAD_FACTOR to avoid the check.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb =
b/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb
index 37b777f6..e19be8a6 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb
@@ -17,7 +17,7 @@ IMAGE_FEATURES:remove =3D "package-management"
 INITRAMFS_FSTYPES =3D "cpio cpio.xz"
=20
 #INITRAMFS_MAXSIZE =3D "65536"
-#IMAGE_OVERHEAD_FACTOR =3D "1"
+IMAGE_OVERHEAD_FACTOR =3D "1.1"
=20
 IMAGE_FSTYPES =3D "${INITRAMFS_FSTYPES}"
=20
--=20
2.43.0


