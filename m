Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5C54EC1136
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 20:37:34 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.8])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4573.1771879051118396130
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 23 Feb 2026 12:37:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=q5WO9MYb;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.200.8, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oZ52aDZHOIVXhGeaRiuwjlmnqKpk5Cz1yBVZ/CaDUl+HRYBiiH++tpu/DJ+SWdYt6q45JF+gMWi1pFAZ4CumKYIKUvCCX+sM8Zk0pElaYKoKaXX97vA05oJU7oa5R6NSC3Myqegt89psxUAzF+qNPYTFB9uj7KQHqXPmByoLrbHSLSQqIxhA6kH7ic+eF9rDI9mLqKjDcZNDGzGVwj+y/2rMSepGYAzp8ItJLEt3lgFvpN1vs3uUjvop9oEMmpNFA5EW20gVDexbgyRcECx9nVLN1y9VwreDRgRoUuLt7F9shjOTut6j0YpxrEEL0+Nmfrob5qk6eF3U5n2ylWwG/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W2lp/OqNgIvH9fU5iaZr8ZU4sNenHQwRHMRyMKC0+to=;
 b=U2Q9HNKz7dU+iZUCSoWZmT1rhkzDS2ka1stkOGZ0s8L01SsyZIIRYN9i6bu8n0434H9qo5NN47ZXvHOJ1s2jsMpKy5MC9hwvZM7XYFXhrwpw1EB5zZNVER3hSAhLdKYHxv9ZB3EjbIiLuPIkrCU/1ZjPMwtCOg4ZyE95ut+KsovLwoAz/YkCrVINtVu9tz64KdDbC0OQniLaP5IZU5fkE0x4JSXTPTRNHNi8VM9H6GpbNR0xNhueFcZvK4T4T76FymB3X46JH56I9wpFz/l53uNykoyuEdAxjV9MPBNMYNDoh0m+0tMewXqg0Mhwk8gBQglnFMEGMvLk6DJb4ajm5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W2lp/OqNgIvH9fU5iaZr8ZU4sNenHQwRHMRyMKC0+to=;
 b=q5WO9MYbc8eWBlBfzGUXYmUtOcLpMUbfUDgh+ksUtmiCFzvd2Bgp27mZJ+vMjF0yYGAW/ox2t0B/+HznxhZxz9kEp64O2099xBBek/uIfTrJaHGNXQq+U+n//JTN/jezCv7V+i0oGXd7GczGWIYZSJVDujCyEARYFHN+SrWhK8g=
