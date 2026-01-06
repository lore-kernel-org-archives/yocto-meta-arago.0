Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FB4ACE9D6C
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 15:47:01 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.84796.1767680564149645656
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 05 Jan 2026 22:22:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=XUEcJAss;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.200.45, mailfrom: a-dutta@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yb6i0qIHmzf3Aei8icMmTkbFn4weCRPvhDOiFMjL0PMNvgmhsiDPygh27FAGC4fgV/CFHsQcuaabJ0fjLV4QuQhYmImVKTmb91uT2bcedQtifQdk4LJeynbqegIxSXgg0i7Ww4NdqwTn5gyqZcF219AfYrW6cJM3UXCpgIWasR/hoTbxND/73s9VzrM5tCTEDSzhpmE95ghyChO1ciJIsyqeUWUIQlyTNgIYi9pGkbHPVJb99qp0B/zgWAS3d9Hy/sYfVFNauNH3H3ovEC2PK2pcrBycku6Atlkej0JuMQxJIcWk9oEi+1BEzsxD3B3sARA+Aj/TwjpYKANrVJH7Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Su8aPvrtPG3E9+VY3msdsKCskwpiQMTPrE8xotaJXGo=;
 b=LaifEy5Fk7drIHmCPCISrmj/bobR92omS0MuDcSXyfDuBGN/z01JATOfzukEobAdVTsL+5pRrENeDa0TKfalPsAxkwAGUa7WUHvkgHYBn9mT/nmdHCUVIRfEBZ4vajJ/W6iA034CEivTEZY6wkG5BeRvtmZGsOIRNBAL8CNiyf+ypBJXmrMis/W55HsVWAP2Ps8ERHBYRTDjgjdmt6SyudaxcpLPIbXM2XenaZnBk7VrpBbDtqXqyYT/RjZ8bxB+sp6AfJbET/qdrjLf70soDlBFtCKqZUGSCQx9os+vYQY+a/2/jYSEe42eqJ0lYlfn9m+5qPF8JTecEY2M2Z9flw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Su8aPvrtPG3E9+VY3msdsKCskwpiQMTPrE8xotaJXGo=;
 b=XUEcJAssfLj/zC1yb6Xq7xtOxf4iIS3ctdcbIvgnjaqdNUbG7TH+5mCOc9CesoMMidaI7s+M0xIPAIPSMZcRhPiy3wrHprhwNe3ZCQv72BaVYDyt3A+FMuAdRKHfPIHwNnB/2q3wuygZK03P2JuBWMa/Dv0gcN0a0ptXyMubLC4=
