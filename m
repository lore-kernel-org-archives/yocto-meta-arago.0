Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BDB2C98324
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 20:05:33 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.73688.1767643525653470700
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 05 Jan 2026 12:05:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=NzxAXTvt;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.201.51, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TpZ5UoZY0xoW15MVJHV5UjGh79KRF6kevOUNQ/gn8M1gguvu7ZP+gHf9EHC0Ok/m35vrN8xm1YlonZOR/y6EKkZfzDlqMqzVP7D2mPlLCKFAeDrev4rhZliWKOCbWqWsbPbGZwsNu3UE4yAy4DbH0bhaBG0X2OEss6PvfV76F6EcB22XscIlPZwcwHOrtTZJZUZzbSZYGDzcgvqElzikhqE3f5VOyHlAtxnL6ntSM5HLck792T4CDkpLhYI4qAHISnr6HZf+GC/GTL7qR1sKT8UQB8fgKvzWADtk9n1a7WkTCfCp7tcSdehE2DSRqrD5TW0WbnESiTvoWhsjeqEMxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RUENoSHBciomL8C2DKFJysPkrRpCTHieH8rcMxP7HfQ=;
 b=TfhnIVk0v2YpXpE7/zbufU7ri8ipVaiNr85/5x7QSFFqKk7b8opvJ3qkWFg9q3OYnaPseT3VmK4KAx8UaB7z2AMYJjqc4Lc7/vNL05R1ZSfPk76DxoS4XYGlbd0j22HSWGYiRR+3eaSEhJIHqzExu9vanCysc+MuPpfXzpjnsJyYDvO3Y1OZlQNDGnok14FedZ/N8MBquFlvj2T6RMeC5hvKwSFWG5UbYDTNjpOW/dEHxXfgQczDDkinr+bN/hK2tg6ah4LTP2dZfpztA1nr/I1tYAkD57LeQZXOkIZcH8LAWX4LKn7ndMBsAEEZIqt71mpKkAQNlDRJb7JEQLSK5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RUENoSHBciomL8C2DKFJysPkrRpCTHieH8rcMxP7HfQ=;
 b=NzxAXTvt/Itay2//kXCINXuxjg33PNuSQFYs3ZC3HadD1BMRoKieolTjofzp1qSjWYx0cuIRAEE2x+j/0MfVA7lZuT5Jg8ytbc3HjmQQRYv6hEGsvs/GIBJJik2r00Y4+XNTiitXMlKjY1rw2WRExjrL5jbFf1CGcy7sMJuXJ5Q=
Received: from CH5PR03CA0020.namprd03.prod.outlook.com (2603:10b6:610:1f1::10)
 by CH3PR10MB6714.namprd10.prod.outlook.com (2603:10b6:610:142::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 20:05:22 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:610:1f1:cafe::60) by CH5PR03CA0020.outlook.office365.com
 (2603:10b6:610:1f1::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Mon, 5
 Jan 2026 20:05:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Mon, 5 Jan 2026 20:05:21 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 14:05:19 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 14:05:04 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 5 Jan 2026 14:05:04 -0600
Received: from fllvem-mr08.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 605K53Bb1831190;
	Mon, 5 Jan 2026 14:05:04 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH 4/5] branding: Remove processor-sdk branding file
