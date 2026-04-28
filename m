Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 377D7FF8867
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 00:25:03 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.27])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1504.1777335892961425834
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 27 Apr 2026 17:24:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=ljm7K5Tw;
 spf=pass (domain: list.ti.com, ip: 40.93.194.27, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gxFl/MeBFadCTnkZp2gHCZUtbsm8mIvGoIGATgEWIQ/K8l1QNNaD1kmtz6VGDa1uuNdu3qOMSUMARC7PEUP/WN3Xz5l/FW8k4Nqc43YVv+oSeDEx7YHY238kmMT2AQVU3pnE0Q08z7Eob5AWCQYBOvfHY49R0ObVstirWfhz4e7tfnXss/HT6BSecOjAgvPBoomeoyYP2WkKB21x34Wkf7uqbQsg7wrgMoK3AcsesV/g26ADgEGZlRL76IlbcSI/5IqjtDeEmD8pp0c/IZ4PLh4aSF2xaaDG3qEPhmaFn+P5fc5bKQ4kH/+lUzTK6k9LXk5zLezeOLfTCa+Ba7d3ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i9K3/Ij4p+mTzGMsSpZrFsGYlJOG+1TqhzF2P/JtRJY=;
 b=YfWL+yCsxkJO/BbRRtDq4dT7iTrheXu6zF1n2rv7Pb9nX8T34lOa4i3BoVpbGwLDCrplMWqOcpwGzjRmLgO3ajOg5vyVY34vq8S5k6j8psKsynDv5WUsMTb+aPmMrtmPWKRFxWvCJQMpQFWb98/KMl+o9QNIpciS3xumeTfNxrqtS9+4hnWs0B1H5CmsWEjggG/MdvopYc+QkS/sjCNzD9GKqAOsgYgTJpRDTCw3LDFGrPbT4HDGNZ1MsZIaKq572Je39XdrePELKXN2VPG9FLeXTnBXdU9ZIuFi7IEzQJ2DdMb4d8gJ3/AxKAzgST7Hxk8nAujwJFbcLQRM9ytUnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9K3/Ij4p+mTzGMsSpZrFsGYlJOG+1TqhzF2P/JtRJY=;
 b=ljm7K5TwrCz1iOdtfnAjLuHRAxjGlgVF0q4N/9w2mFjjoconPtvmfikd8qJqYpyKs2OEqNCevqvjgjMQxKbwBdMeLNaosiv0aA8DIl/8IiDswu4Oz81auU++vLNcW/i48peBU385jco/a6NpZEIJHkcQIap6FZYyXEMHpC6l/+w/GrKbNBvpXiQBumAG1XiwjqPdPuyg3dgK0WxssbDIe2dBiF1neJ8vi6jsw8MmRpyq/R85KLeA7DfXBIx1f8ygg2GnkHYgJI0btL1erGASElyb0KRcakGfTxw2ioN/uXbuxJ1CxwpBbS4vb0x+e7eHow+2PXOal+DXn7+3FcjnRg==
Received: from CH5P220CA0017.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::8)
 by LV8PR10MB7870.namprd10.prod.outlook.com (2603:10b6:408:1e8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 00:24:50 +0000
Received: from CH1PEPF0000AD7A.namprd04.prod.outlook.com
 (2603:10b6:610:1ef:cafe::38) by CH5P220CA0017.outlook.office365.com
 (2603:10b6:610:1ef::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Tue,
 28 Apr 2026 00:24:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH1PEPF0000AD7A.mail.protection.outlook.com (10.167.244.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Tue, 28 Apr 2026 00:24:49 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Apr
 2026 19:24:49 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Apr
 2026 19:24:49 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 27 Apr 2026 19:24:49 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63S0On4Q2134865;
	Mon, 27 Apr 2026 19:24:49 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 1534D9ACF4; Mon, 27 Apr 2026 19:24:49 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, "Denys Dmytriyenko (TI)"
	<denys@konsulko.com>
Subject: Re: [master][PATCH 1/3] ltp-ddt: move iproute2-bridge from ltp to ltp-ddt
Date: Mon, 27 Apr 2026 19:24:49 -0500
Message-ID: <20260428002449.2450636-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260427233911.2171996-1-denis@denix.org>
References: <20260427233911.2171996-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7A:EE_|LV8PR10MB7870:EE_
X-MS-Office365-Filtering-Correlation-Id: 66f74253-b1b9-4912-ac1a-08dea4bc8f4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|13003099007|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	YIqwPjKwX7QsCVMKGmGA8vZKFfkuEbSwsaC7jdKm8FQvyBO1Y1TlOVm9K/a5yFv+wlC8Anvc/b+4yojtrb0XMgRSWTN2mzQBbUzWcgGNi0cl7slwBO50Dp6yvSlUmEf259c6evHZWM6/LIPHLZsbJ4spXC1SJp3Dx7BkmyE2zNvFRLtW3es4pFWx+9yp2AB9UasaSRRfrqMeFJjkX3rcV0FSBeuQ4kBD9XC+u4ffzQO/IsMsJgHTL24Gdv/+7PDubISkiwUXO/R//KEvDvH1CbUu7//aMeD3PlKPUHugi3fvl5j7HLoHcyQHRVuXkgExmiVywN2vqXSIZbnR1v+tySo+AV5RtCc+K4QfH6fLg15yshSjtxB/KuOFGFR7I7DVeGc7ea0OdIpbTGujNbn8r4C9TazdJ5ujl+qmmcLBwsgXqIhe1DHIZfUTpNd1x/8azNIiocL9H0wwRwHSvV62BbSZ3MUnFOxltbyidNzT5GpFIv/Iqp1bFLMv6nA8vEUmQtxwkVCpmtqx5Ftj8rDlnXMEVlYCMfUx8/r0gDFTm/hlo9rLdS1wq7x2cBthuS6WDY1ewTUXW8lHHQ3Y9df5YGOXMdzVTbZiKHHZQJzsW7cQJo3aZY6bNgEBb2VVBrUWfZ502xxbsWZrqoIGoNtLMyHr8spYFz8RU+YcPh9olc6C2R2gVUfbVJWtwvsHiozUOtvF6sam8jRun1CiQ+LNKO/2xrsP4SB/LiQYi/wz5Ew=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(13003099007)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	0/kVyeOaLjA9Yppm+G9pnw1ncmOxPo8XkOyzUB4bK/NY0WHcDddTaTu2SMKMVg4+uObxdSpwYaFaeVDPkC0d/CUzPogSY6kE2Xr9NiR1CA2wug9GgYcZkXfvZTqXY/yz7zmVv3w2MGqizmq/AQzbKCrfQYhfbodb2XrCHeJEK9A1p6SBnbvUIbVIV9lcy1oTdcQxF5Rfls7wC96FlrHff/L860j57NfWJkvD+mOkH6tXHV2PDAXYtUUpfLFXO3Iyt6qwjpGNpReB+9lRZ48pVtPqn3aUhsKaspReyMMFJ2JCGs2UuFwaiRZULwPQpFfEPYWRmLYmciI0y4hMfG1wfKW3o9Qs/+1WvxMRRek5rfVPQwhk0h6XVhgW4wf3yAHVVuxh7TSYk9qTkg09gE7GMXpdsQEwsz9WcKrYZM6kNzulHEU3FmOiHY6XAnw9nEwf
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 00:24:49.7277
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66f74253-b1b9-4912-ac1a-08dea4bc8f4e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD7A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7870
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 28 Apr 2026 00:25:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17497

meta-arago / na / 20260427233911.2171996-1-denis

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
WARN - [master][PATCH 1/3] ltp-ddt: move iproute2-bridge from ltp to ltp-dd=
t
    WARN: Missing Signed-off-by by sender in commit message. (SIGNED-OFF-BY=
-2)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [master][PATCH 2/3] ltp-ddt: correct re-enabling of memcg_stress tes=
t
    WARN: Missing Signed-off-by by sender in commit message. (SIGNED-OFF-BY=
-2)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [master][PATCH 3/3] ltp-ddt: sync up ltp with upstream
    WARN: Missing Signed-off-by by sender in commit message. (SIGNED-OFF-BY=
-2)
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
- Patch Series: [master][PATCH 1/3] ltp-ddt: move iproute2-bridge from ltp =
to ltp-ddt
- Submitter: From: Denys Dmytriyenko <denis@denix.org>
From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
- Date: Date: Mon, 27 Apr 2026 19:39:09 -0400
- Num Patches: 3
- Mailing List (public inbox) Commit SHA: 9030ec655aca99176f80b257728e8924f=
47a3ce7

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Randolph Sapp <rs@ti.com>
- Commit Subject: qtbase: remove serial event 0 handling
- Commit SHA: 5ac854ed85c79c1756aac168dc38f78591c2cbd1

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