Received: from DS7P220CA0040.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:223::34) by
 DS7PR10MB5925.namprd10.prod.outlook.com (2603:10b6:8:87::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4; Tue, 6 Jan 2026 06:08:19 +0000
Received: from DS1PEPF00017099.namprd05.prod.outlook.com
 (2603:10b6:8:223:cafe::d3) by DS7P220CA0040.outlook.office365.com
 (2603:10b6:8:223::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Tue, 6
 Jan 2026 06:08:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS1PEPF00017099.mail.protection.outlook.com (10.167.18.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Tue, 6 Jan 2026 06:08:18 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 00:08:17 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 00:08:17 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 6 Jan 2026 00:08:17 -0600
Received: from a-dutta.dhcp.ti.com (a-dutta.dhcp.ti.com [172.24.235.228])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60668FAW2525652;
	Tue, 6 Jan 2026 00:08:16 -0600
From: Anurag Dutta <a-dutta@ti.com>
To: <reatmon@ti.com>
CC: <gehariprasath@ti.com>, <a-limaye@ti.com>,
	<meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] meta-arago-test: recipes-core: Add udev rules for MCAN to meta-arago-test
Date: Tue, 6 Jan 2026 11:38:15 +0530
Message-ID: <20260106060815.868724-1-a-dutta@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017099:EE_|DS7PR10MB5925:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a5afe3a-24ad-42c3-2e71-08de4ce9fced
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?UmO3U68J9zJ1Gr7cpDDuemCW2bevj7R2ky6gMRlWJ9qC2VCW8EvZeQV0hDpW?=
 =?us-ascii?Q?stcx+uAgAjnXRR9HwOWQde99yHq5JcRZK4b3DpuiRxVa7e14El4vhNxEN6ur?=
 =?us-ascii?Q?4MbwejBHZ0bx0uJgMIPXhbzkmdBvsAYHM+yneBSpYILHdME/UV3P4tCkw8S8?=
 =?us-ascii?Q?4GkKOS0U6Zr0pdERlCUXP57R4ikhYtd8nd0JT0aj+tPDVYtlWac9QAqs0qkH?=
 =?us-ascii?Q?cxwTKZZjpd0htH94/TOeQ/zVo5F8kc2L98joyqRhpkkIbM++60t7ro6lqsXk?=
 =?us-ascii?Q?490JKh/6qGUmqvkrcNwqh4rQ8uJaj7NttypoovjS1JKQKgZyawEGXoScXy03?=
 =?us-ascii?Q?qSnArNOAI7AeHVm2Qstl8+l3jplftLAYhf2CNiuPh9S+CoTVdCYZgp5lVBiR?=
 =?us-ascii?Q?2tZ74BQXmSiQ+BFghKtaSOIaE49l7WWlm/DURQSSS4ANMUvVtxuveJQCUAJd?=
 =?us-ascii?Q?erIgWRgTvmUOzftJwRk+07i1k+TW7cYPPfpi7EJgwxVFH1UNLmjcocv2WXQH?=
 =?us-ascii?Q?vRjDf78st1VROvapkiMtBeAvynR8pztu3u+gd9Wz9ObacZju8rMva2FObkAm?=
 =?us-ascii?Q?uGmDi8eouYXSaAUyd4tH8Y5TTW/JgXDzk671oMOFK5vDZknJVqBKI2wLwCMa?=
 =?us-ascii?Q?hrHOAgQ6EbDYuhSYcMOzcAWN0VDaMh6oVu+c5KabzmNOmC+bzcA/ujctRLs6?=
 =?us-ascii?Q?cIk6VKFYswgZLU+2kjMH8fk8mohGaomjz13g6mJL9PLp1SfBEfRLVZk5Ld6y?=
 =?us-ascii?Q?BjvulW69oaPAvA1La2kljBcrW/QTHwcDdE1mkb2J/XPZ9gh4wYsYCXYpHNvc?=
 =?us-ascii?Q?xKryHAFOiO3nnjWJrbOTsbDoNcJa9DwB+xZlcUiUBFhNO6b8m/votCAPaNI8?=
 =?us-ascii?Q?o4Acic9S6akbIQWHlHDoCgfxhng9WSRoJFxBDlnctdgLxnj7ye6u2VoN7/Wb?=
 =?us-ascii?Q?H3m/38+Rivhj7/EgQcm2Tx+vCQ76fm0WIQdqFXt9YKW2cnRozm2kY3E2chvw?=
 =?us-ascii?Q?Z0+cPIZNtEQGtYCI4KXZv77t+hdS+jIcyGobKav8VZNcZY6dEXhbeM5M9lQs?=
 =?us-ascii?Q?VS3VZ2VaPZjEdENyNnMvuReOxPgwpZbe2iIbiUhZC2tRhxjSzmeW9A1gq/I6?=
 =?us-ascii?Q?FU8+38hg4OTDuMftfaJwRVmZxidGz97W7kigCDcBEtcfEbZLX3jMSvFEejKg?=
 =?us-ascii?Q?sma0DNAphNIDOCMhSyyhk1hQoNk7+6rrbevVepVit3ngpmkwrjW9VDYRp2Ag?=
 =?us-ascii?Q?muxbj3Qmk+bs+rKBynr4D7lsolmFXNmXyIi4EMPTDba9VDtJypALJS0XCOeI?=
 =?us-ascii?Q?WKRJoZHC6fdQqfTKVbX9QgIbTcnmIk6eQocEyxPPjIm9qpNKGINE0+ljhB3n?=
 =?us-ascii?Q?csgbCv1W+z5B8BJRtlguG9SZ3idr/aP3hSOJAIsP5Gq0ghBOviEsdgwVNU19?=
 =?us-ascii?Q?p2DeQPtx63T78nGi4HyVmOGNJPWR8rK0uzgdJqbWckI3HR7iQSx8rq8GYZb2?=
 =?us-ascii?Q?AwSQzMRn2Ln0m0R+kl+Hnd+rWYIJXTGvDTuPY0hjfCNEdHkPAwL0A/dAtxWD?=
 =?us-ascii?Q?/plnHXEn7sPsxmDIwJ8=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 06:08:18.6713
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a5afe3a-24ad-42c3-2e71-08de4ce9fced
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017099.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5925
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 06 Jan 2026 15:47:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16933

Copy udev rules from meta-arago-distro to meta-arago-test so that MCAN test=
s
run successfully with other distros such as "poky" as well.

Signed-off-by: Anurag Dutta <a-dutta@ti.com>
---
 .../recipes-core/packagegroups/ti-test.bb     |  1 +
 .../udev/udev-aragoconf/37-can-am62.rules     |  4 +++
 .../udev/udev-aragoconf/37-can-dra7.rules     |  2 ++
 .../udev/udev-aragoconf/37-can-j7.rules       | 20 ++++++++++++++
 .../udev/udev-aragoconf/37-can-ti33x.rules    |  2 ++
 .../udev/udev-aragoconf/50-arago.rules        | 24 +++++++++++++++++
 .../recipes-core/udev/udev-aragoconf_1.bb     | 26 +++++++++++++++++++
 7 files changed, 79 insertions(+)
 create mode 100644 meta-arago-test/recipes-core/udev/udev-aragoconf/37-can=
-am62.rules
 create mode 100644 meta-arago-test/recipes-core/udev/udev-aragoconf/37-can=
-dra7.rules
 create mode 100644 meta-arago-test/recipes-core/udev/udev-aragoconf/37-can=
-j7.rules
 create mode 100644 meta-arago-test/recipes-core/udev/udev-aragoconf/37-can=
-ti33x.rules
 create mode 100644 meta-arago-test/recipes-core/udev/udev-aragoconf/50-ara=
go.rules
 create mode 100644 meta-arago-test/recipes-core/udev/udev-aragoconf_1.bb

diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-a=
rago-test/recipes-core/packagegroups/ti-test.bb
index dad5571c..96e0038a 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -61,6 +61,7 @@ TI_TEST_BASE =3D "\
     v4l-utils \
     xdp-tools-arago \
     yavta \
+    udev-aragoconf \
 "
=20
 TI_TEST_BASE:append:ti-soc =3D " \
diff --git a/meta-arago-test/recipes-core/udev/udev-aragoconf/37-can-am62.r=
ules b/meta-arago-test/recipes-core/udev/udev-aragoconf/37-can-am62.rules
new file mode 100644
index 00000000..59dc8075
--- /dev/null
+++ b/meta-arago-test/recipes-core/udev/udev-aragoconf/37-can-am62.rules
@@ -0,0 +1,4 @@
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"4e08000.can", NAME=
=3D"mcu_mcan0"
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"4e18000.can", NAME=
=3D"mcu_mcan1"
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"20701000.can", NAME=
=3D"main_mcan0"
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"20711000.can", NAME=
=3D"main_mcan1"
diff --git a/meta-arago-test/recipes-core/udev/udev-aragoconf/37-can-dra7.r=
ules b/meta-arago-test/recipes-core/udev/udev-aragoconf/37-can-dra7.rules
new file mode 100644
index 00000000..3b14150d
--- /dev/null
+++ b/meta-arago-test/recipes-core/udev/udev-aragoconf/37-can-dra7.rules
@@ -0,0 +1,2 @@
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"4ae3c000.can", NAME=
=3D"main_dcan1"
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"48480000.can", NAME=
=3D"main_dcan2"
diff --git a/meta-arago-test/recipes-core/udev/udev-aragoconf/37-can-j7.rul=
es b/meta-arago-test/recipes-core/udev/udev-aragoconf/37-can-j7.rules
new file mode 100644
index 00000000..f2804ecd
--- /dev/null
+++ b/meta-arago-test/recipes-core/udev/udev-aragoconf/37-can-j7.rules
@@ -0,0 +1,20 @@
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"40528000.can", NAME=
=3D"mcu_mcan0"
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"40568000.can", NAME=
=3D"mcu_mcan1"
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2701000.can", NAME=
=3D"main_mcan0"
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2711000.can", NAME=
=3D"main_mcan1"
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2721000.can", NAME=
=3D"main_mcan2"
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2731000.can", NAME=
=3D"main_mcan3"
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2741000.can", NAME=
=3D"main_mcan4"
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2751000.can", NAME=
=3D"main_mcan5"
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2761000.can", NAME=
=3D"main_mcan6"
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2771000.can", NAME=
=3D"main_mcan7"
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2781000.can", NAME=
=3D"main_mcan8"
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2791000.can", NAME=
=3D"main_mcan9"
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"27a1000.can", NAME=
=3D"main_mcan10"
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"27b1000.can", NAME=
=3D"main_mcan11"
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"27c1000.can", NAME=
=3D"main_mcan12"
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"27d1000.can", NAME=
=3D"main_mcan13"
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2681000.can", NAME=
=3D"main_mcan14"
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"2691000.can", NAME=
=3D"main_mcan15"
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"26a1000.can", NAME=
=3D"main_mcan16"
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"26b1000.can", NAME=
=3D"main_mcan17"
diff --git a/meta-arago-test/recipes-core/udev/udev-aragoconf/37-can-ti33x.=
rules b/meta-arago-test/recipes-core/udev/udev-aragoconf/37-can-ti33x.rules
new file mode 100644
index 00000000..62d650fe
--- /dev/null
+++ b/meta-arago-test/recipes-core/udev/udev-aragoconf/37-can-ti33x.rules
@@ -0,0 +1,2 @@
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"481cc000.can", NAME=
=3D"main_dcan0"
+SUBSYSTEM=3D=3D"net", ACTION=3D=3D"add", KERNELS=3D=3D"481d0000.can", NAME=
=3D"main_dcan1"
diff --git a/meta-arago-test/recipes-core/udev/udev-aragoconf/50-arago.rule=
s b/meta-arago-test/recipes-core/udev/udev-aragoconf/50-arago.rules
new file mode 100644
index 00000000..3ff14eb0
--- /dev/null
+++ b/meta-arago-test/recipes-core/udev/udev-aragoconf/50-arago.rules
@@ -0,0 +1,24 @@
+# There are a number of modifiers that are allowed to be used in some
+# of the different fields. They provide the following subsitutions:
+#
+# %n the "kernel number" of the device.
+#    For example, 'sda3' has a "kernel number" of '3'
+# %e the smallest number for that name which does not matches an existing =
node
+# %k the kernel name for the device
+# %M the kernel major number for the device
+# %m the kernel minor number for the device
+# %b the bus id for the device
+# %c the string returned by the PROGRAM
+# %s{filename} the content of a sysfs attribute
+# %% the '%' char itself
+#
+
+# Try and modprobe for drivers for new hardware
+ACTION=3D=3D"add", DEVPATH=3D=3D"/devices/*", ENV{MODALIAS}=3D=3D"?*", RUN=
{builtin}+=3D"kmod load $env{MODALIAS}"
+
+# Create a symlink to any touchscreen input device
+SUBSYSTEM=3D=3D"input", KERNEL=3D=3D"event[0-9]*", ENV{ID_INPUT_TOUCHSCREE=
N}=3D=3D"1", SYMLINK+=3D"input/touchscreen0"
+
+# Auto-mount any SD cards
+ACTION=3D=3D"add", KERNEL=3D=3D"mmcblk[0-9]p[0-9]", SUBSYSTEM=3D=3D"block"=
, RUN+=3D"/etc/udev/scripts/mount.sh"
+ACTION=3D=3D"remove", KERNEL=3D=3D"mmcblk[0-9]p[0-9]", SUBSYSTEM=3D=3D"blo=
ck", RUN+=3D"/etc/udev/scripts/mount.sh"
diff --git a/meta-arago-test/recipes-core/udev/udev-aragoconf_1.bb b/meta-a=
rago-test/recipes-core/udev/udev-aragoconf_1.bb
new file mode 100644
index 00000000..49d00b54
--- /dev/null
+++ b/meta-arago-test/recipes-core/udev/udev-aragoconf_1.bb
@@ -0,0 +1,26 @@
+SUMMARY =3D "Udev rules for assorted TI SoCs"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb7=
88c80a0384361b4de20420"
+
+inherit bin_package
+
+SRC_URI =3D " \
+    file://50-arago.rules \
+    file://37-can-j7.rules \
+    file://37-can-am62.rules \
+    file://37-can-dra7.rules \
+    file://37-can-ti33x.rules \
+"
+
+S =3D "${WORKDIR}"
+
+do_install() {
+    install -d ${D}${libdir}/udev/rules.d
+    install -m 0644 ${WORKDIR}/50-arago.rules ${D}${libdir}/udev/rules.d/
+    install -m 0644 ${WORKDIR}/37-can-j7.rules ${D}${libdir}/udev/rules.d/
+    install -m 0644 ${WORKDIR}/37-can-am62.rules ${D}${libdir}/udev/rules.=
d/
+    install -m 0644 ${WORKDIR}/37-can-dra7.rules ${D}${libdir}/udev/rules.=
d/
+    install -m 0644 ${WORKDIR}/37-can-ti33x.rules ${D}${libdir}/udev/rules=
.d/
+}
+
+RDEPENDS:${PN} =3D "udev udev-extraconf"
--=20
2.34.1