Date: Mon, 5 Jan 2026 14:04:55 -0600
Message-ID: <20260105200456.2472163-4-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20260105200456.2472163-1-afd@ti.com>
References: <20260105200456.2472163-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|CH3PR10MB6714:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e484feb-3089-4f81-01be-08de4c95c197
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hIYaEYXe8Rz25eZr81mtRnmnzSFK6HPC2CFcGW135izPvMn7mBXDIKIJuVGT?=
 =?us-ascii?Q?lIewKAgayKM1eGeKgy9fZpAflbEEAC3w8xZ5ERtiEI4ou59HM9TQO2sfmMLY?=
 =?us-ascii?Q?eNo9K/uiZ0KgknqAt4sexUB1LQneNMdzfTtsQhlldAgZNX4QYT3nnK9GcENN?=
 =?us-ascii?Q?1DM59Y7gaRuNqbJu1sc4G1i1zfifIAmI0RxMpnirVtXaoxTyl5+l6tfOjIxz?=
 =?us-ascii?Q?4Un4sYv99vvLLnGVl0YUVVRgUvKEPqUbqi/eLR8g03Qx8NYvSyo11tLigSlb?=
 =?us-ascii?Q?cDoI7alxpnum6XvnLB+zE7SBvcLDYHnTX5n3dPNJU1j2V/qA3BDvjexWyS14?=
 =?us-ascii?Q?GVJmr/cjRT/Ktk9NpvsfwSvT46PYKS64OID0uzY9OJaEELdXnbgFAbV6qHhO?=
 =?us-ascii?Q?09x1wefWzhQNS2qrE68uuX4mQeIhsErGs+qgN8dczWL6tunAfbv8HegLc+RL?=
 =?us-ascii?Q?SYEfaKdRqjZz+7XS8HaR/rM7MXHWgQYXtofmb/vrHpVwQSqF9Kl67RT4mOHA?=
 =?us-ascii?Q?XVOl8ebJ2OxxAwqog5wiVcz+JQJZpL/8n6cDbMIPXkVEQ+n1QAzDEwCwtrbZ?=
 =?us-ascii?Q?67gEbNAHX8p3v5mOs9t8I3wQ9kfP71TbPiGwy/KAiRYNr4OC6iB0zQ6yTtLb?=
 =?us-ascii?Q?ngKHEMWXXpBfdGSleK/nE1szaQ7OYJ/ZNC/PqhhAITpDzFce2GLclHfGtC2E?=
 =?us-ascii?Q?o2vyO9fXOzWCU6eD8ynavjlirlZCriqv0q6jbk0peB7hbWUm7U284dpw1mJI?=
 =?us-ascii?Q?Xu+zP+ZBy/+zYqIF6YmlM9D9LdYPvsqdPoI0w0abZTsdAGhxKcmpobiuZHyM?=
 =?us-ascii?Q?SGVq/oIK0DuinTqzCdl5IMCULTnDeiewUG8cFWli6QPfIygCKLZDV1wx6eX1?=
 =?us-ascii?Q?F7TMt6Lk91lXVZcakZ/Ctzhn2n8EFV8IYy5xJ085dtie+jJO88xqHyg8HHJR?=
 =?us-ascii?Q?zTMuzDB6Y5QBUTikCxafmrwwK48B/iMNrLxjdwxB8M3cMVCnJkJ6AtuRSyY7?=
 =?us-ascii?Q?59PCkbg07OEs7/DdnVUfofrJlYEsxTsj37iRKsUvJ+troUfJeh1YB6pTSkCB?=
 =?us-ascii?Q?JoHeagUkqh13Hnxz4tOZrdMZFocy3NjHL6GPxKlYGOwnIMbPl1yWQ+woj5Pb?=
 =?us-ascii?Q?EZMH5pZMqfE/emFyjvis6LVGAxU8+/dByXE0i9Qsn/lPhmqBymwNteE/Ebvt?=
 =?us-ascii?Q?zcx7SU/7r+453nu5Yqe03JB930EJoLdVBAJv3Kw5MOqqWclI/ERORrEf5pRL?=
 =?us-ascii?Q?4a3+ya/9F0w4f3nsM8kj8CUkKDJ2ZbmBjtHY463L6fzW5E9vvsGDT5a/hkdf?=
 =?us-ascii?Q?i6SiXD0sPuRWEfaU8JwYltWsVpqnbvGAuutAffEuCuAdaAnINeuNuSdBDZEX?=
 =?us-ascii?Q?0HqbgfOd0aFdD91/xLFQg/n3eAGJ5HoP5mp2F6WCjVpmlBcvTIt764I6Xsav?=
 =?us-ascii?Q?4XkEAFTwQ9spsDTH0LEnQf6TVkuCglYjtF7el2S8xMp4Tp1a3HrzY+x2Ka0k?=
 =?us-ascii?Q?uDaZxdHg7xmNKREk6TcmtDhm60vXE8VzKanimjiWtBd9gf971KcFYw0dxWr2?=
 =?us-ascii?Q?c+ViqxcWD4tJVBR309g=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 20:05:21.3918
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e484feb-3089-4f81-01be-08de4c95c197
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6714
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 05 Jan 2026 20:05:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16919

This brand is no longer used as part of the base meta-arago, remove this.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../distro/include/branding-processor-sdk.inc | 29 -------------------
 1 file changed, 29 deletions(-)
 delete mode 100644 meta-arago-distro/conf/distro/include/branding-processo=
r-sdk.inc

diff --git a/meta-arago-distro/conf/distro/include/branding-processor-sdk.i=
nc b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
deleted file mode 100644
index 3ee23dc3..00000000
--- a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
+++ /dev/null
@@ -1,29 +0,0 @@
-ARAGO_TISDK_IMAGE =3D "processor-sdk-linux-image"
-
-# To create newlines in the message \n is used and the slash must be escap=
ed
-# to function properly
-
-SRCIPK_GIT_COMMIT_MESSAGE =3D "\
-Create local branch\\n\
-\\n\
-The below commit is used for this local branch and is the one used by\\n\
-this sdk:\\n\
-${SRCREV}."
-
-SRCIPK_SHALLOW_GIT_COMMIT_MESSAGE =3D "${SRCIPK_GIT_COMMIT_MESSAGE}\\n\\n\
-To reduce the size of the SDK installer only a portion of the git commit\\=
n\
-history has been preserved. Also links to remote branches and tags do\\n\
-not exist in this copy of the repository.\\n\
-To fix this please run the unshallow-repositories.sh\\n\
-script located in the sdk\'s bin directory\\n\
-\\n\
-The script may take several minutes but you will then have a full copy of\=
\n\
-the git repository including its entire git history.\\n"
-
-SRCIPK_CUSTOM_GIT_BRANCH:pn-linux-ti-staging =3D "processor-sdk-local"
-SRCIPK_CUSTOM_GIT_MESSAGE:pn-linux-ti-staging =3D "${SRCIPK_SHALLOW_GIT_CO=
MMIT_MESSAGE}"
-SRCIPK_SHALLOW_CLONE:pn-linux-ti-staging =3D "true"
-SRCIPK_SHALLOW_DEPTH:pn-linux-ti-staging =3D "400"
-
-SRCIPK_CUSTOM_GIT_BRANCH:pn-u-boot-ti-staging =3D "processor-sdk-local"
-SRCIPK_CUSTOM_GIT_MESSAGE:pn-u-boot-ti-staging =3D "${SRCIPK_GIT_COMMIT_ME=
SSAGE}"
--=20
2.39.2


