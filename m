Return-Path: <b-brnich@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36185EFD213
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 19:03:55 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.8])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.53184.1772046228830334877
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 25 Feb 2026 11:03:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=MuJDUlBi;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.209.8, mailfrom: b-brnich@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ft9zGwqLwGqyjtxRuB7bB0LFtoqZ/BSc2c+Ig9KkUjoz2byL5qXUsLdvAcaQcRHLak9y5TTesg4Mh6f51Do/qrWygStaDEd7PSMdrvrueb1Y1fHWHnEv4OCOSwuViLKVnCyEXyvUBHnHmXegtl4Ppjik01HIaBa3VWoy31aNiomWslvWQxSZBjOAlt9QqJQwY0tnyR5BnYbQdEEIyJNLLX8CvIbeo0w3xBhaSyLlvn+eoUXxRslnJghlNePEn6OM4cW9Df4EsrnNgqYmAQDC2mnAGwfe+MeQM3SStR7e9QbTtfi2IiKmg1BNrO0Q/Cu9vRmfbz6lHMmh22ygxF69nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dyP9YnU/J/dGsYvzlhbnnfLrIVXlXIjReqEtezcWw78=;
 b=do6MIYZGyjc3qEixxV0kcto24S7wRDBhHWS++s1a+NogXvhfRz3aqBCbLdzgiYyFHT4l/z/8RC4HIKdkABKxnRi7Ts8EJWrVXxAmSyTcS8IBtT9o2GioLQiUIF8vbeaL1orUtkFUxav6JGT8tebZIrubHRG7mhVNh/vwiEV0kOGgATABlcp3EMeeZqDrgQ5hgA47M+8XYDm8d+IWlHWAeHbN82KVR1+MuOzwmF53GLQPqnZbffu7Vs7CBHKIH0vXdbf3AqWeb398a5dYcpcoR3K+YGE5UA4S3wwR/w2vePU09Ree9xFfOAo5G/d8eRe2sz8bT4h06iHgGdo5GolzuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dyP9YnU/J/dGsYvzlhbnnfLrIVXlXIjReqEtezcWw78=;
 b=MuJDUlBiyI2uygx8w3eZtx+G3HafIrYHcqAc+8/36kORorTKql32aVIGY1KRnalfmYspIM8DQzpaEr2KDuJsewQYOuyVzDBWe+XxSZWIBertVGhYCT/AN3d2BZq3gncjiV5wvaSAfYVSwVKpnFxUJqutcuUdotPeT8jGu6XQGcw=
