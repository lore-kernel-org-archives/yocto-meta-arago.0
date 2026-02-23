Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAB8BEC112B
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 20:37:34 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.27])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4575.1771879052629530966
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 23 Feb 2026 12:37:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=YurAnq9S;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.48.27, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vfsU2NckOaMJWloqrvsrjD0YPgIW2n1r5lEzGq9PPsf1v13At0V2v9US4LEFgdnQKfXtMGS/G0NGvtj78pN76QwprM3BcnF4v95aJc2IKO6qiN6iJligSacqOioy1ugcXEhTaApPIoXxgZmFsRuSpRzBBzPF6lRhMGWt/ERvvvSwrGl/lYQaBJQgbJ4AVCzkN0FsrxulpGm8mm/LCq6uu8/rTI41KrfOs4b7JgE4wIjgLguCD6EEdzhD2CkYH+5LoPVcebMbnTbMjAXOnabqVSZGfWOVCdazXxorZ+Gkv0Cpj9uGJPpTRmTJfduI0fTkGUciryzkOru4glz++vqpiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OYrQYteEiconiY14TxoZDmytzqKcGSKZMzrQqGQ3AAQ=;
 b=lH1ZCUXU1v6EjZ64WBZ/Z47cBSRL5nC5QgDbbPZfipHMr8jaqmw1OZdIkG1NwClhP3ygpb9y+M50uiacYJfw2tPQ6Y1CR3O9Aavd4RbqozKL4SKldO8gYHApgTBw/8Bv2IkptV6YNv0wQGhw0l0+fEiCdTP+AyIcwY9vCzy6DNxCs95Z1ixkCgij7fImvmZjPvE6iMFZvs0e4YsZEVlwKKkhk2XoCi8V5+53dVaWX+SNGvkjRtwIdH8oRvma3+1tr+tJZr/7DehXFokH0r+8mozNNqomMhOnTh04C7nXmSdq11Ofs2cgXJfToN3xi91KuzvX243V1MXtrYpQdLeUbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OYrQYteEiconiY14TxoZDmytzqKcGSKZMzrQqGQ3AAQ=;
 b=YurAnq9S8Lto3Fo78ULViCqdWTbV+n6ICDKLtnlbrdSSnNU/QQURSsMT1HShT7yH3njqDJ5h0+gFtsncrn31BsBBtRg2oWKXvm2Dkyq/uwxn+Ic6V852a5DElf5svfXkFRBvvDtctOXHEoUm7wMtny8++Uk9VdqKAltRbO1pHVo=
