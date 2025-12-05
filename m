Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD589D374A5
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 20:53:22 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.27])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3646.1764967994241713131
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 05 Dec 2025 12:53:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=fsN9yxGT;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.52.27, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BX3k6XnjsuT+dRmbkq8ehc723oHsmW/RdcCs3FfIYNXr+13lj69b6ju3j9CJG/ccNmCJp8aOkKnEggZtGWOHQz19JkrPd0c8dDxa+Hi22LaFAFTt/BY67w+VaSuqAg2S6kyyURy5gKmmyyNsr3YK3a8yT+Efr+SDfY1CLI88zYVSwx9Bw3WaLb1u9w6Sk3Y8taF18m5i6tUKwHLOiWT2JSPACe8yrnaVsJZA+6LBnrUnIZdquIQssoZcOaxB1h3whA3iB6hymc1KPRWMcqp80oxMQ2l4UQJocXxG3z1YAElu9C4sjg+WdPiS/xLTkArHQBCLSGYiZaZc2EBS6wrvPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RUb2x9kwNR2rZCFa+S7J+s5XUABHEmGIkAyfUk9fO+Y=;
 b=eYsHyx6Gg16Oq/NxG3K414dozQ5zB6rpzC9tvtYbm5BNxK8eaH+fT43bBVW4yp7xYbGwepGrmyEs5Vd0hzhPU+OF1bJFB4XIPN17CILMvBA+Y+6e/RBKANUrXQD7CMGcVRhaPOEE5Y1a4Y6fyEgq2G0qalmuhlXMU/GumnfSFFFERcyr3KxrhZFFJm9UO22NG9OH/BvGoO2xU6uWPN6D2zMD7yaPitvyAizwsQcz2rok2jZBG1o2wFdcuABTaJq/20bcclVbmXsjFpxY5FpFi8dygsKMtmpQTQMhHBhnYfhSDx+3Ou6RTFskeQpxNA7HtaTlh+W1QId0pT+eyBkjYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RUb2x9kwNR2rZCFa+S7J+s5XUABHEmGIkAyfUk9fO+Y=;
 b=fsN9yxGT6i1BsEaQC/BozFYFPfwOnYq0LPuWjSQKCZFcnwqCzsvt0oxPLKcFWPwTYycPCBQdrh42ljCNocUm2HCW/hhX/yxcRJJTkPco3sxGMlOHjzjkVgZaMXm5mord4ogl5cVcU/HfUxjFinWsWfsQd93pO7HCwROmUzEXKik=
