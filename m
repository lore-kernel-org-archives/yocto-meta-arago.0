Return-Path: <y-hegde@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9FA21062887
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 12:22:33 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.60])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20133.1773231747499518506
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 11 Mar 2026 05:22:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=cz+QOb4r;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.62.60, mailfrom: y-hegde@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VDxL/kw+zWeoxuEUFFAIVBcSdO54VPmf3LHxL1ZDS5R20B24M4GPDDw98LyIXxi1TPFbSkm1P0sswSxbNQMcMb4cLJii0Kdwp6rnAQjnwWYvux7Ar8pTeUff6Dbh8RrtnTNucZE9nrPxMv0vgCJ32hKULSQKGtkbWzmUfIJpkwRcbjsV03qvboJKod6CZXju9P/i9Jvmy7JnOerHKca1pzUWK/NLJcPN3AZXB8H9jP1dBj0ZgXw0GvrgIXCNZ/R43JJvM2QzQm2Kiys8RSeUwMEXDgxwKBqeSP369cxqIhPXOLnFyfqYnc3a8CH8G/LzxrFEawDEDpN75FkfsLZXbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YQEu+HrPyCm3CYkgrg8lpjrcGVnc75oMz6sfXlMItDs=;
 b=bz9Nc2G71I94jIPAeihOY/wqTsYZcxu7I2xi2pQTxsud2z48YxFQGPGMA7aQKSIrPaOi4zTV5mnP4vabJGW8tFhhCCUCg9TB58mARtQqaNnRWBNgBVLE/A98+fNDR/rEM33Pd86jGHg/nw79C7Hw5NfHSAfFnvcb2qijCOrAVSOh9heVqvd1L/YrAjpyRoZ8WR0blpxybEBz/Y2fUH1QbbPdbgevsaau9H3HMVQA+YxJbSli+4i0TT+Tr4poVLiZJ3AdwwbvMDW6yyPrleWgs5jih7ADm2V3qy09n80DTYRRZH22QiMg0nsZo6j/KET3rM10A8IO0qz9hOvJ266RTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YQEu+HrPyCm3CYkgrg8lpjrcGVnc75oMz6sfXlMItDs=;
 b=cz+QOb4rmcpD3y4Y3ldqkXTAXwxRZKKPuDfurpZihhE9gTx+yjKU+iQYAsDZeeS89RYKdOGuOhI4dMHbrkyVRgtSZHXc4pbWdXYV+1gfk3sw72NtKXKLIi6v6/nQiTRwkG8NKjkW3mObtifareJoHgMjreZrPP8+lwKNr6I4wf0=
Received: from SJ0PR03CA0281.namprd03.prod.outlook.com (2603:10b6:a03:39e::16)
 by DS4PPFF3A3AE169.namprd10.prod.outlook.com (2603:10b6:f:fc00::d59) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 11 Mar
 2026 12:22:22 +0000
