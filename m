Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB065CD041B
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 22:20:43 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.77004.1767651634850482286
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 05 Jan 2026 14:20:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=PTjqboMX;
 spf=pass (domain: list.ti.com, ip: 40.107.208.53, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b/RfA/FxkvoREAc2JLehijb/WEXlwXM5dX2UWhLNUtVwD51vrfkV4Jd7FMolC215MPQG1sLCfw2ZOYNpGQhQEvpIrqizBPlU5MTjZgk6UWlU5BzlNul7u/tiaCQwFmEsEQDE4Vo2rmeJcLaLlq2rNxukUcpsw+ync8+e3MFRIgjKhHMDLKdVUjemorAshh8/951K/cyNNakj/uQKBIo1IO1xf6DxQhLrTmJ+Sk9ULVmQ/fmCxEUzagMXyAL7jZCPZeSMSxZCCxo8RVvcHvF70PCtbuPs8Si51WOiu8ERG/kyx7kTXRdSKIwNX6OGCWyPT2pSyCJGlHiL3fcLcTv4eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5zd0JZL7yDoNOU6skO5tYGO1DELF9wnu37fgniz6st4=;
 b=hRjHNGBX3+YaVWgCd/rjXoUdH1ma7NwL1CfpdSCf7RswcIkrdprU1Qkw02IUB6+qBiZKxKJF6TL7iunG3uu9IxAZmz1tqgzBp/sGxphVUsQJKY1xCIOtaDQXZzDw2wrayYdt/3XoDCECaDypg7UA/c5EQh+CfPZksK/p4ELNulhWWlJaS3urDc7QxNQM7DUWNHv3zBKtACg4APEy57JPM+O37LZPvtF5MAt9Zma+/6mas6PsU24Qb0rPo1Ls6fi2wVCrj55E1BR+0oyDD4W0iZN+JHmNhUGaZwew2pcrg3iZ2DQOpN4ozAMD4cZdOZYFbKfjlze+bTI589TbGW70qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5zd0JZL7yDoNOU6skO5tYGO1DELF9wnu37fgniz6st4=;
 b=PTjqboMXHFQiV3ULbdinR//5dscDwYCiYO3cAv4+OLc0yWXt/WJzbwu73JuqL0n/wXDWlTmLPg/thGAmyMtKetwrMU3+N8bXHU3cHItd9gXkMKENdcshKlQFc+0RaRvF0e9NzxwnQI3PEGMeGq9I1u7fKWgrmFV1su0M6+J+ffIzGedkcidtrQEwI2rjyxxmyd7yLgtCkjVmQYCpJVgB4kSwZCX7YsZUeKIVi1rPP5/iZDR+tqGUrEfpIxzxUpg/TT9S4ueMk7u4HnTnZhtVg/09LGci8xCJ/AUsWBOklxetBZPk7kL6nDYM1ZijlmnhAHVRMiCMz4zLb8qCUdbixg==
Received: from CH2PR07CA0049.namprd07.prod.outlook.com (2603:10b6:610:5b::23)
 by BY5PR10MB4324.namprd10.prod.outlook.com (2603:10b6:a03:205::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 22:20:24 +0000
Received: from CH2PEPF00000148.namprd02.prod.outlook.com
 (2603:10b6:610:5b:cafe::ee) by CH2PR07CA0049.outlook.office365.com
 (2603:10b6:610:5b::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Mon, 5
 Jan 2026 22:20:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH2PEPF00000148.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Mon, 5 Jan 2026 22:20:22 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 16:20:20 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 16:20:19 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 5 Jan 2026 16:20:19 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 605MKJV32321683;
	Mon, 5 Jan 2026 16:20:19 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id CF2A59ACF4; Mon,  5 Jan 2026 16:20:19 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Andrew Davis <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH 1/2] shadow-securetty: Remove unneeded recipe
Date: Mon, 5 Jan 2026 16:20:19 -0600
Message-ID: <20260105222019.3727340-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260105221926.2503358-1-afd@ti.com>
References: <20260105221926.2503358-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000148:EE_|BY5PR10MB4324:EE_
X-MS-Office365-Filtering-Correlation-Id: d1a6af73-83b0-48e1-9b13-08de4ca89e76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?AL0Hc0LbMVVdq599f9KcaovEX07b+TbXnaQI4koBDFRqey31KwY59o5ai+jg?=
 =?us-ascii?Q?dn4Qm4hV1q40DMw7Rb2Do94SXEPcR62W/SK+JtaeNeh1SIpfT5Vrokuiyprc?=
 =?us-ascii?Q?v2MxKzdBp2YGdTLkmOzyoBWBNbr80I008aPMvic7Lw1BLugLelcycmSO4f3j?=
 =?us-ascii?Q?HcmCc9A/IMjCIXSfhr4UignTt+J2UOJG0Wq9MCfk/84gTO2wPUIGarclONcQ?=
 =?us-ascii?Q?7Yz7EKd+Mzvjrggciib+XRQrG0iWajkn9I9wGG6r1hGsDBQYeNHGydYUkz3l?=
 =?us-ascii?Q?UaR9i9mAvnO/7KhkAlPqdS859bpKYnb8ybkiKPk2sD+2dO/GK2Df7l51dnFi?=
 =?us-ascii?Q?QdR9eH+iCd/4ka2DckWQe4N4Nd4W8xyqxhdTCOF7s4T3w0vPpXV/zsQ8gDus?=
 =?us-ascii?Q?m2N/jOTtlj7qF8xyQRZzSmJXMR3Xe+N5bd3DriROsZJQV0Pbi9S7s2U6cNz+?=
 =?us-ascii?Q?lIzEc1UprP8ZKtNlthWO69+ONRuB24ooRh7UpWEUR98nT7MHYObq/oXcq3SB?=
 =?us-ascii?Q?8A6gjXjyfGEyj4b9fXDZZ4l5QXk+kOW0CXR6S2nXi4qdBiT5BmLJulZaEUe6?=
 =?us-ascii?Q?TypbQ/BIqh59qPw1dlDQjMmmG+gx7bte3gp/xjFlvxSmSEZQoM2nq8xuGMsK?=
 =?us-ascii?Q?+wm22haMpp3WRZb83toql0AUgIpMvG0bZM+Vfg1coghvTRmSmJnkNXNG2jap?=
 =?us-ascii?Q?TTA9yRO/j827HGzxv7pEitZDyFLQ32rGX8NiuNLKIdIXXP4txcBDIvhz9Y1X?=
 =?us-ascii?Q?FfJhb27SEFDBfj6jP2Y1Bm17yCeZ3S5A2WVDKduClr9JHZOyd85aZpu9Nzcv?=
 =?us-ascii?Q?zQ/cbJhz6c5/q2h8kEERdEJipZb9b5kkdzTcR+S0gNXxSveOFZnSaLVQ2yoK?=
 =?us-ascii?Q?L4UWkN1piJ7kn6RdcqENM/ZtwJGjoKYKTIgJqWwzDh7bSNdXkT7Y89koYh0q?=
 =?us-ascii?Q?ZNjUhLXFQauhkt/d/mE5Ok4tiY3uXejrmz/LlSnfTi9uf0AWUxU0VQk1WssC?=
 =?us-ascii?Q?SpfYLy/Ble5U/1eOrm17l3lb4/1EFNCdLhaEpERTj0b1xiGwsRPiioVAzdQl?=
 =?us-ascii?Q?7osRK587KUuFuGiruzJ5PWlMfmwjJup5j67s7woo1zhO8Kn2RHu7+xvTQzG7?=
 =?us-ascii?Q?0jPe+Bzy4ZWMuo8I3j+UT/sMASOwFyUM+cqgrKfDUmLtwPxUlEwumtlYjUAG?=
 =?us-ascii?Q?oOPbQFkKWapUHKmlLbOcMEUtU4tAbksh0lEpkt9YoKDFF0s9XiGqjdVyCjCh?=
 =?us-ascii?Q?KO2kOKEdAlVfghtMymXfiGH+rfjoNfNvSaQqlDDb9ttp2q1A1RvXx6UfzZcG?=
 =?us-ascii?Q?qWzUdmp31/+aGn1nrTW8gBOD2gfsDmioQKMwj5vRa+FkWT/GtyZKZ4epbeFW?=
 =?us-ascii?Q?ViL+rW+UmP9d4OvY4J3QbSQfFRAf49/RViRe29oOVoCU5Nbe2RsYufTAExIb?=
 =?us-ascii?Q?Ebs5dTy+9s3iU3ZvQERjU7SF4QUhrXLrtqdc+PBTixMuRjWtUpMUoPMKNnRY?=
 =?us-ascii?Q?Aa+H6346ShM9SSA+stbDu5KLOIpV0eDUrwpGVOKzWjoXY92NwY8bTjpEk70P?=
 =?us-ascii?Q?s4SHl7f9jCs5k6DQ/Ck=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 22:20:22.9538
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1a6af73-83b0-48e1-9b13-08de4ca89e76
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000148.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4324
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 05 Jan 2026 22:20:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16923

meta-arago / na / 20260105221926.2503358-1-afd

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
- Patch Series: [meta-arago][master][PATCH 1/2] shadow-securetty: Remove un=
needed recipe
- Submitter: From: Andrew Davis <afd@ti.com>
- Date: Date: Mon, 5 Jan 2026 16:19:25 -0600
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: ae7cca927d79ef506ad4b042e26435366=
49b9873

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: libdrm: Remove upstreamed patch
- Commit SHA: 8c190b1e4f6a53ea641ba9d6150ef873f561c706

Patches
----------------------------------------
All patches applied



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-repo: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
FAIL




