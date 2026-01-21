Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC63EC44506
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 18:56:23 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19613.1769021780855898597
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 21 Jan 2026 10:56:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=qODDOc2X;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.198.9, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ve1P14Fgih5pD/yGC0AcF3ENIKbi07SQbkjr24JT9oq0pDlqDwA5+nIfQqPb32KTfHSUvTec13eJN29kttdGKeIWVP1GXTMtgFrJpTI1257qEzTFJvehpzK8IoOixApBUVjSGFTXMYkN8IkPzsC2wQSOKTcdlqmlwKtGFNlRaOveEbA06h0g7GFPYAXBwc3fmkRXKByd8ruXYNioNVEaT20iQ0hn2HS44rmI4sxlI8m4nTwFOBG7ijOXlufw+qzcXDDqKBkwI+gA+fHgPraEo/snb/H/PTKP6AMaTMwTH8J7/m3icZtDJ/TxA7DEFtIW7DX3W/g191K4BF7GTRfBzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DH8A+DkJOXjg3Y96dltRJU84L+I1PI6voqflALxFmDc=;
 b=NUuVSiNBg6bvgG4fAJAQdoffnA67tveJFMSMgUDpTvGslKkr0Cfgbti8/ThhWjJ2tXaJCycQ4VtS4fEmE8EwGmN+8WU5mVfDuo7OyUhZgyzbcZ4Bxvs10Sx5BPF4oeCn3NhT8VN1FM4dGWNjHaejAkG24y2nBUyICkW27/ajv63fjM5fyDmv4uYrvDouCHXpfdF7AySmwu64ybi/cmUeayP9Qv6oE/M3UDz2eHbNQvx6QQ3Un3yBNQc+QAyYACWSCLNR5Y9GpVZwZP+G1rrrrUguurHXZK8t8jYRitmtmEBLP28loNg23q8F9N9DUKRBwltJxU0uh6B/OHfaGUO5Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DH8A+DkJOXjg3Y96dltRJU84L+I1PI6voqflALxFmDc=;
 b=qODDOc2XLDq4G2svKXdFxSi89GuNIhwmTIWkQW/8VZxEzkRFZKKox1P6DRy1lq1FvHmoCli3t8w/vs/g6+ZxOnp18addMojZl5HdvY+xsII9ELDSgWDCg3QqGiaPl2i1eqlfzHFDSr0ctxtpxWXtdsVEOy2u42qBLPYtg1yJ1r0=