Received: from SJ0PR05CA0183.namprd05.prod.outlook.com (2603:10b6:a03:330::8)
 by CO1PR10MB4785.namprd10.prod.outlook.com (2603:10b6:303:95::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 20:37:29 +0000
Received: from CO1PEPF00012E81.namprd03.prod.outlook.com
 (2603:10b6:a03:330:cafe::1b) by SJ0PR05CA0183.outlook.office365.com
 (2603:10b6:a03:330::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 20:37:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF00012E81.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 20:37:27 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 14:37:27 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 14:37:26 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Feb 2026 14:37:26 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61NKbQbn980462;
	Mon, 23 Feb 2026 14:37:26 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][PATCH 3/3] kas: regenerate all configs
Date: Mon, 23 Feb 2026 14:37:19 -0600
Message-ID: <20260223203719.3644542-3-rs@ti.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260223203719.3644542-1-rs@ti.com>
References: <20260223203719.3644542-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E81:EE_|CO1PR10MB4785:EE_
X-MS-Office365-Filtering-Correlation-Id: 56ee7977-542c-4ffe-90ae-08de731b5c1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?LdXFBOICos7DPo1gxUWTvzWwlWXu3tsD09ClRxJk7mQFud3aUA7LSRjxaGjS?=
 =?us-ascii?Q?i1e0E9bF9tfdLkL2Kuqr2tEMB5iG8ta9sgxqrYb4vocvlJG5Lmh92tffQWdk?=
 =?us-ascii?Q?36R2HaQwCejF46CQjNDK6T4MjM508ld+1UDV6cH17hm7WyyMxbYAZDMp8yv8?=
 =?us-ascii?Q?m/qOZG8dIzD8ccwo2yOpOlQspyAWgWvsHZ7e9M2khY6Xbf9GP9lLjhdHpK6U?=
 =?us-ascii?Q?inF4NmfgDJAyVH1opbf0SY24x2QBZCfnoSt3MJVcsK/dMkyQQzh1WpYqQNOR?=
 =?us-ascii?Q?ZJK8EoHFJRwiOr0l+fd58qTcD5BUGhBbJ9PwzYgWX/gEcY2tZGDiRydvnaAB?=
 =?us-ascii?Q?jpzjze1YD2CgRW5+ycxBtObvlefl/OsD0E0eDDU/gF6OHYJs21BY7tJwDFfe?=
 =?us-ascii?Q?0iZFBvMOP01ZuNqLzyAqfL3WmPYVkAdMZ4q5FzPxOWKWTu+HNoljnRw4tgNk?=
 =?us-ascii?Q?GfTyWz2lOkajWgCt0Clvnto/4PcaFXKIy++yOHG2IwbEIuGQnJTpqUvjO1sU?=
 =?us-ascii?Q?daJdBj6YmuSa7LFtsTRD9rTEHAZV6xIvl6BCb37q4DUYINxwMJUkD5zvn+fg?=
 =?us-ascii?Q?fYXcMT9ftBmRafkhHrrUKUQbjbwv3S5bf9JO/ZsQAHjBOipl2Brtb6trlLFQ?=
 =?us-ascii?Q?0mB80WpDkR5ichyh1svbO13AiUgqTbsUTb9oJ7Anv5GR7LPgrF8AuzTeLbRH?=
 =?us-ascii?Q?RvykY/OrB9x9mCaDMdWJkvRk7zGNJSTUr91bRfQNiKc+E4vCPYHDtfAI0BEI?=
 =?us-ascii?Q?fjMX9Ioj4V93FBMTLwDPLhRXpxaFsG6R9F1Tk2KxAm5wmvEH/fwUNRLShp9O?=
 =?us-ascii?Q?xukyHkgeLi4W9WmCg+LuiD2xjFGrtyZ7F+qwLHghNGBilR1m3cjh625BivwD?=
 =?us-ascii?Q?/TPcrGu72QmTzrWzRaoWHIsk015t+ipp9tTKFiKRBqYy0xslytRNM9qSJY3u?=
 =?us-ascii?Q?kpptMImZnJi8x6PbCxPV62RLWJgUj6Fqeje1iCRESu+NILe4U5XUqrULep9n?=
 =?us-ascii?Q?SUQ6WYePFLUFMd9jcHQsDWdClUVIVAQxNX1lsg1L7VNaPoDLysUlQTo1I6yh?=
 =?us-ascii?Q?xcQvHKGe2VfVvhoowQa6O4UTyYE+eBS13oL0LXr5habmw7QI3CImBBHWYuQx?=
 =?us-ascii?Q?JS+rhxNzrV+EkA2vHKigtAif8OCw/vStYJ4JxYjlvt4EWsxCmJxLt8DcRZ8g?=
 =?us-ascii?Q?r80twpYQ3/+n48B5tafSP29AxosKMv6r00hnTTxDsy1lOgBaEo6Aw5gWhUKW?=
 =?us-ascii?Q?rcBIa6/PxCtiBMtwMZfI8L/nRbQA007KvN1r2C75KT6kOoUNiPptf6e8sn88?=
 =?us-ascii?Q?IGFW8HFhmefAWaZhlkP6SB9W1ZfuDdDDktjuTRm1hqB9VdTL3Ca9qUXSbELy?=
 =?us-ascii?Q?j88N7F7SDjBN8ixwV7cOKcccqyibVpz3JllJF+bSo0RkkjEK2GIDL1BLyoxL?=
 =?us-ascii?Q?myffb06wV00NFPde5fhCpNvdcK/72a0EAxuVnv9oPG39u9tBUTh/V+nFmcwW?=
 =?us-ascii?Q?SPOurHHfLDKoJ+pD2PNJJvy7GDiDlH59WcztcrC83omdIY7gFmYNcrO8wqWx?=
 =?us-ascii?Q?ZvMTunIyeG1p1lbP6voA//5rZsm7POKbUHkrkRLjU2TTVN0L8z4R8zXZSEe/?=
 =?us-ascii?Q?8g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	weFAzdPTW9fkWZOUWfiNUKHIlC5ksALUVoxTo2uqILFI7VwKE4gRBA2eAvlN50L5n0goTEbhtuubFwg/1r/M6+wAsapHaFZL9HUyaHFSSO5dJPj2bUe0kKdu+kHo7kEUqmNR3MBuZdG//nfm5nw1lie7hoFxvvwTXEtdIGkoU6c8df3VxNb2vqqzhbC944s5RFMM3+gM9qKHfcVxnB79oRHM6BG+iylfjlpviCMmL+g6ywXipmGRPjn67jixbbACUSeMlXw7a+KWHYZDfbLKvqFG0nWxjj2M9B2+IJucoFkBrW93EXoZClo3nzuuYDj/uSqHI6dJGsn77u6AkwbNGV1lWzsK0iik+znG1cYF2FpWhKl1ZGo5UxJgBcgHgyNYCENFq7DRXpvRpRbKtGULdZwGxcolcT7jpFPs2hJwZ0n0s5pnWuZymIwJE2sbfkhq
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 20:37:27.8576
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56ee7977-542c-4ffe-90ae-08de731b5c1d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF00012E81.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4785
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 23 Feb 2026 20:37:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17132

From: Randolph Sapp <rs@ti.com>

Regenerate all configs to set repo paths and update template paths.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 kas/arago-kirkstone-chromium-config.yml         | 14 ++++++++++++--
 kas/arago-kirkstone-config.yml                  | 13 +++++++++++--
 kas/arago-kirkstone-next-config.yml             | 13 +++++++++++--
 kas/arago-kirkstone-wip-config.yml              | 13 +++++++++++--
 kas/arago-master-chromium-config.yml            | 13 +++++++++++--
 kas/arago-master-config.yml                     | 12 ++++++++++--
 kas/arago-master-flutter-config.yml             | 13 +++++++++++--
 kas/arago-master-next-config.yml                | 12 ++++++++++--
 kas/arago-master-selinux-config.yml             | 13 +++++++++++--
 kas/arago-master-wip-config.yml                 | 12 ++++++++++--
 kas/arago-scarthgap-10x-config.yml              | 14 ++++++++++++--
 kas/arago-scarthgap-10x-next-config.yml         | 14 ++++++++++++--
 kas/arago-scarthgap-chromium-config.yml         | 15 +++++++++++++--
 kas/arago-scarthgap-config.yml                  | 14 ++++++++++++--
 kas/arago-scarthgap-flutter-config.yml          | 15 +++++++++++++--
 kas/arago-scarthgap-next-config.yml             | 14 ++++++++++++--
 kas/arago-scarthgap-selinux-config.yml          | 15 +++++++++++++--
 kas/arago-scarthgap-wip-config.yml              | 14 ++++++++++++--
 kas/coresdk/coresdk-09.00.00.006-config.yml     | 12 ++++++++++--
 kas/coresdk/coresdk-09.00.00.007-config.yml     | 12 ++++++++++--
 kas/coresdk/coresdk-09.00.00.011-config.yml     | 12 ++++++++++--
 kas/coresdk/coresdk-09.01.00.001-config.yml     | 12 ++++++++++--
 kas/coresdk/coresdk-09.01.00.003-config.yml     | 12 ++++++++++--
 kas/coresdk/coresdk-09.01.00.007-config.yml     | 12 ++++++++++--
 kas/coresdk/coresdk-09.01.00.008-config.yml     | 12 ++++++++++--
 kas/coresdk/coresdk-09.02.00.008-config.yml     | 13 +++++++++++--
 kas/coresdk/coresdk-09.02.00.009-config.yml     | 13 +++++++++++--
 kas/coresdk/coresdk-09.02.00.010-config.yml     | 13 +++++++++++--
 kas/coresdk/coresdk-09.03.05-config.yml         | 13 +++++++++++--
 kas/coresdk/coresdk-10.00.07-config.yml         | 13 +++++++++++--
 kas/coresdk/coresdk-10.01.08-config.yml         | 13 +++++++++++--
 kas/coresdk/coresdk-10.01.10-config.yml         | 13 +++++++++++--
 kas/coresdk/coresdk-10.01.10-selinux-config.yml | 14 ++++++++++++--
 kas/coresdk/coresdk-11.00.09-config.yml         | 13 +++++++++++--
 kas/coresdk/coresdk-11.00.15-config.yml         | 13 +++++++++++--
 kas/coresdk/coresdk-11.01.05-config.yml         | 14 ++++++++++++--
 kas/coresdk/coresdk-11.01.07-config.yml         | 14 ++++++++++++--
 kas/coresdk/coresdk-11.01.08-config.yml         | 14 ++++++++++++--
 kas/coresdk/coresdk-11.01.16-config.yml         | 14 ++++++++++++--
 kas/coresdk/coresdk-11.02.05-config.yml         | 14 ++++++++++++--
 kas/coresdk/coresdk-11.02.08-config.yml         | 14 ++++++++++++--
 kas/coresdk/coresdk-11.02.10-config.yml         | 14 ++++++++++++--
 kas/distroless-kirkstone-config.yml             |  8 ++++++--
 kas/distroless-master-config.yml                |  8 ++++++--
 kas/distroless-scarthgap-config.yml             |  8 ++++++--
 kas/poky-kirkstone-config.yml                   | 10 ++++++++--
 kas/poky-master-config.yml                      | 10 ++++++++--
 kas/poky-master-wip-config.yml                  | 10 ++++++++--
 kas/poky-scarthgap-config.yml                   | 10 ++++++++--
 kas/poky-scarthgap-wip-config.yml               |  9 +++++++--
 .../processor-sdk-analytics-09.00.00-config.yml | 14 ++++++++++++--
 .../processor-sdk-analytics-09.00.01-config.yml | 14 ++++++++++++--
 .../processor-sdk-analytics-09.01.00-config.yml | 14 ++++++++++++--
 .../processor-sdk-analytics-09.02.00-config.yml | 14 ++++++++++++--
 .../processor-sdk-analytics-10.00.00-config.yml | 14 ++++++++++++--
 .../processor-sdk-analytics-10.01.00-config.yml | 15 +++++++++++++--
 .../processor-sdk-analytics-11.00.00-config.yml | 15 +++++++++++++--
 .../processor-sdk-analytics-11.01.00-config.yml | 15 +++++++++++++--
 ...ocessor-sdk-analytics-11.01.07.05-config.yml | 16 ++++++++++++++--
 .../processor-sdk-analytics-11.02.00-config.yml | 16 ++++++++++++++--
 ...sdk-analytics-selinux-11.01.07.05-config.yml | 17 +++++++++++++++--
 .../processor-sdk-gateway-10_00.yml             | 14 ++++++++++++--
 .../processor-sdk-linux-09_00_00_06.yml         | 14 ++++++++++++--
 .../processor-sdk-linux-09_00_00_07.yml         | 14 ++++++++++++--
 .../processor-sdk-linux-09_01_00_06.yml         | 13 +++++++++++--
 .../processor-sdk-linux-09_01_00_07.yml         | 13 +++++++++++--
 .../processor-sdk-linux-09_02_00_04.yml         | 15 +++++++++++++--
 .../processor-sdk-linux-09_02_00_05.yml         | 15 +++++++++++++--
 .../processor-sdk-linux-09_03_06_05.yml         | 14 ++++++++++++--
 .../processor-sdk-linux-10_00_07_06.yml         | 15 +++++++++++++--
 .../processor-sdk-linux-10_00_08_06.yml         | 15 +++++++++++++--
 .../processor-sdk-linux-10_01_08_01.yml         | 15 +++++++++++++--
 .../processor-sdk-linux-11_00_10_01.yml         | 15 +++++++++++++--
 .../processor-sdk-linux-11_01_02_01.yml         | 15 +++++++++++++--
 .../processor-sdk-09.00.00-am62xxsip-config.yml | 14 ++++++++++++--
 .../processor-sdk-09.00.00-config.yml           | 14 ++++++++++++--
 .../processor-sdk-09.01.00-am65xx-config.yml    | 13 +++++++++++--
 .../processor-sdk-09.01.00-config.yml           | 14 ++++++++++++--
 .../processor-sdk-09.01.00-legacy-config.yml    | 13 +++++++++++--
 .../processor-sdk-09.02.00.08-am64x-config.yml  | 14 ++++++++++++--
 .../processor-sdk-09.03.05.02-legacy-config.yml | 13 +++++++++++--
 ...processor-sdk-11.00.05.02-am62lxx-config.yml | 13 +++++++++++--
 ...processor-sdk-11.00.15.05-am62lxx-config.yml | 13 +++++++++++--
 ...ocessor-sdk-kirkstone-09.02.01.09-config.yml | 15 +++++++++++++--
 ...ocessor-sdk-kirkstone-09.02.01.10-config.yml | 15 +++++++++++++--
 ...dk-kirkstone-chromium-09.02.01.09-config.yml | 16 ++++++++++++++--
 ...dk-kirkstone-chromium-09.02.01.10-config.yml | 16 ++++++++++++++--
 ...ocessor-sdk-scarthgap-10.00.07.04-config.yml | 14 ++++++++++++--
 ...ocessor-sdk-scarthgap-10.01.10.04-config.yml | 14 ++++++++++++--
 ...ocessor-sdk-scarthgap-11.00.09.04-config.yml | 14 ++++++++++++--
 ...ocessor-sdk-scarthgap-11.01.05.03-config.yml | 15 +++++++++++++--
 ...ocessor-sdk-scarthgap-11.01.16.13-config.yml | 15 +++++++++++++--
 ...ocessor-sdk-scarthgap-11.02.05.02-config.yml | 15 +++++++++++++--
 ...ocessor-sdk-scarthgap-11.02.08.02-config.yml | 15 +++++++++++++--
 ...dk-scarthgap-chromium-10.00.07.04-config.yml | 16 ++++++++++++++--
 ...dk-scarthgap-chromium-10.01.10.04-config.yml | 16 ++++++++++++++--
 ...dk-scarthgap-chromium-11.00.09.04-config.yml | 15 +++++++++++++--
 ...dk-scarthgap-chromium-11.01.05.03-config.yml | 16 ++++++++++++++--
 ...dk-scarthgap-chromium-11.01.12.10-config.yml | 16 ++++++++++++++--
 ...dk-scarthgap-chromium-11.01.16.13-config.yml | 16 ++++++++++++++--
 ...dk-scarthgap-chromium-11.02.08.02-config.yml | 16 ++++++++++++++--
 ...or-sdk-scarthgap-evse-11.02.08.03-config.yml | 16 ++++++++++++++--
 ...r-sdk-scarthgap-nonqt-11.01.05.03-config.yml | 14 ++++++++++++--
 ...r-sdk-scarthgap-nonqt-11.01.16.13-config.yml | 14 ++++++++++++--
 ...r-sdk-scarthgap-nonqt-11.02.08.02-config.yml | 14 ++++++++++++--
 ...sdk-scarthgap-selinux-11.00.09.04-config.yml | 15 +++++++++++++--
 ...sdk-scarthgap-selinux-11.01.05.03-config.yml | 16 ++++++++++++++--
 ...sdk-scarthgap-selinux-11.01.16.13-config.yml | 16 ++++++++++++++--
 ...sdk-scarthgap-selinux-11.02.08.02-config.yml | 16 ++++++++++++++--
 109 files changed, 1279 insertions(+), 218 deletions(-)

diff --git a/kas/arago-kirkstone-chromium-config.yml b/kas/arago-kirkstone-=
chromium-config.yml
index 32ceaac..39c391d 100644
--- a/kas/arago-kirkstone-chromium-config.yml
+++ b/kas/arago-kirkstone-chromium-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ./templates/bblayers.conf.yml
-    - ./templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -11,12 +11,14 @@ repos:
   bitbake:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.0"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
   meta-arago:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "kirkstone"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -27,20 +29,24 @@ repos:
     url: "https://github.com/OSSystems/meta-browser.git"
     branch: "master"
     commit: "d3d16b47e17dc899e5298cff698dc32e5e639ab4"
+    path: "sources/meta-browser"
     layers:
       meta-chromium:
=20
   meta-qt5:
     url: "https://github.com/meta-qt5/meta-qt5.git"
     branch: "kirkstone"
+    path: "sources/meta-qt5"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "kirkstone"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "kirkstone"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -51,6 +57,7 @@ repos:
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "kirkstone"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -58,6 +65,7 @@ repos:
   meta-arm:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "kirkstone"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -65,9 +73,11 @@ repos:
   meta-clang:
     url: "https://github.com/kraj/meta-clang"
     branch: "kirkstone-clang12"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "kirkstone"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/arago-kirkstone-config.yml b/kas/arago-kirkstone-config.ym=
l
index cb04d57..a763bf8 100644
--- a/kas/arago-kirkstone-config.yml
+++ b/kas/arago-kirkstone-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ./templates/bblayers.conf.yml
-    - ./templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -11,12 +11,14 @@ repos:
   bitbake:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.0"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
   meta-arago:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "kirkstone"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -26,14 +28,17 @@ repos:
   meta-qt5:
     url: "https://github.com/meta-qt5/meta-qt5.git"
     branch: "kirkstone"
+    path: "sources/meta-qt5"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "kirkstone"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "kirkstone"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -44,6 +49,7 @@ repos:
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "kirkstone"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -51,6 +57,7 @@ repos:
   meta-arm:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "kirkstone"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -58,9 +65,11 @@ repos:
   meta-clang:
     url: "https://github.com/kraj/meta-clang"
     branch: "kirkstone-clang12"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "kirkstone"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/arago-kirkstone-next-config.yml b/kas/arago-kirkstone-next=
-config.yml
index a14cd93..81e1bee 100644
--- a/kas/arago-kirkstone-next-config.yml
+++ b/kas/arago-kirkstone-next-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ./templates/bblayers.conf.yml
-    - ./templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -11,12 +11,14 @@ repos:
   bitbake:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.0"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
   meta-arago:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "kirkstone-next"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -26,14 +28,17 @@ repos:
   meta-qt5:
     url: "https://github.com/meta-qt5/meta-qt5.git"
     branch: "kirkstone"
+    path: "sources/meta-qt5"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "kirkstone"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "kirkstone"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -44,6 +49,7 @@ repos:
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "kirkstone-next"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -51,6 +57,7 @@ repos:
   meta-arm:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "kirkstone"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -58,10 +65,12 @@ repos:
   meta-clang:
     url: "https://github.com/kraj/meta-clang"
     branch: "kirkstone-clang12"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "kirkstone"
+    path: "sources/oe-core"
     layers:
       meta:
=20
diff --git a/kas/arago-kirkstone-wip-config.yml b/kas/arago-kirkstone-wip-c=
onfig.yml
index ee64760..6d226e5 100644
--- a/kas/arago-kirkstone-wip-config.yml
+++ b/kas/arago-kirkstone-wip-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ./templates/bblayers.conf.yml
-    - ./templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -11,12 +11,14 @@ repos:
   bitbake:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.0"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
   meta-arago:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "kirkstone-wip"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -26,14 +28,17 @@ repos:
   meta-qt5:
     url: "https://github.com/meta-qt5/meta-qt5.git"
     branch: "kirkstone"
+    path: "sources/meta-qt5"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "kirkstone"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "kirkstone"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -44,6 +49,7 @@ repos:
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "kirkstone-wip"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -51,6 +57,7 @@ repos:
   meta-arm:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "kirkstone"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -58,9 +65,11 @@ repos:
   meta-clang:
     url: "https://github.com/kraj/meta-clang"
     branch: "kirkstone-clang12"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "kirkstone"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/arago-master-chromium-config.yml b/kas/arago-master-chromi=
um-config.yml
index 976f651..740c6c7 100644
--- a/kas/arago-master-chromium-config.yml
+++ b/kas/arago-master-chromium-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ./templates/bblayers.conf.yml
-    - ./templates/local-arago64-v3.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v3.conf.yml
=20
 target: tisdk-default-image
=20
@@ -11,12 +11,14 @@ repos:
   bitbake:
     url: "https://git.openembedded.org/bitbake"
     branch: "master"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
   meta-arago:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "master"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -25,20 +27,24 @@ repos:
   meta-browser:
     url: "https://github.com/OSSystems/meta-browser.git"
     branch: "master"
+    path: "sources/meta-browser"
     layers:
       meta-chromium:
=20
   meta-qt6:
     url: "https://code.qt.io/yocto/meta-qt6.git"
     branch: "dev"
+    path: "sources/meta-qt6"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "master"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "master"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -50,6 +56,7 @@ repos:
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "master"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-beagle:
@@ -58,6 +65,7 @@ repos:
   meta-arm:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "master"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -65,5 +73,6 @@ repos:
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "master"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/arago-master-config.yml b/kas/arago-master-config.yml
index f1dfeef..6b3be87 100644
--- a/kas/arago-master-config.yml
+++ b/kas/arago-master-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ./templates/bblayers.conf.yml
-    - ./templates/local-arago64-v3.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v3.conf.yml
=20
 target: tisdk-default-image
=20
@@ -11,12 +11,14 @@ repos:
   bitbake:
     url: "https://git.openembedded.org/bitbake"
     branch: "master"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
   meta-arago:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "master"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -25,14 +27,17 @@ repos:
   meta-qt6:
     url: "https://code.qt.io/yocto/meta-qt6.git"
     branch: "dev"
+    path: "sources/meta-qt6"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "master"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "master"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -44,6 +49,7 @@ repos:
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "master"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-beagle:
@@ -52,6 +58,7 @@ repos:
   meta-arm:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "master"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -59,5 +66,6 @@ repos:
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "master"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/arago-master-flutter-config.yml b/kas/arago-master-flutter=
-config.yml
index 0e53c9a..4607b49 100644
--- a/kas/arago-master-flutter-config.yml
+++ b/kas/arago-master-flutter-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ./templates/bblayers.conf.yml
-    - ./templates/local-arago64-v3.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v3.conf.yml
=20
 target: tisdk-default-image
=20
@@ -11,12 +11,14 @@ repos:
   bitbake:
     url: "https://git.openembedded.org/bitbake"
     branch: "master"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
   meta-arago:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "master"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -25,6 +27,7 @@ repos:
   meta-flutter:
     url: "https://github.com/meta-flutter/meta-flutter.git"
     branch: "master"
+    path: "sources/meta-flutter"
     layers:
       .:
       meta-flutter-apps:
@@ -32,14 +35,17 @@ repos:
   meta-qt6:
     url: "https://code.qt.io/yocto/meta-qt6.git"
     branch: "dev"
+    path: "sources/meta-qt6"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "master"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "master"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -51,6 +57,7 @@ repos:
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "master"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-beagle:
@@ -59,6 +66,7 @@ repos:
   meta-arm:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "master"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -66,5 +74,6 @@ repos:
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "master"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/arago-master-next-config.yml b/kas/arago-master-next-confi=
g.yml
index 7decb36..a1e0924 100644
--- a/kas/arago-master-next-config.yml
+++ b/kas/arago-master-next-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ./templates/bblayers.conf.yml
-    - ./templates/local-arago64-v3.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v3.conf.yml
=20
 target: tisdk-default-image
=20
@@ -11,12 +11,14 @@ repos:
   bitbake:
     url: "https://git.openembedded.org/bitbake"
     branch: "master"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
   meta-arago:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "master-next"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -25,14 +27,17 @@ repos:
   meta-qt6:
     url: "https://code.qt.io/yocto/meta-qt6.git"
     branch: "dev"
+    path: "sources/meta-qt6"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "master"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "master"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -44,6 +49,7 @@ repos:
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "master-next"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-beagle:
@@ -52,6 +58,7 @@ repos:
   meta-arm:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "master"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -59,6 +66,7 @@ repos:
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "master"
+    path: "sources/oe-core"
     layers:
       meta:
=20
diff --git a/kas/arago-master-selinux-config.yml b/kas/arago-master-selinux=
-config.yml
index b3cb9d4..65a1925 100644
--- a/kas/arago-master-selinux-config.yml
+++ b/kas/arago-master-selinux-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ./templates/bblayers.conf.yml
-    - ./templates/local-arago64-v3.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v3.conf.yml
=20
 target: tisdk-default-image
=20
@@ -11,12 +11,14 @@ repos:
   bitbake:
     url: "https://git.openembedded.org/bitbake"
     branch: "master"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
   meta-arago:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "master"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -25,18 +27,22 @@ repos:
   meta-selinux:
     url: "https://git.yoctoproject.org/meta-selinux"
     branch: "master"
+    path: "sources/meta-selinux"
=20
   meta-qt6:
     url: "https://code.qt.io/yocto/meta-qt6.git"
     branch: "dev"
+    path: "sources/meta-qt6"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "master"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "master"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -48,6 +54,7 @@ repos:
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "master"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-beagle:
@@ -56,6 +63,7 @@ repos:
   meta-arm:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "master"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -63,6 +71,7 @@ repos:
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "master"
+    path: "sources/oe-core"
     layers:
       meta:
=20
diff --git a/kas/arago-master-wip-config.yml b/kas/arago-master-wip-config.=
yml
index a96f82f..c35df05 100644
--- a/kas/arago-master-wip-config.yml
+++ b/kas/arago-master-wip-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ./templates/bblayers.conf.yml
-    - ./templates/local-arago64-v3.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v3.conf.yml
=20
 target: tisdk-default-image
=20
@@ -11,12 +11,14 @@ repos:
   bitbake:
     url: "https://git.openembedded.org/bitbake"
     branch: "master"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
   meta-arago:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "master-wip"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -25,14 +27,17 @@ repos:
   meta-qt6:
     url: "https://code.qt.io/yocto/meta-qt6.git"
     branch: "dev"
+    path: "sources/meta-qt6"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "master"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "master"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -44,6 +49,7 @@ repos:
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "master-wip"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-beagle:
@@ -52,6 +58,7 @@ repos:
   meta-arm:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "master"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -59,5 +66,6 @@ repos:
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "master"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/arago-scarthgap-10x-config.yml b/kas/arago-scarthgap-10x-c=
onfig.yml
index 7e773be..fb4abcf 100644
--- a/kas/arago-scarthgap-10x-config.yml
+++ b/kas/arago-scarthgap-10x-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ./templates/bblayers.conf.yml
-    - ./templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -11,12 +11,14 @@ repos:
   bitbake:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
   meta-arago:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -25,14 +27,17 @@ repos:
   meta-qt6:
     url: "https://code.qt.io/yocto/meta-qt6.git"
     branch: "6.9"
+    path: "sources/meta-qt6"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -44,10 +49,12 @@ repos:
   meta-lts-mixins:
     url: "https://git.yoctoproject.org/meta-lts-mixins"
     branch: "scarthgap/rust"
+    path: "sources/meta-lts-mixins"
=20
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-beagle:
@@ -56,6 +63,7 @@ repos:
   meta-arm:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -63,10 +71,12 @@ repos:
   meta-clang:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
+    path: "sources/oe-core"
     layers:
       meta:
=20
diff --git a/kas/arago-scarthgap-10x-next-config.yml b/kas/arago-scarthgap-=
10x-next-config.yml
index d9e7fca..7689cbf 100644
--- a/kas/arago-scarthgap-10x-next-config.yml
+++ b/kas/arago-scarthgap-10x-next-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ./templates/bblayers.conf.yml
-    - ./templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -11,12 +11,14 @@ repos:
   bitbake:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
   meta-arago:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap-next"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -25,14 +27,17 @@ repos:
   meta-qt6:
     url: "https://code.qt.io/yocto/meta-qt6.git"
     branch: "6.9"
+    path: "sources/meta-qt6"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -44,10 +49,12 @@ repos:
   meta-lts-mixins:
     url: "https://git.yoctoproject.org/meta-lts-mixins"
     branch: "scarthgap/rust"
+    path: "sources/meta-lts-mixins"
=20
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap-next"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-beagle:
@@ -56,6 +63,7 @@ repos:
   meta-arm:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -63,10 +71,12 @@ repos:
   meta-clang:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
+    path: "sources/oe-core"
     layers:
       meta:
=20
diff --git a/kas/arago-scarthgap-chromium-config.yml b/kas/arago-scarthgap-=
chromium-config.yml
index f7ad0af..8d927c1 100644
--- a/kas/arago-scarthgap-chromium-config.yml
+++ b/kas/arago-scarthgap-chromium-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ./templates/bblayers.conf.yml
-    - ./templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -11,12 +11,14 @@ repos:
   bitbake:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
   meta-arago:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -26,20 +28,24 @@ repos:
     url: "https://github.com/OSSystems/meta-browser.git"
     branch: "master"
     commit: "27ca52f635a31f5f9762813a8527dd31323549b7"
+    path: "sources/meta-browser"
     layers:
       meta-chromium:
=20
   meta-qt6:
     url: "https://code.qt.io/yocto/meta-qt6.git"
     branch: "6.9"
+    path: "sources/meta-qt6"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -52,10 +58,12 @@ repos:
     url: "https://git.yoctoproject.org/meta-lts-mixins"
     branch: "scarthgap/rust"
     commit: "a8046d5ec53b1856169ac795aa87cb0d5db84c04"
+    path: "sources/meta-lts-mixins"
=20
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-beagle:
@@ -64,6 +72,7 @@ repos:
   meta-arm:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -71,9 +80,11 @@ repos:
   meta-clang:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/arago-scarthgap-config.yml b/kas/arago-scarthgap-config.ym=
l
index fd160ad..0240598 100644
--- a/kas/arago-scarthgap-config.yml
+++ b/kas/arago-scarthgap-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ./templates/bblayers.conf.yml
-    - ./templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -11,12 +11,14 @@ repos:
   bitbake:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
   meta-arago:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -25,14 +27,17 @@ repos:
   meta-qt6:
     url: "https://code.qt.io/yocto/meta-qt6.git"
     branch: "6.9"
+    path: "sources/meta-qt6"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -45,10 +50,12 @@ repos:
     url: "https://git.yoctoproject.org/meta-lts-mixins"
     branch: "scarthgap/rust"
     commit: "a8046d5ec53b1856169ac795aa87cb0d5db84c04"
+    path: "sources/meta-lts-mixins"
=20
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-beagle:
@@ -57,6 +64,7 @@ repos:
   meta-arm:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -64,9 +72,11 @@ repos:
   meta-clang:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/arago-scarthgap-flutter-config.yml b/kas/arago-scarthgap-f=
lutter-config.yml
index 6ba2cb5..db47a9d 100644
--- a/kas/arago-scarthgap-flutter-config.yml
+++ b/kas/arago-scarthgap-flutter-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ./templates/bblayers.conf.yml
-    - ./templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -11,12 +11,14 @@ repos:
   bitbake:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
   meta-arago:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -25,14 +27,17 @@ repos:
   meta-qt6:
     url: "https://code.qt.io/yocto/meta-qt6.git"
     branch: "6.9"
+    path: "sources/meta-qt6"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -45,10 +50,12 @@ repos:
     url: "https://git.yoctoproject.org/meta-lts-mixins"
     branch: "scarthgap/rust"
     commit: "a8046d5ec53b1856169ac795aa87cb0d5db84c04"
+    path: "sources/meta-lts-mixins"
=20
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-beagle:
@@ -57,6 +64,7 @@ repos:
   meta-arm:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -64,10 +72,12 @@ repos:
   meta-clang:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
+    path: "sources/meta-clang"
=20
   meta-flutter:
     url: "https://github.com/meta-flutter/meta-flutter.git"
     branch: "scarthgap"
+    path: "sources/meta-flutter"
     layers:
       .:
       meta-flutter-apps:
@@ -75,5 +85,6 @@ repos:
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/arago-scarthgap-next-config.yml b/kas/arago-scarthgap-next=
-config.yml
index 62723c6..dd1fba3 100644
--- a/kas/arago-scarthgap-next-config.yml
+++ b/kas/arago-scarthgap-next-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ./templates/bblayers.conf.yml
-    - ./templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -11,12 +11,14 @@ repos:
   bitbake:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
   meta-arago:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap-next"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -25,14 +27,17 @@ repos:
   meta-qt6:
     url: "https://code.qt.io/yocto/meta-qt6.git"
     branch: "6.9"
+    path: "sources/meta-qt6"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -45,10 +50,12 @@ repos:
     url: "https://git.yoctoproject.org/meta-lts-mixins"
     branch: "scarthgap/rust"
     commit: "a8046d5ec53b1856169ac795aa87cb0d5db84c04"
+    path: "sources/meta-lts-mixins"
=20
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap-next"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-beagle:
@@ -57,6 +64,7 @@ repos:
   meta-arm:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -64,10 +72,12 @@ repos:
   meta-clang:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
+    path: "sources/oe-core"
     layers:
       meta:
=20
diff --git a/kas/arago-scarthgap-selinux-config.yml b/kas/arago-scarthgap-s=
elinux-config.yml
index ba965b5..ee0030a 100644
--- a/kas/arago-scarthgap-selinux-config.yml
+++ b/kas/arago-scarthgap-selinux-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ./templates/bblayers.conf.yml
-    - ./templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -11,12 +11,14 @@ repos:
   bitbake:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
   meta-arago:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -25,18 +27,22 @@ repos:
   meta-selinux:
     url: "https://git.yoctoproject.org/meta-selinux"
     branch: "scarthgap"
+    path: "sources/meta-selinux"
=20
   meta-qt6:
     url: "https://code.qt.io/yocto/meta-qt6.git"
     branch: "6.9"
+    path: "sources/meta-qt6"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -49,10 +55,12 @@ repos:
     url: "https://git.yoctoproject.org/meta-lts-mixins"
     branch: "scarthgap/rust"
     commit: "a8046d5ec53b1856169ac795aa87cb0d5db84c04"
+    path: "sources/meta-lts-mixins"
=20
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-beagle:
@@ -61,6 +69,7 @@ repos:
   meta-arm:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -68,10 +77,12 @@ repos:
   meta-clang:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
+    path: "sources/oe-core"
     layers:
       meta:
=20
diff --git a/kas/arago-scarthgap-wip-config.yml b/kas/arago-scarthgap-wip-c=
onfig.yml
index 18738b5..f83dca7 100644
--- a/kas/arago-scarthgap-wip-config.yml
+++ b/kas/arago-scarthgap-wip-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ./templates/bblayers.conf.yml
-    - ./templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -11,12 +11,14 @@ repos:
   bitbake:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
   meta-arago:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap-wip"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -25,14 +27,17 @@ repos:
   meta-qt6:
     url: "https://code.qt.io/yocto/meta-qt6.git"
     branch: "6.9"
+    path: "sources/meta-qt6"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -45,10 +50,12 @@ repos:
     url: "https://git.yoctoproject.org/meta-lts-mixins"
     branch: "scarthgap/rust"
     commit: "a8046d5ec53b1856169ac795aa87cb0d5db84c04"
+    path: "sources/meta-lts-mixins"
=20
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap-wip"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-beagle:
@@ -57,6 +64,7 @@ repos:
   meta-arm:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -64,9 +72,11 @@ repos:
   meta-clang:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/coresdk/coresdk-09.00.00.006-config.yml b/kas/coresdk/core=
sdk-09.00.00.006-config.yml
index f475c70..5d32b0c 100644
--- a/kas/coresdk/coresdk-09.00.00.006-config.yml
+++ b/kas/coresdk/coresdk-09.00.00.006-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.0"
     commit: "907416ee1062f87f5844ab0638b54616abfc1a22"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "kirkstone"
     commit: "09.00.00.006"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -28,16 +30,19 @@ repos:
     url: "https://github.com/meta-qt5/meta-qt5.git"
     branch: "kirkstone"
     commit: "bff5bd937f0776166e81a63f3dd39ede348ef758"
+    path: "sources/meta-qt5"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "kirkstone"
     commit: "b3b3dbc67504e8cd498d6db202ddcf5a9dd26a9d"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "kirkstone"
     commit: "346753705e49a2486867dc150181a1c7f4d69377"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -49,6 +54,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "kirkstone"
     commit: "09.00.00.006"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -57,6 +63,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "kirkstone"
     commit: "96aad3b29aa7a5ee4df5cf617a6336e5218fa9bd"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -65,5 +72,6 @@ repos:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "kirkstone"
     commit: "f20a12ead2d5890e88e7f4ce149a777de47edc48"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/coresdk/coresdk-09.00.00.007-config.yml b/kas/coresdk/core=
sdk-09.00.00.007-config.yml
index 0f48178..22c4056 100644
--- a/kas/coresdk/coresdk-09.00.00.007-config.yml
+++ b/kas/coresdk/coresdk-09.00.00.007-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.0"
     commit: "907416ee1062f87f5844ab0638b54616abfc1a22"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "kirkstone"
     commit: "09.00.00.007"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -28,16 +30,19 @@ repos:
     url: "https://github.com/meta-qt5/meta-qt5.git"
     branch: "kirkstone"
     commit: "bff5bd937f0776166e81a63f3dd39ede348ef758"
+    path: "sources/meta-qt5"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "kirkstone"
     commit: "b3b3dbc67504e8cd498d6db202ddcf5a9dd26a9d"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "kirkstone"
     commit: "346753705e49a2486867dc150181a1c7f4d69377"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -49,6 +54,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "kirkstone"
     commit: "09.00.00.007"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -57,6 +63,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "kirkstone"
     commit: "c39bb4ce3b60b73d35c5fb06af012432e70d6b38"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -65,5 +72,6 @@ repos:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "kirkstone"
     commit: "200c2783b3f8546f561382fff6bd5268680d403a"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/coresdk/coresdk-09.00.00.011-config.yml b/kas/coresdk/core=
sdk-09.00.00.011-config.yml
index aaa562c..986aba6 100644
--- a/kas/coresdk/coresdk-09.00.00.011-config.yml
+++ b/kas/coresdk/coresdk-09.00.00.011-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.0"
     commit: "41b6684489d0261753344956042be2cc4adb0159"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "kirkstone"
     commit: "09.00.00.011"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -28,16 +30,19 @@ repos:
     url: "https://github.com/meta-qt5/meta-qt5.git"
     branch: "kirkstone"
     commit: "31930afca79b74e0c788452d71356c1f045e7979"
+    path: "sources/meta-qt5"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "kirkstone"
     commit: "2d8b3cba8ff27c9ec2187a52b6a551fe1dcfaa07"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "kirkstone"
     commit: "9c5541f7e18a1fac3b8dea71e1ebb8398d58e6ff"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -49,6 +54,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "kirkstone"
     commit: "09.00.00.011"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -57,6 +63,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "kirkstone"
     commit: "b187fb9232ca0a6b5f8f90b4715958546fc41d73"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -65,5 +72,6 @@ repos:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "kirkstone"
     commit: "be0bca7eaa08948b6c4eabe63e68a6e14d8dad3b"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/coresdk/coresdk-09.01.00.001-config.yml b/kas/coresdk/core=
sdk-09.01.00.001-config.yml
index d0d0b56..ea501e1 100644
--- a/kas/coresdk/coresdk-09.01.00.001-config.yml
+++ b/kas/coresdk/coresdk-09.01.00.001-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.0"
     commit: "9993a89e5b97dda5f3657e5a7cc3a4fa94ff7111"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "kirkstone"
     commit: "09.01.00.001"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -29,16 +31,19 @@ repos:
     url: "https://github.com/meta-qt5/meta-qt5.git"
     branch: "kirkstone"
     commit: "ae8a97f79364bed1abc297636f7933d0e35f22be"
+    path: "sources/meta-qt5"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "kirkstone"
     commit: "2d8b3cba8ff27c9ec2187a52b6a551fe1dcfaa07"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "kirkstone"
     commit: "9c5541f7e18a1fac3b8dea71e1ebb8398d58e6ff"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -50,6 +55,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "kirkstone"
     commit: "09.01.00.001"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -58,6 +64,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "kirkstone"
     commit: "b187fb9232ca0a6b5f8f90b4715958546fc41d73"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -66,5 +73,6 @@ repos:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "kirkstone"
     commit: "2572b32e729831762790ebfbf930a1140657faea"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/coresdk/coresdk-09.01.00.003-config.yml b/kas/coresdk/core=
sdk-09.01.00.003-config.yml
index e6daaa0..15a7231 100644
--- a/kas/coresdk/coresdk-09.01.00.003-config.yml
+++ b/kas/coresdk/coresdk-09.01.00.003-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.0"
     commit: "6c1ffa9091d0c53a100e8c8c15122d28642034bd"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "kirkstone"
     commit: "09.01.00.003"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -29,16 +31,19 @@ repos:
     url: "https://github.com/meta-qt5/meta-qt5.git"
     branch: "kirkstone"
     commit: "ae8a97f79364bed1abc297636f7933d0e35f22be"
+    path: "sources/meta-qt5"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "kirkstone"
     commit: "2d8b3cba8ff27c9ec2187a52b6a551fe1dcfaa07"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "kirkstone"
     commit: "79a6f60dabad9e5b0e041efa91379447ef030482"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -50,6 +55,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "kirkstone"
     commit: "09.01.00.003"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -58,6 +64,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "kirkstone"
     commit: "b187fb9232ca0a6b5f8f90b4715958546fc41d73"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -66,5 +73,6 @@ repos:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "kirkstone"
     commit: "56503e3e80603de3b69acef2f6d32836bc9e5e5d"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/coresdk/coresdk-09.01.00.007-config.yml b/kas/coresdk/core=
sdk-09.01.00.007-config.yml
index dbde65b..8e7eb0d 100644
--- a/kas/coresdk/coresdk-09.01.00.007-config.yml
+++ b/kas/coresdk/coresdk-09.01.00.007-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.0"
     commit: "a7f6c3e67bd9170e93b2b94676e84018faf0df91"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "kirkstone"
     commit: "09.01.00.007"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -29,16 +31,19 @@ repos:
     url: "https://github.com/meta-qt5/meta-qt5.git"
     branch: "kirkstone"
     commit: "ae8a97f79364bed1abc297636f7933d0e35f22be"
+    path: "sources/meta-qt5"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "kirkstone"
     commit: "67b0ef4256a484851f3556d281ca4caa88374388"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "kirkstone"
     commit: "8a75c61cce2aa1d6e5a3597ab8fc5a7e6aeae1e4"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -50,6 +55,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "kirkstone"
     commit: "09.01.00.007"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -58,6 +64,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "kirkstone"
     commit: "b187fb9232ca0a6b5f8f90b4715958546fc41d73"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -66,5 +73,6 @@ repos:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "kirkstone"
     commit: "8726ae02d760270f9e7fe7ef5715d8f7553371ce"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/coresdk/coresdk-09.01.00.008-config.yml b/kas/coresdk/core=
sdk-09.01.00.008-config.yml
index 94a5d7b..862e244 100644
--- a/kas/coresdk/coresdk-09.01.00.008-config.yml
+++ b/kas/coresdk/coresdk-09.01.00.008-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.0"
     commit: "a7f6c3e67bd9170e93b2b94676e84018faf0df91"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "kirkstone"
     commit: "09.01.00.008"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -29,16 +31,19 @@ repos:
     url: "https://github.com/meta-qt5/meta-qt5.git"
     branch: "kirkstone"
     commit: "ae8a97f79364bed1abc297636f7933d0e35f22be"
+    path: "sources/meta-qt5"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "kirkstone"
     commit: "67b0ef4256a484851f3556d281ca4caa88374388"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "kirkstone"
     commit: "8a75c61cce2aa1d6e5a3597ab8fc5a7e6aeae1e4"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -50,6 +55,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "kirkstone"
     commit: "09.01.00.008"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -58,6 +64,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "kirkstone"
     commit: "b187fb9232ca0a6b5f8f90b4715958546fc41d73"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -66,5 +73,6 @@ repos:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "kirkstone"
     commit: "11da43b58e19583a9bc16044309610cfb2e86469"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/coresdk/coresdk-09.02.00.008-config.yml b/kas/coresdk/core=
sdk-09.02.00.008-config.yml
index a8d2c61..174ea1f 100644
--- a/kas/coresdk/coresdk-09.02.00.008-config.yml
+++ b/kas/coresdk/coresdk-09.02.00.008-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.0"
     commit: "40fd5f4eef7460ca67f32cfce8e229e67e1ff607"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "kirkstone"
     commit: "09.02.00.008"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -29,16 +31,19 @@ repos:
     url: "https://github.com/meta-qt5/meta-qt5.git"
     branch: "kirkstone"
     commit: "fe0bf7f0e5408aac6cc89ff3b19b1b1941df4f64"
+    path: "sources/meta-qt5"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "kirkstone"
     commit: "7902664f89678164b7fc90d421cee74cbec51cdf"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "kirkstone"
     commit: "fda737ec0cc1d2a5217548a560074a8e4d5ec580"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -50,6 +55,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "kirkstone"
     commit: "09.02.00.008"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -58,6 +64,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "kirkstone"
     commit: "b187fb9232ca0a6b5f8f90b4715958546fc41d73"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -66,10 +73,12 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "kirkstone-clang12"
     commit: "c2e89dc7e1dfcc1bbe432afca2dc43d6560cb007"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "kirkstone"
     commit: "2501534c9581c6c3439f525d630be11554a57d24"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/coresdk/coresdk-09.02.00.009-config.yml b/kas/coresdk/core=
sdk-09.02.00.009-config.yml
index 11f7268..550387b 100644
--- a/kas/coresdk/coresdk-09.02.00.009-config.yml
+++ b/kas/coresdk/coresdk-09.02.00.009-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.0"
     commit: "40fd5f4eef7460ca67f32cfce8e229e67e1ff607"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "kirkstone"
     commit: "09.02.00.009"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -29,16 +31,19 @@ repos:
     url: "https://github.com/meta-qt5/meta-qt5.git"
     branch: "kirkstone"
     commit: "fe0bf7f0e5408aac6cc89ff3b19b1b1941df4f64"
+    path: "sources/meta-qt5"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "kirkstone"
     commit: "cb2bc17e96552cdfc141d27bd9f4dbd95a872846"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "kirkstone"
     commit: "fda737ec0cc1d2a5217548a560074a8e4d5ec580"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -50,6 +55,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "kirkstone"
     commit: "09.02.00.009"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -58,6 +64,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "kirkstone"
     commit: "b187fb9232ca0a6b5f8f90b4715958546fc41d73"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -66,10 +73,12 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "kirkstone-clang12"
     commit: "c2e89dc7e1dfcc1bbe432afca2dc43d6560cb007"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "kirkstone"
     commit: "2501534c9581c6c3439f525d630be11554a57d24"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/coresdk/coresdk-09.02.00.010-config.yml b/kas/coresdk/core=
sdk-09.02.00.010-config.yml
index db7ae4d..ea17841 100644
--- a/kas/coresdk/coresdk-09.02.00.010-config.yml
+++ b/kas/coresdk/coresdk-09.02.00.010-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.0"
     commit: "40fd5f4eef7460ca67f32cfce8e229e67e1ff607"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "kirkstone"
     commit: "09.02.00.010"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -29,16 +31,19 @@ repos:
     url: "https://github.com/meta-qt5/meta-qt5.git"
     branch: "kirkstone"
     commit: "644ebf220245bdc06e7696ccc90acc97a0dd2566"
+    path: "sources/meta-qt5"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "kirkstone"
     commit: "8f0eb65edaf6d280294c33446a9bb073a50b8c14"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "kirkstone"
     commit: "5a6f7925bd2b885955c942573f70a5594f231563"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -50,6 +55,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "kirkstone"
     commit: "09.02.00.010"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -58,6 +64,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "kirkstone"
     commit: "260e3adc2bf322f52d81c0642c825088a88bb051"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -66,10 +73,12 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "kirkstone-clang12"
     commit: "c2e89dc7e1dfcc1bbe432afca2dc43d6560cb007"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "kirkstone"
     commit: "8a502301209ef144932ef5071c1a9b738db23270"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/coresdk/coresdk-09.03.05-config.yml b/kas/coresdk/coresdk-=
09.03.05-config.yml
index ad88f14..b27d6ff 100644
--- a/kas/coresdk/coresdk-09.03.05-config.yml
+++ b/kas/coresdk/coresdk-09.03.05-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.0"
     commit: "3f88b005244a0afb5d5c7260e54a94a453ec9b3e"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "kirkstone"
     commit: "09.03.05"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -29,16 +31,19 @@ repos:
     url: "https://github.com/meta-qt5/meta-qt5.git"
     branch: "kirkstone"
     commit: "644ebf220245bdc06e7696ccc90acc97a0dd2566"
+    path: "sources/meta-qt5"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "kirkstone"
     commit: "c996df33763f292da5e7513c574272d7de23eafc"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "kirkstone"
     commit: "4ad41baed6236d499804cbfc4f174042d84fce97"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -50,6 +55,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "kirkstone"
     commit: "09.03.05"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -58,6 +64,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "kirkstone"
     commit: "936c02ec13661bd86a05f7f90e1b920d5092d670"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -66,10 +73,12 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "kirkstone-clang12"
     commit: "c2e89dc7e1dfcc1bbe432afca2dc43d6560cb007"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "kirkstone"
     commit: "13b13b81b91f618c13cf972067c47bd810de852f"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/coresdk/coresdk-10.00.07-config.yml b/kas/coresdk/coresdk-=
10.00.07-config.yml
index a88507d..bd573fb 100644
--- a/kas/coresdk/coresdk-10.00.07-config.yml
+++ b/kas/coresdk/coresdk-10.00.07-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
     commit: "11d83170922a2c6b9db1f6e8c23e533526984b2c"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
     commit: "10.00.07"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -29,16 +31,19 @@ repos:
     url: "https://github.com/meta-qt5/meta-qt5.git"
     branch: "scarthgap"
     commit: "eb828418264a49b8d00035cb3d7b12fcea3be801"
+    path: "sources/meta-qt5"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
     commit: "6a80f140e387621f62964209a2e07d3bcfb125ce"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
     commit: "18f939a5fb37528a5415b05077ece383c346a119"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -51,6 +56,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
     commit: "10.00.07"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -59,6 +65,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
     commit: "1b85bbb4cab9658da3cd926c62038b8559c5c64e"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -67,10 +74,12 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
     commit: "df21b1563910c80d7e2964971b7c5b79b5186922"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
     commit: "c00a9a8f25b0042b0723a5d20b88e92d473d22bf"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/coresdk/coresdk-10.01.08-config.yml b/kas/coresdk/coresdk-=
10.01.08-config.yml
index 1dba410..32c259d 100644
--- a/kas/coresdk/coresdk-10.01.08-config.yml
+++ b/kas/coresdk/coresdk-10.01.08-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
     commit: "377eba2361850adfb8ce7e761ef9c76be287f88c"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
     commit: "10.01.08"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -29,16 +31,19 @@ repos:
     url: "https://github.com/meta-qt5/meta-qt5.git"
     branch: "scarthgap"
     commit: "eb828418264a49b8d00035cb3d7b12fcea3be801"
+    path: "sources/meta-qt5"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
     commit: "7c78f4ef96020b702c027d179895c9f97179b4fc"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
     commit: "2e3126c9c16bb3df0560f6b3896d01539a3bfad7"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -51,6 +56,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
     commit: "10.01.08"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -59,6 +65,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
     commit: "7088279c0ab00c7dabefdd4544951b4746b48476"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -67,10 +74,12 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
     commit: "9fbfa9db33131abdf3870a94f00199eb53e276e5"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
     commit: "a051a066da2874b95680d0353dfa18c1d56b2670"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/coresdk/coresdk-10.01.10-config.yml b/kas/coresdk/coresdk-=
10.01.10-config.yml
index d53df18..cbbf70a 100644
--- a/kas/coresdk/coresdk-10.01.10-config.yml
+++ b/kas/coresdk/coresdk-10.01.10-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
     commit: "6c2641f7a9e92c1b82e306f59ddd3c1249c52cbf"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
     commit: "10.01.10"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -29,16 +31,19 @@ repos:
     url: "https://github.com/meta-qt5/meta-qt5.git"
     branch: "scarthgap"
     commit: "eb828418264a49b8d00035cb3d7b12fcea3be801"
+    path: "sources/meta-qt5"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
     commit: "450941a1b6df96285691e8c23d4f332d3c88a994"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
     commit: "b8d1a14f7f3b76457c36752202ea7ae5881b6654"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -51,6 +56,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
     commit: "10.01.10"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -59,6 +65,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
     commit: "7088279c0ab00c7dabefdd4544951b4746b48476"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -67,10 +74,12 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
     commit: "9fbfa9db33131abdf3870a94f00199eb53e276e5"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
     commit: "dac630ab5ee7aa6c5c7c294093adbd11b116c765"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/coresdk/coresdk-10.01.10-selinux-config.yml b/kas/coresdk/=
coresdk-10.01.10-selinux-config.yml
index fd56f64..7c6a822 100644
--- a/kas/coresdk/coresdk-10.01.10-selinux-config.yml
+++ b/kas/coresdk/coresdk-10.01.10-selinux-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
     commit: "6c2641f7a9e92c1b82e306f59ddd3c1249c52cbf"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
     commit: "10.01.10"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -29,21 +31,25 @@ repos:
     url: "https://git.yoctoproject.org/meta-selinux"
     branch: "scarthgap"
     commit: "3aff015697fa056b4af83b1c9ba44eca346a8a37"
+    path: "sources/meta-selinux"
=20
   meta-qt5:
     url: "https://github.com/meta-qt5/meta-qt5.git"
     branch: "scarthgap"
     commit: "eb828418264a49b8d00035cb3d7b12fcea3be801"
+    path: "sources/meta-qt5"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
     commit: "450941a1b6df96285691e8c23d4f332d3c88a994"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
     commit: "b8d1a14f7f3b76457c36752202ea7ae5881b6654"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -56,6 +62,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
     commit: "10.01.10"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -64,6 +71,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
     commit: "7088279c0ab00c7dabefdd4544951b4746b48476"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -72,11 +80,13 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
     commit: "9fbfa9db33131abdf3870a94f00199eb53e276e5"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
     commit: "dac630ab5ee7aa6c5c7c294093adbd11b116c765"
+    path: "sources/oe-core"
     layers:
       meta:
=20
diff --git a/kas/coresdk/coresdk-11.00.09-config.yml b/kas/coresdk/coresdk-=
11.00.09-config.yml
index 7bf095f..cb33bb8 100644
--- a/kas/coresdk/coresdk-11.00.09-config.yml
+++ b/kas/coresdk/coresdk-11.00.09-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
     commit: "696c2c1ef095f8b11c7d2eff36fae50f58c62e5e"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
     commit: "11.00.09"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -28,16 +30,19 @@ repos:
     url: "https://code.qt.io/yocto/meta-qt6.git"
     branch: "6.9"
     commit: "78855ecc613fcd6eff1a5a012cab5e679df329e4"
+    path: "sources/meta-qt6"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
     commit: "0c191912421adff2f753e470056a9a525fbce760"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
     commit: "edd1a1e284fdcb80cd48d411f235d47f23bc27ae"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -50,6 +55,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
     commit: "11.00.09"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-beagle:
@@ -59,6 +65,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
     commit: "3cadb81ffaa9f03b92e302843cb22a9cd41df34b"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -67,10 +74,12 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
     commit: "b9ef02282197380ef05edbd0eb852e1934ceb59b"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
     commit: "1be6d83466e3a0da4222ba502c2a86c25c835a35"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/coresdk/coresdk-11.00.15-config.yml b/kas/coresdk/coresdk-=
11.00.15-config.yml
index df91e62..5b45388 100644
--- a/kas/coresdk/coresdk-11.00.15-config.yml
+++ b/kas/coresdk/coresdk-11.00.15-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
     commit: "696c2c1ef095f8b11c7d2eff36fae50f58c62e5e"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
     commit: "11.00.15"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -28,16 +30,19 @@ repos:
     url: "https://code.qt.io/yocto/meta-qt6.git"
     branch: "6.9"
     commit: "82e938e62d819774747ea9ba53dea6cd328f6752"
+    path: "sources/meta-qt6"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
     commit: "9e040ee8dd6025558ea60ac9db60c41bfeddf221"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
     commit: "491671faee11ea131feab5a3a451d1a01deb2ab1"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -50,6 +55,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
     commit: "11.00.15"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-beagle:
@@ -59,6 +65,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
     commit: "8e0f8af90fefb03f08cd2228cde7a89902a6b37c"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -67,10 +74,12 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
     commit: "eaa08939eaec9f620b14742ff3ac568553683034"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
     commit: "29d920f4c2249df7a69f00100924b4525e03c0d9"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/coresdk/coresdk-11.01.05-config.yml b/kas/coresdk/coresdk-=
11.01.05-config.yml
index def71c9..5b1a50c 100644
--- a/kas/coresdk/coresdk-11.01.05-config.yml
+++ b/kas/coresdk/coresdk-11.01.05-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
     commit: "139f61fe9eec221745184a14b3618d2dfa650b91"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
     commit: "11.01.05"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -28,16 +30,19 @@ repos:
     url: "https://code.qt.io/yocto/meta-qt6.git"
     branch: "6.9"
     commit: "18bda8b8a5cf03ad16ed3c52b110b63b98b8ed77"
+    path: "sources/meta-qt6"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
     commit: "9e040ee8dd6025558ea60ac9db60c41bfeddf221"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
     commit: "727811eaf256b88fd135be99559f2cbf14c82fce"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -50,11 +55,13 @@ repos:
     url: "https://git.yoctoproject.org/meta-lts-mixins"
     branch: "scarthgap/rust"
     commit: "a8046d5ec53b1856169ac795aa87cb0d5db84c04"
+    path: "sources/meta-lts-mixins"
=20
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
     commit: "11.01.05"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-beagle:
@@ -64,6 +71,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
     commit: "8e0f8af90fefb03f08cd2228cde7a89902a6b37c"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -72,10 +80,12 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
     commit: "eea5ec23155cfd47781599fdc9a92c21e4caffc8"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
     commit: "cfa97a50e06fb0fcc7cbc0ada54ce7ad5ba29ebe"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/coresdk/coresdk-11.01.07-config.yml b/kas/coresdk/coresdk-=
11.01.07-config.yml
index ef39bd6..73467ab 100644
--- a/kas/coresdk/coresdk-11.01.07-config.yml
+++ b/kas/coresdk/coresdk-11.01.07-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
     commit: "86e7a58c0e9904c33b1b94dddc3d683c2da22d1a"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
     commit: "11.01.07"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -28,16 +30,19 @@ repos:
     url: "https://code.qt.io/yocto/meta-qt6.git"
     branch: "6.9"
     commit: "2b4e60e319348ae2d53072b901645f30b4cc42bf"
+    path: "sources/meta-qt6"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
     commit: "a5449c0c50aa07d02186f548fe6bb6c1ce8823dc"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
     commit: "e8fd97d86af86cdcc5a6eb3f301cbaf6a2084943"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -50,11 +55,13 @@ repos:
     url: "https://git.yoctoproject.org/meta-lts-mixins"
     branch: "scarthgap/rust"
     commit: "a8046d5ec53b1856169ac795aa87cb0d5db84c04"
+    path: "sources/meta-lts-mixins"
=20
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
     commit: "11.01.07"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-beagle:
@@ -64,6 +71,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
     commit: "8e0f8af90fefb03f08cd2228cde7a89902a6b37c"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -72,10 +80,12 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
     commit: "aef850f7fa53121c74b244b7ae40d31fb9809ccf"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
     commit: "24c0ab18045920bb5c1e965c0ea6d176fd6de234"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/coresdk/coresdk-11.01.08-config.yml b/kas/coresdk/coresdk-=
11.01.08-config.yml
index 0a8dd3a..7a50ffd 100644
--- a/kas/coresdk/coresdk-11.01.08-config.yml
+++ b/kas/coresdk/coresdk-11.01.08-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
     commit: "86e7a58c0e9904c33b1b94dddc3d683c2da22d1a"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
     commit: "11.01.08"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -28,16 +30,19 @@ repos:
     url: "https://code.qt.io/yocto/meta-qt6.git"
     branch: "6.9"
     commit: "559e316dc5facf962ed06e3ac5dd2ecc20a4ae5b"
+    path: "sources/meta-qt6"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
     commit: "151273b120117468e70733020b6db864d8180c0b"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
     commit: "e8fd97d86af86cdcc5a6eb3f301cbaf6a2084943"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -50,11 +55,13 @@ repos:
     url: "https://git.yoctoproject.org/meta-lts-mixins"
     branch: "scarthgap/rust"
     commit: "65c51abe3871d50e599366765838d1478eba093e"
+    path: "sources/meta-lts-mixins"
=20
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
     commit: "11.01.08"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-beagle:
@@ -64,6 +71,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
     commit: "8e0f8af90fefb03f08cd2228cde7a89902a6b37c"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -72,10 +80,12 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
     commit: "aef850f7fa53121c74b244b7ae40d31fb9809ccf"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
     commit: "c374e6cfcdd2c8ba17d82ffcfdeb97d21144e2bf"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/coresdk/coresdk-11.01.16-config.yml b/kas/coresdk/coresdk-=
11.01.16-config.yml
index 6ff68aa..1c7365e 100644
--- a/kas/coresdk/coresdk-11.01.16-config.yml
+++ b/kas/coresdk/coresdk-11.01.16-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
     commit: "1c9ec1ffde75809de34c10d3ec2b40d84d258cb4"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
     commit: "11.01.16"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -28,16 +30,19 @@ repos:
     url: "https://code.qt.io/yocto/meta-qt6.git"
     branch: "6.9"
     commit: "c7d71f4cece4d1fe3110c945b9bd40ca82960e05"
+    path: "sources/meta-qt6"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
     commit: "af1db2042caf8021d767dce1b26c08b59b96f3d1"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
     commit: "e621da947048842109db1b4fd3917a02e0501aa2"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -50,11 +55,13 @@ repos:
     url: "https://git.yoctoproject.org/meta-lts-mixins"
     branch: "scarthgap/rust"
     commit: "a8046d5ec53b1856169ac795aa87cb0d5db84c04"
+    path: "sources/meta-lts-mixins"
=20
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
     commit: "11.01.16"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-beagle:
@@ -64,6 +71,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
     commit: "0f1e7bf92c89759f0ab74cfa5be4ee47b092ad46"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -72,10 +80,12 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
     commit: "057ee563305e9484b29d02347aeafdadc5ea28ed"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
     commit: "4cf131ebd157b79226533b5a5074691dd0e1a4ab"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/coresdk/coresdk-11.02.05-config.yml b/kas/coresdk/coresdk-=
11.02.05-config.yml
index 67db1c8..1860937 100644
--- a/kas/coresdk/coresdk-11.02.05-config.yml
+++ b/kas/coresdk/coresdk-11.02.05-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
     commit: "8dcf084522b9c66a6639b5f117f554fde9b6b45a"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
     commit: "11.02.05"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -28,16 +30,19 @@ repos:
     url: "https://code.qt.io/yocto/meta-qt6.git"
     branch: "6.9"
     commit: "c7d71f4cece4d1fe3110c945b9bd40ca82960e05"
+    path: "sources/meta-qt6"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
     commit: "af1db2042caf8021d767dce1b26c08b59b96f3d1"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
     commit: "f1f248262d662315159ee96c604f97415d1dbe6a"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -50,11 +55,13 @@ repos:
     url: "https://git.yoctoproject.org/meta-lts-mixins"
     branch: "scarthgap/rust"
     commit: "a8046d5ec53b1856169ac795aa87cb0d5db84c04"
+    path: "sources/meta-lts-mixins"
=20
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
     commit: "11.02.05"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-beagle:
@@ -64,6 +71,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
     commit: "a81c19915b5b9e71ed394032e9a50fd06919e1cd"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -72,10 +80,12 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
     commit: "731488911f55ebfe746068512b426351192f82f2"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
     commit: "06d4981313ce67a8d53b1c14be9845b4b5a9f4cf"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/coresdk/coresdk-11.02.08-config.yml b/kas/coresdk/coresdk-=
11.02.08-config.yml
index 50034fa..7b585e1 100644
--- a/kas/coresdk/coresdk-11.02.08-config.yml
+++ b/kas/coresdk/coresdk-11.02.08-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
     commit: "8dcf084522b9c66a6639b5f117f554fde9b6b45a"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
     commit: "11.02.08"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -28,16 +30,19 @@ repos:
     url: "https://code.qt.io/yocto/meta-qt6.git"
     branch: "6.9"
     commit: "c7d71f4cece4d1fe3110c945b9bd40ca82960e05"
+    path: "sources/meta-qt6"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
     commit: "17ac21e7d7f6f40a87618b22278b63bcfa14dbf2"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
     commit: "89a01c3d9ad1f8fce6aeb4dd0e694cfa28d42099"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -50,11 +55,13 @@ repos:
     url: "https://git.yoctoproject.org/meta-lts-mixins"
     branch: "scarthgap/rust"
     commit: "a8046d5ec53b1856169ac795aa87cb0d5db84c04"
+    path: "sources/meta-lts-mixins"
=20
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
     commit: "11.02.08"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-beagle:
@@ -64,6 +71,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
     commit: "a81c19915b5b9e71ed394032e9a50fd06919e1cd"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -72,10 +80,12 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
     commit: "731488911f55ebfe746068512b426351192f82f2"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
     commit: "1fbd9eddbdf0da062df0510cabff6f6ee33d5752"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/coresdk/coresdk-11.02.10-config.yml b/kas/coresdk/coresdk-=
11.02.10-config.yml
index df5d5a4..a89326d 100644
--- a/kas/coresdk/coresdk-11.02.10-config.yml
+++ b/kas/coresdk/coresdk-11.02.10-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
     commit: "8dcf084522b9c66a6639b5f117f554fde9b6b45a"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
     commit: "11.02.10"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -28,16 +30,19 @@ repos:
     url: "https://code.qt.io/yocto/meta-qt6.git"
     branch: "6.9"
     commit: "c7d71f4cece4d1fe3110c945b9bd40ca82960e05"
+    path: "sources/meta-qt6"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
     commit: "17ac21e7d7f6f40a87618b22278b63bcfa14dbf2"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
     commit: "b4812b18eec77e9f0286bd6b81a5c3032ac0d3be"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -50,11 +55,13 @@ repos:
     url: "https://git.yoctoproject.org/meta-lts-mixins"
     branch: "scarthgap/rust"
     commit: "a8046d5ec53b1856169ac795aa87cb0d5db84c04"
+    path: "sources/meta-lts-mixins"
=20
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
     commit: "11.02.10"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-beagle:
@@ -64,6 +71,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
     commit: "a81c19915b5b9e71ed394032e9a50fd06919e1cd"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -72,10 +80,12 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
     commit: "5c602337ea1a80fb7217eeda04e396cf90587dca"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
     commit: "2b3d2b671a149cbeea2bdc9ba42192da2015c3b7"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/distroless-kirkstone-config.yml b/kas/distroless-kirkstone=
-config.yml
index 78be0a1..2e87f81 100644
--- a/kas/distroless-kirkstone-config.yml
+++ b/kas/distroless-kirkstone-config.yml
@@ -2,19 +2,21 @@
 header:
   version: 17
   includes:
-    - ./templates/bblayers.conf.yml
-    - ./templates/local-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-v2.conf.yml
=20
 repos:
   bitbake:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.0"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "kirkstone"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -22,6 +24,7 @@ repos:
   meta-arm:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "kirkstone"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -29,5 +32,6 @@ repos:
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "kirkstone"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/distroless-master-config.yml b/kas/distroless-master-confi=
g.yml
index 082c9a7..1207ec0 100644
--- a/kas/distroless-master-config.yml
+++ b/kas/distroless-master-config.yml
@@ -2,19 +2,21 @@
 header:
   version: 17
   includes:
-    - ./templates/bblayers.conf.yml
-    - ./templates/local-v3.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-v3.conf.yml
=20
 repos:
   bitbake:
     url: "https://git.openembedded.org/bitbake"
     branch: "master"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "master"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -22,6 +24,7 @@ repos:
   meta-arm:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "master"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -29,5 +32,6 @@ repos:
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "master"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/distroless-scarthgap-config.yml b/kas/distroless-scarthgap=
-config.yml
index fe21b7f..bbf46e4 100644
--- a/kas/distroless-scarthgap-config.yml
+++ b/kas/distroless-scarthgap-config.yml
@@ -2,19 +2,21 @@
 header:
   version: 17
   includes:
-    - ./templates/bblayers.conf.yml
-    - ./templates/local-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-v2.conf.yml
=20
 repos:
   bitbake:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -22,6 +24,7 @@ repos:
   meta-arm:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -29,5 +32,6 @@ repos:
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/poky-kirkstone-config.yml b/kas/poky-kirkstone-config.yml
index 474f7b8..b21b7a7 100644
--- a/kas/poky-kirkstone-config.yml
+++ b/kas/poky-kirkstone-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ./templates/bblayers.conf.yml
-    - ./templates/local-poky-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-poky-v2.conf.yml
=20
 target: core_image_minimal
=20
@@ -11,12 +11,14 @@ repos:
   bitbake:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.0"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
   meta-yocto:
     url: "https://git.yoctoproject.org/meta-yocto"
     branch: "kirkstone"
+    path: "sources/meta-yocto"
     layers:
       meta-poky:
       meta-yocto-bsp:
@@ -24,6 +26,7 @@ repos:
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "kirkstone"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -31,6 +34,7 @@ repos:
   meta-arm:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "kirkstone"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -38,12 +42,14 @@ repos:
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "kirkstone"
+    path: "sources/oe-core"
     layers:
       meta:
=20
   meta-arago:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "kirkstone"
+    path: "sources/meta-arago"
     layers:
       meta-arago-extras:
       meta-arago-test:
diff --git a/kas/poky-master-config.yml b/kas/poky-master-config.yml
index 61b54fa..7d66844 100644
--- a/kas/poky-master-config.yml
+++ b/kas/poky-master-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ./templates/bblayers.conf.yml
-    - ./templates/local-poky-v3.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-poky-v3.conf.yml
=20
 target: core_image_minimal
=20
@@ -11,12 +11,14 @@ repos:
   bitbake:
     url: "https://git.openembedded.org/bitbake"
     branch: "master"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
   meta-yocto:
     url: "https://git.yoctoproject.org/meta-yocto"
     branch: "master"
+    path: "sources/meta-yocto"
     layers:
       meta-poky:
       meta-yocto-bsp:
@@ -24,6 +26,7 @@ repos:
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "master"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -31,6 +34,7 @@ repos:
   meta-arm:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "master"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -38,12 +42,14 @@ repos:
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "master"
+    path: "sources/oe-core"
     layers:
       meta:
=20
   meta-arago:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "master"
+    path: "sources/meta-arago"
     layers:
       meta-arago-extras:
       meta-arago-test:
diff --git a/kas/poky-master-wip-config.yml b/kas/poky-master-wip-config.ym=
l
index 301ce93..7a92b90 100644
--- a/kas/poky-master-wip-config.yml
+++ b/kas/poky-master-wip-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ./templates/bblayers.conf.yml
-    - ./templates/local-poky-v3.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-poky-v3.conf.yml
=20
 target: core_image_minimal
=20
@@ -11,12 +11,14 @@ repos:
   bitbake:
     url: "https://git.openembedded.org/bitbake"
     branch: "master"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
   meta-yocto:
     url: "https://git.yoctoproject.org/meta-yocto"
     branch: "master"
+    path: "sources/meta-yocto"
     layers:
       meta-poky:
       meta-yocto-bsp:
@@ -24,6 +26,7 @@ repos:
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "master-wip"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -31,6 +34,7 @@ repos:
   meta-arm:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "master"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -38,12 +42,14 @@ repos:
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "master"
+    path: "sources/oe-core"
     layers:
       meta:
=20
   meta-arago:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "master-wip"
+    path: "sources/meta-arago"
     layers:
       meta-arago-extras:
       meta-arago-test:
diff --git a/kas/poky-scarthgap-config.yml b/kas/poky-scarthgap-config.yml
index d93e57f..2e45c6f 100644
--- a/kas/poky-scarthgap-config.yml
+++ b/kas/poky-scarthgap-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ./templates/bblayers.conf.yml
-    - ./templates/local-poky-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-poky-v2.conf.yml
=20
 target: core_image_minimal
=20
@@ -11,12 +11,14 @@ repos:
   bitbake:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
   meta-yocto:
     url: "https://git.yoctoproject.org/meta-yocto"
     branch: "scarthgap"
+    path: "sources/meta-yocto"
     layers:
       meta-poky:
       meta-yocto-bsp:
@@ -24,6 +26,7 @@ repos:
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -31,6 +34,7 @@ repos:
   meta-arm:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -38,12 +42,14 @@ repos:
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
+    path: "sources/oe-core"
     layers:
       meta:
=20
   meta-arago:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
+    path: "sources/meta-arago"
     layers:
       meta-arago-extras:
       meta-arago-test:
diff --git a/kas/poky-scarthgap-wip-config.yml b/kas/poky-scarthgap-wip-con=
fig.yml
index 83bfac3..8535658 100644
--- a/kas/poky-scarthgap-wip-config.yml
+++ b/kas/poky-scarthgap-wip-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ./templates/bblayers.conf.yml
-    - ./templates/local-poky-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-poky-v2.conf.yml
=20
 target: core_image_minimal
=20
@@ -11,12 +11,14 @@ repos:
   bitbake:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
   meta-yocto:
     url: "https://git.yoctoproject.org/meta-yocto"
     branch: "scarthgap"
+    path: "sources/meta-yocto"
     layers:
       meta-poky:
       meta-yocto-bsp:
@@ -24,6 +26,7 @@ repos:
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap-wip"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -31,6 +34,7 @@ repos:
   meta-arm:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -38,5 +42,6 @@ repos:
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/processor-sdk-analytics/processor-sdk-analytics-09.00.00-c=
onfig.yml b/kas/processor-sdk-analytics/processor-sdk-analytics-09.00.00-co=
nfig.yml
index bd28716..d21c4aa 100644
--- a/kas/processor-sdk-analytics/processor-sdk-analytics-09.00.00-config.y=
ml
+++ b/kas/processor-sdk-analytics/processor-sdk-analytics-09.00.00-config.y=
ml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.0"
     commit: "907416ee1062f87f5844ab0638b54616abfc1a22"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "kirkstone"
     commit: "4d7741adb72c626d05b845867c72f157b64d5944"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -28,16 +30,19 @@ repos:
     url: "https://github.com/meta-qt5/meta-qt5.git"
     branch: "kirkstone"
     commit: "bff5bd937f0776166e81a63f3dd39ede348ef758"
+    path: "sources/meta-qt5"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "kirkstone"
     commit: "b3b3dbc67504e8cd498d6db202ddcf5a9dd26a9d"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "kirkstone"
     commit: "346753705e49a2486867dc150181a1c7f4d69377"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -49,6 +54,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "kirkstone"
     commit: "474af844b0e808f5401ab0b89e59d1ade39f3d16"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -57,6 +63,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "kirkstone"
     commit: "c39bb4ce3b60b73d35c5fb06af012432e70d6b38"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -65,6 +72,7 @@ repos:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "kirkstone"
     commit: "cef730284b8616ba07c1b062c992c36af730580e"
+    path: "sources/oe-core"
     layers:
       meta:
=20
@@ -72,8 +80,10 @@ repos:
     url: "https://git.ti.com/git/jacinto-linux/meta-psdkla.git"
     branch: "kirkstone"
     commit: "9c754ecda6f1019d0126dd4dc163e0ae01772eb0"
+    path: "sources/meta-psdkla"
=20
   meta-edgeai:
     url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
     branch: "kirkstone"
     commit: "c0acda7c6920b9f9f3ebccd5c9ce19f52934a51f"
+    path: "sources/meta-edgeai"
diff --git a/kas/processor-sdk-analytics/processor-sdk-analytics-09.00.01-c=
onfig.yml b/kas/processor-sdk-analytics/processor-sdk-analytics-09.00.01-co=
nfig.yml
index ece38f1..9f3684e 100644
--- a/kas/processor-sdk-analytics/processor-sdk-analytics-09.00.01-config.y=
ml
+++ b/kas/processor-sdk-analytics/processor-sdk-analytics-09.00.01-config.y=
ml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.0"
     commit: "907416ee1062f87f5844ab0638b54616abfc1a22"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "kirkstone"
     commit: "9c11eab21e7abe564f4c9f0821e830dd7298b365"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -28,16 +30,19 @@ repos:
     url: "https://github.com/meta-qt5/meta-qt5.git"
     branch: "kirkstone"
     commit: "bff5bd937f0776166e81a63f3dd39ede348ef758"
+    path: "sources/meta-qt5"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "kirkstone"
     commit: "b3b3dbc67504e8cd498d6db202ddcf5a9dd26a9d"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "kirkstone"
     commit: "346753705e49a2486867dc150181a1c7f4d69377"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -49,6 +54,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "kirkstone"
     commit: "c3916324a01fe96c68a78ef9ed0070d6b1fc8f2f"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -57,6 +63,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "kirkstone"
     commit: "c39bb4ce3b60b73d35c5fb06af012432e70d6b38"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -65,6 +72,7 @@ repos:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "kirkstone"
     commit: "cef730284b8616ba07c1b062c992c36af730580e"
+    path: "sources/oe-core"
     layers:
       meta:
=20
@@ -72,8 +80,10 @@ repos:
     url: "https://git.ti.com/git/jacinto-linux/meta-psdkla.git"
     branch: "kirkstone"
     commit: "9c754ecda6f1019d0126dd4dc163e0ae01772eb0"
+    path: "sources/meta-psdkla"
=20
   meta-edgeai:
     url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
     branch: "kirkstone"
     commit: "5ad5799ae51dfd335b6dc4a87200fb96e8b86d7e"
+    path: "sources/meta-edgeai"
diff --git a/kas/processor-sdk-analytics/processor-sdk-analytics-09.01.00-c=
onfig.yml b/kas/processor-sdk-analytics/processor-sdk-analytics-09.01.00-co=
nfig.yml
index a2ae0d3..223c21b 100644
--- a/kas/processor-sdk-analytics/processor-sdk-analytics-09.01.00-config.y=
ml
+++ b/kas/processor-sdk-analytics/processor-sdk-analytics-09.01.00-config.y=
ml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.0"
     commit: "42a1c9fe698a03feb34c5bba223c6e6e0350925b"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "kirkstone"
     commit: "190e2b58fb6c1e3c658fe2f7afc40a2863007bbc"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -29,16 +31,19 @@ repos:
     url: "https://github.com/meta-qt5/meta-qt5.git"
     branch: "kirkstone"
     commit: "ae8a97f79364bed1abc297636f7933d0e35f22be"
+    path: "sources/meta-qt5"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "kirkstone"
     commit: "67b0ef4256a484851f3556d281ca4caa88374388"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "kirkstone"
     commit: "402affcc073db39f782c1ebfd718edd5f11eed4c"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -50,6 +55,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "kirkstone"
     commit: "6ad91a192fa1ab33775a22894a413aefd0b67106"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -58,6 +64,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "kirkstone"
     commit: "b187fb9232ca0a6b5f8f90b4715958546fc41d73"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -66,6 +73,7 @@ repos:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "kirkstone"
     commit: "b77cd331199fa62e3b162f37efca3b927c68d8e5"
+    path: "sources/oe-core"
     layers:
       meta:
=20
@@ -73,8 +81,10 @@ repos:
     url: "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
     branch: "kirkstone"
     commit: "d0a92bc0a53276a3faad16ed52084451f4d1b3bf"
+    path: "sources/meta-tisdk"
=20
   meta-edgeai:
     url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
     branch: "kirkstone"
     commit: "fa42c52098a72461921dd3fb848ff1271bdb7425"
+    path: "sources/meta-edgeai"
diff --git a/kas/processor-sdk-analytics/processor-sdk-analytics-09.02.00-c=
onfig.yml b/kas/processor-sdk-analytics/processor-sdk-analytics-09.02.00-co=
nfig.yml
index 03c9147..11ef4ab 100644
--- a/kas/processor-sdk-analytics/processor-sdk-analytics-09.02.00-config.y=
ml
+++ b/kas/processor-sdk-analytics/processor-sdk-analytics-09.02.00-config.y=
ml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.0"
     commit: "40fd5f4eef7460ca67f32cfce8e229e67e1ff607"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "kirkstone"
     commit: "98f178314931635c8641d1394dfd4341b86b6be2"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -29,16 +31,19 @@ repos:
     url: "https://github.com/meta-qt5/meta-qt5.git"
     branch: "kirkstone"
     commit: "ae8a97f79364bed1abc297636f7933d0e35f22be"
+    path: "sources/meta-qt5"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "kirkstone"
     commit: "cb2bc17e96552cdfc141d27bd9f4dbd95a872846"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "kirkstone"
     commit: "8bb16533532b6abc2eded7d9961ab2a108fd7a5b"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -50,6 +55,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "kirkstone"
     commit: "376a2143533c6497b4e79304eccca2a630784436"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -58,6 +64,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "kirkstone"
     commit: "d7b7b6fb6c7c5545e718e44f38853d1718ce5446"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -66,6 +73,7 @@ repos:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "kirkstone"
     commit: "1b5405955c7c2579ed1f52522e2e177d0281fa33"
+    path: "sources/oe-core"
     layers:
       meta:
=20
@@ -73,8 +81,10 @@ repos:
     url: "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
     branch: "kirkstone"
     commit: "b127f5f2a16fdc092a339939cf04c2fc92f15a34"
+    path: "sources/meta-tisdk"
=20
   meta-edgeai:
     url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
     branch: "kirkstone"
     commit: "0de8484d01ea85a7c366e6b56b1119613321dddb"
+    path: "sources/meta-edgeai"
diff --git a/kas/processor-sdk-analytics/processor-sdk-analytics-10.00.00-c=
onfig.yml b/kas/processor-sdk-analytics/processor-sdk-analytics-10.00.00-co=
nfig.yml
index f045088..96f0937 100644
--- a/kas/processor-sdk-analytics/processor-sdk-analytics-10.00.00-config.y=
ml
+++ b/kas/processor-sdk-analytics/processor-sdk-analytics-10.00.00-config.y=
ml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
     commit: "11d83170922a2c6b9db1f6e8c23e533526984b2c"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
     commit: "cbf054c7401af6e1e8bcc4eab07daa9a4996f7f3"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -29,16 +31,19 @@ repos:
     url: "https://github.com/meta-qt5/meta-qt5.git"
     branch: "scarthgap"
     commit: "eb828418264a49b8d00035cb3d7b12fcea3be801"
+    path: "sources/meta-qt5"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
     commit: "54b806b1985f3989722ee308e1073530fe3328c1"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
     commit: "80e01188fa822d87d301ee71973c462d7a865493"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -51,6 +56,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
     commit: "84328ead40d7e6fcce4d80ab7d07f4dcaf9d777e"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -59,6 +65,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
     commit: "ecece16871afe6b674d2aafd27e0f18bbaef1966"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -67,6 +74,7 @@ repos:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
     commit: "bf3fe8c01c5cc00ada22049f4f0abb485e2a626f"
+    path: "sources/oe-core"
     layers:
       meta:
=20
@@ -74,8 +82,10 @@ repos:
     url: "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
     branch: "scarthgap"
     commit: "af81e0d81c5efd005bfc0ef749f690f9748c70f6"
+    path: "sources/meta-tisdk"
=20
   meta-edgeai:
     url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
     branch: "scarthgap"
     commit: "a3b8006957fbc31f8375a5989be7c42b2ba2959b"
+    path: "sources/meta-edgeai"
diff --git a/kas/processor-sdk-analytics/processor-sdk-analytics-10.01.00-c=
onfig.yml b/kas/processor-sdk-analytics/processor-sdk-analytics-10.01.00-co=
nfig.yml
index 552a3d9..3f4fda1 100644
--- a/kas/processor-sdk-analytics/processor-sdk-analytics-10.01.00-config.y=
ml
+++ b/kas/processor-sdk-analytics/processor-sdk-analytics-10.01.00-config.y=
ml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
     commit: "f40a3a477d5241b697bf2fb030dd804c1ff5839f"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
     commit: "b6349e47760397add572cc27468e0f30b40474c1"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -29,16 +31,19 @@ repos:
     url: "https://github.com/meta-qt5/meta-qt5.git"
     branch: "scarthgap"
     commit: "a1af9bdf2bcf06df85aeac997bfbdcb414d8e0e0"
+    path: "sources/meta-qt5"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
     commit: "450941a1b6df96285691e8c23d4f332d3c88a994"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
     commit: "b8d1a14f7f3b76457c36752202ea7ae5881b6654"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -51,6 +56,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
     commit: "f06324bc1649e4f437686560cbd66f973ba920f5"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -59,6 +65,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
     commit: "7088279c0ab00c7dabefdd4544951b4746b48476"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -67,11 +74,13 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
     commit: "9fbfa9db33131abdf3870a94f00199eb53e276e5"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
     commit: "92cb4641ff4ec8c1f681bca21cfeaf2ba6923ab7"
+    path: "sources/oe-core"
     layers:
       meta:
=20
@@ -79,8 +88,10 @@ repos:
     url: "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
     branch: "scarthgap"
     commit: "fcd7661087b0dd5b5b57d30ba0d45f2698e962f8"
+    path: "sources/meta-tisdk"
=20
   meta-edgeai:
     url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
     branch: "scarthgap"
     commit: "41499d7bcc8d37862b93c0d56cf782f9182d0be1"
+    path: "sources/meta-edgeai"
diff --git a/kas/processor-sdk-analytics/processor-sdk-analytics-11.00.00-c=
onfig.yml b/kas/processor-sdk-analytics/processor-sdk-analytics-11.00.00-co=
nfig.yml
index 1e09702..530e982 100644
--- a/kas/processor-sdk-analytics/processor-sdk-analytics-11.00.00-config.y=
ml
+++ b/kas/processor-sdk-analytics/processor-sdk-analytics-11.00.00-config.y=
ml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
     commit: "696c2c1ef095f8b11c7d2eff36fae50f58c62e5e"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
     commit: "c04e85dd207dd24387edac10526b9ec971df9496"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -28,16 +30,19 @@ repos:
     url: "https://code.qt.io/yocto/meta-qt6.git"
     branch: "6.9"
     commit: "fce7cf8c3aa54b3650a30a79dce705838c32f3c3"
+    path: "sources/meta-qt6"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
     commit: "9e040ee8dd6025558ea60ac9db60c41bfeddf221"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
     commit: "e92d0173a80ea7592c866618ef5293203c50544c"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -50,6 +55,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
     commit: "a98a2e1029870b25e117d4c9410e75bfd955f35a"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -58,6 +64,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
     commit: "8e0f8af90fefb03f08cd2228cde7a89902a6b37c"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -66,11 +73,13 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
     commit: "eaa08939eaec9f620b14742ff3ac568553683034"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
     commit: "b214cc84a922f7a3fb7ebbc501189ce25e8bd2bd"
+    path: "sources/oe-core"
     layers:
       meta:
=20
@@ -78,6 +87,7 @@ repos:
     url: "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
     branch: "scarthgap"
     commit: "1f96dccc01f10c73295e0bac6a15a97d3d4562fd"
+    path: "sources/meta-tisdk"
     layers:
       meta-ti-foundational:
=20
@@ -85,3 +95,4 @@ repos:
     url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
     branch: "scarthgap"
     commit: "81d1b80b2a314814c6d900e82ea2da93eee3f57d"
+    path: "sources/meta-edgeai"
diff --git a/kas/processor-sdk-analytics/processor-sdk-analytics-11.01.00-c=
onfig.yml b/kas/processor-sdk-analytics/processor-sdk-analytics-11.01.00-co=
nfig.yml
index b1e2dca..8d7292e 100644
--- a/kas/processor-sdk-analytics/processor-sdk-analytics-11.01.00-config.y=
ml
+++ b/kas/processor-sdk-analytics/processor-sdk-analytics-11.01.00-config.y=
ml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
     commit: "86e7a58c0e9904c33b1b94dddc3d683c2da22d1a"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
     commit: "b253a46d52348996c2abcd9d309c1a8da1e63ca1"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -28,16 +30,19 @@ repos:
     url: "https://code.qt.io/yocto/meta-qt6.git"
     branch: "6.9"
     commit: "559e316dc5facf962ed06e3ac5dd2ecc20a4ae5b"
+    path: "sources/meta-qt6"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
     commit: "151273b120117468e70733020b6db864d8180c0b"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
     commit: "e8fd97d86af86cdcc5a6eb3f301cbaf6a2084943"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -50,6 +55,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
     commit: "0353868b3f625ee43a671a211245cc14cddbda7d"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -58,6 +64,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
     commit: "8e0f8af90fefb03f08cd2228cde7a89902a6b37c"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -66,11 +73,13 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
     commit: "aef850f7fa53121c74b244b7ae40d31fb9809ccf"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
     commit: "c374e6cfcdd2c8ba17d82ffcfdeb97d21144e2bf"
+    path: "sources/oe-core"
     layers:
       meta:
=20
@@ -78,6 +87,7 @@ repos:
     url: "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
     branch: "scarthgap"
     commit: "487eab23a220d225cf31ca9649630f5b83488068"
+    path: "sources/meta-tisdk"
     layers:
       meta-ti-foundational:
=20
@@ -85,3 +95,4 @@ repos:
     url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
     branch: "scarthgap"
     commit: "42fb59bb661dd2a467e6df7f5ddf8ec21661083c"
+    path: "sources/meta-edgeai"
diff --git a/kas/processor-sdk-analytics/processor-sdk-analytics-11.01.07.0=
5-config.yml b/kas/processor-sdk-analytics/processor-sdk-analytics-11.01.07=
.05-config.yml
index 2993b0d..ddccecf 100644
--- a/kas/processor-sdk-analytics/processor-sdk-analytics-11.01.07.05-confi=
g.yml
+++ b/kas/processor-sdk-analytics/processor-sdk-analytics-11.01.07.05-confi=
g.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
     commit: "86e7a58c0e9904c33b1b94dddc3d683c2da22d1a"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://github.com/TexasInstruments/meta-tisdk.git"
     branch: "scarthgap"
     commit: "11.01.07.05"
+    path: "sources/meta-tisdk"
     layers:
       meta-ti-foundational:
=20
@@ -26,6 +28,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
     commit: "11.01.07"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -35,16 +38,19 @@ repos:
     url: "https://code.qt.io/yocto/meta-qt6.git"
     branch: "6.9"
     commit: "2b4e60e319348ae2d53072b901645f30b4cc42bf"
+    path: "sources/meta-qt6"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
     commit: "a5449c0c50aa07d02186f548fe6bb6c1ce8823dc"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
     commit: "e8fd97d86af86cdcc5a6eb3f301cbaf6a2084943"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -57,11 +63,13 @@ repos:
     url: "https://git.yoctoproject.org/meta-lts-mixins"
     branch: "scarthgap/rust"
     commit: "a8046d5ec53b1856169ac795aa87cb0d5db84c04"
+    path: "sources/meta-lts-mixins"
=20
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
     commit: "11.01.07"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-beagle:
@@ -71,6 +79,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
     commit: "8e0f8af90fefb03f08cd2228cde7a89902a6b37c"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -79,11 +88,13 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
     commit: "aef850f7fa53121c74b244b7ae40d31fb9809ccf"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
     commit: "24c0ab18045920bb5c1e965c0ea6d176fd6de234"
+    path: "sources/oe-core"
     layers:
       meta:
=20
@@ -91,3 +102,4 @@ repos:
     url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
     branch: "scarthgap"
     commit: "11.01.07.05"
+    path: "sources/meta-edgeai"
diff --git a/kas/processor-sdk-analytics/processor-sdk-analytics-11.02.00-c=
onfig.yml b/kas/processor-sdk-analytics/processor-sdk-analytics-11.02.00-co=
nfig.yml
index 1677de8..d90ea43 100644
--- a/kas/processor-sdk-analytics/processor-sdk-analytics-11.02.00-config.y=
ml
+++ b/kas/processor-sdk-analytics/processor-sdk-analytics-11.02.00-config.y=
ml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
     commit: "8dcf084522b9c66a6639b5f117f554fde9b6b45a"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
     commit: "1640df60b0f75722b9e5923a5bfba3767e7d97a8"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -28,16 +30,19 @@ repos:
     url: "https://code.qt.io/yocto/meta-qt6.git"
     branch: "6.9"
     commit: "c7d71f4cece4d1fe3110c945b9bd40ca82960e05"
+    path: "sources/meta-qt6"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
     commit: "17ac21e7d7f6f40a87618b22278b63bcfa14dbf2"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
     commit: "e76bf51a92b41d4cb185fc164ae43a863910ccd1"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -50,11 +55,13 @@ repos:
     url: "https://git.yoctoproject.org/meta-lts-mixins"
     branch: "scarthgap/rust"
     commit: "a8046d5ec53b1856169ac795aa87cb0d5db84c04"
+    path: "sources/meta-lts-mixins"
=20
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
     commit: "ea8c0b1cf1ab8a0b327e3feb1144c1ccf05b8278"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-beagle:
@@ -64,6 +71,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
     commit: "a81c19915b5b9e71ed394032e9a50fd06919e1cd"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -72,11 +80,13 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
     commit: "5c602337ea1a80fb7217eeda04e396cf90587dca"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
     commit: "2b3d2b671a149cbeea2bdc9ba42192da2015c3b7"
+    path: "sources/oe-core"
     layers:
       meta:
=20
@@ -84,6 +94,7 @@ repos:
     url: "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
     branch: "scarthgap"
     commit: "32482cad2f630892b733c1457b9e9d835b098174"
+    path: "sources/meta-tisdk"
     layers:
       meta-ti-foundational:
=20
@@ -91,3 +102,4 @@ repos:
     url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
     branch: "scarthgap"
     commit: "7d07e25a15632494d6c30efb09d68de1c95f9394"
+    path: "sources/meta-edgeai"
diff --git a/kas/processor-sdk-analytics/processor-sdk-analytics-selinux-11=
.01.07.05-config.yml b/kas/processor-sdk-analytics/processor-sdk-analytics-=
selinux-11.01.07.05-config.yml
index 05d8def..21dc74e 100644
--- a/kas/processor-sdk-analytics/processor-sdk-analytics-selinux-11.01.07.=
05-config.yml
+++ b/kas/processor-sdk-analytics/processor-sdk-analytics-selinux-11.01.07.=
05-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
     commit: "86e7a58c0e9904c33b1b94dddc3d683c2da22d1a"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://github.com/TexasInstruments/meta-tisdk.git"
     branch: "scarthgap"
     commit: "11.01.07.05"
+    path: "sources/meta-tisdk"
     layers:
       meta-ti-foundational:
=20
@@ -26,6 +28,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
     commit: "11.01.07"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -35,21 +38,25 @@ repos:
     url: "https://git.yoctoproject.org/meta-selinux"
     branch: "scarthgap"
     commit: "30a49ab1298d2a081089a9e4c760a9e02f8100f6"
+    path: "sources/meta-selinux"
=20
   meta-qt6:
     url: "https://code.qt.io/yocto/meta-qt6.git"
     branch: "6.9"
     commit: "2b4e60e319348ae2d53072b901645f30b4cc42bf"
+    path: "sources/meta-qt6"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
     commit: "a5449c0c50aa07d02186f548fe6bb6c1ce8823dc"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
     commit: "e8fd97d86af86cdcc5a6eb3f301cbaf6a2084943"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -62,11 +69,13 @@ repos:
     url: "https://git.yoctoproject.org/meta-lts-mixins"
     branch: "scarthgap/rust"
     commit: "a8046d5ec53b1856169ac795aa87cb0d5db84c04"
+    path: "sources/meta-lts-mixins"
=20
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
     commit: "11.01.07"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-beagle:
@@ -76,6 +85,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
     commit: "8e0f8af90fefb03f08cd2228cde7a89902a6b37c"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -84,11 +94,13 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
     commit: "aef850f7fa53121c74b244b7ae40d31fb9809ccf"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
     commit: "24c0ab18045920bb5c1e965c0ea6d176fd6de234"
+    path: "sources/oe-core"
     layers:
       meta:
=20
@@ -96,6 +108,7 @@ repos:
     url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
     branch: "scarthgap"
     commit: "11.01.07.05"
+    path: "sources/meta-edgeai"
=20
 local_conf_header:
   oe-layersetup-local-conf-config-specific: |
diff --git a/kas/processor-sdk-linux/processor-sdk-gateway-10_00.yml b/kas/=
processor-sdk-linux/processor-sdk-gateway-10_00.yml
index 289e0b6..5193797 100644
--- a/kas/processor-sdk-linux/processor-sdk-gateway-10_00.yml
+++ b/kas/processor-sdk-linux/processor-sdk-gateway-10_00.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
     commit: "11d83170922a2c6b9db1f6e8c23e533526984b2c"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
     commit: "82833bae8835e06301c23c8833642ae4c02d303a"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -29,16 +31,19 @@ repos:
     url: "https://github.com/meta-qt5/meta-qt5.git"
     branch: "scarthgap"
     commit: "eb828418264a49b8d00035cb3d7b12fcea3be801"
+    path: "sources/meta-qt5"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
     commit: "6a80f140e387621f62964209a2e07d3bcfb125ce"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
     commit: "18f939a5fb37528a5415b05077ece383c346a119"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -51,6 +56,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
     commit: "138077349667614f83637c98798c06249615a23e"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -59,6 +65,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
     commit: "1b85bbb4cab9658da3cd926c62038b8559c5c64e"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -67,11 +74,13 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
     commit: "df21b1563910c80d7e2964971b7c5b79b5186922"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
     commit: "c00a9a8f25b0042b0723a5d20b88e92d473d22bf"
+    path: "sources/oe-core"
     layers:
       meta:
=20
@@ -79,6 +88,7 @@ repos:
     url: "https://git.ti.com/cgit/ti-sdk-linux/meta-tisdk"
     branch: "scarthgap"
     commit: "af81e0d81c5efd005bfc0ef749f690f9748c70f6"
+    path: "sources/meta-tisdk"
=20
 local_conf_header:
   oe-layersetup-local-conf-config-specific: |
diff --git a/kas/processor-sdk-linux/processor-sdk-linux-09_00_00_06.yml b/=
kas/processor-sdk-linux/processor-sdk-linux-09_00_00_06.yml
index 0f01fba..ac532ac 100644
--- a/kas/processor-sdk-linux/processor-sdk-linux-09_00_00_06.yml
+++ b/kas/processor-sdk-linux/processor-sdk-linux-09_00_00_06.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.0"
     commit: "907416ee1062f87f5844ab0638b54616abfc1a22"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "kirkstone"
     commit: "09.00.00.007"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -28,16 +30,19 @@ repos:
     url: "https://github.com/meta-qt5/meta-qt5.git"
     branch: "kirkstone"
     commit: "bff5bd937f0776166e81a63f3dd39ede348ef758"
+    path: "sources/meta-qt5"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "kirkstone"
     commit: "b3b3dbc67504e8cd498d6db202ddcf5a9dd26a9d"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "kirkstone"
     commit: "346753705e49a2486867dc150181a1c7f4d69377"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -49,6 +54,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "kirkstone"
     commit: "09.00.00.007"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -57,6 +63,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "kirkstone"
     commit: "c39bb4ce3b60b73d35c5fb06af012432e70d6b38"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -65,6 +72,7 @@ repos:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "kirkstone"
     commit: "200c2783b3f8546f561382fff6bd5268680d403a"
+    path: "sources/oe-core"
     layers:
       meta:
=20
@@ -72,11 +80,13 @@ repos:
     url: "https://github.com/aws/meta-aws.git"
     branch: "kirkstone"
     commit: "b72cb364f79aa055242e703e284900b23e61facd"
+    path: "sources/meta-aws"
=20
   meta-psdkla:
     url: "https://git.ti.com/git/jacinto-linux/meta-psdkla.git"
     branch: "kirkstone"
     commit: "09.00.00.06"
+    path: "sources/meta-psdkla"
=20
 local_conf_header:
   oe-layersetup-local-conf-config-specific: |
diff --git a/kas/processor-sdk-linux/processor-sdk-linux-09_00_00_07.yml b/=
kas/processor-sdk-linux/processor-sdk-linux-09_00_00_07.yml
index 04a4c1b..da962fc 100644
--- a/kas/processor-sdk-linux/processor-sdk-linux-09_00_00_07.yml
+++ b/kas/processor-sdk-linux/processor-sdk-linux-09_00_00_07.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.0"
     commit: "907416ee1062f87f5844ab0638b54616abfc1a22"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "kirkstone"
     commit: "09.00.00.007"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -28,16 +30,19 @@ repos:
     url: "https://github.com/meta-qt5/meta-qt5.git"
     branch: "kirkstone"
     commit: "bff5bd937f0776166e81a63f3dd39ede348ef758"
+    path: "sources/meta-qt5"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "kirkstone"
     commit: "b3b3dbc67504e8cd498d6db202ddcf5a9dd26a9d"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "kirkstone"
     commit: "346753705e49a2486867dc150181a1c7f4d69377"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -49,6 +54,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "kirkstone"
     commit: "09.00.00.007"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -57,6 +63,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "kirkstone"
     commit: "c39bb4ce3b60b73d35c5fb06af012432e70d6b38"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -65,6 +72,7 @@ repos:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "kirkstone"
     commit: "200c2783b3f8546f561382fff6bd5268680d403a"
+    path: "sources/oe-core"
     layers:
       meta:
=20
@@ -72,11 +80,13 @@ repos:
     url: "https://github.com/aws/meta-aws.git"
     branch: "kirkstone"
     commit: "b72cb364f79aa055242e703e284900b23e61facd"
+    path: "sources/meta-aws"
=20
   meta-psdkla:
     url: "https://git.ti.com/git/jacinto-linux/meta-psdkla.git"
     branch: "kirkstone"
     commit: "09.00.00.07"
+    path: "sources/meta-psdkla"
=20
 local_conf_header:
   oe-layersetup-local-conf-config-specific: |
diff --git a/kas/processor-sdk-linux/processor-sdk-linux-09_01_00_06.yml b/=
kas/processor-sdk-linux/processor-sdk-linux-09_01_00_06.yml
index de0b4e4..e38e008 100644
--- a/kas/processor-sdk-linux/processor-sdk-linux-09_01_00_06.yml
+++ b/kas/processor-sdk-linux/processor-sdk-linux-09_01_00_06.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.0"
     commit: "6c1ffa9091d0c53a100e8c8c15122d28642034bd"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "kirkstone"
     commit: "09.01.00.003"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -29,16 +31,19 @@ repos:
     url: "https://github.com/meta-qt5/meta-qt5.git"
     branch: "kirkstone"
     commit: "ae8a97f79364bed1abc297636f7933d0e35f22be"
+    path: "sources/meta-qt5"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "kirkstone"
     commit: "2d8b3cba8ff27c9ec2187a52b6a551fe1dcfaa07"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "kirkstone"
     commit: "79a6f60dabad9e5b0e041efa91379447ef030482"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -50,6 +55,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "kirkstone"
     commit: "09.01.00.003"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -58,6 +64,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "kirkstone"
     commit: "b187fb9232ca0a6b5f8f90b4715958546fc41d73"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -66,6 +73,7 @@ repos:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "kirkstone"
     commit: "56503e3e80603de3b69acef2f6d32836bc9e5e5d"
+    path: "sources/oe-core"
     layers:
       meta:
=20
@@ -73,6 +81,7 @@ repos:
     url: "https://git.ti.com/cgit/ti-sdk-linux/meta-tisdk"
     branch: "kirkstone"
     commit: "09.01.00.06"
+    path: "sources/meta-tisdk"
=20
 local_conf_header:
   oe-layersetup-local-conf-config-specific: |
diff --git a/kas/processor-sdk-linux/processor-sdk-linux-09_01_00_07.yml b/=
kas/processor-sdk-linux/processor-sdk-linux-09_01_00_07.yml
index 11c284b..1b0f8e3 100644
--- a/kas/processor-sdk-linux/processor-sdk-linux-09_01_00_07.yml
+++ b/kas/processor-sdk-linux/processor-sdk-linux-09_01_00_07.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.0"
     commit: "a7f6c3e67bd9170e93b2b94676e84018faf0df91"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "kirkstone"
     commit: "09.01.00.006"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -29,16 +31,19 @@ repos:
     url: "https://github.com/meta-qt5/meta-qt5.git"
     branch: "kirkstone"
     commit: "ae8a97f79364bed1abc297636f7933d0e35f22be"
+    path: "sources/meta-qt5"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "kirkstone"
     commit: "67b0ef4256a484851f3556d281ca4caa88374388"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "kirkstone"
     commit: "7da6cb848bc42b3e6bd5d2b37b52ba75510a6ca0"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -50,6 +55,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "kirkstone"
     commit: "09.01.00.006"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -58,6 +64,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "kirkstone"
     commit: "b187fb9232ca0a6b5f8f90b4715958546fc41d73"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -66,6 +73,7 @@ repos:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "kirkstone"
     commit: "4bb6373e5f4a1330a063d1afe855d6c24d5461e7"
+    path: "sources/oe-core"
     layers:
       meta:
=20
@@ -73,6 +81,7 @@ repos:
     url: "https://git.ti.com/cgit/ti-sdk-linux/meta-tisdk"
     branch: "kirkstone"
     commit: "09.01.00.07"
+    path: "sources/meta-tisdk"
=20
 local_conf_header:
   oe-layersetup-local-conf-config-specific: |
diff --git a/kas/processor-sdk-linux/processor-sdk-linux-09_02_00_04.yml b/=
kas/processor-sdk-linux/processor-sdk-linux-09_02_00_04.yml
index be8c29d..0937e71 100644
--- a/kas/processor-sdk-linux/processor-sdk-linux-09_02_00_04.yml
+++ b/kas/processor-sdk-linux/processor-sdk-linux-09_02_00_04.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.0"
     commit: "40fd5f4eef7460ca67f32cfce8e229e67e1ff607"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "kirkstone"
     commit: "d38c98d22ad3f3b29f9cce402202cd95214c58cc"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -29,6 +31,7 @@ repos:
     url: "https://github.com/OSSystems/meta-browser.git"
     branch: "master"
     commit: "d3d16b47e17dc899e5298cff698dc32e5e639ab4"
+    path: "sources/meta-browser"
     layers:
       meta-chromium:
=20
@@ -36,16 +39,19 @@ repos:
     url: "https://github.com/meta-qt5/meta-qt5.git"
     branch: "kirkstone"
     commit: "fe0bf7f0e5408aac6cc89ff3b19b1b1941df4f64"
+    path: "sources/meta-qt5"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "kirkstone"
     commit: "7902664f89678164b7fc90d421cee74cbec51cdf"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "kirkstone"
     commit: "fda737ec0cc1d2a5217548a560074a8e4d5ec580"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -57,6 +63,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "kirkstone"
     commit: "2f3de17c1e623d276811d13d3eb11e5734566acd"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -65,6 +72,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "kirkstone"
     commit: "b187fb9232ca0a6b5f8f90b4715958546fc41d73"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -73,11 +81,13 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "kirkstone-clang12"
     commit: "c2e89dc7e1dfcc1bbe432afca2dc43d6560cb007"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "kirkstone"
     commit: "2501534c9581c6c3439f525d630be11554a57d24"
+    path: "sources/oe-core"
     layers:
       meta:
=20
@@ -85,6 +95,7 @@ repos:
     url: "https://git.ti.com/cgit/ti-sdk-linux/meta-tisdk"
     branch: "kirkstone"
     commit: "REL.J7.09.02.00.04"
+    path: "sources/meta-tisdk"
=20
 local_conf_header:
   oe-layersetup-local-conf-config-specific: |
diff --git a/kas/processor-sdk-linux/processor-sdk-linux-09_02_00_05.yml b/=
kas/processor-sdk-linux/processor-sdk-linux-09_02_00_05.yml
index 68e5992..0f49b3d 100644
--- a/kas/processor-sdk-linux/processor-sdk-linux-09_02_00_05.yml
+++ b/kas/processor-sdk-linux/processor-sdk-linux-09_02_00_05.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.0"
     commit: "40fd5f4eef7460ca67f32cfce8e229e67e1ff607"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "kirkstone"
     commit: "98f178314931635c8641d1394dfd4341b86b6be2"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -29,6 +31,7 @@ repos:
     url: "https://github.com/OSSystems/meta-browser.git"
     branch: "master"
     commit: "d3d16b47e17dc899e5298cff698dc32e5e639ab4"
+    path: "sources/meta-browser"
     layers:
       meta-chromium:
=20
@@ -36,16 +39,19 @@ repos:
     url: "https://github.com/meta-qt5/meta-qt5.git"
     branch: "kirkstone"
     commit: "fe0bf7f0e5408aac6cc89ff3b19b1b1941df4f64"
+    path: "sources/meta-qt5"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "kirkstone"
     commit: "cb2bc17e96552cdfc141d27bd9f4dbd95a872846"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "kirkstone"
     commit: "fda737ec0cc1d2a5217548a560074a8e4d5ec580"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -57,6 +63,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "kirkstone"
     commit: "376a2143533c6497b4e79304eccca2a630784436"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -65,6 +72,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "kirkstone"
     commit: "b187fb9232ca0a6b5f8f90b4715958546fc41d73"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -73,11 +81,13 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "kirkstone-clang12"
     commit: "c2e89dc7e1dfcc1bbe432afca2dc43d6560cb007"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "kirkstone"
     commit: "2501534c9581c6c3439f525d630be11554a57d24"
+    path: "sources/oe-core"
     layers:
       meta:
=20
@@ -85,6 +95,7 @@ repos:
     url: "https://git.ti.com/cgit/ti-sdk-linux/meta-tisdk"
     branch: "kirkstone"
     commit: "REL.J7.09.02.00.05"
+    path: "sources/meta-tisdk"
=20
 local_conf_header:
   oe-layersetup-local-conf-config-specific: |
diff --git a/kas/processor-sdk-linux/processor-sdk-linux-09_03_06_05.yml b/=
kas/processor-sdk-linux/processor-sdk-linux-09_03_06_05.yml
index 59dd673..37ce3d4 100644
--- a/kas/processor-sdk-linux/processor-sdk-linux-09_03_06_05.yml
+++ b/kas/processor-sdk-linux/processor-sdk-linux-09_03_06_05.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.0"
     commit: "3f88b005244a0afb5d5c7260e54a94a453ec9b3e"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "kirkstone"
     commit: "f8ad2232a4e52b50aecc6c847ee7cfa24fc84070"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -29,16 +31,19 @@ repos:
     url: "https://github.com/meta-qt5/meta-qt5.git"
     branch: "kirkstone"
     commit: "644ebf220245bdc06e7696ccc90acc97a0dd2566"
+    path: "sources/meta-qt5"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "kirkstone"
     commit: "a055d7dcafc58855081a5eac9a46b93b9b51012b"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "kirkstone"
     commit: "7b3fdcdfaab2fc964bbf9eec2cce4e03001fa8cf"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -50,6 +55,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "kirkstone"
     commit: "417233481d8daa46633045fac358260d07cf1670"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -58,6 +64,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "kirkstone"
     commit: "936c02ec13661bd86a05f7f90e1b920d5092d670"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -66,11 +73,13 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "kirkstone-clang12"
     commit: "c2e89dc7e1dfcc1bbe432afca2dc43d6560cb007"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "kirkstone"
     commit: "e42b6a40a3a01e328966bb5ee1bb3e0993975b15"
+    path: "sources/oe-core"
     layers:
       meta:
=20
@@ -78,3 +87,4 @@ repos:
     url: "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
     branch: "am57x-9.x"
     commit: "0eed214c0ff621f4d03700a647a1b4f1a02b5a7c"
+    path: "sources/meta-tisdk"
diff --git a/kas/processor-sdk-linux/processor-sdk-linux-10_00_07_06.yml b/=
kas/processor-sdk-linux/processor-sdk-linux-10_00_07_06.yml
index 798993d..fe229cd 100644
--- a/kas/processor-sdk-linux/processor-sdk-linux-10_00_07_06.yml
+++ b/kas/processor-sdk-linux/processor-sdk-linux-10_00_07_06.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
     commit: "11d83170922a2c6b9db1f6e8c23e533526984b2c"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
     commit: "82833bae8835e06301c23c8833642ae4c02d303a"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -29,6 +31,7 @@ repos:
     url: "https://github.com/OSSystems/meta-browser.git"
     branch: "master"
     commit: "1ed2254d72a4c25879014c98be287a7e3e22904c"
+    path: "sources/meta-browser"
     layers:
       meta-chromium:
=20
@@ -36,16 +39,19 @@ repos:
     url: "https://github.com/meta-qt5/meta-qt5.git"
     branch: "scarthgap"
     commit: "eb828418264a49b8d00035cb3d7b12fcea3be801"
+    path: "sources/meta-qt5"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
     commit: "6a80f140e387621f62964209a2e07d3bcfb125ce"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
     commit: "18f939a5fb37528a5415b05077ece383c346a119"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -58,6 +64,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
     commit: "138077349667614f83637c98798c06249615a23e"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -66,6 +73,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
     commit: "1b85bbb4cab9658da3cd926c62038b8559c5c64e"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -74,11 +82,13 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
     commit: "df21b1563910c80d7e2964971b7c5b79b5186922"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
     commit: "c00a9a8f25b0042b0723a5d20b88e92d473d22bf"
+    path: "sources/oe-core"
     layers:
       meta:
=20
@@ -86,6 +96,7 @@ repos:
     url: "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
     branch: "scarthgap"
     commit: "af81e0d81c5efd005bfc0ef749f690f9748c70f6"
+    path: "sources/meta-tisdk"
=20
 local_conf_header:
   oe-layersetup-local-conf-config-specific: |
diff --git a/kas/processor-sdk-linux/processor-sdk-linux-10_00_08_06.yml b/=
kas/processor-sdk-linux/processor-sdk-linux-10_00_08_06.yml
index 725eae0..09d2c1b 100644
--- a/kas/processor-sdk-linux/processor-sdk-linux-10_00_08_06.yml
+++ b/kas/processor-sdk-linux/processor-sdk-linux-10_00_08_06.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
     commit: "11d83170922a2c6b9db1f6e8c23e533526984b2c"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
     commit: "cbf054c7401af6e1e8bcc4eab07daa9a4996f7f3"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -29,6 +31,7 @@ repos:
     url: "https://github.com/OSSystems/meta-browser.git"
     branch: "master"
     commit: "1ed2254d72a4c25879014c98be287a7e3e22904c"
+    path: "sources/meta-browser"
     layers:
       meta-chromium:
=20
@@ -36,16 +39,19 @@ repos:
     url: "https://github.com/meta-qt5/meta-qt5.git"
     branch: "scarthgap"
     commit: "eb828418264a49b8d00035cb3d7b12fcea3be801"
+    path: "sources/meta-qt5"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
     commit: "54b806b1985f3989722ee308e1073530fe3328c1"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
     commit: "80e01188fa822d87d301ee71973c462d7a865493"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -58,6 +64,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
     commit: "84328ead40d7e6fcce4d80ab7d07f4dcaf9d777e"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -66,6 +73,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
     commit: "ecece16871afe6b674d2aafd27e0f18bbaef1966"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -74,11 +82,13 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
     commit: "fe561f41aef0cff9e6f96730ab59f28dca2eb682"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
     commit: "1c9d3c22718bf49ae85c2d06e0ee60ebdc2fd0c1"
+    path: "sources/oe-core"
     layers:
       meta:
=20
@@ -86,6 +96,7 @@ repos:
     url: "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
     branch: "scarthgap"
     commit: "af81e0d81c5efd005bfc0ef749f690f9748c70f6"
+    path: "sources/meta-tisdk"
=20
 local_conf_header:
   oe-layersetup-local-conf-config-specific: |
diff --git a/kas/processor-sdk-linux/processor-sdk-linux-10_01_08_01.yml b/=
kas/processor-sdk-linux/processor-sdk-linux-10_01_08_01.yml
index 84a8283..637a83a 100644
--- a/kas/processor-sdk-linux/processor-sdk-linux-10_01_08_01.yml
+++ b/kas/processor-sdk-linux/processor-sdk-linux-10_01_08_01.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
     commit: "377eba2361850adfb8ce7e761ef9c76be287f88c"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
     commit: "b6349e47760397add572cc27468e0f30b40474c1"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -29,6 +31,7 @@ repos:
     url: "https://github.com/OSSystems/meta-browser.git"
     branch: "master"
     commit: "1ed2254d72a4c25879014c98be287a7e3e22904c"
+    path: "sources/meta-browser"
     layers:
       meta-chromium:
=20
@@ -36,16 +39,19 @@ repos:
     url: "https://github.com/meta-qt5/meta-qt5.git"
     branch: "scarthgap"
     commit: "eb828418264a49b8d00035cb3d7b12fcea3be801"
+    path: "sources/meta-qt5"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
     commit: "7c78f4ef96020b702c027d179895c9f97179b4fc"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
     commit: "2e3126c9c16bb3df0560f6b3896d01539a3bfad7"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -58,6 +64,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
     commit: "f06324bc1649e4f437686560cbd66f973ba920f5"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -66,6 +73,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
     commit: "7088279c0ab00c7dabefdd4544951b4746b48476"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -74,11 +82,13 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
     commit: "9fbfa9db33131abdf3870a94f00199eb53e276e5"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
     commit: "a051a066da2874b95680d0353dfa18c1d56b2670"
+    path: "sources/oe-core"
     layers:
       meta:
=20
@@ -86,6 +96,7 @@ repos:
     url: "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
     branch: "scarthgap"
     commit: "d73e2e4482d812c1eb456eaaca7bd50d62361de1"
+    path: "sources/meta-tisdk"
=20
 local_conf_header:
   oe-layersetup-local-conf-config-specific: |
diff --git a/kas/processor-sdk-linux/processor-sdk-linux-11_00_10_01.yml b/=
kas/processor-sdk-linux/processor-sdk-linux-11_00_10_01.yml
index 1e09702..530e982 100644
--- a/kas/processor-sdk-linux/processor-sdk-linux-11_00_10_01.yml
+++ b/kas/processor-sdk-linux/processor-sdk-linux-11_00_10_01.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
     commit: "696c2c1ef095f8b11c7d2eff36fae50f58c62e5e"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
     commit: "c04e85dd207dd24387edac10526b9ec971df9496"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -28,16 +30,19 @@ repos:
     url: "https://code.qt.io/yocto/meta-qt6.git"
     branch: "6.9"
     commit: "fce7cf8c3aa54b3650a30a79dce705838c32f3c3"
+    path: "sources/meta-qt6"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
     commit: "9e040ee8dd6025558ea60ac9db60c41bfeddf221"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
     commit: "e92d0173a80ea7592c866618ef5293203c50544c"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -50,6 +55,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
     commit: "a98a2e1029870b25e117d4c9410e75bfd955f35a"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -58,6 +64,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
     commit: "8e0f8af90fefb03f08cd2228cde7a89902a6b37c"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -66,11 +73,13 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
     commit: "eaa08939eaec9f620b14742ff3ac568553683034"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
     commit: "b214cc84a922f7a3fb7ebbc501189ce25e8bd2bd"
+    path: "sources/oe-core"
     layers:
       meta:
=20
@@ -78,6 +87,7 @@ repos:
     url: "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
     branch: "scarthgap"
     commit: "1f96dccc01f10c73295e0bac6a15a97d3d4562fd"
+    path: "sources/meta-tisdk"
     layers:
       meta-ti-foundational:
=20
@@ -85,3 +95,4 @@ repos:
     url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
     branch: "scarthgap"
     commit: "81d1b80b2a314814c6d900e82ea2da93eee3f57d"
+    path: "sources/meta-edgeai"
diff --git a/kas/processor-sdk-linux/processor-sdk-linux-11_01_02_01.yml b/=
kas/processor-sdk-linux/processor-sdk-linux-11_01_02_01.yml
index 74d8128..3abc439 100644
--- a/kas/processor-sdk-linux/processor-sdk-linux-11_01_02_01.yml
+++ b/kas/processor-sdk-linux/processor-sdk-linux-11_01_02_01.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
     commit: "982645110a19ebb94d519926a4e14c8a2a205cfd"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
     commit: "67c473bc6d88a2cce13b2e8c36fcb79cb0015339"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -28,16 +30,19 @@ repos:
     url: "https://code.qt.io/yocto/meta-qt6.git"
     branch: "6.9"
     commit: "ade45671712b72e988d622caab51774f5a069c32"
+    path: "sources/meta-qt6"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
     commit: "af1db2042caf8021d767dce1b26c08b59b96f3d1"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
     commit: "c29a18fa39ede952f3f6108ec007c1906e2d9a0d"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -50,11 +55,13 @@ repos:
     url: "https://git.yoctoproject.org/meta-lts-mixins"
     branch: "scarthgap/rust"
     commit: "a8046d5ec53b1856169ac795aa87cb0d5db84c04"
+    path: "sources/meta-lts-mixins"
=20
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
     commit: "0e2876e2ea7c28ddff5bc0052bdbc83dd07b7c98"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-beagle:
@@ -64,6 +71,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
     commit: "0f1e7bf92c89759f0ab74cfa5be4ee47b092ad46"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -72,11 +80,13 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
     commit: "057ee563305e9484b29d02347aeafdadc5ea28ed"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
     commit: "baa5e7ea5f37f54c2a00080798ad7fb4c0664f69"
+    path: "sources/oe-core"
     layers:
       meta:
=20
@@ -84,5 +94,6 @@ repos:
     url: "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
     branch: "am57x"
     commit: "1cff7b085804058e077bd37b09d5e1247f72d90b"
+    path: "sources/meta-tisdk"
     layers:
       meta-ti-foundational:
diff --git a/kas/processor-sdk/processor-sdk-09.00.00-am62xxsip-config.yml =
b/kas/processor-sdk/processor-sdk-09.00.00-am62xxsip-config.yml
index 9b4b5ed..287a862 100644
--- a/kas/processor-sdk/processor-sdk-09.00.00-am62xxsip-config.yml
+++ b/kas/processor-sdk/processor-sdk-09.00.00-am62xxsip-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.0"
     commit: "41b6684489d0261753344956042be2cc4adb0159"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,16 +20,19 @@ repos:
     url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
     branch: "kirkstone"
     commit: "617ddf642233e7e83a86bb66c5b0edd268b93709"
+    path: "sources/meta-edgeai"
=20
   meta-processor-sdk:
     url: "https://git.ti.com/git/processor-sdk/meta-processor-sdk.git"
     branch: "kirkstone"
     commit: "09.00.00.003-AM62SIP"
+    path: "sources/meta-processor-sdk"
=20
   meta-arago:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "kirkstone"
     commit: "09.00.00.011"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -38,16 +42,19 @@ repos:
     url: "https://github.com/meta-qt5/meta-qt5.git"
     branch: "kirkstone"
     commit: "31930afca79b74e0c788452d71356c1f045e7979"
+    path: "sources/meta-qt5"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "kirkstone"
     commit: "2d8b3cba8ff27c9ec2187a52b6a551fe1dcfaa07"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "kirkstone"
     commit: "9c5541f7e18a1fac3b8dea71e1ebb8398d58e6ff"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -60,6 +67,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "kirkstone"
     commit: "09.00.00.011"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -68,6 +76,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "kirkstone"
     commit: "b187fb9232ca0a6b5f8f90b4715958546fc41d73"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -76,5 +85,6 @@ repos:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "kirkstone"
     commit: "be0bca7eaa08948b6c4eabe63e68a6e14d8dad3b"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/processor-sdk/processor-sdk-09.00.00-config.yml b/kas/proc=
essor-sdk/processor-sdk-09.00.00-config.yml
index 935dfcf..c0e1e29 100644
--- a/kas/processor-sdk/processor-sdk-09.00.00-config.yml
+++ b/kas/processor-sdk/processor-sdk-09.00.00-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.0"
     commit: "0c6f86b60cfba67c20733516957c0a654eb2b44c"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,16 +20,19 @@ repos:
     url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
     branch: "kirkstone"
     commit: "a1d9091cd914ce0bc69958891628a4cf86ed3e96"
+    path: "sources/meta-edgeai"
=20
   meta-processor-sdk:
     url: "https://git.ti.com/git/processor-sdk/meta-processor-sdk.git"
     branch: "kirkstone"
     commit: "9dad5765d33783f940ba3c32f4fc431e2b308621"
+    path: "sources/meta-processor-sdk"
=20
   meta-arago:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "kirkstone"
     commit: "09.00.00.006"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -38,16 +42,19 @@ repos:
     url: "https://github.com/meta-qt5/meta-qt5.git"
     branch: "kirkstone"
     commit: "bff5bd937f0776166e81a63f3dd39ede348ef758"
+    path: "sources/meta-qt5"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "kirkstone"
     commit: "b3b3dbc67504e8cd498d6db202ddcf5a9dd26a9d"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "kirkstone"
     commit: "346753705e49a2486867dc150181a1c7f4d69377"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -60,6 +67,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "kirkstone"
     commit: "09.00.00.006"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -68,6 +76,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "kirkstone"
     commit: "96aad3b29aa7a5ee4df5cf617a6336e5218fa9bd"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -76,5 +85,6 @@ repos:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "kirkstone"
     commit: "f20a12ead2d5890e88e7f4ce149a777de47edc48"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/processor-sdk/processor-sdk-09.01.00-am65xx-config.yml b/k=
as/processor-sdk/processor-sdk-09.01.00-am65xx-config.yml
index 270af62..862b7f3 100644
--- a/kas/processor-sdk/processor-sdk-09.01.00-am65xx-config.yml
+++ b/kas/processor-sdk/processor-sdk-09.01.00-am65xx-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.0"
     commit: "a7f6c3e67bd9170e93b2b94676e84018faf0df91"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,11 +20,13 @@ repos:
     url: "https://git.ti.com/git/processor-sdk/meta-processor-sdk.git"
     branch: "kirkstone"
     commit: "09.01.00.007-AM65X"
+    path: "sources/meta-processor-sdk"
=20
   meta-arago:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "kirkstone"
     commit: "09.01.00.007"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -34,16 +37,19 @@ repos:
     url: "https://github.com/meta-qt5/meta-qt5.git"
     branch: "kirkstone"
     commit: "ae8a97f79364bed1abc297636f7933d0e35f22be"
+    path: "sources/meta-qt5"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "kirkstone"
     commit: "67b0ef4256a484851f3556d281ca4caa88374388"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "kirkstone"
     commit: "8a75c61cce2aa1d6e5a3597ab8fc5a7e6aeae1e4"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -56,6 +62,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "kirkstone"
     commit: "09.01.00.007"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -64,6 +71,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "kirkstone"
     commit: "b187fb9232ca0a6b5f8f90b4715958546fc41d73"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -72,5 +80,6 @@ repos:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "kirkstone"
     commit: "8726ae02d760270f9e7fe7ef5715d8f7553371ce"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/processor-sdk/processor-sdk-09.01.00-config.yml b/kas/proc=
essor-sdk/processor-sdk-09.01.00-config.yml
index fc3ea8f..782ea08 100644
--- a/kas/processor-sdk/processor-sdk-09.01.00-config.yml
+++ b/kas/processor-sdk/processor-sdk-09.01.00-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.0"
     commit: "a7f6c3e67bd9170e93b2b94676e84018faf0df91"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,11 +20,13 @@ repos:
     url: "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
     branch: "kirkstone"
     commit: "09.01.00.08"
+    path: "sources/meta-tisdk"
=20
   meta-arago:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "kirkstone"
     commit: "09.01.00.008"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -34,16 +37,19 @@ repos:
     url: "https://github.com/meta-qt5/meta-qt5.git"
     branch: "kirkstone"
     commit: "ae8a97f79364bed1abc297636f7933d0e35f22be"
+    path: "sources/meta-qt5"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "kirkstone"
     commit: "67b0ef4256a484851f3556d281ca4caa88374388"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "kirkstone"
     commit: "8a75c61cce2aa1d6e5a3597ab8fc5a7e6aeae1e4"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -56,6 +62,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "kirkstone"
     commit: "09.01.00.008"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -64,6 +71,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "kirkstone"
     commit: "b187fb9232ca0a6b5f8f90b4715958546fc41d73"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -72,6 +80,7 @@ repos:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "kirkstone"
     commit: "11da43b58e19583a9bc16044309610cfb2e86469"
+    path: "sources/oe-core"
     layers:
       meta:
=20
@@ -79,3 +88,4 @@ repos:
     url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
     branch: "kirkstone"
     commit: "87d730d9c1778c7f892b096878f338f36d6877f4"
+    path: "sources/meta-edgeai"
diff --git a/kas/processor-sdk/processor-sdk-09.01.00-legacy-config.yml b/k=
as/processor-sdk/processor-sdk-09.01.00-legacy-config.yml
index cb33f87..6f1b37d 100644
--- a/kas/processor-sdk/processor-sdk-09.01.00-legacy-config.yml
+++ b/kas/processor-sdk/processor-sdk-09.01.00-legacy-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.0"
     commit: "9993a89e5b97dda5f3657e5a7cc3a4fa94ff7111"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,11 +20,13 @@ repos:
     url: "https://git.ti.com/git/processor-sdk/meta-processor-sdk.git"
     branch: "kirkstone"
     commit: "09.01.00.001"
+    path: "sources/meta-processor-sdk"
=20
   meta-arago:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "kirkstone"
     commit: "09.01.00.001"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -34,16 +37,19 @@ repos:
     url: "https://github.com/meta-qt5/meta-qt5.git"
     branch: "kirkstone"
     commit: "ae8a97f79364bed1abc297636f7933d0e35f22be"
+    path: "sources/meta-qt5"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "kirkstone"
     commit: "2d8b3cba8ff27c9ec2187a52b6a551fe1dcfaa07"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "kirkstone"
     commit: "9c5541f7e18a1fac3b8dea71e1ebb8398d58e6ff"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -56,6 +62,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "kirkstone"
     commit: "09.01.00.001"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -64,6 +71,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "kirkstone"
     commit: "b187fb9232ca0a6b5f8f90b4715958546fc41d73"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -72,5 +80,6 @@ repos:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "kirkstone"
     commit: "2572b32e729831762790ebfbf930a1140657faea"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/processor-sdk/processor-sdk-09.02.00.08-am64x-config.yml b=
/kas/processor-sdk/processor-sdk-09.02.00.08-am64x-config.yml
index 21c52e5..979e06c 100644
--- a/kas/processor-sdk/processor-sdk-09.02.00.08-am64x-config.yml
+++ b/kas/processor-sdk/processor-sdk-09.02.00.08-am64x-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.0"
     commit: "2c6183594279e2e9d03f11155ad969448869c863"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,11 +20,13 @@ repos:
     url: "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
     branch: "kirkstone"
     commit: "09.02.00.08"
+    path: "sources/meta-tisdk"
=20
   meta-arago:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "kirkstone"
     commit: "09.02.00.001"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -34,16 +37,19 @@ repos:
     url: "https://github.com/meta-qt5/meta-qt5.git"
     branch: "kirkstone"
     commit: "ae8a97f79364bed1abc297636f7933d0e35f22be"
+    path: "sources/meta-qt5"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "kirkstone"
     commit: "88327090d26955a678c6f8bd2585aad4d802f6c4"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "kirkstone"
     commit: "402affcc073db39f782c1ebfd718edd5f11eed4c"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -56,6 +62,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "kirkstone"
     commit: "09.02.00.001"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -64,6 +71,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "kirkstone"
     commit: "b187fb9232ca0a6b5f8f90b4715958546fc41d73"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -72,6 +80,7 @@ repos:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "kirkstone"
     commit: "227b3d4edad31b0d0045f41133271693265240b0"
+    path: "sources/oe-core"
     layers:
       meta:
=20
@@ -79,3 +88,4 @@ repos:
     url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
     branch: "kirkstone"
     commit: "02ce7e60b449c72def00f26afc549034cbd82ba9"
+    path: "sources/meta-edgeai"
diff --git a/kas/processor-sdk/processor-sdk-09.03.05.02-legacy-config.yml =
b/kas/processor-sdk/processor-sdk-09.03.05.02-legacy-config.yml
index f63dac0..40af10b 100644
--- a/kas/processor-sdk/processor-sdk-09.03.05.02-legacy-config.yml
+++ b/kas/processor-sdk/processor-sdk-09.03.05.02-legacy-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.0"
     commit: "3f88b005244a0afb5d5c7260e54a94a453ec9b3e"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,11 +20,13 @@ repos:
     url: "https://github.com/TexasInstruments/meta-tisdk.git"
     branch: "kirkstone"
     commit: "09.03.05.02"
+    path: "sources/meta-tisdk"
=20
   meta-arago:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "kirkstone"
     commit: "09.03.05"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -34,16 +37,19 @@ repos:
     url: "https://github.com/meta-qt5/meta-qt5.git"
     branch: "kirkstone"
     commit: "644ebf220245bdc06e7696ccc90acc97a0dd2566"
+    path: "sources/meta-qt5"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "kirkstone"
     commit: "460ea78d7f8d5d16799d0b7334b95d8170c9e338"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "kirkstone"
     commit: "4ad41baed6236d499804cbfc4f174042d84fce97"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -56,6 +62,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "kirkstone"
     commit: "09.03.05"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -64,6 +71,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "kirkstone"
     commit: "936c02ec13661bd86a05f7f90e1b920d5092d670"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -72,5 +80,6 @@ repos:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "kirkstone"
     commit: "e42b6a40a3a01e328966bb5ee1bb3e0993975b15"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/processor-sdk/processor-sdk-11.00.05.02-am62lxx-config.yml=
 b/kas/processor-sdk/processor-sdk-11.00.05.02-am62lxx-config.yml
index 0704456..ade1eb4 100644
--- a/kas/processor-sdk/processor-sdk-11.00.05.02-am62lxx-config.yml
+++ b/kas/processor-sdk/processor-sdk-11.00.05.02-am62lxx-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
     commit: "f6635b32ab553e812fe7c05998ef05834fccd0f3"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,11 +20,13 @@ repos:
     url: "https://github.com/TexasInstruments/meta-tisdk.git"
     branch: "scarthgap"
     commit: "11.00.05.02"
+    path: "sources/meta-tisdk"
=20
   meta-arago:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
     commit: "11.00.05"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -33,11 +36,13 @@ repos:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
     commit: "79673f5c67b022e7aadeb231872470295e5b9188"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
     commit: "4f11a12b2352bbdfafb6b7d956bf424af4992977"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -50,6 +55,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
     commit: "11.00.05"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-beagle:
@@ -59,6 +65,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
     commit: "3cadb81ffaa9f03b92e302843cb22a9cd41df34b"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -67,10 +74,12 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
     commit: "8c77b427408db01b8de4c04bd3d247c13c154f92"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
     commit: "fc46705cc629a151f85717a57f7d789de8fd9b64"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/processor-sdk/processor-sdk-11.00.15.05-am62lxx-config.yml=
 b/kas/processor-sdk/processor-sdk-11.00.15.05-am62lxx-config.yml
index 39379d5..31c6288 100644
--- a/kas/processor-sdk/processor-sdk-11.00.15.05-am62lxx-config.yml
+++ b/kas/processor-sdk/processor-sdk-11.00.15.05-am62lxx-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
     commit: "696c2c1ef095f8b11c7d2eff36fae50f58c62e5e"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://github.com/TexasInstruments/meta-tisdk.git"
     branch: "scarthgap"
     commit: "11.00.15.05"
+    path: "sources/meta-tisdk"
     layers:
       meta-ti-foundational:
       meta-ti-ml:
@@ -27,6 +29,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
     commit: "11.00.15"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -36,11 +39,13 @@ repos:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
     commit: "9e040ee8dd6025558ea60ac9db60c41bfeddf221"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
     commit: "491671faee11ea131feab5a3a451d1a01deb2ab1"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -53,6 +58,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
     commit: "11.00.15"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-beagle:
@@ -62,6 +68,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
     commit: "8e0f8af90fefb03f08cd2228cde7a89902a6b37c"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -70,10 +77,12 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
     commit: "eaa08939eaec9f620b14742ff3ac568553683034"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
     commit: "29d920f4c2249df7a69f00100924b4525e03c0d9"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/processor-sdk/processor-sdk-kirkstone-09.02.01.09-config.y=
ml b/kas/processor-sdk/processor-sdk-kirkstone-09.02.01.09-config.yml
index 0afd710..ce0bff8 100644
--- a/kas/processor-sdk/processor-sdk-kirkstone-09.02.01.09-config.yml
+++ b/kas/processor-sdk/processor-sdk-kirkstone-09.02.01.09-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.0"
     commit: "40fd5f4eef7460ca67f32cfce8e229e67e1ff607"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,11 +20,13 @@ repos:
     url: "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
     branch: "kirkstone"
     commit: "09.02.01.09"
+    path: "sources/meta-tisdk"
=20
   meta-arago:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "kirkstone"
     commit: "09.02.00.009"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -34,16 +37,19 @@ repos:
     url: "https://github.com/meta-qt5/meta-qt5.git"
     branch: "kirkstone"
     commit: "fe0bf7f0e5408aac6cc89ff3b19b1b1941df4f64"
+    path: "sources/meta-qt5"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "kirkstone"
     commit: "cb2bc17e96552cdfc141d27bd9f4dbd95a872846"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "kirkstone"
     commit: "fda737ec0cc1d2a5217548a560074a8e4d5ec580"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -55,6 +61,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "kirkstone"
     commit: "09.02.00.009"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -63,6 +70,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "kirkstone"
     commit: "b187fb9232ca0a6b5f8f90b4715958546fc41d73"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -71,11 +79,13 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "kirkstone-clang12"
     commit: "c2e89dc7e1dfcc1bbe432afca2dc43d6560cb007"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "kirkstone"
     commit: "2501534c9581c6c3439f525d630be11554a57d24"
+    path: "sources/oe-core"
     layers:
       meta:
=20
@@ -83,3 +93,4 @@ repos:
     url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
     branch: "kirkstone"
     commit: "09.02.00.03"
+    path: "sources/meta-edgeai"
diff --git a/kas/processor-sdk/processor-sdk-kirkstone-09.02.01.10-config.y=
ml b/kas/processor-sdk/processor-sdk-kirkstone-09.02.01.10-config.yml
index 9a0b258..095c0c4 100644
--- a/kas/processor-sdk/processor-sdk-kirkstone-09.02.01.10-config.yml
+++ b/kas/processor-sdk/processor-sdk-kirkstone-09.02.01.10-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.0"
     commit: "40fd5f4eef7460ca67f32cfce8e229e67e1ff607"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,11 +20,13 @@ repos:
     url: "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
     branch: "kirkstone"
     commit: "09.02.01.10"
+    path: "sources/meta-tisdk"
=20
   meta-arago:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "kirkstone"
     commit: "09.02.00.010"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -34,16 +37,19 @@ repos:
     url: "https://github.com/meta-qt5/meta-qt5.git"
     branch: "kirkstone"
     commit: "644ebf220245bdc06e7696ccc90acc97a0dd2566"
+    path: "sources/meta-qt5"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "kirkstone"
     commit: "8f0eb65edaf6d280294c33446a9bb073a50b8c14"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "kirkstone"
     commit: "5a6f7925bd2b885955c942573f70a5594f231563"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -55,6 +61,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "kirkstone"
     commit: "09.02.00.010"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -63,6 +70,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "kirkstone"
     commit: "260e3adc2bf322f52d81c0642c825088a88bb051"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -71,11 +79,13 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "kirkstone-clang12"
     commit: "c2e89dc7e1dfcc1bbe432afca2dc43d6560cb007"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "kirkstone"
     commit: "8a502301209ef144932ef5071c1a9b738db23270"
+    path: "sources/oe-core"
     layers:
       meta:
=20
@@ -83,3 +93,4 @@ repos:
     url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
     branch: "kirkstone"
     commit: "fdb683aa69d4d70aca17c2d53be3f900ae9d5e72"
+    path: "sources/meta-edgeai"
diff --git a/kas/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.09=
-config.yml b/kas/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.0=
9-config.yml
index 3bec2ef..469466b 100644
--- a/kas/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.09-config=
.yml
+++ b/kas/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.09-config=
.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.0"
     commit: "40fd5f4eef7460ca67f32cfce8e229e67e1ff607"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,11 +20,13 @@ repos:
     url: "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
     branch: "kirkstone"
     commit: "09.02.01.09"
+    path: "sources/meta-tisdk"
=20
   meta-arago:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "kirkstone"
     commit: "09.02.00.009"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -34,6 +37,7 @@ repos:
     url: "https://github.com/OSSystems/meta-browser.git"
     branch: "master"
     commit: "d3d16b47e17dc899e5298cff698dc32e5e639ab4"
+    path: "sources/meta-browser"
     layers:
       meta-chromium:
=20
@@ -41,16 +45,19 @@ repos:
     url: "https://github.com/meta-qt5/meta-qt5.git"
     branch: "kirkstone"
     commit: "fe0bf7f0e5408aac6cc89ff3b19b1b1941df4f64"
+    path: "sources/meta-qt5"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "kirkstone"
     commit: "cb2bc17e96552cdfc141d27bd9f4dbd95a872846"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "kirkstone"
     commit: "fda737ec0cc1d2a5217548a560074a8e4d5ec580"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -62,6 +69,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "kirkstone"
     commit: "09.02.00.009"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -70,6 +78,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "kirkstone"
     commit: "b187fb9232ca0a6b5f8f90b4715958546fc41d73"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -78,11 +87,13 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "kirkstone-clang12"
     commit: "c2e89dc7e1dfcc1bbe432afca2dc43d6560cb007"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "kirkstone"
     commit: "2501534c9581c6c3439f525d630be11554a57d24"
+    path: "sources/oe-core"
     layers:
       meta:
=20
@@ -90,3 +101,4 @@ repos:
     url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
     branch: "kirkstone"
     commit: "09.02.00.03"
+    path: "sources/meta-edgeai"
diff --git a/kas/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.10=
-config.yml b/kas/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.1=
0-config.yml
index 797980b..66d6c0c 100644
--- a/kas/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.10-config=
.yml
+++ b/kas/processor-sdk/processor-sdk-kirkstone-chromium-09.02.01.10-config=
.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.0"
     commit: "40fd5f4eef7460ca67f32cfce8e229e67e1ff607"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,11 +20,13 @@ repos:
     url: "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
     branch: "kirkstone"
     commit: "09.02.01.10"
+    path: "sources/meta-tisdk"
=20
   meta-arago:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "kirkstone"
     commit: "09.02.00.010"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -34,6 +37,7 @@ repos:
     url: "https://github.com/OSSystems/meta-browser.git"
     branch: "master"
     commit: "d3d16b47e17dc899e5298cff698dc32e5e639ab4"
+    path: "sources/meta-browser"
     layers:
       meta-chromium:
=20
@@ -41,16 +45,19 @@ repos:
     url: "https://github.com/meta-qt5/meta-qt5.git"
     branch: "kirkstone"
     commit: "644ebf220245bdc06e7696ccc90acc97a0dd2566"
+    path: "sources/meta-qt5"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "kirkstone"
     commit: "8f0eb65edaf6d280294c33446a9bb073a50b8c14"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "kirkstone"
     commit: "5a6f7925bd2b885955c942573f70a5594f231563"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -62,6 +69,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "kirkstone"
     commit: "09.02.00.010"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -70,6 +78,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "kirkstone"
     commit: "260e3adc2bf322f52d81c0642c825088a88bb051"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -78,11 +87,13 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "kirkstone-clang12"
     commit: "c2e89dc7e1dfcc1bbe432afca2dc43d6560cb007"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "kirkstone"
     commit: "8a502301209ef144932ef5071c1a9b738db23270"
+    path: "sources/oe-core"
     layers:
       meta:
=20
@@ -90,3 +101,4 @@ repos:
     url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
     branch: "kirkstone"
     commit: "fdb683aa69d4d70aca17c2d53be3f900ae9d5e72"
+    path: "sources/meta-edgeai"
diff --git a/kas/processor-sdk/processor-sdk-scarthgap-10.00.07.04-config.y=
ml b/kas/processor-sdk/processor-sdk-scarthgap-10.00.07.04-config.yml
index 99e2797..81fd67e 100644
--- a/kas/processor-sdk/processor-sdk-scarthgap-10.00.07.04-config.yml
+++ b/kas/processor-sdk/processor-sdk-scarthgap-10.00.07.04-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
     commit: "11d83170922a2c6b9db1f6e8c23e533526984b2c"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,11 +20,13 @@ repos:
     url: "https://github.com/TexasInstruments/meta-tisdk.git"
     branch: "scarthgap"
     commit: "10.00.07.04"
+    path: "sources/meta-tisdk"
=20
   meta-arago:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
     commit: "10.00.07"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -34,16 +37,19 @@ repos:
     url: "https://github.com/meta-qt5/meta-qt5.git"
     branch: "scarthgap"
     commit: "eb828418264a49b8d00035cb3d7b12fcea3be801"
+    path: "sources/meta-qt5"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
     commit: "6a80f140e387621f62964209a2e07d3bcfb125ce"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
     commit: "18f939a5fb37528a5415b05077ece383c346a119"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -56,6 +62,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
     commit: "10.00.07"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -64,6 +71,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
     commit: "1b85bbb4cab9658da3cd926c62038b8559c5c64e"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -72,10 +80,12 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
     commit: "df21b1563910c80d7e2964971b7c5b79b5186922"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
     commit: "c00a9a8f25b0042b0723a5d20b88e92d473d22bf"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.y=
ml b/kas/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.yml
index e04b7ea..23053f5 100644
--- a/kas/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.yml
+++ b/kas/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
     commit: "6c2641f7a9e92c1b82e306f59ddd3c1249c52cbf"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,11 +20,13 @@ repos:
     url: "https://github.com/TexasInstruments/meta-tisdk.git"
     branch: "scarthgap"
     commit: "10.01.10.04"
+    path: "sources/meta-tisdk"
=20
   meta-arago:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
     commit: "10.01.10"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -34,16 +37,19 @@ repos:
     url: "https://github.com/meta-qt5/meta-qt5.git"
     branch: "scarthgap"
     commit: "eb828418264a49b8d00035cb3d7b12fcea3be801"
+    path: "sources/meta-qt5"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
     commit: "450941a1b6df96285691e8c23d4f332d3c88a994"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
     commit: "b8d1a14f7f3b76457c36752202ea7ae5881b6654"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -56,6 +62,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
     commit: "10.01.10"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -64,6 +71,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
     commit: "7088279c0ab00c7dabefdd4544951b4746b48476"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -72,10 +80,12 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
     commit: "9fbfa9db33131abdf3870a94f00199eb53e276e5"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
     commit: "dac630ab5ee7aa6c5c7c294093adbd11b116c765"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/processor-sdk/processor-sdk-scarthgap-11.00.09.04-config.y=
ml b/kas/processor-sdk/processor-sdk-scarthgap-11.00.09.04-config.yml
index 68c1aa0..faf39ab 100644
--- a/kas/processor-sdk/processor-sdk-scarthgap-11.00.09.04-config.yml
+++ b/kas/processor-sdk/processor-sdk-scarthgap-11.00.09.04-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
     commit: "696c2c1ef095f8b11c7d2eff36fae50f58c62e5e"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://github.com/TexasInstruments/meta-tisdk.git"
     branch: "scarthgap"
     commit: "11.00.09.04"
+    path: "sources/meta-tisdk"
     layers:
       meta-ti-foundational:
       meta-ti-ml:
@@ -27,6 +29,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
     commit: "11.00.09"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -36,16 +39,19 @@ repos:
     url: "https://code.qt.io/yocto/meta-qt6.git"
     branch: "6.9"
     commit: "78855ecc613fcd6eff1a5a012cab5e679df329e4"
+    path: "sources/meta-qt6"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
     commit: "0c191912421adff2f753e470056a9a525fbce760"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
     commit: "edd1a1e284fdcb80cd48d411f235d47f23bc27ae"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -58,6 +64,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
     commit: "11.00.09"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-beagle:
@@ -67,6 +74,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
     commit: "3cadb81ffaa9f03b92e302843cb22a9cd41df34b"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -75,10 +83,12 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
     commit: "b9ef02282197380ef05edbd0eb852e1934ceb59b"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
     commit: "1be6d83466e3a0da4222ba502c2a86c25c835a35"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/processor-sdk/processor-sdk-scarthgap-11.01.05.03-config.y=
ml b/kas/processor-sdk/processor-sdk-scarthgap-11.01.05.03-config.yml
index d1aa027..7b041f8 100644
--- a/kas/processor-sdk/processor-sdk-scarthgap-11.01.05.03-config.yml
+++ b/kas/processor-sdk/processor-sdk-scarthgap-11.01.05.03-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
     commit: "139f61fe9eec221745184a14b3618d2dfa650b91"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://github.com/TexasInstruments/meta-tisdk.git"
     branch: "scarthgap"
     commit: "11.01.05.03"
+    path: "sources/meta-tisdk"
     layers:
       meta-ti-foundational:
       meta-ti-ml:
@@ -27,6 +29,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
     commit: "11.01.05"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -36,16 +39,19 @@ repos:
     url: "https://code.qt.io/yocto/meta-qt6.git"
     branch: "6.9"
     commit: "18bda8b8a5cf03ad16ed3c52b110b63b98b8ed77"
+    path: "sources/meta-qt6"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
     commit: "9e040ee8dd6025558ea60ac9db60c41bfeddf221"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
     commit: "727811eaf256b88fd135be99559f2cbf14c82fce"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -58,11 +64,13 @@ repos:
     url: "https://git.yoctoproject.org/meta-lts-mixins"
     branch: "scarthgap/rust"
     commit: "a8046d5ec53b1856169ac795aa87cb0d5db84c04"
+    path: "sources/meta-lts-mixins"
=20
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
     commit: "11.01.05"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-beagle:
@@ -72,6 +80,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
     commit: "8e0f8af90fefb03f08cd2228cde7a89902a6b37c"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -80,10 +89,12 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
     commit: "eea5ec23155cfd47781599fdc9a92c21e4caffc8"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
     commit: "cfa97a50e06fb0fcc7cbc0ada54ce7ad5ba29ebe"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/processor-sdk/processor-sdk-scarthgap-11.01.16.13-config.y=
ml b/kas/processor-sdk/processor-sdk-scarthgap-11.01.16.13-config.yml
index f475f4e..971ce6c 100644
--- a/kas/processor-sdk/processor-sdk-scarthgap-11.01.16.13-config.yml
+++ b/kas/processor-sdk/processor-sdk-scarthgap-11.01.16.13-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
     commit: "1c9ec1ffde75809de34c10d3ec2b40d84d258cb4"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://github.com/TexasInstruments/meta-tisdk.git"
     branch: "scarthgap"
     commit: "11.01.16.13"
+    path: "sources/meta-tisdk"
     layers:
       meta-ti-foundational:
       meta-ti-ml:
@@ -27,6 +29,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
     commit: "11.01.16"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -36,16 +39,19 @@ repos:
     url: "https://code.qt.io/yocto/meta-qt6.git"
     branch: "6.9"
     commit: "c7d71f4cece4d1fe3110c945b9bd40ca82960e05"
+    path: "sources/meta-qt6"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
     commit: "af1db2042caf8021d767dce1b26c08b59b96f3d1"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
     commit: "e621da947048842109db1b4fd3917a02e0501aa2"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -58,11 +64,13 @@ repos:
     url: "https://git.yoctoproject.org/meta-lts-mixins"
     branch: "scarthgap/rust"
     commit: "a8046d5ec53b1856169ac795aa87cb0d5db84c04"
+    path: "sources/meta-lts-mixins"
=20
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
     commit: "11.01.16"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-beagle:
@@ -72,6 +80,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
     commit: "0f1e7bf92c89759f0ab74cfa5be4ee47b092ad46"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -80,10 +89,12 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
     commit: "057ee563305e9484b29d02347aeafdadc5ea28ed"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
     commit: "4cf131ebd157b79226533b5a5074691dd0e1a4ab"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/processor-sdk/processor-sdk-scarthgap-11.02.05.02-config.y=
ml b/kas/processor-sdk/processor-sdk-scarthgap-11.02.05.02-config.yml
index b12cd5e..b02abf7 100644
--- a/kas/processor-sdk/processor-sdk-scarthgap-11.02.05.02-config.yml
+++ b/kas/processor-sdk/processor-sdk-scarthgap-11.02.05.02-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
     commit: "8dcf084522b9c66a6639b5f117f554fde9b6b45a"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://github.com/TexasInstruments/meta-tisdk.git"
     branch: "scarthgap"
     commit: "11.02.05.02"
+    path: "sources/meta-tisdk"
     layers:
       meta-ti-foundational:
       meta-ti-ml:
@@ -27,6 +29,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
     commit: "11.02.05"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -36,16 +39,19 @@ repos:
     url: "https://code.qt.io/yocto/meta-qt6.git"
     branch: "6.9"
     commit: "c7d71f4cece4d1fe3110c945b9bd40ca82960e05"
+    path: "sources/meta-qt6"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
     commit: "af1db2042caf8021d767dce1b26c08b59b96f3d1"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
     commit: "f1f248262d662315159ee96c604f97415d1dbe6a"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -58,11 +64,13 @@ repos:
     url: "https://git.yoctoproject.org/meta-lts-mixins"
     branch: "scarthgap/rust"
     commit: "a8046d5ec53b1856169ac795aa87cb0d5db84c04"
+    path: "sources/meta-lts-mixins"
=20
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
     commit: "11.02.05"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-beagle:
@@ -72,6 +80,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
     commit: "a81c19915b5b9e71ed394032e9a50fd06919e1cd"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -80,10 +89,12 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
     commit: "731488911f55ebfe746068512b426351192f82f2"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
     commit: "06d4981313ce67a8d53b1c14be9845b4b5a9f4cf"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/processor-sdk/processor-sdk-scarthgap-11.02.08.02-config.y=
ml b/kas/processor-sdk/processor-sdk-scarthgap-11.02.08.02-config.yml
index ae6a4e7..ad05a1b 100644
--- a/kas/processor-sdk/processor-sdk-scarthgap-11.02.08.02-config.yml
+++ b/kas/processor-sdk/processor-sdk-scarthgap-11.02.08.02-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
     commit: "8dcf084522b9c66a6639b5f117f554fde9b6b45a"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://github.com/TexasInstruments/meta-tisdk.git"
     branch: "scarthgap"
     commit: "11.02.08.02"
+    path: "sources/meta-tisdk"
     layers:
       meta-ti-foundational:
       meta-ti-ml:
@@ -27,6 +29,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
     commit: "11.02.08"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -36,16 +39,19 @@ repos:
     url: "https://code.qt.io/yocto/meta-qt6.git"
     branch: "6.9"
     commit: "c7d71f4cece4d1fe3110c945b9bd40ca82960e05"
+    path: "sources/meta-qt6"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
     commit: "17ac21e7d7f6f40a87618b22278b63bcfa14dbf2"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
     commit: "89a01c3d9ad1f8fce6aeb4dd0e694cfa28d42099"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -58,11 +64,13 @@ repos:
     url: "https://git.yoctoproject.org/meta-lts-mixins"
     branch: "scarthgap/rust"
     commit: "a8046d5ec53b1856169ac795aa87cb0d5db84c04"
+    path: "sources/meta-lts-mixins"
=20
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
     commit: "11.02.08"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-beagle:
@@ -72,6 +80,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
     commit: "a81c19915b5b9e71ed394032e9a50fd06919e1cd"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -80,10 +89,12 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
     commit: "731488911f55ebfe746068512b426351192f82f2"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
     commit: "1fbd9eddbdf0da062df0510cabff6f6ee33d5752"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.00.07.04=
-config.yml b/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.00.07.0=
4-config.yml
index 198c7d8..ace1474 100644
--- a/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.00.07.04-config=
.yml
+++ b/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.00.07.04-config=
.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
     commit: "11d83170922a2c6b9db1f6e8c23e533526984b2c"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,11 +20,13 @@ repos:
     url: "https://github.com/TexasInstruments/meta-tisdk.git"
     branch: "scarthgap"
     commit: "10.00.07.04"
+    path: "sources/meta-tisdk"
=20
   meta-arago:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
     commit: "10.00.07"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -34,6 +37,7 @@ repos:
     url: "https://github.com/OSSystems/meta-browser.git"
     branch: "master"
     commit: "1ed2254d72a4c25879014c98be287a7e3e22904c"
+    path: "sources/meta-browser"
     layers:
       meta-chromium:
=20
@@ -41,16 +45,19 @@ repos:
     url: "https://github.com/meta-qt5/meta-qt5.git"
     branch: "scarthgap"
     commit: "eb828418264a49b8d00035cb3d7b12fcea3be801"
+    path: "sources/meta-qt5"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
     commit: "6a80f140e387621f62964209a2e07d3bcfb125ce"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
     commit: "18f939a5fb37528a5415b05077ece383c346a119"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -63,6 +70,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
     commit: "10.00.07"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -71,6 +79,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
     commit: "1b85bbb4cab9658da3cd926c62038b8559c5c64e"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -79,11 +88,13 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
     commit: "df21b1563910c80d7e2964971b7c5b79b5186922"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
     commit: "c00a9a8f25b0042b0723a5d20b88e92d473d22bf"
+    path: "sources/oe-core"
     layers:
       meta:
=20
@@ -91,3 +102,4 @@ repos:
     url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
     branch: "scarthgap"
     commit: "10.00.00.04"
+    path: "sources/meta-edgeai"
diff --git a/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04=
-config.yml b/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.0=
4-config.yml
index 3cda86a..d5c0770 100644
--- a/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-config=
.yml
+++ b/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-config=
.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
     commit: "6c2641f7a9e92c1b82e306f59ddd3c1249c52cbf"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,11 +20,13 @@ repos:
     url: "https://github.com/TexasInstruments/meta-tisdk.git"
     branch: "scarthgap"
     commit: "10.01.10.04"
+    path: "sources/meta-tisdk"
=20
   meta-arago:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
     commit: "10.01.10"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -34,6 +37,7 @@ repos:
     url: "https://github.com/OSSystems/meta-browser.git"
     branch: "master"
     commit: "1ed2254d72a4c25879014c98be287a7e3e22904c"
+    path: "sources/meta-browser"
     layers:
       meta-chromium:
=20
@@ -41,16 +45,19 @@ repos:
     url: "https://github.com/meta-qt5/meta-qt5.git"
     branch: "scarthgap"
     commit: "eb828418264a49b8d00035cb3d7b12fcea3be801"
+    path: "sources/meta-qt5"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
     commit: "450941a1b6df96285691e8c23d4f332d3c88a994"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
     commit: "b8d1a14f7f3b76457c36752202ea7ae5881b6654"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -63,6 +70,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
     commit: "10.01.10"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-ti-bsp:
@@ -71,6 +79,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
     commit: "7088279c0ab00c7dabefdd4544951b4746b48476"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -79,11 +88,13 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
     commit: "9fbfa9db33131abdf3870a94f00199eb53e276e5"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
     commit: "dac630ab5ee7aa6c5c7c294093adbd11b116c765"
+    path: "sources/oe-core"
     layers:
       meta:
=20
@@ -91,3 +102,4 @@ repos:
     url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
     branch: "scarthgap"
     commit: "10.01.10.04"
+    path: "sources/meta-edgeai"
diff --git a/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.00.09.04=
-config.yml b/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.00.09.0=
4-config.yml
index 2287442..fdbb764 100644
--- a/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.00.09.04-config=
.yml
+++ b/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.00.09.04-config=
.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
     commit: "696c2c1ef095f8b11c7d2eff36fae50f58c62e5e"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://github.com/TexasInstruments/meta-tisdk.git"
     branch: "scarthgap"
     commit: "11.00.09.04"
+    path: "sources/meta-tisdk"
     layers:
       meta-ti-foundational:
       meta-ti-ml:
@@ -27,6 +29,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
     commit: "11.00.09"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -36,6 +39,7 @@ repos:
     url: "https://github.com/OSSystems/meta-browser.git"
     branch: "master"
     commit: "68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4"
+    path: "sources/meta-browser"
     layers:
       meta-chromium:
=20
@@ -43,16 +47,19 @@ repos:
     url: "https://code.qt.io/yocto/meta-qt6.git"
     branch: "6.9"
     commit: "78855ecc613fcd6eff1a5a012cab5e679df329e4"
+    path: "sources/meta-qt6"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
     commit: "0c191912421adff2f753e470056a9a525fbce760"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
     commit: "edd1a1e284fdcb80cd48d411f235d47f23bc27ae"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -65,6 +72,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
     commit: "11.00.09"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-beagle:
@@ -74,6 +82,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
     commit: "3cadb81ffaa9f03b92e302843cb22a9cd41df34b"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -82,10 +91,12 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
     commit: "b9ef02282197380ef05edbd0eb852e1934ceb59b"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
     commit: "1be6d83466e3a0da4222ba502c2a86c25c835a35"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.01.05.03=
-config.yml b/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.01.05.0=
3-config.yml
index 34b37b9..a8837e0 100644
--- a/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.01.05.03-config=
.yml
+++ b/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.01.05.03-config=
.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
     commit: "139f61fe9eec221745184a14b3618d2dfa650b91"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://github.com/TexasInstruments/meta-tisdk.git"
     branch: "scarthgap"
     commit: "11.01.05.03"
+    path: "sources/meta-tisdk"
     layers:
       meta-ti-foundational:
       meta-ti-ml:
@@ -27,6 +29,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
     commit: "11.01.05"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -36,6 +39,7 @@ repos:
     url: "https://github.com/OSSystems/meta-browser.git"
     branch: "master"
     commit: "27ca52f635a31f5f9762813a8527dd31323549b7"
+    path: "sources/meta-browser"
     layers:
       meta-chromium:
=20
@@ -43,16 +47,19 @@ repos:
     url: "https://code.qt.io/yocto/meta-qt6.git"
     branch: "6.9"
     commit: "18bda8b8a5cf03ad16ed3c52b110b63b98b8ed77"
+    path: "sources/meta-qt6"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
     commit: "9e040ee8dd6025558ea60ac9db60c41bfeddf221"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
     commit: "727811eaf256b88fd135be99559f2cbf14c82fce"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -65,11 +72,13 @@ repos:
     url: "https://git.yoctoproject.org/meta-lts-mixins"
     branch: "scarthgap/rust"
     commit: "a8046d5ec53b1856169ac795aa87cb0d5db84c04"
+    path: "sources/meta-lts-mixins"
=20
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
     commit: "11.01.05"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-beagle:
@@ -79,6 +88,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
     commit: "8e0f8af90fefb03f08cd2228cde7a89902a6b37c"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -87,10 +97,12 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
     commit: "eea5ec23155cfd47781599fdc9a92c21e4caffc8"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
     commit: "cfa97a50e06fb0fcc7cbc0ada54ce7ad5ba29ebe"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.01.12.10=
-config.yml b/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.01.12.1=
0-config.yml
index e2353d4..1704ceb 100644
--- a/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.01.12.10-config=
.yml
+++ b/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.01.12.10-config=
.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
     commit: "982645110a19ebb94d519926a4e14c8a2a205cfd"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://github.com/TexasInstruments/meta-tisdk.git"
     branch: "scarthgap"
     commit: "11.01.12.10"
+    path: "sources/meta-tisdk"
     layers:
       meta-ti-foundational:
       meta-ti-ml:
@@ -27,6 +29,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
     commit: "11.01.12"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -36,6 +39,7 @@ repos:
     url: "https://github.com/OSSystems/meta-browser.git"
     branch: "master"
     commit: "27ca52f635a31f5f9762813a8527dd31323549b7"
+    path: "sources/meta-browser"
     layers:
       meta-chromium:
=20
@@ -43,16 +47,19 @@ repos:
     url: "https://code.qt.io/yocto/meta-qt6.git"
     branch: "6.9"
     commit: "2033d6b48e6f5258b101fe433c90ebdb9c22f643"
+    path: "sources/meta-qt6"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
     commit: "02f72c96bf9acd0bd3ae0463f482bce8feabe749"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
     commit: "c29a18fa39ede952f3f6108ec007c1906e2d9a0d"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -65,11 +72,13 @@ repos:
     url: "https://git.yoctoproject.org/meta-lts-mixins"
     branch: "scarthgap/rust"
     commit: "a8046d5ec53b1856169ac795aa87cb0d5db84c04"
+    path: "sources/meta-lts-mixins"
=20
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
     commit: "11.01.12"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-beagle:
@@ -79,6 +88,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
     commit: "8e0f8af90fefb03f08cd2228cde7a89902a6b37c"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -87,10 +97,12 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
     commit: "6691e4bc47e20b903dc3dd7684685086d2468b84"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
     commit: "93c7489d843a0e46fe4fc685b356d0ae885300d7"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.01.16.13=
-config.yml b/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.01.16.1=
3-config.yml
index 040fa89..36d1cca 100644
--- a/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.01.16.13-config=
.yml
+++ b/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.01.16.13-config=
.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
     commit: "1c9ec1ffde75809de34c10d3ec2b40d84d258cb4"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://github.com/TexasInstruments/meta-tisdk.git"
     branch: "scarthgap"
     commit: "11.01.16.13"
+    path: "sources/meta-tisdk"
     layers:
       meta-ti-foundational:
       meta-ti-ml:
@@ -27,6 +29,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
     commit: "11.01.16"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -36,6 +39,7 @@ repos:
     url: "https://github.com/OSSystems/meta-browser.git"
     branch: "master"
     commit: "27ca52f635a31f5f9762813a8527dd31323549b7"
+    path: "sources/meta-browser"
     layers:
       meta-chromium:
=20
@@ -43,16 +47,19 @@ repos:
     url: "https://code.qt.io/yocto/meta-qt6.git"
     branch: "6.9"
     commit: "c7d71f4cece4d1fe3110c945b9bd40ca82960e05"
+    path: "sources/meta-qt6"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
     commit: "af1db2042caf8021d767dce1b26c08b59b96f3d1"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
     commit: "e621da947048842109db1b4fd3917a02e0501aa2"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -65,11 +72,13 @@ repos:
     url: "https://git.yoctoproject.org/meta-lts-mixins"
     branch: "scarthgap/rust"
     commit: "a8046d5ec53b1856169ac795aa87cb0d5db84c04"
+    path: "sources/meta-lts-mixins"
=20
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
     commit: "11.01.16"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-beagle:
@@ -79,6 +88,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
     commit: "0f1e7bf92c89759f0ab74cfa5be4ee47b092ad46"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -87,10 +97,12 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
     commit: "057ee563305e9484b29d02347aeafdadc5ea28ed"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
     commit: "4cf131ebd157b79226533b5a5074691dd0e1a4ab"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.02.08.02=
-config.yml b/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.02.08.0=
2-config.yml
index 55cdbd7..dc41882 100644
--- a/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.02.08.02-config=
.yml
+++ b/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.02.08.02-config=
.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
     commit: "8dcf084522b9c66a6639b5f117f554fde9b6b45a"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://github.com/TexasInstruments/meta-tisdk.git"
     branch: "scarthgap"
     commit: "11.02.08.02"
+    path: "sources/meta-tisdk"
     layers:
       meta-ti-foundational:
       meta-ti-ml:
@@ -27,6 +29,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
     commit: "11.02.08"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -36,6 +39,7 @@ repos:
     url: "https://github.com/OSSystems/meta-browser.git"
     branch: "master"
     commit: "27ca52f635a31f5f9762813a8527dd31323549b7"
+    path: "sources/meta-browser"
     layers:
       meta-chromium:
=20
@@ -43,16 +47,19 @@ repos:
     url: "https://code.qt.io/yocto/meta-qt6.git"
     branch: "6.9"
     commit: "c7d71f4cece4d1fe3110c945b9bd40ca82960e05"
+    path: "sources/meta-qt6"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
     commit: "17ac21e7d7f6f40a87618b22278b63bcfa14dbf2"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
     commit: "89a01c3d9ad1f8fce6aeb4dd0e694cfa28d42099"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -65,11 +72,13 @@ repos:
     url: "https://git.yoctoproject.org/meta-lts-mixins"
     branch: "scarthgap/rust"
     commit: "a8046d5ec53b1856169ac795aa87cb0d5db84c04"
+    path: "sources/meta-lts-mixins"
=20
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
     commit: "11.02.08"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-beagle:
@@ -79,6 +88,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
     commit: "a81c19915b5b9e71ed394032e9a50fd06919e1cd"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -87,10 +97,12 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
     commit: "731488911f55ebfe746068512b426351192f82f2"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
     commit: "1fbd9eddbdf0da062df0510cabff6f6ee33d5752"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/processor-sdk/processor-sdk-scarthgap-evse-11.02.08.03-con=
fig.yml b/kas/processor-sdk/processor-sdk-scarthgap-evse-11.02.08.03-config=
.yml
index 99360a9..8423bd7 100644
--- a/kas/processor-sdk/processor-sdk-scarthgap-evse-11.02.08.03-config.yml
+++ b/kas/processor-sdk/processor-sdk-scarthgap-evse-11.02.08.03-config.yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
     commit: "8dcf084522b9c66a6639b5f117f554fde9b6b45a"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://github.com/TexasInstruments/meta-tisdk.git"
     branch: "scarthgap"
     commit: "11.02.08.03"
+    path: "sources/meta-tisdk"
     layers:
       meta-ti-foundational:
       meta-ti-ml:
@@ -27,6 +29,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
     commit: "11.02.08"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -36,11 +39,13 @@ repos:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
     commit: "17ac21e7d7f6f40a87618b22278b63bcfa14dbf2"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
     commit: "89a01c3d9ad1f8fce6aeb4dd0e694cfa28d42099"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -53,11 +58,13 @@ repos:
     url: "https://git.yoctoproject.org/meta-lts-mixins"
     branch: "scarthgap/rust"
     commit: "a8046d5ec53b1856169ac795aa87cb0d5db84c04"
+    path: "sources/meta-lts-mixins"
=20
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
     commit: "11.02.08"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-beagle:
@@ -67,6 +74,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
     commit: "a81c19915b5b9e71ed394032e9a50fd06919e1cd"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -75,11 +83,13 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
     commit: "731488911f55ebfe746068512b426351192f82f2"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
     commit: "1fbd9eddbdf0da062df0510cabff6f6ee33d5752"
+    path: "sources/oe-core"
     layers:
       meta:
=20
@@ -87,8 +97,10 @@ repos:
     url: "https://github.com/EVerest/meta-everest"
     branch: "scarthgap"
     commit: "5e7d982af2cf3b5f155648cc0bfdf82e07cab9f6"
+    path: "sources/meta-everest"
=20
   meta-lumissil-greenphy:
     url: "https://github.com/phytec/meta-lumissil-greenphy.git"
     branch: "scarthgap"
     commit: "3af7953a60337b95ef782e03f794ab797c38151e"
+    path: "sources/meta-lumissil-greenphy"
diff --git a/kas/processor-sdk/processor-sdk-scarthgap-nonqt-11.01.05.03-co=
nfig.yml b/kas/processor-sdk/processor-sdk-scarthgap-nonqt-11.01.05.03-conf=
ig.yml
index c7d239f..9d83616 100644
--- a/kas/processor-sdk/processor-sdk-scarthgap-nonqt-11.01.05.03-config.ym=
l
+++ b/kas/processor-sdk/processor-sdk-scarthgap-nonqt-11.01.05.03-config.ym=
l
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
     commit: "139f61fe9eec221745184a14b3618d2dfa650b91"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://github.com/TexasInstruments/meta-tisdk.git"
     branch: "scarthgap"
     commit: "11.01.05.03"
+    path: "sources/meta-tisdk"
     layers:
       meta-ti-foundational:
       meta-ti-ml:
@@ -27,6 +29,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
     commit: "11.01.05"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -36,11 +39,13 @@ repos:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
     commit: "9e040ee8dd6025558ea60ac9db60c41bfeddf221"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
     commit: "727811eaf256b88fd135be99559f2cbf14c82fce"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -53,11 +58,13 @@ repos:
     url: "https://git.yoctoproject.org/meta-lts-mixins"
     branch: "scarthgap/rust"
     commit: "a8046d5ec53b1856169ac795aa87cb0d5db84c04"
+    path: "sources/meta-lts-mixins"
=20
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
     commit: "11.01.05"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-beagle:
@@ -67,6 +74,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
     commit: "8e0f8af90fefb03f08cd2228cde7a89902a6b37c"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -75,10 +83,12 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
     commit: "eea5ec23155cfd47781599fdc9a92c21e4caffc8"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
     commit: "cfa97a50e06fb0fcc7cbc0ada54ce7ad5ba29ebe"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/processor-sdk/processor-sdk-scarthgap-nonqt-11.01.16.13-co=
nfig.yml b/kas/processor-sdk/processor-sdk-scarthgap-nonqt-11.01.16.13-conf=
ig.yml
index 390f461..4135cc8 100644
--- a/kas/processor-sdk/processor-sdk-scarthgap-nonqt-11.01.16.13-config.ym=
l
+++ b/kas/processor-sdk/processor-sdk-scarthgap-nonqt-11.01.16.13-config.ym=
l
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
     commit: "1c9ec1ffde75809de34c10d3ec2b40d84d258cb4"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://github.com/TexasInstruments/meta-tisdk.git"
     branch: "scarthgap"
     commit: "11.01.16.13"
+    path: "sources/meta-tisdk"
     layers:
       meta-ti-foundational:
       meta-ti-ml:
@@ -27,6 +29,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
     commit: "11.01.16"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -36,11 +39,13 @@ repos:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
     commit: "af1db2042caf8021d767dce1b26c08b59b96f3d1"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
     commit: "e621da947048842109db1b4fd3917a02e0501aa2"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -53,11 +58,13 @@ repos:
     url: "https://git.yoctoproject.org/meta-lts-mixins"
     branch: "scarthgap/rust"
     commit: "a8046d5ec53b1856169ac795aa87cb0d5db84c04"
+    path: "sources/meta-lts-mixins"
=20
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
     commit: "11.01.16"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-beagle:
@@ -67,6 +74,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
     commit: "0f1e7bf92c89759f0ab74cfa5be4ee47b092ad46"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -75,10 +83,12 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
     commit: "057ee563305e9484b29d02347aeafdadc5ea28ed"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
     commit: "4cf131ebd157b79226533b5a5074691dd0e1a4ab"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/processor-sdk/processor-sdk-scarthgap-nonqt-11.02.08.02-co=
nfig.yml b/kas/processor-sdk/processor-sdk-scarthgap-nonqt-11.02.08.02-conf=
ig.yml
index 3dfff6d..e1968d4 100644
--- a/kas/processor-sdk/processor-sdk-scarthgap-nonqt-11.02.08.02-config.ym=
l
+++ b/kas/processor-sdk/processor-sdk-scarthgap-nonqt-11.02.08.02-config.ym=
l
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
     commit: "8dcf084522b9c66a6639b5f117f554fde9b6b45a"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://github.com/TexasInstruments/meta-tisdk.git"
     branch: "scarthgap"
     commit: "11.02.08.02"
+    path: "sources/meta-tisdk"
     layers:
       meta-ti-foundational:
       meta-ti-ml:
@@ -27,6 +29,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
     commit: "11.02.08"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -36,11 +39,13 @@ repos:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
     commit: "17ac21e7d7f6f40a87618b22278b63bcfa14dbf2"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
     commit: "89a01c3d9ad1f8fce6aeb4dd0e694cfa28d42099"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -53,11 +58,13 @@ repos:
     url: "https://git.yoctoproject.org/meta-lts-mixins"
     branch: "scarthgap/rust"
     commit: "a8046d5ec53b1856169ac795aa87cb0d5db84c04"
+    path: "sources/meta-lts-mixins"
=20
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
     commit: "11.02.08"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-beagle:
@@ -67,6 +74,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
     commit: "a81c19915b5b9e71ed394032e9a50fd06919e1cd"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -75,10 +83,12 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
     commit: "731488911f55ebfe746068512b426351192f82f2"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
     commit: "1fbd9eddbdf0da062df0510cabff6f6ee33d5752"
+    path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/processor-sdk/processor-sdk-scarthgap-selinux-11.00.09.04-=
config.yml b/kas/processor-sdk/processor-sdk-scarthgap-selinux-11.00.09.04-=
config.yml
index e4fe1c0..7594134 100644
--- a/kas/processor-sdk/processor-sdk-scarthgap-selinux-11.00.09.04-config.=
yml
+++ b/kas/processor-sdk/processor-sdk-scarthgap-selinux-11.00.09.04-config.=
yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
     commit: "696c2c1ef095f8b11c7d2eff36fae50f58c62e5e"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://github.com/TexasInstruments/meta-tisdk.git"
     branch: "scarthgap"
     commit: "11.00.09.04"
+    path: "sources/meta-tisdk"
     layers:
       meta-ti-foundational:
       meta-ti-ml:
@@ -27,6 +29,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
     commit: "11.00.09"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -36,21 +39,25 @@ repos:
     url: "https://git.yoctoproject.org/meta-selinux"
     branch: "scarthgap"
     commit: "4fbbcab2cb452c9430cba780e7cb11b2165c997a"
+    path: "sources/meta-selinux"
=20
   meta-qt6:
     url: "https://code.qt.io/yocto/meta-qt6.git"
     branch: "6.9"
     commit: "78855ecc613fcd6eff1a5a012cab5e679df329e4"
+    path: "sources/meta-qt6"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
     commit: "0c191912421adff2f753e470056a9a525fbce760"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
     commit: "edd1a1e284fdcb80cd48d411f235d47f23bc27ae"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -63,6 +70,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
     commit: "11.00.09"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-beagle:
@@ -72,6 +80,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
     commit: "3cadb81ffaa9f03b92e302843cb22a9cd41df34b"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -80,11 +89,13 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
     commit: "b9ef02282197380ef05edbd0eb852e1934ceb59b"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
     commit: "1be6d83466e3a0da4222ba502c2a86c25c835a35"
+    path: "sources/oe-core"
     layers:
       meta:
=20
diff --git a/kas/processor-sdk/processor-sdk-scarthgap-selinux-11.01.05.03-=
config.yml b/kas/processor-sdk/processor-sdk-scarthgap-selinux-11.01.05.03-=
config.yml
index 3b6bb3f..275eaec 100644
--- a/kas/processor-sdk/processor-sdk-scarthgap-selinux-11.01.05.03-config.=
yml
+++ b/kas/processor-sdk/processor-sdk-scarthgap-selinux-11.01.05.03-config.=
yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
     commit: "139f61fe9eec221745184a14b3618d2dfa650b91"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://github.com/TexasInstruments/meta-tisdk.git"
     branch: "scarthgap"
     commit: "11.01.05.03"
+    path: "sources/meta-tisdk"
     layers:
       meta-ti-foundational:
       meta-ti-ml:
@@ -27,6 +29,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
     commit: "11.01.05"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -36,21 +39,25 @@ repos:
     url: "https://git.yoctoproject.org/meta-selinux"
     branch: "scarthgap"
     commit: "c4b059262089b74c8fbf8dd5fdf5fd7bc1deeddc"
+    path: "sources/meta-selinux"
=20
   meta-qt6:
     url: "https://code.qt.io/yocto/meta-qt6.git"
     branch: "6.9"
     commit: "18bda8b8a5cf03ad16ed3c52b110b63b98b8ed77"
+    path: "sources/meta-qt6"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
     commit: "9e040ee8dd6025558ea60ac9db60c41bfeddf221"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
     commit: "727811eaf256b88fd135be99559f2cbf14c82fce"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -63,11 +70,13 @@ repos:
     url: "https://git.yoctoproject.org/meta-lts-mixins"
     branch: "scarthgap/rust"
     commit: "a8046d5ec53b1856169ac795aa87cb0d5db84c04"
+    path: "sources/meta-lts-mixins"
=20
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
     commit: "11.01.05"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-beagle:
@@ -77,6 +86,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
     commit: "8e0f8af90fefb03f08cd2228cde7a89902a6b37c"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -85,11 +95,13 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
     commit: "eea5ec23155cfd47781599fdc9a92c21e4caffc8"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
     commit: "cfa97a50e06fb0fcc7cbc0ada54ce7ad5ba29ebe"
+    path: "sources/oe-core"
     layers:
       meta:
=20
diff --git a/kas/processor-sdk/processor-sdk-scarthgap-selinux-11.01.16.13-=
config.yml b/kas/processor-sdk/processor-sdk-scarthgap-selinux-11.01.16.13-=
config.yml
index 47fd67c..ce39489 100644
--- a/kas/processor-sdk/processor-sdk-scarthgap-selinux-11.01.16.13-config.=
yml
+++ b/kas/processor-sdk/processor-sdk-scarthgap-selinux-11.01.16.13-config.=
yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
     commit: "1c9ec1ffde75809de34c10d3ec2b40d84d258cb4"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://github.com/TexasInstruments/meta-tisdk.git"
     branch: "scarthgap"
     commit: "11.01.16.13"
+    path: "sources/meta-tisdk"
     layers:
       meta-ti-foundational:
       meta-ti-ml:
@@ -27,6 +29,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
     commit: "11.01.16"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -36,21 +39,25 @@ repos:
     url: "https://git.yoctoproject.org/meta-selinux"
     branch: "scarthgap"
     commit: "c999577d7ab4b1b54fff61ab15c46a6f9e242d0d"
+    path: "sources/meta-selinux"
=20
   meta-qt6:
     url: "https://code.qt.io/yocto/meta-qt6.git"
     branch: "6.9"
     commit: "c7d71f4cece4d1fe3110c945b9bd40ca82960e05"
+    path: "sources/meta-qt6"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
     commit: "af1db2042caf8021d767dce1b26c08b59b96f3d1"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
     commit: "e621da947048842109db1b4fd3917a02e0501aa2"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -63,11 +70,13 @@ repos:
     url: "https://git.yoctoproject.org/meta-lts-mixins"
     branch: "scarthgap/rust"
     commit: "a8046d5ec53b1856169ac795aa87cb0d5db84c04"
+    path: "sources/meta-lts-mixins"
=20
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
     commit: "11.01.16"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-beagle:
@@ -77,6 +86,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
     commit: "0f1e7bf92c89759f0ab74cfa5be4ee47b092ad46"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -85,11 +95,13 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
     commit: "057ee563305e9484b29d02347aeafdadc5ea28ed"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
     commit: "4cf131ebd157b79226533b5a5074691dd0e1a4ab"
+    path: "sources/oe-core"
     layers:
       meta:
=20
diff --git a/kas/processor-sdk/processor-sdk-scarthgap-selinux-11.02.08.02-=
config.yml b/kas/processor-sdk/processor-sdk-scarthgap-selinux-11.02.08.02-=
config.yml
index 08b4382..24848b5 100644
--- a/kas/processor-sdk/processor-sdk-scarthgap-selinux-11.02.08.02-config.=
yml
+++ b/kas/processor-sdk/processor-sdk-scarthgap-selinux-11.02.08.02-config.=
yml
@@ -2,8 +2,8 @@
 header:
   version: 17
   includes:
-    - ../templates/bblayers.conf.yml
-    - ../templates/local-arago64-v2.conf.yml
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v2.conf.yml
=20
 target: tisdk-default-image
=20
@@ -12,6 +12,7 @@ repos:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
     commit: "8dcf084522b9c66a6639b5f117f554fde9b6b45a"
+    path: "sources/bitbake"
     layers:
       .: disabled
=20
@@ -19,6 +20,7 @@ repos:
     url: "https://github.com/TexasInstruments/meta-tisdk.git"
     branch: "scarthgap"
     commit: "11.02.08.02"
+    path: "sources/meta-tisdk"
     layers:
       meta-ti-foundational:
       meta-ti-ml:
@@ -27,6 +29,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
     commit: "11.02.08"
+    path: "sources/meta-arago"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -36,21 +39,25 @@ repos:
     url: "https://git.yoctoproject.org/meta-selinux"
     branch: "scarthgap"
     commit: "1db6bf1b573b9c908752602c1e2b6a30368da3b7"
+    path: "sources/meta-selinux"
=20
   meta-qt6:
     url: "https://code.qt.io/yocto/meta-qt6.git"
     branch: "6.9"
     commit: "c7d71f4cece4d1fe3110c945b9bd40ca82960e05"
+    path: "sources/meta-qt6"
=20
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
     commit: "17ac21e7d7f6f40a87618b22278b63bcfa14dbf2"
+    path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
     commit: "89a01c3d9ad1f8fce6aeb4dd0e694cfa28d42099"
+    path: "sources/meta-openembedded"
     layers:
       meta-networking:
       meta-python:
@@ -63,11 +70,13 @@ repos:
     url: "https://git.yoctoproject.org/meta-lts-mixins"
     branch: "scarthgap/rust"
     commit: "a8046d5ec53b1856169ac795aa87cb0d5db84c04"
+    path: "sources/meta-lts-mixins"
=20
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
     commit: "11.02.08"
+    path: "sources/meta-ti"
     layers:
       meta-ti-extras:
       meta-beagle:
@@ -77,6 +86,7 @@ repos:
     url: "https://git.yoctoproject.org/meta-arm"
     branch: "scarthgap"
     commit: "a81c19915b5b9e71ed394032e9a50fd06919e1cd"
+    path: "sources/meta-arm"
     layers:
       meta-arm:
       meta-arm-toolchain:
@@ -85,11 +95,13 @@ repos:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
     commit: "731488911f55ebfe746068512b426351192f82f2"
+    path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
     commit: "1fbd9eddbdf0da062df0510cabff6f6ee33d5752"
+    path: "sources/oe-core"
     layers:
       meta:
=20
--=20
2.53.0


