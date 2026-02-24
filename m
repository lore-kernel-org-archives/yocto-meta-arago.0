Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A268F4BB99
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 22:45:07 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33153.1771973098953557932
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 24 Feb 2026 14:44:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=KGemUmVm;
 spf=pass (domain: list.ti.com, ip: 40.93.194.23, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P766ZGGKPa6WYRAip/SkKnsyBeNShUDMWNwYaI2G8qp/NvnaFGOKX12Lm8qpLmtQ9Y/nUGCx9mdkkrAZdX8aqprtob0Aj8mMP57wikg44mMnVGMbJYufBRH/X1iRu9FIOIEK6RrlGi2gHeyDPeoz8rBfi/KSXpmRyOqnIT7IuIFa5Dwv2P5bHzZfOGlMfox9wl0bHK3adb4JM8l81WFD1lx4CiyTb92MkCU/bFZzZWXJJOrd+YmFOHIxvVQkHensgj0HMwuv0mWnstQMAPWn9sF0rleyD9aGaczD39j9UZI++0ASBFwRwR3lt6B3Pst5TIJ1QQchLNxIY1e8aBIg4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KMLDLYr0PQeZ9fKZdxSbo3rbGmlfAn/UbC0naCTJ0Ps=;
 b=qS9NSA87/x8gwmAFKYyf8Ej6eUhnfxm7hce3hDnW7Qr8ObjVAJ1yFo4nac7cjNtt6Bmb5ilsE+1rwlAPLZauJbCg+kmSjxHWfI7nDoAbIQJNXC0iUfJ9oIVlvQM/H1BgNOM3RfiLGyCx/yfQ+aTuNUefZaTXsw7atyO12RXY7pXTIe1639WqT+E+6oZOdnee0yrkQvv94ZAlqeci6h4mdgbfZP1258kwhMkYW+6MPbV+LU7QXnngivu4Iu70usSKENBjJjo0UjsK5zFbILiMzUn7Sz2mq+Cp/m+FiRf2FTnfavdNCpeohO0iONTHi1fo1MjpepnQ+WSZb4bq1sGXgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KMLDLYr0PQeZ9fKZdxSbo3rbGmlfAn/UbC0naCTJ0Ps=;
 b=KGemUmVm2hKBGDWn4b6oQmWnaZYv8qp1x4NCXlpvUcf+4aCY8bW1w4aS6QDQ4QlE48BmJ296RPUxmxPsRFFw4jr8WjW5R6/jy65MnPDqvpRBdu9Auyh1yaxY9zMVCD5cMj6zi81rjkdXJfW7w0lRsgP4YaSZAOK6IjDSimqrB4Eu1TLAv1LcJ86m1iWojfZWlP0+jUwjipmTNYKKdUSWjVnnyycAUiqmBxGJa/GuvrrjvA1h1imo0kvnGNrlpZH9Ac4Vut9tGvPZza4pbw66DqBKhKezY/UFLYxAx0U2FdM2c7dKcyZdp8fyWiG27G6h6Dt836qquVnu5XNLBfErqQ==
Received: from SN7P220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:123::16)
 by CY8PR10MB7217.namprd10.prod.outlook.com (2603:10b6:930:71::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 22:44:45 +0000
Received: from SA2PEPF00003AEA.namprd02.prod.outlook.com
 (2603:10b6:806:123:cafe::73) by SN7P220CA0011.outlook.office365.com
 (2603:10b6:806:123::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 22:44:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF00003AEA.mail.protection.outlook.com (10.167.248.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 22:44:45 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 16:44:44 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 16:44:44 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Feb 2026 16:44:44 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61OMiiMC315698;
	Tue, 24 Feb 2026 16:44:44 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 8F9102A5C; Tue, 24 Feb 2026 16:44:44 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] iperf: Remove old recipe
Date: Tue, 24 Feb 2026 16:44:44 -0600
Message-ID: <20260224224444.4079530-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260224222205.1295569-1-reatmon@ti.com>
References: <20260224222205.1295569-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEA:EE_|CY8PR10MB7217:EE_
X-MS-Office365-Filtering-Correlation-Id: 85c05ef8-d3cb-45fc-1f0e-08de73f64eac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|34070700014|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0F6woZXEgdAtM2vQnjTBN0WOUcXdcny3+O6rVNYIhr22Gx6DgpFvTv6lF582?=
 =?us-ascii?Q?IwD5YPcp/cXwHZbR/w+AMjC32gXkCtynlx3gfZApXZaVJ7WHZ6+0b5dOpQd0?=
 =?us-ascii?Q?n3ch91UWPQG8mUW+9NVI+mRGVBMxgn/HorZyzzhDuba4CEYVTlHn9hWHr3Z+?=
 =?us-ascii?Q?pETno2q2dHUXamGNNb8CA0+jpR9NCUq0T3lsckV/SqaGz3HlQKEBhpiISZyN?=
 =?us-ascii?Q?3sUfvKOW6GwEMVYzaSV9cv8/bYqZWhMClYkmNX548N4MsQTYdwVuvvdt/mBS?=
 =?us-ascii?Q?pyL25PXzmk6P1ovLMejWsX4hj2HzJ9vKi5XcPir4TvFSx3c5MHMJhrGJas18?=
 =?us-ascii?Q?BaLoSIxLcR0zYCaz4jT8QWb0w9zTAweKGutdMvi9lr08kd3V0ar2bdvm2pD+?=
 =?us-ascii?Q?oafH8tVoaGQtnEaGbrRxbGNLjZTNpXBtGXs9nV0NbAOGm6QFAkgjwDYrAdmT?=
 =?us-ascii?Q?hSOaLZgybYF4MCgLpUXfigniOamZH5l6xa4Czp0ySgiK52I9f9LqU6ZiavdK?=
 =?us-ascii?Q?nZooJ6LoBpzrf+IbD7Rt/H2GCBDQV8SXjS9YlMXQAoILoPFPpmog4vInv3EC?=
 =?us-ascii?Q?HLN24lsm83xinxCVjSTJpuPYaxtrIROuEQh7k1wcJbNcKEUsQPm/XgqkmyoI?=
 =?us-ascii?Q?TGK5cOJlSaB9PoWfnInLwgQM/Lp09s2NraeAdBpuFJFCVBC+ToxrCt7mXHxw?=
 =?us-ascii?Q?uhW1ungCX2TQ/K28+OK2qqoLaaPbFMsM6Oj3sT6sSFu7Xl4i138sqVBTWSXF?=
 =?us-ascii?Q?kMxQlhIK+vTdBu589zMp7p71htMk+hMThWouN8uBeOIYFD1qKQ15x4Jr1waA?=
 =?us-ascii?Q?OL0ORH/2EcRI31KmDvQEK2HQLv5O5hPH3p8rlOOvR+TPD605CHcIQ7bz3ZaF?=
 =?us-ascii?Q?l06oEq7Ft9mKTgaoqGnSFxVs7/iAM6SI9VxzglNu+h9Lvz4dQJjEHjsQCLbb?=
 =?us-ascii?Q?ieSG82Vy9+rEg+NSvhrMhCmApp+cAab2fQZmCz4DMJZ8dPO1WI+4pag+vjql?=
 =?us-ascii?Q?eLIf1MFbaA0NZGYkv7+oLApNybvjerbLE6cx3mZ8jcWbCOa/wWI994HgwUH8?=
 =?us-ascii?Q?RwQod18dLVSFxKqs2RENrlsTP2HCUS7FfJVCK+IBclHzLVd4wVLhHLyYYE6Z?=
 =?us-ascii?Q?Cq/ABGHdcNwhXgypC7+8uwfKzE1rzUqTmm3t6/Qvn4JIzLbEpTgpz+qA8EQO?=
 =?us-ascii?Q?xjvHQzdniSVOQUDSCdAlcAaQ34yM/teDhpEc+4kpPrnn9XW6Yq6zsSdoTYSy?=
 =?us-ascii?Q?vC+UxECUu1aORsKhZR46NW5n0qovap37CCt0hsgSWz2VYV6hZfxaIqXIY+a0?=
 =?us-ascii?Q?Phomf8dpsZMIgeP6M5OpFB4JCOzEDY/Nf2fbI635UNY52Vy9E+vsb1FEnRBl?=
 =?us-ascii?Q?fo8CQEX/aDRvjAyKOBw5uzVQR6KAyyFJTAopsrfP3GDGUdTe15icBHRmo//y?=
 =?us-ascii?Q?U9X5r4KEUyAZvEDviyLHZ9HYXR9xrGEAM/OvPbcBEJkT6Gh8SSxT9FDciZb7?=
 =?us-ascii?Q?I+EfPPI6pfWFIu4aexUBdIB4fzP63dK8DlNeFmJjx5l492aBoHgtLriFqBn+?=
 =?us-ascii?Q?x06vNlaqWzYS7ZEX/bBjLZ0yWBjo9+AJ0V2KqZol4UMMM2gJ3L0O7j2Uj5Hi?=
 =?us-ascii?Q?Qw9ny+7Da0To3jD3p0umYXpTBlU+qLarw6LI//LgNv1f?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(34070700014)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	eLllzZAXcGU3UYftsV/Ah8tl2OSaYTvPgsnznB5FrniP2eKOKGz1/hBqpabYGNYUKGuiJT/Ci++y1m5kS8CCt6BCo0/TZots2Un8OcpyMpEbAf80Sf8PZ9o8DeSycrHJ9zegbUQ+URGYxpUXHmjWzr1weJ4AAEpUzkJbsg+OdvQ5tcWd5vkbRcuKjuCuPHoKFHICkjvnoFdUBAONTSvrnLLMdnMc700oco5RzBzI71E21pEj0L0C++0ECNg2Vbh1NfoGt850KG8gClUhhNIMr6HW6txnstDjgHUFJfrFgIuYvrGW+byE8VKg149OyfXnOvyZ9WpCMqpT8PTEovmb3STCs8IUGKPeUhnjQSmOfa+kTp8wzkEZXZynCNJzcaN0H54B2a66u+5598N6y4XWPy9HGTHykxa8jwraQ5EuPhwfoZbL7tUUwjWxXDCTrIoe
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 22:44:45.1470
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85c05ef8-d3cb-45fc-1f0e-08de73f64eac
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003AEA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7217
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 24 Feb 2026 22:45:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17140

meta-arago / na / 20260224222205.1295569-1-reatmon

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
- Patch Series: [meta-arago][master][PATCH] iperf: Remove old recipe
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
-From: Denys Dmytriyenko <denys@ti.com>
- Date: Date: Tue, 24 Feb 2026 16:22:01 -0600
-Date: Tue, 26 Jun 2018 15:55:31 -0400
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: b7679394224afbacc6f12b96bc56904cf=
ad4bb5b

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-next
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: *: Remove unused patches
- Commit SHA: 8e69cf705bbec79cd7380d8ad829417918bf7253

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
ERROR: <build-dir>/sources/meta-virtualization/recipes-containers/container=
-registry/container-registry-populate.bb: QA Issue: task do_populate_regist=
ry has network enabled

ERROR: Signature change for container-registry-populate
   container-registry-populate:do_populate_registry: 5f870f449512f8d2a941ee=
7178597a9d42fd7cc0a71d471fc7a6937675d3aaa4 -> 31ca271d2d3b1974b453eeb903a7f=
7b5f4b7f66b14b40bfaf49882c4d86a69af
      bitbake-diffsigs --task container-registry-populate do_populate_regis=
try --signature 5f870f449512f8d2a941ee7178597a9d42fd7cc0a71d471fc7a6937675d=
3aaa4 31ca271d2d3b1974b453eeb903a7f7b5f4b7f66b14b40bfaf49882c4d86a69af
      NOTE: Reconnecting to bitbake server...
      Taint (by forced/invalidated task) changed from nostamp(uuid4):cef29c=
89-34c1-4c90-adb5-1a2747f6f2ec to nostamp(uuid4):909a2471-4c39-4ba5-a07c-a2=
dc7fdfe27f




