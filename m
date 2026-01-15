Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25FCFD4661E
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 19:48:58 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3545.1768506531610639669
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 15 Jan 2026 11:48:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=kFMGr8xD;
 spf=pass (domain: list.ti.com, ip: 52.101.61.23, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qqJqCDZ9lGzRfzyOHBhVtTHDdaGYSjIgDS7LcNHq8fZCu0Du1Qi6HupV006RZabLG1JzdLtDmgMJOHMzlRHM/BDnLIa4OGEiRcJHIKHjDEznQrYCXImkgbwV9ZH1UL5FRkT5c8T5Zkuih084SgjGRroM8qMPC7A6KWIeVE+mATFWuISglTHbguBPOjCb2W4YJwm107v8PkCr/PjbRSJe2bw2ggPLGWR7mtK6lz/LM4IvvGPYCAY5djTcxHL/t1/ZfpPcDjyumf2w7vyXOIc0+KTsagD1z0j4G+skSgJ2+i1ghhMbtXZDoAzUO535TPNDS247Rcr5iCTqMkYxvX/nkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2v/Ydr+IHBNuNxB7q7oL8gR9AxKh/3KR+DOll3L9Svc=;
 b=Ua4ZxYGqglQwxMvp6riqV9yiVvPUR1XDdyWlF32fbTbL1g5IaITRXsBvlQvMadzuJyBQ4NQLH1bu7fh15zso2kYtvGN7iO5Al6NThZKhCMWMrsnbV975e68AkwNy5uv9gjsG12J63XdMFyjVeHL6LElGS4waSlwjn+EeWkeLj6xsQDWhG+q4YmQY3jbUuYvbA4s9qVV0Bz/3m3jPj+pZMXyQkLKUu22GbWOWFMwnfJJ3GnoIcpH5nUA4ilutC/3mS+F74XliAFJEasQ+CD1KK6MsU6zXbCpuEZmXSr/rE+xxcKADmf4Xnfk/yAEf2FLfJawRfOkhMUvjjD9oSPXKVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2v/Ydr+IHBNuNxB7q7oL8gR9AxKh/3KR+DOll3L9Svc=;
 b=kFMGr8xDljJ5juJlVRHHHMSkReIpvah4uDd4UMGXXLK+pvDk0DY81PKCXS3Y+Y4gbHhZn51C37rWcerDPdv6tnDvRThtGPHQIsWgd7vtjDdA5meDtsGYXAljkI1oeHrgSGZXpWCpoCQE9zHCxZN+6K2l1x0+UZhbTZtvpl7PF0utABR4rGrRziNu0rfjT/6eR0buzpIAqxSwDaNHYHUoVvC7eax8ISa1avgviAkbwp87fzEHROl3KvKGElptJgfxrywbzQfT7figajZQU+n7M+wFy3GWJ01IrFVmyNZ+1YpkK4Pgm0hrYjcCdNmbc9wXERO3zirr/W93DX46MV6gtw==
Received: from SJ0PR05CA0177.namprd05.prod.outlook.com (2603:10b6:a03:339::32)
 by PH7PR10MB5722.namprd10.prod.outlook.com (2603:10b6:510:126::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 15 Jan
 2026 19:48:49 +0000
Received: from SJ5PEPF000001CD.namprd05.prod.outlook.com
 (2603:10b6:a03:339:cafe::57) by SJ0PR05CA0177.outlook.office365.com
 (2603:10b6:a03:339::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.2 via Frontend Transport; Thu,
 15 Jan 2026 19:48:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001CD.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Thu, 15 Jan 2026 19:48:48 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 15 Jan
 2026 13:48:45 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 15 Jan
 2026 13:48:45 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 15 Jan 2026 13:48:45 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60FJmjMc2075732;
	Thu, 15 Jan 2026 13:48:45 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 7569A9ACF4; Thu, 15 Jan 2026 13:48:45 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] packagegroup-arago-console: Fix package name for alsa-utils-amidi
Date: Thu, 15 Jan 2026 13:48:45 -0600
Message-ID: <20260115194845.2696303-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260115185636.3577485-1-reatmon@ti.com>
References: <20260115185636.3577485-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CD:EE_|PH7PR10MB5722:EE_
X-MS-Office365-Filtering-Correlation-Id: 52486fd0-4d9c-4833-466e-08de546f19f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|34020700016|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ROvV7wEutuWGfXgrnBILxDuugQR+g0OyuhD/CkUTGXwXwuZu5h66jWUHRXM3?=
 =?us-ascii?Q?NuamH55+R/hM3s7fNtp4WvQkAhnVWT60Q2vucL0JfvkuNyxrGiGpNd5kDRxg?=
 =?us-ascii?Q?wpJE7Zt+8NyNr3NDjlW9TBJpKEm5RXK8ZhoQMfw+KAkFI0jcESK2+99o4+17?=
 =?us-ascii?Q?ZrRSQ51mh8LPFyBHYOyiMWIkPZ2MIREHnoibGFwUyEfag9l0QHWItpE+wlGR?=
 =?us-ascii?Q?PPH7LKoZpDoz0q17+vQxipBaRnlQildvTHzkxIeCqW02Pil6x/ALa+Z2wI0G?=
 =?us-ascii?Q?b5It6Iurtlf0eJ9IG0yoR6C5v7tEJVAMzO33DABCs6yKtrgR11l6FUJRLHUT?=
 =?us-ascii?Q?vzNXrXhOZ261WeAy+9cQB+90o+PBJg8lMUTD1ejm3yCHc4Zjle1XIAAFXIan?=
 =?us-ascii?Q?2rAoTTlmiLKq23ln3IPMaODOV1PBcN0ZdFCgBV8yhVaG8L4TuKPweXAWjRat?=
 =?us-ascii?Q?bHNl4/nfZJUyml/N1v66LBGbQpYQz8EmcDOIfikO8F+F1+eAFKZEPXehRXp0?=
 =?us-ascii?Q?KxfiDzlDT4ryjQf5vMsZaf6fuGn+75Z2XvGHlrGzUTSrfM++ZXL66HhCx89r?=
 =?us-ascii?Q?u5gbbEakK1FuOVdkAMghuSIaQa78TXyTWLbKG0jcLefgSvHr15bvEpM0IKwU?=
 =?us-ascii?Q?is5A51u1MlKGfcUAtCcIMss+9GljV9xPMFyIEFg0f+jjGHbIBMG4nff2YUO3?=
 =?us-ascii?Q?C41Qsm8u7YaZ36G8WmCCI24zVQ6mjNILT+BdzgL3i3BxxZI1bLG2QT4IbEAC?=
 =?us-ascii?Q?HKYKix2yxbTSPb7HW7CuiUZOxPbXnjERZROT4JuTinkCOj1CFAn2z4Evvszw?=
 =?us-ascii?Q?0BoDzybkEm9mrNf6ZYOH2gO83VQYImimmMeUla9rsstqCNc41d/popaXfMMF?=
 =?us-ascii?Q?SuJ3oXLgUvBmvwF90kmcLd6K4gYVq6SMN55mjue1JAflcN5YYyXV+B7A5c/M?=
 =?us-ascii?Q?+9Syi+RzpLHgaLZvyi80PqYva5lLYpzMill91hpuAfDTTWNM7kTK5oh1/wYA?=
 =?us-ascii?Q?GEga5ORF4h6cb+t1L1a/O4S10CuKOenGMR52SCMvSC+uMUBD380VXMAEK1QE?=
 =?us-ascii?Q?i4DgOvojDRUrQzuHFuwnAaOzjkLU+F7bMpo3Nz6NUQjsP9txnWgraijw6+Nw?=
 =?us-ascii?Q?HcGqhmEZpQ/2fGG1EjNCAUEygRa5WeVusTCtvBgrpMblfTGdf1QJ98tPT97E?=
 =?us-ascii?Q?7RmK5YtMiDLcB4X/N2p11EGK0Y9dS7K3wGyA7WQ1wls3LQ6iro3aFqiEAoqD?=
 =?us-ascii?Q?6CMFFPB9ExcU4Nd/lKaPia8Boh8F5CMaLv/ewi7m2qTwkLuH0koR2DIdpJ3R?=
 =?us-ascii?Q?ncw/dPh/V/V2oz8vzH9XsCGNQ6xoTAP7etzpFAgoHA6lHSfzjOm3S5Oio5V8?=
 =?us-ascii?Q?tj2BfeWgcDufmivotVVIy4uQSE9nvO5BLjjbkE6wx24F0ODUglOdKoyFOlmK?=
 =?us-ascii?Q?SXsOhkJq6kUdIGpVMTPmNBFq4WFIVESH112OTraC13P7Pk1tVj2+SrKOJSEs?=
 =?us-ascii?Q?M7v9iTEaH5vy5nbO4R1Et67VtzllshNfta4Ts+nufpuc2An67bLRzCgKDTWr?=
 =?us-ascii?Q?PQ1ui4abcg+14N0fzHZpgcJcRTmjN9/Cw/CLnqErUi7tZBNI2dEGK7nKffCx?=
 =?us-ascii?Q?IRBPXVEkubyq1g89TiBmNsNgvK7Cmfnlg2oGacgqHdgq?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 19:48:48.5289
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52486fd0-4d9c-4833-466e-08de546f19f2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001CD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5722
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 15 Jan 2026 19:48:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16956

meta-arago / na / 20260115185636.3577485-1-reatmon

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
- Patch Series: [meta-arago][master][PATCH] packagegroup-arago-console: Fix=
 package name for alsa-utils-amidi
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Thu, 15 Jan 2026 12:56:36 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 175ed0350fda7e50746288dc647e2d137=
2341819

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: libdrm: Remove upstreamed patch
- Commit SHA: 8c190b1e4f6a53ea641ba9d6150ef873f561c706

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




