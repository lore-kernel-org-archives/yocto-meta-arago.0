Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 793EAFD9E28
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 00:07:47 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.84447.1772150861772314339
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 26 Feb 2026 16:07:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=L8L/g9Q5;
 spf=pass (domain: list.ti.com, ip: 52.101.61.23, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pkF97ehHCrTaMUAUrru6Z+nQ2maWdzyobVg+bQxYWCZreN/heIRPMMsz+LzgzIUDjK0gmPDW62p4AGelgYrp4OGUnvLVgsjg77iKiBsQ/SOwBfSYsQDLKvGqCIPBbe00bIWWkGTfiu2HV7UpSropxJPVTYah0/wcL0me9Beih1GyQHO85yj/SaQnXCeBDwTQl2cIill4NmMZVbNiJVBjwycaRa/0bkxAz9E7d1orS1k8j9we2UDWMVCbVKwBYlz8ED+1XWrQ8XOe8KaVwIOcfxi8hunSJqCdbbzjR/V/VU/LMeL76isZVAGHCriDl6N8Q9KYNvfcUZekeZVFlJmYkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YiyWZGyUlrT7S7bvV5riFu+rFYDAp+WrbXAsEEpoxOU=;
 b=sGEQ1CfXUJuqAWfRzRx4a5GHp1g0C2H+zOt1iLeEYtRMEHMF1yt6WeiEXBJTeOo95wISJwDVlUeqwBsFLDNkSqWSAvFLPRAIOvNfOut2obV5f3dgDkxDGtCbmVfsuXtCmUDj/IZN82uhhtnpSVCkFZw6EC8iluL6Zqc6TYQBmUnhamvBfbj1kUZuDCuTNbZSRpE/GK3UmCRYtWQXZpnZT3Y3HDdnxHjfplaJPQZppAZTnrvm4Jfq+XelIQuyS8Gv5Y89iVSdHtm7GU8hpezQdGGj2+LrocX+aQ5vhgbfDaoZ5Nqsz2L5JhidpW3HfLsHMLBXFP0v6VwE731Dn7tL7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YiyWZGyUlrT7S7bvV5riFu+rFYDAp+WrbXAsEEpoxOU=;
 b=L8L/g9Q5ai+UMh/ey6tkIMWI9q2FeT1rO4sYTQLOEeWT5frtJDPdirgZMzNHU8yUgowFxKf5DGEexV7OKDNjnNDXRkSJepsiqhs+railexjlBxOe/UqpkTqg5mrT9hn7sWOQZaEt6PU6cJAz3PZoszL0FD5iy0Xxi9n/bCvbMuaN9s9lKjd4GLmh/43Khp+99cFMRY0120YBJE6yhsKSit1ykEwxQPwRzLNsxfbtwxSkGQZ9bkSoeZm34hse/zMz9AjZKXDQat8+XAJynR9mJRHL2O1MSJ8v41G2y2OK8toIGgwjpllBlWw9RlgQB7yEtt6sZNSDbPVI2h+k1S6Uyg==
Received: from PH8P221CA0002.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:2d8::27)
 by LV3PR10MB8010.namprd10.prod.outlook.com (2603:10b6:408:282::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 00:07:39 +0000
Received: from CY4PEPF0000E9D1.namprd03.prod.outlook.com
 (2603:10b6:510:2d8:cafe::61) by PH8P221CA0002.outlook.office365.com
 (2603:10b6:510:2d8::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.25 via Frontend Transport; Fri,
 27 Feb 2026 00:07:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000E9D1.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Fri, 27 Feb 2026 00:07:38 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 18:07:33 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 18:07:26 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Feb 2026 18:07:26 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61R07QMg2752279;
	Thu, 26 Feb 2026 18:07:26 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 86D479ACF4; Thu, 26 Feb 2026 18:07:26 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] arago.conf: Adapt to new oe-core DISTRO_FEATURE settings
Date: Thu, 26 Feb 2026 18:07:26 -0600
Message-ID: <20260227000726.3659798-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260226234531.608032-1-reatmon@ti.com>
References: <20260226234531.608032-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D1:EE_|LV3PR10MB8010:EE_
X-MS-Office365-Filtering-Correlation-Id: bc801e9f-8ee2-4c04-fba3-08de759437e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|34020700016|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	aBLLl8Co36qMarRc3fU+jl5r2nqitrB/ud21OOwn9yl4eSWXo2Xxeyhfw/bzpNiyKIRJL43bHbKe1TzRJcKi9d6wKWJhRgKht5RTX8twDNVeGxKxluqSFw1KQC/5u/2RnyoIDcXz/vyLnWtBUDplTIJsIowsgpovERZnnl6DH4HMLKA2B3P9jTO5TodQS2oDwNV0MiY8f+sep0jpstIrm5xaNt7JuOIIIgQG+rBqMKnMAoYhU02/s/RXLnTPLtRWTVoP2hRC42SSP3gzjgkAcieMJMZSFfeB9RlTx7QoGleh9si2A4Tvs63VwK6YE5pP3NKI6Z0u0aTGOe1d+uMdnUbfFFXfkPAR1F3Zj7ZdpNfMZgawjS+Gu4cMk992pnLF4pSrFr3FPFj+fdL2z7250Y1k2nA8I6JdraofTqRxuFXDJN5mRXEuYI+E5CL5B/NzcddCV58zgc8m/BPLA0BHDE6wobHBF6IJBpfKhl5hrxVa4160V+/YHe71cbAMTxDSSCOlHdBxyTF/dNSdpufdGc2xVUnIHZla3jna+Yoaq06E/G8IJt5KAAQEzXU9b/BE4xnSHuF+xtXckKA8nLq2itkMFQE8EuhcvYx5GjBmUd+NcYlhBMtvFheHx4FGCle8WoC5I0OPVtQJU0XbMy6b4Ay1U8t3plm6Jnyf095c8EUGa5bEGklAQg8Bz276mbWdyPCmGWNxMT2/xyUOUuQMcEalS5P2Hor0yCvDvOHRx1Xak2rvoCIritRe5vuItjdjz3PZ+TWVzUPMl7REYA748r1/BlBBjUlkbSVkZ0t6dNtIRD+aHVXBH9lZmscY8IC9
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(34020700016)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	25HV0NW/xsr2WQlQQt5FF6dp1bcCpvxCaEZnRpn4C0mMBygzt7Z3aE7a6LHA7Nj0+SUeFdgqzCS/9IYvpQQgTwA68XGxxXVjMJrlSfsIGom39GZub5nKFPou5zO6PwuovenGx1X8l/9VWASVVbiEEeYr/iPpTokJqJBYH654JT78XTwjAKnB0tTdzxSSPN7fg4F5Iyl5AqZBB52yXkVP1a1IkPr2E7BXNQlId/2WjNkcmqfAwxpXxV6wI9HslTogZaUmjChS7WWNGOqT/i5ZoSKF/EWq/TIUfY/F4Njo5AyYSivcoH+E/5eLZguTF+Wl30R4K/yr4pr7mu3F+heTArg81+2HUnEXirWCSpuhBG3ekgSS6RgB93RkBcaH9B+M9xdbsoSCaiGLvWk+L9F8pYQ4rAFOYyaKHChIHoMFHmsg2FnouzSf2FLD1VEiQJkP
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 00:07:38.5742
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc801e9f-8ee2-4c04-fba3-08de759437e5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9D1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8010
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 27 Feb 2026 00:07:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17161

meta-arago / na / 20260226234531.608032-1-reatmon

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
- Patch Series: [meta-arago][master][PATCH] arago.conf: Adapt to new oe-cor=
e DISTRO_FEATURE settings
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Thu, 26 Feb 2026 17:45:31 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 807230f5350971894a55b0a719efe13b3=
1f3a02b

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-next
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: arago.conf: Remove duplicate include for yocto-space-opti=
mize.inc
- Commit SHA: a69841493f652f427ee322e394fb3a040b873193

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




