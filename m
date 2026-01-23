Return-Path: <v-singh1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16A8DD6CFC4
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 04:28:35 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.10])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.61438.1769142505069904878
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 22 Jan 2026 20:28:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=r55hUKYR;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.193.10, mailfrom: v-singh1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L4fVnY2okEJje/JlI+50F3pXTSyiJVgvVjSDCAzznmanr/69uijjzQ+mQnt9SpxNAc/CkwajEjRKpqQ04z2KgJHPC6D1OQ61Osz688OeCtfnchKpqZg39B3jMH3+ckoZ8uu7UnkTxz2xv7f31HaXFtsTYb/SpI+vFKDKITmedz5x0kcEkK5TrBidBcPF9d1DrOqU+rIwyGDNd9w/xExR4Z3voToAKTZUQC1F+K0iSU3uGPFPlq7cSYBiiLAL/m8zUZCPnkXM8OWs1yW/s1XlTqaxbfgg22qjzP7nimwmWgCFk8KbTgYELLrtC4CcKrDekVxCiLEZUQlPN94n0FxDKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h2pyPWJP/weieQ95Tw712YUMl9eEypkQvr/+JxfokQ4=;
 b=s8lhyjx3+UeGhW7ilXdJbrvTWAPcwfUYOaMLocHeK2KAJKE7a3vb2qGMpAnJtgZgYp5aVSRdkhShkQUPmJg/dUGykGblonnix1QcONY3hQEwMNTJcUdmbKt3gk8WqZLAkiLuprqUQJZMWiBJx365fPcMwKgbs579Ta82VPRu/MGWQYJ3p4ZC2bias6h4coLkBvrKcJ1PDhJ7tWptCuqvvPdSjpaPmeiuRp1txETdaiSK/P9IEZm/UBx0zBx/0+9tvFrB/vZwLMmvL1YDvWA9jmcogVg6BgAYLcjB2CFssDqLox9q1lWMAz8sLERg7vnrGOxh9VYWc2ZUJFo/EkvxSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2pyPWJP/weieQ95Tw712YUMl9eEypkQvr/+JxfokQ4=;
 b=r55hUKYRFMG+XsTzK4uKjYoebsRiw9aYclUOG3crWMzHATGm0nxwABkrkD4buO+ef2ige7hvgVrkWAh2t67op/nsEakKsW7+IvD8A2LVUhdHnQ4UGqyVzGoDnJnobaAsajQr1uEk9T6fpec6/f2gE7uNal55ylFgx/qlwXSHcH0=
