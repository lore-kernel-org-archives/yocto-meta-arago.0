Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73F87CF58FA
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 21:02:41 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.20])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17768.1763586151039212594
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 13:02:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=Y0Fht//l;
 spf=pass (domain: list.ti.com, ip: 52.101.193.20, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HNdDJOnJt1ZXvj8fI6avT8jQ+T1sSCKiByQl72RyMMyHj45iaJiZnEzg/EZw2AneIpcFAOLlpTQwhasoGYxAOXuvPzGPE2F0Xq5hfmmtb67LP0OQ7z+szh4g44wjLdWc5IUe5s4oULYm1LqRcNXA+0bhc21FXyyF4xsmLuVMhv/wrrzx/YAiWloOUkVHsLzqfmr1etwj31F6r+gMHmlXCLyZILtZcrAfyCib62vijeHtJBv1zeWNeaUSh9vS6UKXrxp7qcvbug/1OQtGhlyo6AIxDUFut4L7dVcsZPapurtlzsotsq6/54SRtT67r2U/we8T329KGi+XFAexgVN0cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TfztxTpvsz0j0tl/LdnOta2EqmP5MvgraEkfncAMJdE=;
 b=iTlgfTcHQx6Qv2MdwwUESrQ1bdZNFjQc3nKZWELr4XS6e1yVRLf43/H1EoJD69lUpweutMOZuV4SyoshOQ7cI0C/rNEQvcmrLK/PfXjPd0GfIwfwjnTTaolxAg5xUOBoByVUZ9iky5PQuKjhcPelrXlB6na45tlPuDx0WUN4L0gvAvJpFujsTe+YbgAW0VynlgfKJsirJlg7YaXewH9zu0Pq5KvrrFz2GZmk8oIsuLn+U/j/bMBtRcriHccoJJnGm7zv4HZhx2F1brluCYDykqu5OyuQv94ZlpBZsfbgabLT2EaL+L0xPaZQ1MNEjsGYDy3g7j17ESMDTNeBVJ1HBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TfztxTpvsz0j0tl/LdnOta2EqmP5MvgraEkfncAMJdE=;
 b=Y0Fht//l1bX3kEO30LbgBZnN8yBZ0qwxsJ25Mchp5GqmqwbB1/m0yIvLcGQiaaBrKK2SGVgDxYpgqZsyI/t5QEz2Tg4L0P18riw9t/7MZfHZzxrQIy37x3DvW5Xvy5gKD1gKfaZWQnq3cwHKI2r9oXM7sytQyTyyMSeBHb3J+JVwReuaZEktH20G9BrEbil7OID24qMeqUVZpYjXhfCCBbiLK4ZssgyAs7JAHNNTdSc4/iw9WVUcO21ge382CYqBCmDqkium8RjnGROqtgF17fuvqmwaoQiR+p3x1ciYiyxO1RUzb9O+TvVz+Ux+pgoiFnTKFPEAMhhB8D5PX2arCg==
Received: from SJ0PR05CA0048.namprd05.prod.outlook.com (2603:10b6:a03:33f::23)
 by BLAPR10MB5122.namprd10.prod.outlook.com (2603:10b6:208:328::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 21:02:28 +0000
Received: from SJ1PEPF000023CB.namprd02.prod.outlook.com
 (2603:10b6:a03:33f:cafe::b8) by SJ0PR05CA0048.outlook.office365.com
 (2603:10b6:a03:33f::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 21:02:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF000023CB.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 21:02:25 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 15:02:16 -0600
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 15:02:16 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 19 Nov 2025 15:02:16 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AJL2GsM2016934;
	Wed, 19 Nov 2025 15:02:16 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 743329ACF4; Wed, 19 Nov 2025 15:02:16 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Randolph Sapp <rs@ti.com>
CC: <reatmon@ti.com>, <denis@denix.org>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] udev-aragoconf: remove touchscreen related sections
Date: Wed, 19 Nov 2025 15:02:16 -0600
Message-ID: <20251119210216.2482455-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251119204324.367838-1-rs@ti.com>
References: <20251119204324.367838-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CB:EE_|BLAPR10MB5122:EE_
X-MS-Office365-Filtering-Correlation-Id: aa5f0d49-d21a-469e-832d-08de27aef165
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?bJ2eKqAmR0QPDGlQwqUkdoS85FFKLsk1ITl9Sj0LYWc+Ls87y8D30sYALBL8?=
 =?us-ascii?Q?h5eROFpifdGNE2+EyAXiZ3XBFK2/tI1PsZczi9OBpjT07JgG3cBc4leI9ss0?=
 =?us-ascii?Q?Mmv1jHcopviTJaaIIXlhz7xtkYz/y63gZ/pqW3bODUMNwrleaSlzUH2yTCEn?=
 =?us-ascii?Q?QCsqRxFbEag5Ij7GSfmnAGHsF1q8FKV+ZpS/wPGWSzFAD+91lAUw5MBCyTD3?=
 =?us-ascii?Q?05Rh0BWA2j18GWLVo7loFrlRQDSXZOb//J77Dh/yWHnm1323usghxNUHwzow?=
 =?us-ascii?Q?cLLNKdLHf1sOFyRh23YHAdJpzfR8KRdn/sQzLTV11c7T0l00c41fFJDgTmow?=
 =?us-ascii?Q?WQmrxPeICae/MkK8gS+WUIL6z5R4Sw2HSmhx3a8ZAwOGeLnHGo3w2ta3Q6cg?=
 =?us-ascii?Q?tbmLDJd4smBbuIWLtvr4Yg7XUqqhTY5UMwf4jKuTP1s4Y76IPxTlBbTmkbxn?=
 =?us-ascii?Q?yMrt4O5sOMzURqUXUv5uF9aaUsMLOZt6frPdeh7KlWdAfZQgtdMzLI1r5UW/?=
 =?us-ascii?Q?CjOuvXtwZKTDhNaWwDy7wmuoAHGo8YbdePxJEfQ1meVK+ceGz8uzBK7IWG26?=
 =?us-ascii?Q?s9gZuFxS4PE/kigZd5XcBJIizeBk/b2Piqh4uptUT8O7UwjNniE5Mi8d7p9l?=
 =?us-ascii?Q?UI6btuHsOmKgPhfaOz1q76UIyPkFOS73jWv+B36uqowfkAs4RMElA8elKJts?=
 =?us-ascii?Q?hyEpwaymmUeyRkdCVhax9H/3u7FCGfHsLJlxzL8WsuGOpLVaTaLikhSsGFjt?=
 =?us-ascii?Q?LNoTfbXh1RhXe8rWHtyAYrXDro6TeOpQLXuozA4WodiyhKurapPjHYmVLwLm?=
 =?us-ascii?Q?zAeuLAX7iocMUhY5+1xrosmU5ypOCIxz4FX93WgioDryKmw345fY3dbtO/gu?=
 =?us-ascii?Q?3hU6woHeJWM7PF8UQvjT86ooLXu14c5Q10Ayqi8kxMbmMWE3Vnw367n3Adu8?=
 =?us-ascii?Q?dRyy6XPO0guyKYEDQTSgFzj4R0hOhq8U0NesRjULWw9d0/Us3019XYVg+tYP?=
 =?us-ascii?Q?al6SmNeQhFV1DBufP2zEt4WG/T+4u+0x93geqHNTV0u7mGJdTMtVUxETfOsu?=
 =?us-ascii?Q?UgH7jRNYiXaTu3DUYQzXvuXIJ9V1DInDpXgrtml6ltEFqZW64fxsMjYS8/2m?=
 =?us-ascii?Q?x+IyvekSkooagXlC4v/Q3XCuNaS3wg5Ixwc80zZ/54rFXyNY9YzCJ/L3j7iL?=
 =?us-ascii?Q?rrwMP4UWuH1Q20vIt9Vb3uqRVVx64z5uOGZkPtxQ6luj2nZXDpcraso5DsBO?=
 =?us-ascii?Q?ZkAckgUrH/phKMOyvkebF6fZ7hpL4ErZ0ll/J/qqIQaoPVR9LfeirQe8aCzb?=
 =?us-ascii?Q?DAq0MpoUXfvbeAxUIkQYuByQYJF9MNbkN5xygmGmNzsQWwJBh/KysMzXwd43?=
 =?us-ascii?Q?Kp9o5O9Qp3KAeekJsfpcZNrePwyWKL/kP9XWa1UxVPKkwVEQnsMIsQPfzNzY?=
 =?us-ascii?Q?JsKyApsODRNEIRFJ+nYXu988suc4PoHo1TpcBBkZ120+TjEwCEp/3wFzdNoM?=
 =?us-ascii?Q?qvoiCCFTwJQSJvdqPY4fmoncTb9zevNC/+iL5xvz5UvvnVqcVYtKS5l3dYcJ?=
 =?us-ascii?Q?gcK+GreScgLMcDi5poU=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(61400799027);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 21:02:25.9098
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa5f0d49-d21a-469e-832d-08de27aef165
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023CB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5122
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 19 Nov 2025 21:02:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16807

meta-arago / na / 20251119204324.367838-1-rs

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
WARN - [meta-arago][master][PATCH] udev-aragoconf: remove touchscreen relat=
ed sections
    WARN: Commit message does not include file/recipe name: udev-aragoconf:=
 remove touchscreen related sections. (COMMIT-MESSAGE-2)
        patch
   =20
    WARN: Commit message should not include directory path to recipe: udev-=
aragoconf: remove touchscreen related sections.
              udev-aragoconf: (COMMIT-MESSAGE-3)
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
- Patch Series: [meta-arago][master][PATCH] udev-aragoconf: remove touchscr=
een related sections
- Submitter: From: <rs@ti.com>
From: Randolph Sapp <rs@ti.com>
- Date: Date: Wed, 19 Nov 2025 14:43:24 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 88fd09be1a17f1330ffe08c57f1ac2176=
843d6cb

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: check_yocto_rules: Add new PV-1 entries
- Commit SHA: 035b26e9403d397b69c03c644b27d49067e15ce0

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




