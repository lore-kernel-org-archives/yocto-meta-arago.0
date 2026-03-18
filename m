Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60A1EFF6E88
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 08:36:48 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.32])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9312.1773822994457128141
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 18 Mar 2026 01:36:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=RgNAhX9P;
 spf=pass (domain: list.ti.com, ip: 52.101.48.32, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yt36byP7R/73FoOezFskpuab3nQcS1f4OqK7HC+lPtf1CbyT8xprz/f5EGxINK0h0Xvo+KHTeRIDtK1m2O/C7JwWJIRdfcm3P8JHMssnzONB864DfChJ+xy0yGdgewxk2cntprbcFoiTKFWBCrVyksYOl8e99bmN2n0iqvZxfFSmqcSIFLzBH66r7PFMvR2V5HXkIfJovNdAEKQJZqJRPmFB3ilOJSbElmymZqY0l9mHRbj+BtlEQGqa7771PaoIAp+GcNlJG/3tHTuw1SOcQUXUuQQ3m+YmRvsghy7bDM4lvxAMEP+oYwMOrT/CnVKR0IZajoc+PNKszfcuv5Q6zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w4T32YRCkkjQjIt14Kt29cTdZzrmHTvZdkRlGEvZC6c=;
 b=bn0syVV50TMibZxCi5IKZD/bac/j2VZWPhbzW+JlJbVu2BujQBXeOZxB+7726MNJ3m1ky6Z76tSmE1bt6hUHJJak/+JDdWKmdBi/7VLA/D7/lxiEEHFREG+6C+3zdxKRQyht+KQcD4cm7tVD0OhHNB8x2r67v0EUBmT/tq4wg3VeWG6pRhKohG1vekCC0dNTCmDFmoDgAsxnPsa7xe/AuD2IPTo/Ac3Z+SiC3PT24DGJg9UPl9T2UM1Tee/nQo4jW047orDC1vrC6siojNOfrJGjUBV8OEn12Q+GrNIDd+vZHQ+J9bF0QoGrOdQNMkGw+WouC3297+JTxaMP0tI9Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w4T32YRCkkjQjIt14Kt29cTdZzrmHTvZdkRlGEvZC6c=;
 b=RgNAhX9PbdGVQrWYgSuNHwHxTgGYSK5Ds+rNPEKRAFQ55mb6qimO+7vJTTze/XAC42UNW6XkUycNiWP5VpcPBTJbPOZOB2nilxVnJ9X59hEI8JsgZR3BZ3Dv6YEqalr0wFwbdzT3tRf6FBnvVYHVaNwGFTKonQqxjChVittMVIcvF/KJdQjvXMnvDt2zqEPM2CIfC51/oIqG+sR+IbYAWJXfTujIy7Y59B/B04Uc9n4+UpYsEMPa/q9FSZ4ECzVU9+i+N56S8lgGNoOuiGgd1w4l8E/KFyoT8/FbBS7AYqvCSCpGpy3xJ1S64BG741FLSTIMSA3ZHGYLNKvMDwFSLA==
Received: from MW4PR03CA0255.namprd03.prod.outlook.com (2603:10b6:303:b4::20)
 by PH8PR10MB6670.namprd10.prod.outlook.com (2603:10b6:510:220::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.25; Wed, 18 Mar
 2026 08:36:32 +0000
Received: from MW1PEPF0001615F.namprd21.prod.outlook.com
 (2603:10b6:303:b4:cafe::90) by MW4PR03CA0255.outlook.office365.com
 (2603:10b6:303:b4::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Wed,
 18 Mar 2026 08:36:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MW1PEPF0001615F.mail.protection.outlook.com (10.167.249.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.0 via Frontend Transport; Wed, 18 Mar 2026 08:36:30 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 03:36:28 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 03:36:27 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Mar 2026 03:36:27 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62I8aRCO035739;
	Wed, 18 Mar 2026 03:36:27 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id D1EDB9ACF4; Wed, 18 Mar 2026 03:36:27 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Pratham Deshmukh <p-deshmukh@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <afd@ti.com>, <c-shilwant@ti.com>,
	<denys@ti.com>, <v-singh1@ti.com>
Subject: Re: [meta-arago][master][PATCH v5 0/2] nnstreamer: Fix buildpaths QA error and establish test dependencies
Date: Wed, 18 Mar 2026 03:36:27 -0500
Message-ID: <20260318083627.3935169-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260318083015.2295406-1-p-deshmukh@ti.com>
References: <20260318083015.2295406-1-p-deshmukh@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615F:EE_|PH8PR10MB6670:EE_
X-MS-Office365-Filtering-Correlation-Id: f3de9af3-8f39-44fe-c394-08de84c9740b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	clRXvoy28oHs2lIq2Nw+V1OnWFthAWfJLnylaYXm10FQzSUhQf70MZG9xkWDalzaxcU1XACwy/kYcbwVhL31hC8oQmS+Pal+UbxJwgGFzHGAgjWg6rIiQpxY4VRx6iAiCKJfWVu0P43aUfmwawXy8fDuQgEgmGZPSxokFio0v6GsG2Gr2yZMhmSbMnlhF25w6KtG3fd+c986Jh8nGWFE/aB2Xp3Qj0ASz1XnU8YSVV7XPAVvX/imVbu0g1T0/AsIJNc16o+kWFo6IQMIUbfXOeSkqjaoPjRPM0fGb4VC7OUwRHrb5KMIAPWoC0HdSK5ozlG77e9/RJFUfDpnHIyQstULP9Lbn1rCscaj6dTrZb8tu2POsbF09LuGA/WW/Y7E20yckYQSbFOc8zzn0+PwCp1KECmFh7kqIchMY8Nx2ubItqTlbioW/04tJuur7iBFyzfLZCMELvT80U/0f/3x7d+rFTQuPWVHJQK2J3y6Rr1aI9U3d5tvZfVYq9Kaw9kFYRDi6HplYYpVhMBH5wDmJHrt7R6oHbCV+Buew/JJaj5YR/J2Ro3dH/3Y3TkjfPn6qzGZPqxXJYiPpjAIY2FA0YG+C11dtM3u6BRcxAH3Te48R2qbFnVUwmoBmEp59BfZtMgTR0Tf22ejNbc7m0YEa2emm5uemCeycEFaMZerfhJDLozx+AcdzckAizf78q/Zd0NykqlDsPI3a6mWLqEPlOKnee0Zkdr8Oo8q6QjYeec=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	0QPhH7wkt07MP0dEaIpG+PkuGxScyr9yGwaF68ucmuVgf/e1B6NjWO9W4D/n02l24oXFWrbqQf7TmGzkJLynCOt/QTYtjKxB1+dLK4YIlyRW7Pgu2D0jD/pOnpLcjMsLHOvMo2fqdHsqiSN4hZtx3rJMwOTc25tCMozbKMQygIiIwwh/e9I3o0OrS5m0PX8N8LOG9B3IEkCKm3GIi0ZGnZY7W836PiOwjQkUqtJkFOXGvuI+ifYu8+lKrCLyVj4L82aeOzK6bTwCgyDF0/ww0Xoeu6T/7xDyO6RFo/W/BmGwTuxecYLl1jFhW75n7kIlUMSxpjr8r2pz8/eMOspGTO/cC65B+oJ7ZswnKp/qPaYGMFq7P+vl6wfON0jHgNP7D7467tJ4Nkd3BLZlGpm+06RlASWX1aJqpjtEqOSnH9qb+HyFFLEajrbP09wy4TdL
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 08:36:30.2030
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3de9af3-8f39-44fe-c394-08de84c9740b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MW1PEPF0001615F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6670
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 18 Mar 2026 08:36:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17398

meta-arago / na / 20260318083015.2295406-1-p-deshmukh

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
- Patch Series: [meta-arago][master][PATCH v5 0/2] nnstreamer: Fix buildpat=
hs QA error and establish test dependencies
- Submitter: From: Pratham Deshmukh <p-deshmukh@ti.com>
- Date: Date: Wed, 18 Mar 2026 14:00:13 +0530
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: 2b7424b2fc6070f9b8ccca3101fb08e60=
d0f1450

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Thorsten Lannynd <t-lannynd@ti.com>
- Commit Subject: ti-test: Add request and websocket-client to packagegroup
- Commit SHA: 9fad73b33f32eb9b48a3982a5e64d1ab3c8a3425

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
ERROR: Layer meta-arm is not compatible with the core layer which only supp=
orts these series: wrynose (layer is compatible with whinlatter)




