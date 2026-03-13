Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12019107BCE6
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 20:54:14 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26287.1773435246825218338
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 13 Mar 2026 13:54:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=cIYvYyQ0;
 spf=pass (domain: list.ti.com, ip: 40.93.196.28, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BezaHk9xyqs9o5jqC3KYJFiDUTUFroW3Vc+r0QLPDGWfR13W86JuuJ4ktUaxqHpUmuDgkjcBMSoE6HN1h8iZDHudv21oWiWGC51tXpzwWKVaF1+NOjADcd3Ikv1x6kyS6bl+s3i0FQNZg2r6LKp2qpqIrhfC2iF3c8P6KobZ9swkrn436zXLYa5WRXcpYgFAaHFXsVmhyxL3FT2N9hVcp8qK2wt7Wp9IGUJ2W6O9fpkjsHxT5JlRZ4JS+yEL/02C7DdjiJ9bsEmHTB71UrX2FP+hR9jKQUCsaRMTzfY95Ak47S4uZ9WZiuFRaFALTj/T1AKXmMAchIVdf4ks9q//nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yvay6SibW282TbcQPcHsm17auwYHF2UMEOd+i1/7TFY=;
 b=Ss1VaMi15e3LHdjru6nf2w+QNJL3rS7jBnJ6IzrUjpizaf6dtSc9gu6A14c4bww5ZC3Tg/sAKvBXkDQ0ByehCqxGtU6kl56Y6/C1IjCdNJZdMuj+/ukegtfrTVVDw8nbtBIuFECl4iXRid4ZrX9YhkAId3q9+2seVF3lRdKDHnsol+Nj+ne68b6MkWuJ3vNlI8xDoyp8+I5MJSJCId5UiOfx93S7cuDFokI4eYCsGB/eoaK7x/vmtRkfCQaxeaKVKuj0ALsnqwaJcZY4cqBTRR5mW7mrC3Mj6jMftGTQzkQ+wj6nXJcz+LeEeHXNktcmddXJ4Fl72y537pVNYlHPQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yvay6SibW282TbcQPcHsm17auwYHF2UMEOd+i1/7TFY=;
 b=cIYvYyQ0gwGfv2S/I4/zLJKhdnWsMG0opAE2wN0amHYOrSlQwgYuFpuDusQKkTmE8owJFjvsg7mjq8NkPve4GQqXDailUmPzP3isYZJhY8RDVaZM/ojv1yi4OuKxVsnPPsty5YYWrk98yzCs9Crowwdqy6COLu4GrE2CX96lozVX8db9fly7UtlKPbbfQ4/K9J9jP9eF4u7gLE8n8fMsWNCwkjzUbv0iaFTSwQOEIRDnsGXRxV6xYqlTg5sy3EZw3S5TVYgySSmEMVjO+xz1v6UU+hEpjaK6PnkKvILc5qnDt0NGfH7/0iG/MiiR25EcVEswe2VomVEkoy70biZ4hA==
Received: from LV3P220CA0017.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:234::6)
 by CY8PR10MB6513.namprd10.prod.outlook.com (2603:10b6:930:5f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Fri, 13 Mar
 2026 20:54:03 +0000
Received: from BN2PEPF000055DA.namprd21.prod.outlook.com
 (2603:10b6:408:234:cafe::bd) by LV3P220CA0017.outlook.office365.com
 (2603:10b6:408:234::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.16 via Frontend Transport; Fri,
 13 Mar 2026 20:54:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF000055DA.mail.protection.outlook.com (10.167.245.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.0 via Frontend Transport; Fri, 13 Mar 2026 20:54:03 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 15:54:02 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 15:54:02 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Mar 2026 15:54:02 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62DKs2WK1194154;
	Fri, 13 Mar 2026 15:54:02 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 879909ACF4; Fri, 13 Mar 2026 15:54:02 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: <a-christidis@ti.com>
CC: <denys@konsulko.com>, <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH v2] flutter-wayland-client: patch build to include cstdint header file
Date: Fri, 13 Mar 2026 15:54:02 -0500
Message-ID: <20260313205402.1881773-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260313203118.1128401-1-a-christidis@ti.com>
References: <20260313203118.1128401-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DA:EE_|CY8PR10MB6513:EE_
X-MS-Office365-Filtering-Correlation-Id: 35b929d0-fc69-421a-228c-08de8142a8d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	ePu4YqOB6gE6G6WCJsH1IKlIFzILP6HlEei2Qx1ZdzY6Bg84hKSXuaGpEx0AjJK/KYBlhYdnSs5ku2bHK6xAGDqX9Bt5pza+6uTIZvYwGa7ErpU66LKh55Hdkrhf1CZpZW7RugpS1ALh48xQaDEpJ+Tarkuc7cqTQY3u9jT6yuPLNnD+87mnEbdloP22sxS6mqmh6OTKxW3iFW6yeUV1gd8k+Mkgs9LZ6TN8L3WFzMPCgdAYG1jpoBoZnAH8ra6UMclB9pHX2ek+6d4slEtZbxEnsIo9wLMBUBwmEgjNe+MyRrNecTJXMoJGHuaII1sA4oI/GNSEVq6AhZ26kY30Q2YPunkF0r6CEA1BfHpoyJil752RmXwzOfcl+v385mgH3/P+jVcOenQgMMIkMaAoge0GkIJSF6hyslUQOq2+qiM5PCLQSQsA2dMx3ulYQfYZzpwQMmTviCTmbsLRxltd5v0XyLw5l51PTQt5zkdBtCQCqmKH0lt0zIs0iNjWdtH+s289RMHWJ8SrpgGGG1JtDe3DoC3Lm6RIrp2TeA/0Sx1f6tLVf6y6RuJBaPqeAU3v5IRc+d2d9qXoTHVI8A20gO3bbQ4U2jLt8TFzflAmkoH5+LIuMZe32ZPbgNyWPTeT8AdBNCGgm/K6068pqNipQUFunuV1aqrKcT0TeCTsKs2cxEVs/UdUy1B/2dHT7PYxMQKLjaqxDqjU1KvItWbQSvWgyxnp7LbOyDu7JCFICqY/Wc4QjMysp1DXMuT0y8qGWxs0Ikr1cVYtiksmuRHP2g==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	2TBelGEvVJD6QCU/UTINVLMYRhEmREejRX/S0FliCaWAMSZNxxaF0JUueRofhjQAqCr1MBd3izMAIlF7yGHuFklr6i88Tv0IcNUSNGtY05oTpCCoA4sonR2l4IaLj1lSKd5KZPP9rWlc9r6VnR6e2Fy9QojdOFLUj2OuWPF8Jdp5TcmHm/RWB6QwVBgAZXAkWVonb6yAzWDGwBcBbhWcD7hy9WvLa0t3KGgwAzBTFST3+y9thLTS6/kQUKgLAnuoQfAfsHN/ia07XUO6hD9042ldQSF0ah+dbFsVFDx9INqkXp81OquAow3jd2qLlVd0NAJGS4KAptJcSKHh5fSjt9K/9ifMN5qVBj7rlc+jMcquXKEDYZC7secFNPlxiFYDpJGLADMwiK+iCQLweBo0BLODDa6hL0iNHaoczJw9BoXaxTn/gnNzGSSCQumyOSgC
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 20:54:03.2133
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35b929d0-fc69-421a-228c-08de8142a8d0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000055DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6513
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 13 Mar 2026 20:54:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17342

meta-arago / na / 20260313203118.1128401-1-a-christidis

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
- Patch Series: [meta-arago][master][PATCH v2] flutter-wayland-client: patc=
h build to include cstdint header file
- Submitter: From: <a-christidis@ti.com>
From: Antonios Christidis <a-christidis@ti.com>
+From: Antonios Christidis <a-christidis@ti.com>
- Date: Date: Fri, 13 Mar 2026 15:31:18 -0500
+Date: Tue, 10 Mar 2026 11:01:28 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 181cab9d748aec6e9b08a50fb95443cd9=
2b17bb2

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: ltp-ddt: Sideport glibc 2.43 patch from oe-core
- Commit SHA: 7f7f74b57d9a62b24cf8c5509fd2f3c9abfdee8c

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




