Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 082B6ECD9B7
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 22:56:24 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.22])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33651.1770332174880820435
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Feb 2026 14:56:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=pDMhAC5l;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.56.22, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oY7LJds4ctf4ypNPgxEJfe/7oj8RURN6V1W3URZkX7vNgtnNo6IogS7kaT6AchZdyGDYJJFyvAfbtOA6jz/gd77doqHnpq2rBHNrv3RxXCjLItdb9S+nrR8af/Xd2SoamGc0kKqugTJNOvpAinhtf6qzq4pLKi9A+q4O++zA/JSZaRzqxcHSnVmqGKhEGWf8Df8u/P2brtvH4Zb3KKKKezLuRfQgT6zBVh2lO9ooiPr3PeqkPeYbWBkBiwe7BXnsTV60q/5E9Yw6ZikPSxg4kZFBQ21OUXFnKybwRSF7J1SlMm+ZgFawvLboi6WQr6C2g7vMA1KAnzBQYxSqL7mo8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pj+DaJqEK6mriwab+SmZQfBIW8M+zZJ1TFSPJ3D6ZBY=;
 b=mUqYW2rFDcotTUFy6XI7G6pS6/h9rMWOwsZi/WONrX8S3afMWtKgwsW/h3SSNBr/3KEhhvyIu7+X96GZ/peaklZM8tkeDmUjrltJnfqb7CTfxMgAuy8F+PanOHbzqKcxoZT04T+R3710UNt1ttIh8LlIDwd8DqTynN5Y8JHpD0AzUJm69kFmvRJI5iOo8xerdh0CbUx7zCuWaXfTjFWbcEe0gdJEHMsPP3HUSC4ETkLF28lQ/RHwssCKi+57WvVYPMerQ3XHRGGt7/s/5bPNKD2ixc3rNMxD055/ICBnQLQcExT0mE6mEq5/BbWNGuQfT8figlt8PORJq3f9uMKsOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pj+DaJqEK6mriwab+SmZQfBIW8M+zZJ1TFSPJ3D6ZBY=;
 b=pDMhAC5l/QV7EbGwDqFohpms3OWZYt0gl57SLDgULlg05+si61S6/cyNeJf1r1r8WyGmh43F8fwwvB2REvuf3014xVHvN4HH5LQ0MWmYxwDgA5mmVFXHFcLy44uCUY77IswfED97EuDHgeFQczNj7wqYT4EHlykoSV69utMDkI8=
