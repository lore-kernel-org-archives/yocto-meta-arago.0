Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D77C9E67A96
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 08:16:16 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com (BN8PR05CU002.outbound.protection.outlook.com [52.101.57.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13657.1772525767944502223
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 03 Mar 2026 00:16:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=jZYoIIuS;
 spf=pass (domain: list.ti.com, ip: 52.101.57.18, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SmKzUVEzz9w3N3TOnDuPKzEObEx5bf1uZgN/31RvqZO9Fz36dDh9kOCZaxyDPmHIcmJfzJMrGLy72EctEuq9GzutuyPDPGXIcmhLgs6psPzydsHjMv6D6S/H4OJ+v8hyMkTgRW3Gif3gPiBZTq43gJH6vxUqtPcNNNVdm6jgriq5ZwzukZ6rrBY4Iuv2lZ7212kR7Ryjx2AtEckwcQQ2AQXOH2eNr8axXzCAo+5LplRs464EzhzMcOGkzIAZ4EfNEpbTgq0thTyPNK+wPxvcnGWUBMtsLxSuEOfT5Yo9ssEbHB/q8hnf3IqUMyz1fgoNbD550WnX1VHkRRhynVwbFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L1TsAI3NFR0/VvE1C1aUox1RXhUsfpi+ld4ro4MU3Kw=;
 b=P5PO12Eh6BZBwEtYdHVoR0tG90zt42rLUKuU38IferJY5CPlEXOqddtCWeY7KA3qvIn/RreqtXGAUqdc2yhqqHTeOnf3TC8qc1D/4kwwJWkD56sA7eHOr3ISYE/TXFjmHjS0L/YyUmA0ZUshND5dT9loVGzn2O5rZb1vJv+n2syLUYBXz0HXX0mgJPefCRKAMevVom0UBlnUYbd9Qjoes46VHRdxswXE6EH1vh1gg2/MXe6nZTLdaP8e/J25U0eyDNY6SLAOi5rgwEW64/LzMbp3gVFiju7qDsF96qQ2hT5TnuGa5e3IE5wA6o9GXAD3SDIyhKJ2v3X8FTqjDtb9xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L1TsAI3NFR0/VvE1C1aUox1RXhUsfpi+ld4ro4MU3Kw=;
 b=jZYoIIuSR00OTkHjQXFxfgIdz0QT8iyPBMkCQSPdeiRKfcdukh4TF5jpWmJrZ07t/SJtoZPnpkSh+epFjqDqYpcygI88ITaFh+2kUFHzhaAnaTqnN18JNAyfnMCWRe6WS6scEUZ/k2XHEQ/jPktBmEQRCdTGS3P7bmt1vI+nKtTZ0Pck4iB0mKyS6C4Qn2iKrpP/FnvSHete3SyhX9HQCOrUnOstNhLs6qiewMu4rtY8W3oLEYXJJ8/3XL0F9rp6o8PeSAZD04UQtnmrd9+JLUSqxd4G1KfkVHCn+Ay+4RjZruQ/JLF2Td4LaUOJ3Fu5uK+LQTQeTMf/SamSm52D9A==
Received: from SJ0PR03CA0390.namprd03.prod.outlook.com (2603:10b6:a03:3a1::35)
 by IA0PR10MB7157.namprd10.prod.outlook.com (2603:10b6:208:400::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Tue, 3 Mar
 2026 08:16:03 +0000
Received: from BY1PEPF0001AE19.namprd04.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::b1) by SJ0PR03CA0390.outlook.office365.com
 (2603:10b6:a03:3a1::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Tue,
 3 Mar 2026 08:16:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BY1PEPF0001AE19.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 08:16:01 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 02:15:41 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 02:15:41 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Mar 2026 02:15:41 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6238FeFD1773092;
	Tue, 3 Mar 2026 02:15:40 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id E16119ACF4; Tue,  3 Mar 2026 02:15:40 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Pratham Deshmukh <p-deshmukh@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <afd@ti.com>, <reatmon@ti.com>,
	<c-shilwant@ti.com>, <denys@konsulko.com>, <v-singh1@ti.com>, <khasim@ti.com>
Subject: Re: [meta-arago][master][PATCH v2 0/2] Migrate ONNX framework v1.16.1 to v1.18.0 and ONNXRuntime v1.20.1 to v1.23.2
Date: Tue, 3 Mar 2026 02:15:40 -0600
Message-ID: <20260303081540.3349278-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260303081105.2111463-1-p-deshmukh@ti.com>
References: <20260303081105.2111463-1-p-deshmukh@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE19:EE_|IA0PR10MB7157:EE_
X-MS-Office365-Filtering-Correlation-Id: a0acbffb-a574-4df6-9173-08de78fd1ba8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|34020700016|36860700013|82310400026|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	66ZVQsbd5upraMnuipED0VTezcVv1W43JWzJ7afDBuJrnqoj59w5Ta2Fl3d7277dN9cPzc6XrcWPGprbsJNxzCq05el6YpRKCQ2gtkHjTYN/lDHgPGppgnLjTlMH9Z0RzLe8OM57w782jVO9mC4OzbxNG5qpG96wwkP2HmE/FqHQ57MzpVmBVsM+ExcVcHjXQagVl3En7h4mfolHE1YCVIYdMmA756LrLIiVD9CldZpUjIErYHsCus3h66t4AoBJAAPKTQnDN1mxHzhFE9+UY2ot6Pa+SY5LwjKxFKXhHNZ3YstujLI9zYxBzGjWTZnYpNwKlSoxsN53yag7QGEb8pHFnO86d3kI6n4iKgUK5IzEetYh+ciyOqduy4cIIAsnyqzlwPZRrmeheseI5JNEJHrLJ8gWg3SvM7v4ctd2lqFmCcdCDfI/HFZ/RYT2BX5jQpdYar82PblQzeNT0ZmL4m+bcpu85AT0M8C4ATEBPO57sM2oZO1li5BCP+kRiACDOz2NHs6FoZe+YsyQN+CXSmPVEo40JaoPo1cE/2dhOu4TW7fGLAskiZLwlqMf1o/BTJmC7kKyqu6qCo5S4F3/qWUsX3UAGm8yvX1hrqh65hAdAueg9z6rbMKldJaLApfLZEU5wLZoCO1Zi7cCdcT1SoVwgBcdHKRtTGujNu7sfmUbSuku++WXCA1S22uJf/5Nzc5F/OK2PRnZR9S//L5yF6oXMmvXDNyfupKKoGg2ZZbKD3lrmfF1jEja4kPa8z7u0PnGZzjoUtWO5ZCfJ8q4FNz3Tt6lUiZGMC8IQuL+OLLsVTt7/ed5S1rlPBbxo2deJ3pM0MIh8jWrIOnwew0hUg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(34020700016)(36860700013)(82310400026)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	jRX50BQBrWp/9bRlzoDvRBTk91vYnhGGZr/sdq7kD4w+QtiY7tYAqoP8DyhzAKEfHk0KGckKRaJ2tZZCye/lz6JuqCyRr0CR8SAHR6kI9KBm01mpc3Sv41+d9S/V/rwfAxCiYBtpQJSkYq3kyN6SsbICWlSTUlYtgx2yYYqTh3uIEk7B0E1QBMtUxxdnGCcc8Zkx4muiidGQsq3GIG9xwikCcMwuRK/TOxMQEZXft3u4jgAxTEBP2oaBBWu2FCmsiFWWlso8VDRjqRKI8yh5bL15UIywRaK59qR0XtwM3PIZN1CMeiWF9RRbBIjjm6nQvG3WWYvgobouiNBMLb6Iw5Lmpys/IUoHFxhRg+MDoqAkCn8v6uMm5N7w44aOmKjZTWzpKeFCoq6qVUWw9Mf6i5zzi1z0CxXozh6E2VrcQRRCll8fTI9YhKZ88hBWcgpF
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 08:16:01.7918
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0acbffb-a574-4df6-9173-08de78fd1ba8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BY1PEPF0001AE19.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7157
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 03 Mar 2026 08:16:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17189

meta-arago / na / 20260303081105.2111463-1-p-deshmukh

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
WARN - [meta-arago][master][PATCH v2 1/2] onnx:upgrade 1.16.1 to 1.18.0
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-arago][master][PATCH v2 2/2] onnxruntime:upgrade 1.20.1 to 1.2=
3.2
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887



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
- Patch Series: [meta-arago][master][PATCH v2 0/2] Migrate ONNX framework v=
1.16.1 to v1.18.0 and ONNXRuntime v1.20.1 to v1.23.2
- Submitter: From: Pratham Deshmukh <p-deshmukh@ti.com>
- Date: Date: Tue, 3 Mar 2026 13:41:03 +0530
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: 239c2737101f99576bd9ca03960f9a7e6=
a092cbf

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: arago.conf: Remove temporary hack for DEFAULTTUNE on armv=
7a
- Commit SHA: 58966cd5a2d433b4c915e652f21f2e2b2475ec21

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
    ERROR: Patch is not referenced in any recipe. (REPO-1)
        meta-arago-extras/recipes-framework/onnx/onnx/0001-Apply-onnx-patch=
.patch
   =20
    ERROR: Patch is not referenced in any recipe. (REPO-1)
        meta-arago-extras/recipes-framework/onnx/onnx/0002-cmake-Fix-Protob=
uf-target-check-by-calling-find_pack.patch
   =20
    ERROR: Patch is not referenced in any recipe. (REPO-1)
        meta-arago-extras/recipes-framework/onnx/onnx/0003-cmake-Remove-Pro=
tobuf-directory-exports-from-config-.patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887




