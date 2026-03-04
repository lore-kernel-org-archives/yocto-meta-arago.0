Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AE34EB7ED9
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 12:35:35 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.58])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17092.1772627729034536003
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 04 Mar 2026 04:35:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=YqEWyjQk;
 spf=pass (domain: list.ti.com, ip: 52.101.52.58, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YwI5OPvXagxdlTCiQLHznLUQheSN4f5m8VlF+ZZpIAaatfMRHBQkZcvN1U42n4cX7pB4yeXI6W5MYI2YmZRH5ZO/LC22qDrKN+Rkj9nSiDoBUGuZ+QmTBAyrQPFEQUAJln76HYsayYFIqmK7ue90PGiUW1dOJPoA7vuJciAQ6MJwSebMuMQEIL5l15rGqq2jU+NEYbGzE+tvK7fyDcHV/4XyAXDSRk3ox1t1reugQlqadl8j8TFQJ+morBbwNWpTcqEA8Dosz0RATCc90ewG0iUtw5GPp3xy6aTeRYtghy2yfv6Ph+/vXuSn1pOK4+J4ibGc+Jkv5eOXPEyJFPTW8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lcrrvPQXkt0S3w8Mw6IbmBPGmH2nLUwb+BwCP1cENFE=;
 b=B0lcrdk76z/WfHWPRXmwNQEZ+ZCYgCM4eaCyg7ZtThCM9UN3I/HSNzj+IxXfXU5A5zllzgWfIKjTh/w3Sfh5Kxg5RseVo9msfdp1ZJqmRLOKuKev0Ij+CPnRjQAy59gPSnEQil6htD+T+INnGZu5GHcw0DgQObcv0c/OvWEVAJgkFNGzNiMMcmghkpgSYr+ZPtLGBkqHtcyrlY0KFBiQ1jbJITnbBR89SZiG1+z1ay5pdVLvFpVZZoCJVZB4+V2sUUERKPAtIm9145v/Uw5IVYxbszeCVS1u/ziYKY81bvU9y33EdKejLVAWLnJMUWbArgAk2zzX/+hdu/INBNtCgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lcrrvPQXkt0S3w8Mw6IbmBPGmH2nLUwb+BwCP1cENFE=;
 b=YqEWyjQkYrKyzTUBdJ6WUbEmuQghNaY8kKk/mXu1af6RbOdE9rIiq81tXSOHRWR8qSH8vwz1xU80bPWO/CUzDHDefNutjP/jI5HSx+Pm1Flul0+Xj3nKfnhpAnpmd1f/KOTRSTNziR+9RIOQ3PC8rUUxW3kmlTnEa2warh95R24WnjzBQk6w7efLXp3h0WXHHvOi5cSAlKIwbk6kyDxS8irI9C688GSQnkrrXDtdbqbOd3mzHkqshhS2Ir4fQvFC47zYGc8cjWu1m/dRRqFy6kZCrXwJZGFvvbBkL7hWL8ys85If+fj2LclMb6n0uc0Ns7CxHcrc/WY0UReNJwdZtg==
Received: from BN0PR02CA0005.namprd02.prod.outlook.com (2603:10b6:408:e4::10)
 by LV3PR10MB7747.namprd10.prod.outlook.com (2603:10b6:408:1b0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 12:35:27 +0000
Received: from BN3PEPF0000B06D.namprd21.prod.outlook.com
 (2603:10b6:408:e4:cafe::5b) by BN0PR02CA0005.outlook.office365.com
 (2603:10b6:408:e4::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Wed,
 4 Mar 2026 12:35:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B06D.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.0 via Frontend Transport; Wed, 4 Mar 2026 12:35:25 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Mar
 2026 06:35:23 -0600
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Mar
 2026 06:35:22 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 4 Mar 2026 06:35:22 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 624CZMG7361023;
	Wed, 4 Mar 2026 06:35:22 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id B64BD142E1F; Wed,  4 Mar 2026 06:35:22 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Pratham Deshmukh <p-deshmukh@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <afd@ti.com>, <c-shilwant@ti.com>,
	<denys@ti.com>, <v-singh1@ti.com>, <khasim@ti.com>
Subject: Re: [meta-arago][master][PATCH 0/4] Migrate GP AI Stacks
Date: Wed, 4 Mar 2026 06:35:22 -0600
Message-ID: <20260304123522.3620841-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260304123221.1450993-1-p-deshmukh@ti.com>
References: <20260304123221.1450993-1-p-deshmukh@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06D:EE_|LV3PR10MB7747:EE_
X-MS-Office365-Filtering-Correlation-Id: 70a3e7ef-0ca5-44db-78f0-08de79ea82d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|34020700016|36860700016;
X-Microsoft-Antispam-Message-Info: 
	lnqOqTL7cYh2aLDE3eI2m0mKO8CPeBrNtExKcoUsntMHugrCjeA6K7GQMwQv7nf6ldKVegYaq4IIwiTfJO9lnDt6THhK8MKI21K7sryHsWu6/TrDyEWfIxNQTjxRhnAboZj6Usv7dQwUBV0R4nK5q5PHf5MXiyUMhLJyRHPbxgTMOnNZdKXmWb9qsiEsfxoUPHGliDbu1rRAq5fAeZyGZ1CxQc6JHGA5Rltq7KxLyatV7vB4Wr7G2Lda5P3x+1pOyEWZKV+IcMw8dQkE0Q+yPal7RCl5ANBeVaIEhFCtmFfToV0RI3+3xIcCvD6Fe6OxuuxIuXHdN5/Ixz3mp8JTQlaNqe+eB/1EG1hP9b3ncMAfDSkMwGyo4sgZz9PTW/GpjNNbXPgsTApabzbHRPBR/m5rz3DfO8TWRa/825RXUCGrrqxsTatjwzr64ZssIgiN1QyInzC+4XjIFf37Mz6itdq2Bfw/lbfpPGyeuzfw+q3ULrVJNtgiOshEtZIkU+MoFGkwhJfzZ3ssYrJHoGDpN9oIYZNq+PMMHDq7yoyK/IiTMz67s/zDd3AXPJL91vHoci1bJzCOiKifjHFZy6XQ2lATWcV3VUH6XAqCPEnM20bWJPhPr7KSDW9a7iODDRFfHwQmhP3sl+QzqaiSGEG1f9wz4MHYrFu1Bgv1NWQA+MhDTLjVdTkuFmcy4DuIU7pL8ebUONm5FX0lr2441r+HR6wdTo2sH9ORTeAMAC++vNVHDh+ZzMVkL1wh+W4k52029D3h2cMk4L1dgF9NA6K6ag==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(34020700016)(36860700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	tnoBAfOpQO6JlYu+qDAOvfZo+OGIikt9NWpifXKzyFTucK2EfBjI3bap2XJFJ+xYJn4Zfhz6pSu6nok9ttPKmSrtLp2wUe/O6XsW/wJsTXlsCGUIeLTaxJF5bCVRl/bSTrXY8OTlYHdUEUyrJbS3FAvhoe756ntnhPWKJ4Ka3P/kXhui+tQEMfy4HukNU7qxpFNWVbaVEEJtV2LF5vu50+64Qc+2/PXAdEkRJTKwTk/5Bzc17oZkj8VxopYsUSKaVRt1rtk+KfDNID70x9FHlCatzxhP3VyhYaPNBg9Y/YzslDd9ORljlsoyFtjhdOUQhFqFgkXxpIJZ5GjxsUvAPvA3m1vlrCH1Vw7oo4QzT8WnhpnmiKNHTdCklo3QOQZXHE94DVj/U5oaso4mji1gkVX/AhP2mmtusYkSqbLee57+nmHgHgSDpT+sviKgSVfQ
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 12:35:25.6333
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70a3e7ef-0ca5-44db-78f0-08de79ea82d4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B06D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7747
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 04 Mar 2026 12:35:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17217

meta-arago / na / 20260304123221.1450993-1-p-deshmukh

PRC Results: FAIL

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
FAIL - [meta-arago][master][PATCH 1/4] arm-compute-library: upgrade 24.12 -=
> 52.07
    ERROR: Missing License-Update for change in LIC_FILES_CHKSUM. (LICENSE-=
UPDATE-1)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887




