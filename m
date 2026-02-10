Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5489FEA813A
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 15:52:45 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22921.1770738763816600707
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 10 Feb 2026 07:52:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Y+AJBz3/;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.209.45, mailfrom: p-bhagat@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YSJw2smO2S02o+6IQejKFS+9L87NITE+joK+iN/tSiB82psBr2I97eG0+ul3oxh/x5lt3y9zuFXJWIi6EIeVaQjUgOLSqi1WqAI+kLsCqmb8BiYFXCwMTbhHmdAwd0EC+2y1ychklACdroa1V1mv59h7ZczRktJ0r18k3FRpmVsnOwCYo8x5y2HDZdAdayZmSnXSwWQA3ZtxhC41gzti90TESSJU8+8vGLkSAiZj7+WTCfM0SBiSbvjLvIxSmkyZrCZJzNPshHZ8yYcSzRbA5jonk0o9LHl2aAgn5NgyduFWIth9tN3z0Ii6pyA/RRcbw6cdYaR/Qc59U5GjXHst6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m4kPxxICWonppiGPz/f4VufCQGvZUMw1Ih08Gn1HgX0=;
 b=Eu5wkUL0rOWCqKUwaazd4JDPXVsssAP81iLzB/63m8EMRua4GxCr0P95vrn94kBCKXtjajeC++aAAJoavADITyRAohXFaHkw49i3zf/Ci02kSiF/VqejEnOOVonlHqI4Miq+N4Z1dy+fdKEA3e/FufXJN+zPCnPqWPnZygpatpckvWsluEd1xyDL+PJ7Z9iDiV84XpNG2xo7EWW9hfHOqOXFyP+TxPfMbb+ah0imUQs89xjY4LmCOiDfxdPdHKUJeA4l0bO0rQ/tm9POlFuKvUejA9CdA4BMbh4z9oMxgTz2u5ubKrkCMVajhGgWBT0aXIkvels9OPTB2LCfVBnvFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m4kPxxICWonppiGPz/f4VufCQGvZUMw1Ih08Gn1HgX0=;
 b=Y+AJBz3/9AYeXnZOAHxHtOSpHc2KQIEzv4RkQvzPyJGbhLvSM2fY1HxQpL8xvOTaNGSCcr6uLWMyif32JzakQB+Ys9+bNykCdQqmoidhQu6Zr6R/DrGAEMIFJnpY+ZHTHHK+cyfE83ssi+gy3D5gwhdOqdZ6+MjgfTX45vTtRvo=