Received: from BY5PR17CA0009.namprd17.prod.outlook.com (2603:10b6:a03:1b8::22)
 by SA1PR10MB6344.namprd10.prod.outlook.com (2603:10b6:806:257::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 20:53:10 +0000
Received: from CO1PEPF000044F1.namprd05.prod.outlook.com
 (2603:10b6:a03:1b8:cafe::1d) by BY5PR17CA0009.outlook.office365.com
 (2603:10b6:a03:1b8::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.12 via Frontend Transport; Fri,
 5 Dec 2025 20:53:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF000044F1.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 5 Dec 2025 20:53:08 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 5 Dec
 2025 14:53:06 -0600
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 5 Dec
 2025 14:53:06 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 5 Dec 2025 14:53:06 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B5Kr6BD3888879;
	Fri, 5 Dec 2025 14:53:06 -0600
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] dbus: remove license selection override
Date: Fri, 5 Dec 2025 14:52:33 -0600
Message-ID: <20251205205232.2471677-2-rs@ti.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F1:EE_|SA1PR10MB6344:EE_
X-MS-Office365-Filtering-Correlation-Id: 01ee53d1-a0ef-4df5-bc6e-08de34404bad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?QouaSVLjB1I3qCeDOd9/vj7P0JFTdLv1mmNQPRf98YdfN9IKqDdmVdzZfCpP?=
 =?us-ascii?Q?78jLtxH59kTzucF2o0yGj/1SPzL7/njciy6Bm+0ZK6bytmH0apoaRC2Ndwfm?=
 =?us-ascii?Q?dlXB6Qzlsec7qJUL059Dy2u2MponXkEX0Q9Yno06BANNnUqIDkgpcDmC2TgJ?=
 =?us-ascii?Q?Y2KVQxGzlx3U7ZjAEIX8lnRpRDvVSESsYiG55O7g2ispAEyeBY8ECYhAJvBK?=
 =?us-ascii?Q?+XQAD2E2oByaYfWRFIzAb1ve8BMaSMLeqtPtB9ssi5y83/Uhj1Hztt3q/Vpq?=
 =?us-ascii?Q?1UcbPH1cGqOBvGZEDqoArf+OwcjbbyPATYMvLN/qyYXo0mjhxOJ97zcDEuWC?=
 =?us-ascii?Q?1GA33YkRpuRIASP8T7b/f/GcHmVKyTymQkQbercVAbyvG27lhWY52+iaM5zt?=
 =?us-ascii?Q?yFu6Bw1ohNPeOxp2XPG4+fKUOcHh8o+r9audBd/QIohyKz/Rl3PCF+2YVsFb?=
 =?us-ascii?Q?RNJMZYsgHzrbMOd5xrJhpknkpXmUfcZCG9+ArCsHHyHBJzna0AWUwh8yI+1a?=
 =?us-ascii?Q?pzsRH+1/CdnXIgiJb67Zr9TKzXVU8ukDQZpGXO+QWdwC+4jsUqaBxpH3zq3A?=
 =?us-ascii?Q?S2rRkZG0+uPScZK9gnh9qgmfjSIN3+HmF8x8olzLt1nogo/eU//pf10dJufo?=
 =?us-ascii?Q?wzJnzu6lSxvkYnqDoTH520uxlx4sCaSTt7vf3p3Dvn7TYXxuugivQmwtG+hB?=
 =?us-ascii?Q?ejzVtl5S4zFlV/VMsF/hEQqeqQac2aeG6WTduX2pBBjb66sjWqi0ZqRmLgMS?=
 =?us-ascii?Q?FbRESgHunsjAv890b8p6eQCVS64H7gZCS/89BoXzGNrNNxlv/AflcAfeacTM?=
 =?us-ascii?Q?x2REYrFB7bZGY5tdjAloyjDZ5D5auvL4yM4+pEPfNiXOblOPJn1vE+bLrvYL?=
 =?us-ascii?Q?mlO3/6CSTp51WHVR3XYPenowPgBLrIqKies1SVKJOtdrSx0yBeC77ZCC3pbS?=
 =?us-ascii?Q?nzy/pct7ahJJnJJRdR+Cmjf9vuGNI95q8lH1K7sP9RwBFeDDWxfVep8o3YE4?=
 =?us-ascii?Q?08H7ta6BsfDbQCIWEwjpd51vjEU0+r11QV8bALbIvCUlSbyd2nW6pNJq5QFN?=
 =?us-ascii?Q?QyAqrOeMQ/CHFhwG/Hf7w71efL3XrjUUqc05QHc0Rynoi3GJDV5eKNs6toLC?=
 =?us-ascii?Q?bbFpCVBV42rmpueR6PPt4Bgh5NMyZ5uz+wW3I35IEHnNujuSRkPJom6eBOmm?=
 =?us-ascii?Q?xyD6viW0hkr+jhjxAu66HArZlNxArE7kSI/nzADrjE58aifqjMpvkFjEtQNW?=
 =?us-ascii?Q?pggLp3XrjO+WDeKB+FjIuIYO/VEF/dyXtdRgz5ckWr02JTrplG8XwYG9IhVf?=
 =?us-ascii?Q?fodFkhu9jbbcSipd/8fYiLwlmEqX1k5YkKwDv32AepAcgQiLDQMo7T/krOK5?=
 =?us-ascii?Q?mRtDrS6y8vEV2JGIW/jNgpU0PyVoPuQ8R0DDLGQzeHwC4afg1w+LiP+4dNH0?=
 =?us-ascii?Q?jHzs83XkOiJdjWy0/Xr5+8K+uG8wVMqspMX2A2Vn/rNtSbeIIeCNNLSUQ4+3?=
 =?us-ascii?Q?tSKNcBB7qn9d7UP6pUteKingAGd/Ar819bRoufJAG43PXau08hnCVmcLffIe?=
 =?us-ascii?Q?KAQH88+8maHk0HHnErI=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 20:53:08.4413
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01ee53d1-a0ef-4df5-bc6e-08de34404bad
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000044F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6344
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 05 Dec 2025 20:53:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16864

From: Randolph Sapp <rs@ti.com>

Not entirely sure why this exists. History indicates that someone wanted
to select one of dbus's two license for distribution. Not entirely sure
we need to change the recipe itself to do that.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-arago-distro/recipes-core/dbus/dbus-arago.inc  | 3 ---
 meta-arago-distro/recipes-core/dbus/dbus_%.bbappend | 4 ----
 2 files changed, 7 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-core/dbus/dbus-arago.inc
 delete mode 100644 meta-arago-distro/recipes-core/dbus/dbus_%.bbappend

diff --git a/meta-arago-distro/recipes-core/dbus/dbus-arago.inc b/meta-arag=
o-distro/recipes-core/dbus/dbus-arago.inc
deleted file mode 100644
index da612c59..00000000
--- a/meta-arago-distro/recipes-core/dbus/dbus-arago.inc
+++ /dev/null
@@ -1,3 +0,0 @@
-PR:append =3D ".arago1"
-
-LICENSE =3D "GPL-2.0-or-later"
diff --git a/meta-arago-distro/recipes-core/dbus/dbus_%.bbappend b/meta-ara=
go-distro/recipes-core/dbus/dbus_%.bbappend
deleted file mode 100644
index 5464eaa7..00000000
--- a/meta-arago-distro/recipes-core/dbus/dbus_%.bbappend
+++ /dev/null
@@ -1,4 +0,0 @@
-DBUS_ARAGO =3D ""
-DBUS_ARAGO:arago =3D "dbus-arago.inc"
-
-require ${DBUS_ARAGO}
--=20
2.51.1


