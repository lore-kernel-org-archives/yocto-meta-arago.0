Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81D09C98331
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 20:28:53 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.74180.1767644924598171396
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 05 Jan 2026 12:28:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=RxjdlrCe;
 spf=pass (domain: list.ti.com, ip: 52.101.62.67, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n7dMgMNviGZx4svLlvJsoxVEIv93etPCYcJBAEOJuwngfWvNtOG1aUiWfYA3ToETLyaq1MqOrxmRgWTCvnuY+C9XZY9bFjsV/z5j/Mw6tgClHFMsoA+1HpMunGaG1exuAd8rO7U4Yl4xcqvmLKjilnCPkecG+7rt7JZ04qjMWqemDElV6iqzGLDnk/mSG5Y+3L4boEd15vmS1sXngQMdsM73Vf/mjQxNjXut7EtNfg681QyiNFm4DtOjNwsEXt00TqkyiwW9sVBwkiumhFjwBbIrOAeadSbBnnZpgA9TTCjNBMc/L4nABCggY6pR2ZMK9pfT7/1ImBiRZGY+AVKSWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3qj+3gIYkpa8RXoqj/ePJ3b1Bbxb6hP2yFSuofW0Tbk=;
 b=miVp6iQpH3mw+QlXmGuIuBImN197UP07dE2Q6C3pMG5Y9t2t0C9nnwusnsR+Ql5+CAjGVJMhyZNfKC9GsDL9mbRn2OUyGUQcNIVvht7P8okatsx9qwgqz1UTRgjSCrUh/xjpG4n3kxNSeIKTirpD7N9/4+wOwZoAxe+ekIYSRxaFxjbo8t7W4u8ouRrYDU3iHpBBa49JNLJFLit0zx73hpQ/BRnlW5PpjNOJloxX3y3qWkGStnGZsJSGBHp5y+96/vgOKr84PWF+OJtIOMIeMA3gOg+CeraZ0rtKJDjAvVo5ql/c+GyJl+Tlx6ygtwqgWU5cGtr9/JvdEZveghvpdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3qj+3gIYkpa8RXoqj/ePJ3b1Bbxb6hP2yFSuofW0Tbk=;
 b=RxjdlrCeF9JY2Zx0hbskG3dP8wh2mYhEzQxVR+Bchq+jFTFE163bNwsSPlCK/KrfLbJ7i2azbXk+gBQB8PZ1OQAgkkoJiVxDCWceFefC4Mua+MKre5W37AqbyQOCkfPBIPgC6ZkgvWwp6gx/yjdZUV61zz5ZE6xZGwpwQjlXWWlR++2eizF6wi0ZeT+G7uhaWLpII2194O9B+XxozX83KGP0SPTHcVSsdrRqQFO3lxy84ARilCvXIVQSe/CpohiUTnPgCIavVWXvuVmMIH/9QMoM0MAonty8b/sFYmtMsoM9daNHQs/63zofRjNSyP2e+OCUQ4+jOQe79tcDWyDM3g==
Received: from BN9PR03CA0357.namprd03.prod.outlook.com (2603:10b6:408:f6::32)
 by DS7PR10MB5902.namprd10.prod.outlook.com (2603:10b6:8:86::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4; Mon, 5 Jan 2026 20:28:41 +0000
Received: from BN2PEPF000055DC.namprd21.prod.outlook.com
 (2603:10b6:408:f6:cafe::22) by BN9PR03CA0357.outlook.office365.com
 (2603:10b6:408:f6::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Mon, 5
 Jan 2026 20:28:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF000055DC.mail.protection.outlook.com (10.167.245.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.0 via Frontend Transport; Mon, 5 Jan 2026 20:28:40 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 14:28:30 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 14:27:59 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 5 Jan 2026 14:27:59 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 605KRx8l1856570;
	Mon, 5 Jan 2026 14:27:59 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id BB1E39ACF4; Mon,  5 Jan 2026 14:27:59 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Andrew Davis <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH 1/5] arago-image.inc: Set IMAGE_FEATURES in each image recipe
Date: Mon, 5 Jan 2026 14:27:59 -0600
Message-ID: <20260105202759.3715133-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260105200456.2472163-1-afd@ti.com>
References: <20260105200456.2472163-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DC:EE_|DS7PR10MB5902:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c9f5790-4fb2-43b6-800f-08de4c990342
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VNMkg/u09K3d9NxeuUi0LMiwGeJQIT1whSbMG701y9peQKExEYuzbrSHfFBf?=
 =?us-ascii?Q?0I/lLORDP7DICJpv2OXYYxNYRO7HsTSVr2tYwJu0UGsr29PR7EyQFFd+6lKf?=
 =?us-ascii?Q?E0jcyXJ0lfcW+zAk/XdWnzH4UhAar3vDP+L2TvORoVOMkHpQKP4M4Tcmp/Md?=
 =?us-ascii?Q?3oUCF2qoZdQxLaqqMuryjChGIhw55UQiGbkslFNLEcvTatgw9YOHN5c5nXVb?=
 =?us-ascii?Q?6OX/V2sU+5owLECgfcya67Ra3/p4PrAw3oaM5eR+eZo6VvjRQOpaNCbwfZqw?=
 =?us-ascii?Q?vdZS8E7erJGHGKh2O6XKuLEh2WqyMPQXbMSqssAwi39qqXahc23NTMb38t+j?=
 =?us-ascii?Q?LOtCdmhamDKAL9ysttgF3GrKBEMELiMADK3ezuL71sfgBd40zcku2p8NAZDm?=
 =?us-ascii?Q?t8M3eGwlshuJZLWF+GDlXDF+FbIQtQl7InMs0AgJnYt16DhlhAn1Xo2D2XQJ?=
 =?us-ascii?Q?y1jZo5of6HOEgGREmXPzax6STn9LicAMn0j4R+du9HdBzd3X6UeL3MfCo6Vd?=
 =?us-ascii?Q?PqdjDplpfG6xk03b0gCqGTXf/BwQDelS/qscziVt01Z6Wn9xtSdqg0Y4rGrF?=
 =?us-ascii?Q?TplhEv9zw/P+oC98rtCxyqIbbe55WDQPI/hAFq6y01GMaE2HvRf95A7/EcoF?=
 =?us-ascii?Q?IjephDWP+e7Z4z5oOgj21p0y530ZsO0EEpqo+aTc12A4y8Gg6ygvKyCeeyR/?=
 =?us-ascii?Q?MlykucA0PRmonI72oksUydSE/2hcbbklBnSGlzm15PUECiiRL1qsz2E7K7Mx?=
 =?us-ascii?Q?afXz6xjVLyUtJ6uU5NcMv2GdE1tfUDWun3fZoeo6JSIo0gTuea/cYjXfnjJ1?=
 =?us-ascii?Q?68UYH3loketKIHWmzinAncLlxuCTVgZTam5GtyC5xedgVJocD5cqZgIrFO3R?=
 =?us-ascii?Q?76Hpt9z7ZPVWMFRBigcVmGK4B+NRvOLmoSuEMgi9J/vHiN9hZYt40QjW6Pks?=
 =?us-ascii?Q?Us7deQKXfrr6lkvbaG3raIErFFjeR+rwgUskHhvpOaGKqm8MSJguIsmZ4juu?=
 =?us-ascii?Q?93+5ruMmIftTH0WyIDn077Jcc0okYt1s7eNvBAXzJYHntg9qboziJTO/ObSC?=
 =?us-ascii?Q?jms9JPLgy8UlPZ5Ai3skHlzUSga6BL2I35Izv//S+neYeBP5oSb+vAoWjhju?=
 =?us-ascii?Q?vDzXABemz0D0tix6VuQ05FMphmxw/7E8J3p7HDT3hmF4mQ7GR0HlG+iwCIwD?=
 =?us-ascii?Q?V/lvJhYydOzb3eZ50/qbZCTm9nHGpBXsJWR06eQlvp37M0+hSuRKbIjFm257?=
 =?us-ascii?Q?n2RGzW1/G7Oq8Uon03zWqmmuVYB3b1zlMFRybKIp9vPhZgiYHnUhaJKYGtdL?=
 =?us-ascii?Q?WHO5G71Wi2gtPO8nuhR0j3TAlwm3qGPGz1avwgqIAT4oB/09E5EN0GWvK60S?=
 =?us-ascii?Q?1xd42dtUx8hiCshK4ew498i3pRl+/kV850K50mISyg+W2EdH4zAAGcFzde+o?=
 =?us-ascii?Q?6Wtc5Qt9SD3yeAwAEpxNnUVOchOOyDDPv8y5AYcdiOM8GZI5Is/R9Yw9EgHX?=
 =?us-ascii?Q?H7AtZYqDF65P7KPmfN/pDFyEaRKhF4dX1pgmZ5xnHC3bRVNtUZCT1SPcUgz9?=
 =?us-ascii?Q?a5I/xDI/b8AtnuRHqyM=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 20:28:40.0411
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c9f5790-4fb2-43b6-800f-08de4c990342
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000055DC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5902
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 05 Jan 2026 20:28:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16920

meta-arago / na / 20260105200456.2472163-1-afd

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
WARN - [meta-arago][master][PATCH 4/5] branding: Remove processor-sdk brand=
ing file
    WARN: Commit message does not include file/recipe name: branding: Remov=
e processor-sdk branding file. (COMMIT-MESSAGE-2)
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
- Patch Series: [meta-arago][master][PATCH 1/5] arago-image.inc: Set IMAGE_=
FEATURES in each image recipe
- Submitter: From: Andrew Davis <afd@ti.com>
- Date: Date: Mon, 5 Jan 2026 14:04:52 -0600
- Num Patches: 5
- Mailing List (public inbox) Commit SHA: cda6ebddd8a15a790a26f12fc72243743=
0aaeb47

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
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




