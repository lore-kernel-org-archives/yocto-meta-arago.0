Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3579EB3637
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 21:02:01 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2606.1772485311544843343
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 13:01:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=PH/i0HjI;
 spf=pass (domain: list.ti.com, ip: 52.101.61.46, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WUOIm8x1RYh3HzBNsvP0vPG28yQlKAvSuSqs30tjl1F2iSbKAikyQBc+d/KPnijuAcgl2lG57cWYVQgsEpYIDYYwZXyLX7NtwnDJANBPLyHIp0Ncm+r4xMoGKKB/SaEXLpWyiCbhvBvCCAt/vjVE/1ZHpZ3O2uI8plZg9BsWUGCjEhgtgAzmHTw55QPyXwrpwKyuFr/8iXIW8//VQYWEZA4QpUpiSTb0yQ31lvJTRQnQnLzy8i4k68i2uWFbvt5CCPJt9QjMe6N2kURvBlFQRWLyqtmBVVfLswT5LPfIQYTJWr35BceAy8BRGGq+5eRw2USGJo7EjWlExYdo2GURLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eFU0a+NsuTOhlC2SKT3lST2cYjB7cxe/qexPMwQqSsw=;
 b=EkJmj5VcofEZRfjJu5nGcYb6OMkz4c1LnbUCYoH6vpvkDJUheLTnczUWEkJ5jb0CFHiz8WvFMz7avKEaftJlC1uo/zk/6mp8C+FqtNU6kXsmgIebLr5PVV6su02gdOGmS9lkRK8qfa4ix+DbDIOMPNw6IvmTIQtxBVErRzxGrrxfVu27nem2uIhhhkE2yLZ6ea3NXVlQfNmgbgB00WZquPe880aHDkyzmG6ZhuNXfmm4QcqpD6RJQ0QtppywCHkQYA1Oul2RFBCOi2+Ksf0yb9MptJ+0WM+TvgG6qyNTtrKaf0Py5zRZXpjiTu/8iicSDl9ssl0yXyF4FL27oBuucA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eFU0a+NsuTOhlC2SKT3lST2cYjB7cxe/qexPMwQqSsw=;
 b=PH/i0HjIzsVVa6JSjmQWIkDiWaIaqkKsF9I7IbS8n60q2D1eavHNnRJX04nGOXxJzMuLRm0j7rzDgRTF+RI9WqQEWaijPhPIoBgUErynq1nQffjz3Y0nzOt8LhZv36wQaX0gVQUONW1dnfnUdeBUbgeffCNswoR4hTSr3cLqJXQ6ngxB48wQBabusaToGWGOWBIRW+eQr3IbfthRnU8BVuE/fWDscpCnO5oF+QtEV+bcC7NH3Q/FzffwPQH3OBUZMdnoo0CB+Pw/6GnfMBtzlm8NvTPAPsbwSkSvwsIrJabLKxNpADDn1MxPaoPMKy91Gi+I5JVL+0X4gD8d8acPOQ==
Received: from DS7PR06CA0046.namprd06.prod.outlook.com (2603:10b6:8:54::13) by
 MN2PR10MB4365.namprd10.prod.outlook.com (2603:10b6:208:199::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 21:01:45 +0000
Received: from CH3PEPF00000014.namprd21.prod.outlook.com
 (2603:10b6:8:54:cafe::e3) by DS7PR06CA0046.outlook.office365.com
 (2603:10b6:8:54::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Mon,
 2 Mar 2026 21:01:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH3PEPF00000014.mail.protection.outlook.com (10.167.244.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.0 via Frontend Transport; Mon, 2 Mar 2026 21:01:44 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 15:01:32 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 15:01:32 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Mar 2026 15:01:32 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 622L1W9F2861482;
	Mon, 2 Mar 2026 15:01:32 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id AF4F49ACF4; Mon,  2 Mar 2026 15:01:31 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Thorsten Lannynd <t-lannynd@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <detheridge@ti.com>,
	<b-brnich@ti.com>, <a-christidis@ti.com>
Subject: Re: [meta-arago][master][PATCH 1/4] meta-arago-test: Add curl-cffi  recipe
Date: Mon, 2 Mar 2026 15:01:31 -0600
Message-ID: <20260302210131.2910144-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260302205436.1117890-1-t-lannynd@ti.com>
References: <20260302205436.1117890-1-t-lannynd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000014:EE_|MN2PR10MB4365:EE_
X-MS-Office365-Filtering-Correlation-Id: d86be983-2d97-4675-cb82-08de789ee904
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|34020700016|376014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	GQAR8G51/r1DUVyXuuPsifdjcKRqv9C4nZOrCgPRyD7OeTbJboMn3f6D+PKyYlmKKvYl5dQe7DhfDdMJOzrjMtS7QCwZm9v1gf1Pqzsf6fPRcB8CHSxqeIdZFlqAX8ueKcL4ZSRmpSdvKNgtDktZz3eFlFc3FU0xDeXj0FTzAcgF0hQvtnReM4c2MgrmIPd8dWQh1jfviJGtARZqOWIhG9vEWVYC60FfRZGNUXSLl8bjm8yBWIgehCnRA+Mp/f1DrfJdANS284FkNTY/ihVylgsu8FxKxm+FTtwFjVcaai5C5/va9FZQYo41FQxBhja4d+FPeKoPWTxRHhncDmJqvc8+fPFTEe5dxa659EbYwpnM1rJlCSKlKe5xBTNImSF7d1ogM3RxYwz3oGdPeRhvK4dDE14nG4qFiaVGtzL3Np0Re8VHLRYjIloA7KVTeIDp7SC6nBpRqk1dF/r6q0wttM6icQlnGd0xwxtrlYs/idcToj7GF4hnqmLICsR6WvEPAGP/w5yKgpKu/tiopO0TYAe7NWxjAoOpBmMtEt4D28QKMTK16IScH/3dkNP/9aBErtHleeYL+2VcGPDypWEcupqIYaKycz9/BG+fy1EwwLN0P3tMbLxggQfdJDK8dxeUHQWcsp3prUFn69iE4zBXH+EV8kil8SIUs8W9tidv+D70fvbgMohPttHU1YjRx5sVV4F/bHgjmhRRKt6LQIf95J5syUk+TDJx9pGw40ZGsEHVsud+5w+IxwvmllA66huRC6/NkszzeB2Oto1UdxijzPlNvQaleKljbfomfuLsGJJ9jgXzwkBDXFpVadkcZWBvLdqhOa3HAVnduv4D+KMjyg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(34020700016)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	i1n2k5OI6nS8RHjq+YDXxUCt9Hb5bf32C0Tvs+kj78brU8Q9R/k8yfrurVP5npzb3rTaDbJkE3Nk5poKzMVO5NJlvzCPq7TNIiwMkKqcO6Gop/aIfEWqQy8D6ZSAOisPy5iKK1ywrcTJkn8p+C87AbUsEb0dzdjlrvvn/4gEWNtls/Vk9+HxIEpslWekeRF/rfvsBWAWQS1YelEDObAnc0uN6PW7stSRFHU9OMMFeB6GqmAgvdZjVVqL98niyDGTGeN9VX62KpBvi+z2A54hmX+HWjUPFuVmwPOMKJ2YGxtNqxgeAnIib/jWOn2P9ktaBkP4VbfDQlHec5VS22R3Obr4rDJZlu2wEWzwbF5XmiquB5ypohfHhLUoZCJ4sN/wmAgm0dz0n7ZvnyVyQhAbr0fww1OKt8k5ZFMOYNB4S2hhSkO/cWFxapJu1vBYoxTu
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 21:01:44.1810
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d86be983-2d97-4675-cb82-08de789ee904
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF00000014.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4365
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 02 Mar 2026 21:02:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17181

meta-arago / na / 20260302205436.1117890-1-t-lannynd

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
WARN - [meta-arago][master][PATCH 1/4] meta-arago-test: Add curl-cffi  reci=
pe
    WARN: Commit message does not include file/recipe name: meta-arago-test=
: Add curl-cffi  recipe. (COMMIT-MESSAGE-2)
        patch
   =20
    WARN: Commit message should not include directory path to recipe: meta-=
arago-test: Add curl-cffi  recipe.
              meta-arago-test (COMMIT-MESSAGE-3)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-arago][master][PATCH 2/4] meta-arago-test: Add yt-dlp recipe
    WARN: Commit message does not include file/recipe name: meta-arago-test=
: Add yt-dlp recipe. (COMMIT-MESSAGE-2)
        patch
   =20
    WARN: Commit message should not include directory path to recipe: meta-=
arago-test: Add yt-dlp recipe.
              meta-arago-test (COMMIT-MESSAGE-3)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-arago][master][PATCH 3/4] meta-arago-test: Add curl-cffi and y=
t-dlp to ti-test-extras
    WARN: Commit message does not include file/recipe name: meta-arago-test=
: Add curl-cffi and yt-dlp to ti-test-extras. (COMMIT-MESSAGE-2)
        patch
   =20
    WARN: Commit message should not include directory path to recipe: meta-=
arago-test: Add curl-cffi and yt-dlp to ti-test-extras.
              meta-arago-test (COMMIT-MESSAGE-3)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-arago][master][PATCH 4/4] meta-arago-distro: ffmpeg: Enable Op=
enSSL support for HTTPS protocol
    WARN: Commit message should not include directory path to recipe: meta-=
arago-distro: ffmpeg: Enable OpenSSL support for HTTPS protocol.
              meta-arago-distro (COMMIT-MESSAGE-3)
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
- Patch Series: [meta-arago][master][PATCH 1/4] meta-arago-test: Add curl-c=
ffi  recipe
- Submitter: From: Thorsten Lannynd <t-lannynd@ti.com>
- Date: Date: Mon, 2 Mar 2026 14:54:33 -0600
- Num Patches: 4
- Mailing List (public inbox) Commit SHA: 559233df8ad72371c06156f29f9be4953=
3bfa577

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
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-arago-distro/recipes-multimedia/ffmpeg/ffmpeg_%.bbappend
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887




