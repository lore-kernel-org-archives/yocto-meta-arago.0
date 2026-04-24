Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA876FF885A
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 22:35:53 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1358.1777070149969865306
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 24 Apr 2026 15:35:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=DyR/IWxm;
 spf=pass (domain: list.ti.com, ip: 52.101.46.4, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fTcz3AlP+J5+m21ZSY07ZNnH6VAzU/rqU12HaiHxtmEdftWHmPuYB9aUsk07o8e7YK3swTmgae9SGVjHlCrnwRdiEU5IHv0X+dlGwixCRK5i5NgeyvPae5CKEAUOcEhSXJCSq8nBYxDzj7zjoOXOgFAj7Fb+uOhAO2K5Bd9cExw+gfrbixPAYIBMmXmC3TypK/6A9uL+ekmGTUctXmLKdR9JCJwuMyXIuig/pT4zguQeIvHJp0DlLxOPchSSqr0snobq9ogY2hITEjtxuBYe3TXIhj2mvMPY/SYijU5FIdFq57wcLf4jYqAvdKBduCXqI9FE06+X1Q3TbVGGxy/Qcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PDwwvIbemAnvqqhOnH+RhC1HNajQ3icGrI/TYEYMnrw=;
 b=dh6go5OLta6XG4JkgjK8fMzCNkB5zqNhgGwKGYvgaL4CE7DTow7WVzgTBkjdiWklSzGoUpBnrgtdSeWxHYT26UcMwnqkDnFY3726kcZta7DM2RU/FV7mse4tGoFD+pHODxkxBNIfIuDNF1TQQlBvR+Vjb9T2A19FTZVg9lCvL+3PhbuLMYikZijUXajpvGgLF7c5u0ZwytR+vhNii2A+ZBaRqyHw+JsKKdPlpDNblkKXygGcyV02F/p8qz5Wb4Am33c/MvBmCM+hJwuc/nLnHmCsM2cecK4oGmbCBEXp3xWTxr0BTlQCUPdYwj3uwceTc+73KM+PaYJKBqCZgkm4cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PDwwvIbemAnvqqhOnH+RhC1HNajQ3icGrI/TYEYMnrw=;
 b=DyR/IWxmCKH9iVCPwvKgsvm0f0Cl2O/53MUdA8Pr4odr4J5PRL3SpAarrORCpYrbPkGjmfrA9yImsovOp/YUUVTCTDmgda2OqV/aYGSMvvLeNseMR/FN0DUJqgktasGjutorT2t7TBCB/K4ryWlyOlYwhgLeaWTW9QFixzRG7Wbef3H1CguIiA9NLQCkJa+aHryddOzcJWSijckk9dyZVNlQaqfpJrZF89gR4fEGPGQHpjViL+qyFXIC6ebct4me8GU0/FKr+YFmc2d3o4rwsn+uZaTG9aqPmw+eyFiNWXBP6/FJn3xKsD7/zQrTSqGwc7YME3usjsHuO60VnPddqw==
Received: from SA1P222CA0095.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:35e::26)
 by PH8PR10MB997929.namprd10.prod.outlook.com (2603:10b6:510:3d6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 22:35:47 +0000
Received: from SN1PEPF00036F3F.namprd05.prod.outlook.com
 (2603:10b6:806:35e:cafe::7) by SA1P222CA0095.outlook.office365.com
 (2603:10b6:806:35e::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.22 via Frontend Transport; Fri,
 24 Apr 2026 22:35:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SN1PEPF00036F3F.mail.protection.outlook.com (10.167.248.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Fri, 24 Apr 2026 22:35:46 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 24 Apr
 2026 17:35:45 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 24 Apr
 2026 17:35:45 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 24 Apr 2026 17:35:45 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63OMZjMC2740752;
	Fri, 24 Apr 2026 17:35:45 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 4EA0B2A58; Fri, 24 Apr 2026 17:35:45 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: <rs@ti.com>
CC: <reatmon@ti.com>, <denis@denix.org>, <s-sadik@ti.com>,
	<meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] qtbase: remove serial event 0 handling
Date: Fri, 24 Apr 2026 17:35:45 -0500
Message-ID: <20260424223545.2795842-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260424213220.2378279-1-rs@ti.com>
References: <20260424213220.2378279-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3F:EE_|PH8PR10MB997929:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ec109b6-e49e-4cff-8028-08dea251d3ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	OJYc5aXdn/dfN9cGNJpHoQduNHlqW4REj4RPnqf2f1mswLEY5R0mWhbLewwuERaSwti2JTOaVDJ2CO7dBgJAFSSkL8S6uihosQMPnuRu2ed/y33rnppaZvrgtiHOnESWy6xDzpAP0DiAkHiVDnWplfod7KQC9aASSRLyC+QecheneNt3eRG2N99+ZySTleNim0pT9N0ZW/m/iXVK2n40tpCFk+vwGRr3ukS36HFrEtybrLqNo+NmAOU22lMIXmcq32TeZCXV3jygQPjiEUL5U7n31LAi35DoZjY+JWbCCIP2ACHrx2KhCvmU0aE5zWkR+KWqQFwPTqmxk9AU805reDzLkGS7CR6dr9WXjTXYUrxfAzzhKHGeABUm6MhMLmi/j6mWbJBIeTr88ISKlo9j34dkXS9IO3XniDFqbaPsCQWOQ7HcDQnclnQj3okcA4zjHR1n7urKtGnEi2+2mfvWshKj7//tjhR+Xcdac+E/3HmoVldIX6FpamWKAvNxcCW02WPlSJieXlUuhlGp6JZTaw9VCtf46ynJWYDXH0STq5B+f1MiLwUztuzA8GgYW3YDQVDdELQRKPFt707RXGN1FTWggReCGSG5fLaG8cNgYzR7FaJL0NUmfcH6rifsITozcg8mVtcK79LCShKSFZCk1ZhelKrDzLLlvlQBb32g1mdwCprJ/IX+h2ImBUURw0AozyauUe9A5jvSX9L35Ml9m8aYmyRT3OgSXYoBWtOOzMQ=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	f6BDz/I8/lPJBYKCMow0ot1y8N3KKNotfdJiooiOfZFSRUyXzZg7VWXVvUCv2qiietq+Xp1Y0l+eYhAxsCLW3MLAl6MUtGnfQTEAPgcfV19bogdU48On3eUtlQh5kijsl4j2BJ5aQuqCl23dUvtrqw+qBkAhHf21vB2NiHhq4HddjOX2fN1LwzA4ijFu3nBhHh9/ou03rnH3IlL1Cb7MsNpb1NN2shp5gQMPBuPwGWDK28m9IgamfkpS0aiF3ra3dcC5zeAHvAMQ8wQptAGBamWNVJCRSoB5uhO3pJ3uJWfA18Rxkr8laHGgt0YVbILfjDsaIQw6MqjUJVQaGNtdiTTU3LKIzsT23wGwEWJgdDNf/tN/ZLjSd0xZxY5Vk725FPLokayFKTPV3jFohjjUMhog4Vfiu28xQ6NAXtfLN5QOIQ7LRFjziaaWbrxf5K04
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 22:35:46.4264
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ec109b6-e49e-4cff-8028-08dea251d3ef
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF00036F3F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB997929
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 24 Apr 2026 22:35:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17488

meta-arago / na / 20260424213220.2378279-1-rs

PRC Results: FAIL

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
All patches passed



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][master][PATCH] qtbase: remove serial event 0 h=
andling
- Submitter: From: <rs@ti.com>
From: Randolph Sapp <rs@ti.com>
+From: Randolph Sapp <rs@ti.com>
- Date: Date: Fri, 24 Apr 2026 16:32:20 -0500
+Date: Fri, 24 Apr 2026 15:14:26 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 600359b9bf611e9671aeef00d4f6a973f=
22d802f

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Pratham Deshmukh <p-deshmukh@ti.com>
- Commit Subject: tensorflow-lite: Fix file packaging for headers and symli=
nks
- Commit SHA: 480b57f06af61bc5ba01af73fc6d94463124e318

Patches
----------------------------------------
All patches applied



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-repo: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
FAIL
    WARN: You might need a " " as the first character for the :append. (APP=
END-2)
        meta-arago-extras/dynamic-layers/qt6-layer/recipes-qt/qt6/qtbase-ar=
ago.inc:3
            SRC_URI:append =3D "file://0001-qwaylandinputdevice.cpp-remove-=
serial-0-handling.patch"
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887




