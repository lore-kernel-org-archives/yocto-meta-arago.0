Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B339ED3B981
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 16:26:53 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.35])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11877.1765297603738371206
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 09 Dec 2025 08:26:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=cBXNiEo6;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.193.35, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lnyH/ii3QHYdK+0lZh+ocHD/zy+92iWBU52EZxObjdrs6nstPEV/QXdS9GXITLqeZTsD23yHE0XHhUKfBtJUpx0/mVywBuyKF5/pXFP8POlYG/V1TDRv8FAQtAn92pGY9UsY/vgzwbCypYfNGGb7bvTgPACcfa7rm3srjgVOF6vx9fzBUlQJ5XZAr0/pxBG4CI9LDQA+E/JjEvOcvv1Bys0+b9rQJDRy7USCRnVo4gSjZCPUJ+Bvqo4fS01lasNX3ztGLWy/SkdUxSc4ufSmm3nuTzX2gUIM5IMAaQbCmJDxW9aq6DnqbeZkLRnMJgGHRxrNlwYeRphcLZlJvzdfyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZlcvzoyMQQfIY3AhEMGmKD5InjfCSUlM1iOVFs9AU2w=;
 b=SMH48Y0ap7O0DUpKo615SEzlfGRIVjkaIerVqNGk/7IR3r7vzus3FBsfR71g/DT9eCWALhjAtU9QrpBtUBGcE2Q7Y5cXFAPslxKOI928u3VjoGV7aoGyXVwq7sNDF41uPlz1+0h4CvNabh8qCFdIY+coFbCrQwRM3BIXHJK6lM7UfOpkA9cP99rK9PwfoFiI1xIlU/dFTVibgtT/QzB7jA8yjSNuMcgHD+1EGMs3NO/JSB03MINmIpAb8HA+Yfbj5rQxBTn/Hr78pZfyjkLeR6BSmLvxlKrZ+JVbbN/vcFh5nFd4tTA73gXDBaO98HKNCQL7skEWA/1e5DVGRitH0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZlcvzoyMQQfIY3AhEMGmKD5InjfCSUlM1iOVFs9AU2w=;
 b=cBXNiEo6oWS9APnNUitSh1eqn7x4pepTGZtj9rpJtfD71dqQZwtvQyM/FVxU9MKbQX0ss7OHl6ETsqzlen6OWHEG0N+7OpLhoKqEv6zUYkuj5pK8EUvytOQzDjVLS9h5nTrzkbK1G4Zgp8PMMoW7PnQPb3/SgSk/aR9m1kVHmuc=
