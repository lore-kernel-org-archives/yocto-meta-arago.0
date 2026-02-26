Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3612FCE07B
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 13:29:40 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.35])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69769.1772112573410576592
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 26 Feb 2026 05:29:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=P03qujkf;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.201.35, mailfrom: p-bhagat@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TUwuoLxAyBP36aNpXhEXcOoTuPfRasHjpJ08MxejLTlkIdacB4Zd4Ps6nV8Prn/mAqaXiW11mUxMKx7zEvSNYUUaH4kLmMJiUtiJecirLtlvAa/jUfS3inEf6+T/wENKpkrr+03Nlno+ABx9FXz9VWnK1oLRo93lIccFY5vPvSo7Y1EiQ+Pb4/vafGHfXHch6BonfXu/enmmjWruIKMGj+IhGO3FisEES6l3QyemqP4xyJnUvqnmP4q/HoPbSI/goro/0l0i1tywh0tOGEDO631eTfpVxsW2wJQDbiqKQi0Cb5qI3Q92GLulVSz+wXRgRLfMLAE7TGR47BZ4YHbgjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bZQwxT/djt2SHYiW3xpsDFYrG/M6kdFXqQP5dYPqkhE=;
 b=gSpINWKrkkr92HRu0MlBpNn01JyQrHBg2pB+6EsUdG9flOzbjrWGBqyz/jPjOCwU3CbcrHouvIth3pKXEG0l0E7vbpcSIngLNyFhEYbEUm7GcZBaoOfWd3WUccjd7kS3yrd75T3LgrU2cL5s2KOLQGhy/F1FJMTFn9Ps0Cp/Th/sOZkGqIP7ohNPnRxnY6lbXkN2Y8egqP4IMIz7PpuCcIvzXqDJn19F4rM1X8V9h72KyCDRGtQgwI7jYNSsA2TbHaB+Pjrvtm2+2daRajvMfu9UpILKR6A0aPPlRqBPcfKAWuIG9tUcBAkNs8gKiEm5kqW41vppugwxErwOrK1fgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZQwxT/djt2SHYiW3xpsDFYrG/M6kdFXqQP5dYPqkhE=;
 b=P03qujkfMMPnEqxYWQgoRRiyUxXHzah/13Br0csK5qdSAJXF1BWuD91CpRWk+EkSu8Ga60nuJZRgIjQMHTouzFdyJDsbEiZ9LqUB6iogyTNEBe/fvrdheXXg5aQXpnS0KaYbtdRls4eEnPLeE1bODhKzDxafzBknNx6XXCkgn1Q=
