Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51C7AD6CFC4
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 04:58:05 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.15])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61185.1769144275586844372
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 22 Jan 2026 20:57:56 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=RSaQWwDf;
 spf=pass (domain: list.ti.com, ip: 52.101.43.15, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FQYf0KQh4hStK8FdEgrdgrCd3szd3YiaR703H0qYoTNImQIys34UtWYiJXlQhJgHxs+IAB2LcJM306h+LOni7QOnixDm2+0ML5OXe2TAFILSOEYhlf0qoJijTiXbmriS7AGsq9WTomou/1zm043RqBCY8AbKTlp6vqu59cGcrKcK3unXcMkqPFfvzcmTU9bmOkQ5E6ZDYLJC4Xd1EWlbPYGPir3cYh7sv9xFeCgwOATunh1p/A5Y88o+pZguB+tmEg4OAzwaogdA6XoPtqyYayypBJvanAbcE+Mya9dLXR2wiDR7GLdImhJxb2MUoq+nPDJlGTQ427EKhC/YUnFxPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xra9m2mol27e5jkVWTm5QS+Gt9DgQYS3m4XcSnS7FRc=;
 b=ju2/KsiozBke/AxPikpYWneFfNNcQSxoHAj0Z3RA5/EAEyv2Zq4VaMASsKw7PV9NdAFsgyfHTyiCw1+pIZ0Rry3ZmkMggHQV4RB+bX1ZFVBIW39p+B1/6crdM8JzucXlLARsIks0Q2PWAnXEkDqPuLjq6z/bJno+B+rcC5hJ8isG9QXWP60mtEIzRwPTezCNT+ETWwEy1KOcfiUkKibGXS+iapZ/ioD5x1nwtxgNRE8J7jF8i1OT62b1rpRKjJEm05Dbksiem4nIcfvwBR7jVIXwF8xNvUTUEbBVZ4es6ly7zj1SDmBh2/S9Bz+Uodz6fdn3mICnlGN+X4ki/fAVLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xra9m2mol27e5jkVWTm5QS+Gt9DgQYS3m4XcSnS7FRc=;
 b=RSaQWwDfdDrYUGz7Ej8iTy+WR2EmqfhuliK+iUkbBHmGVwCcAx127xlLi78se/Kd92o/iH4Klkg6m84stVBRLYd/63I/qxPREST/UAFpKCoVjOTjxX4HR0zxQKrg5RjdClWVbc+35thdzP1sb21iksH7+QSm392Bko/98RXo36EyEkpMOTveFQMz8oYOuEojJrAGtR1LkzVZFvNs9UjYl7c7NyiYT27fC4tAWOqjOghWnvhaXlm9tPiiOkOiCh9fx4H0AQXnP5zWnJywpiDd9nRcAAcFbrU9pi5+JPTvIuE131FxIKP7Levmz0TFnbWYvWsxpZv1yu2IqysZV4oh1w==
Received: from SA1P222CA0069.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2c1::29)
 by IA4PR10MB8710.namprd10.prod.outlook.com (2603:10b6:208:569::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 04:57:50 +0000
Received: from SN1PEPF0002529F.namprd05.prod.outlook.com
 (2603:10b6:806:2c1:cafe::78) by SA1P222CA0069.outlook.office365.com
 (2603:10b6:806:2c1::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Fri,
 23 Jan 2026 04:57:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SN1PEPF0002529F.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 04:57:50 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 22:57:49 -0600
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 22:57:49 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 22 Jan 2026 22:57:49 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60N4vn1J1607996;
	Thu, 22 Jan 2026 22:57:49 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 8DB8D138B5A; Thu, 22 Jan 2026 22:57:49 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Vishnu Singh <v-singh1@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>, <denis@denix.org>
Subject: Re: [scarthgap][PATCH 0/2] Add Zeroconf networking support for Dante DEP
Date: Thu, 22 Jan 2026 22:57:49 -0600
Message-ID: <20260123045749.1789381-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260123042812.10342-1-v-singh1@ti.com>
References: <20260123042812.10342-1-v-singh1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529F:EE_|IA4PR10MB8710:EE_
X-MS-Office365-Filtering-Correlation-Id: b6ee2741-2ad2-479f-d145-08de5a3bf584
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?qlRYAI9JmWdJZl2zGGIIWgBz/q8KSHdJTm1gQM5yMnDbLaUW8WygxMngIgQv?=
 =?us-ascii?Q?vZmtK56hfUEI0zPkE7auu6qItiL99g18yP94H7EnxtCQwc0fO3p1pcvVXEz8?=
 =?us-ascii?Q?0/ZWaldZaVOrxDU/FKZBMQ7D9oXNEmLltAe571ACSDknR66DEKRdH7prR0H6?=
 =?us-ascii?Q?tHAPoTnIs/LV60NYUqrHDDwUISFBuX8jkNSmea6kzCJuRb8q+0bQxJ7XMb2N?=
 =?us-ascii?Q?fcuspm/QfkaSASGG5uRClT2gZrFuM+KXN3aShdTump6eXyBFqdAPfEOG1iN0?=
 =?us-ascii?Q?vg0uKuVdF4e4FOrz6oXYFpfXEYjqegsutTrzjDQFvqmgRPef1krfYL3zqLNA?=
 =?us-ascii?Q?IOVhvXcmka3+wmuD6mMejC28V5cxtQ4Iju/qVEROuA+v9tAlz7kveVFVibGT?=
 =?us-ascii?Q?FxAOhEVIpBzIdfNWWUkrOwjU+PuTaN/ug2vvGI62AOGCQG7W4+qVQHOiQjyC?=
 =?us-ascii?Q?PMFUem3gQJKRlD2sxKpbdFGVmSj6SA4zEtPJ+gNg5Ic4kVNyxqrxjUBEEl+M?=
 =?us-ascii?Q?8Qdujo8gSl7+LQsTAVnOvLs+1e5yamqULyBKcWERMOeep7NwuaTf7lQjDGeN?=
 =?us-ascii?Q?X5yK0Bm0m6H7qvzYSyxDDr078qjhcW0UOrY3Vj/pkDhboNLTgYrL9X+QOMwF?=
 =?us-ascii?Q?iQ62+aCsZfJAzd6Stv/xBn8lxwdmu0vTrfpZYAHB+2rDptCtlXPIT7Lazhg7?=
 =?us-ascii?Q?XYFuFZJbf72FpEZK1mZWXXhfRQ4JvhjXWHMFqWEDxcjnIhBJTi1VZIyW2kca?=
 =?us-ascii?Q?38bl+MNyx+CNldVNd3zPAn/I1Z4gPeZswp8EPqEbJbg4gj28wuIsyFnA59f1?=
 =?us-ascii?Q?Q51rzy0MHLyT+CU/ZIyKs5+0YyR1th/i60dHxlB06wkmOMuHfhyxLwICSMx6?=
 =?us-ascii?Q?6m2Sf46CBpb1cxY3Pw0LZ+W1Hj4KJq+jw1oyT5+z5kOAaSINr0vci3H2Y5l7?=
 =?us-ascii?Q?7GuybxqQol01rr1sGi2BU7j6vqmnuaXgzU3fbUHhXm3Sc/S0kk6PRpijJNQr?=
 =?us-ascii?Q?WrYBTohmGzgtzuQ8K2vzMSQ05mA9XKFP48BeYm3S46kCbkT+hofFOgw44ymi?=
 =?us-ascii?Q?HNjDDSm1funSiDnbyVH41bjOLXQC5onCBSQwX6l280kXwcO+E21Cwzk0im96?=
 =?us-ascii?Q?QGQmE+Wd3ZPMCQYTNa9S+NTZLU1i7ZdhhhqLCw8Yj7htCjgHlvtYo0YwwjTr?=
 =?us-ascii?Q?piCj/9blVWy7oWZHGsmpypbjxS4WBHVPMcVBxWIsowlYZRTWWy3UwWl643+4?=
 =?us-ascii?Q?rP3SJEbVlMDuqF9AFgHeevGHypTP4Q6eSjx7VA0A9EmCz6/q5elmt1AeFu7X?=
 =?us-ascii?Q?fuMITpxSJOJoMwYjDDN0M8qsdVIk0xA7gmYBcO4J3y/2ul/rhsBnyLyTMFJl?=
 =?us-ascii?Q?7tNDMnErE6VJ1eUnYqTCN59qxEivq+oUIArQqhFffLMperNR1Ub/gUhma8iw?=
 =?us-ascii?Q?bKDPII/0yYzynnYhbVVGvtSlnsG9kTpWPgyTVX3xVicVHC0WoVath362L/zR?=
 =?us-ascii?Q?Ipye4m2Gwk0N83lVwYuc/UeqHa66f+lW9QTQi7vlYfZOlWTl3C4otx24tQWw?=
 =?us-ascii?Q?DAoekaRCXl2FMMJr0o9V6oBNrcvkHZV3x+3Vb3z7zhxAG+MFoEiMXEJJZhhT?=
 =?us-ascii?Q?+ARZ4Onr4bT2CWK4Zmm3JdWvYL0CVS/BKTqhjHh+V2DctbE9xuQXts+7Pl0v?=
 =?us-ascii?Q?HzKSog=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 04:57:50.1520
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6ee2741-2ad2-479f-d145-08de5a3bf584
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002529F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8710
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 23 Jan 2026 04:58:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17019

meta-arago / na / 20260123042812.10342-1-v-singh1

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
WARN - [scarthgap][PATCH 2/2] systemd-networkd: Enable IPv4 Link-Local addr=
essing for Ethernet interfaces
    WARN: Commit message does not include file/recipe name: systemd-network=
d: Enable IPv4 Link-Local addressing for Ethernet interfaces. (COMMIT-MESSA=
GE-2)
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
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [scarthgap][PATCH 0/2] Add Zeroconf networking support for =
Dante DEP
- Submitter: From: vishnu singh <v-singh1@ti.com>
From: Vishnu Singh <v-singh1@ti.com>
- Date: Date: Fri, 23 Jan 2026 09:58:10 +0530
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: 2568c9c472ff1772e3eebe978bbfc2c16=
85d24cd

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202601151800
- Commit SHA: 63f45c3f6fce3d67aa65cf964cc58640de0b5a27

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




