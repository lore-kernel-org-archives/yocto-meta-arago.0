Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A27FCF58F0
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 20:42:51 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17219.1763584966373188251
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 12:42:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=AtiZo4+h;
 spf=pass (domain: list.ti.com, ip: 40.93.194.51, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ytN12h+YrCG5qM0UMKNlWVZW/rN8kZzfU2qsmrf+dAm0VRup+BTuQL7McOXvMA3RlWAzGrCzNlHoupaYTOnf4oreJzWZjD/qI2KXkonlnBuD7VSNphRXIsu9xk+TjGc2VZNC5dnjvXKTnqpVqvPezMvK60JmJxV0z4+yivZ42lR9t/3kQ9vR80j7lyfSDkGLx1qlcL1+y94ST7bHKnWSRgjR7cOLDOEYPpsuVYx7JbCNlGtRCEAj17yHmDJqj7D4iuNLwfYlmXUMiy0sTWJ00q9k0/KskyODyGlsE7ejto5bcv/fOZ4E/nQsMHQzbfjRfR6y5PyLfHEherShb5cUXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wc5fKq2f5hMcpJTyonB6bdKJYTBeGhyErsFI0VH6F64=;
 b=pSEYqnAhAWXn5LXlRM0zd04Tadq7ON4yTGaUERT3eX7WkqgtdNwdqF0nSJwWl8BzaVrQIeXBlvBZxduRqnxe9zhHXLM8vxHTrb1tpsgbxb3LOZYYYfVgbafMOz4rKGFVkvtjLW6XRLsmSLdReBYgshPLsN41Pwgui7t7FqtaMhodpLwgcprsiaT25K+n9rvz/pQx9G2EA9RHe/RE5/yradcGJFluqneOeyYRRVoy275AwpF3m5nobSugdMQFnBCMcVvtqqgM1K/2yBYI0/SZRXoCfxd10YYyaXxrRcfqyC0YtIJnPRvQZ3s6fV4DzRMbFyZDcpGDHVn+/3jF8tzrgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wc5fKq2f5hMcpJTyonB6bdKJYTBeGhyErsFI0VH6F64=;
 b=AtiZo4+h8eXqEpp+xC5x8U5DSEG5Ph6xuW+7CVk4nAgRiM/Bfi3x9iIfzDn6mW6PPTQRMExTypk0SXiOnQW1qLGKL0K0wVvwb8vq3axA0ijwYNGuI3h+Swv+HIEyaT4bndYr04PkEZgYUAFhZp+OH6neYu4do+BhVaivn9axD3LvxXZqJSj/wUy+T63ba/xRzDENSdF3C6O0LFvAu9+SX4SiD93n2WUBP3/7XyF3JR31XQfU6n6HdA+EuJM6e5o4xFopXhJi1PahOKYCEhYQh+LWnCnzHpuNRr0s6jpM1Rev+fy04Aek5LzV7hcMoHyLkfJcsoYfi2s7ige4GtMZaw==
Received: from CY5P221CA0138.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:1f::29)
 by SN7PR10MB7032.namprd10.prod.outlook.com (2603:10b6:806:345::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 20:42:43 +0000
Received: from CY4PEPF0000E9DA.namprd05.prod.outlook.com
 (2603:10b6:930:1f:cafe::7a) by CY5P221CA0138.outlook.office365.com
 (2603:10b6:930:1f::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 20:42:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000E9DA.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 20:42:42 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 14:42:39 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 14:42:39 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 19 Nov 2025 14:42:39 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AJKgdIG2499546;
	Wed, 19 Nov 2025 14:42:39 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 4E8679ACF4; Wed, 19 Nov 2025 14:42:39 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Randolph Sapp <rs@ti.com>
CC: <reatmon@ti.com>, <denis@denix.org>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] udev-aragoconf: remove legacy usb rules
Date: Wed, 19 Nov 2025 14:42:39 -0600
Message-ID: <20251119204239.2463768-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251119200836.362773-2-rs@ti.com>
References: <20251119200836.362773-2-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DA:EE_|SN7PR10MB7032:EE_
X-MS-Office365-Filtering-Correlation-Id: d3035207-ce82-4368-8f74-08de27ac2ff4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?q1ksdqXTUdNFuwNapE4dOTAwDr7ZUuDjeyAp7UXg0GdW9HMRheWF6/x3y1jU?=
 =?us-ascii?Q?izToberDPAqpzcFLUU21WdWh9fu5uoDAsOpcemp4ytVMjTLpgXAjEPFo76fR?=
 =?us-ascii?Q?RWoYH9v/WTeKdRJuB2fPCQ8+hx+6WnJz5Pf8xiAPmSVhcqY/Xs3Cy1hM1vYD?=
 =?us-ascii?Q?0Zij+wU9lit8aeeqyFID6uVOH3gKNOIm9kvqBzWuFdViv8v4IVv1UgtZac7a?=
 =?us-ascii?Q?CWrT6xmtaPdWlqXsnRg4R9TVAqChEPKqCocjbGI7blKHP9nI+RXZDg6skZp8?=
 =?us-ascii?Q?A4lb8mUyDZM97o5HcQ1Bozlypo17BUYNByGL5stm+9D0bWvtwLFFZcSvHL5J?=
 =?us-ascii?Q?10iTHbPIkX4ntDgRDHgf2sRCdgrjvCnvslraJKhUYxOIMSgm+U5xDhvTaihW?=
 =?us-ascii?Q?ZKqIr/vVLVZqfrvIU8rZiqMqef1sl1B1tGTTCAVzyuaUZBELfyQVQElfF8XN?=
 =?us-ascii?Q?DBWzo9I3cicadyQfgvjC9AIXdy1Tdcvb2yXeWryiyVxc2rh6U0eGBkVBC41h?=
 =?us-ascii?Q?BTd6LFBoICgpIycUaSuuttwbGKWUwSIEazuQ+7CUogP61xPYziXHLrUn2uCM?=
 =?us-ascii?Q?U8dVuzr+vLRmhpYfVIuQ4up3FQh+B8Av4TjEkqlHa5yNFVOKJBdo2qPcO9V1?=
 =?us-ascii?Q?E2q994hNP7fs05cwyMJTlJerzG9LDkHW3lGrDmh5GJO0PHnlyCwna/s8xdVT?=
 =?us-ascii?Q?rUu6KRYO5p9BdZZUvwgsg4GlwHd9x3B6fTXScKD9llPRGd5qienZowC8C8rr?=
 =?us-ascii?Q?sIkCuzjseb7eXx605hXOuzvYqQT71uD3immlVvfoS0zlyqoZp4/8mhf8/6NL?=
 =?us-ascii?Q?XpTDdIJEP5XStPXSTtnmPtpxNu9Ha6yY4hxNrh8EI7DzzVBdInKLD0vB7ZEp?=
 =?us-ascii?Q?he5U5NNNXxTk9Sn77FHcG8pK4g0nUKXpfB+DQx//GRYEyXKIeGOq5oFEbiBL?=
 =?us-ascii?Q?hvijyNgM84RbAoPieIH0HaqQIWygC58O3vhnuGKloqDkHFEWcnkA8Od4aYAt?=
 =?us-ascii?Q?lExTpOCRjmfYVJIMWuF7E6zKBDTyHTWJ4tNebGq9mL5Hg7Q2A6fbfj0HfKFn?=
 =?us-ascii?Q?9ZSCrcMUgzG79/UsizcA3AlVrGZqmIR+vMdBjQRNFItz21OHHOkcQ5+MB6+7?=
 =?us-ascii?Q?VeVISvKI4GU/BAN2rST6YjqgHPD3HJVGoH9DwGljS1bjka8wEnccMQNGS1JL?=
 =?us-ascii?Q?0rLw/79r7pOH0KdT72N4m1JKfg6B5ybEeyTPWiPCEWOthjfAyrMosgaITIcn?=
 =?us-ascii?Q?eoy3zwK6OChxccszrbdCxBZL1KwzJcTYRxPEZkA2hRUJ6PyNhM6ifYOjjvJx?=
 =?us-ascii?Q?ufLG8lPk0JUJ9QOSFw2xsIK1n4TkUYVc7dUHXtHVIKHPvIIai9gE9FJKGHbD?=
 =?us-ascii?Q?p2EuyRgrgk1pJvNU4NdXNTIypNvv1q2hgSZSloEHa40SGQqbARi0dEwC6yMk?=
 =?us-ascii?Q?VTGscEG4LB3W6k2/RPajeO7r2bTKT1XtvgovhaXfka4l+sjdC1pay2p9Fj5t?=
 =?us-ascii?Q?+39eSHDiy/IBaUyW9PkT5AZScODLgdRrhJBZ+PYpsTxQ/P6v/51ieAIkdjHs?=
 =?us-ascii?Q?qU3/GV8yZ6RWD65Oxn4=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(61400799027);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 20:42:42.4701
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3035207-ce82-4368-8f74-08de27ac2ff4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9DA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB7032
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 19 Nov 2025 20:42:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16803

meta-arago / na / 20251119200836.362773-2-rs

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
WARN - [meta-arago][master][PATCH] udev-aragoconf: remove legacy usb rules
    WARN: Commit message should not include directory path to recipe: udev-=
aragoconf: remove legacy usb rules.
              udev-aragoconf: (COMMIT-MESSAGE-3)
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
- Patch Series: [meta-arago][master][PATCH] udev-aragoconf: remove legacy u=
sb rules
- Submitter: From: <rs@ti.com>
From: Randolph Sapp <rs@ti.com>
- Date: Date: Wed, 19 Nov 2025 14:08:37 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: d8faeeff0c68ec6c93fc13f450ce1f07c=
8169990

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: sadik <s-sadik@ti.com>
- Commit Subject: coremark: add Coremark CPU benchmark
- Commit SHA: 174dd3e5fc6920bfcf7ce267ff359ad2c302e469

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




