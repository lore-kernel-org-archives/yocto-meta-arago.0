Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6CA31048924
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 23:43:15 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.40])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.109920.1772235790435239880
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 27 Feb 2026 15:43:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Al4fTz1J;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.85.40, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nTjnn9peWQfRGzfGRxpuE3kCuWF3PObjxYewgLQE0NCWySxXMrFR8czJIstuePCjH9Oxhdl2wSXAGrcYapyM34RY1lr/IrjGVBSKsPootKOS6ikKh3mRESOzOPZYMxnbTDNXRTEFVBEaimkotTfoh1pxHITnZI+NTY2UiZ8nnhuCiDkfvtTZHO3UeNX+5UuFC5eVM5R9mYsJtGIfOOJNAo5QkMs4SFP/2BOIfmLxklFOs3WWC6mbenXnDxZ0f66DZjZgm0fIXU8tp7lXHSMuW2xERmsXc23Ghfz3K85XIX9SEJWEJc4FfA3mP4tCgxlhPrMycgSF0dsDgXEKteuIPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j5i9jiCu8AYyjekkUNrk5W0jGQuGatiNVlEwv2zSRSI=;
 b=FNcK8z7YA2AF8EM07jGehcbwc8TUuDP2UIyOlOX2s8nl/V1CX9yxp/2IkV2q9ax3a50AUcpvGl0ot2m3x9znf5qh1FZgLzSKcP30As4X1AFhRer73Mbo8h8vRoNXTAoAZpd9h9qHdDMGYXBvy/WSk2SuFwGyccqHSVNeoNs3NAogvGFZh5nBzdX6AIxeg3zD+T2GkFjhFmYrBeq5EAxdbS/Vaf4Jfk2/NjWPrAM94FdHyiqTEtA4nzET7E1mFnQ96orAFmZlXMb7Dfj2Kv/6I68uiI9qRbo2KoiK5k71B/byo5mRpkuZtOIe1JyIp77PxO0FqWr9lxaKlCdanvR8nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j5i9jiCu8AYyjekkUNrk5W0jGQuGatiNVlEwv2zSRSI=;
 b=Al4fTz1JjOmbGslwvrbdkfa9z/kwFZ/xBRuIz3YHVujaXcSkXPCu3GT7QtFhJLiY6Sa950wVCrQaib/p+d8/nfSYzcRs3Fk95XcpWu3a+PUOqCpFbBkK5htuuW0XUN7aM4yqDycNA6tbvmzKS3mH2Xj8uZPwXvpRB8u7vMbwF/0=
Received: from BY3PR05CA0027.namprd05.prod.outlook.com (2603:10b6:a03:254::32)
 by DS7PR10MB5006.namprd10.prod.outlook.com (2603:10b6:5:3a0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Fri, 27 Feb
 2026 23:43:07 +0000
Received: from MWH0EPF000C6190.namprd02.prod.outlook.com
 (2603:10b6:a03:254:cafe::e2) by BY3PR05CA0027.outlook.office365.com
 (2603:10b6:a03:254::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.23 via Frontend Transport; Fri,
 27 Feb 2026 23:43:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MWH0EPF000C6190.mail.protection.outlook.com (10.167.249.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Fri, 27 Feb 2026 23:43:06 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 27 Feb
 2026 17:42:47 -0600
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 27 Feb
 2026 17:42:47 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 27 Feb 2026 17:42:47 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61RNgl6v384207;
	Fri, 27 Feb 2026 17:42:47 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vw7Tr-0000000EkF5-0Rn2;
	Fri, 27 Feb 2026 17:42:47 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] arago.conf: Remove temporary hack for DEFAULTTUNE on armv7a
Date: Fri, 27 Feb 2026 17:42:47 -0600
Message-ID: <20260227234247.3514340-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6190:EE_|DS7PR10MB5006:EE_
X-MS-Office365-Filtering-Correlation-Id: 290437cd-e888-432b-bad8-08de7659f525
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024|34020700016;
X-Microsoft-Antispam-Message-Info: 
	h/flvizrfjM3TVq7+Nb4Yu3PNOI0URfW4jdQjYUdPQWXkU6TK4iXGGZ+zgNT8kk/LHWuTFrVWFCZzxkNSp5JzT9MTJ/mhmWQFBRHk3l61OnjlcHGS8JvtDgMKxX3AVJCdYJFzPqy4sKuOEW39/tjSyIwBMsJgmNRgr9OXN+peBwxHC28zw0fRc59MYa83ILu8pa4lVytK5uXZmtrw6NcwcMBuE6LwyXcNNykSCM7xCmVufFNudoP5KXliuvxjAxzFcvzHN3SRJi6vUUMOM1LOhqJCCH2VAJwQnN9QG+cU2Bbul2V+xnbbGunl6eUxtCu6kGShr9SVBb3BeI5yJeeTH3SsdBlGA28TL9KEigGwdc4J65wjbd+EwxQZ4v/YJ5O9Ie+cBkW+i29X/Z8Ar1UyfJdRH00jwhwTL9HB/K0oH9OB2ei+G/PKN+q7myhEymFn6PreI4qQJRdZ+lrNcCn6he7d0F9FyNFIrvo+nquPe5pTkotlUZzoletYtntn+ZFqqNyuciRpZAq1nR575T300Xi674C2Ife6clf9/CdDfkK7sz2HCuhiwA3ky0LVIocd/x7uFmFtWeHbN144JYmuBEfKc/SFWV3Zs4KAnyI+oODaPAE+/2f4vaJAAXhv9UdvFGjrmCHIWYBksxR33B1MdQxvjgfpTTlT8Yo6dx3/8Ka0B+ANEa8zlOsWkCPLfVsJaFB5vFyaCKdnso5dzDNWWzx67gdqIwmIK/57KB6mXHdmLAJX8bJCAczWr+SgpVlTMzozuYTwZAVk8Go/OVMTRGZ2pZ2lbpOzxVQXKeEKifEuqEza1JsVVwRWxFeYv9oh7lUtyLH5ziKeSncAx/xKQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(34020700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	BVUWqTGtoWx75LLKlHiwUX/Re9OfGlqPZZvTUSeuPg2Jtw6HDxEaPhuEpzd6+FLu8EUmPr91Wsnd7UbxEo5X/IpssGzFWTI5j/WNmkWCGjqBJwbxi5afra2yuPIO26x8DlijynCdCQux+DmJpP2Q4hB5LN6AaZ0+bFKn7UoiFiG/JJTrlV0AaU19Gl2fLQclqsTKMLkSUPTA3O5Ep7qJ8cY7v+qjnVmVkq752LI17m5uElCzxZnCEb5WjwPELY92SsJjpydy3RUPtoFCcB96BgVKMf7N7UXwswIvSrslnaX685AFxQk2uZrBLnawHkMc3d+3L3FMcJNcngNNImnVqv27ccxpLRkoeUJTeYjIK5zOAfV9FljNPwrYphNK1W0n57Fm/YCRwFxOBEp6XX+BRyH41NOYkIzL/E3KvyroqOs+kFCO+j1V/jNBWZCSrHIY
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 23:43:06.8927
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 290437cd-e888-432b-bad8-08de7659f525
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000C6190.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5006
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 27 Feb 2026 23:43:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17162

It looks like this temporary adjustment for DEFAULTTUNE on armv7a is no
longer needed.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/c=
onf/distro/arago.conf
index 60d3d0d4..fb5c703f 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -149,8 +149,3 @@ SKIP_META_VIRT_SANITY_CHECK =3D "1"
 # included by default. If you enable any of those codecs you should check
 # if the below acceptance flags still work for your software distribution
 LICENSE_FLAGS_ACCEPTED =3D "commercial_ffmpeg commercial_gstreamer1.0-liba=
v"
-
-# Temporary hack to fix a compile issue on Armv7 platforms with qtbase.
-# We are working to reproduce this error and submit bug reports for this
-# issue.
-DEFAULTTUNE:armv7a =3D "armv7athf"
--=20
2.43.0


