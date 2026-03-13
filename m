Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91D76107BCCE
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 16:38:59 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.24])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20192.1773419928844225046
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 13 Mar 2026 09:38:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=MnJPX6MB;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.208.24, mailfrom: t-lannynd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w0TlHCf6mW45kRJPVGiyJkapqRcCN7uL8wpShKuNRkUCRsYpPXnMh1kB3sQ884hV1DdR7rDSxUFClexHbMsBTzxhIQkRU4orq0ISk7DvxDdChoUn65WSRu7PB1sDZdY595v9bbMnLbEVVhYPLBXr2qx/HmDvNgKsbGDpV6pU/Z/ecprusi9NtNbmpnrM3KQ6HK3fSG6NpUoZIVTtM/vxOehCB0kY6ubmtQ7thkN2AbOulYUXBEBPMhUzrx6EnDHDWBWhI62/Tgzc/DHouIgc93O8TuqHyppI0XyEBOVNsYcgdzmA48Pz1hNavIgxwjP1MugTwyAWwpTK7mQ7XFOTYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ctLL0mLbu6bnqDReUT28FjWLxsIDg7ehN8JP214QCJ0=;
 b=VHUErOKwWrP8bQ/YR32aGiFC4p7G08xzSYaXxw1muOgl7Jl3601F+J+EfmIzBdxsYtm1fHhya7M1vSM2j5Lg+hFluuLXKsx5MGazQkvhYBBuJ3ZhZBgCDtpAKZCUoXvmjcRsV/QzOprF6JyTgbAxQJFHszqnbQuR0Oq56R+1T4/gh1StJfTAAp6KD4ATaQCdXfMpxRB3e4OSwColhuji7iHeYEWRRMzbI22s6DgbSKRW1UA4nGnFkW/e4r8r9F9EN8IZWHtwGE8rAtA7XDUgGY/QujP5YC1OoU3b63HZuBmxj3hxtVatm7WwgNJhrGFVGh8uRU0lRaCkFWY3huwQGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ctLL0mLbu6bnqDReUT28FjWLxsIDg7ehN8JP214QCJ0=;
 b=MnJPX6MBSa1cTlZWS0G8X/HZoorq2jaJNM67aB1MaRdhJ/Dv9O4WD1Zg3eA5VJL/YW69lTc/iKkVr9QocW+u40FCBg4pPiTkD/QI/Vby5IdTMU4KtA3fZuLmAO8O/QAQ144kVKPSn6S9is8fVHnCA3EBhPZ73Q6TwuIahpIIFLg=
