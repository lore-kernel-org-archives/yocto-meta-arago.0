Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97FE5EEA866
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 22:07:37 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.61])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.57417.1770934049934688443
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 12 Feb 2026 14:07:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=UvFcsVyY;
 spf=pass (domain: list.ti.com, ip: 52.101.48.61, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=akU9awWwt/Swhifw7J2CIgSsaaHULD06FqhrwGdXrUVj91hjExV8ZB3zACINI4Ncx0bd+P3+2QY8bPzDtd+YcjbagsMJNjymKsASf4yj/eeswJ1Qqu+oGYuVJxK+lzWiIcSXlBz+nkifJ0RU19WMZgnRZB4GTOxZW3+hmqa2nsUZRLDchARl+MLEFPOWI0Fpwbz9MKxZ/PR2rniBv1S5btOYpzd3maak2wsLh/snbFHEEsAau2yXghkECUUsTCxBcovRad4JnegSKbN0bgGY2Am+NLighPiw3BXU8JndFioBa+5kjQwHfteoGHxjzsM97zUj38O8vSBxvz9sQPWDiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LRTiA71atNJTFoftWkGPEwOIK1y1Hiq4WyCzYdxPdO8=;
 b=HborDpfdzDekeop/WpbMAqxGRfK6ZG0mn+LRVnLdrE9R4KSCaGwm2iJtP+qz9oIoEPtv5IKws5LkElT4ojRX4V+p5u+RxdHRONXEbMBVhsz1vcNy2UPsr5Yk+uO+EN99rAG2DnZsrXO3rNGh3SWs8WJNtBXAbeBk0RUry1kXg+gbCBS0/5enYXExgJC3K5E6MeE3bb74ncXWXLWve72ZV3t7FjI7kXMAlxc5qKLzXKvT3WTvV3X994dR0rmM+cq7Cw3kQuscCmjcoPSKJDCHnuYJoYexdyj1BjG744dWuV+q4JNi8241SXGcXgvv/PklyUdaOdRAPVV/OZZM8jrjZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LRTiA71atNJTFoftWkGPEwOIK1y1Hiq4WyCzYdxPdO8=;
 b=UvFcsVyYi2MfvLEJdeHgRiC88uVmXd+xKr/nuzT33YvNbrbUn0nreieKvJEiqDDxnzFj14PU7uK+YLjCvM3Enh8L4IqtZSGwCNYMdZhloY4bYrRJVJaIhUSiUmOhgVGWBIw0d+ABlLfQagUHHxXI/TXaA1j6mr71yJBCGPgmNoFLTF+c7PGlLbtU1ICSWEA0bKjYccrUxXSS9BR/XoDjQdAeyzypqKVh49C4qY4YhyiC3i21FmDuAph6/CbO20YYvXF1rBTsAa9rNBjeKm6rTAtpo4jNvnMlxbjnDTHnAUyXXEp54v0F2y5Ubr+ds4eh1VFHgZyLJFg2G3FgbshnKA==
Received: from SJ0PR05CA0082.namprd05.prod.outlook.com (2603:10b6:a03:332::27)
 by SJ5PPFD020A49E6.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7d0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 22:07:27 +0000
Received: from CO1PEPF000044F4.namprd05.prod.outlook.com
 (2603:10b6:a03:332:cafe::10) by SJ0PR05CA0082.outlook.office365.com
 (2603:10b6:a03:332::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Thu,
 12 Feb 2026 22:07:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF000044F4.mail.protection.outlook.com (10.167.241.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Thu, 12 Feb 2026 22:07:26 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 16:07:25 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 16:07:25 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Feb 2026 16:07:25 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61CM7Pj13817199;
	Thu, 12 Feb 2026 16:07:25 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 7A8819ACF4; Thu, 12 Feb 2026 16:07:25 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][scarthgap][PATCH] ltp-ddt: Change branch to ti-ltp-ddt_20260212
Date: Thu, 12 Feb 2026 16:07:25 -0600
Message-ID: <20260212220725.262918-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260212214436.2828924-1-reatmon@ti.com>
References: <20260212214436.2828924-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F4:EE_|SJ5PPFD020A49E6:EE_
X-MS-Office365-Filtering-Correlation-Id: c141c30c-6be2-4395-65a8-08de6a831b5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?JnnQBNsE0hFEP1KShHU6lPviw5MTlPtbcUVSt+bESjjUAYdgJTwZlVPSRBfF?=
 =?us-ascii?Q?cbG55Uzm8dG/ftRH/ZGg+eKtNi+0oIzRIE/vRZdN11w7otcZqQuRt9puODFD?=
 =?us-ascii?Q?GN6Gi1RVgXoPeg2N4CL0NiXecFjrdpZmQZaziMd9sru0cOfPuTqJK1NwWZZa?=
 =?us-ascii?Q?BjLY9RznG4VXMNqVX2MVDn8b9PmA78OVcCnKrdtv68GxoJX7DY3Rb9szBV6D?=
 =?us-ascii?Q?7BAQf0W4a7OHexvnmA5aksvow2FWbqJeAybgoRdVQDgB7EmWjXjMZKYWmPec?=
 =?us-ascii?Q?erKi/WffYQiKG9+ywIyrIwJtthqrxw4GWoU02bKSOzfccbBo3kovKIl56P0y?=
 =?us-ascii?Q?Mml1u915LjNCBdR62VoHEpw8E88i2QPoGzNyVoW9uu5AySMcizF+gFW+v0/S?=
 =?us-ascii?Q?8PO43HQI/dwgoZeND31OutNdh0J3r7vu1EnU6EP3OLzgWTp1IuQRx0l+w0cz?=
 =?us-ascii?Q?J68LSN+vpKZ+Z1XbV/JOQsyZd8E4IbtuQpItLkddzl90wmOmJbKaH05zaiJz?=
 =?us-ascii?Q?D26uG8kFb/hVYVQLcTMM9ka6yFKyk8UmIwkzmnJmKR4FWYkjcZo2iajsRI46?=
 =?us-ascii?Q?yU7wYTejoBaM2geV86MqljQNRMcJ0J+Fia864jD9+OHN31gW7e+9nBgnNokl?=
 =?us-ascii?Q?XndSbM+6WfzS5LZn6SEDtmyc1nS9P7xoqTGPTZG+hR/wg7sJRBhRkpOsArae?=
 =?us-ascii?Q?QjuOF4AmmZS6ZJXwpcN9JdFUmbYOF/FER9+gVWviDGQh6vyjS251vASIvL7I?=
 =?us-ascii?Q?obI+pKZrWAo/BZ7z5Gq7UvqPLoM7T+G9VjROfIMC9TvDL102BhgzN9DXp26E?=
 =?us-ascii?Q?YMUm0E32+9fDsaIi03ojr5nYVng5L67bPQlJ2umpP8i8M9mJmcQuDim8c0wD?=
 =?us-ascii?Q?BrCLCLm3GctvuEhrq53sxc9lXAtFbeHFcX/gYN9mdOgdG1lcGfWmak2ywmKL?=
 =?us-ascii?Q?nv0szkZ+wvwLXBs9mJmYEU29eCFrXjBQsrXB/lwDJJFAvz6GsGBWZGV36Xih?=
 =?us-ascii?Q?yYfUpPPlTMRybnxyjjG0V4KbStjATrmhv/yEp8nHtqHDEK/zlmuR0JcDE2fl?=
 =?us-ascii?Q?v851PepTZRUdrCrpoo6nD8w60ZPH/KWbpvmlW8Bw7xdMQvJxd10EHqW9bZom?=
 =?us-ascii?Q?ip3Ohsw1CQTq1eyoD7mFxFhjoRZijR59AVncM64wzM35SvI1yY7cEdxxJl4g?=
 =?us-ascii?Q?Tze2MuDiloAKXiPWhlSg7+70U4FGEZxzbXlXWzNjNcGDmGrkhML/p1OIVJMZ?=
 =?us-ascii?Q?mtReA3eSvi/Rs8GCgDkAAx3A+gmERYfOFScr/JHx2BJe9/636ID/GH1a76nd?=
 =?us-ascii?Q?IUPlCU1HEG5xMRvkPNAKxFJqlyyAQtyMiISg7NLO6m+Kz3zrC6lFiD/5lveS?=
 =?us-ascii?Q?ivRIcSqzX52oJa2VmxPiDg5fuqtBCUhr95yO/ovNVKiam9AujuFfPl4URcoq?=
 =?us-ascii?Q?PnAXSWm/TRCbDFP0zjVpYw+fMNXPZtjfLsyadlqavfmLAuKF/Cfx2E/vZhmt?=
 =?us-ascii?Q?3s4lspUri1gTTmRqqN23tGdyMOuvXQfgDC9p3kt4v0CxpkAamZLFEqH7FpS5?=
 =?us-ascii?Q?2f1thH0dFE/FOklR8yLUwFaMZ7VD+nwvZcCet0rDvuGzG6oQwt5I0nDECuCk?=
 =?us-ascii?Q?9pQfYuBurQLVGloYSDpwPG8rd2bOEO8QenRejkN5SyQO?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	e8Jih4+54IrlNlNT+a6YDnBIyhBGzhvRH0lqyFAOGM//T9ztmADnH35IPbsVIqzMwwxf8NMoPOQ5RBx6+i2N+XBNlPWiOsQvkhhpt65f858/zZ9miSWsHuvT/aKTGW4UjlwmwqzST0Q+jXo2OHud7ya+LYD4PpZJkl3BH7QNZ0ElFggCwXC/prrUbtUCa8gR4u3Zzd9B8hJJSpa2XTrMMdXvXPepM3vEWniTIw5xf0WHAnUMdY0CMWpZb+mom95gOHx9wugdeRh4YN83QmNOz5hhVPfBLrN7KW5sRXO6SWHYCFzer59aM1zc6cFzKz6p3sNgCeOmDRkMaD1MNqK5+vbxVEOqqPXZT2zD/nE6PmtVfgsclBhTIN5iIcVH3XrzpumXFQpDZTdsaWw400/koUEF+09qus9vVbpD3RZQPs6kLcp4GOMJUXfMPlkOiIm7
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 22:07:26.4071
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c141c30c-6be2-4395-65a8-08de6a831b5d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000044F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFD020A49E6
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 12 Feb 2026 22:07:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17103

meta-arago / na / 20260212214436.2828924-1-reatmon

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
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][scarthgap][PATCH] ltp-ddt: Change branch to ti=
-ltp-ddt_20260212
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Thu, 12 Feb 2026 15:44:36 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 20ac20b00f087f31fa0a157a7cd8b93d7=
4c1fe6f

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202601300920
- Commit SHA: 3f25711c06a81f25be6616e73a8042b78b029571

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




