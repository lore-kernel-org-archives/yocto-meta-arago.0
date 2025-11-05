Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65D98CCFA19
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 15:50:27 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.20])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12787.1762357824878208912
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 05 Nov 2025 07:50:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=nt6d7XGz;
 spf=pass (domain: list.ti.com, ip: 52.101.52.20, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a19YCVmRoc1JXuOXxKWp7a7qfM5qVC4poNY//adBiwuDU86GAK2n+npkJLGC0nmnN+/brRPR+OtP9E5gpgCGe3YzpR4RJSZUViiXpdGTJP7Xf6aGeYuRAuasNrd9KTcd9lYy675VW+37aI2McnqzP1j1HVGNNjmr7nkzJY7wV3oFvi3/fNYTzBLlszQPmRvYExdXOeKylHr4dc8DNC1mDc8YBxC7l9L1m2wfy/kCMNr5DfdmM7bHSG6/7iAcHdvxEZIY6OkTcd9P3pgno79nrdVud4bzmGPqYnKip663t47ZakXcwQJYQU0ZdKJ3JlsmF003DdlqByOZF5eA0CX+5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zwaLmNutIS6Kg1alSQLnCPyCKhOUfj8sKpTJwVRppU0=;
 b=Rb1dJzZM0pTxfHgyMI3YeIrA5lip50er0LVi+lAnBG1L4QJU1ACw22UZrRzgQH7v9wZCw2r3+m29NiODGDi5AMVYJYmSop5/XLmcuBg3Ins/R4sYUnaRj/GJbDeWoktTTm4u5tUWnhlwfY3hi/OL6FIeoFOIJ+KGI6aF7j0LNUhgnhgdDJXQJfG0GSqJ3lYPyowhzpS9jng2ApL8lti9Q/qOtXUu0QFMDkMjjIOkA4lzAbAGoFuWADDbMuv8YYaXzxBOiB0eJRtJKsdDODpHz39IfZPfj6c/d2Xh0ZB2dmt2jsFCbFZu25wH/COwr8dWCyAxrBgjsBAA+ItWXoDmow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zwaLmNutIS6Kg1alSQLnCPyCKhOUfj8sKpTJwVRppU0=;
 b=nt6d7XGzLiE4/55DvZvV4CjwLjFIW2hfy1dcGPiXY/yt/KoRhIkolcEjCgNWpqYYlNy9gOvI7Fd3VQRWpsIxragh1cUK08wHULGGvFglxjMUvdqpBLd9WlhdB0spW0ROjrIdSG39ymHgqKv4iiQUMkEMzZQQpDtWnyOrbjv4dTkQxWyu+Ux0vtdMUTtTVTFJNQWu1NZeRrj2gBmAqVbLV/AYYtvzrFwhG/rs231OFwFTXRZ4oNhVslDUtJzoU/LVfDbb6JdVBy/fD3JT7RSt/bsJo+3Uz++VhWBCYmGHPOA2zeAdS3BWg5iMO8F6zhf9qICjFK4kMBjqI6KiOVwA9A==
Received: from BY1P220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::11)
 by DM4PR10MB6085.namprd10.prod.outlook.com (2603:10b6:8:bd::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.16; Wed, 5 Nov 2025 15:50:21 +0000
Received: from SJ1PEPF00002317.namprd03.prod.outlook.com
 (2603:10b6:a03:59d:cafe::7e) by BY1P220CA0011.outlook.office365.com
 (2603:10b6:a03:59d::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.9 via Frontend Transport; Wed, 5
 Nov 2025 15:50:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00002317.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Wed, 5 Nov 2025 15:50:21 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 5 Nov
 2025 09:50:20 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 5 Nov
 2025 09:50:20 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 5 Nov 2025 09:50:20 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A5FoKuE3904846;
	Wed, 5 Nov 2025 09:50:20 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 953D9142D3E; Wed,  5 Nov 2025 09:50:20 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] websocketd: Update to latest go build methodology
Date: Wed, 5 Nov 2025 09:50:20 -0600
Message-ID: <20251105155020.638722-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251105154719.22140-1-reatmon@ti.com>
References: <20251105154719.22140-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002317:EE_|DM4PR10MB6085:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bbfc500-10ec-42e2-8d0d-08de1c8306f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|61400799027|82310400026|376014|36860700013|34020700016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?cd0YeLdtyAYXNTYOnv3Jb1yhZs+e2PFrCYdnFGpmTuzrdygpL2UmcpeTmK2d?=
 =?us-ascii?Q?7dMrJ2F/JFnRSUWpuSl3bvdxNx1iRnfcOvMRHsUv0VsIA9juDOxJClyIlnio?=
 =?us-ascii?Q?uy2PCgTUnCcc5k3xvizHSN5FcW3LlS9wvIxz195iohoMDtTgFoVZn26vOENE?=
 =?us-ascii?Q?l3I4JWRDc5tRgV8+vHD/wtIJ50BMD9jHFZrCzvVW3ev7yQcAdel6iB7AM6yR?=
 =?us-ascii?Q?kPzWHFFEIxlqa+eoKZU4sXJVqaW9D/x9uSeUFh+duw5CqMEvexZXFSBdwy79?=
 =?us-ascii?Q?Fl1RX4n6H45ddQ2CoLeOckvhEzjtHpGSpB2NhdNI1CtklS7H2ddb6afiOdft?=
 =?us-ascii?Q?8al/fJs5J/BkdzJcN59esLmikjRjhmrIAz6ZZ6oNWJWBiXRQAuF9NqZnrgrG?=
 =?us-ascii?Q?9OvOW3h1oWGcxTHksxtzUaeqX7sSLMGlJWsKNWbLm/NTBsTVWL/tW/WWFRBE?=
 =?us-ascii?Q?sQly2V0ckE8tZ1o+3BE6Xk+p9nJZ+ly3V4mtZdpo+o4pOexulzdGXJ1zy7DE?=
 =?us-ascii?Q?Fk0Ymq5sH0x9eANwd8TWBb0+TTge6tdxQs+NPCTW9gZLPu7CVltuhjo10o8b?=
 =?us-ascii?Q?5yM7FSMthnDKuuu3sBaIQRRx2nv47vM4JWRJTrYcXBNyJJ/XX8yysiiFzy9p?=
 =?us-ascii?Q?86K0II0nKVoQ7AJXPnst0lQkqNcVem9vN8t0BGhLBxj2psyMhbwjAYlPHvp2?=
 =?us-ascii?Q?YJtobcqm4mhfRFHhJ9cB8JfziJS/6GUAZlw8uZHHN7MfaLFxRe6CG8Pjzo94?=
 =?us-ascii?Q?mARCYct1P4uBlhk9y+kYI/gTZJSxjOkq1oFYC6tkvhwJxsSaCUsPCzxqxAWy?=
 =?us-ascii?Q?lnPNGYVkUrcnp0KNKvDxZxqXXPuw7n3kMR/WVKiHSKm6DPrYd75aqIwXzlTf?=
 =?us-ascii?Q?0GnySU9ghZbB202qFi/JE1sfXR0kFK1auEFsfeBInKWD91+4Xg2aFjSyulMZ?=
 =?us-ascii?Q?SHIhQnuWDodDxSDBfoTlbl6lR5zrxdI5YoEo5g7sOFdak+xcpBgyo2fOR5O1?=
 =?us-ascii?Q?X/WwIIINIPzHiKV6FJwPpGvMynPQj79K+Q3UHW3k1/z40t0FdcjuLUwXrSL+?=
 =?us-ascii?Q?bJmz3Af9uP9PsWiKLI5AZhz0PpyzdGazvWDnQ3Zm3c4fdOWMvWMbTcjab/ex?=
 =?us-ascii?Q?1SA3faIByMxGwzZ7F4pKK0Ylk624T/P0QTKBT/cWSmjDiQ+1GsQlt0VKgMj5?=
 =?us-ascii?Q?+mNVrnbitFTdL+V76EFXSM8MvESgbhqdzj8yCDrULTJ0X4G+MhqLx7slJ1YW?=
 =?us-ascii?Q?4zr7ME6G20IDYSojB86szrINONNI5q44WiTLt/XIj+iZIzQAoSUZoW2DVhs/?=
 =?us-ascii?Q?eTxVJu5I2rz0j4qY3dxnNUvijJeZjK/ba8Gz4QQ5+kxOctI2i8ObCkM2/PEe?=
 =?us-ascii?Q?yCFaeSox8T0qZhGcSWpwa0sn31RTC4+ndkxkz36uq19tjAy2WmjEU69Y6HaE?=
 =?us-ascii?Q?0XjwXJa7Ey6u52vxeOgAVTDcYxczeOzCHBhuNjQacZhZV3zCfL4yMLuWPMlm?=
 =?us-ascii?Q?VuCt8quo10CQH5Lcpz9DNaQuCX0n4nm0KLS2rKFlVBCZdP+hS+I3AJzO64ir?=
 =?us-ascii?Q?2spfZPJYztIXaNb4s8I=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(36860700013)(34020700016);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 15:50:21.4988
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bbfc500-10ec-42e2-8d0d-08de1c8306f5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002317.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6085
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 05 Nov 2025 15:50:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16720

meta-arago / na / 20251105154719.22140-1-reatmon

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
WARN - [meta-arago][master][PATCH] websocketd: Update to latest go build me=
thodology
    WARN: Commit message should not include directory path to recipe: webso=
cketd: Update to latest go build methodology.
              websocketd: (COMMIT-MESSAGE-3)
        patch



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
- Patch Series: [meta-arago][master][PATCH] websocketd: Update to latest go=
 build methodology
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
+From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Wed, 5 Nov 2025 09:47:19 -0600
+Date: Tue, 4 Nov 2025 16:33:03 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: f477b716bcad2bafbccf7b3c3a0e54c2d=
b4f623f

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202510310100
- Commit SHA: e37362654298b1e94df1fc1bf86e1f02ffe5d2a2

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




