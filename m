Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD19CCEACEF
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 08:35:31 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5249.1763368527599428249
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 17 Nov 2025 00:35:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=k7Wtmpc5;
 spf=pass (domain: list.ti.com, ip: 40.93.194.29, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zUMtSUBiU2qEf3nJveW/WDM4v1FeBTP8smQacfybhox1mTwlvckHhRZLx2yAS+EYjHlahp68LtL++UWY/3MeaNKz2fCuMJ1S9zf1xSCmHPADe6p0q8PfmUFbhvwW8YqoApCHApswdrIcn/PGnO25L9VMDOwKFDU609IJg76h5QZZzRt/uLbrG+K1qRLhFViBEkDZMkqbtsY/HQtp2UY/W6H51akrSpysPWF5HgSXMM7BoqVV5v213Tb4pK8J8aYz/ktFqgKHhYgJWl8UDqpoggvW+tFnY8ZUIo4VMY/iBr7+ni/Szab5UNPjKd3fBM4XTVnUWlOy1pAw8Crx6nD7Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SD8kWZLoT4xselb42awBKhuuEHQrLaFd0KUc+WVXZ+Q=;
 b=DwCPCyHwcj2zMgFHRgyHRFZB+6lpm5JhGZp5S2YAe9L0UxF5usN1Cmc5if9XeiMfuA7wFNJo3v9AFfl76lhhY2A4w9JGCUhIPHinr8n1ZDH/6ozsgBVRywxwID3RZRgtleA40Z4al8qaxMOTyFapy1j4GEGM96wUYda9i3fEbOXPbNkMZWxWOmgcY895zDs9/G5APMePNmcgJv9OdcqZELPrv3C1jEN4H14v5AxltqNi1nWLLtPkjAumDgz5ixMvSYXcly1LFBAvbjsdKwDLqr5Wi+ojnCAmdBz+3T8Sx6P6IHsS+6MkLQYTVHvE31kRMMPQA513SypzyrFO3bDgXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SD8kWZLoT4xselb42awBKhuuEHQrLaFd0KUc+WVXZ+Q=;
 b=k7Wtmpc5is72DDvfEZKXNZWdnEr0CTf06h8S8M6gUIdlRoB7f/r+F0A7W7VWqtBKG0M5sG5TSL5ua0qim63341kzEqQIWr+T+QS6Zna0pSOJSlMBCLqhZQhG8BvY7mVcSOTBTN9Rxmu26Q4+RHVocnY/2jb9LvoRgky9Dn1qKc14IJ9hYMoqn4hQFBY9pMwcTNBh6vI+6EYlMl3bWvNYvCTaxEQJT4kcck1t9auePgBdI3461vnT30QmpWyJqkzyacNV2i1WYu5yQzFOxS7hjlSzJmGXIjvHlBvG1ZOMuHAG3IDGNzh6D1QS71CK+XPno/4H6kW9X8o202tmbbjl6g==
Received: from SA0PR11CA0153.namprd11.prod.outlook.com (2603:10b6:806:1bb::8)
 by MN6PR10MB8069.namprd10.prod.outlook.com (2603:10b6:208:4f9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.20; Mon, 17 Nov
 2025 08:35:24 +0000
Received: from SN1PEPF0002636D.namprd02.prod.outlook.com
 (2603:10b6:806:1bb:cafe::f0) by SA0PR11CA0153.outlook.office365.com
 (2603:10b6:806:1bb::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Mon,
 17 Nov 2025 08:35:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF0002636D.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Mon, 17 Nov 2025 08:35:22 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 02:35:21 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 02:35:21 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 17 Nov 2025 02:35:21 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AH8ZLXZ2182526;
	Mon, 17 Nov 2025 02:35:21 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 208BE142E22; Mon, 17 Nov 2025 02:35:21 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Suhaas Joshi <s-joshi@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>, "Shiva
 Tripathi" <s-tripathi1@ti.com>, Kamlesh Gudaseni <kamlesh@ti.com>, "Kavitha
 Malarvizhi" <k-malarvizhi@ti.com>
Subject: Re: [meta-arago][scarthgap/master][PATCH] meta-arago-distro: Add libp11 library
Date: Mon, 17 Nov 2025 02:35:21 -0600
Message-ID: <20251117083521.2394497-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251117081833.3718999-1-s-joshi@ti.com>
References: <20251117081833.3718999-1-s-joshi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636D:EE_|MN6PR10MB8069:EE_
X-MS-Office365-Filtering-Correlation-Id: 74d2ff03-b468-4a67-8510-08de25b43fbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?wct6G7BtmPcTiGH2kT/VhuKDQctwy8xHP2oDnsjBH37wV1N6EJbOPlK91MiC?=
 =?us-ascii?Q?NX0IL85VLlo4I4baEr2eixbfX+g91MPKIwIiyEofE66NK35oomfxdk32VmNV?=
 =?us-ascii?Q?nhwYYKDshMnSnPJf6DUgLm1s5+HoxL2QMzjVGT2SjRc1KGMTlwLM7sOz9X/c?=
 =?us-ascii?Q?dp/e88t8j3zYfL2YBN2hssECi3fwfudW4KS+ce/T/l8+IRu5cYWr0dBF6s4s?=
 =?us-ascii?Q?zZk5YWytYV+N5jPde0Xds3E59rt6Nkhl70JW17ZDzMA5a3U8C1lK8tC/ZaLB?=
 =?us-ascii?Q?bAW5V5A6WBBcGqIXduw6m/bODT0WkkZc/CIzDvlJsQSe0biihh7DmW8b6gGK?=
 =?us-ascii?Q?21KeVjtA9gQmiAEO6bkgrszIYbuGH0AQ++rMA7Ht4AzMlGFXchj4lQSKz4Ri?=
 =?us-ascii?Q?hzTxOCUmx+M+i9xDHEB7zSahYngTaa9yE5g1aodei25JkydFA1Br+MzUB8Su?=
 =?us-ascii?Q?/p7T1P1NcUbbGIEC0EyGymZd44LPhl7aC+yMWzE1QD11z81dUsqMgzcC6U3I?=
 =?us-ascii?Q?lYpbmdw+woRtLEYjIE6mBg9QqcREFleGHRhoEneUkjYSTZJ2TKMNHH/OO9VW?=
 =?us-ascii?Q?UXYHQZzNgleObO/4tmS5Bm5ncgdxkvv3fNWFhFagmL7PAGHd7SDEbG6ofuYd?=
 =?us-ascii?Q?9gJdnGoCmNkr7ki2ADYZ/HPbX1xOkB2EKAGFDNZt77RfsIEGFDTi1CKOw3gm?=
 =?us-ascii?Q?8qevIgA+SPIz0Y5YYF3m/BxRW+WDDf56Yo5GgwiEjpL5Uxh6GTCwdW812TIB?=
 =?us-ascii?Q?Eevw562OuLh5aOHtacUyqrMlT0yQGGlMBbT18ljEMRXj8vxrKOt6sKMjYv4F?=
 =?us-ascii?Q?Jv5tiqRX2J3gRY3fJofmmhFbanCkRRlEc2L9Ry2LwAvwJEeURgapx9ph55fI?=
 =?us-ascii?Q?A1/Pnc7QEgRfR0dXj8RLQnA5Gtx7kT1xJbJH1ZoQUUJioBJLSDx8Jid/J2pz?=
 =?us-ascii?Q?+zsCS+ojjpQzeDAGXWZ8iq/0u78t3YhOXozEBcXJMq4fFfA7BXTYsxKklF7g?=
 =?us-ascii?Q?HOCbZX/N6t6kWmuxzUG2uYzmbmo2aHRAXKUXLSWtpVbA+QoBHxX50FPXDOaZ?=
 =?us-ascii?Q?/K8nE68687fjxMVMER603a8iD6FicDwCm3C8jqW3j9QmoF5JY/jBxLPjNi87?=
 =?us-ascii?Q?7D3xr1AhZnsQdjUJd199mR4kQ4UYnjsXeQkaSbZFVYl6agaHBgD3G5j6J8S9?=
 =?us-ascii?Q?mn4iqFNDFB0vW9EkVQxMMI0ANxM+ktxT8gEXdimTEIYnvLUe9uDr1gemCpO4?=
 =?us-ascii?Q?Y7eBkw2Vth6T/zTBarmFN8tqFd5FeMtDC2zuN8ZMpgZbGk1kuQEnmRKPo3qW?=
 =?us-ascii?Q?y0w2KOCv+GCSe4eAdtiQttWX+F9adUHMtfMwSq0qZT0iORN8hXMrtROk59wJ?=
 =?us-ascii?Q?YhFuw3nQmoCzN0Ffzj1t0Ow4tMVPBJM8g06knpxD89e8IGVtceIabaTrxRvL?=
 =?us-ascii?Q?yOEpl0H1+keiuTlI3u54HIEqLgHAR5OFoSrNIwh+WyXZLczT5TzdO5RpokRH?=
 =?us-ascii?Q?0/KcOH9wcNFjyc6ea+yx3Pzxa1iSx0X5d6922QolzOuHxoGj/m7z/1eBpGfv?=
 =?us-ascii?Q?UCaPPZuLhXSEgvH5jkw=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(61400799027);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 08:35:22.6287
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74d2ff03-b468-4a67-8510-08de25b43fbf
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002636D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8069
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 17 Nov 2025 08:35:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16772

meta-arago / na / 20251117081833.3718999-1-s-joshi

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
WARN - [meta-arago][scarthgap/master][PATCH] meta-arago-distro: Add libp11 =
library
    WARN: Commit message does not include file/recipe name: meta-arago-dist=
ro: Add libp11 library. (COMMIT-MESSAGE-2)
        patch
   =20
    WARN: Commit message should not include directory path to recipe: meta-=
arago-distro: Add libp11 library.
              meta-arago-distro: (COMMIT-MESSAGE-3)
        patch



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
- Patch Series: [meta-arago][scarthgap/master][PATCH] meta-arago-distro: Ad=
d libp11 library
- Submitter: From: Suhaas Joshi <s-joshi@ti.com>
- Date: Date: Mon, 17 Nov 2025 13:48:33 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: a61c772dabcf4f5039effcd04bd8c549a=
62f23a0

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: v4l-utils: Do the version bump in a yocto-check-layer com=
pliant manner
- Commit SHA: 312752656aed73c1187d9d0cf5d246e5731965fe

Patches
----------------------------------------
All patches applied

master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][scarthgap/master][PATCH] meta-arago-distro: Ad=
d libp11 library
- Submitter: From: Suhaas Joshi <s-joshi@ti.com>
- Date: Date: Mon, 17 Nov 2025 13:48:33 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: a61c772dabcf4f5039effcd04bd8c549a=
62f23a0

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Randolph Sapp <rs@ti.com>
- Commit Subject: udev-aragoconf: aggregate generic udev rules
- Commit SHA: 157fe67589c1d5995a15b9c9902e440ac5a948c7

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

master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS




