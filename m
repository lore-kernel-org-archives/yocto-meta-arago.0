Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0E65CD4F4A
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 21:28:26 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8171.1779139698184188798
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 18 May 2026 14:28:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=sYmufWuc;
 spf=pass (domain: list.ti.com, ip: 52.101.193.28, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d8afDSua6OkadXqq1AZsYyu0dasUYi17LjQ6CfjT/TscAMTxzVozI5k7klJBtE9rIczGN5CNGXsnzfjsZuFTKOlOBI1qSFCVsaCO/zB2iaPURRIJHH7hWwJ+4WXN17YhAwpgjMufOgtG/pm13NYmNDBw4ztoseAiFVxxHW9tyED2KoTkQaHTAte9+njxAPgjf2j2tpLyxUgw2wSGendy/Am2OlDRVkgYkMHc6YLc5A8Qoc3jKVFnzK3VpmPcO6zAgwHtIDttjeJge+MdNYKSdO7jJSWaiJ2XiU2VfebO+AO+zdnJfElrIemrbIGp0edv+jTtPNE6l0pqVazIDJYs/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WR/Id/C21K+yOolDvkOg4MSWf8vaN5u7O0W/me6gvaM=;
 b=acbHXYGxKRBmi6RwZLlXsyTovzxaDAoGKqaqMxr+tKy4UmSulInGyxKnZzp5n2GGVIPk9qdx0r5E0equ9YYnlX5TEnJMguk/DLe7qHcMeuHQWOYndP0EOJF6XfBgkHqWFF/Tt/9guzkd2XoV5LErbmoK08QFitm98MSN+MXRvN7llWu8QUTLATgRJNFLMuVzdpPITw/keGZQsxXvLNxhEZQjXhQb0k2yeKXOfE86UHqJ45zY4y4SiQVn+ieK5uHuSIMkEIxd10XolvkXmJmrqWSVDFFv7kDYpdEgs7FM/t9XhcA1d9SxoYAzhVBDmEkgpgu11Gr/3xug1XrU4aPcCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WR/Id/C21K+yOolDvkOg4MSWf8vaN5u7O0W/me6gvaM=;
 b=sYmufWucD5zmc1Ws+7IJ9eDe1QJDjVQ+z3BxFF9iDjGT22g5vbcRCGUZDaDEv3+gHLSV9KKBHtQmgsfySnjtErcjI2R0m5oG+P0yGUyZwnJaUIktXZRKk+JwKNlVt/gxkMcWnDWqaWMepLAmWc5REC1gG+HKs5T/82zOq6Ox2b3chYpCXgB71Ptjp9Ug0HYNfXdTycSja1HGzs0ChSEOQ0uLuGAXFzonn/+ki4UIA7N5Jns93c78G3hK2i3A+8e1eUH2YFhsL2d2DhQhRiWfKtQv3M4xSU12z9RhNvcpo8yU/X4nvd/OYSDJ+isFd0jQGoOboAz6AAdEe5abR34jJA==
Received: from BN0PR03CA0001.namprd03.prod.outlook.com (2603:10b6:408:e6::6)
 by CH3PR10MB7209.namprd10.prod.outlook.com (2603:10b6:610:123::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 21:28:14 +0000
Received: from BN1PEPF00005FFF.namprd05.prod.outlook.com
 (2603:10b6:408:e6:cafe::c9) by BN0PR03CA0001.outlook.office365.com
 (2603:10b6:408:e6::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.22 via Frontend Transport; Mon, 18
 May 2026 21:28:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN1PEPF00005FFF.mail.protection.outlook.com (10.167.243.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Mon, 18 May 2026 21:28:14 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 18 May
 2026 16:28:11 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 18 May
 2026 16:28:10 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 18 May 2026 16:28:10 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64ILSA6s2132678;
	Mon, 18 May 2026 16:28:10 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id A79A29ACF4; Mon, 18 May 2026 16:28:10 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Thorsten Lannynd <t-lannynd@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>,
	<detheridge@ti.com>, <b-brnich@ti.com>, <a-christidis@ti.com>
Subject: Re: [meta-arago][master/wrynose][PATCH] chromium: Upgrade to v148.0.7778.167
Date: Mon, 18 May 2026 16:28:10 -0500
Message-ID: <20260518212810.2959454-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260518210746.1595618-1-t-lannynd@ti.com>
References: <20260518210746.1595618-1-t-lannynd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFF:EE_|CH3PR10MB7209:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cda6d88-0c4a-48e1-797c-08deb5245eaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	M3Cwr0uEk5tTZ4PGDrA3fDnvLGqokYeGviyt+1x+j2rzkDB73yR52lw+BcuDhx+XXL/k8tfKAmIuQCauxyYQ7kWgrkjczDUhFmzAZ4YAwcPtdm6yojltAtq+B5FxAe9E7eyzDggtXSBdD1X4iIIL7HNv3JJvMuIijwivauTyEvS87FOPSUvry7Qvzif4CoIZ6YxDVM7h6lml0th77IvVT6uS4B300RsjQpkRXP0zmd4A1X4dwKYrr4tzl2jXvaEXCy0BhpIYjQ9UiztLkfPklRrhBTabTj6b9i92oH2Dx26+io9Eqtx1DNmgDkHzRiWSMBPzVAS8viDzzFwxVzkDeNRCA3BC7ocMgAk23DxYSxb21B3jnyceB9FFmQkxU1tAn2jTVgtsI0GXRfAo1vPE9wW6SfzMEXOndCtrPu1O220oUaXIm2p56twQSEUlA9yZys4ggrgeXvBBpYwkIul1k1Wmlt0krOlH9xgA0xoLpbRQ2cOtZD8cyHBqY2wzybWcKcMNeKWRn2I+09HknPjwcPWf50wauE41gprU/JR8aMJisz/lYcq+y2S7R+KY4fkSB9JovALHdFmXnA8tUfjZQVLFzeTS8G0U1h5GfCmWHLufzT9otBs1GJPT1QXHyrzEbPASIoO86lIdUzUj+4YDYsJmX+IBH/xQWOP6w+qgP+9Yb+GygpFMAD5UtvjYGDohEX0Yv3Pj9XmB1KG8xMJnlYf0nhZUfjhTop5sGI5XHUQ=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	b5F49ryOuuMtPxX26NUhepCqNZhXThOGOuHbsaWNLlcEmqY/I0zqhHe5+Lvb7vLH/ckVT/noGfw19wMt0BLBkO7owQ3DB2sk04QmxN2AnWZ3zg9roZ8keDnf2xwivnR0yTgQWbw7bsqk4bVvGfBHmdaYfZsFgpFe25Ppj0r7Dz9h/3cJeJEHWBBLeIRsxmd/Wl8Envfv1CGeWoMh1nFBlCmhU8UYhSGu6eyVLdn2AGzLzmIRKUnPaod/hqDmucymD4x0vylT3X/UgS6jdjr9ywjcrOE436z54USdoOPd4P1N3VDmxQbcVHsX1GToBycOIV4pHK/CNvt52zPpbsylb+MIc0CRwscwZxVB2vE/5LWdjJhX3nCwgnxKe5BqRfcHJ52dPeCLbQzghfEFMnv4mllsrD1y9gknQUIy/W3MwEiKPmavAtmwMV5PpFjoshDJ
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 21:28:14.4022
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cda6d88-0c4a-48e1-797c-08deb5245eaf
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00005FFF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7209
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 18 May 2026 21:28:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17530

meta-arago / na / 20260518210746.1595618-1-t-lannynd

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
- Patch Series: [meta-arago][master/wrynose][PATCH] chromium: Upgrade to v1=
48.0.7778.167
- Submitter: From: Thorsten Lannynd <t-lannynd@ti.com>
- Date: Date: Mon, 18 May 2026 16:07:46 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 42feae91b0b45987f4a0b9f7e7a8fd072=
824b411

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Thorsten Lannynd <t-lannynd@ti.com>
- Commit Subject: open62541: Update for v1.5.4
- Commit SHA: 494ee5ba207496a4b355aeb84b014ee326e9f5b4

Patches
----------------------------------------
All patches applied

wrynose
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][master/wrynose][PATCH] chromium: Upgrade to v1=
48.0.7778.167
- Submitter: From: Thorsten Lannynd <t-lannynd@ti.com>
- Date: Date: Mon, 18 May 2026 16:07:46 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 42feae91b0b45987f4a0b9f7e7a8fd072=
824b411

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: wrynose-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: meta-arago-test: Moved to meta-ti/meta-ti-test
- Commit SHA: e9bf10c0e71b08fe827200af575f9c9749be7bc2

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

wrynose
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

wrynose - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




