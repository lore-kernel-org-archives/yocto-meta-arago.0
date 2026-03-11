Return-Path: <b-brnich@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A7DEFD88D7
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 01:29:21 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10883.1773192550840820598
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 10 Mar 2026 18:29:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=ky2gHWex;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.193.64, mailfrom: b-brnich@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dk+BYMpxwfr7BCSMhwaZ45QH3Y2E42Nx90WZhqMbRBuSzlkvC4fGpzQmS9Bk0nwhTxGsv8KIEiwAFSOqJVgtVAe0n3D9Gw8yG9BDN9R8NOQ3AR/zVyrscS7OB9Yg90UdXj0AEi6WN+SHrzwb9gO27hXS443q1mPYKN630xn+w4Jx9Mtz8GxmQDqhKh93skL2yI5wNhxuHgBONQQWZSFbb8NQZPuQ+HDcHWvucgc9cgYee63UgyomkM8f9sLtA79kvnJ7lWWzUDd8rQfk8swWzHf+H8Fz5C7dazc8rO3yVLc4KMapTRTY2sXKS4yHPBLbuf2O4R/0AK5ceSzfF4Fjmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1zsSWUlagxCG7gQcW5INnfqZokk4UlI2ozzNauV41so=;
 b=ybmDqgB/ZvsVyj5p5QVgWMTmmGvlXMgyBLu6DgLSpWZnPcvADiKGuEg+UEB78CM2qSrsiO1WVt+THWllfcF9CO5zZHKioBaWnttte3GZVYRKrJs9OKrRHFKe1J4lTenrr8VIq4d4PtXt5wVgOJ91YrpIGLA8wK4SpN6WheJfiJ/mVST50t5IXMIAMr8ufGgpQNPTLY9zMPHQ4eCy8vTO0VD2137BIGLZ0ExhnWxENjXt6qOmpKtrJ/YemiUl2M5KDTUufu6vifstB6WV6XNQpInwWn/wHcvWWL/RGBxHY4uTd036GO3XU7J1XEJa5Ad5awRdHoFn6PCtZ10B37qF8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1zsSWUlagxCG7gQcW5INnfqZokk4UlI2ozzNauV41so=;
 b=ky2gHWexiXWYbPdjL56WV0KsTJBmdKPpnU2XcapGMqq5data+SKwwPnLfJsNGUQQXpAThAN48sYCfKLXvzD29bYEbN/U/314OuNMcOqqP2OfbSPs0V97sx3xkMdv2XNUOODaJkbJFyub9lQtIQA51iYxrX+EepVaqLGOGpR0xp4=