Received: from SJ0PR13CA0172.namprd13.prod.outlook.com (2603:10b6:a03:2c7::27)
 by CY5PR10MB5962.namprd10.prod.outlook.com (2603:10b6:930:2d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 18:56:18 +0000
Received: from SJ1PEPF00002325.namprd03.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::3a) by SJ0PR13CA0172.outlook.office365.com
 (2603:10b6:a03:2c7::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.2 via Frontend Transport; Wed,
 21 Jan 2026 18:56:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00002325.mail.protection.outlook.com (10.167.242.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 18:56:17 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 12:56:16 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 12:56:01 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 12:56:01 -0600
Received: from lelvem-mr05.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60LIu04m3358457;
	Wed, 21 Jan 2026 12:56:01 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH v2 4/5] branding-processor-sdk.inc: Remove this branding file
Date: Wed, 21 Jan 2026 12:55:57 -0600
Message-ID: <20260121185558.1330658-4-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20260121185558.1330658-1-afd@ti.com>
References: <20260121185558.1330658-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002325:EE_|CY5PR10MB5962:EE_
X-MS-Office365-Filtering-Correlation-Id: 027778ee-e15b-465e-6072-08de591ec236
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ABlHIAFjzkx4LjGcDD0nDAu4sqBIZGMuxtej5r0ovYfvwvLRotoh4H1R/qX+?=
 =?us-ascii?Q?O0cDiWUACFEeBlPJr/JLPhwYZKwsvS8h8e/F6ig67HK/WvrnKEWfmDsiWrQ2?=
 =?us-ascii?Q?HMWnHrA/8QvY8zFHQLcz77ZAIdrsOWnEg//R9+oBa7PLyRT4pEA0DTA8qIAK?=
 =?us-ascii?Q?B+oLLA3of7SsTFMsqO/8hYxJ5cAaJ+kVxtIhxOtt3GhXJWNNhLA54bOX1dJw?=
 =?us-ascii?Q?cg9IrwUSMCi7PcpZviUlJX30Zb1r7geUeCN4PMf8U9OePK1xw8UevIJiQHp5?=
 =?us-ascii?Q?SxeutP+4IEchEcN3vYRFQTAxeXzi1OgNxoQmxN/2Pq9xrHDB/+rW+sYySubq?=
 =?us-ascii?Q?i0Q2IrWGEQngiu3bGD5GWV2RFwsRYTgMr33MYo84zJ1OH9ULy/wlqj+4k5wt?=
 =?us-ascii?Q?f4s1AwCiwuxfKDimodT9JZISOVO4yZFBFwQjONrKhhoIZ0z1A+gpzmea+gxn?=
 =?us-ascii?Q?bQn9Tp3Ds6sbSBmlumrdprEPhjRqAD2/LeTMnACvK38gp2HJDQMrt/EtokJE?=
 =?us-ascii?Q?Ufnl1KSsnbziGj2NkFKWT4vBO7fBY12FbzkSq7KBKUkfLcKjekZgQ4T6gzxb?=
 =?us-ascii?Q?VI7YKBnaDcK2Cutk1G2CEcG7BV3yhWuapOyI36nEyYoVI/w+/5xe/imZhn7x?=
 =?us-ascii?Q?Ypkoyi55zgtl/GPoSQ5T/5GMD69UevI1tpfQXvpKUxe2zaUrf0kL0cA/Bu34?=
 =?us-ascii?Q?pbzot7SwwNXqufAFed+6xjAXP2S/yYznIjVSjnC7TP0b/nvzefIa5vJ5hDlS?=
 =?us-ascii?Q?mcfsTw2f+Aiak00OoeRvMpKdk6UbdNyJlUaocsASEJdoZ4AyqmF0R97ZUDhI?=
 =?us-ascii?Q?IkDETM1PAqL8/LEkxsKFAmC5aP+PNbqHPq83esX+r6uDj3m/EihwQjwQiYlz?=
 =?us-ascii?Q?Tt9kkoNH8EZ/xXRXlwyId2pfW163+a21T1hh8r8Gxmyq+d+WFGrJtvdhUSAR?=
 =?us-ascii?Q?1EYq39h3T6pVele6ef0eQuL7ygzYxPKSIb9Kmh5GK8ef0hrySa5cf22xjQs2?=
 =?us-ascii?Q?fUfVu51C0IcLrx8qQNKUBjGKx2bfQuJ6T6rvgFANoGAxdbqYdSVvMUqagM7G?=
 =?us-ascii?Q?OeAqikzb/3FZie0Dqr3j9H4CXY5VGlSulJdLe1eZL3MYCyRuddD/TzFMO9mB?=
 =?us-ascii?Q?AutBgRGP4MIQmCFgq9mr1uwlAWjzrus2cGLlejliwRxEagDDShH2EsN71nnQ?=
 =?us-ascii?Q?pLAT87PC3fEUyoXkHPGDRz+edfycELvbqvbswcEB4CEd9rArztQsnU6Jxl0r?=
 =?us-ascii?Q?iXRgQBQIcizWI7MyPnFPh/kIuZaXhwsFuaGXsdtnxHY4fDRaOkPNuGRD5QIp?=
 =?us-ascii?Q?5rrrEakcyIpYPz+IPpZ1F106agWuu0ENZhT6mBuG7cqsfQMav7UglGSXd++x?=
 =?us-ascii?Q?xEcNYVbUFVV9m3X6tcTcwvi7/o4kybntpidOBXG3GxLzIMcHWRegv/j8G4I/?=
 =?us-ascii?Q?hyi7p591lnLEcou86irpqVo1Mxzw7EtxHwk0il2WRGg57DnUHh6ZJ6lihn9Q?=
 =?us-ascii?Q?qBkB8JsKk2RabPnQCSuacqiYHpfvz6LYp1ygEczk3Y7ytCrDNJ+4701QLvzY?=
 =?us-ascii?Q?+EHLJCcZkF7mjU2K0gYjXAdh/rBvr9/75KkjEalsiVwvWknAh6lr7VZJUFF9?=
 =?us-ascii?Q?8Or/HrK2MUZ1xahoBtRcuTJIJOQTMr7QDjjd3YoeR8fs3P8yxdw+NIF9ey5X?=
 =?us-ascii?Q?TOffdA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 18:56:17.4147
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 027778ee-e15b-465e-6072-08de591ec236
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002325.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB5962
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 21 Jan 2026 18:56:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17002

This brand is no longer used as part of the base meta-arago, remove this.

Signed-off-by: Andrew Davis <afd@ti.com>
---

Changes for v2:
 - Add file/recipe name to commit message

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