Received: from BY5PR03CA0009.namprd03.prod.outlook.com (2603:10b6:a03:1e0::19)
 by PH8PR10MB6316.namprd10.prod.outlook.com (2603:10b6:510:1cf::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Fri, 23 Jan
 2026 04:28:20 +0000
Received: from SJ1PEPF00002319.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::7b) by BY5PR03CA0009.outlook.office365.com
 (2603:10b6:a03:1e0::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Fri,
 23 Jan 2026 04:28:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF00002319.mail.protection.outlook.com (10.167.242.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 04:28:18 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 22:28:18 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 22:28:17 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 22 Jan 2026 22:28:17 -0600
Received: from uda0513920.dhcp.ti.com (uda0513920.dhcp.ti.com [172.24.233.77])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60N4SCMo1574886;
	Thu, 22 Jan 2026 22:28:16 -0600
From: vishnu singh <v-singh1@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>, <denis@denix.org>
Subject: [scarthgap][PATCH 2/2] systemd-networkd: Enable IPv4 Link-Local addressing for Ethernet interfaces
Date: Fri, 23 Jan 2026 09:58:12 +0530
Message-ID: <20260123042812.10342-3-v-singh1@ti.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260123042812.10342-1-v-singh1@ti.com>
References: <20260123042812.10342-1-v-singh1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002319:EE_|PH8PR10MB6316:EE_
X-MS-Office365-Filtering-Correlation-Id: c3260a95-64fa-4557-c929-08de5a37d5b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?y3SNtAXl1gYKw3PO+wx0o1Xya1HoN/Hm5XHsQb7S3lRtIMWmvvcPi4n9lZbz?=
 =?us-ascii?Q?zSza002CgmEtygmMUQiwBIF4+2GqVaUrdqkAnXDrfRT3C1uC84TGB857nqLP?=
 =?us-ascii?Q?9fP/QFINzvqu2EktDc+Eta6JMl+83TYkcZ9Pq3v4PKdo75vbilhGQuxod0jh?=
 =?us-ascii?Q?PIgCBFSIhPuNB8gkqacIrBd37giAs2ntvqCsMj7uKd/YUawCoQ/kVXIt49Du?=
 =?us-ascii?Q?VR1cqW65hVffQsNBv7VnS/g9jjKuyX/UN9zXYHDi+6sWv54I0nv1NsTajHFq?=
 =?us-ascii?Q?/6PgK+WxmKC7SlgC+B/BilirUggMgq+Vhc+qv4S48bWz6x8mk9giu5N//rzH?=
 =?us-ascii?Q?QhoNyvgcf34y4BZM6LETWltIEtcO4f+ari9n1AJvV8s32bvq21A3oWd+9Bht?=
 =?us-ascii?Q?Wlvl1nREn72tInKw7OZtAVCMzYC6GL0GuxM30A6NFuD5NvXJG4i7ZTpOQ35T?=
 =?us-ascii?Q?iSPZz/dOe+y6nStGLr7wJLSr1uYXj6xtEAWryyd6aejo678s7v206vquWJXv?=
 =?us-ascii?Q?aF53BqwF437/cYPme6tNGjZ6cy28u0UVo4rcqVU0y9EXX6l+vF1mUr9WlJh+?=
 =?us-ascii?Q?vfyblhiKcjOhEInvvaAjzGMpOZ+Y/KUJd1dYr6OGLAht+qQkMKrXXsZMFrqz?=
 =?us-ascii?Q?q2yPTUXEfb1srYEIjpZFHLQxJf5BROWNpT8vw3zyU173GfZSSAlVkY+bBm0f?=
 =?us-ascii?Q?EsDB8b3AuuFNdV7gmcBaIPaUnCxtp/vM9ZxpFAR+QSbtgwWATbWsQCKVlypU?=
 =?us-ascii?Q?DC45VqPl9cV1s1deY3vBiqHVzsxuHXSQOfr/A+1Q4l1NoMjnWtwiaqZoPnE9?=
 =?us-ascii?Q?W4cv7XdwmNttyj3Z99py2n0m9V1kg5/lL0RVlkA8ICVXEMuTpAKSsQDWYwsd?=
 =?us-ascii?Q?14peZEI0kapehwR+5EG3jzqlzNjP+orY9t1eNVBYbDdyZdiKkLAO1isqLUC+?=
 =?us-ascii?Q?6xR6h5tyzan6aFoAFJZb7Hbyctpyg3dVztz02VqQ2abGzHRZNmBAgfL4etwL?=
 =?us-ascii?Q?0DVxWORJ/J1V5tbgcHzqI9eKeqWVLV0xEyiPToWGlzm+R8NcEj+OpyGc52x1?=
 =?us-ascii?Q?6qG/iK1SmzG76UTOHPtQx4421SIcQUNksYztdGOk7855o9iZwN9ZSknymjud?=
 =?us-ascii?Q?2xFv8sRwIpWQ143hAzQD+sPBfXLtIg9dbZev0pnG+e+CuQGYh6XXWQUVqky4?=
 =?us-ascii?Q?P7UD0uRImXz5G28TulswdUylrTLm/Yljg6zlSmpyFA/dAuXQ68ImaWEwEnqh?=
 =?us-ascii?Q?0BGNLUIzccFMccjk6RmT1HBCs7J99HTAuktZqTOnjFDb2k7OzAzdNKZA+jAN?=
 =?us-ascii?Q?BWETatksUxYcvBwVHJvH3rSs9YxCNMa5BIZQvvWlrJomTOdbIrKFWFQxc5Mo?=
 =?us-ascii?Q?5wucRj3jgUj8z/ngNYzL1P9nHfSHub6eMQ8MGbfpWG2VbO4+5BwhxhgOcmun?=
 =?us-ascii?Q?HOFpHKKaYh9J2HobSEJXHj9UKXSHFEyaeoS/gSu4nA5I5zguRx1ZIAL6qHu9?=
 =?us-ascii?Q?j0/xPe7pMPij5FgvzBnauekDqXnMXRd8ptFy4Ew5nqNc0moMyDJS3R1zJWJQ?=
 =?us-ascii?Q?URBwe8BKt36i9RAcEAjRlyJ0YwXcPRUv0IFIThWvPom36jy80D/G5za/MKqR?=
 =?us-ascii?Q?jClIx+p7VOhr2LD03rBECHpBhiSZEik9n5ExAhQXOnZM5baopGYupSrknCLz?=
 =?us-ascii?Q?GilmRA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 04:28:18.7058
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3260a95-64fa-4557-c929-08de5a37d5b7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002319.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6316
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 23 Jan 2026 04:28:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17018

From: Vishnu Singh <v-singh1@ti.com>

Added LinkLocalAddressing=3Dipv4 to the network configuration to enable
automatic IPv4 address self-configuration (169.254.x.x/16) when no DHCP ser=
ver
is available on the network. This configuration applies to all physical Eth=
ernet
interfaces (eth*) and USB Ethernet adapters (usb*).

This change:
- Allows devices to communicate on local networks without manual IP configu=
ration
- Ensures addresses are assigned directly to the physical interfaces (not v=
irtual interfaces)
- Maintains network connectivity in zero-configuration environments
- Follows the RFC 3927 standard for IPv4 Link-Local addressing
- Provides consistent behavior across all Ethernet connections, including U=
SB adapters

The Link-Local addressing serves as a fallback mechanism, enabling basic
network functionality and service discovery even in the absence of network
infrastructure.

Signed-off-by: Vishnu Singh <v-singh1@ti.com>
---
 meta-arago-distro/recipes-core/systemd/systemd/10-eth.network | 1 +
 meta-arago-distro/recipes-core/systemd/systemd/15-eth.network | 1 +
 meta-arago-distro/recipes-core/systemd/systemd/60-usb.network | 1 +
 3 files changed, 3 insertions(+)

diff --git a/meta-arago-distro/recipes-core/systemd/systemd/10-eth.network =
b/meta-arago-distro/recipes-core/systemd/systemd/10-eth.network
index b16ce4c3..aad5e194 100644
--- a/meta-arago-distro/recipes-core/systemd/systemd/10-eth.network
+++ b/meta-arago-distro/recipes-core/systemd/systemd/10-eth.network
@@ -3,4 +3,5 @@ Name=3Deth0
 KernelCommandLine=3D!root=3D/dev/nfs
=20
 [Network]
+LinkLocalAddressing=3Dipv4
 DHCP=3Dyes
diff --git a/meta-arago-distro/recipes-core/systemd/systemd/15-eth.network =
b/meta-arago-distro/recipes-core/systemd/systemd/15-eth.network
index be47a01f..0aa8b22d 100644
--- a/meta-arago-distro/recipes-core/systemd/systemd/15-eth.network
+++ b/meta-arago-distro/recipes-core/systemd/systemd/15-eth.network
@@ -6,4 +6,5 @@ KernelCommandLine=3D!root=3D/dev/nfs
 RequiredForOnline=3Dno
=20
 [Network]
+LinkLocalAddressing=3Dipv4
 DHCP=3Dyes
diff --git a/meta-arago-distro/recipes-core/systemd/systemd/60-usb.network =
b/meta-arago-distro/recipes-core/systemd/systemd/60-usb.network
index dbba1898..73e5587c 100644
--- a/meta-arago-distro/recipes-core/systemd/systemd/60-usb.network
+++ b/meta-arago-distro/recipes-core/systemd/systemd/60-usb.network
@@ -2,4 +2,5 @@
 Name=3Dusb*
=20
 [Network]
+LinkLocalAddressing=3Dipv4
 DHCP=3Dyes
--=20
2.50.1


