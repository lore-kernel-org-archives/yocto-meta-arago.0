Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14EA8D3B983
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 16:52:14 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.27])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12470.1765299131342347496
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 09 Dec 2025 08:52:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=ghRuF1sM;
 spf=pass (domain: list.ti.com, ip: 52.101.52.27, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VvvvL/LQ4E7N/LAAKUtDFUzrm1Gy3IctRKjUOKQ0J2MYkFOEUmY6qOsGgEQzR3x5U2rWc/U6HBvyYXgb6PVZpDsqHylbMeNCuDA0Aq/GLNhtrPGp4V9ewuGZNLv9uk3XTLhxgOf1fPcGK50ZfG9lE07CxItqtdLTZhX28zm5sVCKrpn+eP+yVaSbtKxmh9MJjCCbru2t71ZM/rG8m11e3aw/VuAEjoAffKdNPtdILeKG06eDqC4wRUWM+vabR8+/dSWGoTTgCCdGbSi3Qht5NsqKn8BCG3Z+n/obCuRmgSDcHahnax2b/CCOG5kT2GQrKqnnImGbCkczqDPlY7LhvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=80W9jvxORhQSb8meQqUSpN5K45M7aJvx7/+8tbZD/3o=;
 b=U4NGtou63thTtQlOYuFUsQAv5VPUpz+QUUORATySKgKk+SCX6qw6Szsz9R8rSBK/RVK+MgmNO9OSlwsRtxSMuvreB90IyjJCvHE7ezp8JtbI+jhJCG/Wt1hc6Qpp8U3neOd8H6AODbCdlDVZtbz+u19wqGHcBxqfFJIg0D6mtmp88ZWg0bdLzd/JQlwx/KAqocDLsAbU1OQoL7qaoAjXnGyG4y6IKWtmZGBLsvVbQA3eavrna3JxO8PSEyKiEidec/SirELhgYvNIk9Y3QubAVoeed3v5CosLdt7EwNWdPtMzmsdinW9Zsa0eJyALSV6gGh+rs2AxbAdvODgB9vzCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=80W9jvxORhQSb8meQqUSpN5K45M7aJvx7/+8tbZD/3o=;
 b=ghRuF1sMNvt7GvyQtRNSegFQJeqr8dw4J4rMl0Ej9JcJEIszp2EjW+xSep4BPqjOTGYZxciuUO3N1k7M3bYaeTDkw97m9GFpoVxBjDcAeguk1cDdCINQ2FSBO5HkKuLBBZdT90evBzUjMSQBNr2DEHBYGtkYHkikU3GlSC4ETTVjBd0v/fA5L7YzC8+ZG0mYPX3D0R5eeEbNbuyrNKLmfrvSIOpDr05yoadlPtyaDxqPCEQiCdcCYZg/1kF54noQ1/GVroy3O+vbYaBQBvotLEjAcrHd4k4EGW1tf39TkoX2CKUb8KYd+XYxkClY0UJzfSiNSfn0j4nhDltXZWbIJg==
Received: from SA0PR11CA0170.namprd11.prod.outlook.com (2603:10b6:806:1bb::25)
 by PH7PR10MB6628.namprd10.prod.outlook.com (2603:10b6:510:20b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 16:52:05 +0000
Received: from SN1PEPF0002BA51.namprd03.prod.outlook.com
 (2603:10b6:806:1bb:cafe::a1) by SA0PR11CA0170.outlook.office365.com
 (2603:10b6:806:1bb::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.6 via Frontend Transport; Tue, 9
 Dec 2025 16:52:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF0002BA51.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 9 Dec 2025 16:52:04 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 9 Dec
 2025 10:52:03 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 9 Dec
 2025 10:52:03 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 9 Dec 2025 10:52:03 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B9Gq2OD1500164;
	Tue, 9 Dec 2025 10:52:02 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id DB27B9ACF4; Tue,  9 Dec 2025 10:52:02 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Antonios Christidis <a-christidis@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>,
	<denys@konsulko.com>
Subject: Re: [meta-arago][master/scarthgap][PATCH v3] stb: Update false version v2.31 -> v2.30
Date: Tue, 9 Dec 2025 10:52:02 -0600
Message-ID: <20251209165202.1120653-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251209162634.223382-1-a-christidis@ti.com>
References: <20251209162634.223382-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA51:EE_|PH7PR10MB6628:EE_
X-MS-Office365-Filtering-Correlation-Id: e057ec30-3336-4096-6cc3-08de3743485b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?1w/joCHjTBbWd7OHU/FqRVfpsdnHWsIqHDTbmE5mw9aSisUxEhhIEK28iKKc?=
 =?us-ascii?Q?l/VhiI0uidgRTQ7kl7n/PlklbdckQ8rymwhA9g44M4++aECXgPpMM0ttrGSS?=
 =?us-ascii?Q?kZW3HudkrrziKolrBsHnn+0pcyN6S5vy2uOrxfhxCWTjLCGVBgIyjrEV5wEY?=
 =?us-ascii?Q?UnhBmAEHyNb3SffCpP7Wsfb6etem99B9ALnUPxlti1YnyfGNHnRKWe9mUkXS?=
 =?us-ascii?Q?KtfazLyxkc5oGNN3BzN4imoL3k3+fxOf1L/yPwTYO1M8qD6FfiO2JmWFh+tg?=
 =?us-ascii?Q?Ivr+rCBE9eR29UdVGF8sppjLnYIuzMXUg8twhdEUnjeNU7o4XX32LEgj0c+D?=
 =?us-ascii?Q?kGEs4Suz6/E/ydzUXN9jTsdPeDIbxWvmpenEtxrMjyfaQZ6DTIqDfMS4zBFD?=
 =?us-ascii?Q?yy7skShT/S2JEnPnHcxnmbGQFdopLuxubJGSCSEkRU+kE0VECUvVaEeXQxbQ?=
 =?us-ascii?Q?iura6RjQ3e0BLmTn2edkm6qgyYvOIEcQS/g6oSNLRydgRil+eMrM3NQ1pswX?=
 =?us-ascii?Q?TfdHxwQsYVMJyqPu2mqEvsYcbAf303gkve4Rb7cLPhwZFFfCGjsVRvd2TeVd?=
 =?us-ascii?Q?Kx8KKc05xiH72r1Jk0Rt0YZRaVNGX0lh1CZHLtJvhLCS7hk1E5FZHYzVU05W?=
 =?us-ascii?Q?yeGt9BALLYjQ2Ihw2s8Kz+Fu05QUhy6/dMm3mckTg56KK6+jDwU+/+JuRPi/?=
 =?us-ascii?Q?KqyZYGg/fqLIEq23qomw2OhTmDzTn9mYMR7LJIFo9ZfuFj2tqfma0MqPg4xB?=
 =?us-ascii?Q?vQ6QinjeeV3uIwGyWhZIDJm9xWOzVTz75y4mAVMxG9CF3zflYMbmrluqGxq3?=
 =?us-ascii?Q?QZRNMxrXInBx+L/MyRUw1FfGgUt47ZtFSaj2RUF02+9faUM+rI0Bbu5ja8l/?=
 =?us-ascii?Q?JdECclggqG9UwCui4b72A/cYepp3sOg7/sda6J4xnC8yH+8+U1MowOoiQ29P?=
 =?us-ascii?Q?Gay0TGA2YebWL6cYp4DPiclvvcShKFY984DkxiYL+g3Ume79tJV6QP6baOzW?=
 =?us-ascii?Q?hZCnWDnSkJnudnC4vyisjLVhoVKwk/G1XFG57RAicXgB095oCDYMk8dhDk40?=
 =?us-ascii?Q?qvCeJl81ibBDe9Yu+uRrUqFzMTNNe+zwHIkeYjtyR3M669MVEkxamhCat1o8?=
 =?us-ascii?Q?7YkZreHt1VrJVFoNx8yXi2pmpragT4k9DCKtmcTkBmDOKishAWWzVfCEwfSd?=
 =?us-ascii?Q?QlTSqnuVsJYUIyh3yVMG0/VV3iZB4mdHW/9jcSDTOT17nkEWbsyF7c6vudKz?=
 =?us-ascii?Q?KgwMnb8Ww8C1Xh6v9KgGey+eewi9db60SdJrgq3m8vbpoKkVc6i4SBSfLjE6?=
 =?us-ascii?Q?E/Ijzh06W4Rt/5O6uWEUt1hd39k5xnl6cQaZr2joKVgeEAcDvgAOM9a5k9G0?=
 =?us-ascii?Q?2UiSHNTjqf7gRzbzQQuEwFgo46MG2ZORfWJxtBxfp6ydd/WI3bU5Jf87KqqC?=
 =?us-ascii?Q?gKN9LuPGaL5Swpiz3VU48dJEQ4SA1Cox93YSKNyql5vh4lXeXmFggu6VFmoO?=
 =?us-ascii?Q?y+s1pjD0d+P/0igcGgdp5BrN7TkcvbwjQ9ZqjF8/zzSN2hdXue6n5eusQdjU?=
 =?us-ascii?Q?13sMMjxGhQdeMOEOxl8=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 16:52:04.8709
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e057ec30-3336-4096-6cc3-08de3743485b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002BA51.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6628
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 09 Dec 2025 16:52:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16878

meta-arago / na / 20251209162634.223382-1-a-christidis

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
- Patch Series: [meta-arago][master/scarthgap][PATCH v3] stb: Update false =
version v2.31 -> v2.30
- Submitter: From: <a-christidis@ti.com>
From: Antonios Christidis <a-christidis@ti.com>
- Date: Date: Tue, 9 Dec 2025 10:26:34 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 790bfa26a324b922822b8b33acc901f62=
b53fe0b

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202512040100
- Commit SHA: 410e1081aaedc1c525825851a9df7748b49cb659

Patches
----------------------------------------
All patches applied

scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][master/scarthgap][PATCH v3] stb: Update false =
version v2.31 -> v2.30
- Submitter: From: <a-christidis@ti.com>
From: Antonios Christidis <a-christidis@ti.com>
- Date: Date: Tue, 9 Dec 2025 10:26:34 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 790bfa26a324b922822b8b33acc901f62=
b53fe0b

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: Denys Dmytriyenko <denys@konsulko.com>
- Commit Subject: libyang: suppress multilib error
- Commit SHA: 9b5313c8d016b8a09fb6699839379d1e77a37110

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
master - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed

scarthgap - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




