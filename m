Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D23ACCF9F8
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 16:10:37 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13372.1762359033696543896
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 05 Nov 2025 08:10:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=RNcOxa/M;
 spf=pass (domain: list.ti.com, ip: 40.93.198.28, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T3TgVkK7bzvH/medEK5kQHwJh/dbbYFfvDFc2/mPtFwtexh+gjJb9nw4aT0EBaUKeCIVKUjL5rHZtqMaIA0tYXkt9TuJR0mYC84Z62GyiAJ1XGPZ5+r0w9PLcxG8B1QEdSa/9uupoqqXhPAS/uXmirHhAsefXgradyeeu4wFBGcEJDCkmgT0v5pIobhPktfpYI2L7EHNtt2GQuTyBlN7jqbPosSxIQO5TtQYJanq16Z9758VySlISD1k4qbQsuPnqbv1gT/iMfY9jXF1y0JQE1Xbfj79GMCsZ7D95ceJEq/2oSilmkzf96r1l7jJR2ZsI7bonUZJ1CzNuAwsMLqVCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=InP/MAdECJ+pNU7k9zS0fI5A+o/D0hkVE38bx98V5gM=;
 b=upMmkQ1eb+TpixD3PgiNbCMwGYr/aGYWQEsPu85uyxGS10ZRD97m9LdWxue4b4oiR5eIHn6m0fBtXGIp/8Nr0B/CU4xHDW/V4M6lSIgXvHFXa6RnBTLcN+HJEVB91Qw94j7E2uhypq0MXqfeEKVHy5YvVlxwOmzyRN1+6k9RTVWNrZtO0jn/g8s9H95dVnkWL8VM5MlfAAemb28499GoCbC8cJ+jwfIdjTowwjqvWhIy9adadBITAwRRr9KVu0o0Pjog9SeR+kCNyj9+qjf1xpJKP4+EmCjHZJehvfwEMpy/CSLfOPAfSoA+lKJKPwkGWKMtax98Klj8am+6Om0NuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=InP/MAdECJ+pNU7k9zS0fI5A+o/D0hkVE38bx98V5gM=;
 b=RNcOxa/MA8P4NvU8d3TTI+klB7vt/FNrLaw/YD/sebcuHT5G2wBeAfRHmbTrVoUw6THRhYB6lfwxu4tST5P4XRYnFdMCwu1yYCiBaBywlbBK3m5XsKwjtmn7B7TPHdVcKU/LBT/2KjEGtekzzJbK8o/FLJJs3AHu9HknJ8EhLG9bROnhOL8IlUrJK0RgahY4NOkfpOaPieWTJ6hKvyuvfF6hPxOKtRmDc4+Nz9FNQA3t6R1j/TSIF8ano+afaZ3IAgnzjnFUGtUFD3jPk0yal0QRXQgz7gYguuzUN4erpWEiQ1XmgmPUuJOMuWwbsZDY6wMU29HQ7LBJpm9/i9g1Eg==
Received: from BL1PR13CA0409.namprd13.prod.outlook.com (2603:10b6:208:2c2::24)
 by CH0PR10MB4939.namprd10.prod.outlook.com (2603:10b6:610:c0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Wed, 5 Nov
 2025 16:10:29 +0000
Received: from MN1PEPF0000ECDB.namprd02.prod.outlook.com
 (2603:10b6:208:2c2:cafe::78) by BL1PR13CA0409.outlook.office365.com
 (2603:10b6:208:2c2::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.5 via Frontend Transport; Wed, 5
 Nov 2025 16:10:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MN1PEPF0000ECDB.mail.protection.outlook.com (10.167.242.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Wed, 5 Nov 2025 16:10:29 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 5 Nov
 2025 10:10:26 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 5 Nov
 2025 10:10:26 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 5 Nov 2025 10:10:26 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A5GAQJx106280;
	Wed, 5 Nov 2025 10:10:26 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 2E701D6F28; Wed,  5 Nov 2025 10:10:26 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH 1/3] offscreendemo: Add REQUIRED_DISTRO_FEATURES
Date: Wed, 5 Nov 2025 10:10:26 -0600
Message-ID: <20251105161026.658840-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251105160735.24123-1-reatmon@ti.com>
References: <20251105160735.24123-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDB:EE_|CH0PR10MB4939:EE_
X-MS-Office365-Filtering-Correlation-Id: d91af420-fc45-4f4c-040a-08de1c85d6d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|61400799027|82310400026|34020700016|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5LKThqc3vq+buCI2t4IwD2D0tYo/jKbEVlSADzoCgsm2xYtpXVl4T20IUsDT?=
 =?us-ascii?Q?DM7kKaRqisZ5BRQK56me6xJ30U/hUTdjlOLj9pGWVt8RTUE0zc1fbVtC4/lh?=
 =?us-ascii?Q?FAtHFF+MBIla6WwGK8KnIf/DnOODYrP1LuMmBwdvEEV2qayvCxQWBJJVBTPU?=
 =?us-ascii?Q?EXwBlP4GAfKLXCbxnI/L2pOzs7Oj0sKa24ysc+I2svkfnSVuMuxIoeL6/gjK?=
 =?us-ascii?Q?tplaxVA51ScN9iJvF71b95GnX8SQTuTOVdAwSxD2/VcStNANalkjW2K/E4UY?=
 =?us-ascii?Q?Mw6AdYXxJcbj1+2ovri3OY/iiMg5/ZBl/G2bpWxhJagQ+z2cYJSa0cxgDXKg?=
 =?us-ascii?Q?0Xcwbrj45VsmyEePNiex+WNVPMbQQO+305wtANTjERywbH/ysqJ22tCAhHgT?=
 =?us-ascii?Q?+7+46jRlNWajpn7chqhnRJOjkRbS8dP+Y1TdkIunhTeguZzxBbr+C/PPf9kv?=
 =?us-ascii?Q?W0JMaaLRIUh4N+uWbnPeoCBN224ctjjSwWVrMyrSfjXgSDb7s/Zox8vAsOdT?=
 =?us-ascii?Q?NCgtKUlEw/JG7MdfOyHHhAsqYCW9wrlXCbLhN/P1q1YojFVpn+sz7oornOTj?=
 =?us-ascii?Q?YSLIi+TZzokhb2a1FOE3O4zimDn6z7Ad1dineJa7QNzh9v31uBzrtm4EVvIo?=
 =?us-ascii?Q?X9N/KSzG+q7okNFcl8a7imz6WBWeW0jCh8NV2R8jKjZCm/MSsa7lQ/bR8MW4?=
 =?us-ascii?Q?2hNPynPNxqWaUG6v0HTf03C97FbRs7T2C3K+feGo2RVijNdqjtzvw/UoJnog?=
 =?us-ascii?Q?tng2RZTzlPXCTfNya3tfwCrgySnKIm3K9qgk76YNApcBA3TwwyiTg1MzanMu?=
 =?us-ascii?Q?i+SBYwJwNPW8QA3hZrkRx53UFy2CJp5tfVn1uaDo8wb6f9B7iV8wyt1HJyl0?=
 =?us-ascii?Q?qAeQwyYTOBpKfIlDXdGMF8TkQwjruTJjasawLWFVbiZ+XtWUkyZJMAn06TZN?=
 =?us-ascii?Q?y0+WiM7eLkgdggZ9SvnHRSK5FTr3mliYkaJKoQq3WgylL6a7VGEt4/qLQHQs?=
 =?us-ascii?Q?/AAVCaaMueUvTQ5w8TicAKeWmj4hBs8Uwc0mugh3e94KtKEW73oJ437QN2ss?=
 =?us-ascii?Q?pOFlHQCGrVDQL+9XxoxhVjxYYVDrWtbePnwSux6M8wR71EVD6l8Kpad0w5ht?=
 =?us-ascii?Q?IW2UxVYE/f2t/5XYtzxhmc2uoL/25wNHoRSWLLOBBCv5xNVZz5SN9noRbIcp?=
 =?us-ascii?Q?lhixWF4RFM8i2o4Jo07XgJqEqlNmF3Sv4bt1OLev41R1oWEf41GQ6Z2PIKe1?=
 =?us-ascii?Q?quy4bwEp0MLcRkW8IArkG/+eEZ2cnLJPZLJ/NoakgFYpByAQM5VTKic3Xbo3?=
 =?us-ascii?Q?LEQHjglmJaFOZTZgK7v41XVIkNemzhBuc9K1j+KakSOqcms0VN3lVB4bKlly?=
 =?us-ascii?Q?ZR5NDRTr5Av42tPRAsWArchpanBDM4jc3e4pgRK6BA2/NRGlBxKL3ErVwqPM?=
 =?us-ascii?Q?OJ91GCFD0wYftdl8WzCX8v/48F8UHB/Flep2oE0ccUzaLJl8yx89iy5CRH2o?=
 =?us-ascii?Q?KN8GHsr9bjJhBAI9phMSvo69IkL0FDKivs+GvYyOjqRjyDVtPW/mmOdnoBIt?=
 =?us-ascii?Q?EMcewAw0CiHIxEKYGpo=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(82310400026)(34020700016)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 16:10:29.3370
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d91af420-fc45-4f4c-040a-08de1c85d6d6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000ECDB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4939
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 05 Nov 2025 16:10:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16725

meta-arago / na / 20251105160735.24123-1-reatmon

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
WARN - [meta-arago][master][PATCH 3/3] packagegroup-arago-tisdk-graphics*: =
Add DISTRO_FEATURE check for some packages
    WARN: Commit message does not include file/recipe name: packagegroup-ar=
ago-tisdk-graphics*: Add DISTRO_FEATURE check for some packages. (COMMIT-ME=
SSAGE-2)
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
- Patch Series: [meta-arago][master][PATCH 1/3] offscreendemo: Add REQUIRED=
_DISTRO_FEATURES
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Wed, 5 Nov 2025 10:07:33 -0600
- Num Patches: 3
- Mailing List (public inbox) Commit SHA: e4098c6f1fc649a7d5923bb0e92507e87=
61ce9ad

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




