Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A75F1EB3636
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 20:55:01 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2427.1772484899447487935
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 12:54:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=mAJx8z3Q;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.46.56, mailfrom: t-lannynd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bw5A5073/2NA9qbpysBYTU4wPssarZpB7R+A39zHoJza2kLoJZqGV6zHhCL5j99UFHki1eNA4PUfjg7ACQIYeusrU+vLaglGCPIz3Y1yFwXKnIcv8c8PdltZzePceJPSxQL8AXzkTMlKnhOoo1V/j/KR1j6Eo2scT6WR5Zmn8zeo1OCF593YMvOVhEJOoUnk//8DH28rTBl/1bAghuNqXk4nahj2wFtp39PMkrIXq4bCMe+ufpQzq+shzp+T4a8UxFpBjDnKTlF9QogHneLJ0jgF6hogI50jaDILzw11loi6FI7HhIk0Gt7umaxJzZjpVqXvEZqtwFVXCVc6phEPOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l7trhSKX49sUT+vU7/GsMPQSEJZ/roOQ3m0d5PK1YSg=;
 b=oNv7RebdENnUy4MVQJerLyi3RXEq4hXmQKFPykcUaGFbR6xjjspq0x4ebnbG3Mm6tzJOMBaNKgfelNo4R0zgoje6rU71sX91t7tzJuaZLRQmXmExLioK9w6PnzZx0qXEUdInmgRGMftK6QP4QG2aH3kFbAs9jMv0shaMkxmfyi5wgUCUy6cL7GI/iXRH97gCMrJbHRqraxO3G6RThHQz27g61/3fjiCPNA40RUMCTJ7PDb4Var3o37il4oCFIseA/uZlqWn/2FqQCYZ+movLgEavp+UcMTMSA59SsMHHJ0Jfltm4WO7R1OXqluq53BRYwhPjIGKG0rPD9ZcnIsT+Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l7trhSKX49sUT+vU7/GsMPQSEJZ/roOQ3m0d5PK1YSg=;
 b=mAJx8z3QWGyqemSl4E3SaZz7R1yEqFx1Mg2dKhBJyGPcAmIika353twpOV5uzrdcjvjcLB8IeCH3ei6qD6ghBOuBNuxZvBaYYecHI2oBlKCoaSicme4UeD+p8GwEZtTnS0cw4h/Q5H8PDE1AqXZcAFZWtRNe8qF8p9FAnja4BZI=
