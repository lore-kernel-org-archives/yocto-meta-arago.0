Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09D3DD43352
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 20:43:03 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.24])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.575.1765485773799780012
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 11 Dec 2025 12:42:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=EgZ2gdpd;
 spf=pass (domain: list.ti.com, ip: 52.101.193.24, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mtKVV8k484sdaJkG1XEUQIXCBcpb54Ee8SkME2u0AptmZv6OJvbghKa388RHgaBZREvvOfmgWgY66gJEbdRVhdv4Zv0jXVMnhyrogNgQUEaZSDAoVLNDKprkmtqFXxqpB+uyLDH7ifZwJBU0P08rKONpqxrXXShHfpErtUxpr0g8Hyfzxvt06EiQbZPXoSDkKVvp+/hJc9usgmyKxYU5jXpFAYqWGL2J+BkJP4eBASTW29Dpc1IiuDU2Cfo2tw9s70Uzjw1HeUpsVPhgmEAjmPRzOIbSGmJKO38w44aFL7jSqAjk9ze9weoCZKxmvZAe9caOnT0XVxhEMRCmIrAtNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gjXpwQM4VLhWgvEktKPAZbtoFvZxbRdjVRmc26/Zx3M=;
 b=ktOPTHuSlnwS9Id1FDgajPraGOk5n0LxFerqK98/cZQLz7Rvp5cdxjzzjdaNslCBmLdV76Rrg0fHAv/MHY9bPPyyujHRa03UYPXsQ0eESJuoveZDeuRmPG/AnS2VO7iSuvaYH8RqfpSqhi5d60XB8b3lZwAr2evNO8sRjkuevP40LPcDe4k5+th4omU4AzRnsoyjcUxzqkivEHuJZZx/UCWPf3zIcfbwOO0JWUvF+z1aVMunj2B2dR/30+WOghJmzV2gV1LPO6mUIYW3IjmiA8GzPxPVMTWRL3Bcmy2I3jSx05n7SmeSBt+L1EHT0GVLS1SkVT8/oNK8UM2z1PQs0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gjXpwQM4VLhWgvEktKPAZbtoFvZxbRdjVRmc26/Zx3M=;
 b=EgZ2gdpdhKtiGUHf4VS4tFUdCYgwOR/nO+Tipn7oS9pdgjJxbuox0ZkCi6z30cTMFJ6XDfF/fuClg/V1B3Un3zXblDJfxa/FtmIyAniq9veXMIMUP5kjbXvolaE6t5j+TXncqSJz6cHAeMgQeaVSwxn3ZdodpDXkanwDNj9sYfqVBxKo1DL8zFmx3VTShGqOV38rokG0y/XnBIglVtWhI3UASS1V59J0p6R+r92ub896oGkNolAL0IEvAGxcLHXU12fFj5EpkS4fD2KbWMzh5kt+TMmidPqSSwxg1RqRhP+B7PGtsD5zBiO4p9Ew+Qsjf78Su1ZaCL+GbvYG4ZGsqw==
Received: from CH0PR03CA0343.namprd03.prod.outlook.com (2603:10b6:610:11a::14)
 by PH7PR10MB7085.namprd10.prod.outlook.com (2603:10b6:510:279::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Thu, 11 Dec
 2025 20:42:49 +0000
Received: from CH1PEPF0000A347.namprd04.prod.outlook.com
 (2603:10b6:610:11a:cafe::15) by CH0PR03CA0343.outlook.office365.com
 (2603:10b6:610:11a::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.16 via Frontend Transport; Thu,
 11 Dec 2025 20:42:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000A347.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Thu, 11 Dec 2025 20:42:49 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 11 Dec
 2025 14:42:48 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 11 Dec
 2025 14:42:17 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 11 Dec 2025 14:42:17 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BBKgHgG2895240;
	Thu, 11 Dec 2025 14:42:17 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id B4C849ACF4; Thu, 11 Dec 2025 14:42:17 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] tisdk-tiny-initramfs: Bump IMAGE_OVERHEAD_FACTOR
Date: Thu, 11 Dec 2025 14:42:17 -0600
Message-ID: <20251211204217.4133357-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251211202640.4072124-1-reatmon@ti.com>
References: <20251211202640.4072124-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A347:EE_|PH7PR10MB7085:EE_
X-MS-Office365-Filtering-Correlation-Id: c7313019-aad5-4abe-1526-08de38f5d934
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?35vnKr7CTB1xlqBcs3rUpbU/+37c314Y2LvG4qAcQqEtTu8Ctx+bG/mzBgT1?=
 =?us-ascii?Q?AhyzoKmUj2417rsGc4n6YTU1EGsLdZLszecaZ7iuT5c6kEhIn3JJbMjRD+2Z?=
 =?us-ascii?Q?iJVGNzkT3/nqlKMD3DtUmgIWR6irCPhrCkO3I7mQXEjT+rASXPZt6kOzPHya?=
 =?us-ascii?Q?or8ENJd9JBJHvqqgFRgFezkYx9oqf4bJJUupU2G+yRQLQplrZr1qYbMdwg2v?=
 =?us-ascii?Q?+sDZst7TOJV67NkNyv/W0cngOxkas6wBwl3+FgjH9JhrCh9aV+atpWolYQve?=
 =?us-ascii?Q?pshK/154HowznLjTKgxJbcRCRwEcz+zTN3deMHPEMSZ9q+td5of2RdzLiA93?=
 =?us-ascii?Q?GPseodlhIxPY7prdqhIPOHDFBOSSzZa7T4g3dvNtau4FJba/JGVxjytCO2Sb?=
 =?us-ascii?Q?UPQJ5YYRdG72QYP90OiSi5BnxCQQcqLW32zFZ6hvbp9AyZA5gKdavkE515Fa?=
 =?us-ascii?Q?hQ15GkVRWsBQhJ39ZTIE3VPPb4KqA86Axl15i5ibDQHItsEZ55Mjf0q8gvkI?=
 =?us-ascii?Q?wn2GY4d6fUHC/pn5RJwresG8FY7GtpzQi/Fz3VRO4J4WG2Gm/79fFTn/Wy0R?=
 =?us-ascii?Q?CjSeu8WSpPffUIJsuZl6IY3nS8Ls2zGcrjjj+fQGgtP5hO7HW1wm22Ie3rHY?=
 =?us-ascii?Q?xidvFr5w9bV0CIYn/tmfhd7UV85Si57x6qQUTXp/rG382aQSg3kkfSiyq9C0?=
 =?us-ascii?Q?ouSBueOaKSzEN6fWTfwPt7WC038fTkyc9JVDbzYyal93h54iCH8V+P81SbHZ?=
 =?us-ascii?Q?nNZhQiDuPF8GP26BBFv3UFv8HzhbeT2gq6xrzVKq8nDv+HZheKvNPUp7y2TU?=
 =?us-ascii?Q?WvAIE6sEJVpACUGhoF3uYoqfqBuY1e7y487/QGtQDcHnt6I0rzX0LGVlubgC?=
 =?us-ascii?Q?ORnuw1sCCAbsy+uz+3dkc1vCPe2TspWbZXtVsstP4pYsllJOCdsvxArn0vI1?=
 =?us-ascii?Q?BdstoK4bC6DhehmzGX9ae3MqgpEnjCEE9ShLnsB73tKBK1nJhqoBFIIPlkKk?=
 =?us-ascii?Q?92uGrqVL+P4l73pLHUtjo86o+p83I8c0RSVSXdCNQMIMD6qRErKMEsHUIPxr?=
 =?us-ascii?Q?UK2eX2sMineK/1fRzKQumNkEwGVPySAcOFS/vyoV00Z/XdbvpoWDCOYOZJrw?=
 =?us-ascii?Q?60e1dLLKKE9Cpt+n1ibfLmQs1aWFO39mUc3+1mKNFZKCqdNFBPifDbkP3etk?=
 =?us-ascii?Q?aN032dNQIGHRG3OgNbv57PFchX89aA7M8p7F4SWCMUNYnKio5oOwi/Dl99SY?=
 =?us-ascii?Q?x1j98hNaCksturETvioNz3CP2X4Nmk9c1/W3OajjJLG4n3oz1K4z3F01cx01?=
 =?us-ascii?Q?u3mbJZN5RiuRLGi4YSRFB7tXq12tPfIWgoTSR3KdW1xubYqk/KvhXJ4o3Rvy?=
 =?us-ascii?Q?F4m6KCIDnF6Jcp/nZpMehPNVY6jlh4ZB6634MtEgAbMKqIBRYLUqCQTFXgMp?=
 =?us-ascii?Q?PupLfqm1bZIIlZm/Uyn27Gu6Qz4Cglhg4p0BIlZbn+KxKigD/rQxAlY/cuax?=
 =?us-ascii?Q?pLQ7AkR7ldSSqpfwPFfHZWJuNv1EJ8tbJvuiGkIV7mpksobvRAAzgywnzNRi?=
 =?us-ascii?Q?GIBfC+hDDDnW/fvGw2s=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 20:42:49.5026
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7313019-aad5-4abe-1526-08de38f5d934
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000A347.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7085
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 11 Dec 2025 20:43:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16886

meta-arago / na / 20251211202640.4072124-1-reatmon

PRC Results: FAIL

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
All patches passed



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][master][PATCH] tisdk-tiny-initramfs: Bump IMAG=
E_OVERHEAD_FACTOR
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Thu, 11 Dec 2025 14:26:40 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 6f42bbf9a725b28e0fb361640704621c5=
a1bb81c

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202512040100
- Commit SHA: 410e1081aaedc1c525825851a9df7748b49cb659

Patches
----------------------------------------
All patches applied



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-repo: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master - FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
ERROR: Nothing RPROVIDES 'libxml2-python' (but <build-dir>/sources/meta-vir=
tualization/recipes-extended/virt-manager/virt-manager_git.bb RDEPENDS on o=
r otherwise requires it)
ERROR: Required build target 'meta-world-pkgdata' has no buildable provider=
s.




