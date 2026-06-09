Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB6CBCD8CAD
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 19:15:07 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3724.1781032507388188719
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 12:15:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=RhneqI/B;
 spf=pass (domain: list.ti.com, ip: 52.101.85.13, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ojR1h5OqWNJ1XrcVb7wIshmIHf/5QJ5PAFn/2BTWaBPcXGNPB87gM4Otv3kHg7pXWXG/urjlXjNjJBtlgz/iauZK7osmoVevn3mjqxlaHEojvmJuq3T3z9xitUYb7hFcEPwhxsfpsmNKPiLc45P8zRw2yV4jYkk8MWEdm8efhoMcMlvV2QE7+bBzQLxhfR5YVfU6xdxcaCEibfREHsb8/p4vNUXleLBYT18nFziWDg52b+CVapNFJ05O+kuPGjqJ8c46Ap2FULeBObzRMPHj+xksvhYr08IY3P18+o1b0BrUJEyOHNnx1rulQutkkWLLU2L5KERDtF1m745NIsokQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jjVPTaB6WafGI2mRnULlgJVyVG3CqqcVMZwG7y/zq+o=;
 b=qRZBEFarXnU/+79QTUPznDPeFJ/+tKDKIDGLgq57fOOiGd9TEmaKo5CtAm5frHByXPl+SILkRv8YUpjqP8NgBRiYHPVbPJkTBaU3ynI31qtJKq7LN1/BTczHFZxk9dUjZvm92wE5KgovT+1l+5zs/C1fAVkTwDmoPYzV5r+RaFoYLNEJvnM2T47jJMKZ0t9kr2WgrbAlHEFwr38qpumxyg9Cdk+OeFye1zS/8F3uDISPccJouzbUDtxUKhi9sz0UgN5FqzxXTxhDSYdiM9oitVzNczav1eqxS31QXullstQ822IY4Sg+g8NvRUdsukKZAXgt83S4zplJMHQ5gDyzmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjVPTaB6WafGI2mRnULlgJVyVG3CqqcVMZwG7y/zq+o=;
 b=RhneqI/BF74DzCZPI053v+GnbOxid1rk+wGHacwpwK9Z6vTE2AE1GUwx/INtl4bpCAQfy/2FfPaBiN1tkiB3qXFu1F69E9QSgnUAsdXY7WcN9pUn+Vo6hd0/TKnE54XDeDcF0XC95xi6QGomWcQq77KtXK7z2ypqbqyf6GAjSeyo0/18IcehW9zeyTKoV1wx3aYpUIz9unIOUuIP7XsRU2pgV+w8tULt6T8cxA8VJiBXv6HnR0ZL9J5TNjFfdH5jPBS7ZkXUmFIOZcqSnRgx3+NiXFr5LcQwkKQX2LHArKZQrl+mF/n0wFc9ujho2aReyUS0d4/tETKAjksiZoyT2g==
Received: from SJ2PR07CA0007.namprd07.prod.outlook.com (2603:10b6:a03:505::12)
 by SABPR10MB997940.namprd10.prod.outlook.com (2603:10b6:806:4f0::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 19:15:05 +0000
Received: from CO1PEPF00012E63.namprd05.prod.outlook.com
 (2603:10b6:a03:505:cafe::84) by SJ2PR07CA0007.outlook.office365.com
 (2603:10b6:a03:505::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Tue, 9
 Jun 2026 19:15:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF00012E63.mail.protection.outlook.com (10.167.249.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Tue, 9 Jun 2026 19:15:03 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 9 Jun
 2026 14:14:36 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 9 Jun
 2026 14:14:35 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 9 Jun 2026 14:14:35 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 659JEZ3S1848961;
	Tue, 9 Jun 2026 14:14:35 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id BFC33142E1E; Tue,  9 Jun 2026 14:14:35 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, "Denys Dmytriyenko (TI)"
	<denys@konsulko.com>
Subject: Re: [master][PATCH] README: update and clean up
Date: Tue, 9 Jun 2026 14:14:35 -0500
Message-ID: <20260609191435.1288131-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260609185247.2659774-1-denis@denix.org>
References: <20260609185247.2659774-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E63:EE_|SABPR10MB997940:EE_
X-MS-Office365-Filtering-Correlation-Id: b004ff5e-b286-42ea-8afb-08dec65b68fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	rE1+YyOaZKO/iH+DPjs0avqKkjez5bCUqqvbmV/Gph5SchvgBHY5V9M2OfGfKKEljfpPzUpc4s1PajeIIQhBoZKkZ1enJyPiMy357Jw7d+HPnXLm3u2B0rqwCYb2Ct7Lqe4LZcULO0+ISDjAm1WudVUAXnZCmxEN0IQBUSvicJSguDVknyZh1/8L505H0zIcu3nNy+lD0O0ubcSGpYO44S2Ok0VuFFj9bhxpf85SkdHyyzXxNNooRheYZfpXRiv+nLcdzz95+q9Pp/G29ZaL09tRdU9BWLw5JTv6iVyyH3qTC654lGn5shQkls/o1i7H82eZ132porCLSWqGtvho3CeOOfu8POr3bc6BmnStgNLIaR0oJTclMnF9gXYF+R3y9qIe+BEYzYv2OKuwscy94NmHMzvUYOB+5CJSOxNVIqMrtCR677HYf6Eu+G5zU+jW+1hL5Oj2VQjwx7sp60mRCgOSOgNzzEJSySVBA7ul6TVQHcbXwqfLkdJ43LIGJzSsriN21qW5WVex9HJGnBNGD0Qm/esOJ0rOMoxeXAq4N/XaCwjHa5xyv3Ixi+gsCGXL76Pv7gAyBm15MeEPXZNpgB7SCPoMmW6L9g1jD3FVkL/qRS0bFILHUHvFCycUXYDihtl1gtRemdCwv5m+sOAchOXD2JwyRsIQuwp6RzNyw3TFj63l8ftRZu9P78p8E57DV3dqbScPYYxwigtY2fabPXpZMXKOzuA1rYQVqDAE7Yc=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	cCgUgfLDmFGq7wQpQGBZtOg1tlSdPmnoniOrxFholHXHnk+ebscMJCfyji2EJkVarIMfT7XgEACg5T6nRd5tBLdKgbgX0oXY5KjL+9BaDf1L0G2Nta6b2C4DOnRucK84TuL2/mvhXnpf4MVBdKcPjTMk/WNGu0DcJW3KtV5PlwQ3KfYp7sjFNl8D1xYJd2zxqYEi92Ds8cMIpf01sVRHruofpuSP1TqGJLbGHia4+kYczEVqhEVp/ZE1rUFnfQM++HK5KJO+2/kiwsyjymxQ2g2NUXsPY7ts5Xj4FCbd9XtyS8mucmne/t20uZSK3WdS4K8W9bn7rfthGptoTRbuscpSKdBrN/wIXsRJB0CI9keD5041d3sAq8gTsbEM1NSkJTs3XWIzWysZaDHFp+6OseJg8WOtDg7SNKYWli5keLCfopMLprOqN1jD8Bpf7HQQ
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 19:15:03.7533
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b004ff5e-b286-42ea-8afb-08dec65b68fc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF00012E63.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SABPR10MB997940
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 09 Jun 2026 19:15:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17567

meta-arago / na / 20260609185247.2659774-1-denis

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
WARN - [master][PATCH] README: update and clean up
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
- Patch Series: [master][PATCH] README: update and clean up
- Submitter: From: Denys Dmytriyenko <denis@denix.org>
From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
- Date: Date: Tue,  9 Jun 2026 14:52:47 -0400
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 78e26c227eee4c7d95f2ae27c2001a51e=
3afe923

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Thorsten Lannynd <t-lannynd@ti.com>
- Commit Subject: meta-arago-distro: chromium: add force-h264-youtube exten=
sion
- Commit SHA: 4c5bed976df0c0c2abd1665ca3cdd7a23ef78845

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




