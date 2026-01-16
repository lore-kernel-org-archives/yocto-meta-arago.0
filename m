Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9108FD4A5FC
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 04:18:31 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.55])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.477.1768537110512025045
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 15 Jan 2026 20:18:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=pWGqwg7x;
 spf=pass (domain: list.ti.com, ip: 40.93.198.55, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yEyl8l9KWndTBBynFCA0mKylQoSR9EIKvDK6hvsM3oC0fYaQu2tidLQskw7MbWL/3Yd1atZcVHZtBzVoYjEieZzjdrv2+Mq7I/vXA18h+nFX3ymErSq1B5D/ASCTExTdQEUskeuC3+PrlpW57YCur1qbnQahuu9eTXxgYZYdmyuvpjad/CxaWUjZIunTBv94qXmLbmCWqs63zMvjGMGXLxx6ZDyN6MPG9P+c1hzv700GwVIR8JmATWsTPefqR6BD21Cr7Z30HnkKS7CUwkJA08/juTb4L8beZbOhDzCVFtBIOfJ99nppMLyAj4vw77HXjYwyIIMauwvWeFPMFHGeXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9NI/sEgnJ+HRv9C6fpBrISlavAKIMAodsrUVlaKFAY4=;
 b=TiBRE5XbkFxcZQarJ0WnbiuergP7ujOoOeorB8eaYNAcC27l4jiEKzADR8FwoZW1b0Y9mvM5OWyACxOjIk6bGj2SMZPPeVvPEDUVrUiNIEkWxrmGRJRqrUiV5thsErLcbHzeB91459hU5f+0vRvcJ89ShYXoAqXz13/zEuQILSrSs+3RS0mEPxBeRz1kR4Db4GIUQyMUp+oC5ULhMCwJrxe0cyppTuTh3pb+AUFKCeK1OG/M7s/uhMfq7rLxZqKx/N9iuOjEavFPbKi5RtQkX2q4h+kwfdA43P7iir9F23GEzNMBpyu2SufumhidWPm3FJFsEqwCKjC/bNUNsRoPyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9NI/sEgnJ+HRv9C6fpBrISlavAKIMAodsrUVlaKFAY4=;
 b=pWGqwg7xoO1HUZpXkRbsmdYVmdwhnIXhSteZO45qB4aVng+G7UJSftH4TqhNff7qmDO0u25hihJ+xgyC2R9AHUA+DmBuYcgFoie/2DHFcjMVbbPkTs/OGJBf7qD7SOFLjjqT7MRewFvqjVRDZOSPe8m+prUuPd3h2YrTd7sYA8ItJBSnLaEHP6xi4EK2/85QJvI1nOYmS7I5wQCpNNCUJLzZUCfk9vAhe5lK0projFOvc4zl5MsVYupoCDsuPpgYFVuYc4lr/2gNVOPryOsNgkO8jMMeg6LO0x9js52kM2/P+6E12wE6pP7p7CYHDbfsXeWoZI+sa/fgtSf5CDGAmQ==
Received: from BN9P221CA0029.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::27)
 by IA1PR10MB7335.namprd10.prod.outlook.com (2603:10b6:208:3d8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 04:18:27 +0000
Received: from BN1PEPF00004683.namprd03.prod.outlook.com
 (2603:10b6:408:10a:cafe::db) by BN9P221CA0029.outlook.office365.com
 (2603:10b6:408:10a::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.6 via Frontend Transport; Fri,
 16 Jan 2026 04:18:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN1PEPF00004683.mail.protection.outlook.com (10.167.243.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 04:18:26 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 15 Jan
 2026 22:18:23 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 15 Jan
 2026 22:18:23 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 15 Jan 2026 22:18:23 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60G4INPY564834;
	Thu, 15 Jan 2026 22:18:23 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 434B99ACF4; Thu, 15 Jan 2026 22:18:23 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202601151800
Date: Thu, 15 Jan 2026 22:18:23 -0600
Message-ID: <20260116041823.2059491-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260116033542.1562473-1-lcpdbld@list.ti.com>
References: <20260116033542.1562473-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004683:EE_|IA1PR10MB7335:EE_
X-MS-Office365-Filtering-Correlation-Id: 157ac9ec-3ca2-4a65-75d3-08de54b64b8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|34020700016|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?G9VW7iu/S3BhpdGxdaE4g9stBs4vJ89H+oNWtCEaaRetNPVVb3s9NVWDZBXF?=
 =?us-ascii?Q?bM36L6GvJj0+w1lnbmwWODRRLzyXFLHafCyxaeX33BXr3E52SBh43pvJex1s?=
 =?us-ascii?Q?O8iaE5qUqflM9mKXlcQS2AO2vUWqymzx30AcJF1diIoG8Hcf5YRGKlRZU8yI?=
 =?us-ascii?Q?BRnp5L94lu03U0whhfWNRSAW12XjG3PZx6fskapQGGU3VrFv1DZ4CYa28pZo?=
 =?us-ascii?Q?4xZcfzlnMcc5+AA9sxeNJINjL1l7SQQu9y57TYVkhEQr4Dr171kiLivMVay1?=
 =?us-ascii?Q?EDFsKP0fnrBkHa8Mw4q56du0eGNdk3ciLy9d+8kxgwq5b1RFod3MjlZhpdg7?=
 =?us-ascii?Q?ICbR9uhM+mnUtmHe+sfTrM0maxl+Y51A4cALaHtG2AbI3p4soqqHGtYNk7sq?=
 =?us-ascii?Q?xNTbt99Wn9tLN0+HL+7VF8yAL79XlmBM0nsJkNQuZC/Wdbx3Hw14vCXEPOrI?=
 =?us-ascii?Q?XtA4oM7xp9lmn/2mhHG1vmZjg9cnQoQsqSIvjs8/nSUJp/goTfqezJnE0qvb?=
 =?us-ascii?Q?5R1Un9IjrWE5PHFLDkYEf7PyvWcNZG3WDHqD90bwBnC5PUP7LSpyP7jR/506?=
 =?us-ascii?Q?mDQzGt6Tqw0xAiWPEIMpwU1uguVct1ifeR3w27bwtWxI/DOzE3/ngpdwS8e4?=
 =?us-ascii?Q?RPq2k7L/wk1kyWCs3BNAuSIAT+e+dHgJswZ8Ex6hpoZ7hAfzMEpv401krdsi?=
 =?us-ascii?Q?QwIuf70adUf8+XhICxboPRwc7S1Y2Fn72N4hMz4whDkjP+08vuh2N5uhExUv?=
 =?us-ascii?Q?kmYxmxhCnSXxN4i1pSNcHcQPsXt1PQ2wKuyWzP7j6mTCtxCYk+22wU4W16X2?=
 =?us-ascii?Q?BGx4aVe9nr+M/fCZcY7NjVwKRHvmX+rvDg97eC4zlFIDy0A9wBIER922miSU?=
 =?us-ascii?Q?FeHpNh/K8BvsBOqDDIVvTqwXRgOMHm18yfCpvWRd8hh6gnTV390Y21lk89dw?=
 =?us-ascii?Q?KmjRMCLPXU4hKBF/3b8Jp3XnjNjGeMq7CDEEX4RQwcCYGoZkXcgP0FKYpsh/?=
 =?us-ascii?Q?CkD4Hc5bAESSPDQpQBDbodzB6KhP9sdf9YWUd349tw0aV3oioCogHUSN7YS7?=
 =?us-ascii?Q?HXHGMNUsBl0fDQ62Y+iI718bZYCkbReKxg6EIM6zu6GSbi/Y2BAXWgyf4NHp?=
 =?us-ascii?Q?Za7rMusY25md9NSojqrlSuchQ8jdzPkxn3xb7kv4wYuQD3Jh+0N2K4O2MYzd?=
 =?us-ascii?Q?Av2KGFo29cfkk884PyuQ6ZQBAFxb9jLUbDpAcfdwddhMC8McTwxCgWTDG09Y?=
 =?us-ascii?Q?6/WTifNEy4bd190Epv+J2JSo9yci7PBXB6ukP4Y/fNMyu18sIzOSjizMZf7h?=
 =?us-ascii?Q?kTEej8fCQhXDkcc6WHTap3fQ5P72uhMemPjO4WhbW6GPR8kul/GBqIAX7PzV?=
 =?us-ascii?Q?ep3i0H31JHxLs/+x7O+kZfepgqeUbeFvEPeM/PWNzFZMiY7v/dX+VVX/pSMp?=
 =?us-ascii?Q?DNTXMfclWAR5DbGitZttxJgfTHdMhH96lxCs8SApFRNDkADJzTd99WYsWS0/?=
 =?us-ascii?Q?Q9hS6PZC6DtOPhZR9szm2+DZtiiBvRMzBubDQ+ZQUoX8mr439zlqyYznw3Fq?=
 =?us-ascii?Q?HrBWJv1ocKyXV/X6ulPvryTONsHGkEFki8sbRZXzDMYoeFyhwGD9J9EuFS5e?=
 =?us-ascii?Q?DXrQnRQG8OsbQ2rzoMADFC3AykuCtyd7CE5f6mYoCJOI?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(34020700016)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 04:18:26.0397
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 157ac9ec-3ca2-4a65-75d3-08de54b64b8d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00004683.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7335
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 16 Jan 2026 04:18:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16962

meta-arago / na / 20260116033542.1562473-1-lcpdbld

PRC Results: PASS

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
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scar=
thgap.202601151800
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Thu, 15 Jan 2026 21:35:42 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: a8cb78f56035204da66a11324854c1a19=
0f7bb42

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: ltp-ddt: Version bump to 20250930
- Commit SHA: 7e9173a5edb5b433d713520d15ba0164189ba64a

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
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
scarthgap - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




