Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF68EEA860
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 21:44:47 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.61])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56839.1770932681159344394
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 12 Feb 2026 13:44:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=bons2MZJ;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.85.61, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=txoE1RXoMLn28FCGIlMI6tVWALjrnn82BX1deJKh8pr/wLNoB5ByERimk+0ggA2M26dyX+ReGbyy4bEUDzyQ+4GXUSLi/EhpE9FJ9McwrakncizalaNsmlAVBQ6eCTJWqLXePNlXYuRRTKsMa8VahzyVyyccgvRrL2cxW/qEsGeM8b4n6Geimmiv/ESKO0tRCV5u13S02CaubzRrtsonCjagjop6J1iBIEemHr967AsrXDWDN1ctipjWO7E6tI4Lv1GVwJXa7Ci46HeAX6/22WR9i0Tk/weMScaja9pZqTT+mfLB/CrLeD5V0yI0+1+JZS428PdQUUs65NMau8p7GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cPA9U3yFjh8G/DuhHbtEHAko15zcT3Hq2sNJAisGv60=;
 b=ZwdbkOLS4Sh7rccxzCUvxUNTi5saDv1FrE/EGc28nKr45mekRD9356/seFOwDEYMl1IPy9yduTIx6BuSPRSMkxG+yskBz6eq9yXQt/86ouc8kD11eLvMl2SqA0IN0T2PSASJXI9krOqC5FKyanILR8y1JFcfD3ysbg/xBlgsXhWqwAohXe94zhStMwtc0vKO+gN1QtE1hfJyOdjuumluw/KgsxVrFwduOGJa9oH0Y1KPvt6fjlNU+OzaMOGU43G6g2hkrYI6s9Rr/t6RB8MESSDoMz/FxiVrhgMx+j5xp/WXlp4o3jkhPjjg6wd/nW2imqN74k7+GikmNZJBFQaoQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cPA9U3yFjh8G/DuhHbtEHAko15zcT3Hq2sNJAisGv60=;
 b=bons2MZJfozxmeOUI8f7rcu95luaQ1+19HTdIVsHW5jRyG+S4UHd3rOrGcSPtno3OfP9OkPK5B93WgoliO1QbujzXGzcLACKymN8m3SSKvECynXw/EVejzWEEV/1/xpbKgPFbNg5D3sYW5yi7JZtzqI903hIt7UvEuZxFuWmxoc=
