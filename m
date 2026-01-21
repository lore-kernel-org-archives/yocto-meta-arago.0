Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0E75C44506
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 19:23:23 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.38])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20265.1769023398384741734
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 21 Jan 2026 11:23:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=Q4/sRCkJ;
 spf=pass (domain: list.ti.com, ip: 40.93.201.38, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZiwohUu3UTEVqVuYa7A1L5sSxQY8iaE72lCyBJUv1p0IsFeHxW9456jb7k3xha8jdbgNwigCcV6kWriu7tDjqclDSsAe0+RAZsW5BKUMuxsqrIdNMfBJZ244Vffh+EbLnSrt3rv3vY8+JJYMP8WDLNx8Zl9WK/nFbww8zDV3ubhSOgc5Rx9P8iwgxTGh079ruU/d6UdeWU7stuf4Sbe3vRf5isLKAymKn9XmnztYSpvNGZglVCoWlC0eAI9O77aHV+2BEuaW3ieyVEGbcrM+euuAG1w5vrbIdRl4aceAz9bA+tTxeR06s9L4KSvzXWSRw4ovHbTpfN1/eRudbtuXaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3YxdA8+uK1xWw3+6Jn+RqGVdzltvX4o2YBh81rYiqTE=;
 b=vbmgUTk58uSloccc3Rf8B4pWME6fOaQQYYhb5oEmxkdzgnlLq87AlBp7x4O5Z1HvJFFNXawZabOWA4ssA82t6qfZ2fd73iCvESJ/o5br88/9eyhby5F4l0JrvG1BusJyHnnp5oXa/fA42tVcoM8jbnQhUOKwNYGTkcJXoqKctFzNW+0iTZoGOdtFohgSufg9cFOHFxX6mOo8bw3feO/fKFZXheYus36NooWG+J6pniIvIfodyTHW/3CygEamIklT+A1Ox/Xki3ZSDG2hLANMcI+I84ojNOaSzz0mhz5n9h1wqvND5bCcBn/ZyKJ+VVXbrDGB2JU7wIRO1XiJU3HX+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3YxdA8+uK1xWw3+6Jn+RqGVdzltvX4o2YBh81rYiqTE=;
 b=Q4/sRCkJSfrAOeOPotkuocK7V+qK9pv2imlw2AxJsCaKLXA+3DPkprVyRRk5he7VRIjhRzlKmp8zmvh8XOaD7X6p3tWNJ3oO3aV70RND+6HiQViMd7NSiW6QE7Z4FxDKkwkZZhoYObLZvFIIOfq1Xzfw7T3Ji+E1GTIRJvOYfYkymqaP12WwCW+7iYetidL/w6uhXlPN6apXUA6VVKOQFz2zDVKYQyjvQuwQoAnUq2jHZ92RKt1t4NvA7ZfvjobCZzH6lt1h4h6mETkrutXvm17Oy7eyDdicqJMZCFP9R6MKW3Bprdb95Qq3p5N1ioprkCJi6sInJY1y+ao+bxmP0Q==
Received: from SA0PR11CA0026.namprd11.prod.outlook.com (2603:10b6:806:d3::31)
 by SN7PR10MB6361.namprd10.prod.outlook.com (2603:10b6:806:26f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 19:23:15 +0000
Received: from SA2PEPF000015CC.namprd03.prod.outlook.com
 (2603:10b6:806:d3:cafe::81) by SA0PR11CA0026.outlook.office365.com
 (2603:10b6:806:d3::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 19:23:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SA2PEPF000015CC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 19:23:14 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 13:23:13 -0600
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 13:23:13 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 13:23:13 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60LJNDHi3391289;
	Wed, 21 Jan 2026 13:23:13 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 6B61F9ACF4; Wed, 21 Jan 2026 13:23:13 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Andrew Davis <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH v2 1/5] arago-image.inc: Set IMAGE_FEATURES in each image recipe
Date: Wed, 21 Jan 2026 13:23:13 -0600
Message-ID: <20260121192313.3544603-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260121185558.1330658-1-afd@ti.com>
References: <20260121185558.1330658-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CC:EE_|SN7PR10MB6361:EE_
X-MS-Office365-Filtering-Correlation-Id: cfd9d1b2-ffb3-46e6-ee94-08de592285c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?no8GPneaHBlbdyg9FidrUQ1SkF/WCXT7nbYXoOtrcouA4NOHO7grgRL6pv6I?=
 =?us-ascii?Q?lt3gwgHf66GrZstJsmDKChRtmjXuXS/BE1j0GqmC8xRN3W0o//jMKugSIg13?=
 =?us-ascii?Q?xsL/NAFNVDovb5BEAiQMe5UQlWN9tL7S7/1itfc+HVzAVeF5S0gRK8uh89Ne?=
 =?us-ascii?Q?0hVBiGOhdt4YGrnJIxQGCyhqcCR/35WPKvEKtt5Zg8kQnl3ns7ag/hVzdLxM?=
 =?us-ascii?Q?ZdisKRZvqNlijzykgXqSxqhi/ROeulAJ87ZwBBDfuqx9ac79RM0y/XbtXG+i?=
 =?us-ascii?Q?X7NwH+xRgTofaLWybG3GuiZ4F1LcG48GtyPvH3v9CB4G7LoggJFcKiugCWBt?=
 =?us-ascii?Q?YDIOB7nY9LVNeTYR7ErXpZlKJWOmf5rJPXlyP0rSXC7J0+GoZdsw1MD+v73q?=
 =?us-ascii?Q?KmtsTqH+VEHujXK2F4RSD2eejfrEkV4YIqJcz8TdJPzBafE1ceZBYXydhgq+?=
 =?us-ascii?Q?YEPUFuXVP47Fee7Gi0DX4lsRYvW8jJIeW7P0S6UWFO9I6SiQHruTh9grRP1e?=
 =?us-ascii?Q?MI34ICAmajMNzwMgwEmXG7JVcsh7MzUd6UoI+xkqgxb3HAEKhmYx+cggdADY?=
 =?us-ascii?Q?Zd6NzHtRmyloWqmH4XXvTWXWo5c4qBZ4WUcFd4ZQZmT4K9HzqfhrQP7qbgX4?=
 =?us-ascii?Q?p8Xei1N6GWzdx7RY3pEajx3atCe35G79ziEfEAxVM6GPfpJjXF8FtIjxRJHY?=
 =?us-ascii?Q?2xjaHvNJtTDydaxb0LleAnLglx1WGf8mdSD0jm5gq9xhsqLA33mNVdj2T9Zu?=
 =?us-ascii?Q?XHCdIEI9txFIKkXVinwYbIs1zZPyfLF07fskVtR95XBzqODmxoaT1R77zsky?=
 =?us-ascii?Q?j1ZsBbLHp8Zke7eaIGqqntTzaht5fjQPtsYHWjU5QKqV805XcLLtaChKsnL/?=
 =?us-ascii?Q?aFw4S3MvzDOFj3qFlPHjpEbdospYd/KOyS7/Mh1a58USMklRVhYUFhdVHaid?=
 =?us-ascii?Q?1O5NBUcI3QQ3fc+IQnAuPWD2y0jvXZa1/TLrQ8zSIx0qkKLYcPABhclnRf3G?=
 =?us-ascii?Q?VPK5Hs3PFFtWedd7LeXyQFN9K14SPisNiH65qYqU5C6vw0U7IPs/reWhua0q?=
 =?us-ascii?Q?8ZeN3lK60PEsXLWrVP7cyhkXvJBxRNgkuZYENkEoJBFiOZGU2RJPgg2uDU3h?=
 =?us-ascii?Q?DnnfdJDgB9iD7hyo2+gtUxaIMzkcmAQN83fzVkV4Ak9Srg9n8lNuYtLCO0DD?=
 =?us-ascii?Q?4jpIQAnirm89z/bC+6ofJQgDVyujVWm9YASZc7zt6MIf+otPhERO5vvzwK+E?=
 =?us-ascii?Q?J9BX4/duSz8MvisbNDjOaDKvh2Sv0s/b/zFKyX+MLfxVzHwMYoorzK/qXi1i?=
 =?us-ascii?Q?rVRst7fgC1pnLsJ86ZcOx2L7Z1+vN+VD04XNThZG7Swriix8zrYADZdK1HK2?=
 =?us-ascii?Q?s7Dm8c4U4UtUMQyACiypb3jKSs0djy0eY2pbVFRbocizUrFf9oF/hIWoIfuJ?=
 =?us-ascii?Q?QzqpyWhBjI0aaN6QXfXMuVHyfu7EMYulr7Qs2V3Pi25xVVzNO0fSYmu6rr1k?=
 =?us-ascii?Q?9vEpbP40O2eql5Mhl33bsxC1An5evmOSce2+ReWkCDzPRg4gWnj0N7VFj/Gq?=
 =?us-ascii?Q?ULV9Vmj1CBvtVHrZ8Sn5o4A1aDFx6KXiVF3o/XsWt0B8mO42tsXfyRUXxey6?=
 =?us-ascii?Q?V/i/yQROatiRnYLqme47+YhTdMgR7wpDztdU9OPfb07hkBPwft7d6/PsJq8/?=
 =?us-ascii?Q?GsaMWg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 19:23:14.0676
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfd9d1b2-ffb3-46e6-ee94-08de592285c8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF000015CC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6361
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 21 Jan 2026 19:23:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17003

meta-arago / na / 20260121185558.1330658-1-afd

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
WARN - [meta-arago][master][PATCH v2 1/5] arago-image.inc: Set IMAGE_FEATUR=
ES in each image recipe
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-arago][master][PATCH v2 2/5] arago-image.inc: Do not set inode=
 size on ext2.gz
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-arago][master][PATCH v2 3/5] remove-net-rules: Do not remove u=
dev net rules
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-arago][master][PATCH v2 5/5] arago-image.inc: Set IMAGE_BASENA=
ME based on package name
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887



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
- Patch Series: [meta-arago][master][PATCH v2 1/5] arago-image.inc: Set IMA=
GE_FEATURES in each image recipe
- Submitter: From: Andrew Davis <afd@ti.com>
- Date: Date: Wed, 21 Jan 2026 12:55:54 -0600
- Num Patches: 5
- Mailing List (public inbox) Commit SHA: 362b7761f9631d65d2f33450fd28d8ad8=
df06789

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: open62541: Upodate for v1.4
- Commit SHA: bf47628886392400787668c9b203334ce00e2e4d

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
  yocto-check-layers: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




