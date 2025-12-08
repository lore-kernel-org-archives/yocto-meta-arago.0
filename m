Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 834BBD3B7E2
	for <webhook@archiver.kernel.org>; Mon,  8 Dec 2025 21:27:28 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.25])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4102.1765229246021969737
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 08 Dec 2025 13:27:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=ECIzhK7K;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.201.25, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=plIyu7zVK7WnjaUjECRlQMqxsJM2S4eMU5XhJzrJLzTiugzLHeqP+3DqJ78WAcSFLLNMiLMA+ggb8iUwp7Ux30cPKbnxztMmNZpSpOQhbVxSC560g12Q9XaBLBB0IIa757TNMVpUiQAQAzpWB9ThrtqlKlnKKUXkLK+Y0yp9X+XKJOok6/9cLPCQgT3wKEj0GwwY8FAX7SkIQhKe4Yex3OggAyW9EUDXbzXJMqxWqB5RxgJh2xZh9+R1eFRbk/k3glOyuQ4MHn39YoG3uPFafPcJtRdjsxSLApYFSPHoTqX68IPvVUWUVsa74wSlNb4AM8xsaCZ/F0E1o3LtAT+4TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gF01I+1QaIaOODPl4S/p8Ng0UksB6hQLohWGvXSswuc=;
 b=ZNwZhSbkoW2RuD19I7+wjbRC0Tn1aJ6FgT6NtWFQbeiEYKp0YwnsgLXivaahxYKuUpqFcoqWnUtAfyBU8DrwUJhqsJ6GbDinhiXqsEMuu7P5+n4HpoKGEBv4hAZrMNUL2v8Dcxt2bobPAHoj9Z9dYGD4RhIdyDL+F+4bzhoMIgl/ryxqc1qLmli2yYV6rwECO2B6QX4YazE/wInsrfLhTfgLSCW7t6oUCXoHfFxILIVIb01b/6BeNcJWnHV77jWm/mvOOR3GLFf1zts0Zw1JWwifQ17vEyKXkACfxOLrH/HRMldSLNKW3CZ4fDExoEzw8RoLyPfxHxELcBk7wb5gHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gF01I+1QaIaOODPl4S/p8Ng0UksB6hQLohWGvXSswuc=;
 b=ECIzhK7KMtyHTq9K/6wZQN5v6TJJv+Hy2y59PYVupPOwKePv4251oXtmwxVdFB2pgJF4VARp0Yk6fXNxj4FCQ1P8g4LmxupUBOff5L6gFLTXkiJbZSK559/TfFljqEOxfAlk1ZhE8DK3eiClL27ouNBF9hSNtUnT9eN3WDD/j8g=