Received: from SJ0PR03CA0289.namprd03.prod.outlook.com (2603:10b6:a03:39e::24)
 by CY8PR10MB6907.namprd10.prod.outlook.com (2603:10b6:930:86::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 01:29:08 +0000
Received: from SJ1PEPF0000231E.namprd03.prod.outlook.com
 (2603:10b6:a03:39e:cafe::81) by SJ0PR03CA0289.outlook.office365.com
 (2603:10b6:a03:39e::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Wed,
 11 Mar 2026 01:28:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF0000231E.mail.protection.outlook.com (10.167.242.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 11 Mar 2026 01:29:07 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Mar
 2026 20:29:06 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Mar
 2026 20:29:06 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 10 Mar 2026 20:29:06 -0500
Received: from b-brnich.dhcp.ti.com (b-brnich.dhcp.ti.com [128.247.81.69])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62B1T6oC3605774;
	Tue, 10 Mar 2026 20:29:06 -0500
From: Brandon Brnich <b-brnich@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Brandon Brnich <b-brnich@ti.com>, "Darren
 Etheridge" <detheridge@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
	<j-sahu@ti.com>, <c-shilwant@ti.com>
Subject: [PATCH] gstreamer1.0-plugins-good: Fix Failed Negotiation in Non-contiguous Formats
Date: Tue, 10 Mar 2026 20:29:06 -0500
Message-ID: <20260311012906.3348907-1-b-brnich@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231E:EE_|CY8PR10MB6907:EE_
X-MS-Office365-Filtering-Correlation-Id: 71070fd5-554b-43d1-62f0-08de7f0d972a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	5/R0GWtF2AF9uzJDYic9LoSGqHybaWwy/7KBrXlC9T4itdAwgVeKWlJwC8PhLGWWXNHEgXOFuUcvzJTJZ2SmKUl9QgKFQ59jHlOQmADAApJ+jYSmZVpFkanTL7IrmdPhQdTs4+k7wNBdc6fzcyo/Ib/qmtB2QGgoGOyIlChDutKafQhFVExdbKCJsUUP5SjIRO1ifC5a96JhYzOtV0iln/+uZsCtvcAA8PqdcoORY99eWfBSfXSOcCzgd0728NSoIcwVNw+AIpvc+7on3a8lrIlREkINUfwe3NJTj0Jz6tKyTWnXekvsEC9N0faCXp1veUb/au6F/ikTuiV9T9O5/9xTTERe/Hz/YcbJOIHTlljT2O5eiJUPRLTo//wX9l4TgJtZwaVFLyMyfDC9cA821BZuzWws0qfFNUuCKdyeSuAblZdJ6q6iu6USBlugraDClbbBuev3ZwakJpAlHV+pKmrK7AmBpHU/M7u3xJb+6oxYFkhFv/aESdVlML4kacorNed6xouXhu/xCdJ1ajB0VlUNcNjyXOb8eBx7yWMufxkoKS3muAWeL2EWv9Sn2Z10LnebmyVxF/v+C2wxcF2Hk1lNYsjtaJ49qhf0wvNUpMuMYUdbLt/HO9e/mF/NHW6Z+ou2yerQdr6L1IzIrAVXd6ivhJEcaf2VUfGtwAIAXVoz+n6p1H7pmFgFB9TnT1koWFxOVRkKZgmCFb96agg13oqzKPImKg1j5jGJLbbBHGqkdJ++fAcWffavqQ66qRMiMM4BNPq0mlkY44HT0EmCaQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	TJ4zFMlVs27e/oiyhCIuvAaAmJ9usNlq+dqI9KfpSf+WpDbaDrQ0g7PYbVSBe2IiyBMPOA54c4MlCI5oi1BL/bq4LWKruSTNx46ZdpkhsQfV64wRVqgI11GJx4tmGuzYzdzH2sSbVmD9T9jF/UhlchdCx7pFz5Upx1VEFPaTMOVTBiTLXtKEi4Khma1mVsmWUbq8uyW+X7YalbvDJCf5BwA936MaM3L4t5UH2vkgCSJN4WA1Mrh1QTbaow5+DXuGsgRIvg4/KiLWS0mieNFjS+3g/TaJ4ItNRz8U+yKLxRTgsr3PSFTgO+uNblAefyplCf1CzU0A8nIwwmfRburYB/l4QCj7ANdITZNdNSZF5K+N3qoaOkm4AbJtUBCzcjLMXmiqjrVeG2hdQcw/znhTYvm8L75CcOoHGCzfjInBtSdTvRHYEIeoH7zMOytUaMjJ
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 01:29:07.8890
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71070fd5-554b-43d1-62f0-08de7f0d972a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF0000231E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6907
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 11 Mar 2026 01:29:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17303

Upstream gstreamer has introduced a new method for mapping V4L2 buffer
formats to their respective GST format. Previously it was a big switch
statement manually assigning all contiguous and non-contiguous variants to
fourcc and fourcc_nc respectively. Formats that didn't have both options
would only populate the fourcc. The new mapping properly sets the
corresponding fourcc/fourcc_nc. This means for pixel formats that have no
contiguous option, the non-contiguous option should be checked prior to
pipeline negotiation failures.

Signed-off-by: Brandon Brnich <b-brnich@ti.com>
---
 ...pt-non-contiguous-if-contiguous-form.patch | 36 +++++++++++++++++++
 .../gstreamer1.0-plugins-good_1.26-arago.inc  |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreame=
r1.0-plugins-good/0007-v4l2object-Attempt-non-contiguous-if-contiguous-form=
.patch

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-pl=
ugins-good/0007-v4l2object-Attempt-non-contiguous-if-contiguous-form.patch =
b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/=
0007-v4l2object-Attempt-non-contiguous-if-contiguous-form.patch
new file mode 100644
index 00000000..db7e6f0c
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-g=
ood/0007-v4l2object-Attempt-non-contiguous-if-contiguous-form.patch
@@ -0,0 +1,36 @@
+From 8d29018dd31be2045f6724db0942ae1a7da0a789 Mon Sep 17 00:00:00 2001
+From: Brandon Brnich <b-brnich@ti.com>
+Date: Tue, 10 Mar 2026 19:47:35 -0500
+Subject: [PATCH] v4l2object: Attempt non-contiguous if contiguous format i=
sn't
+ present
+
+Gstreamer previously had logic that would set fourcc even if the format
+being negotiated didn't have a contiguous option - YUYV for example. A fix
+was sent to properly set either forcc/forcc_nc properly. For formats that
+don't have contiguous formats, that would mean attempting non-contiguous
+options wouldn't happen. Attempt non-contiguous formats before erroring
+out if applicable.
+
+Upstream-Status: Inappropriate [TI-custom]
+
+Signed-off-by: Brandon Brnich <b-brnich@ti.com>
+---
+ sys/v4l2/gstv4l2object.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sys/v4l2/gstv4l2object.c b/sys/v4l2/gstv4l2object.c
+index dbfe4992be..b4a7c32f31 100644
+--- a/sys/v4l2/gstv4l2object.c
++++ b/sys/v4l2/gstv4l2object.c
+@@ -2167,7 +2167,7 @@ gst_v4l2_object_get_caps_info (GstV4l2Object * v4l2o=
bject, GstCaps * caps,
+
+   if (fourcc)
+     fmt =3D gst_v4l2_object_get_format_from_fourcc (v4l2object, fourcc);
+-  else if (fourcc =3D=3D 0)
++  else if (fourcc_nc =3D=3D 0)
+     goto unhandled_format;
+
+   if (fmt =3D=3D NULL) {
+--
+2.43.0
+
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-pl=
ugins-good_1.26-arago.inc b/meta-arago-extras/recipes-multimedia/gstreamer/=
gstreamer1.0-plugins-good_1.26-arago.inc
index f64790bc..9e418b86 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-g=
ood_1.26-arago.inc
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-g=
ood_1.26-arago.inc
@@ -7,6 +7,7 @@ SRC_URI:append =3D " \
     file://0005-HACK-gstv4l2object-Increase-min-buffers-for-CSI-capt.patch=
 \
     file://0001-v4l2jpegenc-Add-support-for-cropping-in-JPEG-Encoder.patch=
 \
     file://0006-v4l2object-use-actual-stream-resolution-for-encoded-.patch=
 \
+    file://0007-v4l2object-Attempt-non-contiguous-if-contiguous-form.patch=
 \
 "
=20
 PR:append =3D ".arago0"
--=20
2.34.1


