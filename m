Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72AC5E8B381
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 23:03:22 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6935.1770159794650682159
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 03 Feb 2026 15:03:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=DzMNevBq;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.201.33, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g7XacNyF/ZICis5NNRcxpvaiopiCwnFcLv9JFacNAnV5XzUeU4ZptXNr6MB7heR0zk3ZJzUMjJIR6Vdv0DdKxh24lgmES/y8N5HQbCJjlpUN/GvHg60nUcrF3JBlNVMl5+KRWAPYTSo43HOAD0dvV8VwmLKEYIH7hDK/aVEMWU6I9fEJ7juWZlUUvrWokwdP/KFXgK8hEKX1+m5x0wUgKUlrKyxISM1BXQRcwTKHP/tPllbxpkRftzNyPTpcM+3UAp0IInbzdTi/5Kf3j0QVla0Yc6b03QBdplxc8lET9YpiBTrsR3MTtCS4LMh+a+VQFYVCZ1UnF6szuCLZocaihg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2zDHQjxTaedRAGlddoObIJ/1O9lWP0FcNvwCZRKWk2c=;
 b=QwgraG4UUbf0taGgoef7g76AfXpPubGGsGT7DhExOzGgXdkO57Hnejz2EExfsawUKjkMSB8da241GXgZrRdWnMvJnOUSDjyPw9XUrPhgSMKlNdakA/FuhzsHekHLSjKnzHGUxJXdR+o45Wqj7EY2ajxUlub3qva/eZrZ2Reo76fQD4fxycUd9Kl4/ClGBg3Yo66dhKUkbS3O6uoq0uKlmf1FjrRzOW8iz9PFi+g2VQDhvWuozB4v+V9XdrfXqDa+3N1KpnjH7aUrfocE37Gt31N623ovTTa7MlJ0KtpiAKJCz/wUcQnjpVdcdpLd0cic5rH3d8TrkJ3X3gwwAI2aAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2zDHQjxTaedRAGlddoObIJ/1O9lWP0FcNvwCZRKWk2c=;
 b=DzMNevBqZ8VZcRQlBxb3kgtLKm99XmTZiFTTn99bjrj7EVPsj5U4X2AyIHIi5kFOJUzfWoQkCHSm9ZA3Uu222Jzy7DfgxFcJQ4nShX+9uBhNzgGWvhKCF1M4KzXYEAMDFBfTHIyUvgc0pr4UwONHNQ3DSwRT17CuiIfIkujk0hQ=