Received: from BN0PR04CA0126.namprd04.prod.outlook.com (2603:10b6:408:ed::11)
 by MN6PR10MB7423.namprd10.prod.outlook.com (2603:10b6:208:46c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Tue, 9 Dec
 2025 16:26:40 +0000
Received: from BL6PEPF00022573.namprd02.prod.outlook.com
 (2603:10b6:408:ed:cafe::8d) by BN0PR04CA0126.outlook.office365.com
 (2603:10b6:408:ed::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Tue,
 9 Dec 2025 16:26:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF00022573.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Tue, 9 Dec 2025 16:26:38 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 9 Dec
 2025 10:26:34 -0600
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 9 Dec
 2025 10:26:34 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 9 Dec 2025 10:26:34 -0600
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B9GQYNk1490032;
	Tue, 9 Dec 2025 10:26:34 -0600
From: <a-christidis@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <denys@konsulko.com>
Subject: [meta-arago][master/scarthgap][PATCH v3] stb: Update false version v2.31 -> v2.30
Date: Tue, 9 Dec 2025 10:26:34 -0600
Message-ID: <20251209162634.223382-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022573:EE_|MN6PR10MB7423:EE_
X-MS-Office365-Filtering-Correlation-Id: ad0e6a1e-0659-4751-523d-08de373fba79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9x9AJXAdmO99261qK2US+JY24kxFFSTtkpm9QUVKudza2iS8aZD+Njam8xEL?=
 =?us-ascii?Q?uQ73vgGDSY5z/0O4qnCosaXxlg+vRpzTEE3dSeh8IUrkEiD0B3IhP1hTjGe9?=
 =?us-ascii?Q?xoSPqr9VQqFPScYi+BUExJI4iEOZw5pwCZ4D8i4ILQFEQ9q+AfIh278UJsml?=
 =?us-ascii?Q?I6jwv2VaIs2VsXT6DMWWadg7N+ipBmJ5B2Ld4+5E4KwxblQfIPtDrRQ8U4SK?=
 =?us-ascii?Q?eu9KJtnq97ef+RGziKmmMjPJZ3lQ64ptp6SSAWEseecGb/eCGf3LKW0IrNPs?=
 =?us-ascii?Q?DBkxECWy0iYkQ94CtbEtGmsxKB4roTh4uCWZqnTlJhR9x6Toc+SJTVzqB9jT?=
 =?us-ascii?Q?RojH34yNFi6kS2WSMRT3wg4uTGa6SLd910S6UaxUb1+FJVoGtf6ip7RDDuO4?=
 =?us-ascii?Q?x9VdCgeNYV9/i5NDJECPV/yMAWusN1DrPMoYr7pki4/LRoRw+5L0RRQg6thG?=
 =?us-ascii?Q?PyUUmiPOcSatGwE16c6vcaAUTR0ni2HoZ4sYTZ70wIGbAapFlQt62MCjMFxp?=
 =?us-ascii?Q?w58D2hqgSCdOQ2mdalv/PONeTclHeeyUoRlR61vUNf1xObaScz6Q6X7zNg9S?=
 =?us-ascii?Q?I9zsfrkLXMA9QRiMd842rXvFwKwGqWm6oy5Ud+w0ZbzD6al+aZ4eZGGuytPD?=
 =?us-ascii?Q?F5yPdnbqKdPcZXaf7iEQSjKbZYKb3NtBVoC7/x/SpjXPMvv5AbmH/3YlVDr0?=
 =?us-ascii?Q?BGJ5gInCH+0j6JsTbaC6dRyttGamzQPsh36m+7Yg3q4vFpxyySVttvhhkx6S?=
 =?us-ascii?Q?kSXB8q6534APHUZpmAkKCNipyb/3NmraMi/Tc4kpqvDA6icoMpvBHgptt1Ay?=
 =?us-ascii?Q?lIvnChVlKj+z73ZZEB9v8unlsQ0ScrpJKfQAqUehM6cH7UMV5WpAahnbONug?=
 =?us-ascii?Q?vTkSugpYjG9a9F5B7ly6Xa//Yje6kiU5DQzZcEDpNiJymSwj9Jaw9O4XBdC2?=
 =?us-ascii?Q?QO37Os6i7wJS/bgSbs14TtgjNxLESqon/2zfFsklTO3OsUv4o9fzD2sqBxP8?=
 =?us-ascii?Q?7OzSuX63bie/o5trBfhNyx+Nt8icZ3969FCyCkXzuwXTfZnuwkK7BESDDtyu?=
 =?us-ascii?Q?Qfg6B4swWV36n4ZwJOGhde7ssNxqsmoSDE38ByV1L1wBlSjtvoFagfFMW4CK?=
 =?us-ascii?Q?ggSsoPtUkVcNPPwRx+Wpi9Fj7eIfDE5x74KSyf5o53OOfC+71SU862BguxKc?=
 =?us-ascii?Q?NM1AkXOCPQ+959f8UUO3q9g6KSZv57IqfHcj6VGDjOg4gcnVQuYd5xSMcNuy?=
 =?us-ascii?Q?VQEp+t/BKsR0I2igIooV53l6KLLmGU2IM28eNTXiPEiboL40kacwVQciBI6m?=
 =?us-ascii?Q?PNtr7ztodCqRFpAw1kn4SajZoNS+4InStp72dJsc8x914knb7uvE9IWoOLdc?=
 =?us-ascii?Q?h8yVcKSB/TXoQFGhRlakr/2De3Bva8NGO2yGsVFqPXCqHNw9hmCTxKEZI/DK?=
 =?us-ascii?Q?3b0PTp7qc/UunMt7UuPPFTZgaJcASZrGJ3IFuag8KirLaAYFwAKyxOfRtfYu?=
 =?us-ascii?Q?jwHlaadPQa/y/DXJIS/Bcd9PkOEwVgoM3UosLnOLkx6UNGdhx5oFc3irpXTw?=
 =?us-ascii?Q?+QxdZawueKvOkZcooH0=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 16:26:38.3544
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad0e6a1e-0659-4751-523d-08de373fba79
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF00022573.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7423
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 09 Dec 2025 16:26:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16877

From: Antonios Christidis <a-christidis@ti.com>

stb is a header only library, that does not have an overall version.
Instead it tracks individual header versions. All header versions can be
found within the README. The header with the highest version is labled
v2.30. v2.31 has never existed.

Also update the commit sha.

License-Update: README update due to new header file library
(stb_include.h)

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
v3:
- Add epoch since version is going backwards

v2:
- Add License-Update reasoning

 meta-arago-extras/recipes-support/stb/stb_git.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-support/stb/stb_git.bb b/meta-arago-=
extras/recipes-support/stb/stb_git.bb
index 7b0b6452..18e3fec2 100644
--- a/meta-arago-extras/recipes-support/stb/stb_git.bb
+++ b/meta-arago-extras/recipes-support/stb/stb_git.bb
@@ -1,11 +1,12 @@
 SUMMARY =3D "single-file public domain (or MIT licensed) libraries for C/C=
++"
 LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://README.md;md5=3D42144ce827adcfa5170032f0ea03c=
227"
+LIC_FILES_CHKSUM =3D "file://README.md;md5=3Db499fad62f2f8e336bbea84cc94d1=
e60"
=20
-PV =3D "2.31"
+PV =3D "2.30"
+PE =3D "1"
=20
 BRANCH =3D "master"
-SRCREV =3D "e6afb9cbae4064da8c3e69af3ff5c4629579c1d2"
+SRCREV =3D "f1c79c02822848a9bed4315b12c8c8f3761e1296"
=20
 SRC_URI =3D " \
     git://github.com/nothings/stb.git;protocol=3Dhttps;branch=3D${BRANCH} =
\
--=20
2.34.1