Received: from CH0PR04CA0068.namprd04.prod.outlook.com (2603:10b6:610:74::13)
 by CH0PR10MB4890.namprd10.prod.outlook.com (2603:10b6:610:c9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 15:52:41 +0000
Received: from DS3PEPF0000C37E.namprd04.prod.outlook.com
 (2603:10b6:610:74:cafe::ee) by CH0PR04CA0068.outlook.office365.com
 (2603:10b6:610:74::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Tue,
 10 Feb 2026 15:52:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS3PEPF0000C37E.mail.protection.outlook.com (10.167.23.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Tue, 10 Feb 2026 15:52:39 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Feb
 2026 09:52:37 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Feb
 2026 09:52:36 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 10 Feb 2026 09:52:36 -0600
Received: from localhost (ula0502350.dhcp.ti.com [172.24.233.249])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61AFqZSB3797425;
	Tue, 10 Feb 2026 09:52:36 -0600
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <denis@denix.org>, <reatmon@ti.com>
CC: <praneeth@ti.com>, <v-singh1@ti.com>, <y-hegde@ti.com>, <khasim@ti.com>,
	<j-sahu@ti.com>
Subject: [master][RFC PATCH v2 3/3] recipes-core: tisdk-default-image Add pipewire audio stack support
Date: Tue, 10 Feb 2026 21:22:01 +0530
Message-ID: <20260210155201.3029549-4-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260210155201.3029549-1-p-bhagat@ti.com>
References: <20260210155201.3029549-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37E:EE_|CH0PR10MB4890:EE_
X-MS-Office365-Filtering-Correlation-Id: fc28a642-f0b0-4273-b8ab-08de68bc6b13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?O+Je9c+RXGF1ordwZoKR0twcT+PWTxdrkBS2xHo/hh8Wxu1RxOpY1uzEUxzU?=
 =?us-ascii?Q?zfGTE8TdKBop2Ty2v2EUrblmIvjNhi7u94DegTgAL9jkOICnRdPW7dIaL8Zt?=
 =?us-ascii?Q?iYU5e2iSKE88YkqlDtKLqJSXN9/VAIyH4roejmeyG33cabBhK68nyznr2Xtd?=
 =?us-ascii?Q?l9vn3cpgZl/beHFxgqlNYeg/wcpB0NaUuRZN9l7Jzhx/uPA4pbE1ChAvOaxS?=
 =?us-ascii?Q?yqnhuSk+B1tNfHiPC4OinbGdsO+YxeSFzqdtNfvpg9myTvsKTvSdAfxYAgvf?=
 =?us-ascii?Q?t9G4yxcmCJW6UXtJI1bDitPvhxyQ2hgIh2mkE2tSV1uMD6kiv7mw86U0gAli?=
 =?us-ascii?Q?rQ3CF4/Tw/hwSxvfvCxDB83NsPUYGkLF6/p8y5yWfIBIRhRW2LfnorHozG5b?=
 =?us-ascii?Q?iRO0NFYY/IiX29VKlkDrdeJoEVccIG+4MLx0MsGIGIQQB5L42Vjd2Z6H/R2M?=
 =?us-ascii?Q?Ujd9WpyR7eDVXNiPBtyiMwJZIK75YQrvUlWFMa6Iv5D6XKFsleMfNNNJZBBi?=
 =?us-ascii?Q?kKYtdaq6uKRD2AbYH/ILalp2HNlj9txL5+5hLZMPpVFwjZhiXMqZAmYWJWe4?=
 =?us-ascii?Q?IS5x4v+4ZsRhgeHx7ESVoVsHi9AZS2dYttwjM03UGxE/OhWs7coqDNfxBvU7?=
 =?us-ascii?Q?7PdKmrY4keVQ8MfoDt3fwQfwJ9f0WMYUX5oY1f9ayC2l3XIngYO87y5VMNvX?=
 =?us-ascii?Q?qhnnNWQIZhGlHPoBijBSM4Fk+j7ogKGYL8ZrMwhlzKmviOUMuzQpblyqh4a0?=
 =?us-ascii?Q?mykkQ3EprkGgmk50+RDw4Q0ORKsmhe364AB22pGqhRx6USUisuht+pgmXxFi?=
 =?us-ascii?Q?aJgi+bK9/iYmDZsDX8GIioYzGEtqPpp/+K0knGtXCUIw41pq5eXZqmOakiHN?=
 =?us-ascii?Q?FXdGgI2GJCRsn7fpBuwMaHIeHz3a6bweHZUJzrNreHQSo/DQMyJZmHouKT7G?=
 =?us-ascii?Q?yktSbo6PYJArGdgEpwLI/x+3WcX+bcor5D8JlFgj2n6x3h+FsLa9FY+SnZm5?=
 =?us-ascii?Q?VgckK1ggqG54jxghR9M8vbENunYWR3SbLz6XcFJsWTG2o/2YMudSr11GiSa+?=
 =?us-ascii?Q?5iXfonmJy9eR4x2DCPnAqWVJZp17tDdYmfHKURk3IsDJtEh/sfQxwwczTpIi?=
 =?us-ascii?Q?mTPVAvQL6sFI2BFV+XeoI1dVg+A5TFFJv6nZzidUzBf0kMAhCR6hv7LpH+tW?=
 =?us-ascii?Q?qGwhHdxAvwzhvyxXVgukT0O/VjJDxWxKJMUjEXg2oGezSm35X1LskwY9YBO1?=
 =?us-ascii?Q?pejgCr4Kx0MrS2BH43FiQdZmDUs/YkmUqHO3A5V1OUpS3/ohUzaLBDktWl6U?=
 =?us-ascii?Q?dKI/zl3CV2dn2O1UtaNusjKmH0s9yNh/RHqWuqUe242n/OHzcFfMB9CJTs8k?=
 =?us-ascii?Q?QvsgUT/dJfcU00bdjADpx73S21X6lfGh3VBbXbU09siovX/NjFJ0sSkeFE0f?=
 =?us-ascii?Q?PlzKfCiRhbU26GzjQBVHaJDj+KGL26uh329hAH2Xtf2aJMtcvMNYsiZLO8Oj?=
 =?us-ascii?Q?VIUmzRuioj+gY+NKVAU1EPBjqx8bUFVmJKKTVK5HKuJwMzBliuAUlUlVines?=
 =?us-ascii?Q?1yYCnndA0/1n+62jGEn4Sww/QKT2wRebe3fZS9bfog9VXU+6zFo7SpKJTgU3?=
 =?us-ascii?Q?Nm5tTqrXrItiDdnvF94PP2vuCpoNt3rBQ1zlymkgSJk41LSaqJe2SATjHzCV?=
 =?us-ascii?Q?2IAIZA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	fjHxVTVlkOzwoy5JMzPBQP1D2M071vu6Op0o5wbWwDYUOZ2b8a43V3hY70k/QHatOzVCJ/PqY9f9wedVOekcEGJgToWH5qW5hsO9GE5LYypB9SNWOR5tiwpjXGSLCpQB230xX2FOxPnR/LgPF3Y64dMDcbt+i4CgFbakHW46thANLfKPukiqp5nrVu9ZOvgUTeNzguVgYeLrypxn58W8lDPaDQv9Q9KtMryI5V/pRpa60IQTr26K4CcmkdEjFZERI/j0f0EbYGKcEL2wTOVyVGaLPRGgiZ2O8VOekEg+cbknknwcxQxT6ObH9uDRAm7KMw4J1npEP6ftcJutHeQiiaudSerF94bikOYTuFhm1nn0TxOZxpRIFC4F2LZUTRjIqAO9M2ZybI+CeCxqKaFkJ9U/orSBX52y/yjovNOQN8wwE9dMCpI5vZ5AmnPgbhmE
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 15:52:39.1745
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc28a642-f0b0-4273-b8ab-08de68bc6b13
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF0000C37E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4890
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 10 Feb 2026 15:52:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17097

Add pipewire and wireplumber audio stack support for all am62* devices.
- Include pipewire core components and tools
- Add ALSA and PulseAudio compatibility layers
- Include wireplumber session manager
- Add GStreamer pipewire plugin
- Configure pipewire with proper modules and plugins

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 .../images/tisdk-default-image.bb             | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b=
/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
index 27c5671c..c442e2ba 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
@@ -43,3 +43,26 @@ IMAGE_INSTALL +=3D "\
     ${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'valgrind', '', d)} \
     docker \
 "
+
+PIPEWIRE =3D " \
+    gstreamer1.0-pipewire \
+    libpipewire \
+    pipewire \
+    pipewire-alsa \
+    pipewire-alsa-card-profile \
+    pipewire-modules-meta \
+    pipewire-pulse \
+    pipewire-spa-plugins-meta \
+    pipewire-spa-tools \
+    pipewire-tools \
+    speexdsp \
+    wireplumber \
+"
+
+IMAGE_INSTALL:append:am62dxx-evm =3D " ${PIPEWIRE}"
+IMAGE_INSTALL:append:am62xx-evm =3D " ${PIPEWIRE}"
+IMAGE_INSTALL:append:am62pxx-evm =3D " ${PIPEWIRE}"
+IMAGE_INSTALL:append:am62xx-lp-evm =3D " ${PIPEWIRE}"
+IMAGE_INSTALL:append:am62axx-evm =3D " ${PIPEWIRE}"
+IMAGE_INSTALL:append:am62xxsip-evm =3D " ${PIPEWIRE}"
+IMAGE_INSTALL:append:am62lxx-evm =3D " ${PIPEWIRE}"
--=20
2.34.1


