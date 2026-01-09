Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8413DD26D88
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 18:20:31 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.2])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16659.1767982829403375041
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 09 Jan 2026 10:20:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=h5A+1IJ2;
 spf=pass (domain: list.ti.com, ip: 52.101.62.2, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ppFGgZLGGnxtarbMv3GCw3u388Ys0CdfDK0ng5M31EPnvN4dRrFwYkSCnHG49qZO2YrRgKRw7Ppjn3d0KLn1ci41/SwoAizLJ1p+2TdTqIi3wSfccedQRCcxmsOe9bi6oFeELiuDFtYPzyUABZjplmR22CmnlhitCSvgxSxEvpzFNBcXzRnCaHcK2nDucyj061JucNTrsixGZpNrca68fzIiCTApsy+PSocWtqWDtEuhwO0zrA3zfwQ3d84o6Di6lBnYl2ypM5BzNjEVKIiTBbpRFkBiX6BAH92dc893wpFNwF6DCEwOrzW2jHXuwkUhXT0OSTCTVPvtTbw+tnFThQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5PBYA79o8GMBky/Tpy/RXEo3qS2vHpeFPINq85yyKqg=;
 b=vDe5SXzfmAcX508gOSj9dP/zB2r4JGauVR6xPJLnDoTamr/aAboDVxv1GjM2bLsW/687lU8ngqn0ZK0AU8dtaFq9ArrYA6dncOH02BZ/QSYDMFHGov04/QAIFGfKfWRL4jxIhMzGGV1DSsqVUlAnT4UD+jlQmmPUzXYsgXq54JvH0homPK7PVlaL+XEk7VNXyRoDQOQyZya4hj6gmkTsDFXhACBmvdrLk0J57JLKb+in53yiO6ftUgAaymcoao2YwC/rc7W7IVuslQVyjSGLlLw7L+TFPU/z0vIwUT5hZ57U/289OX34+/ijpCww368CMz35YyQyMEQdg2QcMMsbgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5PBYA79o8GMBky/Tpy/RXEo3qS2vHpeFPINq85yyKqg=;
 b=h5A+1IJ2VWMn43lwM8bfj8YKUrsrZzA71uuB0g4+ZRCjQExQ+CbfAZlyfs1Q9jKo2Q6IwtaSdLuiy2uGm0IMAAhsO84Fn6YTSogwnRrjXOYRDqG62NfXt1MQlipKzu+bJta1knGuYZw+s5BWw7/smTNZRt9vgO7VrXoZfbd2rtODA07btCxjJfZaFAVieVC91hX2Xt8311C2dsamCmpF0ntrrNtHdIckWNY0rbz7p+YGNb04ZhdGg/5ha5l5FbRsJPMg4ngbLzXdjewDIR82Iox4l4viihRj7GPbMacYQxcxjTLOU5Shi/e+J+y4/H0e1svqtMEWhlXGYi7tgq8dlw==
Received: from BL1PR13CA0342.namprd13.prod.outlook.com (2603:10b6:208:2c6::17)
 by IA4PR10MB8710.namprd10.prod.outlook.com (2603:10b6:208:569::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.5; Fri, 9 Jan
 2026 18:20:27 +0000
Received: from BL6PEPF0001AB76.namprd02.prod.outlook.com
 (2603:10b6:208:2c6:cafe::e9) by BL1PR13CA0342.outlook.office365.com
 (2603:10b6:208:2c6::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.2 via Frontend Transport; Fri, 9
 Jan 2026 18:20:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL6PEPF0001AB76.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 18:20:27 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 9 Jan
 2026 12:20:23 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 9 Jan
 2026 12:20:23 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 9 Jan 2026 12:20:23 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 609IKNZF2283507;
	Fri, 9 Jan 2026 12:20:23 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 4FCD79ACF4; Fri,  9 Jan 2026 12:20:23 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] conf: Add support for bsp-ti-6_18 to ti-core-initramfs
Date: Fri, 9 Jan 2026 12:20:23 -0600
Message-ID: <20260109182023.3927951-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260109181718.2757186-1-reatmon@ti.com>
References: <20260109181718.2757186-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB76:EE_|IA4PR10MB8710:EE_
X-MS-Office365-Filtering-Correlation-Id: e40443b4-758e-4c5e-3574-08de4fabc384
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|34020700016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?jPpttJEPL6WAdmlsKOL5SFpmG/XBt6MipOpfvXGC3yq+NxNsPVj5BSbl+yBC?=
 =?us-ascii?Q?5AVLp4wceSfNcOGIQ03yjwuOMFDs5RrB6w+ZA4G2yzw7Qlagq5ROdGwTG/fb?=
 =?us-ascii?Q?qKgnZV2t+f3cvG2Lfa2xVZtDhERtPcIKNbtTAtymp2ZUJu0sCnatDHKvbH/+?=
 =?us-ascii?Q?rO5UkIx0CMiTdrNftGM5XXbagez3jbf27EYqzcQMzklLawg/00/r6JPP+SmS?=
 =?us-ascii?Q?6/FllzZlrbgemRrSli0QSSY+3bjtx2JEOpuXk0+RUc7+8X37NofhaCrgzOT6?=
 =?us-ascii?Q?5V2i0sQVoC3Svo1fpQaUVUtV2WqbHhZBUCSqxGpEJgbzsg55fKuiZc7moZiR?=
 =?us-ascii?Q?HeEU4dTJjkoXZfNu4iSr40ZPSjkjzhPChnzCA8/iEJ//U9SeXQmTrkakAslX?=
 =?us-ascii?Q?AbN89b7oG4IWVCC/BcdaMktafWibtWzAhs77aASFPjOSTR1jjNRciJID7clb?=
 =?us-ascii?Q?B+FFtadOr79qYPuKMi7GlFvPjhfYVv9/yLywPjUgEhDTm7fis8TjKNagehzU?=
 =?us-ascii?Q?4ONcgXyM9zKZDH4V64PdYVnwtBYVkIsucHLkI8RPhn5IuQlFpzkcm+QAM/Sf?=
 =?us-ascii?Q?HuZbM+NKcdzFgg4QSWzrZHc39Yb9txJEFXvB+IH9ReU+1vMQZJzwMiDIscRj?=
 =?us-ascii?Q?Hz6wQqN0B00s1oMzLmgELTOuIIYhEvDkZELqaAvIDQYzfrl7w/QpZiKr0not?=
 =?us-ascii?Q?mzwNq3o7f1Beud9Yb08xusPnbXWQokuuB5v3pSjn95PMeW10hLpyaHYWwR5/?=
 =?us-ascii?Q?G6x8zVDipvnujbXun+SRuzDiQsarpH6ZPDSKU4obnc6nkf51aOQ6+ujArcRC?=
 =?us-ascii?Q?5VGYSBCiHLDr0B4+fpmEKEPVi+rXCP72oMDNrNPYIoNdtUw333r+2sV+1ntt?=
 =?us-ascii?Q?5fT81tU1y2g0zOp/sm2QqD1bCrMEO0WFheaKGYeK8u9CwSF/kP85SVDsMGzG?=
 =?us-ascii?Q?VdYbSq42MMgF8n8Xu/E+ZK2kJTAY3un0BPxXh7J6E9nX+8D86lDHWGWzr4yi?=
 =?us-ascii?Q?JyQYGE+lVA6zDn5ugtV18gXgLQz26hEUpp+hvFoKwFbwLGitmjlv9J5/Fjp5?=
 =?us-ascii?Q?yiKtcVo6HKQpK55UMR3dsmRdnR497Dmv0LXYtE++cNhrZtagZ2Oo3L85s4uS?=
 =?us-ascii?Q?BvMKp2F7SFRxmnQlFIKepa4YSaX7A/IniveU05kAMTlivO0khLlJb/8qXZ3D?=
 =?us-ascii?Q?k4E+FeCy7pXquP0GO0pm0SqLDAs6lvKsVKVs1C81WA6xjlNtVj7SMSwLZMlC?=
 =?us-ascii?Q?9L/AYMYWGnsDK/iHHl8yhaLBG4XQkGImDdd9xU2DQciw/7F4O94m34HbgTX0?=
 =?us-ascii?Q?WKt5cCA8KGklZDhS21QvtMfbGa9OaeRTnXvyuQQpu5reUhO37dlocIps7+T7?=
 =?us-ascii?Q?k16veJ261HmodKEaVwt4LivarXNNM+pLeu+P7MZMyQfCtfQLjscWG0nrXjQp?=
 =?us-ascii?Q?Zu3TFnOIFY+8jXieWIGb3CAKhI4SIwGFlWbFiyonj8xnTrTi/wWYVjG8c7MZ?=
 =?us-ascii?Q?dcRG2gwocme1pCYpPENZ8EkVIrvQvMwgw3Ts7Q2IgN/X60lZBzhT0zNDcOAT?=
 =?us-ascii?Q?QrCq1xtaLqcp10KiKqI=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(34020700016)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 18:20:27.0133
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e40443b4-758e-4c5e-3574-08de4fabc384
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB76.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8710
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 09 Jan 2026 18:20:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16942

meta-arago / na / 20260109181718.2757186-1-reatmon

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
WARN - [meta-arago][master][PATCH] conf: Add support for bsp-ti-6_18 to ti-=
core-initramfs
    WARN: Commit message does not include file/recipe name: conf: Add suppo=
rt for bsp-ti-6_18 to ti-core-initramfs. (COMMIT-MESSAGE-2)
        patch
   =20
    WARN: Commit message should not include directory path to recipe: conf:=
 Add support for bsp-ti-6_18 to ti-core-initramfs.
              conf (COMMIT-MESSAGE-3)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][master][PATCH] conf: Add support for bsp-ti-6_=
18 to ti-core-initramfs
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Fri, 9 Jan 2026 12:17:18 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: c9a61735f15a3493a8f81eff85bd8d269=
05d7777

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: libdrm: Remove upstreamed patch
- Commit SHA: 8c190b1e4f6a53ea641ba9d6150ef873f561c706

Patches
----------------------------------------
FAIL - [meta-arago][master][PATCH] conf: Add support for bsp-ti-6_18 to ti-=
core-initramfs
    error: meta-ti-bsp/conf/machine/include/am62axx.inc: does not exist in =
index
    error: meta-ti-bsp/conf/machine/include/j721e.inc: does not exist in in=
dex
    error: meta-ti-bsp/conf/machine/include/j784s4.inc: does not exist in i=
ndex
    Applying: conf: Add support for bsp-ti-6_18 to ti-core-initramfs
    Patch failed at 0001 conf: Add support for bsp-ti-6_18 to ti-core-initr=
amfs




