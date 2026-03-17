Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5607DFF6E7C
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 20:39:39 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.40])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.86344.1773779969870407157
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 13:39:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=pMU0bSqu;
 spf=pass (domain: list.ti.com, ip: 40.107.201.40, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QjwyGZa2nrlhZSn8DgWOuqjnBsTFUfFW12ueIOAoMtWlTzO4gYE80F0jSiZVDjE0v3ksxg+uARL53TYaPXor5n5xElnf99Nbl6gLNoRKv690TvoL6WQAciM65RM+qzp9ioJo+F0HQz8xTaBR6r7BS330kvKR5r6mjqdM9bIs5bCNnlvHOArW220mfICORS+mWcgnKfirvyKV7TJJF1oLvEJuiypyHHI50g/YZ6/K650bLu3v8e8PEnWObn4FKPk5SPB2RI0LYM0PfeMQ+z4OiMSnZEtAX9QzFjIbPdfSOIeIqpAgTdWqpiSwNGshNuwuH12icJgKRFDazLa9KnmcnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oNI8rwz2D4q2qAY4Rum/sm99UgeenUTvpPPC5yViPJQ=;
 b=qN713dQvET/dLqZFi1y0vSAUqfWn2InR2aAVPHD11TLZH10FYfZjxh59NPPNg3EtdcAFmhr09BWbbxe8OHgZiecB7frdi5JYOxPKOd1ahP1LiBCdWL57d2wqWQkGMUiHfeI3wzejwXMePTC4ZQNaUFrsJmr0EHvH7/04KIVVV7q2Sb4VlMOjPVvX7l6DFDwqJiiLbz1h+1N16zxMIdjQU0oPNDDGGW6W4RFHskNnzHTvQGiDi7ZZvem5GDUQo8JQT5OuFkREUxFCPeuHrLthu0VvAlNj5EayV9tOFizRRQwZyBRE4HLBoSgv1xqBRETkRL7dDsHYIibkOsSnMqV1ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oNI8rwz2D4q2qAY4Rum/sm99UgeenUTvpPPC5yViPJQ=;
 b=pMU0bSquFxdkBmFXviXZfy9EYiFloaIyRlYgBRCIOtMCuNj5wKHRVtbimOCSn93zTgxNFkoqawejWdKzlEuTcuhcHRnRovNks9ky4SOHEDOFyjPuLD2JARy8XZEa1BO41xElEJiDoKLprJJmwrQe5MAg9gEgVJbi8zUE05ousxcLbYsNrFLaSG5frEbePoPLRKfsjIFgG24VQVHldDj/RDyCIDzvGUBS5/gmC6jP5HA3xqnb3PxBV4MwNVrVWJksyi6TP3mQd3hqDXIvV0WPl0a6a+T8G1OZj3E/FTBBXsIfEMekNIor8Kf0S6eaOHCOYugsSR9uJpA6I9eBYJ115A==
Received: from BL1PR13CA0139.namprd13.prod.outlook.com (2603:10b6:208:2bb::24)
 by DS0PR10MB6272.namprd10.prod.outlook.com (2603:10b6:8:d0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.22; Tue, 17 Mar
 2026 20:39:27 +0000
Received: from MN1PEPF0000ECD8.namprd02.prod.outlook.com
 (2603:10b6:208:2bb:cafe::41) by BL1PR13CA0139.outlook.office365.com
 (2603:10b6:208:2bb::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.25 via Frontend Transport; Tue,
 17 Mar 2026 20:39:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MN1PEPF0000ECD8.mail.protection.outlook.com (10.167.242.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 20:39:27 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 15:39:26 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 15:39:25 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Mar 2026 15:39:25 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62HKdPTM3325148;
	Tue, 17 Mar 2026 15:39:25 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id AD8159ACF4; Tue, 17 Mar 2026 15:39:25 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: <a-christidis@ti.com>
CC: <reatmon@ti.com>, <denys@konsulko.com>,
	<meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH v2 0/2] Add libsdl2 test support
Date: Tue, 17 Mar 2026 15:39:25 -0500
Message-ID: <20260317203925.3862906-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260317203414.43798-1-a-christidis@ti.com>
References: <20260317203414.43798-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD8:EE_|DS0PR10MB6272:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f6fb440-9ea2-432a-3b47-08de8465484b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	B26j7668JBDEYJPRb3jo0heTqm4WPfyJRcKX5SXqgQJO8+zO2nfR3LC/wNDbPb/ceQDSb3MlHyd/fVvFcMgcGtz/lbjE641mg2HMIxoVLWN0wnOJKhyNACIwpLrtLZqd1wG3d9EHslyqVuzbaDjKqAgXb9s4YomZI65hT3Eq6coAJeKyVhqQhDBUhMuDrIAUGhjGpLcyFh18H/JaK8Y88Zpvfi7LpouI5baI5MqovqYxu485dZz41tn6nm+rx2nvxGIJ+gZMuhCYfAxxlz7hF0nohlUBgAgr5YhY1+nOZ7Up6IFwqdxpJyIKxqGj1nFyi64x9ZIDgaVbutHgWtx0wsjOW65u+RcCyfnCLhxEBUC1IJ9U9TXveSL8nFy/aHHi7Ee6xezGXeHIjS02st9gdh3nqZfu7KcSYLOhrVTzn9ANNv9IL7+uohQwJFn+9B9WxiiZKzJrSbryJykuC43i5/jOPoqVnhEkq+MRHyNEY4kS33KWGLh/Y8m7EFN8wIciIxuokDUu8YI3hPhJm3MPmYN+ea7uB3mYPeiAyHRjIYSwAYeVirboAmcM/ez2de/1mPKATDyQ4AhzW9oWpzlMhlFNIOoRclxNxIQ5Crdr4LtlDJnaW87tsdl9eAUzhQWc1ziHvOaXl5gUoz5n8RjnV6ndm+lDPGaK/MFDMVqi2gxh7F6rvGLpwsvUvwyHHID18BWE1rafY8NCG3Y+k4vN0k/HF/BMTf5BmJn/yjlyhblQWgQ4a5ldsCG2e8c07w6J+DK2RWpHJnFzv4kQCSmLsg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	JaqP/HPHctJCEFHGC4UcS+Z/NKeXlcJh2abOnDDepoZFaRUWBG+Am9mMqmB2fc+0QATHQjW231Qpjx+1BAKnYR+7mmJgXOd1luGfcCSzSuy5b4rKmTqbN01yoXY3TIABGPCweL/OcUbmvcr68+ur9n91DSnI9I1Hhse2Sp8h0gmjc94sP/F/fX+xZPvw4BTE3Usrgc+STlpABXqXpYIIrrwrtc1cLiDRzjm7TIA3SFIyZLGXLmdH2us4qbyG2ejAeypSPWZwlUFc4ijeJqK6eDSzvRcx8+PEW6lJ7PG5GT+HcxZhdqhF9ET39Wc97mTwhIL5YFyhxMmKzrTXwtvt9F/EfLWIoxP8LiLxZAAwIL/6Wf2pMhG/4NJFI6gXW93D7wBh1zwFrcsaQtcvbDod96Fgwki2+2vTg2j/1a2k6EWbhwFyIt8zqAgP4wgz9SRw
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 20:39:27.1538
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f6fb440-9ea2-432a-3b47-08de8465484b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000ECD8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6272
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 17 Mar 2026 20:39:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17384

meta-arago / na / 20260317203414.43798-1-a-christidis

PRC Results: PASS

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
WARN - [meta-arago][master][PATCH v2 2/2] ti-test: Add libsdl2-tests to pac=
kagegroup
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
- Patch Series: [meta-arago][master][PATCH v2 0/2] Add libsdl2 test support
- Submitter: From: <a-christidis@ti.com>
From: Antonios Christidis <a-christidis@ti.com>
- Date: Date: Tue, 17 Mar 2026 15:34:12 -0500
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: 0bdf2e912c65b39f01dd4ab7ac4057f61=
8ec3e18

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Thorsten Lannynd <t-lannynd@ti.com>
- Commit Subject: ti-test: Add request and websocket-client to packagegroup
- Commit SHA: 64d6190f700d54addcd17687b7428a64c2bbb0fb

Patches
----------------------------------------
All patches applied



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-repo: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




