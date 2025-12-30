Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3661E95A8D
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 13:03:31 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.15])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.63728.1767099807089707853
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 30 Dec 2025 05:03:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=eT6tNhFB;
 spf=pass (domain: list.ti.com, ip: 40.93.196.15, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TbJ9AsDzgISCWo7eU/GS0c5l7fDMJiPYuRPylq3z3uRKEhig+NgSfWzsNHBTf6TfVfx7cnEWD7/ZY/52CRFG+/DKFpDwVQBLeLnPAbRr1riWD6HNYw3wJpK+5j8IDjfk1F7WK1vZbhGzIdH7WApss/8wCKEyYRnac7IYvdN0xF28VHeeUtX9URjxnUkpQclAQzFvNdLKcEthPemNum0tzwhQZXDUynVyQTJUSihPNx+na1FvCcxU3Q63MzNhzGmBqThZKsCjDNvDaouIE8uxhtO8sGaA21w9O7dMsbNixBM9Lrg8Iqmn5d3fm+dqIpKABlC7XuBDgIsRjVI9BJXDnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ePkU4oY4Z57WzZLuWDwFongBnNGT1+BmTJQBjACu3lI=;
 b=h8cjQyBSpt1+c9Sw7B8M43/DKI6vzxBLBbQYxx1tN70CF8iLWy3RJbogPG9ywn6sRw5YteLCyp+hVK26ltEEUHZbtryfTbVQ5QXV3cmQ6v5JqlyARd9RT+yU1ygE1cpwNMuYBIurn5bGio985P11q8HCP2RgwQvked9/0eBRPqIQn1dCgXrLg8EtGcMMwPNgXhDzc1e0IFVq3OAUdJsCq4KFgbXF4JrbKYOqbNvdXnJuBGnYrETb92WfYnEP8t3AgW0Uy6tQValERw6rNYXe9LQp6YXGVkVd0b2jzj5wttTbb0D6YsS/mwkpARlJcjRbRNASpzb0aIoWaWuRqy3idw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePkU4oY4Z57WzZLuWDwFongBnNGT1+BmTJQBjACu3lI=;
 b=eT6tNhFBvAByjEmxV79Fe8y8SnTdPpIACHYw5nMf6Qj5am2ofuOu9tg7MIaSzbtl5wv1imgBoAUa1t88r1BQXEArf0w7wODTOxI+RWjX9Q/9oeNJd0vN7e2SLDwc1i7WfmqXYxlvPP822t7vQVgeIBWk/7p8PdL6Zf2QJLYuDNJvx3xbct22MnwTG3GOIWwnQGfdGlhddbpBRQC/bz5f4iyZan6ll5tqkaUlYjkWyzgK4SzknqEuSO6JftbJFV1nx24KAhlcxMBQZ7jSjW8wbPwjLIF6rbWXEoiXAYzkM88IgAHM3Z+DSgoQvy8b/+7rbmQP6jYjORJzOeqEzfyOyQ==
Received: from BL1PR13CA0101.namprd13.prod.outlook.com (2603:10b6:208:2b9::16)
 by IA4PR10MB8609.namprd10.prod.outlook.com (2603:10b6:208:560::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Tue, 30 Dec
 2025 13:03:24 +0000
Received: from BL6PEPF0001AB4C.namprd04.prod.outlook.com
 (2603:10b6:208:2b9:cafe::84) by BL1PR13CA0101.outlook.office365.com
 (2603:10b6:208:2b9::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Tue,
 30 Dec 2025 13:02:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL6PEPF0001AB4C.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Tue, 30 Dec 2025 13:03:23 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 07:03:15 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 07:03:15 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Dec 2025 07:03:15 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BUD3FJN295750;
	Tue, 30 Dec 2025 07:03:15 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 7DD7F9ACF4; Tue, 30 Dec 2025 07:03:15 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Moteen Shah <m-shah@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <c-shilwant@ti.com>,
	<reatmon@ti.com>, <a-limaye@ti.com>, <gehariprasath@ti.com>,
	<praneeth@ti.com>, <denys@konsulko.com>, <u-kumar1@ti.com>
Subject: Re: [master][PATCH v2] cifs-utils: Remove bbappend and patches
Date: Tue, 30 Dec 2025 07:03:15 -0600
Message-ID: <20251230130315.3590953-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251230123734.179359-1-m-shah@ti.com>
References: <20251230123734.179359-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4C:EE_|IA4PR10MB8609:EE_
X-MS-Office365-Filtering-Correlation-Id: 27333ff5-c311-47aa-b2c6-08de47a3d07e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?1697hvMSqJu9ztaj8dQ/ZMnn2oUy7RJXtQ/5fsAzBb2Nf8Kj74JoUakLwb15?=
 =?us-ascii?Q?zNF5nW4vl5DjTZX4FmeoSPoy/3xIq9bj4jVb5zpg9/XRYzL+cqjnIQsRbbvO?=
 =?us-ascii?Q?MYF0n0Nj8WBYzxjbx1qYI7O5cVxDX1275wcSxQvJ6vpli7XYuQPnwBhRu57H?=
 =?us-ascii?Q?CHe90rZcKgG618MB2AWwomY2AS1eEst+odB4y4SPh4ZLecEKKbGFihpz5VnW?=
 =?us-ascii?Q?tgFqeMCeOqp7Tk4MPYsENcjc/PxEH5Ww2sSA9UgRJMBlRO6WeXOC4H0CK/53?=
 =?us-ascii?Q?5HWspuX/SoAdBF3q37l+AHvWLD5XOilW8/NByFsviE/WGlI+DmwIPaYz6yI3?=
 =?us-ascii?Q?ojJNGxZwEAXiubv33ox3fWisBTESxEZwEzilc0zJ7g8fS6vBTV1b9hjSri+X?=
 =?us-ascii?Q?gkep5V2dvgSooK7aHZBGRvAvWr+FIkjjFDLOIb/70obw+66tCU6Gn5Y6FU08?=
 =?us-ascii?Q?KR4w+Mg+3JXow6o+8FOHqlnEtjj57FjhRSgZxN8UL0PyLKzBdrbKNxBiSpQc?=
 =?us-ascii?Q?KuJ2MiMBh0QWEuh0vgKCkOGhnxgm36Knac7DzDibtH0WEIceuit6K2u8N3Id?=
 =?us-ascii?Q?4ew1ivim16ADmlZWfNQ6sx36Oa1I4ad9hwszlJF4GyWYcS1IkmWVHw7wb1MC?=
 =?us-ascii?Q?VmucQhfuHII59elw9QDve6YlE0pISTUsryyho9cN7SNaPcW3V5N/7FmFIScY?=
 =?us-ascii?Q?Aoujc0U0thgvonbjTTy3o8j/tHV/JvzhNbalYLE4b8vKaPu8t0f8bdUQVcNp?=
 =?us-ascii?Q?CPW0rC5eFwXNyLRY54ClRmsTFvnkDsJqPKIzMQTSAW4LDAOvTjCCKYrAyGV6?=
 =?us-ascii?Q?gHtInRwO8XX4HyeIbyBn4H3O3k49XYgWbdnsh9GWcmKOnsxBYS8WtY7FSUmi?=
 =?us-ascii?Q?ULgV5yd/p1t13Br9SI5ZjYv2SvHH86enVFahvnYNbYIOK25aRhFGC0g4oQFA?=
 =?us-ascii?Q?/sYwbOFphyiomT9PHiqAyINth7od1o5aXCMwJNelqu25IpjWRi/YQGUE9rZ5?=
 =?us-ascii?Q?0E8HBZkl7ciaWBh9RLU3jZKw4osTL5mt8VVzlrWeLAMmLHdJkQcp8RsaKPbN?=
 =?us-ascii?Q?dcTHdl0sY78Pj/Gf0Yz4dfz+t1F6FgTvpxOv2vnKBxoGGHt0/8To+F31m3mc?=
 =?us-ascii?Q?azoxEhfsSQw/WGYN6dWm7RDv/zdOuWaB5dUeVInl6TCCfgdTg7oJVxVEwXjw?=
 =?us-ascii?Q?p3KSFMDplIud5pwuS1bgurGxa2Rfw5Chrc1VIwYpVFLLDlT8Itys/4fXqlwd?=
 =?us-ascii?Q?KFYnsRqf4a4aEuxyBtEgjI6Y6aV2EmmZ85M1ImpriPiGpg/AmwX37JrLuKzV?=
 =?us-ascii?Q?vbOY4N2y+AjewqTz++PvALR8UfPxffUxr/IaFNYwCugKOs6Y7411ZNgwAwHv?=
 =?us-ascii?Q?FeIjxw1Kg/iqbL/mqaQjUZPEGaKrlyHXkHyf9kd8kxcPVEajmiYtjJH6zE53?=
 =?us-ascii?Q?Bc5Ce9pa71Obl75z9TorVxvEPfFD90L47GWjlOsKmhnBiwQRTLlKruW5EtFx?=
 =?us-ascii?Q?Fvn3guYHHZ/QZILK7Mm8PLR8fbWKRbSRDUB9VyDCi1Ywo3RJE3LQKC3Qn2Zb?=
 =?us-ascii?Q?fFf/l8522SMW+gi4brU=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 13:03:23.5156
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27333ff5-c311-47aa-b2c6-08de47a3d07e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB4C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8609
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 30 Dec 2025 13:03:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16907

meta-arago / na / 20251230123734.179359-1-m-shah

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
WARN - [master][PATCH v2] cifs-utils: Remove bbappend and patches
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887



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
- Patch Series: [master][PATCH v2] cifs-utils: Remove bbappend and patches
- Submitter: From: Moteen Shah <m-shah@ti.com>
-From: Daniel Parks <danielrparks@ti.com>
- Date: Date: Tue, 30 Dec 2025 18:07:34 +0530
-Date: Fri, 3 Jun 2022 15:34:59 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 61d13be83a22289aa278c49a5e7322dc5=
f2083cc

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202512191404
- Commit SHA: c38be2eb3b16b176476f04572877129f82a0dff4

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