Received: from SJ1PEPF00002318.namprd03.prod.outlook.com
 (2603:10b6:a03:39e:cafe::77) by SJ0PR03CA0281.outlook.office365.com
 (2603:10b6:a03:39e::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Wed,
 11 Mar 2026 12:21:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF00002318.mail.protection.outlook.com (10.167.242.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 11 Mar 2026 12:22:20 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Mar
 2026 07:22:15 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Mar
 2026 07:22:15 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 11 Mar 2026 07:22:15 -0500
Received: from localhost (yogi-work-pc.dhcp.ti.com [10.24.72.146])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62BCMEHQ827192;
	Wed, 11 Mar 2026 07:22:14 -0500
From: Yogesh Hegde <y-hegde@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <prudhvi@ti.com>, <reatmon@ti.com>, Yogesh Hegde
	<y-hegde@ti.com>
Subject: [master][PATCH] packagegroup-arago-standalone-sdk-target: add libatomic
Date: Wed, 11 Mar 2026 17:52:02 +0530
Message-ID: <20260311122202.162775-1-y-hegde@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002318:EE_|DS4PPFF3A3AE169:EE_
X-MS-Office365-Filtering-Correlation-Id: 5609677a-4f09-47cf-8b67-08de7f68d7ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	GopsBS6EtypxJB09NzFD1FwVBq261wtCfhjZRAbifsYODcwhiLckPwb9BlXk0+FafAiQg4aSZ10UABQ1V6Q2b8VSU8y+xgNhFRZL6gD371EQdHK5EuYoRFegy7tHpX0KOclmuixZy9kv0ikOH+10uN+d5P3FEi2DKb1TVxUoKZtGgfAcc3I2dO+XXi91r810WiCIpzdE7dNXH6MXRTjS1Swwd92N2aPJgZZx4k6lY3+1w5Tnz7DsCyfszPh1u+8+mck/nVa4UfNWGvrqV6+5rmf7dz83N6IXZ9G836KYkcYhTsbUNmqDiF8iWJO8mJ6a7mYv2AHk09D/+PHKquki4it4qvO3kK2NVAjkc9ZOv9USLS9aa6as/ntOjhpSmEhPmqrBNQDDBATPsctLmpFaMZ7PZygpPmmmoClHpSxZGUiukphqvRCYqA5/MedG9AvJQVDfhOpp3t1mB2KXAYC9Ui/23CufR2N2D6UFa2LN+okAClGlf3xhHUS4GE9qxdDgUOgaqDTkJg230QhGDFrwZg8C3FEohaIgN4OXd4QMVaz4T+JuFs3OaK4ESa0hXKJ9n7hT3no5YZMizbiJmI3wDzfCztbkfNs3XA4esrL7ByVhg5SHDJ4mqjxA8h1Y1SO78SmkNGYHW/RhVgfO/sm8UF+AiEhc6aKvGd4q/BNBN7U3Icxs2zwja8VYH70WhmHeBIXgrrzvpfH/xr/lirLjChZoSrOuDTvi1i1VQpL5EoIRLrRwylnKCokwMjRV7D+SF/yrODYwQIzBdtt/1b353g==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	0BRezVkuGDRZV4XWfiKATzuadKfSIco4dFvZ7Rj6wIeUlVRkNXKr1BFTp9N3pkgWMZtDQFlMtkvFOTzg4RJQd5EZQEe3ZV8WGbaREKRHK+wy4T+/VFPJ88GnSMGkfFjSJ1VNg7dvrgY87t7uRY3cX4u91Wf/sVrw/6tFtPB/d4ME7gfVa/aCjg+YqDn7kGL2LVK7y77+PdaDJ5J3NQ5RoptodYASHAnx6v47enVvxvr6b4eFx1TqT+wB78QTiCsQp8xOFezqoIV8CXaf4hZflbxm9AkKsX191m0UUGa4RyXFrnnlAy8NJmtYB/z8D2kwyAWMJk5TZLH5k+ZSQ7obh+c+ItgNWcuOqfktpAWOpvKEtWtkt72dU2K4yka6Eis7TcnkpEaZdqbZohClnsIXxRnPpXJ/ABx/ezkC0CXArrZybW7HmgC8tIcuGCrw5pub
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 12:22:20.7889
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5609677a-4f09-47cf-8b67-08de7f68d7ec
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002318.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFF3A3AE169
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 11 Mar 2026 12:22:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17308

Add libatomic to SDK target dependencies to resolve cross-compilation
failures. The SDK sysroot was missing libatomic libraries while the
target images includes them, causing linking errors when cross-compiling
applications that require libatomic.

Signed-off-by: Yogesh Hegde <y-hegde@ti.com>
---
 .../packagegroups/packagegroup-arago-standalone-sdk-target.bb    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arag=
o-standalone-sdk-target.bb b/meta-arago-extras/recipes-core/packagegroups/p=
ackagegroup-arago-standalone-sdk-target.bb
index baa2a4bc..399f883a 100644
--- a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-stand=
alone-sdk-target.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-stand=
alone-sdk-target.bb
@@ -11,6 +11,7 @@ RDEPENDS:${PN} =3D "\
     libgcc-dev \
     libstdc++-dev \
     libgomp-dev \
+    libatomic-dev \
     ${LIBC_DEPENDENCIES} \
     libc-staticdev \
     linux-libc-headers-dev \
--=20
2.34.1


