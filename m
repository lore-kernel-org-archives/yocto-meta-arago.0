Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E60CB106ACE8
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 20:14:41 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com (BN8PR05CU002.outbound.protection.outlook.com [52.101.57.60])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2191.1773346479098119218
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 12 Mar 2026 13:14:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=YYLWAo6w;
 spf=pass (domain: list.ti.com, ip: 52.101.57.60, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AaZfjRSKgjDN0jXwZ8LamFv9TPKrvJ7YdTmUFR5TqoRM8zSg+wrjhfLA+KU1fTEHxKT3h+TjFqOzaahcqls6Rv8L6Co8YmUzfd0DJXbqGlhOAQ92dxgFxaDEnFkNtnXACXKQwqaydps1nOrH8E8eQNdgCsomym7jnBWddYjAmpIeZPlSqk5aE6tiNBbHPqk5/hC4lMKUL0oKIJDSasIieI/qvVcb1sdU36DlsdXRtTOCFtNgzsklPeSstWMcXafezaLMhSyl3zdjnzthnw05Lj9Cd0+DYA/T6zXMi6dkcdJdlv7Jr2gfzMgbUUA0uhpgQNyTFo2f753gOqNhV5miYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gMU5BD5kYZkOfIYStDFFn1eqk4d3twsvmdH7GBL4pJs=;
 b=t9ztTcHfCQNDZASJ65STVnL6CUrtkVYe8ou7Kj8rOUww7XCm+Ei4v5L+pfEYbf/qjbBRnoARtKC1G0ifg38CQ3kP9tT+kLyvZeFTvDXpaM1KEn3FTUbF7ky6PH66YrEeNJWD+6rtFIkJ7ER3ddTltec0rJpTrOGWADYYG/PF90DWuumCZd2mU2Xtm+GpOlLZwfJeO2sbIai5JT1cvzb/WR9ywD6yWCnX5dv4aexEmpXKWELX0KCuhINhle7WeYYO5NFIOzKfk/cV7mSaooIh4xnu8P54tQWlgfcSLszj1DDwrjx/A6S63mynjnEMYl2kVxaqfjBGKZU+Q1q4t/BXfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMU5BD5kYZkOfIYStDFFn1eqk4d3twsvmdH7GBL4pJs=;
 b=YYLWAo6wQRD8h8t5gGL77h/JD/hveiqWc+XNDIJz6UrbIIywClvcaLKuI1m2u6yV1mZHQI58wey03AQmpW2TDmr3D+Csw2iw+4SngX7ZrY3SUllvvbQsaOlKmh0SptbJc8iTfPZS6HNDRFEj49PtDwQbrDfKCaEzAKkrinsfbpSy4yqdCtVd7YWDkuFwTZLC//TiDdnRadTdKvCKl+GLiwirGjdPq4eRjOtmpjOkHqmrw4hznwp2K/f6sT8C5v/BhyrkOvbo+nldKrYIwLxoTfY09q5RbqrtWVcTBwNn0BirNQn7lRyv6WGMJZaMyIugZ4rkipSW3W4RF4YJQxa4tA==
Received: from BN8PR04CA0039.namprd04.prod.outlook.com (2603:10b6:408:d4::13)
 by SJ0PR10MB5582.namprd10.prod.outlook.com (2603:10b6:a03:3db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Thu, 12 Mar
 2026 20:14:36 +0000
Received: from BN2PEPF000055E1.namprd21.prod.outlook.com
 (2603:10b6:408:d4:cafe::8d) by BN8PR04CA0039.outlook.office365.com
 (2603:10b6:408:d4::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.27 via Frontend Transport; Thu,
 12 Mar 2026 20:14:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF000055E1.mail.protection.outlook.com (10.167.245.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.1 via Frontend Transport; Thu, 12 Mar 2026 20:14:33 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 15:14:33 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 15:14:32 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Mar 2026 15:14:32 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62CKEWmF1685537;
	Thu, 12 Mar 2026 15:14:32 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id D56A79ACF4; Thu, 12 Mar 2026 15:14:32 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Thorsten Lannynd <t-lannynd@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <detheridge@ti.com>,
	<b-brnich@ti.com>, <a-christidis@ti.com>
Subject: Re: [meta-arago][master][PATCH] chromium: Remove obsolete workarounds fixed upstream
Date: Thu, 12 Mar 2026 15:14:32 -0500
Message-ID: <20260312201432.3846174-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260312195401.1469941-1-t-lannynd@ti.com>
References: <20260312195401.1469941-1-t-lannynd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E1:EE_|SJ0PR10MB5582:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cf2a9c9-3e0e-4f58-2534-08de8073f9fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	KEdHk65+NG0IHehACht1FgTBIlgTi8qJ64lFJEvrDhQH00xOMtMQp+XWkrGaGWbFo8yNRRiwlJr06lVo8OzkoGvugDyu26XEslFoAee1gDf4B7NyZZIU2vSS5SVLouzJRfWiycsgnnDTDSPfigdUV5w833WNqFPL2Td80hh73Rpz+AvD1K10KlMu9xEZzXxAECby9E1xmk88bNyBhFjH/pbx1LDc8b3Uj9weBgcjlOA+jafHMM+V+3eI0n5+lT5A6XSpJMDwU6KO2Sf1C9ShDipxHy8sWa+J+rYZO+Gapov5OmrsY3N+rCTxAmPo6ahRaz6NPfIe5BtUwIB7Bmuj8F9HlA7glm45JqWg/mBSXzY9kSOgnClpsba9xNV7TyETHBfvgmSVNnN2+7Iw5ix3+u8PfArXTv0a5e80yWRtTvTmPFEAjXtGe7qkQY1YjQGAVIok+Qri2p+8iANdFyYIRzEpXfmIUimrs6oFdHsRnwQz6qYxI7nxqh4fm/A46SIrvecKgO6R3RglGE9WB53f3XhG1NqYNXtfkMhnhX2YtQGRVdli6upGlhk2VX5y/hsTSJsE1heD/VIHSFhtkTpp/DxE4LvDjfiuFD5ym+HjRJOvUSDJ8vUY5G8fyiYRCaST0ZMBs1vO2o+WODngivPxYVebCpNGp/ScJF9Vif2io9m+HAkdAO7zOQPADGSJJa8nbzfj8eqEMg4JQLKesEhf19ubbqwMcqXkWiYFhQnx1VJ+cf2vRuVPicp4Orsj9lbGSZlCUjd66QijEioLhTsXWw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	FE4/5D0Fg3lguSjOHSdLqoKLvUMsjIuucwyszHkNkR79o+VN0T7vCyomI/OzdxndGYZpwniKyXk+oH5GdU2ZSlTDtG5aVIsj3i4RHauxw4biF8Jk7i7zfCWRsmlOo+HB2r2MSXmi9B0eHKF4KewA2O0WrCQZjNMo01G9r8/lZZ0ABmbm6qTTJ4G/2nN4AHPOCaiN7AQYiQxu59IzYwdY8BN+QUX3DK7S44s55Ik1uAhdWUAY/LljwyQRz6d3eHZzFcgkPcBLoInR3Px88N2hpE8bqPMVaV2WiK5SfCg9Xs/nfsDYZ5zxxyWH6FIENk3092nSao0n1rdf8u0NvIrcpUsrVHd6GrLxkQukHnG42tclEAwx0C+tNlhXvV/lCAictAFmGkc1jTzaaIVAsTTxEwC2gECorIMt2Dl5agOkS7uAY6/J9zMjYFGhpLqNqZhF
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 20:14:33.5538
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cf2a9c9-3e0e-4f58-2534-08de8073f9fa
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000055E1.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5582
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 12 Mar 2026 20:14:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17330

meta-arago / na / 20260312195401.1469941-1-t-lannynd

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
- Patch Series: [meta-arago][master][PATCH] chromium: Remove obsolete worka=
rounds fixed upstream
- Submitter: From: Thorsten Lannynd <t-lannynd@ti.com>
- Date: Date: Thu, 12 Mar 2026 14:54:01 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 426a61e2d14d8670f0d9f058779900f92=
61be16a

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Thorsten Lannynd <t-lannynd@ti.com>
- Commit Subject: ti-test: Add request and websocket-client to packagegroup
- Commit SHA: fdd93c8301f8301e742b24e1cdd630e5c9706c92

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
  yocto-check-layers: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master - FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
ERROR: Nothing RPROVIDES 'weston-init' (but <build-dir>/sources/meta-arago/=
meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-graphics.bb=
 RDEPENDS on or otherwise requires it)
ERROR: Required build target 'meta-world-pkgdata' has no buildable provider=
s.
ERROR: Nothing RPROVIDES 'weston-examples' (but <build-dir>/sources/meta-ar=
ago/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-graphic=
s.bb RDEPENDS on or otherwise requires it)




