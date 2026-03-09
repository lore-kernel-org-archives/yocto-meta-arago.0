Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 333FCFD0051
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 06:13:20 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8120.1773036793363504068
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 08 Mar 2026 23:13:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=C4iLvhkG;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.194.52, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Th80QhApWubmscZNyjlCL6wKCCfD4ThD404Zh/jhfQkzLfWLy41vP23bnmWhQwwImK85R31yzGdYmRlKWEruX5mMkd4hh/i8Vnoycm7F8ac3E8sIk4/58d7ulELvJ/XH4y6VST0GgABkt6aNtNL++r+G05BcC46gqU/i4aKFhnVbXgdxELoM7A9iRXrnukS2TaquIpdfeqaS8t8jn+B4sGz/2zcy5ENdLuMqS8qqGheQVPIHjKcqzx+DjdmxFkWrATZTaHU0ZAS5W57r9a8gg0po+MixIwG8K+3gkGcZJo2tGQlVYEft69gslvpITdUMZZvRB9cAUeWTHhA5Ut05Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hZy2g6/aFTJw+syID/scT7ap2bWsbFSLAx2tmmJHrjk=;
 b=ALhBVgsk/Xivtu0JoLMmL3MK0L7mXoLFHEQ6NgwtpQXZrHCMHY7d50Q+azu9iIqUut/B05VDx/AaRa2JnFCAOHexGrKtU9MC11J3Y8GaX4pKQzXZVFwg5/hDMumTyrrklDYCzIe166unOnr3l+DgmrrekNj3ho0xPNoIJCJzuOOJvzzN1DNgOGZJk8omxBdHJpDDDXy6ijA8raVD7wLSuV16+5RvkUBJneZo9HOP0t15oqi4+p/Fn0Zl6LN3ob4pMhiGmyMbCPtpr47yrBzyl7chatKe5bwyd+/InvCH17krHFstlop2X+8j0cfQyl4qkrkJRXF9j1EsdJteFcxGvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZy2g6/aFTJw+syID/scT7ap2bWsbFSLAx2tmmJHrjk=;
 b=C4iLvhkGvSTf9qB9t+/yPtjK88iGz/pxVdm8Q8dWhTsvnP40oeCX9WDWHn/I9R6k8CcMnqdjJ6KCCtTS497s4oZsDsEBFvNr7LrSts+TMnhGfkgwu9x3SAou+j0JvjSwV2mnB3nKIzPqZTK2mfZOVKNcA0pK1+KQfxmy6qnxrN0=
Received: from BYAPR06CA0031.namprd06.prod.outlook.com (2603:10b6:a03:d4::44)
 by PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.23; Mon, 9 Mar
 2026 06:13:11 +0000