Received: from DS0PR17CA0013.namprd17.prod.outlook.com (2603:10b6:8:191::11)
 by CH0PR10MB4972.namprd10.prod.outlook.com (2603:10b6:610:c0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 21:27:22 +0000
Received: from DS3PEPF000099DC.namprd04.prod.outlook.com
 (2603:10b6:8:191:cafe::fa) by DS0PR17CA0013.outlook.office365.com
 (2603:10b6:8:191::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Mon,
 8 Dec 2025 21:27:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS3PEPF000099DC.mail.protection.outlook.com (10.167.17.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Mon, 8 Dec 2025 21:27:21 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 8 Dec
 2025 15:27:18 -0600
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 8 Dec
 2025 15:27:18 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 8 Dec 2025 15:27:18 -0600
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B8LRIBA078985;
	Mon, 8 Dec 2025 15:27:18 -0600
From: <a-christidis@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <denys@konsulko.com>
Subject: [meta-arago][master/scarthgap][PATCH v2] stb: Update false version v2.31 -> v2.30
Date: Mon, 8 Dec 2025 15:27:18 -0600
Message-ID: <20251208212718.4002485-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DC:EE_|CH0PR10MB4972:EE_
X-MS-Office365-Filtering-Correlation-Id: 78180ff7-c9e4-484d-85d8-08de36a0926e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Zvece3U8oG0DtneuVg61V5TXHPl8IKYt+ixW17TC/iXo96HuDWUGuXweB96o?=
 =?us-ascii?Q?s+STt4oMquT4dQXwm7YGXqnAxCULbvjU3OBiqiSYSpm7O2lQg348MDSsATTj?=
 =?us-ascii?Q?k+X5aHthgK4oUs5Haf3EFbjAG/l/lOcU8OA1tR5rl5uy6LzG3BTTgJyWnUeU?=
 =?us-ascii?Q?+C3Mmky486HNzE6pBlrpuOpCu8hNBWgfeUKrltRJ3ggAulYl+LmmIH6/bydl?=
 =?us-ascii?Q?AJ+LZZRJBiiCebp1xlwcX+joearRLs012OgyX5iJiZu4HSkkslYM9j3qkjsb?=
 =?us-ascii?Q?lkY/f7p9H2hnC18Hh1l+7rGVrYVKnES2BWOlQrNu2atM2treaYTpYv33z5rX?=
 =?us-ascii?Q?rQgb2v0Ubuf7FE1MN9jMVb+X5yCM7NmeMiKs70Pb+56n2TAlEuKNgnV6DTaz?=
 =?us-ascii?Q?csQmJ7yfumT9CtMd4L/i6FIliOF26zEHeiPYYat7PP4tAqZRjUgFKco074Cp?=
 =?us-ascii?Q?X+jWakzz2gsjtMdQlX+klNT3tnkHUqDu7zpUqMD4n72/c6+IwF8ldvGZJS7x?=
 =?us-ascii?Q?/uooMTmD7nt+0p9+pYnel9/CQg1pJkrTz83xHUoMLZoz5eMxvGJWg+g2UBuP?=
 =?us-ascii?Q?6lKbetGZdbSCo/W2KcjqP1HBLi3yXVoSTErWNKieqsKSrqtA8gsJBReKXIXM?=
 =?us-ascii?Q?Rf9GXS6C1xMOQWkm+K88jtC0rQnbibP6Cqs14dwNIHaF55ItPS/qvbR3sv8x?=
 =?us-ascii?Q?3J3U/pAjhxLVJ+NVWlznuJ8SxkO4axofsDZOSS+7mANTmil2+rG8AQdzD/3P?=
 =?us-ascii?Q?JVkfcaayo85vmdOZgwkHBLVAdH9TaKfi8Z72XVkQpQE7/DxaKHeEG1y/y42a?=
 =?us-ascii?Q?wHM5QPj56Yw81mEl93ml9mJoX/2nzmBRGCfUkpy9dX3z8lQBVOYpqKaZhFr4?=
 =?us-ascii?Q?aJpcXAIcYlgAuhudQg6O0Me9+7ZDv2TifmAwZckL20+f3x+w361Af5OpcOQ3?=
 =?us-ascii?Q?pw362/WwloGlfQP1PGuaL1ovniKBKwL2uhGDIopRfR1Q03vA0tMhxbcl3qZQ?=
 =?us-ascii?Q?eZcKsqywb0dNfeIdEepQlO/+myabSEWKEe5kGpR5tyYCMaQfjXWbTNtPagwv?=
 =?us-ascii?Q?Z3d6+fYXyiTahX3Aiir6iiqI8Ws4CSQO8Bx5kGPF6nzjLf16kguSHVu40RlP?=
 =?us-ascii?Q?aBmw1yc3jPzE41BUY95hJNZE7csqdbfcfw4I5q794uC3peTBNprGNtq8qbId?=
 =?us-ascii?Q?9vuTNyUd1YLL6R30Ekehs9dfS8Q8eeBWL9I4Pe0fer/u9Qpc0wDyESV3t8E+?=
 =?us-ascii?Q?Gg2+KfCah3EwZYzREaPKMb8ROI0SqQXG0wTol/gzobbiIKOjhA9Q/AFU7607?=
 =?us-ascii?Q?SoLQMpDxDfe3m1oY+Rb5g6PasoheNDah1ijV+a6jr1zn+1sA/Ei76kygmh3K?=
 =?us-ascii?Q?V36juysCI2jsmnmpoKaNydAg4V3ZJ//AbLUlh69+s0/6vqdxgKRiqhaIHiHD?=
 =?us-ascii?Q?OjDY1EOgJNLvWKJFydCNNMIDGXM+pINPh9sSpXMSwKbo1TabWCrzhWz9wbIs?=
 =?us-ascii?Q?vtIA1LnxiQ5jFGM7QawKBHbx0Ak7j0Wky+onfF7ZHoxunRNpgQ8hdXlLMaiA?=
 =?us-ascii?Q?DSLE9PdcPY/0Cf+1/Ok=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 21:27:21.1543
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78180ff7-c9e4-484d-85d8-08de36a0926e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099DC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4972
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 08 Dec 2025 21:27:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16874

From: Antonios Christidis <a-christidis@ti.com>

stb is a header only library, that does not have an overall version.
Instead it tracks individual header versions. All header versions can be
found within the README. The header with the highest version is labled
v2.30. v2.31 has never existed.

Also update the commit sha.

License-Update: README update due to new header file library
(stb_include.h)

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---

v2:
- Add License-Update reasoning=20

 meta-arago-extras/recipes-support/stb/stb_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-support/stb/stb_git.bb b/meta-arago-=
extras/recipes-support/stb/stb_git.bb
index 01443f7a..ecc9911c 100644
--- a/meta-arago-extras/recipes-support/stb/stb_git.bb
+++ b/meta-arago-extras/recipes-support/stb/stb_git.bb
@@ -1,11 +1,11 @@
 SUMMARY =3D "single-file public domain (or MIT licensed) libraries for C/C=
++"
 LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://README.md;md5=3D42144ce827adcfa5170032f0ea03c=
227"
+LIC_FILES_CHKSUM =3D "file://README.md;md5=3Db499fad62f2f8e336bbea84cc94d1=
e60"
=20
-PV =3D "2.31"
+PV =3D "2.30"
=20
 BRANCH =3D "master"
-SRCREV =3D "e6afb9cbae4064da8c3e69af3ff5c4629579c1d2"
+SRCREV =3D "f1c79c02822848a9bed4315b12c8c8f3761e1296"
=20
 SRC_URI =3D " \
     git://github.com/nothings/stb.git;protocol=3Dhttps;branch=3D${BRANCH} =
\
--=20
2.34.1