Received: from CH0P221CA0046.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::19)
 by BLAPR10MB5155.namprd10.prod.outlook.com (2603:10b6:208:320::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Fri, 13 Mar
 2026 16:38:47 +0000
Received: from CH2PEPF0000009D.namprd02.prod.outlook.com
 (2603:10b6:610:11d:cafe::14) by CH0P221CA0046.outlook.office365.com
 (2603:10b6:610:11d::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17 via Frontend
 Transport; Fri, 13 Mar 2026 16:38:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH2PEPF0000009D.mail.protection.outlook.com (10.167.244.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Fri, 13 Mar 2026 16:38:46 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 11:38:46 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 11:38:45 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Mar 2026 11:38:45 -0500
Received: from uda0867391-2.dhcp.ti.com (uda0867391-2.dhcp.ti.com [128.247.81.58] (may be forged))
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62DGcjj1862567;
	Fri, 13 Mar 2026 11:38:45 -0500
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <detheridge@ti.com>, <b-brnich@ti.com>, <afd@ti.com>
Subject: [meta-arago][master][PATCH v2] arago.conf: Enable OpenSSL support for HTTPS protocol on ffmpeg
Date: Fri, 13 Mar 2026 11:38:03 -0500
Message-ID: <20260313163803.1352821-1-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009D:EE_|BLAPR10MB5155:EE_
X-MS-Office365-Filtering-Correlation-Id: c2cd4efe-15ba-4a99-3b09-08de811eff43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Awl7ui8fxKjyJr7rIH3bLZvFWh5JaJQe2RkZBvuMQySbRNoeGxXiL5s+lus+r5FxVVc6Kd+1MxkB/rYgs7HIj3/ONPdyqFpYqzFLHCvCwIaiKVOOIBn/cIPQidCBaRezRhycG7XPd2Z3wKq0ijYKpXD7PzIhXM5Pq/2WupJd0QY+AFBAoR0DMTPUkHmo9VEA+K/8S0YqNcc7PXkJG25+IFa3d1hY9HyuRurEhpwgK+sB3iIoe/wjGWxLokS2bFb1uonVLkYEkMKlzsGAFvhlJ42skxP1cp61/YxhMwC5W9dshz1je8NZySMa+2xKTaMyZzH4XfivzXXfnf5Kckl2sqP7vS0prWzv2iwHtcQf1HW56r+E2YvNUJXIZwVMo4vIP2hlmSZknEDq7Un9EYQW/0AgeZaIoH/JSD+nyDB5gWSyNrY2MJzPsIqUJGNqTl37/0jaz6rQHTfj83beBL9I3bYSsFr01c/HnrG+ZKp/pb4GtCkSMrE9u3Wtpc/zlQzN+2xWAq5C/AE/S1bjiDBAVV1eFRWpkMWcmMLRW7b2foDTO7LoZOQ8hJq4OvuyPxsDcATpt43RcT9wA1G8wDocDku/d/WKFuOGqDz+0aUMez+FWSjqsumvCPCLDHXZ7UuXm694fiEjgwTTV7aF4rXJa8PPqYVsqBa7tuT6AMqYzsABIf3CA2cxhz+Fpa3j0vXK2Xj/LtDvrKcke/aoysOrrkvgA/hE1j8lnZfWgU97H8enxPWgCm0nAcdDslEzLmDjP/xwSOxowxRmocnTae4DOQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	tReUoaL3dors595UDyr1sQ2o4gyeC7wNw41su4z11depjTrICR4F/EFBCCug0BXQSTunzHiPRNSEQLMjgwqjApu4FNnRLbiLvALvG5bfYV2jaXTPe5o/mP4BhUu6Oz0jPvlLn5Xiu6OXFQs+ecvv5SkwxcnpDE/Ky5195ZvtuDZhSqnOVsJHHldOSV1TNwykhkg0TrVhIg0sFZmAdbeRaku7kAtjkj7BUmPJ3MZswmFWNPOK0hblHjjZYceCd2gO4sxlHcH5umsWzVHEo3GnSs//YmTk1aSGHg9NKpu4DKef/mvRDuyMhsaeOLHVDIZ61cf0nRvhgR4lmy0Xgut7CB8Zb3zgTcUYKVjzaeuaeN8VhpyB9ZciAFQgvj7ETDout7NgHEkBpDZe1cxHs5PaU72yu8T/i4YfkZ3wF/XYAmKkB/iu+7JOVabxipts8I3I
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 16:38:46.3901
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2cd4efe-15ba-4a99-3b09-08de811eff43
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF0000009D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5155
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 13 Mar 2026 16:38:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17335

Enable OpenSSL in ffmpeg to support HTTPS streaming and secure media
fetching, allowing ffmpeg to handle HTTPS URLs directly such as Google
Test Videos.

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---
v2:
- Use arago.conf instead of creating new bbappend files

 meta-arago-distro/conf/distro/arago.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/c=
onf/distro/arago.conf
index 43d4db53..a021e370 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -121,6 +121,9 @@ PACKAGECONFIG:append:pn-kmscube =3D " gstreamer"
 # Disable opengl for opencl-cts by default
 PACKAGECONFIG:remove:pn-opencl-cts =3D "opengl gles vulkan"
=20
+# Add OpenSSL support for HTTPS protocol on ffmpeg
+PACKAGECONFIG:append:pn-ffmpeg =3D " openssl"
+
 # Configure RAMFS for jailhouse linux-demo
 JH_RAMFS_IMAGE =3D "arago-jailhouse-inmate"
=20

