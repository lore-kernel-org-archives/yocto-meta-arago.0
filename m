Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C17BAFCC07D
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 21:34:29 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.61])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5525.1772832867568819029
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 06 Mar 2026 13:34:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=SGCeeS5v;
 spf=pass (domain: list.ti.com, ip: 52.101.56.61, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d18rfcD1/dPfYHA7dApDJyqJk+fTXcSyC7/7QuLi7N7DAiM2FyWpzzXnWs1hPhmwDhAe5fzjlWVdW+8cG3W9f0hMuUvq+Op1rnGMhw/k/zrUpUHVjd7tL1hUMyr9VVviFhnHSrnPB7SIO5qNEKcNIMe4/da99Ed5jdzPqjRYCjj+yXJXz78QF8vRzBXQ8b5zAkd4slflGbHd8tnzhsIatM3YKoTGHk/vG7njt5BNALS3Z/cAsUkaBI9dGCnrjrvJDJPaipb8Gs7ofqLPR9rpFyZEyXz6NOl/N3Iz5ui7fukcvSxq/yx1oDmu8lo6becAiWGQmmQEHS6PSz2RsL5Qjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eLwVbxOeUiCM1y6LcwNKNMxZFoA7VmTPe8tJPNSEiWQ=;
 b=ZAM1/s+8g9C3KyE+YkEJFYYBhwwnK9T7oBMhZTcbKI/fcIY0XEzmF+WVIyk9Zr3HgU128yEOozF//xIhaLlwJ/ugrjh3qYAPjNQLxhppTUdmFteVZNCZ1aFu9NqZqrAxE7dYCmQf3w61w/pRJ/hveZhXvW9tmhhEpogA2xHQ2S9HRgcwG/fpidcO+sNUlSKyrwXoytCE/Cd3Yg18tq2CA5ssOD4nbBZRD66ybr3/upGgtKzSMTUbL1tAcTA9gqC8HEc/NVP1ZHe4MJLVNctVtiGuGs8RnlXhrIgNCkFymlAXIPe3aMyMbNsCReoBP0g3bJwtpnqs97FDhC5aFrSGTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eLwVbxOeUiCM1y6LcwNKNMxZFoA7VmTPe8tJPNSEiWQ=;
 b=SGCeeS5vpvruuhCRZUecIVUJJXZVw6riJP1erJs9MHN4J78HBfjAux+7XoYrUkkWL+AyAAKR3WTbqjpYgFKHJmAsCqalDFDCD6mipRHSLBeTBqG7e62DMAAt/KI04HSICrBLieh+xD8eGVhkvUhb8YbaARCw8vDzB6+Bw7DlPcZCE6p4d/Zo83EJ7V30z+DLedbFd67LdFhPJEnF8w9VPKu7IJq7ctUbLcQXuIMXzbNWuHIJ4whOvISHRFnoEhd0mFOfGBvRNfdBM8qhnlVPJoSKoCu145+d+WuFwuq8a6eGf0yzeN77qCwp0hg3atBRbProhxlwT0Tga4dxcbOIFA==
Received: from BN9PR03CA0048.namprd03.prod.outlook.com (2603:10b6:408:fb::23)
 by SJ0PR10MB5803.namprd10.prod.outlook.com (2603:10b6:a03:427::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.20; Fri, 6 Mar
 2026 21:34:23 +0000
Received: from BN1PEPF00004688.namprd05.prod.outlook.com
 (2603:10b6:408:fb:cafe::24) by BN9PR03CA0048.outlook.office365.com
 (2603:10b6:408:fb::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Fri,
 6 Mar 2026 21:34:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN1PEPF00004688.mail.protection.outlook.com (10.167.243.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 6 Mar 2026 21:34:20 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 15:34:20 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 15:34:19 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 6 Mar 2026 15:34:19 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 626LYJeu3397716;
	Fri, 6 Mar 2026 15:34:19 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id CC6529ACF4; Fri,  6 Mar 2026 15:34:19 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Thorsten Lannynd <t-lannynd@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <detheridge@ti.com>,
	<b-brnich@ti.com>, <a-christidis@ti.com>
Subject: Re: [meta-arago][master][PATCH v2] ti-test: Add request and websocket-client to packagegroup
Date: Fri, 6 Mar 2026 15:34:19 -0600
Message-ID: <20260306213419.1536549-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260306211447.882107-1-t-lannynd@ti.com>
References: <20260306211447.882107-1-t-lannynd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004688:EE_|SJ0PR10MB5803:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bf05af7-67f3-4a77-b5c5-08de7bc820c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	43si5j03SlXt4tYD21pWn9QCLhDIgUw/cjk0kh4ATN3YjitM6L24ZHp2SNCo5KTdZRMMjXAWeayPVCgAsJ8QmrNdP62gIGilQYEmblFkQsv83Y/vkxHunra6ZPFovBdth3+Kl+AHVODC+KNXcYLt1s9QR2f6Ttak1B4RpemTqhnLhbY/Coe+eSqtAp8f7J0AAszn0MZVfcdBj5/mz2qjo3/DhVeYKqtuHzKQLnvcC3rla/G18THkUb/sBWob55dYLNloUQ+PAnFz4hB6EFeLvlx2liwk3uuAzd9Z8op+hF0o5vPnkT5pAPBSyVt9V3DeZ6VZycIMvyjWGeHGFx5eo0t6Hn8YuFqHZnbynBBJEYDNomYy92Q3d0Pl12npCIekPDIwIo8r63hjjkhvTyx6LKk2FN5SwN7++f9w07edKxU5014WtH+CA9AkQVTjtPWqQa3dgP66KoiA/iAoXpljlVMs0zU/2AWM6LbF0JPAPfjosde4k05Ebya0dS7OS7Ujnk47l9N+uXrJKp0RO5HUzX4gkbW7TQbFjZ0mV0zMOIgJz3bym6CP+Zrj1LQAbpE2MbY7RhywerPld//y1qmgDRKCU5ih7LNE+esqW/a3eG16lBqvEWlMZodwhgNobCxfuZtXZjCIj7CA9kr4znZRpOSktPuVYmcEJTFdYtrVyhvUiSkM5eQMQ25VsZnRo9O3SIPhAmBJTUKAf45uEQVFtx+lbjXdeLwxNaAGZA/FlOJrh9goQGt0dsJAeJjJTPMxfZ1OQ2RFsz6zey/HbuB01A==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	lOSZHJsyhzZxlOhg6FvihcQmxH9M97L7pSdQR1V5i8TnNTo6wzUSOVyy3WS4Qd0wWEUD+TKahErPoyI1s7stKi47Or4qbgR7RmpLMZz3MH4WsYyKYpzg7cFcKmMQ3Qt68ZZlaIsElQaDKUO36FpzZRwdLhsaOfhfIiuXPw9yZOyMCy0bIILFAsbttBcBpsnJ21PEtsCO7hLZFwVfHzB9UD5koiA7PW9J6qdPzbDIXhABGGrLUGpNe5uH5dJwmpi03aYpkEtkMQZlVvBhu0F2cQPlaedqbJ6t99H1V3reqtJgBLugn8wAQBOkrV5QL2PwYS5FbVaB75zABYvDTASLliwhzDjkkasxkFFwO4pNWMDHCQsoB0paAjb7De3gJCvVhPfArDcwTjfreVhFmBIaspnf9RNoYW3KKknsEjjwgWLqG3lddJjwxiG8lzDhNeof
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 21:34:20.5707
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bf05af7-67f3-4a77-b5c5-08de7bc820c7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00004688.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5803
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 06 Mar 2026 21:34:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17280

meta-arago / na / 20260306211447.882107-1-t-lannynd

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
- Patch Series: [meta-arago][master][PATCH v2] ti-test: Add request and web=
socket-client to packagegroup
- Submitter: From: Thorsten Lannynd <t-lannynd@ti.com>
- Date: Date: Fri, 6 Mar 2026 15:14:47 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 9839f4ea8194ebd1abf7f086ef956fc19=
41749c2

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Thorsten Lannynd <t-lannynd@ti.com>
- Commit Subject: chromium: Upgrade to v142.0.7444.175
- Commit SHA: 939752e7496d2cdaea5648fdb0418ed6a36204c7

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
ERROR: Nothing PROVIDES 'xen-guest-image-minimal'
ERROR: Required build target 'meta-world-pkgdata' has no buildable provider=
s.




