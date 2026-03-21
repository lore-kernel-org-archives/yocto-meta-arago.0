Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 811981099B5E
	for <webhook@archiver.kernel.org>; Sat, 21 Mar 2026 02:13:04 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4517.1774059181125178837
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 20 Mar 2026 19:13:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=BX10+jR1;
 spf=pass (domain: list.ti.com, ip: 52.101.48.51, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NMRaNpE9CZxcdH30f4+Y+ofc7HmtvCeyKxgvnsQgGy4Us7Usf0HNZii8TFyEHaEDrT+DNiVUp9tVLugk4il2j+rBPmTFmNKt3st0DVGWaD4Y9otYzyC80ctn2zmx1p0JBhzxc4IgRg2xD9asI5OOvsLrA0ReCphNNgwiV1hwmyEUfKp+zHTRGQ44izhSKXQjo4d1MacbMf/C+GQCWxtHeiTZTutQ1dolm+gQbu6/eKiNPgP7HD2tg8avOpoljLox4XH0F13x44IbC4xs6taQDaIO/MDnKPPU7XjnUqr1oyXtgFtOKb1A6adOtdlPFqKR/xU1QAN3KFoI2qDWamkMKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WkF+kzCoSaNFjGzfx3UxQs0WgIVFj7Bbd3ogWmDkCfs=;
 b=H0Z943iO0ZBIRSFYgpUvjqSCaBRW7G1fD4UNGqQaFFemIdiHlUNHWq7p47Ajy5gMHY9uZ3EnuvtpV9GAuoL5iCrIZ6zK4zLBXsDdbZrOWLBnebqI0I08ISWgIuOvu9yeFWhRJpoN08DMUQgfr6TyDkjP3+OrmZLu3mtowZCYLz3aM8p8t5FSY9t4yZLTuPGErqA79W7Dkd6MUQ8KS86d0kVmVRkOS+KYSecj+kTYClt4MyylZIWhg4Pdp86DdyxzszzT6ddQq4XEC2JaFa/hwKrZ+eMxGebcS//qI5h2JdwzGob9JXdyOpd9HUwwMoJhvewbVzAfAiF2VP3K12jRSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WkF+kzCoSaNFjGzfx3UxQs0WgIVFj7Bbd3ogWmDkCfs=;
 b=BX10+jR1lo455FryRstRAFHIzBXvgXYQ9ajfgBlxeYh69XuBxK/uClHGCn5j61g+L/dn8dWs7MOZ/OrOEOGMH9DUdmu/LYbT5pFjoHX75HzTY58sUCcQIyY7E97ERXe7mmX+l7EGd8xqAcAIn2lNQQVOy6rQRUid8Urv/zA+1GvlOs3e4HewoAHkosRCeAHT0xFV+8WZoYVim/QFYQKcfXP0/4DmDngimG9mOqr+xfSbl6ZUhSzxyXV8KVCjJFy4c0jH3cDakdBEqHmw73wTiPS0pQiSixf2Gg0xtYwrBqE+pTaZ3u8V+ppDyylThw6nR1mS1b7kMS/fGFjtxYREbA==
Received: from CH0PR03CA0023.namprd03.prod.outlook.com (2603:10b6:610:b0::28)
 by DM3PR10MB7971.namprd10.prod.outlook.com (2603:10b6:0:b::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.18; Sat, 21 Mar 2026 02:12:56 +0000
Received: from CH3PEPF0000000F.namprd04.prod.outlook.com
 (2603:10b6:610:b0:cafe::c9) by CH0PR03CA0023.outlook.office365.com
 (2603:10b6:610:b0::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.24 via Frontend
 Transport; Sat, 21 Mar 2026 02:12:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH3PEPF0000000F.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Sat, 21 Mar 2026 02:12:56 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 20 Mar
 2026 21:12:56 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 20 Mar
 2026 21:12:55 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 20 Mar 2026 21:12:55 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62L2Ct8h1056346;
	Fri, 20 Mar 2026 21:12:55 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id BB3829ACF4; Fri, 20 Mar 2026 21:12:55 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] libsdl2: Remove unneeded setting
Date: Fri, 20 Mar 2026 21:12:55 -0500
Message-ID: <20260321021255.359869-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260321014611.4150384-1-reatmon@ti.com>
References: <20260321014611.4150384-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000F:EE_|DM3PR10MB7971:EE_
X-MS-Office365-Filtering-Correlation-Id: bbec0f3c-967a-45d2-954d-08de86ef5df6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	yxwqFEbkBBSmtWhYQKbusYWyEc043w5fYkkGTuI2kyet2WNS4qudSrBNOZZIGi0Il2nWj4iwkw8k8HvmwanqhFHW3hnSq3dN29KvNh0ai/LG8SXmZZ7xH7aLAzLVHEYtZ2nXLwyOzvewo0j4GmemOEb0xqG+D07ihLpaESPRZVWxwq4AV4MLRgxRUSCPpEEB9Gi4ku4/8Fe0PMWgSOo8KQ2zmP/MN+QaMZ02O6qdqK141PwFUyYlDntHZABqBm1SVPql3i7RT4eynXeV3sKdE6Q2bZDnl2T8dgQLGikliDw+xhpUDB7BXjFPUj4jUiaRzn+FgjOCP3oeEW9A5P99JfosKPhnKI0Ku9fRBoIYRSWC8OOka2VC+JPShkzOYy027dKmU/JWsC5YQJsiCSlk7Au2EN2zruPU7rLoo4zrtOE+v0DEBrbJ5nwU2Ply5IA8paPqFz041tATrFzYKZjkK8q2es27fObMAnTtY2+8zXgERz3RxSOzJzCWMZtI3vsDMR4d6AEDgR+LiQPEKXwwyeSyQuC24VqiwtLrh8MJLa+HlK9UAhVhiITsVU28zswb5Pl/Sgd4zeZ8Ttyp8HYNj7Q7rSe4AVCUiGzb1LkAAbJ+/XmocLmfTbFhdHZilfXW2mkDVektKZKKP7repHZH/ZoSIqTvuJQJG6c2hi9Tf7x4CNgKRW1h9pMq+toNLV9Le1hJSmK7ykzpZWIBe5WQKbJowL05PcFJ2C01h6G0bMoZFxD7Sx0TDP+3InuePf8tHgEQVNR0KI3AxV4QikFonw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	7ZO8Ba65/4j3XjOYWEG16+CklPyzLX8fT4TXuABZBYbl4oGiagDdSG9Jiw9AxJdJzQ2aNNAoL5PsKUNBu6oSPOqhA30VNArAY03ccKop6q30ji3BoyGAUdUiQ7UF95wMME3HVSl5H5pEcLNXFtm7qpzf98zMOZvrj1KJzc9xoYbGmvYGxYP31SqkOjvloONqtTl4PU+GparDj9LPMewjY6w+/ck2z/60S5oKO1o8DuAsxtgA6eZeNbOuF7SGA5Ez4qgOZ3+RlxFLtUYFEVzSqogZv3H6DqNXVsGI8iMzcTaHo8KSFvRqtzRx74C+UalpE/MAutQUMKawrxSnoj3mS/1xLSB5v9g43+rSQFbRqq2XBmLr/dHXMuhjmCxTxbRq+HgfLjhzU5MOibmsHMxWG6XNaTIeXtK2Xwtgz5c9n1O1hHSVeEV8prNfURBozgT4
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2026 02:12:56.3964
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbec0f3c-967a-45d2-954d-08de86ef5df6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF0000000F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR10MB7971
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 21 Mar 2026 02:13:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17415

meta-arago / na / 20260321014611.4150384-1-reatmon

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
- Patch Series: [meta-arago][master][PATCH] libsdl2: Remove unneeded settin=
g
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Fri, 20 Mar 2026 20:46:11 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 26de109ba498201e01ce584ce02528749=
496c319

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
  yocto-check-layers: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




