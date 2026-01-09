Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE64ED26D92
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 18:34:51 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.58])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16940.1767983688791045229
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 09 Jan 2026 10:34:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=EJYMFLeZ;
 spf=pass (domain: list.ti.com, ip: 40.107.209.58, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KWJcjT9BDQSaxfpW2WHLdje4JKi3vMiqFBaYZBEAs4UDRxSICT2u3WXz6IvGI1pDI7cGCBzvqOgqs8KkeqUk60ExFUlpSmcV36jNhRn5UZEXO3tgm65e+tCYi7QesND18mFPnZeYhqscHPLmBymOaiZF0dU+XKoMGdDHlI5E7xirT7LyZge/fsMnkF9k2xepJJdr+cBoLP6WlP+JuNU/i10XWOMsnUS48LdNuJi2WOABWDi305ERAsKCgEEM4evPvv+QHrVoYDp8ylUveEGzNoCpNkt0Szj/Hm/3kdqxZANIljrQoguCK0K0VeBLpqe4+puLtl9VLLvQei2vsm9bzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1nmxVDYG8mkdOtL7nz6oQbHVU8Bg8vllBIeS/fjOOGg=;
 b=IJ9GBkZLhu6mKXTkaRyI/qDyMgPOTVE10L44PQWpf3ecz5ZWEtW9Z5HONgR4vbOI49y/H3jGvdRuc7e36VXOWOnWWenEvHoSDKcqSySoZ5LzJIqbpM/tQ/jhUQLp/h8nA6bGzSdGmgYTYr+LbMY/f9WyZN+V+sYeds/trIG+UWgfN9Kk6Ai4O2oepseKJV6TwoKR4//S8q8h8MbAJXf69SPO5IzVvjvGym2EN0b9SQ++3ye9oZzX52rnslZg6jDSQdm5QEs5BW0XrjPe8+RfU6IzAKAHHtEeHLA+G3ZjZtd0FxjAx03EnTiw3enK7zeQe0/oqtX+8zQDX1uLbfFXJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1nmxVDYG8mkdOtL7nz6oQbHVU8Bg8vllBIeS/fjOOGg=;
 b=EJYMFLeZRf3CLeW1R2iuXzxI7I5NCNuvcS7PbVUeof1Xt5LTHwPZsS0OQLfhztI5bl4Se9U+wGHjnchHmad+bcckcOQ+p63XJXmobSe8UVfxIB+LKMqnrEIe8EZIueeM7d+moC4nn0AmK9jutqwCGtKVcGoUVjEJKY2/T0Qbcs20GCsracOnJYgaI11ItaDp2+7afx+28jkAoUbryI3VQWBgm+qKfzIdEEgAxgLfkZ/5XLzDhfNPaSFcWuJMwanb7bH57wSkgu49TpOSjEiRbVqAJYonPLKX2iw/bZuZLW/1fXnBEnnf+GppYk6XaoxiosvRT97Wx4I+G6BT2Cr9wg==
Received: from MN2PR10CA0027.namprd10.prod.outlook.com (2603:10b6:208:120::40)
 by CYYPR10MB7673.namprd10.prod.outlook.com (2603:10b6:930:cb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Fri, 9 Jan
 2026 18:34:45 +0000
Received: from BL02EPF0001A0FA.namprd03.prod.outlook.com
 (2603:10b6:208:120:cafe::cc) by MN2PR10CA0027.outlook.office365.com
 (2603:10b6:208:120::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.4 via Frontend Transport; Fri, 9
 Jan 2026 18:34:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL02EPF0001A0FA.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 18:34:43 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 9 Jan
 2026 12:34:43 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 9 Jan
 2026 12:34:42 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 9 Jan 2026 12:34:42 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 609IYgdf486772;
	Fri, 9 Jan 2026 12:34:42 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id B8D3A9ACF4; Fri,  9 Jan 2026 12:34:42 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] tisdk-tiny-initramfs: Shrink size of initramfs
Date: Fri, 9 Jan 2026 12:34:42 -0600
Message-ID: <20260109183442.3946715-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260109181111.2501386-1-reatmon@ti.com>
References: <20260109181111.2501386-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FA:EE_|CYYPR10MB7673:EE_
X-MS-Office365-Filtering-Correlation-Id: bac2fa08-23f7-4855-c721-08de4fadc24b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|34020700016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?vvzksjV92t0IMiq4Q25sedZi/BiIsPuiEb6I/etePPfpfSiVytPBEpSMd2G4?=
 =?us-ascii?Q?9RU4C+G1EumpMRJZZrp3a83VJC1qEgfdaN+vOGZYRf1T3rVjtu5hAeUovDgu?=
 =?us-ascii?Q?M17UTbLm3kl5rPMd1PtKtY9AlGXsTNRs2TkqBpn8mzB+yc0S0T9ANOW0nqEW?=
 =?us-ascii?Q?8vTl5HOR6PtbF0vxrKx1LGEUpsrGeJOcO+tKOHvC0v5uXx2HQ0rpISuRLbr4?=
 =?us-ascii?Q?aoqcblV+JDfhYhN7C7nGhxbravGOuehbLO5JDo5fGt+/GHLNv8HGmmg1UIAG?=
 =?us-ascii?Q?Gf9QiFyXSEZOBzzBEAPSckuEqTlFpWGPyytYcNCCnWVQ5K/eDVTGRcKayvAJ?=
 =?us-ascii?Q?0yQP53q/jBsQvFGVJqqIA6o03CtccrF4dETs2Z/6zv13xPCERga5/8mXNfxw?=
 =?us-ascii?Q?IZXRbIdNpJiHhUPsMmupBmyD3VEU7n9pMsAPn4UA9cdtzcL8WHdnGfT+qEJj?=
 =?us-ascii?Q?KbdxmgeZ5stTcuD4rSMtO43xybrn3VWkxS2VgahAMDGBEFS4xC6YZyObb71N?=
 =?us-ascii?Q?pFvIUDlDhQ1BwxNYLeJR79x1EHhb0NH6ABa7D0iUY6Ta8ncRs2qvWJDF73Cc?=
 =?us-ascii?Q?8jaq9Ne+GDQKPEmA0Goj53UEQoixkepg06x5YpI2b0qV/kC8J5yn+5YaWyX5?=
 =?us-ascii?Q?jEP/SdeCpSdC4/gqX7X5eU4vXaHgBbvDEnTuEwVxC9Itca1VPOZl+iSqhcla?=
 =?us-ascii?Q?K+G5kcRfCTgD/uUgZinbZ7EXp70UaYs1sMNQDZgaZ8yIGd488etQ+TFoWTNb?=
 =?us-ascii?Q?b10emZ04forA326pVjdEjcF/dDHrj04pIW470bOMSNbI1P4y6v3U6tBBGE1B?=
 =?us-ascii?Q?bKda3i7s2Z1od12yMs9NxT0wKim/prcgqLjpTe4/BEwhMRpPSJ4uoQJZLplK?=
 =?us-ascii?Q?No6zESNufrLunhb2gwIxBKaunhJll9tnh2fiqIBp2A7CVq62oSf5iwNWCV0r?=
 =?us-ascii?Q?sVoYqilYu8Z1d+yE01wwMN4hTyOgiIYtnY3/IjxEFd2mAN+EgCSo7uZ+V7rH?=
 =?us-ascii?Q?jOq15khBlIzzyeqeBrQfB4TpCd2hEDutBez0ZgPNLVBS8yxxK0vULz6bF9LW?=
 =?us-ascii?Q?m2rvAa7rl+D/rUYt2LDKR0zKlV3BD6SDCjvaqBSTi4UFIEGEyee6jevhbnDB?=
 =?us-ascii?Q?O6Aa7nsQeDvcZMyuzm8VLxIU0ey2O+PtPaSgB9f14nkbc3+HbxNWsJJYBISt?=
 =?us-ascii?Q?hgiZfr6ny8E22xhQlsWbXtcRlaGMQfHrBrpPf3mz+EO9kvP76IqV09Tsc7bc?=
 =?us-ascii?Q?DRmGVdh+/LueHDBEyw03LPFXPkXU4zFdm6bij57/2lunJqxRm7r8Mh+He4sW?=
 =?us-ascii?Q?+LqTRKqZBHdonP3uAj8TfjNHiEwoVUaKHquwWar8KNySurZ8vEiXC/VEZiY0?=
 =?us-ascii?Q?RuBx+94U7TujszZwZzflXXIBKlPWWcjqfW9hjLaBnYrCB/U5fos7Ec4SeZeM?=
 =?us-ascii?Q?noUp5cXGHdIE4RNmad3IrikfYnl3XfiY6K0nxtkhLGPqeyqJIIOquIWac7Kq?=
 =?us-ascii?Q?nurmp/b3XOHd1TTxfQf/OOwDQzoszgWmwYxA5vVFHQLLKby410hY6XL8P+YR?=
 =?us-ascii?Q?hk/nLdnvRAuTjs1k87Y=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(34020700016);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 18:34:43.9597
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bac2fa08-23f7-4855-c721-08de4fadc24b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A0FA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR10MB7673
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 09 Jan 2026 18:34:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16948

meta-arago / na / 20260109181111.2501386-1-reatmon

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
- Patch Series: [meta-arago][master][PATCH] tisdk-tiny-initramfs: Shrink si=
ze of initramfs
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Fri, 9 Jan 2026 12:11:11 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 55d496da7cb536b3338e0bd171e9da8b3=
b07114e

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-next
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