Received: from MN2PR03CA0024.namprd03.prod.outlook.com (2603:10b6:208:23a::29)
 by DS4PPFD91C619EF.namprd10.prod.outlook.com (2603:10b6:f:fc00::d4e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Wed, 25 Feb
 2026 19:03:43 +0000
Received: from BL6PEPF00022573.namprd02.prod.outlook.com
 (2603:10b6:208:23a:cafe::31) by MN2PR03CA0024.outlook.office365.com
 (2603:10b6:208:23a::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.25 via Frontend Transport; Wed,
 25 Feb 2026 19:03:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF00022573.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 25 Feb 2026 19:03:41 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Feb
 2026 13:03:40 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Feb
 2026 13:03:40 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 25 Feb 2026 13:03:40 -0600
Received: from b-brnich.dhcp.ti.com (b-brnich.dhcp.ti.com [128.247.81.69])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61PJ3drK976049;
	Wed, 25 Feb 2026 13:03:39 -0600
From: Brandon Brnich <b-brnich@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Brandon Brnich <b-brnich@ti.com>, "Darren
 Etheridge" <detheridge@ti.com>
Subject: [meta-arago][master][PATCH] ti-test: Add Required Multimedia Packages to ti-test
Date: Wed, 25 Feb 2026 13:03:39 -0600
Message-ID: <20260225190339.3295692-1-b-brnich@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022573:EE_|DS4PPFD91C619EF:EE_
X-MS-Office365-Filtering-Correlation-Id: ed64afff-d1cf-40d6-3204-08de74a0976b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|34070700014;
X-Microsoft-Antispam-Message-Info: 
	OlhC9V+93pG8y4ft8xOCTmtMXgzxsVIqk/W/t3N0QVlKUWIhvoEh0UsY/JQkxzqEc2+2r1CdWphKJXNOeunndueTs/V824ukg0cR7z/QGwqihPP/e0rxKzAOUqTry07BlDXs8b7bynYbqK9cQwUkdHzyKCJA0tqYufPl0V0jYuseGDeMR1NgmCsIqXIr6UNS0WMOBhJO47/60kC6AhriLLIOgNZJV9I/Mj4oawku3p7YJSos8sfF5Zy6TZWzD95iLuCoqiXb5p3ywmy+XbFVXVB4aRWk2JgqMrMBjfVWRdtryy7zsUNS054KRsZBkpDU2Lru8CL1H2sjoNw5K/YCMUtrQNdge0kD63+BcBj47xn6iKnMIPbWRv3jrn1xuTlJ0rIRn23JqtRBFOoSx9bm4aaRcBqd7k91I7Qbl4Sj299S7JiWJIh7TpW6h3rKvLGvdPyKXi0oJ3cRP83uSxG6a+pSV13ZU4HP4i/yCjz8ydk9YXizlLwdft05mI148P2VM3FY8FDzlx1FCIihDEPuGCAZPNtHO73KLebhyOC7Z+iNfdBtH8Upks2P72igZr4gohVlE3RliY+vg+KlAN5DX3IFu8ECcAzKzrJnrVfqf7daEHcjr4+/HydqxIudZ1w7E1ThPBkbgFe7nyDmrVXz5d7bwWYBNFB1cthhu36sxdMAhtrqRvldfjGX+tOIAu/yq8aJANw8J/lja05J4aTufw9xNAapzVkfuxUYlcj/g5/IYyVk7RFmw28OXABulTKpUOUhr+QTYRitI+CIZ8tOl9uTMVSJ6FC4IWwH4BBBLhO0VV/Bna+5I9VYPcuRiD6HepwvDk9LMDedbqtJjTt/4A==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(34070700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	q9oZYEzlKBuSRioF/TCIdgpNPBBpaX+/MzdsJjOnejar7DhPF/YrBTZPGVhIUbFdshDd5C5R8r5V3dv4ZjEfrC9e89PxxLCfRcnb4DWapwHfII+8cAJmxCqoUbdeEHpjWqPwdD3c1HMtvZb/bxlInURiezY1Is67tG/7l9S3V9QIfwHVBkTUmt+/sKNJy6aJUFENf5Rm+FvD6CJVfssBr/C+gXNePpKcE2+ewI0vuJkvO0c0zVGK2Lk6+LHkf7Oqu3GDpkFaG14uLwxUGKJtxnoAnMvJlyJvZquiuVmySI5g6KTFoEkH4jN49s+GxPqkfLtIGfHoDv/9R3BmG+oAbcgklMgL8gsatyuH6Q63x/yQpq4tXgVQOe6eVpCzZiM4/Xk/iODguRDEZyfspF8Bn0e07+HoTMwc/uzbNBueAOrk/Bp8n0/9JQqAOwTC4gO9
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 19:03:41.5960
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed64afff-d1cf-40d6-3204-08de74a0976b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF00022573.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFD91C619EF
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 25 Feb 2026 19:03:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17145

FFMPEG and MPV are required during automated testing. Explicitly add
these to ti-test.

Signed-off-by: Brandon Brnich <b-brnich@ti.com>
---
 meta-arago-test/recipes-core/packagegroups/ti-test.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-a=
rago-test/recipes-core/packagegroups/ti-test.bb
index f2ae1aef..c694545d 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -16,6 +16,7 @@ TI_TEST_BASE =3D "\
     dosfstools \
     ethtool \
     evtest \
+    ffmpeg \
     fio \
     git \
     gst-devtools \
@@ -36,6 +37,7 @@ TI_TEST_BASE =3D "\
     lsof \
     media-ctl \
     memtester \
+    mpv \
     mstpd \
     mtd-utils \
     mtd-utils-ubifs \
@@ -145,7 +147,7 @@ TI_TEST_TI_TOOLS:append:am65xx   =3D " \
 "
=20
 # Disable due to breakage
-#    viddec-test-app=20
+#    viddec-test-app
 TI_TEST_TI_TOOLS:append:j721e =3D " \
     pru-icss \
     ufs-utils \
--=20
2.43.0