Received: from PH8PR02CA0046.namprd02.prod.outlook.com (2603:10b6:510:2da::20)
 by CY8PR10MB6490.namprd10.prod.outlook.com (2603:10b6:930:5e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Thu, 12 Feb
 2026 21:44:39 +0000
Received: from SN1PEPF000397B2.namprd05.prod.outlook.com
 (2603:10b6:510:2da:cafe::5b) by PH8PR02CA0046.outlook.office365.com
 (2603:10b6:510:2da::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Thu,
 12 Feb 2026 21:44:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF000397B2.mail.protection.outlook.com (10.167.248.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Thu, 12 Feb 2026 21:44:37 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 15:44:37 -0600
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 15:44:36 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Feb 2026 15:44:36 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61CLiaJl026565;
	Thu, 12 Feb 2026 15:44:36 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vqeUG-0000000Brvz-3qCN;
	Thu, 12 Feb 2026 15:44:36 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH] ltp-ddt: Change branch to ti-ltp-ddt_20260212
Date: Thu, 12 Feb 2026 15:44:36 -0600
Message-ID: <20260212214436.2828924-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B2:EE_|CY8PR10MB6490:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e9aa049-e063-4e83-6004-08de6a7feba9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5V2Y+SyVNAxRZsG8iaovWZ8rzVNveILyuKHaoydxoi4uwgw1ykFiAoUwue6i?=
 =?us-ascii?Q?JajfVfixwbBiAqdgd1iEIRy36rYBXRw+1B5j8mJqXBPQpTvLy/GMALGaTxJZ?=
 =?us-ascii?Q?d16C3PL9CoXPhgNboEs4YAqxWhOO+hASczkYlTPVDIQGcbxWxNCCUB41b4+I?=
 =?us-ascii?Q?52v/yz7kEFSYVQPd9vWeNdvpvgVrzdxWR9RWQtdKYrKdkDekTzVOVBMG+O9Z?=
 =?us-ascii?Q?9Q9vaJKjwpgxgpOp6RYhzmzzwSyC9rzzCJmJMWoqPthGAjCx6A0O2occNEL6?=
 =?us-ascii?Q?e+ncNzlFr2ggza+cK1YLl+1u/EevRXfz/xOGEXFMhXpDRTeMAakXa4VBUFoM?=
 =?us-ascii?Q?IbnWNWtopYZLiNLvQsmSNYaIP1zwzdQaCcBuctndxJhctDdOe9yw70BLTRbE?=
 =?us-ascii?Q?FMshZRSUqGFqiJQJxo68m50p9dBNjOqDGkh1HXIblQa7rWAFiuIUpd07+p5G?=
 =?us-ascii?Q?fcGLedYeDsHy0+PAVaovbsDqLLKDveniIY1COKndZvu+VEBsMK+GUmwaP9lU?=
 =?us-ascii?Q?0K37N5gyRNmM2T7lNqvpVP7TCgEr1xlVSgINeKIwydrDbs6X+e0yXKySNL9C?=
 =?us-ascii?Q?e+rwCV30wVpVqZR1achNAVIlf50u2CgT6dxCHsTL1U0mrHwmShgwsNjWbDSM?=
 =?us-ascii?Q?W/hYOV3+vSdqJ/av73SHswpQcMJkkEohrIQDBWq61nmAof+8dPkiTAeuJCxD?=
 =?us-ascii?Q?LDAm0eaZ0IYeYkocWoiNBP4OpY01/P8sJWFER7gKVOYTPFbJ0bBcuFwNgR5E?=
 =?us-ascii?Q?YdVEsUv5PXjtx5ETs1pFzPRPaKdWCf9Qg1xX/BUp2lUBIHh/AoVtnIBVt/fp?=
 =?us-ascii?Q?tqVtMfAtra/biA0yMYF1h1arZf4Vbqz2dyg4YP7ffD1S60EeLfvcv9QwjuR0?=
 =?us-ascii?Q?AwacQhRpe0gF4wxI2VCCpggAsAKgbPjkTOtLyqWmRL69kjbZHs8DGBJhKEsH?=
 =?us-ascii?Q?AFng39mhsPqWFEyZ9+HKUfFUw+vXHHtQ984ilniu+ylUmCc7tLbdAZohuBEz?=
 =?us-ascii?Q?72F5PD8oknMsLvUPcWJI3mYAqR8qSL7nLIdcyA5c7aMpgLTIRmdJvfZs3Rh+?=
 =?us-ascii?Q?bHSkBclb2BZPVrd0KfxcolJEH5ik6rPiRjEGEqeu7k7ttwci2+xfX1jHZG5m?=
 =?us-ascii?Q?Ruxj/T3UDzGciJUDzjS+qTI2gT/s7aF8i41cZRahVRxi+izpDY30DHeUbrYP?=
 =?us-ascii?Q?7QtwI0Qre5+uPOIDHoNCDXHLMmM37UqokfKFZAcYX4ZoxQPYFT28e1yl7XVn?=
 =?us-ascii?Q?3/ZRpPzPsyhFV3N0bz6QWrVhxyRNmDpN38c2dZhZx/ygsmdhpIiOtUxWejCp?=
 =?us-ascii?Q?gdXbaZCJqq61F2x47m8xa2OB6i1f+TiKjzsHOy8Jqrgg4LJVkkQpKbwj7LAa?=
 =?us-ascii?Q?00uPIf9vGQONlzR3lMV6XNlMhFCs9wqzrjeHu1DFsorlB7q8e53QmMJKR5aA?=
 =?us-ascii?Q?rkTtjd4HMtV3JF7Hfl1eqNO9xFPN6TrOwgxhxNZ6d9JKZWhyfWWht3XQ8Vv1?=
 =?us-ascii?Q?lVW7qo5YadsGhfhG91JOPKhTuTcEqsoNTAVv3y92+t0BOA+sgd7HXq24LpPI?=
 =?us-ascii?Q?ZSTETiIf/+hY/Tm1pcNFSiCMqaCmPar1sVmpTZ0uE8SsAJLL+DwMtZ9HR9ZV?=
 =?us-ascii?Q?Y3ONpa7Q841PnjCz8GmhXXTilSA8mkbMZ10Wy2STDAVoSYn4mrB11SYFPEVw?=
 =?us-ascii?Q?jNZjKA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	vM1kVNa0d2e2KKP4TljGM0BTBYt02CPswrmK6qUGAbXOUo86XSt0ZH/5IXA6fng4GFq3iY4kKclGyUHUpz4cHY5ByAHIxcSB2lWsIxnTjH1/5mydoPKW11Apndd8DPQL5iTK9fSP1x97Hd0XtcHFJqgsZCDjIa6PtUgf8wBnwebrDZH4crvwnUkdRF6uQZgt56Juvn+QPkit+gjNyip0fTGuwP/+yI5GUo9/8za7oaniuUXb3SwGm8m05Nvk0FXxmyie+4FA+LYVmbL955ZIHrdyKjVgwGCS2eGhJcxp+idg+/45C7ysV3qCZrmoltpbRo+5IheytfdbZe2LUN+DTOD0ZldlWttS1SLsIyAaBCKlFgcFNkLUwEPBN6L36h3NanSXgwykTMKSB5MwNBmbU2NBhr6WiKiZ+pxlGhHWuUpYmyCjpjt5DB2b5bbpFPhs
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 21:44:37.9628
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e9aa049-e063-4e83-6004-08de6a7feba9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000397B2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6490
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 12 Feb 2026 21:44:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17102

Lock the scarthgap ltp-ddt version down to a fixed branch.  The master
branch will continue to be updated with changes that are not compatible
with 6.12, but scarthgap will fork from here.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250930.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250930.bb b=
/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250930.bb
index ba6353f3..ef54e55d 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250930.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20250930.bb
@@ -15,7 +15,7 @@ PR =3D "r1"
 PV:append =3D "+git"
=20
 SRCREV =3D "009ab8e98152dcc4ee070e066882eda6b42f720c"
-BRANCH ?=3D "master"
+BRANCH ?=3D "ti-ltp-ddt_20260212"
=20
 SRC_URI:remove =3D "git://github.com/linux-test-project/ltp.git;branch=3Dm=
aster;protocol=3Dhttps"
 SRC_URI:prepend =3D "git://git.ti.com/git/test-automation/ltp-ddt.git;prot=
ocol=3Dhttps;branch=3D${BRANCH} "
--=20
2.43.0


