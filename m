Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCDE3C79FB7
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 00:59:38 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3449.1789001970174827237
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 09 Sep 2026 17:59:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=mRxsxPrJ;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=qI6+YnjQ;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689MA5jQ1425543;
	Wed, 9 Sep 2026 19:59:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=tG+6V/QodDwkg/NLyj/Cp0thVTPGuVgZzAnXMN7Ft
	mM=; b=mRxsxPrJkz2MOlWIDU/DOPA4L8goo3+0S4vKN7G1/2vTktY7cK0fYAuqe
	7RS7Wb7iUVvRZocbN9CuLOI/FWyccsHMkJYGNvGp8zrOSnxwcDAJIzcydgbcacSk
	T8N19TTZWn6pJe6gDiwJghWf56Y9+I0NF0ikmSxJ4r+o61Uyxu7UOa35b/W7DorL
	cP5YXNsGZa+h9bp9x0g4kAIJwrxURsWD/XWXBp8jNk6PDRnbAkmfC4ZcfQERmflc
	BcfSbxXEs9IuiXdltac63UsS2QUyRHxxpXYbZ8jQNB5JJqpqoEF1zWCMenpoab6/
	aQyftPj+GInBt4TLyP0ZkNdQHTKtQ==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010021.outbound.protection.outlook.com [52.101.61.21])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gkcxft7aa-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 19:59:28 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BRxjDwWvEO0aSjJhQHa+HMBGIQ/4dNJdD8kVOLYaG0R3PH9HdLZuAfw7w768/WJ8UtC4Hle+yxg6QxfRLW83r08HQCLEp8uSJSdjNVQpMC1N/a/vOVQyYhNWQWgt0SLvGlnzZ0knkkcqkJbcrFlpsxlCi+TKCzNzJFls/c8tAIE7lUzbvCRky00Qwsp6Y6hBEcLOJDh8V83ubpDor/8n64gZXHhb/Drf7XQv6qz6SWJn6GZm86pT/OXH81ME26zEkAvDUao9WBHrmQMiGCIyKHVDPrl9WbjGztbVYhoaPJpPHMl3lWia3CYVghGSS/D7Dx+jwJ+NBdS53Ta+YRHHog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tG+6V/QodDwkg/NLyj/Cp0thVTPGuVgZzAnXMN7FtmM=;
 b=l+RhvzmHD7fr5bCfHnsftK9BPyRajmC9qZF6KHsRkOc06mMGYFVzKqdQqLBsldord4NERhD9YWatdxm0qHb/T1UcoAyPA8Z4LRhLIscWP7xHU8LIsrITo4SAa7ijOD9mnb82xDGIcpcrCAYdHeIVG7oi8FPmFPkFMcbhTV70K1nXY6HJZjmssHgwHBY4xX1T/xAyzNSf9AvI72mSVMN1LnreTVDeJpYC8wStqzJff9znKcFCq6lw2YREJFL6teV+OINl8l72qH5UBlK2x+BYv1Nq8RwVxzOz+pVquZS6B859RfjTPxo073SXGvQT9uBKuFkY9krjduwk9kcBsmJb6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tG+6V/QodDwkg/NLyj/Cp0thVTPGuVgZzAnXMN7FtmM=;
 b=qI6+YnjQC4MnWNVr1a7BuoeBfBhc0qCe6z22vnZp7HkqvuwVWW/INDZsvTv20JvrvNhYf9wzbE9Fb6oMVK7jEEWNR+SKvBR2HJ9YXMeRGa7smaB34syFSO0Ph4Wwil8TzZeTR/ocJyrbpLK4+2ggOyJJytqrERY7NLfslUWyiKA=
