Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF371E6BF1E
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 15:22:40 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12966.1769786560025159895
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 30 Jan 2026 07:22:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=lb1GhkEG;
 spf=pass (domain: list.ti.com, ip: 40.93.198.47, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yvj7U7EdY/LozaMVPsd/VBGJ++gn/hMqn1o1BHZtfN06UCcCFoxMag8TE8mZd3VMexpCXIE6YuaGcUR8Y+htkVpn9wY3M7haRh4L0zRkC4ayI4ZGZKGUZEpAxbxHEEAVAYNlJqNOygezdo6ur/1PApyrNlVD4R062ezTOrbmWNd8/mMZ1LdrmRLSaz7qx8bL/MKHUbs4L99Mke+LqWgUFrrFsGGsYqZrPKtzaaEMVvhRGd0FwABWDnV+c2Bl4bPIl5WeVnLbTR4q4xVzyK6rji1zBOdieck470GYciqUwXz3pvufGpMICfHvTURvelPOojqFKbGC37UopH3srQ4Bbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kjHxYb9a91jfmMyeIY8aJfEz368inOZVWOlIjmIuoIU=;
 b=AdNEHRnBNsO1ixXsi/HYIY+2aBFtlePwr3ZuCRTFpAA+2jmFgkIjNmKvpayuami7aQusb+lHuz6GPGqMBiYg1NLBEaTx7JPVkucH58KYEhY5lkamQt9TbB2z3lZQJbIVSIgLeUBPaZsLYFxJL2Dm293mSG6FHlbfCVHhurJ99lSFP6mjKOVCmlsK+M+uEg7kIFM4EXohrQDp/XyCe7Rkpd8e4IEnblHC7Yd+aQCd+sqoAEYKEMxpMEPnnwIDKWMnsWDsI9sW8r3P43Qz0dmvyzhWRFqH9erz6VGrcA+0Q76zWUCQHeeKTA3jSvsCg3SRoybnzSZpVD1oqCcSTumTJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kjHxYb9a91jfmMyeIY8aJfEz368inOZVWOlIjmIuoIU=;
 b=lb1GhkEGUBO17kOeC9oeZYMiMEcs0b5t0O4k/wocQxIlIqe3NLc3A/rvW7oPvrDwbjjCT22sLgJn3bKC3Q/qX82TREn0/ZATo8NdLCUpBVXBWWxwH6WpYn3f/6m859B+lR4jnnYB9YqmUE+iHcyqDQoQGhf8cATD6Q+/EUq81gDgtKIWCUg0eruhPpbpnLGW4NcLQbpQXLEGcXQqCHKPmnZilFxrSGgh8EO7KfGBBZVDaAQoQlp4gCgXIeFQHNAElDqOVwvme0BBAIA1nUd8mKqTptlKdzZM4LittfMTV5hrODKawr6Xsk4d/SyCo6RXLMT7VJb0KDnUC7+vJReepw==
Received: from BY3PR03CA0005.namprd03.prod.outlook.com (2603:10b6:a03:39a::10)
 by CO1PR10MB4689.namprd10.prod.outlook.com (2603:10b6:303:98::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Fri, 30 Jan
 2026 15:22:36 +0000
Received: from CO1PEPF000044EE.namprd05.prod.outlook.com
 (2603:10b6:a03:39a:cafe::f6) by BY3PR03CA0005.outlook.office365.com
 (2603:10b6:a03:39a::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.11 via Frontend Transport; Fri,
 30 Jan 2026 15:22:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF000044EE.mail.protection.outlook.com (10.167.241.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 30 Jan 2026 15:22:36 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 09:22:33 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 09:22:33 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 30 Jan 2026 09:22:33 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60UFMXl01912398;
	Fri, 30 Jan 2026 09:22:33 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 488C89ACF4; Fri, 30 Jan 2026 09:22:33 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>
Subject: Re: [meta-arago][master][PATCH] tisdk-core-bundle: Set IMAGE_BASENAME to include ARAGO_IMAGE_SUFFIX
Date: Fri, 30 Jan 2026 09:22:33 -0600
Message-ID: <20260130152233.2436667-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260130145953.981914-1-j-sahu@ti.com>
References: <20260130145953.981914-1-j-sahu@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EE:EE_|CO1PR10MB4689:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e0ded09-191e-4ee2-ff50-08de60136607
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?aVAIH+W/jhZD9ZtVf/p/q1LMu88FYQpIAfIDSpB6Fbog9P+zsNGSy9zo5LFE?=
 =?us-ascii?Q?uejqQWXRPV7rjMEi1/0/WTFO4/wXjiBDd1eHrCGEml5o6WXH9DZHbubusZq8?=
 =?us-ascii?Q?aB+ty2yY3Y7jpiqMXWnKWKMKtKZBehZ4xTuwt839IkiXF8MgrR3W712EIb2G?=
 =?us-ascii?Q?lJwYqA6ezC/3y2O13O/RdP2eqrtxe6ilu25wNmoPW2gFY5aaWJNNsppbomsX?=
 =?us-ascii?Q?3HCnAUAg9O+/BsyAmjuaX+hgucUWMt5rnkOmY/viiprkFYxAWrBuM6ZSKQQ5?=
 =?us-ascii?Q?hEaCWtgjd9vMStWIcy9TxKLGkiKhWbCSvvL8xP7keUOCyX5kurIBJ1AHVe9V?=
 =?us-ascii?Q?oywKyaYgX4baDGU9IDnkguinejbabpJaa9dMX7trPm30gmypdRsT6PGmAy1Q?=
 =?us-ascii?Q?ac5o1ry5x0a2QJsjVEYRcT3a5cOIgd1kgO4zdkhyaJqK4PnpfvwWyoyWdVFJ?=
 =?us-ascii?Q?rOrlgm1AYeF/772OdBKbUgqA4DVTNw+Npo4/QYzTPRLU/fSu4dzxnHan0NJr?=
 =?us-ascii?Q?FGf4twTb1iY90niBEgQqKJsKec95JFdM5OjbstHOJZSjmal6/UP1C1irB0sK?=
 =?us-ascii?Q?NEyWJLUCV7afF1iYhEdj5o0Kwn+r+6j7edB/gm9SRtm8hD1WrpjlgyZ0y9Yo?=
 =?us-ascii?Q?H+UxVYF/17LASv5YZN7CuDByuiOsOxpv0S907U2Y2Rjn/y6PeUq2iaydrL9G?=
 =?us-ascii?Q?QR75rxM0o7ZYvAQutSeR3JLGabd27tj2ek6Xhz3ke2ev0BAx6WxVDCCXKkil?=
 =?us-ascii?Q?oao60FuHMJPcR7fpaN11mINO7xC9MKappk11QqwBUAmJ5pPoKFcTtiqjjXkG?=
 =?us-ascii?Q?v3iNlWSVev4aL0bktDAZEtIMhgmTGHd4YuGem97SKn8P57IwWzDxxmJacq01?=
 =?us-ascii?Q?lmyPI/S+NzfcEh1PlUl7YbCOk651iD+s8uM6svzNW12xltq+pxGvqKXUAE4k?=
 =?us-ascii?Q?gP8WbLWgcWdrR1s+JO5FGAcKVTgetRcxwifzpLNIrWiqdC92o7oCWAWoWG/O?=
 =?us-ascii?Q?QUeI39QyP/+ow88DtcdgrebG8hYC2eZVOzzWzwxcbNjKvzm7og8PnmO4F75M?=
 =?us-ascii?Q?n/kecn6hmqn6MTnjjot1RBjBJPtmL/vtlqGDEmFQgVKIb1LxZf5+8RShpuur?=
 =?us-ascii?Q?/ts8qYLoak3wr8YewuIWGNtnUlYolZTns1lfwuR1NUVix3dJ6+YR+ubtBzgN?=
 =?us-ascii?Q?yh6Z8uDUAAKegUhOtuSFEJA+d8A5iTLAdipNBNOo20eJSv5ZjCYiFfhxTQHT?=
 =?us-ascii?Q?bI8Ai3nc03crG9w/9wZKP7yy8AvDYMy1JWsdwe3U1h7w8ImsQT5OyBO+dp/h?=
 =?us-ascii?Q?qA3XEMkpAWfMSxndCW+8tAT4CBgymsx0Iy6HNTL587KKZ72HzR0y2CpueDYr?=
 =?us-ascii?Q?ted+veCkBzSlq27mJjhtI7R2cXJn8tmioVQZeWYBt/IwZ3dTSwez7jNYuy6H?=
 =?us-ascii?Q?88OmKt3SGVsYzBlIk5hnVr4Lhnni+2TKJU8c3xheXf9babDsD/2xACyR/AMz?=
 =?us-ascii?Q?QPG2JaH+HNvsXqEmUmU+IomrxyOO1nq2Ulwqo04DPyaYablIXNkQ2PkeGEAF?=
 =?us-ascii?Q?UvTs2oEgVQYFj6p1Gsrdfr7DchVIeCfQmvuhoaL0sdM5jgr8OHx+gyYJFERW?=
 =?us-ascii?Q?TCdHORzeypPVA6UQdTKw+9y5w0PZ7BB+JbJeDhbLJNNdOfTjh6B9tz3qJXQ4?=
 =?us-ascii?Q?qsjcEg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	/bqqGq9K4pwFYE/dnUej3zxfhk2dbdwtFf6Sr8U+6J7kawMNnTarsKrfS3ejPJvNx3yPIiTbUUDVir0CPGf+LJDYxnasSA0tIGZ0o5p6G8msDY+BJC/KRwLgRKq7KJH+lyUNRWxP2Z2Xij1c8bf4zXFMKGyayUWHt/+1pXTWxPBs7GBUrzsPYM6BWlkTpBhNcQ19/c1QJqOpd2TssMDROjYFSn8E96bHhTZdaaxoIp61PqqumEUHfOXgSKz6QUMSU1gdVs+M8nvNWp+HSGa6ZMx0w/YJGDiDkvdTWn/zDNIECih0tBQyOW8ISWEVhMrOjvwWZnhoBBIzKddBaHSuh1vC9v9hnMxiUmB7VRHqxkuQe8uMxgajYSftqwnvZYi5bIiI1T2m0MjSc3KXjSEk51btl3g7vIrRGQ32W5JaDqMOKYkPa2m5lfPalVrmsqed
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 15:22:36.4277
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e0ded09-191e-4ee2-ff50-08de60136607
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000044EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4689
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 30 Jan 2026 15:22:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17050

meta-arago / na / 20260130145953.981914-1-j-sahu

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
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][master][PATCH] tisdk-core-bundle: Set IMAGE_BA=
SENAME to include ARAGO_IMAGE_SUFFIX
- Submitter: From: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
- Date: Date: Fri, 30 Jan 2026 20:29:53 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: bf1ea5cfef9e1384c721120ba0ea76a43=
3f6f02f

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Andrew Davis <afd@ti.com>
- Commit Subject: shadow-securetty: Remove unneeded recipe
- Commit SHA: ec59a3b33249af3f91b45428a35bca8cd1141fc6

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




