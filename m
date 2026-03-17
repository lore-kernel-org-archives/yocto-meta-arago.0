Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF660FEDA0E
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 19:04:02 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.84097.1773774234091718440
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 12:03:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=ltdixOGU;
 spf=pass (domain: list.ti.com, ip: 52.101.61.56, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x1F9iy4PlcCPY3zMhsyg686B2zCeODIlb9w1eL+SzCYvBg0hydUKapMbeZesEr1+sBkxvWy18A2gpIOWZ+2r4nhMBU9vbnYGuGroe+qoFZ7UbGS2D9uPrGlyfQhmWZzazF7nz/RVU2uRDfwdmUcqS1G6lGIG9vr77zRiRVmoWdX6IRQCwweH2RhtBziSgXokOsxRacpVZG3vl0GAEc87UBdN+OFqIWAX2N/zO2KDEbvO1KCTHwW3SyaL/aj0Hm4rhpIpYcXq9nHHqNP/SfUFoIDJDijTh/syDq/08MUB3gyXk7zxSPa0/6vNqSA0naYTs27+TOp/mfBC5ZaibTISxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vh6vepNWb5dOmnj0SiCY7V/kf2jyxeMa9D3zxMrJTmE=;
 b=nep8azUL2Emyapuq7PxlMse5sjmPqAYdJr9uIBB+6tdhEknHLleDwa1twIL26jpsJEXfk2mbslrjnxTxZ/oHN4lUibkmFqZvtqYBS6C0AvZ6ybiA4sSDfjJhWsi6HASigPdNSZpwPbyUxICjIh9MjVnDchqj9EQmSIPMfHeIqdae+idYzMnSzjowlyFE2nfAIbjEG5Cgze6i7fMsCdY8Oa/14RhCIV1uIk50mvjuBp7bcvfABoKN7Di33GWPvP/j2VA3yeqtyFznAjCzvh17rhosAAHnikBDYWX57hYe03XDqC8XduKZf1JcBhpGkzucl0R/qxFN0w5RPK8MJMIW4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vh6vepNWb5dOmnj0SiCY7V/kf2jyxeMa9D3zxMrJTmE=;
 b=ltdixOGUqyaDEOxYIumADjL8v53hn7j9pyNHDSBkpt+2Lw2h5rxh4o2QOhm6zL6Uz+P1RBbVorr6bcKauTIFkfxHA/2aC8kXLcHTw6i91iPqhecVdYpujtgNoPjxw/eRwp9DfgNXCLOqhVHVp15ZsnO9GcT0qMlgCU2pdM3z6W/FAquvkNvmsZdvjcpz1xeds7crNjpNqdqlDqp+CoM4845F6cVhhQPDLJtvnMG3cQqAd7RGEHZrEl8bKN+cyyLWm/7cdkMP9ssF9fgcQS2C9w0bLogWG532S9yS3LPr2D0BYn336K8O7vUkYdlOC+mrKoPzB90q+XqVszpF81MOKA==
Received: from MN2PR03CA0013.namprd03.prod.outlook.com (2603:10b6:208:23a::18)
 by SN7PR10MB6545.namprd10.prod.outlook.com (2603:10b6:806:2a8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 19:03:51 +0000
Received: from BL6PEPF0001AB78.namprd02.prod.outlook.com
 (2603:10b6:208:23a:cafe::5) by MN2PR03CA0013.outlook.office365.com
 (2603:10b6:208:23a::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Tue,
 17 Mar 2026 19:03:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF0001AB78.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 19:03:49 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 14:03:40 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 14:03:40 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Mar 2026 14:03:40 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62HJ3e0o2933874;
	Tue, 17 Mar 2026 14:03:40 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 522AB9ACF4; Tue, 17 Mar 2026 14:03:40 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: <a-christidis@ti.com>
CC: <reatmon@ti.com>, <denys@konsulko.com>,
	<meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH 0/2] Add libsdl2 test support
Date: Tue, 17 Mar 2026 14:03:40 -0500
Message-ID: <20260317190340.2898176-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260317185724.34717-1-a-christidis@ti.com>
References: <20260317185724.34717-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB78:EE_|SN7PR10MB6545:EE_
X-MS-Office365-Filtering-Correlation-Id: ad6bb270-41ff-4439-aa98-08de8457ec6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Kwhnct13BYm+snZRWZ5SMEQ/wkJHI0zF2ATshBdoG1cvFka5XfwvTYK8J1443tOcPWmKZw2vMZFKN/GvWcUdshFDxsYdidZ6GDy0Q/pXk7XpojaA0Kw9bt/lmrNxqAuhCTSVZvEh48iv46A+LAnIihyjYRSU7zbjCs6nwFMSuxpBU0jzywwPpZmXGviVCwgXywhjbWecprGxwBkranxqxhal9uTMKd0GLYvhs+FHrK0UHYdtkBK5NPu30TchHrkKv79hiQfYvmyhwHiEYT2e+sDinJMly/FNGk32pwQOp8HI79W4cq7uy07sa0Tsl55cB+ymu4k4misu/HTR7V+3vZZMVVqBuGTGg+gpkkDNNasIg2LKAmhRSn8Diu9jXKWKhBT6CXJ+vFZPF+xJRPdDcqvmlo6N8p2XUyQmsU8oW2C+D4ZUmUBlj2PGgDhundQ/1zfMkzdpGBoLEDIK79bPF29DKFZdXZJDU/09xqdiJPGEYtZkohS3p2RigB4rerH0DXF1Ni8CxwL+hxVCzJzRk8FQJwoE/276hMnfed2yQ0h5rDEdF0qkTr7+8eW01Jy06fLAETsQa2FpyrVYih+xL2h7jgoOFIe0ujsSkJobxQSuAA2BhUqJcYdTkG30+R7kRcJU/kaWkRsGn9QxR+IkDxA3utm4nzpmnn+xywYbRygh56uwlYUJaWNPwBkoU2XemOv1rpS06OPwpGNGfoFcmzOvRCIpUMCGML+qswH/pcFQcHFtebKzGNXTakFbQ+bUZ2n0ozkzXGYjQ98RFQIDhA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	TAbq6lqqNF6uwcqqD6cXOHv6cp6GMVbYhyn/ysmOkAGPsTQX4j/rV9FPUINAoO/dmtZuPAbCen/03QrEP7IMy2HwYt1PbKQWdIy2AdhaIvNWKNfeoym1P8yMGsZeEIQk+zd8Oxv/vdgMW237b3UaRaGvhSdnIvrmyagrZNgYOFTeZVMgzd5T35Q6Oc2aE6h3x0u3liE1p+r38WN2fa4DZq1TAG+bBf22lUFmIDZOs/Uc354SvhSBPBj37ilfP/dlo9BJAAsmwhoMw4WbECHt1woNLlk6SzFTWW3negLkPy1MnXSAr3KayNvrrxUrEPjFrV6oewCHmDws4WNNCWA3yFrToxUDKwn2KwxCgUxS/qp5DzbDJwDTnZWA0xsKAXHny1VKC/UBekGn51WWfFQQzMu9i5UsyhTWqz5uunIBKE1H5UuM3LGmobx/hqMpfIqH
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 19:03:49.5711
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad6bb270-41ff-4439-aa98-08de8457ec6f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB78.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6545
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 17 Mar 2026 19:04:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17368

meta-arago / na / 20260317185724.34717-1-a-christidis

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
- Patch Series: [meta-arago][master][PATCH 0/2] Add libsdl2 test support
- Submitter: From: <a-christidis@ti.com>
From: Antonios Christidis <a-christidis@ti.com>
- Date: Date: Tue, 17 Mar 2026 13:57:22 -0500
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: 32408606440034851a854ebd4514fcaec=
8feccab

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Thorsten Lannynd <t-lannynd@ti.com>
- Commit Subject: ti-test: Add request and websocket-client to packagegroup
- Commit SHA: 64d6190f700d54addcd17687b7428a64c2bbb0fb

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
ERROR: Nothing PROVIDES 'gstreamer1.0-vaapi' (but <build-dir>/sources/meta-=
openembedded/meta-networking/recipes-support/spice/spice-gtk_0.42.bb DEPEND=
S on or otherwise requires it). Close matches:
ERROR: Required build target 'meta-world-pkgdata' has no buildable provider=
s.