Received: from SJ0PR13CA0139.namprd13.prod.outlook.com (2603:10b6:a03:2c6::24)
 by CY8PR10MB6515.namprd10.prod.outlook.com (2603:10b6:930:5d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.4; Thu, 10 Sep
 2026 00:59:25 +0000
Received: from SJ5PEPF0000020A.namprd05.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::e) by SJ0PR13CA0139.outlook.office365.com
 (2603:10b6:a03:2c6::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.5 via Frontend Transport; Thu, 10
 Sep 2026 00:59:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF0000020A.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 00:59:24 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 19:58:56 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 19:58:56 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 9 Sep 2026 19:58:56 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68A0wuJ81322181;
	Wed, 9 Sep 2026 19:58:56 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1x4T7w-0000000GNs6-2t2M;
	Wed, 09 Sep 2026 19:58:56 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 3/3] netopeer2-server: Patch for OpenSSL 4.0
Date: Wed, 9 Sep 2026 19:58:56 -0500
Message-ID: <20260910005856.3904973-3-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910005856.3904973-1-reatmon@ti.com>
References: <20260910005856.3904973-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF0000020A:EE_|CY8PR10MB6515:EE_
X-MS-Office365-Filtering-Correlation-Id: f5aefcbf-6bbf-4592-4322-08df0ed6c19b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|22082099003|18002099003|56012099006|3023799007|10067099003;
X-Microsoft-Antispam-Message-Info: 
	C1v84tVFvE1qspcs6gs5t7BgphDRE+7oAgae0GpB0qjQvoEu6slymkPj5dfJpR0nOw8Zb/gDJYoqmHt4tEQTgBeu4MdPKVZn6P9oYeU3fj9D4TMUYdeTEeBhoNtkpTYnVk7oVByLHcWj4rv1pT3L+PQatlSJYalXSGdMrlAn5l5zu47Eov2yjN1U7is8gOI0QpB+PrD1O4JSbMCIgjH8IrqE7ojlfqekN9EVYkeiboBvIWoHn2diSLjbl5FTprmt3B4m4qyb84X3rvOugHE5HZoTKumaWiDuXcCHGub/tOgk0lwdUkSndDjRJDBV+bxsBrbhzRDAhNkMPHWCs1J/IkWQo7wkPwGm3qa5kS7c3oxHca499nKOGv9SGHOZyHOKGTsp64QUxGYG5hFuSZZxGYXoAcn4tBh4wG/UEwyepM64hpNVYXSH5aK4mI8A3RRNScw9UXLqjeSDslH3Iz9cSOtGovfkR8d1jUtyQjc5Xbr7beHe/ra5/jA+kkt2FJ7xFGY/SE8AczQdknoLRllG+CSsZHaRtnPdchiWOCkgRs7OC5T7oFan2B824O2rm1MdY1L6bLkEXZsisxxyiM2nJOlvAHKSQqfNKS3sny1dRmoGVAMY1r64S/NIAdRjX9aLiQyLES9sfsz/DKuBMjLYe23BuZ4rRY5c4Uvw8zlba68=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(3023799007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	8/fhw/WNmIy18NBf7grYB1Fy+bbGEdyEyE6rNCrjhJPRnGvrE/oB4Y/z1Fwy02s8e2xAF25fhB10YktDqh/Nbpt169kkXaORbKe4rWeZeGjUAIzvZb6rW1oMRIvqtP5YTPpF+zkkylSUHY7L3hSDUNOybaA1c5FrEC198atu0wIxhsOmuYhaE0E7h883uHYA1u0nnTSSdfq7ogQ2mBvv1thkg9EC9dzrERMnOUlC5haKLgxzWhsOHabUryVXOm8q6CVq3imisIFtJNpwRtie9kPVvHuGLfN2tQTZY7J37BlmTZa9bkGXwr2tyIYNumx8jbBVVGXhRyxi0ILqiE5p9mcjku30TkA6qnq9wexRnJLcCpbKr1cwTta9g7x9MySlznZfNJyN5EEjyMH7UfBWV6K76+i0ImMP4RnOj0sb0beJTU4YB5j9mF48bZ1fNKgO
X-Exchange-RoutingPolicyChecked: 
	R1xMV0BlaHHOx+GdCw1J5NSkXIzXEVAhziK9PkWyFBMS1440RyKA3I78AP/uRSK3vOVX48/ZIEF6Jw0hFcMTjBGCmOEJrrp076bqvV847nJCG9VmFdOVJp7jVPqh3Dzs6YV6IFsn8jDXBM4DzL3pE5ozuWebcfsjxXNh8f2cIT+m0thAgqK5drHeCjZH5UIv+HFvzYcC36HRJXpCGCv2tXM8T/F9a1kGyDyoksoYZNE6PCg+QNBDhOli54S6pF3KFAjxAiG8JJrj035jiR38gy3kBoei7+rK2MSK6AYj4/34VRv9XH/DUOvVQ8g+t0c8ger+JgDnwXWJB0PgXJuTZw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 00:59:24.2560
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5aefcbf-6bbf-4592-4322-08df0ed6c19b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF0000020A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6515
X-Proofpoint-ORIG-GUID: GRpjfH0qReRb-6IVjSK4wTqS4uKvI9OY
X-Authority-Analysis: v=2.4 cv=SoAFe/O0 c=1 sm=1 tr=0 ts=6aa200f0 cx=c_pps
 a=RSwuJLpHzOwHBpypAu37kQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=Q4-j1AaZAAAA:8 a=sozttTNsAAAA:8 a=_8Lzv5ex1gT_exR-QJgA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDAwOSBTYWx0ZWRfXy6AB4QJW90rg
 W8z1WmQFiv6i8VOJjei0rAa2tU9GaSjf772ULMfWEq71Z8vzYx4VLHmvvw6nNKbgD2WQpB6k0oA
 cxklW7WgPBKgYIaocL9Aj9KoNqUA7c5AKO0KZM85GQHTn6Uql670J6gA0NDS1+j5hCxe667piCd
 VDQjDpNmOYJEGrw1lwmRPBO6TpJwV67GHURft5HM6kWr4i6YNIZYoKOhnPxsoDkxOZHCnD8d6ra
 hqJtCHfeG9+1pDzNuNMO6o3YTrv8IoBJVwinAoV69bS7g6j5XO+lES6i4lWTPDoljQkpEAx/tB2
 0KFQ1sWbTeOGQX1Y0fpcGwk7qn+efQBdm2t6SxI7eoCE8AjX7xTfFTzLYgd5aotEhmH74NMn4Wu
 +PP27NeS1j9r5DNMz2yntHKOrik3JItDG9kMkk0fBs+3zjkN9M0b+7arHv0yG17pFTfHUtftjNx
 Pn8mT6wmWE3WI0p57Tw==
X-Proofpoint-GUID: GRpjfH0qReRb-6IVjSK4wTqS4uKvI9OY
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDAwOSBTYWx0ZWRfXx1pSj6iBE3Zv
 xoHTTko4q/pJHAgKUe9Qqy6caYKDXmS653Ve7LosyqfTjXh1IimadOPunPr6+LXNmljGqjIGnll
 dvJMe4ZPj/QaV+MHDaNti9WvlZ/eGBs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-09_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100009
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 10 Sep 2026 00:59:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17658

With the move to OpenSSL 4.0 [1] we need to patch some calls in
netopeer2-server that are not 4.0 compliant.

[1] https://git.openembedded.org/openembedded-core/commit/?id=20bf704e5809e95036b998f0f45145cf7205b05b

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../0001-Update-for-OpenSSL-4.0-support.patch | 64 +++++++++++++++++++
 .../sysrepo/netopeer2-server_git.bb           |  2 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta-arago-extras/recipes-extended/sysrepo/netopeer2-server/0001-Update-for-OpenSSL-4.0-support.patch

diff --git a/meta-arago-extras/recipes-extended/sysrepo/netopeer2-server/0001-Update-for-OpenSSL-4.0-support.patch b/meta-arago-extras/recipes-extended/sysrepo/netopeer2-server/0001-Update-for-OpenSSL-4.0-support.patch
new file mode 100644
index 00000000..541c09b7
--- /dev/null
+++ b/meta-arago-extras/recipes-extended/sysrepo/netopeer2-server/0001-Update-for-OpenSSL-4.0-support.patch
@@ -0,0 +1,64 @@
+From e8dec096bf30c0e074814af223717cd109634f05 Mon Sep 17 00:00:00 2001
+From: Ryan Eatmon <reatmon@ti.com>
+Date: Thu, 3 Sep 2026 17:32:39 -0500
+Subject: [PATCH] Update for OpenSSL 4.0 support
+
+Upstream-Status: Pending
+
+Signed-off-by: Ryan Eatmon <reatmon@ti.com>
+---
+ cli/commands.c | 21 ++++++++++++---------
+ 1 file changed, 12 insertions(+), 9 deletions(-)
+
+diff --git a/cli/commands.c b/cli/commands.c
+index 677fbe7..f4ad96f 100644
+--- a/cli/commands.c
++++ b/cli/commands.c
+@@ -1825,6 +1825,7 @@ parse_cert(const char *name, const char *path)
+     int i, j, has_san, first_san;
+     ASN1_OCTET_STRING *ip;
+     ASN1_INTEGER *bs;
++    BIGNUM *bn;
+     BIO *bio_out;
+     FILE *fp;
+     X509 *cert;
+@@ -1847,10 +1848,10 @@ parse_cert(const char *name, const char *path)
+     bio_out = BIO_new_fp(stdout, BIO_NOCLOSE);
+ 
+     bs = X509_get_serialNumber(cert);
++    bn = ASN1_INTEGER_to_BN(bs,NULL);
++
+     BIO_printf(bio_out, "-----%s----- serial: ", name);
+-    for (i = 0; i < bs->length; i++) {
+-        BIO_printf(bio_out, "%02x", bs->data[i]);
+-    }
++    BIO_printf(bio_out, "%s", BN_bn2hex(bn));
+     BIO_printf(bio_out, "\n");
+ 
+     BIO_printf(bio_out, "Subject: ");
+@@ -1903,14 +1904,16 @@ parse_cert(const char *name, const char *path)
+                 if (san_name->type == GEN_IPADD) {
+                     BIO_printf(bio_out, "IP:");
+                     ip = san_name->d.iPAddress;
+-                    if (ip->length == 4) {
+-                        BIO_printf(bio_out, "%d.%d.%d.%d", ip->data[0], ip->data[1], ip->data[2], ip->data[3]);
+-                    } else if (ip->length == 16) {
+-                        for (j = 0; j < ip->length; ++j) {
++                    const unsigned char *ptr = ASN1_STRING_get0_data(ip);
++                    int len = ASN1_STRING_length(ip);
++                    if (len == 4) {
++                        BIO_printf(bio_out, "%d.%d.%d.%d", ptr[0], ptr[1], ptr[2], ptr[3]);
++                    } else if (len == 16) {
++                        for (j = 0; j < len; ++j) {
+                             if ((j > 0) && (j < 15) && (j % 2 == 1)) {
+-                                BIO_printf(bio_out, "%02x:", ip->data[j]);
++                                BIO_printf(bio_out, "%02x:", ptr[j]);
+                             } else {
+-                                BIO_printf(bio_out, "%02x", ip->data[j]);
++                                BIO_printf(bio_out, "%02x", ptr[j]);
+                             }
+                         }
+                     }
+-- 
+2.43.0
+
diff --git a/meta-arago-extras/recipes-extended/sysrepo/netopeer2-server_git.bb b/meta-arago-extras/recipes-extended/sysrepo/netopeer2-server_git.bb
index e43ef9f6..6b78fbbb 100644
--- a/meta-arago-extras/recipes-extended/sysrepo/netopeer2-server_git.bb
+++ b/meta-arago-extras/recipes-extended/sysrepo/netopeer2-server_git.bb
@@ -11,6 +11,8 @@ SRC_URI = " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'file://netopeer2-serverd.service', '', d)} \
 "
 
+SRC_URI += "file://0001-Update-for-OpenSSL-4.0-support.patch"
+
 PV = "2.2.35+git"
 SRCREV = "6d1cb61ef3ce2274a91dc9cbc51318bcd0b54697"
 
-- 
2.43.0


