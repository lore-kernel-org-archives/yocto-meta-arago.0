Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55A96F99C68
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 21:08:47 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.24])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55597.1776460117804658068
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 17 Apr 2026 14:08:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=sM2wJ5Dm;
 spf=pass (domain: list.ti.com, ip: 52.101.62.24, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JtWus9SZ4qL1ihlo9/GP6kwQ2WU39DwPmj3UletPCJcI4SZ/5fCesQlnOifWEgGx/GaL5uqWpqXELc0FblQWiNOA5TnHYRxekRagiIpAjOUX7+McrO5yhI0xr/5vLgT4+BZd9QtVpWOMTXarX5WAzPkMSQk6by0AuS6nj/XQRhbdCZstUAfGAoYaM5mkApsMhnbfhl70ddpLQBPw+Nwkeeeo552lEMjlSu6FJ4KynDLv/999AH/lvQthB7O77+quJ29JqjW/HpLYEaV9wMZB3DjPJXMaCw4uIxMtsjuQNtnVwg1UP31GzwZ8H4PdO1GWW3O87Tv1jaN81tfhaXRY1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KCyBJv/5UUsza5Nwjwc4O+1/GM3fBC0rg3eh7P35RVM=;
 b=aSG/BE9ytXOmhbeZEB11Hj/i/c76uQ5BsVh97rVt+nAbNGVy+Biy5tPL3fpwoBXbdGyEt8Nowrzx71RA8c/Fx32NaMffwz0/9XlKWgo/qQrp6jhMKaj7yU0fH82Y7mvh/5bzZhJxgiZyDc9n1+MuxuF8O7Qs58KsGH26XcSviSyYlx9XfF4zYM/DLnJbp676z7+CkM5Xa1zAIbt9nXtPIJpO+nXPJtOlZL0Uq3UwbfG+YTEwDj/nR9z1EBxySyP83iB164ZArbg00YIpAXzhkR1/t7Jkzj2cYFDI+T55FZYBZLkFAtbkg6S9xXW+LwhkFU5CjVr+igUq0Kn2tA2S1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KCyBJv/5UUsza5Nwjwc4O+1/GM3fBC0rg3eh7P35RVM=;
 b=sM2wJ5DmmXbnY4jCpnAmQ/Di7+EHHkBgJr5+FGX0DPvdT9Aq4D4wFAfQiE6IsBBEoOcnoD8aW5xM+NHYm3suGkKJDfTwJQfTADBJDMOCDOwkTaDM/p+2qFHDPvkOxh2udGXyg9wR2lJW/3tLGdhZS1vkPSkYDxOYSofnBlOuDgunwonA4MxRiIzu1L/Mm+ZZNCYVoC7brYpwC+RdhlKeZa0YVIUZ8lSPhNWCqbcpI9S7JssrBLzPKc3+N+DM0z5+tZZlH5tZpr1o84H9p9Vc7fI7AqRZjFrwl3rZ8kVvOXPGSiyoM4X32DdFfk/vJpAnBYesaxob7wQDUp2uWOr8WA==
Received: from BL1PR13CA0219.namprd13.prod.outlook.com (2603:10b6:208:2bf::14)
 by SJ0PR10MB4655.namprd10.prod.outlook.com (2603:10b6:a03:2df::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 21:08:35 +0000
Received: from MN1PEPF0000F0E2.namprd04.prod.outlook.com
 (2603:10b6:208:2bf:cafe::c4) by BL1PR13CA0219.outlook.office365.com
 (2603:10b6:208:2bf::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.52 via Frontend Transport; Fri,
 17 Apr 2026 21:08:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MN1PEPF0000F0E2.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 17 Apr 2026 21:08:34 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 17 Apr
 2026 16:08:34 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 17 Apr
 2026 16:08:33 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 17 Apr 2026 16:08:33 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63HL8XOb2760160;
	Fri, 17 Apr 2026 16:08:33 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id E16789ACF4; Fri, 17 Apr 2026 16:08:33 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] arago: Bump DISTRO_VERSION
Date: Fri, 17 Apr 2026 16:08:33 -0500
Message-ID: <20260417210833.1616394-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260417204312.2610561-1-reatmon@ti.com>
References: <20260417204312.2610561-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E2:EE_|SJ0PR10MB4655:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cf69e2b-9c02-4dcb-9f0f-08de9cc57cb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	JO08PNBcGnCscOtuVfDpdTYGmiu3q6D5avUjytI+661pCt7alGqgEE3QcWYGemnMc9uPxdVCBwPy4G6H/obBTDRUiC3NsxvN1Q1HxYDfN/HUpdEFiFbPzSzDC0zojzvVWXR26+qG5UjXeL/VRfOiHk43XRSZxU3uXDntmz5va/krnYVdvN+U3kMt1FSh2bDZi60azk9oHbv+ffivjmsYRnil1ujNP2DrWDay0/b7wwAFG/zGtpnOwZv2hd3vLI1uioAEwbA58Fo6T8Oo8K71XEHtxue204vc3xgnqqnez1pdwqGXW5J7IutG6de+8TzQYJYgnXIA/KTMY+ePEQyBxawSB1FAC21juKkLlsCdQbLZkxnGA63K4Lr/rPh/QBlvsJiuLuNSYee5N1dMO1c52MiEGBrA190HogEbR75VvaC5pW+vPgEHVginCL4jlB/addp8Ql4LofoXP2YycKlKzhmcSqpbUf5zSXNvl1Ya4jn4UUyZLV0vxptVW4AMTBOV7/OkbvuEPAOUgJVsSAXIOHPSx/Bc3Dc+TQzLCC7xC4M0FmRt2qgcbrGgy1rSnskmxO5GGjhHWG938FaStSiyBtFxKPRx+tAruzSBhLrES5ON0EVCIKFyT+62yNHBYKFRiiI+ed7qYrQVVvoOdRjjFLPzs6EqH1S9cnkeZ9BtmQRDmo3S4AdjGZjYUC0w4PQPnA0iq6RW29DF5p9Y4qhzJOU5sfCxK1y2CcX/b3+ydV4G49qSdGXiWPcV+xf28v15Xl53GXtjcm2RksrxwiKrUw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	LzQetZtPcxL1X+ya2BeiaiJLRnd/vy+ENKVA6MpoGnEHHE3chsDDBMwdeceyd+6qR88AbYCrP7QGCouX1Y2GPrD+lesqqWZsxgZTcZfrVJA6SoeUeqX+jtx/ornLyr+oSIA52rllWazz/ZoiZCtAZ9CNBrsv/WjzfrAcgANq9dmAHOK+p2BHPD+NEIM0nAZAFKfpHA/FZwpTlRFL5AUrL5l7H/QewU3m6KaqBNUEaYF99xkfttXlWun2MLv1DmmFmKgnRKrsv5k4zjIvhXMxQ4sArJEh8o08+EzY6vl99CW0poTktDbbH4GaTzFPi/M9OvLD7pwalu4yKsudhFeVU/fAeHkJsq2MBsXc+t3cjAvp5HVmiCcYyIbXKObyM6rInlnzVpKqn58kGdBa4R+Y07dqn8+VOB5gTSIvjnsFm4DQqKLNyZkdQMZ+lvnvEMAU
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 21:08:34.6403
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cf69e2b-9c02-4dcb-9f0f-08de9cc57cb0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000F0E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4655
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 17 Apr 2026 21:08:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17473

meta-arago / na / 20260417204312.2610561-1-reatmon

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
- Patch Series: [meta-arago][master][PATCH] arago: Bump DISTRO_VERSION
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Fri, 17 Apr 2026 15:43:12 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 206dcf15e7a688f97b53f78d0c6f924c6=
584dc1b

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: mesa-demos: Flip to a bbappend
- Commit SHA: 28bcbf56e5eee40784c817382942e728c48b2376

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