Received: from SJ0PR05CA0061.namprd05.prod.outlook.com (2603:10b6:a03:332::6)
 by SA1PR10MB997784.namprd10.prod.outlook.com (2603:10b6:806:4c5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 23:03:12 +0000
Received: from MWH0EPF000971E9.namprd02.prod.outlook.com
 (2603:10b6:a03:332:cafe::86) by SJ0PR05CA0061.outlook.office365.com
 (2603:10b6:a03:332::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 23:03:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MWH0EPF000971E9.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 23:03:10 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Feb
 2026 17:03:09 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Feb
 2026 17:03:09 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Feb 2026 17:03:09 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 613N38qs099780;
	Tue, 3 Feb 2026 17:03:08 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vnPQK-00000009HSN-3yB2;
	Tue, 03 Feb 2026 17:03:08 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] packagegroup-core-tools-profile: Add bbappend to control LTTNGTOOLS
Date: Tue, 3 Feb 2026 17:03:08 -0600
Message-ID: <20260203230308.2211967-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E9:EE_|SA1PR10MB997784:EE_
X-MS-Office365-Filtering-Correlation-Id: afe27568-8b61-4a59-0587-08de637866f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?MwxFK/sg/vHHm8rSJMFnT/EOr8IRPxir+B/37mZ7clrx/Ac3/RNiZ4JHUnNP?=
 =?us-ascii?Q?Neqj63aFqmknTKmodZ4JaqE3Mpzg5j9k3SaZCwL6BA2HekVIiLw78uVu3JOS?=
 =?us-ascii?Q?A1japJyPX6CJFXXjG27CKw8HLNuo6yGO/TGDuNvHznSQEmmQg65OGPbYQ8Jc?=
 =?us-ascii?Q?c2RlPbeBY6lN1wATKYCyPKFv4ehz0dX3M4B/wJ4ExDKSHeO0PdbM381vc3DW?=
 =?us-ascii?Q?oYp0I2jHLP7/AEjkHidqfICOytYzrCmyOsAvpVJZ424H/szyST8mDgCn2UJQ?=
 =?us-ascii?Q?9iTQVRzrbVoyWx4Ps7O68Yoo8g1rd2HJ/KleQr/b6cBld0ay8Arh1x7fszcB?=
 =?us-ascii?Q?tIW87ak/+hoqUF6OGeY1oWem/2JKOQaxY2Q5YA+rqV/22w1H6GlhlPvqX00K?=
 =?us-ascii?Q?/OYIGhIgyxE0MQmZe2uZF3o6ODpJtX/0TdptIjPFpj2vTr7csyxCirz2y4PL?=
 =?us-ascii?Q?g6vZUoXoOei0tTWBhROZZYbnDMlWMVWa/vnFO7QOODVtXP1jEd5ExotXuGoY?=
 =?us-ascii?Q?KNtoAEqCESIOH3tZWqyR0IO/aIiVaTy4RU0CKUfzs1HWHvSPhq2eGJtHuT6d?=
 =?us-ascii?Q?r7zZ32yy6z1CBD7qeWanAO/WETP6EkXbKpJdg4Qc9ptc3Rfepk+D1Rb/JH0L?=
 =?us-ascii?Q?6BGhdb5dlYO3HxGy+7J0mk3iaqQQoZi+r1W1PNheiObQGMA+heqL9jcgbicB?=
 =?us-ascii?Q?B+8dwNGnnTfpgRQgqBaGNpdApT44xIdTn6exxty4h7Gx/lN61neC9UH/2vAT?=
 =?us-ascii?Q?QsY5N/GtBsz6X0zcpo3GnnQipEM0h1Cs7rgEEXyNlTkr9IGlKsanHSM0Djto?=
 =?us-ascii?Q?in79FEJrxbzg2W1vhnCZVrHsfuClEenPcH5VRJx9RC+awl4Nt9roJRHr8Tpn?=
 =?us-ascii?Q?4IgTNdHM6SALPjHnkJhgOB9PA4YhpK2gaoAeq8og3cMbzJBBFW99jfTKW/Cy?=
 =?us-ascii?Q?gMYx1RKvXXANjzr/PT3Koqa2Oki8sd9Nj7zZcQ2rte2B1sXc6pj/UJBGYSsY?=
 =?us-ascii?Q?XCF5AD6wtLG9j4711hJf5XscetR1wzqWWo2eucCIg5Pk+fLonlV1WNW7jxqt?=
 =?us-ascii?Q?nZtMnhscEZhpzxN8ZbJMN+GU3gEqRLVAtkZhe8mWc3PYKa16Ln/JOMZoe6Md?=
 =?us-ascii?Q?C8tyWp61oxvDi79jgQ69PUO7RDBJoBYwSgKWrWBXJqXHF+RbE108eR1appLk?=
 =?us-ascii?Q?NYWQsYNbZCkBbyvnPl9oqX2T7TqDh8Oatl9y6x8sKrQcH52p8G3gz5fHx4dV?=
 =?us-ascii?Q?ZCZl1vevwUFiaxyUWTsqHHz9065/YsgVGlUc6UBJlOr8L9Qoxv32YffOJLb4?=
 =?us-ascii?Q?Vy/d4Bx8U2Chz4qY5sRaoY1N+alOFngBSHLd13N/w7OsP/l4+Qd8W/A3tZ+N?=
 =?us-ascii?Q?QiP6kEo4rXBd2qFJoBYy5EHB4yzgLcQCHby7yeNdGaijNir36/2I0Ypcpo6X?=
 =?us-ascii?Q?B7sAFS75Fo0T8xAtG+uqFqOkmWTZ+5QaFX32er2dy9aSae61huIBxac9J0Gg?=
 =?us-ascii?Q?E0+wTjukWM4mnMMf7I6/XUaX3oQRK28hqWYwd1sMA4EYa7W22e/XfxQ+N07b?=
 =?us-ascii?Q?gzXImrgUJiZkhpImAAjprYNgU0EAPxegTvA5OczOhRw2EiX/8Be3dct9qxUF?=
 =?us-ascii?Q?o4uiYHbgKD5to6xRGFWipP8a0cQRK1ZCdY85GSFwPKl0y94P01WDwTDTtja4?=
 =?us-ascii?Q?T/Eu5g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	h6I3/vGxjL/oK/wVQQglkPo6l+VKTCaPmb4PEIuYpGfZw3wJD6X6w3ZEYPt/riORznTujsuhwkRKqmFise9+wQRbfdwFLm6J64M+TEZwMb6VMHCUdRkyQVy248d+TJCauwcFhzNzolQIKRsZF2b9O0myJT26UHuYbv/qapG7pCXj0NXbEvTPMRXVhhOGUVMvhiyenYAx7uLAmhjbOwzN+zdqP/kstntbkYQ4UkDaRHXZ2vFenfLXLkF2UyW9y9oe28Ytkqf6gMP/n4oetnDM3xjjO7Hc9755CCoSMXs7hV2a22TTYrRDKjICU8140iWho42e3MR2RxI6Mnvo3jDVsERCO+C0BSuKxGT+0oSu1vKbwMloRHV119p/Fv2hsik74AobkZSV25nRW2YVAeCz2ZcradFO0xXDJ7RKoSuxo3u/kUvwrFxk/fgdXA88fyKd
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 23:03:10.6179
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afe27568-8b61-4a59-0587-08de637866f2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000971E9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB997784
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 03 Feb 2026 23:03:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17075

A follow on patch moves to start using pacakgegroup-core-tools-profile
to pull in valgrind, but the lttng-tools package does not build for the
legacy 32 bit TI platforms.

Add a bbappend to remove lttng-tools from the packagegroup for those
platforms.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../packagegroups/packagegroup-core-tools-profile-arago.inc   | 3 +++
 .../packagegroups/packagegroup-core-tools-profile.bbappend    | 4 ++++
 2 files changed, 7 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegro=
up-core-tools-profile-arago.inc
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegro=
up-core-tools-profile.bbappend

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-core=
-tools-profile-arago.inc b/meta-arago-distro/recipes-core/packagegroups/pac=
kagegroup-core-tools-profile-arago.inc
new file mode 100644
index 00000000..8bdfce08
--- /dev/null
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-core-tools-=
profile-arago.inc
@@ -0,0 +1,3 @@
+LTTNGTOOLS:ti33x =3D ""
+LTTNGTOOLS:ti43x =3D ""
+LTTNGTOOLS:am57xx =3D ""
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-core=
-tools-profile.bbappend b/meta-arago-distro/recipes-core/packagegroups/pack=
agegroup-core-tools-profile.bbappend
new file mode 100644
index 00000000..418f2507
--- /dev/null
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-core-tools-=
profile.bbappend
@@ -0,0 +1,4 @@
+PACKAGEGROUP_CORE_TOOLS_PROFILE_ARAGO =3D ""
+PACKAGEGROUP_CORE_TOOLS_PROFILE_ARAGO:arago =3D "packagegroup-core-tools-p=
rofile-arago.inc"
+
+require ${PACKAGEGROUP_CORE_TOOLS_PROFILE_ARAGO}
--=20
2.43.0