Received: from CO1PEPF00012E5F.namprd05.prod.outlook.com
 (2603:10b6:a03:d4:cafe::89) by BYAPR06CA0031.outlook.office365.com
 (2603:10b6:a03:d4::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Mon,
 9 Mar 2026 06:13:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF00012E5F.mail.protection.outlook.com (10.167.249.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Mon, 9 Mar 2026 06:13:09 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 01:13:05 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 01:13:05 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Mar 2026 01:13:05 -0500
Received: from pratham-TI.dhcp.ti.com (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6296CxHo550296;
	Mon, 9 Mar 2026 01:13:03 -0500
From: Pratham Deshmukh <p-deshmukh@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>,
	Pratham Deshmukh <p-deshmukh@ti.com>
Subject: [meta-arago][master][PATCH v2 1/1] nnstreamer: Skip buildpaths QA check for source package
Date: Mon, 9 Mar 2026 11:42:54 +0530
Message-ID: <20260309061254.3942533-2-p-deshmukh@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260309061254.3942533-1-p-deshmukh@ti.com>
References: <20260309061254.3942533-1-p-deshmukh@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E5F:EE_|PH0PR10MB5777:EE_
X-MS-Office365-Filtering-Correlation-Id: 6af38514-193a-4101-e6a3-08de7da2efe3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|7142099003;
X-Microsoft-Antispam-Message-Info: 
	bubWx4gSkGbRJr7/z3AkVyoeD4jzholJHmmRcLrGQTGCXislSj34V/f9EFV8Q3TyX8Wia0illJ0+OQY6Rmu9IJORycc2hqEUZrpy+JPpbfq64btrnGVE8SplBQMSBCTmoQHVgK9Z1mVfsOAu72Nb6ZRjB8AQR332tjKDnSHvv6zqoI0TivX2KMdNeNW4Nr8JawcrRH0kqyNwBoE0ZRKvwHxPflZwEzOANTTK2VW8+ZQq6vjgSbMmMOVLcMZCWmBY9GpsiHhxF/zgkmR/xXi1i+JBM/Fgl8J4LJQeRW1BBTeozPeBe2Q9k6ZrKfuO00G4b74hE54A6onxm9OccUu35MN5WFo8i8DzpFAHIX4eYH5I24uJSzTEK/dhNMrx3DT2/Qz/p+NEGBBeVw6v00yVA35Bi9YjBGyzNlRCvRsH0jaGfwmTUf8qPPlDtpACcr4YMDq5XDHh4BvIi3PKQBlk64kdR8w4N8Hed0ImXnMyNmqIPvVTka6XYgr4N/f89+upHo2REJaoHOp3ejzs/hnUcojxsVifvzuXp75RwJJcTVQI3rYGCVIB7rghL/vzloEU9YYOd7gaYZ03tXF5hO1XNEnD3xgXusEaJUGdjUngUqyUDmhHUEVA1oLmFJznOE58HVPqk67i7E+NquXi9ejt3Ma3jA200P5hBlBbR/SffxW09Q/Gqoc+PkKRF448MdYdqXy2of2i1SCHADEM0aYgcnFrZ0ChDJI+FVp5VprLe/mPK4qiRc/XNMi6XYlGiXqGUho4lkdGhMME9gK35JmhTw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	LmH5L6HWH/3L3sTnMC5RbixIVRnFA3WUf/bcN3zFWJqGC59hsxAkmyQ3CSei8CvpgMJdTaVR/NjP23ULNWowAmzRSHKCqhQY61rVfd2odLteSEXLR7qDG7wm0A5tqmveCAOQeabtXFbRBzFRxbQ+A/S+jVguG8v3bckUEDnyGV4aOppCP4nRdlaLejnKt9UvhaCW8TxcMmwl0Yd6Ot3aE78Gt9xWJEl3mjw+XO9vxPdLlqMMzkZrbQFeuhh7BTW2jLHTSYY/mSEkxEBlcNrZtvxJAGci2nf1GMzI/YaVa+Ua44Og3KfWc8XQ51fXUTk1n9nTJG0mkTc6V+4ywn5ePAhDnOnVQHVf4GN1IIgXNuTmD2XGh6aJbcB1e6HmmTHm8TUtRQuqTWtI13KvxofnS/Bi9+2CxnXiDGaQpPdp9/UPRybkzRBUbOk81saPdQuW
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 06:13:09.5257
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6af38514-193a-4101-e6a3-08de7da2efe3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF00012E5F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5777
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 09 Mar 2026 06:13:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17286

The nnstreamer-src package contains debug source files that reference
TMPDIR paths, causing QA buildpaths errors during do_package_qa.
Skip the buildpaths check for the source package to resolve the
build failure.

Fixes: 319271fe5fc8bc3016b1eb765784076af666b61b ("nnstreamer: upgrade 2.4.4=
 -> 2.6.0")

Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
---
Change Logs:
v1 -> v2:
 - Added fix commit hash in the commit message.

 .../recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb           | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6=
.0.bb b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb
index c62589ac..74d72d9e 100644
--- a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb
+++ b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb
@@ -64,6 +64,8 @@ FILES:${PN}-tests +=3D "\
 "
 INSANE_SKIP:${PN}-tests +=3D "buildpaths"
=20
+INSANE_SKIP:${PN}-src +=3D "buildpaths"
+
 FILES:${PN}-dev =3D "\
 	${includedir}/nnstreamer/* \
 	${libdir}/pkgconfig/*.pc \
--=20
2.34.1


