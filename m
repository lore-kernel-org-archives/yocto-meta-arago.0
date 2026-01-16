Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B20C7D4A5F7
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 03:35:53 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.353.1768534547346344031
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 15 Jan 2026 19:35:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=T7GKq8bb;
 spf=pass (domain: list.ti.com, ip: 40.93.194.64, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nFvLMKKFM91OWpYM+SDeSMWVHqoSNV1HQfpCHsfPoX6771jgMMwjL8oZlWghyzT5c/VDzVtd35GVHVRGWWPyhOhY7VpLWS5M1rGpZust8NzPyWb3BB6doLcab616HUqSccyYYi9rgKVPMQZ4SWZJTzjmdfa2OiSLBluVt/wLmJF9M/LAZim6CpHNEIGPMePBs+s9Y1dZ3yojQgtrNFx5z0prjsaMfEGNcrxk/rm9SBabk95Z7z3J4aWCT5X29oqrXgcYNWk4h8RVsrBXC8sE4TBZl25qGX1TvryHJvKbsqRXA3q7jzNp3NXkmUnBhS340bD/SiGdpKCu2VK2QOQ3RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2FtoezZtyqPf/7innBlW6T3yjTKWmGbii8lXMGH69Dk=;
 b=qcpOWOZ53+eaIoBRV9frj4HIZIhyuc1+KNSwTGsWF+iu0ZrqM5I9ew3PJedHaBhKBfCpxdH+gJI6XAh2QWIAn7Mc0CLN9yfXRO96+MyuCeBDTjmC/Adb0YfufHIaErqro0ZzzEyuz6H1i7vX0S2czk1xSHLYe9vtxicBGEL5fOIpuAe/MKlgD2TC7yr/wG+hZKx5eyjAPQCe/pZG8FiiVRPg18NsTORtc+wFMN+2XWqCS2uNOBMii/53Lr6NaFhZdi9XIFYj7W17gbd/VV/MhUvgP7TtMYEokSRh6Af+vRZv26NHXDnrp8Mz3iYwqds33L+ul/Sl4SZdzhAdRv9Bgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2FtoezZtyqPf/7innBlW6T3yjTKWmGbii8lXMGH69Dk=;
 b=T7GKq8bbZv9IZR2E92b5OptoqC6Xz9CJJbSMADR2/duXZkIziMN7zkE9m07BjnlvathQrc/oUXbMYdn8c0w3EXXh71CRomae7VcCOqfxGRKdIcsFpY6lqU3Zjc3tTc8C8xlzri0QSObdfsFNEszIJw8klmLcV5hKdHyASh/i3v9NVjO/QG2N4NVMHtLrkx356Hnbj6xdq79/hY05izv3UpT5Yq5g3K+ie06gT4yv1KsyB0Wra1ASK4rKszQEfJDc8OwIYlWDnRSAahHlwMcRPGOLGiHhVXrF4ugZ8OwXfQP0wVJNqR9YbgZsJ0H08IWW4Q0cldF5TB1IxqvhH6BX0Q==
Received: from MN2PR14CA0013.namprd14.prod.outlook.com (2603:10b6:208:23e::18)
 by MW5PR10MB5807.namprd10.prod.outlook.com (2603:10b6:303:19a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 03:35:44 +0000
Received: from BL6PEPF0002256E.namprd02.prod.outlook.com
 (2603:10b6:208:23e:cafe::fb) by MN2PR14CA0013.outlook.office365.com
 (2603:10b6:208:23e::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.6 via Frontend Transport; Fri,
 16 Jan 2026 03:35:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL6PEPF0002256E.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 03:35:43 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 15 Jan
 2026 21:35:42 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 15 Jan
 2026 21:35:42 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 15 Jan 2026 21:35:42 -0600
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60G3ZguM2615497;
	Thu, 15 Jan 2026 21:35:42 -0600
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 66D23136627; Thu, 15 Jan 2026 21:35:42 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202601151800
Date: Thu, 15 Jan 2026 21:35:42 -0600
Message-ID: <20260116033542.1562473-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256E:EE_|MW5PR10MB5807:EE_
X-MS-Office365-Filtering-Correlation-Id: c370c70e-a83f-4c68-55bb-08de54b053ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|34020700016|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?FRh/GK/4yXpJGOJpH1ZBfSV587Ca/F45C08KUm4JvoqhHdw9Mpr3lxLp3Hiw?=
 =?us-ascii?Q?6DKl353mfFMEAEMrOBDj4zgjsziaxhKhhidWAxlBC+ee6dOp1mk2OWjXt16k?=
 =?us-ascii?Q?E7INCIC9CoJNZzgNPTUg08zllWUxc4sP8LZdxNkxQPudc5aim3uPL6bWh623?=
 =?us-ascii?Q?JJGgjKnSWprfn3eKbYZPO+yeZyc6upzYQv9TzH5ekVQxbQqjQApGFA91k3lu?=
 =?us-ascii?Q?pWHPWUO5PSy2yzT7jzn4es68CR5z5OKhLJcFBYdOD9QJmArUSLNRKyA1cA3K?=
 =?us-ascii?Q?dbnkO8UhINKOV0YdZDnz+HRTbIJJG9knstNT2W8ruCoQEp6SkGS1PlPvxGM0?=
 =?us-ascii?Q?4B8PT7tD1wWVWOsXXGY7JYJyxMm6TyIkU7ghhP9RVn87pcd/YliA5x8jl8UM?=
 =?us-ascii?Q?0RkicGWnRRFrpBa3qNI/PsfYZFy3PV7BcUdjMoUc6WbO5Dc3abye1u3yGVVu?=
 =?us-ascii?Q?dr0sIFhY2xNSIoOa+hRPzax/0Ts8PX9+DB40IokmtYSEtxfB5f1pG+yR+izO?=
 =?us-ascii?Q?GrLDiuCrX7ZrnZC9maMiL8aogUdsKlZT9DlKlBSYKgBPJYSFrBRwALr81R3V?=
 =?us-ascii?Q?1LoAm5r6c+gsKBB00ShSNT6o7De4HJcJtcR4ZkUz1L0hzl67mFrq/0HIdaBs?=
 =?us-ascii?Q?FpYMxL7+OLh9WHsCAHZGE2SJ1VsEUsUyYKrUZv6j+e0NEwsxMFhwCJkf8fgt?=
 =?us-ascii?Q?3BsMlWen9AzQfg1iQOl1LWh9jRehN5hHEEIe/nzRR+NzVQwWhPUxv9W97cdg?=
 =?us-ascii?Q?McESjc/aQlTlDgvaNyPv+brVTMqt6SZUwnwgJQ29rn58JbII6oAceAawXh40?=
 =?us-ascii?Q?0x8NIbkXpJMBpViYUOr707PW38nV1uRpLG8c3onyZAl7f79Z6f+ZJu7xvNwX?=
 =?us-ascii?Q?n85oBaLRjJv/5DiFeI3nnaG0HwY1e/dwg+l5bYFKB3GEIWr76rFU/tt8nA3v?=
 =?us-ascii?Q?6DQ8ns2dtVOrstrgrymtiMfRQoKGionFXmSHnFSILIxkX03s1iFkmyfFSGUR?=
 =?us-ascii?Q?uOydu2ykpe6b+e6fO4IKYki2OeP2lJdwfr5M3xLNKzawG/knjE0cA+d5Bvml?=
 =?us-ascii?Q?JbwPKeM+pzEowriehs/Mc4Jg9bwQD/07tma0hKvc3ao9oBDNPAMClLsPi1zk?=
 =?us-ascii?Q?H8SSP4LhZTQOPSrYaMW5cfKOeI6/E4REiAbs+kTubMOJGyQIzmhEMW0KbCfS?=
 =?us-ascii?Q?LeRMBRYs45ZAb6D6aX4F+gO9CpmkegA8tTyJb1RM4gBGkrkZda4PzaVWK186?=
 =?us-ascii?Q?dDIag0pTV/6Smain9j+/EE4wctF4POxOP7OgItWK+7ae2yG6Yt4et+B9znua?=
 =?us-ascii?Q?jkkBHO+lLdyyYcJ6v0nWNnHYI1L6uXvqvSqUKi0D8pHGlTwNHIHIJKOHQprm?=
 =?us-ascii?Q?9zlxym9hiUzaw93UA8P4GIk6LJoKJ+4sd+4eEUX+0EM11oBK/pcjtPC3JgTC?=
 =?us-ascii?Q?W/RsjG2+MiP6af7E4hCaRUusTZOP4IiI7hXyof3JTDFc58o14jPH+pz+9t93?=
 =?us-ascii?Q?9TwP3aP2xUi+xIn7oMgqsEuM4/bqrSBtEG010E6dt43oPe9YAT7FR504t103?=
 =?us-ascii?Q?8EPIu2cyCjxNrdtazd070rdlUIIGaoGurtlgbpWGKqGG1jaF6J16pV0VxTtX?=
 =?us-ascii?Q?ak9ai49hqNkg+gmDkKDqXrytAgjA5Eigd3OnM121o6LN0sC1gXOoK6SaY6I/?=
 =?us-ascii?Q?Yeh2qg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(34020700016)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 03:35:43.1046
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c370c70e-a83f-4c68-55bb-08de54b053ed
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0002256E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5807
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 16 Jan 2026 03:35:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16961

Updated the value(s) for:
  ltp-ddt: SRCREV

Changelogs:
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=3Drange&=
q=3Dd23395da4e67855a7d7ce476e44f79b8e604998e..be5e3b1ceaf18498c4586e9806ff2=
783ab336072

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250930.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250930.bb b=
/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250930.bb
index 25749064..85480996 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250930.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250930.bb
@@ -14,7 +14,7 @@ PE =3D "1"
 PR =3D "r1"
 PV:append =3D "+git"
=20
-SRCREV =3D "d23395da4e67855a7d7ce476e44f79b8e604998e"
+SRCREV =3D "be5e3b1ceaf18498c4586e9806ff2783ab336072"
 BRANCH ?=3D "master"
=20
 SRC_URI:remove =3D "git://github.com/linux-test-project/ltp.git;branch=3Dm=
aster;protocol=3Dhttps"
--=20
2.43.5


