Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEEEAE9A03B
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 22:04:29 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.59])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23849.1771365861469245185
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Feb 2026 14:04:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=eGEaw5kc;
 spf=pass (domain: list.ti.com, ip: 52.101.85.59, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GuoApD8vmzNcgnTt+7UwNqFW5bgJiL3iw3eeG41UVbkTSTua9TBFC1ehTvfWKHOhicBgqlY+nyi/3AMK7vLtE0Cmkjpqe6C8k6X/V89y1SGnvU74chZgn5KOc/brjlc1jcu/CvAPWIoxtUtfbcMYJdeS8Nk7Vr40VgNqafGEt64eh195XkIg+dmEVL5/L/dw5YB3dWLtywLDDH7i1ZQnd2nUeI5vqkK/Sc6W5izypaN8ipXBXEO7IyHx5y6/zX/LHBAZtGBujzXjjxv6WSj6bPa4l3Q4BowhhF1dtH0LM58QHUP6kDbP/43OsGYNCYYHPJohIwUPAzdfrKRJg770yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m8fqjNNvvyebV+CpDmQMWCz9aTBf6fVtlQmux34+q2U=;
 b=eTJ7TcOOA40OnzXQr3ymFgaIiO+eR3EMiUGul2qFYLYiM8/XD4UUnNc0/fvAcVagWLPAUfS0Aqh4SIdw9tpFr3pZnga5xdNcVPDWM8EAj2chkhdJy5W0QR1oUWyvfW22+dJb/WSB/TA3AhuiUitCcEwaKouJRBgABj3HaYd/FZkt0kfkm6R4otmsFpexUQk1ng7liNJLytJSelf8A/H9yPGwfPwFPClUJ4npvYhB8ZB7nbFhGD7uz++12YGbtVst5ObJrvHeqYJ0udcneJIn5aWp83c3qssR9nuydPEgwz+LNI0YLye0OBEcT3/9jsUYESqjNHRavE3Zpvd6UO9zaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m8fqjNNvvyebV+CpDmQMWCz9aTBf6fVtlQmux34+q2U=;
 b=eGEaw5kcZtH7UhPe+B8HxV8MYy19U74xIVHBLsZwfwEuvOuTsc4N59+A/UMyif74dJCZw1xeMjL2F1WzuCsp2r9cHVTeTEp3A8EagJZNbxIA+MFN3Ds9FAJgkfuzm+DmGNarflS4GmOjNGhpmWocUytOVxxLEe1ysLrk8IWqeytVOzZWzG3tDT3a4S4p5MxfbFetCEt4jok7a7UbaoHVNVoSMhI3/jpLRduG+7rHqqlOwf8FqYeGb0TuS+FeItZkRpgt28gB4GoYQF7KX4o9IrLkB4ymBD+tTkygiNy1IHh3/2mYvHFIi4003tfI3SnVvmANWutTJMvNXk7iyq/I9A==
Received: from BYAPR06CA0070.namprd06.prod.outlook.com (2603:10b6:a03:14b::47)
 by MW5PR10MB5692.namprd10.prod.outlook.com (2603:10b6:303:1a3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 22:04:19 +0000
Received: from SJ1PEPF00002311.namprd03.prod.outlook.com
 (2603:10b6:a03:14b:cafe::8e) by BYAPR06CA0070.outlook.office365.com
 (2603:10b6:a03:14b::47) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.16 via Frontend Transport; Tue,
 17 Feb 2026 22:04:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00002311.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 22:04:19 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 16:04:16 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 16:04:16 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Feb 2026 16:04:16 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61HM4GTq1095690;
	Tue, 17 Feb 2026 16:04:16 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 158759ACF4; Tue, 17 Feb 2026 16:04:16 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH v2] xdp-tools-arago: upgrade 1.5.4 -> 1.6.1
Date: Tue, 17 Feb 2026 16:04:15 -0600
Message-ID: <20260217220415.3936559-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260217214715.2135461-1-reatmon@ti.com>
References: <20260217214715.2135461-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002311:EE_|MW5PR10MB5692:EE_
X-MS-Office365-Filtering-Correlation-Id: eadf616d-cbe0-488c-ccf3-08de6e707fcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?o9PjVCrSBOD+viiuV4x97umJ11VwcdV2T9/enKGC/D82LB22wEllaYp0fJLH?=
 =?us-ascii?Q?/+uqaKWsdMqEUkF5NpMayAkFgNWP3kcoEyISmnN28vDlZieHAZGLXk8/aPvG?=
 =?us-ascii?Q?X125gDWP5b/vHwNyewLu7MtCbYBHW1zgD87CA82F/59/ey+Zu+kTwiHYHx13?=
 =?us-ascii?Q?LsKW5s6/sJ1JAwKI4kQiconViQs43Jp4zKZ6s6UeSwj0zTzp4yk3Mj2dvbz8?=
 =?us-ascii?Q?Hx6Myxqyy5UAHmjSnrEV1mRRid3qeLmwB+2TyWJuVeC7mq7Kgt8B4HfcwSRF?=
 =?us-ascii?Q?4+7PwGt3n68NDJ1HiKjnYtM15qvjcpJC5UauqXyw3yBMbveIuFcb0msnSjDe?=
 =?us-ascii?Q?a+NifG+tpA0/P2vAHOEn+jubIFs4toDhCfnn3WU6OQy7ZNU4x3q97vTcJhLB?=
 =?us-ascii?Q?aD4dDqrZxwZvj5YVOguGz7ZwmqNtoEt+y0p85kEidPHlJYtxbaIZpxotNjke?=
 =?us-ascii?Q?MdM6E0VzhGk+//Egf3TXfYTxNQtoDSIBqpz5gsZn8MB3QxuGQmTnX9COkkRY?=
 =?us-ascii?Q?9bZTVBz/YuLLNAoVj5whrSOrvVq4OQ+IENCMFpUL6su3hvcFrY1cyI8zr5wZ?=
 =?us-ascii?Q?Sy/ZtR5Tng8lSFK4hX7l8XSeRZcEEHyAwAxUjo56iAljaVxxUh7wxc4dEhxq?=
 =?us-ascii?Q?UYdyltayCnt07FMGMBPkbpYCa2btJUvgq6YQZgWNhUkq3cI6RNYwDEP8Wazg?=
 =?us-ascii?Q?IL23hSaYpkQWqJvH/lXwAs40BSaQdpakILbfCznRcRDnZ2DtY2LnNPg1Mje5?=
 =?us-ascii?Q?RdzYm/Wl9emXgDlWTIZugmzFBzRuwrG2bbmSBqHfKj6m29tLIg8YfelSzD3b?=
 =?us-ascii?Q?b+PribNj62zgV2y0MHiSnzmttp2ayBTN6nO7Bz2/u7eXpYaMbh5t1jP5K3tk?=
 =?us-ascii?Q?oD19kyyZvUe/CIza2KSuBr+lg8JIYz7KaFCf0ZDgMgnJr3SfFbqqPvFWhQ3H?=
 =?us-ascii?Q?dUzN697roqoOwL5rM/Wj2z6M2+1hmoj7t6jvhwuDB/7Ow/yxWSbMtlepltnx?=
 =?us-ascii?Q?EDAofTVANeTaPgkBzlCLpVsG0TfRL1A3mVfWogHA3d58AP12zW2uo3uu4pmT?=
 =?us-ascii?Q?BlMY29wPk57dAYVkdIWj5aIy4l1PHA+v6nsboqblxSnXMsTHxEPFSTpNikIe?=
 =?us-ascii?Q?OBpL9i6qYRBS077cas/XRInh48caaIkO0qel8uXE8foc57wXKUh1MfvAFW4Z?=
 =?us-ascii?Q?BvX+Z9H+g5UCG4YfhzIk8S2YTLN6ZSHcTRqzCy4GxHuMGIlM10ZWimBhe0ux?=
 =?us-ascii?Q?l29OTrdiNy6u1m1asVRJgRoJODV0WYbBbbVEnP+Q716ZIcPI5U+VBX6MBOBD?=
 =?us-ascii?Q?Wvs0BRlbnlCoef3Q8uTjFvM6tBOf5Q2yo/RtHsGIbvhqrJKSxYoOo/oJRV99?=
 =?us-ascii?Q?/2grW8QBg8LINd0LK0r7TQ7NOqaeE09mAeqo55whPQrYHjAMBz3DPvVRZRyi?=
 =?us-ascii?Q?R3vJ+FPEJ3EV6uYTt4pbJL9h+0uQ3vel74HKxJVRjqAqVKnbpxM/o01bI+uM?=
 =?us-ascii?Q?vWmVd1B1RsVDeUcIcny/rQFk997LsOYn4yjyafF/iPIq/Md6lvzJnsYgMdS5?=
 =?us-ascii?Q?l6FuNf/np4/MudfekaXdkTtUvoJGWkZ3K8lEvmk5al+zgru0CaGMkRD1Dwi1?=
 =?us-ascii?Q?WAQdPzIXPTkVZ6fE5/UdfD7rKQeVe105gE71ffbQOJPI+QtpLIgO79VReLVQ?=
 =?us-ascii?Q?2AQXog=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	xuTapblr5iJi54gy/ysJfp7bqZUTqzFDw1TgdIkiUtAG94ZcTnkD3KBQMypERp2zanYJgSQLtunQFZltumeN7T8bRBZmRmuUpXjtxeHtlqgiw9mLqjfJdzWxixyhfksuvaVqHoypa+xPq8gazTJUn1Ar7jVV3qeT5CMLzWT8AG3AzKRRIWyWPLNzhwjh9B1b1Yxp3a4ufuPBcWZD5DrFXxWyMjFAPyPAreTTPR+cTjzyB4nQ7AwLK9tqhMFoa2ateC7aU2f99BuHxeNaNeDn1Ck4psftYwOrvvjjMILqzj1/7KWKmiDkemLIE0CdHNNr27UshHWBKsFOUdjpnjEOVrpDZvjyOff579oc91AwRwWvYapqxyNZ6YKqLtuDOZOZ0hCb9zuF03hoopZzFSsr0b+PqGnJRs3iIQ2V/d4aKt4JSBpLQQpk59MzDL3bGWUd
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 22:04:19.1297
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eadf616d-cbe0-488c-ccf3-08de6e707fcb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002311.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5692
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 17 Feb 2026 22:04:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17113

meta-arago / na / 20260217214715.2135461-1-reatmon

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
- Patch Series: [meta-arago][master][PATCH v2] xdp-tools-arago: upgrade 1.5=
.4 -> 1.6.1
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
+From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Tue, 17 Feb 2026 15:47:15 -0600
+Date: Tue, 17 Feb 2026 15:11:18 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 107bf66b5e4fbff8c22b5a86c453c1b46=
ba93282

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master-ltsprep.202602130934
- Commit SHA: 61171ba24123649fe6cd3ef567ca3e767d9a7d6a

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
ERROR: Nothing RPROVIDES 'systemd' (but <build-dir>/sources/meta-virtualiza=
tion/recipes-core/packagegroups/packagegroup-yocto-builder.bb RDEPENDS on o=
r otherwise requires it)
ERROR: Required build target 'meta-world-pkgdata' has no buildable provider=
s.




