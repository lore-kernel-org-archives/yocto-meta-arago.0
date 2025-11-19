Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 818B1CF58FE
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 21:17:41 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.17])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18078.1763587056014490528
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 13:17:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=NOXA7anK;
 spf=pass (domain: list.ti.com, ip: 40.107.200.17, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pU73UsEOtElxkQ8FYdK9DFfWER8cs3V9Qzd5SRrOpo4QXzvzhgMYBdmlfH7dSY4wjfLcV3jB8VWKJgWqTzbEH+qqYhkyxop7CHgClKoDZu+bDOUReq6LpoicyUJ1Pbc9ZXtdNk4f/F4otSyBsSDh7WK+FHIrLQctl76E7pQLSnncSPVPKmof3M5EgvB06QMnt9bcPBBwA+lAvWtyrUKQtsDqfb3teCO05IOd2Ixgxd9lIyt3o6lJowhNiuIJ/tVVZZeZQZOO0tJGeYKqEcGYtnV5Nc/IkhpQ/R0Vjiz06rYejh78vTGBmbfU9OHNm0CS03gX2aT5NL6rlBBO+wStpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8yV/+okoWtkbWzcwEa495Gf9hj54QKqOB5C+48g8ilU=;
 b=BmHzi5gyb5W3snfSpeaiBI6uusKwsqnILXTjBd0/r9pm4Jpc/F5zzf8mTAPFTX1bm1iymbf+PdamIUPE2W6tR1lvYcY62QacwSbLrrBKiCHN448KvN75O0N7XnyojogDKgptVDuDZb5HNcjVxzyDEQ4apAqHSP/5QG3jqJT5C4+I10klwoMgbdSsMGlGZhmiKUSsDmJNYTGGHd0Mj0/PlciXqQsVDeOLbdGbAU80zuUbKAaiLO6pY76SUj/uR2iwvAC4yvxV/8rluz2EwNY67phE26Cej+4/ZJm8jsOF9LJtjHI69jiUF6TfABJh8lcNeaeXkk/NJM1rZZXTWDwHYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8yV/+okoWtkbWzcwEa495Gf9hj54QKqOB5C+48g8ilU=;
 b=NOXA7anKbFEsJhhu/Mc/Sua6EqnwZj/vAskh1oHoxem8sM2rkoN7nOtFi1S+mmNgezgrbGm+smIvQ5FYryVeCEUniJPHM2+4P5zN3leQxVOO8Bwsnt37zvD05NprX+1fVSbg+u6M+Oe+tWAEFhXIPUVJ754DYjM7tgMe/KuqBsOMyufwFddmoV0/tQ9tvT7G/qH2Q+OCNBz2X87jaC/odO2L2LUJjwr99dnUmBmGoe6m8FqLCnKFCUPbbcPDwZGy5NQmiKP7VrgwGKUJGqlvtu+ZLfZ5n/AoOIGymPAoTtRobVgVTVchpk5Y/ZjQp0KnloiTuFFRSX1yPWoLueChlg==
Received: from SJ0PR03CA0199.namprd03.prod.outlook.com (2603:10b6:a03:2ef::24)
 by CO1PR10MB4417.namprd10.prod.outlook.com (2603:10b6:303:93::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 21:17:33 +0000
Received: from CO1PEPF000075EE.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::f1) by SJ0PR03CA0199.outlook.office365.com
 (2603:10b6:a03:2ef::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 21:17:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF000075EE.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 21:17:32 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 15:17:27 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 15:17:27 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 19 Nov 2025 15:17:27 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AJLHRdo2027205;
	Wed, 19 Nov 2025 15:17:27 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 05E9B9ACF4; Wed, 19 Nov 2025 15:17:27 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][scarthgap][PATCH] check_yocto_rules: Add new PV-1 entries
Date: Wed, 19 Nov 2025 15:17:26 -0600
Message-ID: <20251119211727.2496747-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251119205543.80759-1-reatmon@ti.com>
References: <20251119205543.80759-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EE:EE_|CO1PR10MB4417:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e1952b4-b759-4f70-e874-08de27b10df6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|61400799027|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?CgHdsDctKrTYdsLORj1XXfQtHoxqQQ458WRTa5/gRXb15f247VCx7l3hMEtv?=
 =?us-ascii?Q?5y7SFJqLnXAdPGdfdihkG6zGAK+sFbIlrtXoD2j8S9rbcja0Xlzappy0TgCF?=
 =?us-ascii?Q?kdtKOf/hhNlNyWak9zsBYKUZXT1xN7Z2pQOTlWKCZnbA9uMPZkH6vKovmhSQ?=
 =?us-ascii?Q?CES238pUJwhiUJbUgAmTIn99QtuKBU5FZfyVs6ai1rFo8Z/v45R8v/JwrQ/W?=
 =?us-ascii?Q?KBoQWhlCJQtf9VZzl0J3nZ4mBc29k9S7nYAQqWGXIVxcp1UHlxk/SgYvKkBy?=
 =?us-ascii?Q?qI01evvc7qh84ZwRyBmbF8TQyMuyJIAiUoISyFJkmpltSLoCyAwZP8Zbr7dp?=
 =?us-ascii?Q?JpEB9Ruo2garB5Xlnn+p2DaA8TdYQxs/ZsfeIzXf4IdiwSVceXPtfwLk5Jph?=
 =?us-ascii?Q?wtLjvKdvpraM+0ZGlOzDSYkWNJETyCkS9MeGsYPJvYmnN17m21jfANB7hSPW?=
 =?us-ascii?Q?bc/6O50S4lVu4sEkBU+WxPO6pjR2a51IGffWf76jVwbDrpObgIjuzpNwbU0Y?=
 =?us-ascii?Q?HOyYRlb1zxn/ddy2uFEnAUy27LeUROwwZGQP3Kyzd5JwlWc6IXg2tb6mHBUJ?=
 =?us-ascii?Q?KDfYxZ0TYFkBVcstEKRH/+ouC+TgsB2XwcE6tmGMRBL7ZUq2onATOkHqB3/d?=
 =?us-ascii?Q?zCMp5Sj0ZSrE/PIOBGLBDzNFcrFbRrEfwyrLyL8SPO9iib+i3jDrtVZKyUVE?=
 =?us-ascii?Q?X3z6zmvZCxqQHyoI9nZT7ZQyy/LfxHYrCrkdaeKYY+xn6UbSYn3Itn5Og2BH?=
 =?us-ascii?Q?2ugNXXoO9yX4z+3KtMWsyraK3foXpbcudXTY4kqRWbOa2RKHpbMoMl5OPHMy?=
 =?us-ascii?Q?VzA1WHDF9MrwbOcoxWit+TDPdUZFrUYBG+ddWXYw95hWpKctskj0qkKHg1hQ?=
 =?us-ascii?Q?Kih+otXAMNwLctDK7+7np7/wSJFF6fUHVJcT/JudxS+9enmP+ofGtSjoPcwN?=
 =?us-ascii?Q?2eHWUUpEio5pCGWpVgobk+Fq2XD1McezKlGTExdUQ4MoxLgb9JA880Mj8HU/?=
 =?us-ascii?Q?Q7hUDmL5NQjAeAwtaFvMF6M6YJI/3EvLIOqly0MheuSlrH9cTcRyt3waont0?=
 =?us-ascii?Q?urhwBqFRAD+gaTQx/vD4TydgBGeQ88ji02Qz6/Ayu4eqlYvLet9XWhKr6da5?=
 =?us-ascii?Q?CmaAHJcIAXzbpONB3wzigbyYNCCoNMCbv/VP0oVCE+HVpaQnKDgzHB2FCw8i?=
 =?us-ascii?Q?rINb8zsnRwInvzJFt3Q7xCmT3yO/tv9jeFrk3hBmtKFpujgb97Z8XPB07OSI?=
 =?us-ascii?Q?HJSrx4g7BWBAnBaDcNdHdDBHXo8Ceylwn+4Spp4wHVp5IDTQ/H8YjlhZ/bPe?=
 =?us-ascii?Q?8UUCSxI4XbAb+/nU0TJIzw7p2AP0BoBm9Wr8m+H4P+ii0X6mGveXaBLo14T7?=
 =?us-ascii?Q?sIE4gapzCz+6OvOlN9RV17N3HQtsHsSzAcHr93+XV0BHJaQyjOlpajWcRhqG?=
 =?us-ascii?Q?Gxad7S1Qy+FRm2trzjyO0TLUqCm3mTBqgguYjohb75w6aDIBj3Ub1SU3qNEr?=
 =?us-ascii?Q?a/KYDHmbDUKZWuUC6AP3pUc8/VPduyX4FeFVsdDHWZ5iiO+R71XMZZx4YFsR?=
 =?us-ascii?Q?A+WyDIkDlPV7HfbeLWU=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 21:17:32.8870
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e1952b4-b759-4f70-e874-08de27b10df6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000075EE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4417
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 19 Nov 2025 21:17:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16808

meta-arago / na / 20251119205543.80759-1-reatmon

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
- Patch Series: [meta-arago][scarthgap][PATCH] check_yocto_rules: Add new P=
V-1 entries
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Wed, 19 Nov 2025 14:55:43 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: a84fd7ad4de9b3988b7ba615681132e3a=
f0123d7

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202511190400
- Commit SHA: c273081b9e50cd3d742cbaae1e78a8439d6ff710

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




