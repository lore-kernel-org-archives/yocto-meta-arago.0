Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87CA8F54AAE
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 13:14:47 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19156.1774358079701198233
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 24 Mar 2026 06:14:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=I9MDKmWY;
 spf=pass (domain: list.ti.com, ip: 52.101.56.9, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ToLOlq6cJNP2wCfrD2G2lv/L3wgb+eGzUq3cCaBUrOH6OSL8vdsp0l5ydtvVk489aofBcL9m1QstAm9SNxlprgQ8+zNbyOkS7ctYME+ZcCALPsPr1oQzwxIbFmJP1Wu/VP+BoiJ8fGUEJpMVJz9TzpX43x23671tbn0rnIeSCPzkj+vpQ2XAOAx6/0RYc59jYtyQEn/y52uetrn3D4TRWEi0z9Clu7bbskF+LrhcPqH2Y5xTxdGSgg6ng6/3Radls/xdcImevajSyBd8XhY9vC/9b67L+gEClaSKsdMXASYoz06DgF+RG5FwbRQrbNfkaDwHGpvhiOcev4vgV9RJ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jkfXa2Rv7fnLudRzuLFtND2FRHjF0nRGPXy/NEAUfFg=;
 b=jHUyxMsHByCoGJWlXIkirp+YFAqQJmZihTyFwVLZUc+YzrllBD7wsJQ2bQL6QLVitPXSzkZE8hxo5iYNHkQuZj46Uj821aBromLrXhqv6IgRqIlGpzzIQw/uVkHte7DvXksa4+D8AbaIpqttpi2QhdEdZrPJPGg3x9CI5PCHI3b6haVdjWXRexELARhJ5Gv3DGil1Mw92YAk/1TdvZQArtMqsE49JQY1w7z8dwrVshzt9YYTPCShMYXQeoYVGCQWwP9M/Ah4uyW457jvDjX1+FQGTjQiinunwnvgvvomKSX4VRdIktyv7m0ZdVJbEPGxp2TBgxFKuxKvkYlBMPbKQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jkfXa2Rv7fnLudRzuLFtND2FRHjF0nRGPXy/NEAUfFg=;
 b=I9MDKmWYtGgPL1oUCGxMeyDVDbT2ngmBlZGtGwh0GzMm3y7kXlsnsgVR/ob/nPW8H5x/l9UhJmtML5Lrj87AUVLOfWr3vbMTUd9/EtT+qyn7vDAOQUVv4sm3OCE5vOv2GaQX3fTTw0uoYRWe5b9lsaRbwYOJEaQ818mcfSPOH/8pBLUmMQWv+sTypJnk7qz92umqF3LECxi4RZiuc1ZlzZgzbL125e7rVXHQsIdxaB7EvRXAF8KaYvz+xuHZ0aw5D6YK5oH3bIEtSNe4RjQuaVlYPf8s13Sm0vWlTAILQOVaQNxRJwLktR+HxheMraKSDEyU4yqh4fIPbPPvPIFfbQ==
Received: from PH3PEPF000040A4.namprd05.prod.outlook.com (2603:10b6:518:1::53)
 by BN0PR10MB5141.namprd10.prod.outlook.com (2603:10b6:408:125::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 13:14:37 +0000
Received: from SN1PEPF00036F3E.namprd05.prod.outlook.com
 (2a01:111:f403:f90f::2) by PH3PEPF000040A4.outlook.office365.com
 (2603:1036:903:49::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.25 via Frontend Transport; Tue,
 24 Mar 2026 13:14:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SN1PEPF00036F3E.mail.protection.outlook.com (10.167.248.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Tue, 24 Mar 2026 13:14:36 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Mar
 2026 08:14:36 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Mar
 2026 08:14:36 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Mar 2026 08:14:36 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62ODEaZT1453549;
	Tue, 24 Mar 2026 08:14:36 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 16DA19ACF4; Tue, 24 Mar 2026 08:14:36 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Thorsten Lannynd <t-lannynd@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <detheridge@ti.com>,
	<b-brnich@ti.com>, <a-christidis@ti.com>
Subject: Re: [meta-arago][master][PATCH] Revert "chromium: Add a patch to fix build against GLIBC 2.43"
Date: Tue, 24 Mar 2026 08:14:36 -0500
Message-ID: <20260324131436.2440192-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260324130221.560212-1-t-lannynd@ti.com>
References: <20260324130221.560212-1-t-lannynd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3E:EE_|BN0PR10MB5141:EE_
X-MS-Office365-Filtering-Correlation-Id: ebfac4e2-5215-4e87-cb84-08de89a74c66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	kv1cLvPn+ucjbuk7UF1JIDQIzqHqKwJh7bKbanMs8u4TU306LpEgHjZm3WNqN+fti39N0vJpiGkEPAp9U9Fgmq6j1U2hsVopXpP/X5GlEQJBHWqIZQBNP4/6R2jxLZrP28EU4cr1/BjpyG3gsGYijr4lYs64oDgtjZcKaZe9jtQRd+9kkWTNvMJqS7ntGUjF2gs6uflCAluFMMnpTbn3hXxa6rqG1Dln8q4EG8T935ZrATjZ84YIrcviiyKiSRgO43vVy6ykxHwTriapnwL6747rxIAzpBOPsPlMintco8XxXbdTmkHo+Gvi4FEYE33snIF68n9WfT47LHac/Aog9q/nZWwcLbRoI7KUVXdeCGeLfmk8wIqCAP5EIoaEQCHV6GbtrzeJWD3zklpODi75a4LiREIgeDR6pLI0KryjgpDOZegDYJTheVfGfMaLKMUlyKi4yhfPOanKqT3KYscYfzu76bdFrPJiMKIcM4wR85FzhrCzDqE6X/gYlXkyFfvDUyHQsKgEuUuFwfueBCexflGo9f8gJSt6kwMXne6IV7bMpakIqOleBIbN+s2iDAe+3tGbaNHQEXVWCGZBR+COeV2EmfAYVbAL1SjIrRNx1YTxkPI1UmlYQkrWPEFz+Cy1Ei2oh/amTnRZzI5EeZ9IZAyh3SBlFxA0LAhp3ZW6WkslaKwFK6tce1tv2gonmkStNJAQ+Ukgaj6VpLZXufxOTl0U81N/1a2Oj4CKjiZjdNdWTfR6I9IU3mXkrveM2ZWtyOPAaZo8XVhAwpqADPFHng==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Tt6eA15xwPp2Kpv5n+53/xixxtgA2QP4vg0XpZKzxfUlPo/ipgorl/E2o3RmPmqrODneBuTZKzKp3JJu7jh8R7ynpD1HO5lxw04n+RKTp3R1j7VHwhc9cdglNZh9cwrjD+yEOfnKR5iwzYAR9yEHOcskN5uZtEeuNYGFhGvoqWoT/zLZlIoN4fFTXZrNS5OoOlneNalJFGpZoq2SQeVniyRZjfUXPEwaXI3IEo/zMZgpAoskfyHYxGtAXD2/ax/Mflo9wr2Ota3gWAay4hYcueHZumJuRzmlAXtojp9Kq9TcgBA/Dj5MoBDudal+0ltTKqIM1aLVVhTmNV6FlXeBRzd6NQAiorT1QyVknsEy7NLbuzjOZ+ZG6lmi772qH538uzbdApbOJ84pqSAtFBAjyWtiHmfG81BKf6CF7SIyM5AmKrpS4F6Ry7UNH4rR0hgl
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 13:14:36.6876
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebfac4e2-5215-4e87-cb84-08de89a74c66
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF00036F3E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5141
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 24 Mar 2026 13:14:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17426

meta-arago / na / 20260324130221.560212-1-t-lannynd

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
- Patch Series: [meta-arago][master][PATCH] Revert "chromium: Add a patch t=
o fix build against GLIBC 2.43"
- Submitter: From: Thorsten Lannynd <t-lannynd@ti.com>
- Date: Date: Tue, 24 Mar 2026 08:02:21 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 712839f3e7c5b1282e95a07170ba6137c=
e06efa7

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: libsdl2: Remove unneeded setting
- Commit SHA: 9c7ac854c1119661806e4afdc5c2c0938315f00f

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
ERROR: No recipes in default available for:




