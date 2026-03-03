Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8A47EDA6BA
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 17:18:02 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.61])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23849.1772558276346543126
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 03 Mar 2026 09:17:56 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Lr8+gPew;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.193.61, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l1WPb6k9v3U0tpyeHJXEslwmkrkzOEFgsWUdjwZeqcFxzoXYxtITRdB0cE6e3l6ay7/wo6c5kThUFXqgICk0aWEuSVnijNPUc6ac4YIqn9JdS/Ua7iGpjnMQsbndjKJByXWYdb/KqZ3fVs3k3fLWxQYnNYghBaa3bbLjpfhYn8nvCFrCUBuHShgqZL11q5Dt7GJ+a/Zygrt/gxTch0CsCBQ610SJ9930p8zGN6AgfgcwkMEumbXb7tGn/jxUIsv825ohXZFuomHZCSZ1EmY4ycIaHI0G+hUpFgzH54w32Dh9+wz3lVXDLWDxn1sIBdM7XBi/2TPtmdCPALIHl0L5jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZGRNLa3n7TwzS5ngCbxJYT9u5TTIjI8EsDBokdTLqPE=;
 b=fU5q6t+xg/vYuL/npRm7mCcxxjDE6EN/7M847hSvdPQ9hcT3LVmL2PaWz2P1ZpsOruCORP5uLv5oR2PA2Pr8SeDP6czUVGxJJ7O8zNSuMqvJFVM13BmZl3Nm4p4Vm+CmwvxmK649ojR5brn2FOD2P6/D9ab42/aZGG3aVmzGnb0q6D2dn8lulwwss/LkYb3sv45aI5H7sQqWl5xnCDjFNVaD8a2Xn+uPxUVHRJhHbKr+9eq71wsGyDr9C/RAl7LOwSe9aKHomyMMi1lbQwiTINuQyWw8At66obgmx7s35uoCCHX7WlAYo7E577qgbGa0pNksFeqj0g3sT6/GLCxezA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZGRNLa3n7TwzS5ngCbxJYT9u5TTIjI8EsDBokdTLqPE=;
 b=Lr8+gPewPsFrHCzoVZpJLTWwcsY14BPf1Fpb5MBTP925sLK0RD+3okS9IZkRW8vtMzTgOxqdtbZoBZf1PreRYpevs0m1X6kPkkp8iJaizt/zAeqi/jc3PUT1jd3kt/Gu2+fn2NPWOLP8fzfydF6nzvIt+REf5smTmLoxEJ4KMzk=
Received: from CH3P220CA0013.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1e8::12)
 by PH7PR10MB7053.namprd10.prod.outlook.com (2603:10b6:510:270::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Tue, 3 Mar
 2026 17:17:53 +0000
Received: from CH2PEPF00000144.namprd02.prod.outlook.com
 (2603:10b6:610:1e8:cafe::b) by CH3P220CA0013.outlook.office365.com
 (2603:10b6:610:1e8::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Tue,
 3 Mar 2026 17:17:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF00000144.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 17:17:52 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 11:17:52 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 11:17:52 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Mar 2026 11:17:52 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 623HHpGu3007344;
	Tue, 3 Mar 2026 11:17:51 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vxTNX-00000001eIc-3zsX;
	Tue, 03 Mar 2026 11:17:51 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH v2 2/2] ti-test: Add ffmpeg and mpv to ti-test-multimedia
Date: Tue, 3 Mar 2026 11:17:51 -0600
Message-ID: <20260303171751.393226-2-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303171751.393226-1-reatmon@ti.com>
References: <20260303171751.393226-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000144:EE_|PH7PR10MB7053:EE_
X-MS-Office365-Filtering-Correlation-Id: fd8929de-60af-41d6-961a-08de7948cd81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|34020700016|82310400026;
X-Microsoft-Antispam-Message-Info: 
	WZtMvpkC/6YwYUeTiRdVmPtNqJ/8XBq7Qq5jZQMkzPZpBECwChp9AMUBxjMzifkKjOfeGjnqicC5i4XcoiZl4fXxOy4aBVH7IG8Yl8ktAyHKnVVPwpKD0alG+8nAFPw/K1HVyyEdPCsHMlltf1SSy8bDEkZKbOpoB1vCiwR2K8XkIJgW17QoLv0dxU8ITLCciyZeEkN/k3lZY6h7Gf1oD7vcopW6gGOnmrujyILUe5gP2AwvrstFybaoUT1hB0MEr6G/55GnTr92LvK8KhJwjmBu9xl/7znVHqhD53xMbWXY+eknQmoa2LQJCsJXfnI++mWHtHNi1QahxPvPAlWCZtsIecpxYVsGosoROgTjbQU5sgz/F4L85zC2HK+/ASN6gRLUgp2LXVC7DyHPr6/G0ew4fSMtTWn+9nPtvynCs4mYtM3IfUm+51/yDUmC11+Rr9xM8k5nBhymB/3a9TD2EjvWwrq4nXx/7YHxY+vzxxIz+JlzFzAppXBZPupFzXNwG29HEuR2sIHzqfGxsBI3A1xs84Bp0puvObbVr6eGcNxB4gwfB9fePTdz82fnNx7N1KLwNNoxfsxq7/IqxP8F2MhfciFJtdTMyrPCRg/FnqUzE5nEFUzERgPHWqdqfZPRqeWybPMNTImZM1lRVGIo3OJ3UVm2F8dKO9YiDTPLERI8S/z2JTFhBY8xKhrdqqwsx2aA5oWFKkY9P64Ixj3dGXPXDYlHcAES25FJKYiHvHgO7PkZUF9fsKENjdtlTiJTHU2f7VR88RTureIbDPg+UGNIfXzceWKI8Ss23F3YY1J4o53AO/ibRXSc2/Vkkkf0
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(34020700016)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	2VFZcJHPCbC7FkgDGi1kooO88QLPC+s1tLPDJYHzyP57HQV0T6o1opj+nyHNhWPlPD7goUeHdNFRQhlsP4O0HSxv1QxC5aH+MZnP8P8Qjm7ioCLd+rYoE11BTwxcyVxyqgfwimHzOCOch+JiRezt8VPrBiEB4FQwGqhDODoo0/EkBaoBuCSpGGXDGBMXVqItNPK5hzPil4ItH56LUVpEBBapN7plUgoHuB8zHwAr+WxzFXKIRH/bZ4oGY1c8UNLPGY+DJ71vSh9fh+GdjTM1jsATDHRl49whTKPh4j9gzV9pQs4LAIZ7bgZ+FT+yln8Wa7OfjRBUjsIhyyTAxd/xTe0Cpy5drCBXQNT7dNFYbP4VagRKNDID4J+rYdwKUGIaatk2g/3PQy/qLT5QaAcI8uF6Wmy+7Sa8QxXWE/4nMfHmBu475ZO8+jSRVoda1qrq
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 17:17:52.4610
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd8929de-60af-41d6-961a-08de7948cd81
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000144.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7053
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 03 Mar 2026 17:18:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17204

FFMPEG and MPV are required during automated testing. Explicitly add
these to ti-test.

Also add the commercial_ffmpeg setting to LICENSE_FLAGS_ACCEPTED for the
layer.

Signed-off-by: Brandon Brnich <b-brnich@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Move ffmpeg to be tied to building a ti-soc to bypass yocto-check-layer=
s
    error.

 meta-arago-test/conf/layer.conf                       | 5 +++++
 meta-arago-test/recipes-core/packagegroups/ti-test.bb | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/meta-arago-test/conf/layer.conf b/meta-arago-test/conf/layer.c=
onf
index ea0a3398..7e8bf1ab 100644
--- a/meta-arago-test/conf/layer.conf
+++ b/meta-arago-test/conf/layer.conf
@@ -26,3 +26,8 @@ LAYERDEPENDS_meta-arago-test =3D " \
 BBFILES_DYNAMIC +=3D " \
     qt6-layer:${LAYERDIR}/dynamic-layers/qt6-layer/recipes*/*/*.bbappend \
 "
+
+# Codecs in ffmpeg with questionable patent status are not included by
+# default.  As this entire layer is purely optional for testing purposes o=
nly
+# and not meant to be shipped, add support for the ffmpeg commercial licen=
se.
+LICENSE_FLAGS_ACCEPTED:append:ti-soc =3D " commercial_ffmpeg"
diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-a=
rago-test/recipes-core/packagegroups/ti-test.bb
index d3458b9d..c5bad051 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -87,10 +87,15 @@ TI_TEST_GRAPHICS =3D " \
=20
 TI_TEST_MULTIMEDIA =3D "\
     gst-devtools \
+    mpv \
     v4l-utils \
     yavta \
 "
=20
+TI_TEST_MULTIMEDIA:append:ti-soc =3D " \
+    ffmpeg \
+"
+
 TI_TEST_NETWORKING =3D "\
     bridge-utils \
     ethtool \
--=20
2.43.0