Received: from PH7PR10CA0011.namprd10.prod.outlook.com (2603:10b6:510:23d::12)
 by PH0PR10MB997691.namprd10.prod.outlook.com (2603:10b6:510:382::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 20:37:28 +0000
Received: from CY4PEPF0000FCC0.namprd03.prod.outlook.com
 (2603:10b6:510:23d:cafe::b6) by PH7PR10CA0011.outlook.office365.com
 (2603:10b6:510:23d::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 20:37:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000FCC0.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 20:37:27 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 14:37:27 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 14:37:26 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Feb 2026 14:37:26 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61NKbQbm980462;
	Mon, 23 Feb 2026 14:37:26 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][PATCH 2/3] kas: use repo-relative addressing
Date: Mon, 23 Feb 2026 14:37:18 -0600
Message-ID: <20260223203719.3644542-2-rs@ti.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260223203719.3644542-1-rs@ti.com>
References: <20260223203719.3644542-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC0:EE_|PH0PR10MB997691:EE_
X-MS-Office365-Filtering-Correlation-Id: d0bf9819-8745-4b5c-3bef-08de731b5bd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?4E0cuNLrtK59077CnEFfBlcZntJqqHqC6ONfnqe9Bln7287lO6HuRPqcWI7w?=
 =?us-ascii?Q?ObXJzaWdyOo8pJLurXLkpI1PGRJjgTkWR+yMXZefqUGT+uIY9GYQ1cT+iTFJ?=
 =?us-ascii?Q?bHTurfat9fBoLIECAPlfAcyK960WZVpNSyx1IGI9QQZJEWXib89xIhgqIMDv?=
 =?us-ascii?Q?cwSgS+/xJZiunbud1WnimOj0nlcQ4fFMQ0+fQwF2E4EYFGOI3RgybKSWs8v8?=
 =?us-ascii?Q?c+OVjhREBzRW7t1SKfAJorUF1ngG8E5jjOAmMpJjtq1DqnF+aJsvQYQAEF7A?=
 =?us-ascii?Q?eZ11o/AGUp2AVQSg5KaIaryQ0srkE1brg9YhH+N0CiCY9h0I3ht7O7jjuxf4?=
 =?us-ascii?Q?K8W5lYWIdAEEz9IE/2F6l9rxiLEHF6RrqgpRoQTlyGeGhg68sp4M2xAL4VQi?=
 =?us-ascii?Q?3AuZspVWL6amkGje3qlvkG0GZgtwoQMzjDFgLdwwXyaHpMi4sY3KwLhh5IV4?=
 =?us-ascii?Q?0FKQLk3K1DGVhVPonHehImj7LLuyr/PAoDHcSZg3nJFWLRQxVANUOUD2Z9F4?=
 =?us-ascii?Q?z6O53IBEU6nJ+lSf5FDOHU6rNygmZ+L9SOFr9qHXswKPw2xynU63USb4DpuV?=
 =?us-ascii?Q?PGqsvLh612njsSr16usBsvam078Mfu6uJ46TIfVjGmO1hhuVXtdJuiZaXGMU?=
 =?us-ascii?Q?4YIZg98Zi2QInXGDr1YgRPU8oDdPJlqhOJTYjT5GJDvGlMmTaOrDr3XGaIC2?=
 =?us-ascii?Q?LsteAS2SdHJX9tMdiBrO7WrdazY7tM1R71aL36i60jCx3z9eQx4HlCZMyxrf?=
 =?us-ascii?Q?MS9dQSAzV7s2ByKycSiNPszcSxqIyl0G47aAvkmH06eWIeOU8m4BWAOg9SDv?=
 =?us-ascii?Q?LsExU4jzhcQHDORRMt0xG2vVB85LlcakiKMguWJcJ0nGYWV5k+9sxLY+psgP?=
 =?us-ascii?Q?maJxB+uJ1HqJP7FYQ5JZSl1bsvLq32qBOGBdKUEvbfvH32nKqnUbynwxC7m/?=
 =?us-ascii?Q?demAOoujqH8yRrzGGZ4dskisOasr+jaOyybeRt4lX6eK83o0jhBzju/4zqY+?=
 =?us-ascii?Q?hWuPq+BT+1rveVvutxK3EuFaRln6G3oF6+CZJjCDDzAgwx+1cpbLXTyKfo8F?=
 =?us-ascii?Q?APf6AGBcjtbEsh9nLL9Tz57EEf0p66FVS3V/jfHFq0A7+VRfaoGIu9t3LytL?=
 =?us-ascii?Q?TlriqlHCMMzgJU6dqDNSNYl7JRW7QYHuPIg/Ll6nUmKvJht+ol1PJflyYkmu?=
 =?us-ascii?Q?vnnbIm5lrwAQemWaT6U9LD0v8MLK3jgtB5C8RpdJZYHc2F3Y5xQREvqYkc4Y?=
 =?us-ascii?Q?mMe8QxLWtdF41NQMf4y8gYMZC2KTWTYwKEpl9FQIC2yuhYRKVt5DPQDd18qt?=
 =?us-ascii?Q?MAHK2n92zxLldSGKa2cGvu0D6kQOxyJKJCSjCA3lIAZ2vffcSOUPlJ2LlNjG?=
 =?us-ascii?Q?z/eCT0fNODNu9cKSIZLXLsUgoZnKK0ovxKAzGqJH0rbhQxRqzyZc5B25AcBR?=
 =?us-ascii?Q?0CmOpAnoGUwFyVf33j8wI8oiRC8Z7lyZVjssdcC2Vyd8UvafOvL1lUWnXAMB?=
 =?us-ascii?Q?kbyNQ+T3Z1UcxnirZKOGOmFf+X1PzD+HqPAbvDkh/tBaEvqgbC8CUVCCq1nS?=
 =?us-ascii?Q?CzG6/bT/OJQkyCKn6qh/P5SSOkCucHT5C/Za7/MEjn78M55+8sfxQNi8vcXz?=
 =?us-ascii?Q?/bwhEM8Nf62NUdtKDcoWhirAyT8rNai8SIuKbvYOT8RcxK2H1QI+vzPPoc8F?=
 =?us-ascii?Q?HgaJfA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	E3l1eFJrc554m5ooMbeWRL7qUgfLFMohBRbqa2EA4VXWeCHO/YDMvBfTJXQU+/v/+XXdvpMs04DCt5/CaWq1Fc686DsphydBM7W6Qb+JzbWJ4iMjoAGxEr0PFfNrx/NCZ9dwsSZWdx1CwDkwQUGKox6ubk42EwNj2INTdVmuzCd0xlfJnuczVIj4ZDJoOUfG017CFFBz3SkkDzJF+8EOmqlPKWshxDv5yT+nOaGPAWVwh3GLkPZB5rxHJlcb4bsW+RnBNv3CGCezGdehw1oC+sPUAjuDej3tKFlU8XCbUkU7x40GEhy/EKUGV7XkQEcaxegGCIjzyYidp86XdGx02Ht6TZQEhsn3I4Dxhd+PIywWk6cDQShMaaf0h68hXHgoXj9ZjMGz9fKJlTcN1OtHjLUdz8bc6s9XnYYBpLforASjuV7uIUSOvwI7kaNq9TAu
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 20:37:27.4271
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0bf9819-8745-4b5c-3bef-08de731b5bd9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000FCC0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB997691
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 23 Feb 2026 20:37:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17131

From: Randolph Sapp <rs@ti.com>

Kas has a new warning when using file-relative addressing. They are now
pushing people to use repo-relative addressing for include paths.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 src/Makefile | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/src/Makefile b/src/Makefile
index 069ef03..60e08e8 100644
--- a/src/Makefile
+++ b/src/Makefile
@@ -90,9 +90,7 @@ define xslt_kas_templates =3D
 endef
=20
 ../kas/%.yml: xslt/kas.xslt configs/%.xml
-	@loTemplatePrefix1=3D`realpath --relative-to configs/$*.xml .`; \
-	loTemplatePrefix2=3D`dirname $${loTemplatePrefix1}`; \
-	loTemplatePrefix=3D`dirname $${loTemplatePrefix2}`; \
+	@loTemplatePrefix=3D"kas"; \
 	$(xslt_kas)
=20
 ../kas/templates/%.yml: xslt/kas-templates.xslt templates/%.xml
--=20
2.53.0