Received: from BY3PR05CA0001.namprd05.prod.outlook.com (2603:10b6:a03:254::6)
 by LV3PR10MB8106.namprd10.prod.outlook.com (2603:10b6:408:27f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 20:54:55 +0000
Received: from CO1PEPF00012E63.namprd05.prod.outlook.com
 (2603:10b6:a03:254:cafe::9) by BY3PR05CA0001.outlook.office365.com
 (2603:10b6:a03:254::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.15 via Frontend Transport; Mon,
 2 Mar 2026 20:54:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF00012E63.mail.protection.outlook.com (10.167.249.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 20:54:55 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 14:54:52 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 14:54:52 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Mar 2026 14:54:52 -0600
Received: from udba0500997.dhcp.ti.com (udba0500997.dhcp.ti.com [128.247.81.190])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 622Kskwl921778;
	Mon, 2 Mar 2026 14:54:51 -0600
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <detheridge@ti.com>, <b-brnich@ti.com>, <a-christidis@ti.com>
Subject: [meta-arago][master][PATCH 4/4] meta-arago-distro: ffmpeg: Enable OpenSSL support for HTTPS protocol
Date: Mon, 2 Mar 2026 14:54:36 -0600
Message-ID: <20260302205436.1117890-4-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260302205436.1117890-1-t-lannynd@ti.com>
References: <20260302205436.1117890-1-t-lannynd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E63:EE_|LV3PR10MB8106:EE_
X-MS-Office365-Filtering-Correlation-Id: fea3607c-4db2-4f16-32be-08de789df558
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|34020700016|36860700013;
X-Microsoft-Antispam-Message-Info: 
	nwo7aJGXiHYn+zMFRy9dZ5WzFTNjND1d45GAGfk2359LDQMm6gI+Cjzm/FGIsCPz2NYfBu37ZyHlK5ap2NLD9oYYn78NKRU2kxZy8sEcLqUer5XIJJwAHfa9yWB5e0E8iMCOXmWu2RuttIjUbR4BmEa4sEJ4vrTRe6vjHj5BNSg/Dp03NFjDOx8sLETys6S0y1BBP0fOmoTOex0hQO9ryqfgg2rswFe8RagdQt5l3GBsFmphLTK8Qath7OK9mL98EFWuyfvHRrI7sdQ19TQezz0r89oDk0yUMB3AYLzuMJIs9W0rJnMmaK+2fQCtyM0pOKbk8EuzBFUD171yHtvMLWtsQ1qw1C+8ZasuvWcN4HN/xHiLnbJFIBzA6ahucWZk/43/Xu5hERjhURz3OdC7/df0F2mb8b6Y5UtgPcITE9M1TsFBujigNMoHvWRytqnKliZBIzk0xtl1Pf0MLOZ0T58NhvGbRNQK+FCGUYI9NCJj+POn0khrOoUAgecuMIJbxn0Axo9HOlbJNIXjDKxp7dC5e5pjpCx1TSogu5Iw4N3HdM230oz8lkAphZghPzaIvmRupfqf6MJoWfANJFLpv6CieJBtdnA9EGAdg8cghDFcunDtuuSSQKnsqqhatm4+2YIbtQktuqKYvOznOgbMklJcnLLqYE/wBaHv2UqAab62cZGCRkbBQFMkg5EHInMtBYpX2XFyt6NQ1fde8lvU/Gyck/z/Ggvm2+hYBb8nYfYp1htDCpyCsOKa7/xNVwHtoSsiPj6d5HHXeFsWR43VXnWPbN7mi3Qa43SpmJtKBVpZGAJSz0nMKTBeYdyLVmSFMWKnorZ1bZBBkMfAlx5TXg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(34020700016)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	rOYn8imy5+EngGG7jm2nDlBWqQG+RHCqO4vZ8S6GsNq5MEpT0k3RxiehKoYR4ADcfI09+NzlonoCZE9tTvRdHNNNYCOhHAK349a0G/jkN7MzlAp2LDX44/RfaEBj3z92JVdegzqV5xq5IgKE62lci7Gejrvr+hIAoFwH+vNAb5k0UMt6l1MlVq8iK6Zzzf3QNoHt9XW5WbEOQzIdPwnUsPwS3224uGP/+OhKnlLP5/rs9YrVEIUIJlJgGdfjnEfAE4Udmy2yqw4UO/iYW5ujE6b0402Ap+1gygr5j551T9UCmYAsEgv1GuMdR3czRUJmhtDNJforZVno66aD56iZPvYUVi27gPZFG0jm813gKBDB3sWSFL1/efhB+shNLE98xfnHV2O5TxJAAeM7W50RF1fjlB2yW2UNrmZjJreg8nwaxvL45b32/LIXL7XmaYQe
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 20:54:55.3258
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fea3607c-4db2-4f16-32be-08de789df558
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF00012E63.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8106
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 02 Mar 2026 20:55:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17180

Add bbappend to enable OpenSSL in FFmpeg PACKAGECONFIG, allowing
FFmpeg to handle HTTPS URLs directly without requiring external
tools for secure video streaming.

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---
 meta-arago-distro/recipes-multimedia/ffmpeg/ffmpeg_%.bbappend | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 meta-arago-distro/recipes-multimedia/ffmpeg/ffmpeg_%.bb=
append

diff --git a/meta-arago-distro/recipes-multimedia/ffmpeg/ffmpeg_%.bbappend =
b/meta-arago-distro/recipes-multimedia/ffmpeg/ffmpeg_%.bbappend
new file mode 100644
index 00000000..28c0cf22
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/ffmpeg/ffmpeg_%.bbappend
@@ -0,0 +1,2 @@
+# Add OpenSSL support for HTTPS protocol
+PACKAGECONFIG:append =3D " openssl"
--=20
2.34.1