Received: from MW4PR03CA0296.namprd03.prod.outlook.com (2603:10b6:303:b5::31)
 by IA3PR10MB7995.namprd10.prod.outlook.com (2603:10b6:208:50d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Thu, 5 Feb
 2026 22:56:10 +0000
Received: from CO1PEPF000044FD.namprd21.prod.outlook.com
 (2603:10b6:303:b5:cafe::94) by MW4PR03CA0296.outlook.office365.com
 (2603:10b6:303:b5::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.19 via Frontend Transport; Thu,
 5 Feb 2026 22:56:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF000044FD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.0 via Frontend Transport; Thu, 5 Feb 2026 22:56:08 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Feb
 2026 16:56:08 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Feb
 2026 16:56:07 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Feb 2026 16:56:07 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 615Mu7v4034061;
	Thu, 5 Feb 2026 16:56:07 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>, <jcormier@criticallink.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][oe-layersetup][PATCH 1/5] editorconfig: add a shared editor configuration
Date: Thu, 5 Feb 2026 16:55:25 -0600
Message-ID: <20260205225528.92769-3-rs@ti.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260205225528.92769-2-rs@ti.com>
References: <20260205225528.92769-2-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FD:EE_|IA3PR10MB7995:EE_
X-MS-Office365-Filtering-Correlation-Id: 42baec1a-f888-453c-3ad5-08de6509c039
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?S6vDIFJlyAEVUxd1TR6JDKzGt2okKVB6XXKmK9rLrYPsPFgjJcKxvzGKyS4+?=
 =?us-ascii?Q?7W6ZKqZy/6kVWXiIAzCMvZ+2lyI+f8rDDBGoaGUv3hzEBu6evawfogKPvA8E?=
 =?us-ascii?Q?7IEGwrmHqZ5KNdOXRbBmztAaJdrxjmjAj/XtWhk4dX9it6WmxKEUxuw1D1xZ?=
 =?us-ascii?Q?Z0RAgbhyYcuI7JH9lVmUqvDtCiBuyypV+Bc2obCYjUIubiTJZUgRMaUjegLO?=
 =?us-ascii?Q?GIswWKlC06aWxpyDKYJiIoap+BXXgcY0gT6vCveDeEnWVtSJnR5F1J7Kx8Tn?=
 =?us-ascii?Q?/E/yxLMXc/g1a4uqtL5rOOoOmqNcVr1GqZCeRolzOhSkHGauRdYgTqHj7hlF?=
 =?us-ascii?Q?X3ZhRyHkiBBQmf1744Rig2VqX59ksQYT+CGr06VbbaWw3eOPcBmHMz2TJoij?=
 =?us-ascii?Q?oWc6xmhgPFBpmK0Oxq8TRQp4/WCjBvitjArEr+6tCJuSn0AnYlfmXAKV83lX?=
 =?us-ascii?Q?A18PWKdmEjJa1bB8JGPY0Wx06dvsIoGAULeFzU0fTflqZ/WIHeiekfjwHf7k?=
 =?us-ascii?Q?eRfe6oKFy8lsuA510ZYSfxs3uS8hYDiUfNtZEtmSTOchamJr6l5YifCK70X1?=
 =?us-ascii?Q?6eM/1aiqSqm0xebYZIz96yDJYZcfk9BXv8SXNOtvUKvsSHKqirasxoczux5x?=
 =?us-ascii?Q?7hJ7ljy6nHx2QuNdH5JZKxiSN7I5BUWByIK8aeKM/BXD1ac/9zEcgxL6S/vt?=
 =?us-ascii?Q?mjKrth5/0XtjA0JVzWjLR3pi/i0VYjDDXXRvObrK21lAkHUlQg0taibHsN2/?=
 =?us-ascii?Q?ZFbZ1F8DMNblB0/APBIUmdS6UVkdwQTSG6i6G+2XT9rpI/rLvSgRskEt8ePX?=
 =?us-ascii?Q?3Vyw1L0c5UNUgSYmnQuQMoc6VWUBSMTWkiuALKvFSwkFEoSLghQK6mT4H/+m?=
 =?us-ascii?Q?kLd5NBBPqXvZqGosr2dY9CFcVFatQyQXmXr1M7znRRQqtpOedNBZqg+fAX/I?=
 =?us-ascii?Q?5ezakMoqYUs41es2trewUSEPSGxfyyII2mMIAwoKvE3hjpfRNhH37uDO5JW7?=
 =?us-ascii?Q?WM2yHUj8Gj7D3Atf82S9VdXERhNAvrmlr2EMCnL9BxciRjl4iFIJvUroG1SM?=
 =?us-ascii?Q?+tFJIjHo4iLPHNPOvjfyI0V5chr7SLFbguqywuzhgKJdOUnVbZvM4w2fYuxE?=
 =?us-ascii?Q?mqmv1rdPwWd4u7haNry5J/dOrPA6UwnkzPRQakBIQ2I8inj0kPdA9iEzKmsf?=
 =?us-ascii?Q?9VL0TCaC7NZZMD/w/xMfEcvtoVn/UAoz7G24XObMzoH3HALClk5fPvOIsX0Q?=
 =?us-ascii?Q?Cvvl/rB8+itKaZ0tgwR/9lgLskdJ4EGyXpY6s3TFrLIE3lnKJEM5Xs5I1shs?=
 =?us-ascii?Q?gjvV7vHRVf2IEpjvVySk2pGOyuzs7aR62x/2nsr5bym5C9vcXrvjjjz0YeEB?=
 =?us-ascii?Q?Fwc/hSQsG/M5/iQQAjPC4rQwW3slYOSgb/5n5ShLNbjiS9NwqKaZqC2uJIET?=
 =?us-ascii?Q?qghmAed8Oc39llbl6FxnTqfdZY3F/SpvVZ70Y8h9/TJDfDOVBlhD9c9Jdd1i?=
 =?us-ascii?Q?G9Y8ToymnwVObiBzbeWJ1y1LQN5bJmeNOBCQjxB5ktWisJOT0m0rqEnPl1p3?=
 =?us-ascii?Q?FOtVHX55iXbHVfBUbJY=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	0FHpU4dRh8OtZgE7AWXp/TYyUE+BC37PBRgRRRopgT1Xb6yAE+caw7jti07y+BWgiKzcN62+ECo8BUGbHDMCd8bjBdsYDLTxDJS2r+Fx4gk1WnbduzFNLPFsMXpBm+eCMEioqCYFRbvjqGLqJGnvd7UViBcEZrRAcwOLUJmEZLKRVX1Ojfu+Z2C0gqAux4E1e8NCgkvJrL8KKsXhTXEFFQ6o18Ef4wB5GPqsBoX23b3tP9sDZ7rwwtUkNPpPeOO0XXqGnR21IS/fd7z7b6Okvo+nebXZ5Ee/Vabx7d6gYseAqWwEt53ADgW0GEFR+/h9HZ4QLxqzy0frPVm7q/0IlRxLNolTFzvayz1V6/iyFjHvBauAIxxNxjzOrmO1CLUz8LIM6UMIeEvrPSVF+lUA9OjJtX/xdJGRI6UKmqTdDjS/EoAbDV1DyyOxxY9/2Oiv
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 22:56:08.6031
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42baec1a-f888-453c-3ad5-08de6509c039
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000044FD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB7995
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 Feb 2026 22:56:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17089

From: Randolph Sapp <rs@ti.com>

Add an editorconfig to keep track of the various file types and their
current whitespace patterns, even some of them may break traditional
conventions.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .editorconfig | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 .editorconfig

diff --git a/.editorconfig b/.editorconfig
new file mode 100644
index 0000000..30740e7
--- /dev/null
+++ b/.editorconfig
@@ -0,0 +1,15 @@
+# Shared editor configuration <https://editorconfig.org>
+
+root =3D true
+
+[*]
+insert_final_newline =3D true
+trim_trailing_whitespace =3D true
+
+[*.{sh,pl,xml}]
+indent_size =3D 4
+indent_style =3D space
+
+[*.{yml,json,xslt}]
+indent_size =3D 2
+indent_style =3D space
--=20
2.52.0


