Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C983D4662E
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 21:29:01 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.40])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1279.1768512531873944035
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 15 Jan 2026 13:28:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=DyaWBRkO;
 spf=pass (domain: list.ti.com, ip: 52.101.56.40, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DFhy/x8OikmvfhSWKcVEmo8eZe9AWYXTOb3BjVmQpCdwZF5C4fNZEzgGAaZrEwpqY/MRkjyj2KyRDs36mfgAr+ppCGdV+0F2Pw/FIWPSSXNfw6Kes7yLT1G1zz054t2GoMtgZ9pkhv5qlGo8zRIxjTPld+i1lQHLbMPK+Oy4YhrTcorxWRM2Ardx0AAl2eqDqGG8zTKKlOPtBfNuuFDs/XGUR0MQevgvaL9iusBSRzNyNyfDdYVWD7Gqnjg/5Zlytejuvd5vmDl2sVpZJr9M7TDyWRBfPeWmaDb46CjHa2N/CkTd1fF8DZ2jnQhim3uzxyGgfAzI3FDrelK45Jnlxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GAcJMOJU1/FKJzIkDwK+h9APW75wPPYqqTxzKIfNf0M=;
 b=KyETRgFpJKg+xDansOvFGFOjQBHRviqiQ2apbhA6QT0cdFjfazryE1lT3WhC5CknBG1LilRx/k1OpdzA3fhqjRlZLtPtQyU4cbYhyKhZlXOEr/swdDYaBzSz1XQk/yDsMX87Z0Vy707OaAltghDf/aYJuGsVQL3Z5XQx9ifhoE0xgN52v+BZ4mPc03NBRjiMzqKAyCigmsIvoXRaR/GH2OyzugV4VFl+bCRKjNFjZkLQgHkioHLxpeiI2hFbX2aGdxPTJTGTSWMaVeddD+I/HWnMRpUKdYMv2ScCWbXDagFQnS8bceiX5rQn7/HIqa47gkjAjk7ZlhZMr/gkQ2TGGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GAcJMOJU1/FKJzIkDwK+h9APW75wPPYqqTxzKIfNf0M=;
 b=DyaWBRkOSE++7X/rEsW+ykTF/YTQj3JmM9VHXOo2tHF8KAAj4d6potdcPHTP55mbMyMSvk9qK7jPmzdYXFRKHeu9Md/rtYhLzOAG3ctIFL2Bb+PY3gv8vVTvjd7znAzenFeVepNiRP4owXImPDvqZzmvrhsZ0U0HmeiOTf2+b0VNXIF6t3HKn9jQV69G323CssN3k0tvwE/eS/dQevWumBHjCjrr8Jx/HUsxBYfToFqEVtM91hdP2Rff8+wHhyHDkZ2aibSz4Unlfjk9rC755GPS/1FwlmMFhYmFBFBDQqfiZWptqVGwp6P9uUAGO4xGAs+S29BWQR8QuPGs6ZMI4A==
Received: from SA1P222CA0083.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:35e::21)
 by SJ0PR10MB4640.namprd10.prod.outlook.com (2603:10b6:a03:2af::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 21:28:48 +0000
Received: from SA2PEPF00003AE5.namprd02.prod.outlook.com
 (2603:10b6:806:35e:cafe::2e) by SA1P222CA0083.outlook.office365.com
 (2603:10b6:806:35e::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.7 via Frontend Transport; Thu,
 15 Jan 2026 21:28:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SA2PEPF00003AE5.mail.protection.outlook.com (10.167.248.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 15 Jan 2026 21:28:46 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 15 Jan
 2026 15:28:44 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 15 Jan
 2026 15:28:44 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 15 Jan 2026 15:28:44 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60FLSiCK260389;
	Thu, 15 Jan 2026 15:28:44 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 89C202A53; Thu, 15 Jan 2026 15:28:44 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH v2] packagegroup-arago-console: Fix package name for alsa-utils-amidi
Date: Thu, 15 Jan 2026 15:28:44 -0600
Message-ID: <20260115212844.3670189-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260115210259.3812548-1-reatmon@ti.com>
References: <20260115210259.3812548-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE5:EE_|SJ0PR10MB4640:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d645992-9433-42f2-d23a-08de547d1140
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|34020700016|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?eIthDqnq0YTpu5YtwgufON4KUAjATTJc1CtWX4APhGBNpTU1I+JrM1ZKfqyB?=
 =?us-ascii?Q?2uYnAVAC2bo1Yo5AxOW7fVDIF3EXEklBmcpzdhdeuJVBwcvJPaQbUlyfO3XX?=
 =?us-ascii?Q?eXqR3AQAsBhqpz6MfEeqvjXJms+0ZRIcMd7KrRNTRLtWfcqfpJJPCJ9Lr9ha?=
 =?us-ascii?Q?jydrZHw1TcY7gUVALhwmA/ant85GbyrDnQ8W9KWr4cmRCZp6ucLt+YZ1JjCt?=
 =?us-ascii?Q?Buc2o02rk7RHMPEVCcm4iRdLQ6CJlZWsD1Oxm12Z+/Y66sDkMKCzetEhdeRb?=
 =?us-ascii?Q?Pl0HNQJ3Wf2vwX2TrPBCeH+V9Gdqkd5VHgql6C69ma+YjuK81GJDhIJEp0ZE?=
 =?us-ascii?Q?kn2Q7hB2QklmcO+PQre5GdGGPmzHnAzJB+esFQPiAcsvfal5W719DX5AOf73?=
 =?us-ascii?Q?1bcqIDPwEnWHV5pQvxdI6+ay7kBbs0pNIa4Tf8xpuyhnRzoFbTUtPdnB1BSV?=
 =?us-ascii?Q?9RfNTgeWutO1yXMpdahgLgnN8HG1I80p3cTPx7EXZWC1IEIBB40NslBa1XUI?=
 =?us-ascii?Q?7c9TCJUSPv277yYffhUtEtOT23WKiChxNiNXNyr50kh2/8cAOY6vxOeqKuZp?=
 =?us-ascii?Q?C5V8lrRBneJWeD3j+fcwHbb5p5GyZrifNO+fMJnzgdd384Ejl7VtXtgY/Atp?=
 =?us-ascii?Q?lF2ePBe2aG54xE5ybbn0+h5ghhewzNih4X4P2LkHVDW2uMYTkhRjCwsoG8oc?=
 =?us-ascii?Q?dLPt/8drN1IipKNhIIZ0qLPyNUz/cdU3iKUnBs+bZZYch4Huq1y07dF50aLo?=
 =?us-ascii?Q?MHkwaitXCL3V5vqiz6F5jJYo50qmufcTfHzlOamfmcHQdbJWn2ZESDNzBej8?=
 =?us-ascii?Q?O5ab6qM7c14Vzq+DnLyi8akRVx9uOpbqARgpNt4Wa1ghokSYHewk9UVeLhTo?=
 =?us-ascii?Q?gn7scXyn2KBzbo3yBVtaNCoKsmPdQBHUaKUGqc26bNdqN+5m4rSORS3D9h9a?=
 =?us-ascii?Q?k/Cp2Uq22qbT3DjpzrpvTrNXbNMgJwlctbxfN6R+VIB0Gx1Lo8w4xJrUcFVb?=
 =?us-ascii?Q?ft3ObNGeWNw/Kvq9ok1gFVWR/0LHkQpl7YnpLlQUa1AGuMtwn8fCkTbz7l1B?=
 =?us-ascii?Q?QnCkOg8mKfQDXMdQ3zLsX1vn5618+2nrLpn3K2fCMNATV1th2e68x8L/hcWn?=
 =?us-ascii?Q?18EKv6mPANWZWA6VriPxaaqNeldzTznfgIdqjSwKZQ9XEEA475OafMMuRzqN?=
 =?us-ascii?Q?03CEhuRzQ4dCmf6vBBQwmJgwsYkmNLzKT5i9tdI0nuMsMF5+mCLHeRh0KGZr?=
 =?us-ascii?Q?/Z1ra3qwmrx8kfNmF+0JpxhlggoMhkskSlE+TyGyTw16YejCm1NWRvYP3QEI?=
 =?us-ascii?Q?jKFwSUEbQ9UJLbVtBjeU33wtGxS51xo9v/WYGkq/g1A80abnQGbIUFCrEpKh?=
 =?us-ascii?Q?XL6jgx7i1pffutVsJNyUDjRF1R+D1K8fsKBdL2f0oqw5aS3abBpbkcOibeQL?=
 =?us-ascii?Q?8afBaPQpxgEUeCO3S1lpTsIS7IUaJztJA7cbz6lVgoZoVj2Uzq2PKrReso92?=
 =?us-ascii?Q?SSuAFDfK0Wh3N9R4vGy2sn0s9mmj+ghfvWTJZCVoS05FaU+KPEwuj96QcLGe?=
 =?us-ascii?Q?2Bywp677pMP+YGRTOvySuQEVIm52XCudsqiUUr2GMsXpr5a76rITaNy7K7xl?=
 =?us-ascii?Q?8MDWG6nyqkj+Ff4r916NKYuSgJ0hmjByjxPtYvSKYjYh?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(34020700016)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 21:28:46.9576
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d645992-9433-42f2-d23a-08de547d1140
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003AE5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4640
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 15 Jan 2026 21:29:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16959

meta-arago / na / 20260115210259.3812548-1-reatmon

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
- Patch Series: [meta-arago][master][PATCH v2] packagegroup-arago-console: =
Fix package name for alsa-utils-amidi
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Thu, 15 Jan 2026 15:02:59 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 002fb5d0fc266b271b5533e293c9022bd=
f1396bb

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: libdrm: Remove upstreamed patch
- Commit SHA: 8c190b1e4f6a53ea641ba9d6150ef873f561c706

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




