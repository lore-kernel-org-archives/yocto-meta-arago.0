Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1551C109C02F
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 14:55:38 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.20])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24232.1774450528680329033
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 25 Mar 2026 07:55:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=OXf4VeD9;
 spf=pass (domain: list.ti.com, ip: 52.101.56.20, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hqs2FajthUxVx1ghB/59Ll2A8cbuTwUEhaMFbPHiIrxWILxE1yXIl2oHYpMJZT36BroYaR4sOT0PP6nI3l3MPAOYZKVXxdyPOF/pfllutxWGveMQFx9L+LqPvU5CAWLu0FKRMip5tH8sTMngyt48E94eb2H7WK4h0AktH736YubkWfW8KQKV7KEfuKTJPOJEVqy9DWJTbErew1Jz9cesfnH9fyDMAVCcp48ajw+ijmbBOffvaMzRjKkoXCTJCGxz5j2osWWYif9yL0oJKkwKsg5BH3VcatxgwprODdWNDbyfFbj4m7KAywMZIDZKPyLoSQ57QsqxNI7klfjXzsgDaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c4Bq3Tk9iI2+fRgGcgdaEGIgUKaQg1RHpTNXfg5fuSQ=;
 b=EMAZuYZIwqJey7DF5ZCbPJuoXulLT7yE+kWYai9rbV0qThMqnZWeSZrETLbtEKgM3+XXwiD72oTUoPeiZ0HAf6l6CXQXNqCWCKF9OcstVV+QmxrtDOwdLtz2VpAqc6pCAdM+gE6ACwbpTJYFxC3eb5KrL+rMyh+veYFH4Pkd5xO/pUGmQYkqCwovyPxSAMIcOL3FBIOtXwJgNCor5TN6m0CW+2Qjh7uPTOo05s3M1csbKZl/+cPJ8JgKWN7xgZqOoD6bv1dHawkNxLKkrK2r0nOlX07JstN1bKH+VOBY6dyURCVWBvpvRbTZVCE5F18ycGErPlMhQpZLhfoPJeJ8Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c4Bq3Tk9iI2+fRgGcgdaEGIgUKaQg1RHpTNXfg5fuSQ=;
 b=OXf4VeD9YcXDgDkvWGkTDiBc6Y+BqMNtyt4DC57WFUVaSFNGzU1ajqAi2eemgAg14/T3NBe8bajwA+0kv38xGi7WxlNmgahvyOWiHLsI4xYVffPHr9hqR9cZ2LmW527V2pv52kdQjWFjcb40ltzloYPds1lQ9fa0bt+ZAbX9Yb4CCivlTAC3GIxvGdSwgwOBZ6JkP+iBCGKCRlytMC4QCcCc5QjEQ1us25nQxHE8zU6plJASJ0yhFD4DAGEW0xQPUB7mpLosB2QRFW4p1XCwYoctzXxZ+xSc48hzs8jcaQYl+iENXKBZaWb3V2+AWY0dshQKxl+vhhNe4eiP8KoJ5g==
Received: from SJ0PR03CA0148.namprd03.prod.outlook.com (2603:10b6:a03:33c::33)
 by IA3PR10MB8757.namprd10.prod.outlook.com (2603:10b6:208:57a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Wed, 25 Mar
 2026 14:55:26 +0000
Received: from SJ1PEPF00001CE7.namprd03.prod.outlook.com
 (2603:10b6:a03:33c:cafe::59) by SJ0PR03CA0148.outlook.office365.com
 (2603:10b6:a03:33c::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Wed,
 25 Mar 2026 14:55:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00001CE7.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 25 Mar 2026 14:55:25 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 09:55:24 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 09:55:24 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 25 Mar 2026 09:55:24 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62PEtO9W475819;
	Wed, 25 Mar 2026 09:55:24 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 374AF9ACF4; Wed, 25 Mar 2026 09:55:24 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Pratham Deshmukh <p-deshmukh@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <afd@ti.com>, <c-shilwant@ti.com>,
	<denys@ti.com>, <v-singh1@ti.com>, <khasim@ti.com>
Subject: Re: [meta-arago][master][PATCH  0/3] ARMv7 support across ML frameworks
Date: Wed, 25 Mar 2026 09:55:24 -0500
Message-ID: <20260325145524.1355808-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260325145050.1053445-1-p-deshmukh@ti.com>
References: <20260325145050.1053445-1-p-deshmukh@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE7:EE_|IA3PR10MB8757:EE_
X-MS-Office365-Filtering-Correlation-Id: cde9ed0a-6546-4419-7ca8-08de8a7e8c32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	tT7OGSChcCoalaLUYzZo0xtrR1+ufMH77M5W+poD63ZQ32buUTOom0Ty1v8BCB39doXDYtmsa2rfDQqXIkgPGXjXg301JssOpoNc8nlgNU3gGRnlw0EOfmBLkOsI8y/4//DHdhlMDDPi8hUhqSsr4LG6GRmq8PNkt3aNU6UryhMKBqRSEfMgNLsYG9RSvx7Eh4XXOsnrLdFCP1tI4ycknHrROI+Xlls6PuhPMj0KtrnDwsvaHBppIDoWAMWVNOOjgMWDLBvuRNFVg21STy4r3UdJsHER7V6yJ3pOHLkTCFWrjW9qREUu/Ma1/eWiXwVOzyG1dD4I5lSZQaXca+NvCIUwzCct8W7TWMMBVwp0P5gZz+W9qozP4FjascEwbezUQ9L13X1OSDwBkDX6YS0YyZ01y0qMf9c6kPain4uVVJ6AHuUKUHYSppV0OicJCu+tnCpzZJH39BiH3zwS61kL8j9uU9W92y3Lch8mKFCJFjrlJYRWA3BD6y8BZceTObKANRdALP9SytAfDKuiTxxEdgX6PeF7mFXZ1/o/4UQeyVzUH0c6JP3NkeYWFydUymo+225GZC2EPKYCsDOvJkegvZlQQh+7ydwQPPYJUHRUXKeUQ2UUTqENAGr9Iyxc1HP9lPFEdS2MMTD0utRbEL0pQ/jbafpqA5bscX2NY/utXCKyONaHmNgl0YX4TgrEQoSi9/ATjrYbsSKxn13NTP/QXNglJoeK/4NY/sDRfhZYNTkOxfxUeu0uZvDou6CwIpUti2karrYRT0OebUHon2OsMg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	70oP7XUPWZ4zib4QyQH5F74c0DF6+cQrmCvKsVCKLvB9fq01v63DhvmSqH8DFYMslxAeIR2vvdiaQTV+bYvIBlLS2o9XhFph9w0Oz0Yb1fCvjhKmp2Y4AoEPyPT5Gan0b9NSE0Nf5pAKpbjLccnwVGlDVboQlkPXHHKEqC0SYK/eoc97CKUBj2SblFUz/kZuta0wunk0ByNQ2F9fosrBmoVEX52/IvFtrRtGzyeyJYkVu+pJifJPJciLR7q91PTECfXQ1OtORI4xWxqF7FrZ+Csl/7msREVJC6HJ5aCCysqFhXu1V2fqoPQe4VtJbonz88rFKLoKhh+D1993HzU9HdJyIUGCPCjdx+L154l/FMV2dpyuBc3stGtjdVICib5t7KDxnmNc1KCpCOV+PZyD+MBrDlEEoXZhnjQTrbu6y994z+0YHeh6QeJqaSbcxFsH
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 14:55:25.4550
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cde9ed0a-6546-4419-7ca8-08de8a7e8c32
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CE7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8757
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 25 Mar 2026 14:55:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17437

meta-arago / na / 20260325145050.1053445-1-p-deshmukh

PRC Results: FAIL

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
FAIL - [meta-arago][master][PATCH  3/3] arm-compute-library: Add patch to e=
xclude AARCH64-specific KleiDiAI kernels from armv7 builds
    ERROR: Commit message too long (> 80 chars): arm-compute-library: Add p=
atch to exclude AARCH64-specific KleiDiAI kernels from armv7 builds. (COMMI=
T-MESSAGE-1)
        patch:68
            Subject: [meta-arago][master][PATCH  3/3] arm-compute-library: =
Add patch to exclude AARCH64-specific KleiDiAI kernels from armv7 builds
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887




