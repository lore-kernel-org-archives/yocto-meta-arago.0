Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A31DF47CAF
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 18:24:27 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.51188.1772735064827563942
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 10:24:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=iAnWvh4h;
 spf=pass (domain: list.ti.com, ip: 40.93.194.17, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QaIx2DKCZbAXTmAOf5JVaoQQA8Onbp6gE1NwNckGvcRB7rthH8fzFmDDHhcV9OcM5WzJIbM0Yh8PPldcaXvwBgw0e2ih3j/A/jYtcCIk0cfr11ixsn65p/R8VeVpsD80gGdiaFp7AFlyrEqs2Jm9VY43vLZa1Fm9l4X5aVZ/DuONmGZ1PwEia0y+JQF89CkxmrpOGgo4ez371YJ/1Wr6IfkB79YrIbCv2lXlDPraTK9HZ6uGMbnR54yr4GU18RdaDuujmOg1sQ8tZH5x26Z5abvQ6gG7J6oi5iruwbWcyZCzmTzLo6QGlVjmGcqvK20josJVgJ5E8lFwmmzUL/lYEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B9RooEMOT+4kBiBVQu11t1/fL7a/RekMCZ/PFuFMK2k=;
 b=GpoZoldSgezhvCcvKJoC6mCHYNRIxGAlUhzbOeRG/fFlCYNWnwv2zaa48qsnlBwIPBBhxwcaYFCZ3c+lOmbCYsNSn9Te/45b7kKi7HrGFw5fn+2jiJmxl3bYEOGPSx75ZsfaNppyMxQrxoK5Zb2/DdAd/VsxPAMdwxo7Z4Q+9keuv3ijxissahKwfrLC6+nypAP2ekWz1a/Zj1SuiZ2DHcRMYoqrqNrt9A31MotAEd1fAj1SjAXNlT90Fw1Z2pQCC2fw1C+JGutg45QhZCVaaoDcgy0hEAE59Lzaagywq4lCH80t+ZYCwhkS7d02hThMjG9e2/C5N2viar1dCauNmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B9RooEMOT+4kBiBVQu11t1/fL7a/RekMCZ/PFuFMK2k=;
 b=iAnWvh4hbajYIBY6tthgeuK0VFTEGtDVnb1OuksYNuiB++YzhdSmzoH0/TOn6zXMHkDaDZ12mFkhWCE3rCcrnKchwf63XtG/Jat5j8eNQTzmbX3G/1Pm/VowRgIVsYCvdZasa2y2AvH6ftgGAelkN8K1Y7uib5ug3jSskdf9fkgEYY2tew0xRRyUKq7LCySfKVGxShw3lIF5Fs1sOKOR1jwqly3CwJpUNxDczsD9EoaIcOWA3B5QU81BvyZxHH/3eQVtB71NWEsDEVWcH6kcfpCMxMKzkPV2KN91f9MnwwdaNvKH2zYH2SGN2H3+pOBTjaWF/8g4YAqA2SI1RYsCsw==
Received: from MN2PR15CA0037.namprd15.prod.outlook.com (2603:10b6:208:237::6)
 by CY5PR10MB6141.namprd10.prod.outlook.com (2603:10b6:930:37::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 18:24:19 +0000
Received: from BL02EPF0001A0FE.namprd03.prod.outlook.com
 (2603:10b6:208:237:cafe::2f) by MN2PR15CA0037.outlook.office365.com
 (2603:10b6:208:237::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18 via Frontend Transport; Thu,
 5 Mar 2026 18:24:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF0001A0FE.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 18:24:19 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 12:24:18 -0600
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 12:24:18 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 12:24:18 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625IOIq12060162;
	Thu, 5 Mar 2026 12:24:18 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 663D613F522; Thu,  5 Mar 2026 12:24:18 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Pratham Deshmukh <p-deshmukh@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <afd@ti.com>, <c-shilwant@ti.com>,
	<denys@ti.com>, <v-singh1@ti.com>, <khasim@ti.com>
Subject: Re: [meta-arago][master][PATCH v5 0/2] Migrate ONNX framework v1.16.1 to v1.18.0 and ONNXRuntime v1.20.1 to v1.23.2
Date: Thu, 5 Mar 2026 12:24:18 -0600
Message-ID: <20260305182418.2759884-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260305180824.1823814-1-p-deshmukh@ti.com>
References: <20260305180824.1823814-1-p-deshmukh@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FE:EE_|CY5PR10MB6141:EE_
X-MS-Office365-Filtering-Correlation-Id: 32cc6f74-296c-4680-621a-08de7ae46a99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|34020700016|36860700016|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	Tu38Z/SpoAn0Omm8cSvfvvxBkiKXjMPHPkW2i58ZiJytZhPFCrU346z7+j9FcVZLKu0Q0zDhtEqOq2nl8Bnjwm1vP+Rj/+Z3XWXmsdGD0f6EMccyr1oRRYTklAUcjxmjZNQN+d9lnYqMIloDeyqM+OILjcjee5Jit829Qj+4X9iuK0QqZvQhuwfO3iZibZ7QdlQJWyqbCfbHHr/L4Y5lACekZg8DW29Ik4UT7ozEjy9s4UF66uOeXJXx5BDU25LF1SftwTkirfsH1Zc5zmklHT2ToK1nijFcYDkxY3MVyQZI8iu5dy5JfigjMcah6WzH5nCAj2yoCEHtR+5z74lU/PY+c1ZB+QTTN6/jVfhgmYWAl3zxu9zc2INupvsmOrKqc6caimz2zzHNHT9Zkl2Ki7ln9knVcCAjq1qfj0jBtHYZ9LuStz2COQcFUKzN/31l7Xu3PFL9edP79cXJhXjrX0PUZJbiW1AsH/Zpc3r8hxjXviqsh1wlxuiILj08EQP1LvD2YtST12AmMxGlYh5s5397CMw4GoLfjvNK+MtfncLgVewqi94bRO9T++HHh45agcnFECseXi6VVTk2BhrtERUbsjXYNnTaztKhvjO3Ku+7dEfmEdBekRs7ohbtEnPTv4mHYwxTg8w6RhrgIghS0yXP59w7jwq0djaoxxMbdC7yKZCOJyhEtyFXDV0Utc/pRssdsy6bDBC8E4NVvlh8egpd2seVWnUUZAX9oh/LHqrefm0pN49JNbfuCD9vkgo67Lnm+QzQZjC5I24miPiR5g==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(34020700016)(36860700016)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	u5IdnkSQK/m0EGancoNCQkHE/N0GQgMpgEvxllV+56RXStDJKAlmVqXrPjlaBmnFXg1+gWYHjKj5sU+rjgelOJcofPLfA66aq4fofRblVVZWr1LfWjVHtfkog6+15yU4KtJmD9CaA2Q11LQl+39n0oEzipymP/UEibGusocguI7yxd6MtZZx+F42sOgec2ZZAagetX3pCAGxMMhS68PWIn/HXYKbQITyquPPu32yLs9cs8u07UvGRGkPDwwvn5n6nd9aC8Xsg/t1jKgcQ48w2tWSox5D3S/lIHp5rdkXYmzt1aa+GwSP++a4Y7Nkhf9bmHpv0MKHwmH5Sralfdk/LFdEXM2jITfbanILPgA2EYcjyZqBZImKdB2YZ240/jzqG4G32c6YFOWaB+1IYpxcG1YRE4w9N45bxkgYQK1HK6H/XtCHHHKacX8gpXy0BGxy
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 18:24:19.1628
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32cc6f74-296c-4680-621a-08de7ae46a99
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A0FE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6141
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 Mar 2026 18:24:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17254

meta-arago / na / 20260305180824.1823814-1-p-deshmukh

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
- Patch Series: [meta-arago][master][PATCH v5 0/2] Migrate ONNX framework v=
1.16.1 to v1.18.0 and ONNXRuntime v1.20.1 to v1.23.2
- Submitter: From: Pratham Deshmukh <p-deshmukh@ti.com>
- Date: Date: Thu, 5 Mar 2026 23:38:22 +0530
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: be7fb577ca7205de14cf9fc0d3f5b9bd7=
e0c0add

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: ti-test: Add iproute2-bridge
- Commit SHA: 538a04f7f91be5e391fe5613f298d6689ac3a2c0

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




