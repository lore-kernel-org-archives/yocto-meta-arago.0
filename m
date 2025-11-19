Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21225CF34B0
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 13:06:47 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6431.1763557596636461440
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 05:06:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=SiXHgVrA;
 spf=pass (domain: list.ti.com, ip: 40.93.196.48, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qlo+3iOVhR1Zl//FDIdraPqUaZVzIjjfk3WIst5sNZTyCRft3KirnBr54B8sDkNtJajTIkGyQN4g8T/o0dDR1Zs0RoaUeve6DyJSJks1BvBcM3OQOAyLlxpMOnIjSAh+V14VOx1aGLqbGc7FA9u4NoSHMgHgpX6umwBzNB1yx22+/k/dAxMgZkLtfhutKxld9EwJhZL6xoi/X6Ue3lTFT6XlBsoKQKuwwp+qODFs49y5Wp88wDp1ssopbwDcXrfSC8wmaXnAkmCZ2XepIcs/M3TlL85u9BDjTy/rnP0r0U958gZaP2pfeMa1V1KNA98Q3L24HYEQjgXBxM/LmhYNow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xno1B+GmguPDY/GIr/EbfE+4BPi4YXauuP9MUHyhO/g=;
 b=w1Aa9D8+QlutUXo73PZBbsR9MrQa7knVa/N6g4bn4qULXg92F3A4Iiv0EzG58DBpR/mPuWoucZbEAaNWk/LcI5EUkz2SLawgj7/B7vJM+AAMLHwrm46BP5566b773PoYrODgLGKQqViQ19pTAFH2M2+JqsbRfVyIu2BKXGgAFqkqv25/rlD54AWMzVBB4UHp+BypU6kZt3wa90/hHrD3kD9nduTV/nbdium3u6kJ34bBBscF+iGoLpll3+Yoav/go3KpwgmqqeEqYB0kOmuTh8pTn1TJ1IVkpxUNj26E0a+W4LROn/QGLpxHaojypBfwpNqS0MVCdD55YopOUcnSCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xno1B+GmguPDY/GIr/EbfE+4BPi4YXauuP9MUHyhO/g=;
 b=SiXHgVrAx1x/Hay1VHGrJriWemKjljp2AGOvVneAD8GkobbIG9oJsLQZamW8kvrm2DxRANHzrxWHlV5LZq2v/f0MkTv09BWda9lueSbnkDQuUcdYnr9uuyLgwAQJQxqouPnLjrRzwoSIL+Xpf2UXJ29HybL0W/+ZuTjrBvijIBBkR4ZjpQVxmKPYn3WCXSYQ7hznufADrN0y+YyzLeHDq9wPUDRvbLcGz5b1m/Ufa4S9CI8jkMr1p84y83yX0YCISuozgwMwh9RhRvFu4zp/kisepWW1G+PuqvPiOfDBWtvk5Hiti6bDL9ksZ+qdI0FvIwiPEIP2q/UGXCOryv3Bjw==
Received: from BN9PR03CA0928.namprd03.prod.outlook.com (2603:10b6:408:107::33)
 by DS7PR10MB4864.namprd10.prod.outlook.com (2603:10b6:5:3a2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 13:06:32 +0000
Received: from BN2PEPF000044A9.namprd04.prod.outlook.com
 (2603:10b6:408:107:cafe::95) by BN9PR03CA0928.outlook.office365.com
 (2603:10b6:408:107::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 13:06:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF000044A9.mail.protection.outlook.com (10.167.243.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 13:06:32 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 07:01:24 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 07:01:23 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 19 Nov 2025 07:01:23 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AJD1NIS1907897;
	Wed, 19 Nov 2025 07:01:23 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id BFD9CD6F2B; Wed, 19 Nov 2025 07:01:23 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: sadik <s-sadik@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>,
	"Prudhvi Veeramchaneni" <prudhvi@ti.com>
Subject: Re: [meta-arago][scarthgap][PATCH v5] coremark: add Coremark CPU benchmark
Date: Wed, 19 Nov 2025 07:01:23 -0600
Message-ID: <20251119130123.3966363-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251119124115.1228847-1-s-sadik@ti.com>
References: <20251119124115.1228847-1-s-sadik@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A9:EE_|DS7PR10MB4864:EE_
X-MS-Office365-Filtering-Correlation-Id: c0316b9b-5773-4026-ce47-08de276c7611
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?qSwlBz6IID+d9u3PpfP1GSPTIBrOMwj2pQ32CG6aCW7k8rbywppsww65uFSQ?=
 =?us-ascii?Q?me34vV5aqPWxzcfER3O7VcI/8FFPipYvGfamtsV4OUNg+1dLCaYRQS5YGrTP?=
 =?us-ascii?Q?xvvPimi66k9mba2FcW8vsP0clZBg414u5g2m0LeOVzVEp4T1xwxXc6KCy4p1?=
 =?us-ascii?Q?RH6kVUTzvGmS/qERF/y8S3BHVKfn9ORYqc3giTuMT4haHAfLQObbfvhCkec0?=
 =?us-ascii?Q?U1TlEH/zhguUG/xfNhqv9ilUvGR9/F/wR5ZswSkW7v3pYlu7V/CmP985xor7?=
 =?us-ascii?Q?QQbdRpiR1KJW8N8iOF/YbR/3HKZ2SAVLICe9CNkJsigin3tC7fUCmaAVDxOv?=
 =?us-ascii?Q?ck3za94061IyaGueWbd4mk7LxB2xlJpNfXCoMtVIWaSc8ABiDvYLca4Tx6ha?=
 =?us-ascii?Q?Zk5dXbjgSuHws/jQYtTys0qVkpGCOlibtut+ykP2+RxtX6wv3q9e2OC9y2kK?=
 =?us-ascii?Q?i2SM07q6H2xDXzZhDhfWJwYP2VfuqJFjDI7cBbdJFVXtgCBJqBK1ip73Jpry?=
 =?us-ascii?Q?kKoAbNZKrOs3kUOLZfsxKUaB22eW1Lh5LBQKb0OOI6+xi8sOj93cfBKjJ7H2?=
 =?us-ascii?Q?Z7klmKJfI9ZwWlo9ezsOsmtntNH0TfYDySnJAElIByWuwMJ0o78PfwFrUKeQ?=
 =?us-ascii?Q?MzBqT2o5ZwQrlc1XDJnSC7Jnr1mlpUws58k0rl+4u9SQLSDQRk7o07kKhp1P?=
 =?us-ascii?Q?kkt/rc0KpcMjSTUMTpSnF2chmBnqWwnk6nDdYQOBrFxdvNcDobGgEH3nchM9?=
 =?us-ascii?Q?HEd/0oJEWgexe8IK0RFfD6FGc5L7muRYI6AiUsgE014gAyBjPHxIaN5S/5ZA?=
 =?us-ascii?Q?b1ilnfWZV9VXgpxajC8VqM6qHtcckbvtGGuRrhQkKnsLiQ/bXCPD+IUFRU9T?=
 =?us-ascii?Q?0fAns4l+hIg2oUfuIqqNwLb5Ux55Bkv/5wPtOxT9MoX/oVDE5dPgpz1f29pQ?=
 =?us-ascii?Q?uHQIbHtE9L9HwT09TKDKHoKwItiUvxAVsuV7UtZa4yfIX5ER6sxgbf3WGjFX?=
 =?us-ascii?Q?6pwyiC3Qir0GynBeKF8JgDxJzE638RwBAHvAn1SD0XdSGQf1oTEUMQpXem4Z?=
 =?us-ascii?Q?NRgIayryYOm0CVK0NN0gT4Zshu5i3j0bu5VN0Zqo6RQ76zXf4Ivc+iDIo2+O?=
 =?us-ascii?Q?Djs0Z4AHEaDsVbXU7bHXpcjD+kwWwedglM1TpBMaw73vj44fLLEj18bvQRSq?=
 =?us-ascii?Q?t2bKSwH5wSFqm9Y+S+QluLPnUOVv1W/bY5dQMMy34cJW+XA2pr9CG/o9B/Q7?=
 =?us-ascii?Q?gHQng4lPcH/DoPzk6/KtJbDa4PJnzYg+mtylvxL6e5fgt8D2aC7JnCQ3FsmS?=
 =?us-ascii?Q?ffwTOtqsUE+ZjqKKjltSfi3K09KUiNIxjKEY97t3j+mXiunhuoaYydQgIJad?=
 =?us-ascii?Q?ns1ZuvJFBBvtUTuyHig1mZMzYT92XAALAQbh8fggUV7dh48Io5DIizxn6ACu?=
 =?us-ascii?Q?rhfTCxy1hOZ/0BbZhAcs/RInXGAqqf8BtevU+pluhPKTCNe3XrsZC15QMe80?=
 =?us-ascii?Q?KQylr4ZzcfHC/r7BhWru9TAl6HmwdFIyPBJuQzyWF3+I+IKW1qPVYFY5fRF2?=
 =?us-ascii?Q?fvQC7693BnhnQ5TUsTc=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(61400799027);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 13:06:32.2798
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0316b9b-5773-4026-ce47-08de276c7611
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000044A9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4864
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 19 Nov 2025 13:06:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16794

meta-arago / na / 20251119124115.1228847-1-s-sadik

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
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][scarthgap][PATCH v5] coremark: add Coremark CP=
U benchmark
- Submitter: From: sadik <s-sadik@ti.com>
- Date: Date: Wed, 19 Nov 2025 18:11:15 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: f0483216d603022e1617941c0ad9e16e3=
7f6a969

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: v4l-utils: Do the version bump in a yocto-check-layer com=
pliant manner
- Commit SHA: 312752656aed73c1187d9d0cf5d246e5731965fe

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
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
scarthgap - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




