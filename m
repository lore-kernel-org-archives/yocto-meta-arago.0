Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FECAEA855F
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 05:49:40 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7981.1773035368062574248
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 08 Mar 2026 22:49:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=HHwsbpTM;
 spf=pass (domain: list.ti.com, ip: 52.101.61.28, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IotCft9Uhnp5kBdYZrXMh6IqC/KmK9SVXmbPY++jm9aK+aSNk7iAL99ud3PWDOIHMOXGVykCTXcfYNEzpNku6h0GLg3FARVonKK63XW99zGDi/ZY/wPRuOToZEq3ZWe5Yl6mSf3mq3nX6Wpn9gNVh0AiNXaUGNMmAUz1duLp05kJaYA9MrFtKX6g9GLeI+ytJGHsAr38BJI9HS21BQu9MKzC6V4LNiPx0t70dxwFdOVteOQjlF5N7wWZzxlcHPmtSuqALUrPktN1nB29znl017AcTFELQjpCe7mYD66jfWEwvI1H51eaRnqzqjekaPic2F4CVMnBNNp4j+fcWxb+fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=da4LgetvDmikkNWDxm063rCRjXLcOHSN/5h4pvzk0/Q=;
 b=SWqwvaKF1JieZ+8lNgX8nqfXP2JdqrX8CCjzGFv9PolPysjuxIjRystrm6sRdAXMhIw/tretewnClZnGPx08Tyo8YxkJSEPTlPCYCab0MTxLMVfH8VbVaki/4gWKtHkQ/odj8F7TpU/aZT2cqgNVnmgOjieVOgoLQnXbkRB+U6M3k89Pnm8Smf/kSQTPmzT6itH5o6B7xiaWXSelJe1SQXL95ZfaADuZSAXwtdhYmPO4MgJ/D6jXy/h9Rxh1ZSyPimqXjv1pREFVsBj1Z81Z8RpduHB31LyVAKGm161j0U18ZU/AW5HGEA/8iTh9SwtB5niqfIEdsiSoYGX4BlpPSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=da4LgetvDmikkNWDxm063rCRjXLcOHSN/5h4pvzk0/Q=;
 b=HHwsbpTMnQ6/tu5pRhORJpgoUbnN/NRtC3cpXqervtmEeMdAYECK6sIy2inYoMteIX+iMcvIdGtz//RUGOAUKuGjCNQuK9OvYuxsDh7KmLshhGtn+flKR1VXnOkIEyeGQiLhlq4Y0wKA/bzPi1Krftb3m4y2I5ySVNCAJLjkvedmDrwhuoNm7EaVrzgc6WJFUu0LTQuEf556lqzHWn6uZJ8gVqGRO0E0wa7KZIeJm629oeRW0hQ/FbG6EqPkonnGPa4N6qHJ2+SeDhxCAhQnwT3dgRpOmvzLzdSMVNWq74KUrWsqlRethClvM8rBxxd748JdARxU3Av665beTWAAVA==
Received: from SN7PR18CA0001.namprd18.prod.outlook.com (2603:10b6:806:f3::15)
 by BN0PR10MB4904.namprd10.prod.outlook.com (2603:10b6:408:125::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.20; Mon, 9 Mar
 2026 05:49:26 +0000
Received: from SN1PEPF0002636C.namprd02.prod.outlook.com
 (2603:10b6:806:f3:cafe::55) by SN7PR18CA0001.outlook.office365.com
 (2603:10b6:806:f3::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.23 via Frontend Transport; Mon,
 9 Mar 2026 05:49:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SN1PEPF0002636C.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Mon, 9 Mar 2026 05:49:25 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 00:49:25 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 00:49:25 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Mar 2026 00:49:25 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6295nOK61711428;
	Mon, 9 Mar 2026 00:49:24 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id E8AF09ACF4; Mon,  9 Mar 2026 00:49:24 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Pratham Deshmukh <p-deshmukh@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <afd@ti.com>, <c-shilwant@ti.com>,
	<denys@ti.com>, <v-singh1@ti.com>
Subject: Re: [meta-arago][master][PATCH 0/1] nnstreamer: Fix buildpaths QA failure
Date: Mon, 9 Mar 2026 00:49:24 -0500
Message-ID: <20260309054924.2973111-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260309053346.3827889-1-p-deshmukh@ti.com>
References: <20260309053346.3827889-1-p-deshmukh@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636C:EE_|BN0PR10MB4904:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b5cbe6b-9a7b-4679-c9ae-08de7d9f9f18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	OCq17ft1/domnOcyrL637fzQftB4ASF56JfeELf4Bb9eYJbCUF9YoBmUph/MOIVqrtJyz0OBzOXpGg+EhxsVoAPbzUOGs0LPajQrF3bUSqHy3LRQJM9G43/9mTf4SErRE0mzXhaov7stra17wmvNpIhlLkOoLIDu5sZicIY78cKouHHE1XBCs9AyffYA7NhFZyFkkZMNZF+tmgps6cWeJh4Sdfi1yoHT+CmO72vmKyB5pqS4U22x/cjoE0JBnHLg5k9wve7tar1ZIucWwQJYPUwgT/xrd9lJXLfklbXZVLVO6D09R1lTCnwu9XIfd9Pe/OLDlGg77244FQJ16scLA36CMhShuc2t7jiOKu1P8oHDnv68kAjYRMvJIkReQMDDjH8Hz787PzMqNxmbGS/7A945s+QeJVgaexFR0SP8YsZCW10ZYMPoxPU8Yhxcdos7yjqjFZ/xN/TUuJnAgT1sspGbQ/JMvSi6cAwlza89elHfFsRjy/6T3nZnPntaGPPpNcfZIIF/u0OE4bWZSXrHh/QL2r3dNXBvRVJXx3XTXBCjDWLjHt3q97E+88Wzf8aEDwZcsanRlXZlaG3DwtggF6J/7YLXG2guYmiYQtv0UVvjH9Jfh3uBJH3vTw1fimYTT8JApKKdHxA4ibR1uLvFf5j43fCEk4N57wBIq8d+6fKgKU4UGuPH1u0ra+ftBCLrhlfFtqpqhVXZ297Iej+V7rF/jq0CP0X5HeJCo8OFGpnLAbkCPrl6ba+8aCSwY91P47DPdZC2s9SaOrsglQwKYw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Kacws8HbwaOzlS2O29jevVK5ClGOy0qwk5fIa5wpFQ1hXGMo9jn/JsfC5Btl1teIfW3Lc++lHaSGZUhYsxMWx0CkisQ5wyBB6/0eXvl/mGLEHg1vr2KmDOxIcJ3NxRABNJ3U2aANKk6mSVI9y1W93xoz7wcfR/AWphSmGjykbvZcrBc+V9KH0I1qSG6lvFFHlVY3RFp2E4dE8SgS52c8vFJxmigt0PgeOaMHywE/iQYWoph0R7+XPZVE1HFV6McSLbN97xFTSfagAkgJNvolpuMG7Prharysm5Jf4O8sAjcCm53byn+DbxrYd/SDRbGvKxswwh1f69freYZQQbLRzRAQsFxbyTJDPv+DZb+MaBSPkWfsX3+ilK3rmGp7jCdA/eq3K+xCEoGUtaj+dWdd/622NIz6Yl8+DqVANfH9W9PPtr4r5o2HpgM4dqVfcb2l
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 05:49:25.4996
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b5cbe6b-9a7b-4679-c9ae-08de7d9f9f18
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002636C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4904
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 09 Mar 2026 05:49:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17283

meta-arago / na / 20260309053346.3827889-1-p-deshmukh

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
- Patch Series: [meta-arago][master][PATCH 0/1] nnstreamer: Fix buildpaths =
QA failure
- Submitter: From: Pratham Deshmukh <p-deshmukh@ti.com>
- Date: Date: Mon, 9 Mar 2026 11:03:45 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 4487e40cb23edef3a3b847612989b073d=
580e749

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Thorsten Lannynd <t-lannynd@ti.com>
- Commit Subject: chromium: Upgrade to v142.0.7444.175
- Commit SHA: 939752e7496d2cdaea5648fdb0418ed6a36204c7

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
  yocto-check-layers: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master - FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
ERROR: Nothing PROVIDES 'xen-guest-image-minimal'
ERROR: Required build target 'meta-world-pkgdata' has no buildable provider=
s.