Received: from CH2PR05CA0029.namprd05.prod.outlook.com (2603:10b6:610::42) by
 LV3PR10MB7746.namprd10.prod.outlook.com (2603:10b6:408:1bb::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.22; Thu, 26 Feb 2026 13:29:29 +0000
Received: from CH1PEPF0000A347.namprd04.prod.outlook.com
 (2603:10b6:610:0:cafe::bc) by CH2PR05CA0029.outlook.office365.com
 (2603:10b6:610::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.15 via Frontend Transport; Thu,
 26 Feb 2026 13:29:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000A347.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 13:29:29 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 07:29:29 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 07:29:28 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Feb 2026 07:29:28 -0600
Received: from localhost (ula0502350.dhcp.ti.com [172.24.233.249])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61QDTR8G2425227;
	Thu, 26 Feb 2026 07:29:28 -0600
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <v-singh1@ti.com>
Subject: [master][PATCH] conf: am62dxx-evm: Package k3-am62a7-sk-e3-max-opp overlay
Date: Thu, 26 Feb 2026 18:59:25 +0530
Message-ID: <20260226132925.537059-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A347:EE_|LV3PR10MB7746:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ac41103-5eff-48f0-4984-08de753b11eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|34020700016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	WwoncJldZd69Iflz5IL0NGWw2YFYDPdhrrjrBykAgOK9BO40+IOErexzkwV73Cr+UdPTEjr33PKZzIOV6llger6IUHS/xFGTLBBILbDjFBfRV9Oqhb1UK8Ar8jpBqtPGTH0BN+ebJC2V0c49n2L5cuv/LKuD8QDnV++9HAGwCjHyS5IIAT9bPqjjQP7A+Wp6rMXjWBlSURdVPR0s09cZsjYahPYQmNjKfaJl6yW6QyZE+gK21fwpN66p4gQWPoit5qr27VEaVfnfJ6EXUxbGwO8peWzlo05WgvKtNlcimtH10DdARcDsfWVeFcJUiYvkOUf10zlPeUJR1QyP28krL5k///Y8tMgnzWkcqY/L1WVOKq1to/VJC3RUQhrS0nf/Qc3b0InRjAKZ/7dVd4WKVMEzHGmbmwsYSv3m9yX7lBK0FFmgtlrZZV5xX+qYmcLCWrpZJD6b0UFFWeJYwCYvvOwVgwOHEiYaAX4+SbPywDvulQD9/9HkEmvFMKw4u4tBjA20qL0WdgMcBkXFAKqARPwqpT/49u4+rbMgTY2XR4rFbdr0nUnSlyCRzW3iMO0yonDi/s9bw0bkuDLwHsb9PGgzS/kStmwiPxgoj2pc6vuaxLlW0WPOv3KVxJJLaAn+qEohUhdOBF9CTbKhr4DdMBK+n8hQ1U3/p/gVw44V+TBEbcnoITp04QuJC4YB5qWI+HL3pUQGXlaJHq/xldHXlnSFEUTSF5ND25lyURwATdIIzaUFZkQZYMFqF2T89zJOnu8iJ5lumYFq03oWqogKuXh1mFvj7jF4wdR6mOz6LRCz/duLES5d/qWFDWcCrWWXa+JwX/+7dgJC1IOF4d3FLg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(34020700016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	KUyHv2j7RdF64wFpYnBQrVg7nYST3MCyMd+mamYZ8y2mrn+f1Lcqgt4b3yew2WL6gr9D9/tsFX7SX+wD7CjHHjYZpEVIoZnAL7/rEZOMIsrftQ2g0Kl3E1H7JbYHmxjh4FPjzMemEz/rMBzECqh5w2ZnqEN9NL4tw5gJyHt7oZBhHm9wk9lpOCWuSK5uj7kisfIocNdm3sQGEHjy5WgKYI8uncAC7MbW+MfIlzXcVKIuo3zkEorneahSzhQOSuirTULzj8Lh/ldLgNaLACb2IVdNdaDJ9aidnOYOA6sZVftv4Dz7KTcY/F0b137TqvY4DD3Wo0FnjcuQtx4AerLWNinapba1tJMjf9ovejoLMWUY44D7YscY62bDgSpGeqMuD3FEwKGnxuVD1eM3Gwpyzz4Fk6UV1I766DXWVe1nsw3Y+JXgtB1DqcbtWT7BF+ec
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 13:29:29.6363
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ac41103-5eff-48f0-4984-08de753b11eb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000A347.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7746
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 26 Feb 2026 13:29:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17155

Package k3-am62a7-sk-e3-max-opp.dtbo for AM62D2-EVM to configure C7x DSP
to run at its maximum supported frequency of 1GHz.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 meta-ti-bsp/conf/machine/am62dxx-evm.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ti-bsp/conf/machine/am62dxx-evm.conf b/meta-ti-bsp/conf/m=
achine/am62dxx-evm.conf
index d19d4790..ef9df2f7 100644
--- a/meta-ti-bsp/conf/machine/am62dxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62dxx-evm.conf
@@ -9,6 +9,7 @@ KERNEL_DEVICETREE_PREFIX =3D " \
     ti/k3-am62a7-sk-edgeai \
     ti/k3-am62x-sk \
     ti/k3-am62a7-sk-rpi-hdr-ehrpwm \
+    ti/k3-am62a7-sk-e3-max-opp \
 "
=20
 KERNEL_DEVICETREE =3D ""
--=20
2.34.1


