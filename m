Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1989.1792529822129313274
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 20 Oct 2026 13:57:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Z0Yjkw60;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=l0mzgtnE;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KIG8c33758893;
	Tue, 20 Oct 2026 15:57:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=S3w+OakAPjTvd
	HojAbAAxzuk1I5HEYbBOtq/K1B3wjc=; b=Z0Yjkw60/1D2/TQ+kkLdXsw24Sw91
	zyGWr7VsWm8meuZE6THSnGqTVawzrmyGYqC9HZAsr7E1fiZha5AaLTbxzg836ir2
	NOlP9jkQtRDSt+vsi1k1YHuZ/sXRP9INDQyjFkYNNubdxnQKOGhP+TgPCIw06YUz
	3z2ezffGE7dx8zTeV/Bv554A53g+GvS3LIvBQRTH8MaUmxtbdTl61XwZHWLNqL1/
	uozTjjiKuPmj1Po6doKDI6JWXLr76MLhgHhOQcSjt5V3XnpOpDVkIE8o6/BtQbnZ
	E0913BbR4L0WV0NUT1Gn+Bj+SjgRUZh328Gumv20AhwyDqypGsXCYn7Ig==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010040.outbound.protection.outlook.com [52.101.61.40])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4he4qrc2tb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Oct 2026 15:57:00 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fsj2OaF3Z/yvBE9i9cMh2xw48RyLz3ZowAI9urhwHfR/q+Eke+8e5pTcsqdPTE/hInhz0eTAJnzohkD30RmtXGPysSJdEUAMZMISQvXh8rgNBZ2AY0M8RAy+JSBkbB8ZQh++ql645UfR/8ykTSoA9Ff38SnNImhc6IiQbE+7I4LmdexsefhyMMAOs+cyzjxLcZsvHQFnpcY/il5pfpF2zlfD3jNA+U8eeXqtObP+7MFV1xDBKmWq91DSufRGu8c1VVvU9v+7+c3P1qmvq2xNeB8e310OGrqzpHw4PwNgSzLYpY3zhRoh95SbxnljDnKzxDGZdAPhHTjwV8rG3JRlBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S3w+OakAPjTvdHojAbAAxzuk1I5HEYbBOtq/K1B3wjc=;
 b=uAbsa45tJ7VWmJl1N1ajfpKGIqyrIqrxjyJSCwTdLc885FFtyF56BL7ccF48WQi4AH0QVx5Tl3WlLNkpvWwGz2TohOLbFnIXWG/IW3LAX/AqjEEC/9GZV3ZML1rXCP3wtwlCOXX4w2CQNmLwwqmnugRce9vftenRZCh+dYFwx7sOsKUSbDRuonCjDtw1ljDpI5BDI7gJruSiU+hQONvc8dMQ1IaLyJisx+6wvq+VTlKfdp8WOZyvrgzvyk+F9XlObgSO8WNAADLufXZVnKzK+NHiMVfv9zUKCzUjdfUoGntwQs+AkkWukVhyK9UpstG7rGuNkeklpsjWu+adJgXn2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S3w+OakAPjTvdHojAbAAxzuk1I5HEYbBOtq/K1B3wjc=;
 b=l0mzgtnEjqsMay28+QiKur6+hpY8cTGmaaFrznYrPleU8kMP0Vm+UK3IYVo0sQ2x90zli9z53DlVFXTQ+kPOYxfPGdl4LTA7tEFn32zFkGbztfBcoDb8i4y1XrSceXpZBQNaNIjaDxXWELA32OxoxoGvxQv+f6GJVbNWqTc5510=
Received: from SJ0PR03CA0116.namprd03.prod.outlook.com (2603:10b6:a03:333::31)
 by PH8PR10MB6598.namprd10.prod.outlook.com (2603:10b6:510:225::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.7; Tue, 20 Oct
 2026 20:56:07 +0000
Received: from MW3PEPF00001652.namprd21.prod.outlook.com
 (2603:10b6:a03:333:cafe::3f) by SJ0PR03CA0116.outlook.office365.com
 (2603:10b6:a03:333::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Tue,
 20 Oct 2026 20:56:07 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MW3PEPF00001652.mail.protection.outlook.com (10.167.249.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.0 via Frontend Transport; Tue, 20 Oct 2026 20:56:06 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 20 Oct
 2026 15:55:20 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 20 Oct
 2026 15:55:20 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 20 Oct 2026 15:55:20 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69KKtKP62224111;
	Tue, 20 Oct 2026 15:55:20 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1xJGrg-00000003GW2-0IQV;
	Tue, 20 Oct 2026 15:55:20 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] gstreamer1.0-plugins-good: Remove upstreamed patch
Date: Tue, 20 Oct 2026 15:55:19 -0500
Message-ID: <20261020205520.778398-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PEPF00001652:EE_|PH8PR10MB6598:EE_
X-MS-Office365-Filtering-Correlation-Id: ccf7c961-7939-4504-e9cf-08df2eec8fc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|23010399003|36860700016|1800799024|376014|6133799003|18002099003|3023799007|10067099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: bZL7ijH/cCnaOhfxe/604OdJFkUGHaeNFAqYPaNcMTWxImNTTfH6sqHP51buGFXtcH/TqTJj2ZR1jYxHdoNYcJ95noqBI/LGKIloWnqrfhndkZGt8FXFeNwsuj5pJ45TN+iN2RWe+YeStHLGPVeX2GOg+zeRRtz8CTm0b0He1AEhP4bhEqsF7cHMjlQnW+qFs8/axmH792LafYyp/ulibOqwOOoO3mCT9ul/XI5cp52VnSshtCBwGa/odiHRFWUX2fBof2niH2g1Ntm2BL2N9mrG36VOBY9w4ZTl9+tkX2XbJj4BHGgbJu8pSoOrqsA/IEfR3pjic2VfWcQ8y3HrqPMmKguI69QgwPk9ld4VeBMh2s5o454ILGkldPP55/oPp2ZlQGud0BIapwGdHb34MNKSKscv0cHKbIFhdub8moLcJvhROaHXBCVLJ/ntJI04EOIcAGGeI2HX0mYZxZgj+x7IGXtzswibhzcSAVrwJOxjQJYipyc5JQ+bS9B9xlRNH9Ogn5iCCMsQrGKQ8Iq6YYuZMfFBWvn8QlpRrVGGL/G4vrm7l4Lil5d2tFoBmuhfrm2pb+sMJ5AQS74iTJWEln+wJ1f87BGWPgJ0+toSEwH87ho0Bw7pMKF45UpgXZfm
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(1800799024)(376014)(6133799003)(18002099003)(3023799007)(10067099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 5uok5PmhDkXqkAlcQ4Tx1v404dvXgZkvXDRO/OEc4jWpG122Ck/IGZt1LvuhoLSZOJ72dklxjQ0ChLo0nFDT9VmitgAQ7/p66+9/OMM3eaeFjoT/BCG/+zGRkiFdX5x1Tg7QK8oLVNR6y98kIOJQhK/GqXA2yZF2XZ6zk+6EpV3hZbo5qgVoymEn85FvU5bfdvUJJ6BRHv5UIRMv0f5QpWAiWDk/Yv9Ej5Y6Y7zaBsg/T+oySX3p7a9375m1ds01cp8cjoxbU/U/++W7b6/6cvjbtzDNoL9Vevqk00l9w/KhbCIrLJRPVzfw9uGERN6PraJZMvCRb7WWcQ8uHx0G+HqRlR0yELDNaHJjiuXdfXkystyXQJSVponAT1Yn0KGvWFY/P+lyv80DL5VhczDsJSB2MKD+NKSedAgj1YEqiI/ewE2kqkeC+QTjmjwEuFbr
X-Exchange-RoutingPolicyChecked: U7hOemXPfuA0d4f6oOf5DdCNifvC5zLocdOt5QW8sOsRMAx2U48yFTJE4GvmFaLXgxZmYs5/PXOTzIcLqwz9q0807YgfOg6y+fzDEYmdgM+rVSQlX15OgIJOV+CmwaSJLMhlmyL+TDYz42abBf1g65Xoa5rhs1+DluZCJ3eN7zBdoUVr29mXJspioNbEOKVEPwfpd2LSy72cOGrXjGiJxphqOQGhjurwW+oDzeWlHVzhRB0dA3ijVAenhX35L7AwJPzFc8JAD4d8eo+Qd6Qhb+2UumXNclSOf4AFI1I1uBan6cdK0fVYrg/zX6JJnoJI893M8n1GmoC1m37V5mRILg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 20:56:06.7595
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ccf7c961-7939-4504-e9cf-08df2eec8fc1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MW3PEPF00001652.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6598
X-Proofpoint-GUID: cULi6COT9BCYVOK_ro_AY0FwJtKwFIIw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA4MyBTYWx0ZWRfX6me9uVUHY1nx
 uWGAkFvXm3bO637P1+F3qJqUGBzklaEXy0x3nTyjESXTzqT19nL5f2q7d+a8bkRUnKQ/lxDFg4F
 E82WdCKZ1UiweJQiS6I35eXMN1m3CWo=
X-Authority-Analysis: v=2.4 cv=LYypeTfi c=1 sm=1 tr=0 ts=6ad7d59c cx=c_pps
 a=v5NpUkBk8u87wj8Ets5Xkg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=Q4-j1AaZAAAA:8 a=e5mUnYsNAAAA:8 a=sozttTNsAAAA:8
 a=O-zgNZ8JVbrH-Mjdxc4A:9 a=9H3Qd4_ONW2Ztcrla5EB:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: cULi6COT9BCYVOK_ro_AY0FwJtKwFIIw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA4MyBTYWx0ZWRfX2htziNbyu/2p
 MWTm1Za6hsV73Bv3qxpYiPd/MYIBYQuiuhmoQyVdCJhiln6m/Lf8qU3n+e6L+OvLiCKR8NyFt7/
 OplGH8K32okgFGtapptS6D63uym7VwcheGQZq86gkXm+WvvxVwEndGq43JwK21AikG/c7TQlKnS
 jMc+AzI82W55mD3j33cwreyp5IRbH2ZZAs8cyolJOYHuw2sGuMg+/Si6Zd+ObUO7ZsvvUR6wn08
 FpuNxntdDvUEpbp9fQjrlgmNzA7druvWvM8h4ESb/ExZ8zy3JJ17+UV4jH7mFa2oo1W+6IirMsb
 jHk5ygVXPqOl93JUutEVJn7hZxLQTJtp7TtkR85Y/QWiqgIuYoWz4LMs/0CQWR81koSRe9Hieyn
 wiv6HCp9ZvXZvMoohqOXixkLeF8z0yuarQZWYw9D5HjfL1fhl/CYNuW4HAMwSTjRWRaTk8NDzWg
 jeGW5hFPVue9eU1+twQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200083
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arago@lists.yoctoproject.org>; Tue, 20 Oct 2026 20:57:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17748
Content-Type: text/plain; charset="utf-8"

With the move to 1.28.8 in oe-core [1], we gain access to the gstreamer
patch [2] that effectively does the same thing that our patch was doing.

[1] https://git.openembedded.org/openembedded-core/commit/?id=2c14e4bd4247ae9f61e21f2de6cd985408e919b2
[2] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/08ea5bc9fab9adca9f2e0840dcc153c0138f8796

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...ctual-stream-resolution-for-encoded-.patch | 138 ------------------
 .../gstreamer1.0-plugins-good_1.28-arago.inc  |   1 -
 2 files changed, 139 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0006-v4l2object-use-actual-stream-resolution-for-encoded-.patch

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0006-v4l2object-use-actual-stream-resolution-for-encoded-.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0006-v4l2object-use-actual-stream-resolution-for-encoded-.patch
deleted file mode 100644
index 5596f5f2..00000000
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0006-v4l2object-use-actual-stream-resolution-for-encoded-.patch
+++ /dev/null
@@ -1,138 +0,0 @@
-From b4960f715e6aacf732768e57b0647001b44ec4e0 Mon Sep 17 00:00:00 2001
-From: Brandon Brnich <b-brnich@ti.com>
-Date: Wed, 18 Feb 2026 13:10:41 -0600
-Subject: [PATCH] v4l2object: use actual stream resolution for encoded buffer
- sizing
-
-Newer versions of gstreamer changed OUTPUT buffer sizing from a fixed
-2MB to a dynamic calculation based on the driver's maximum capability.
-This causes severe CMA exhaustion on devices like TI AM62P where the
-wave5 decoder reports 8K (8192x4320) as maximum capability:
-
-- 1080p streams get 8K-sized buffers (16.9 MB instead of ~1 MB)
-- Wave5 ring buffer is 4x OUTPUT size = 67.5 MB (instead of ~4 MB)
-- Total waste: ~89 MB CMA for 1080p content
-
-Fix by using the actual stream resolution from negotiated caps (width
-and height are already available as local variables in
-gst_v4l2_object_set_format_full) instead of the driver's maximum
-capability stored in v4l2object->max_width/max_height.
-
-Upstream-Status: Pending
-
-Signed-off-by: Brandon Brnich <b-brnich@ti.com>
----
- sys/v4l2/gstv4l2object.c | 29 +++-------------------
- sys/v4l2/gstv4l2object.h |  3 ---
- 2 files changed, 4 insertions(+), 28 deletions(-)
-
-diff --git a/sys/v4l2/gstv4l2object.c b/sys/v4l2/gstv4l2object.c
-index 453ff03d98..dbfe4992be 100644
---- a/sys/v4l2/gstv4l2object.c
-+++ b/sys/v4l2/gstv4l2object.c
-@@ -3123,8 +3123,6 @@ gst_v4l2_object_probe_caps_for_format (GstV4l2Object * v4l2object,
-   template = gst_structure_new_empty ("fields/holder");
-
-   if (size.type == V4L2_FRMSIZE_TYPE_DISCRETE) {
--    guint32 maxw = 0, maxh = 0;
--
-     do {
-       GST_LOG_OBJECT (v4l2object->dbg_obj, "got discrete frame size %dx%d",
-           size.discrete.width, size.discrete.height);
-@@ -3141,16 +3139,8 @@ gst_v4l2_object_probe_caps_for_format (GstV4l2Object * v4l2object,
-           results = g_list_prepend (results, tmp);
-       }
-
--      if (w > maxw && h > maxh) {
--        maxw = w;
--        maxh = h;
--      }
--
-       size.index++;
-     } while (v4l2object->ioctl (fd, VIDIOC_ENUM_FRAMESIZES, &size) >= 0);
--
--    v4l2object->max_width = maxw;
--    v4l2object->max_height = maxh;
-     GST_DEBUG_OBJECT (v4l2object->dbg_obj,
-         "done iterating discrete frame sizes");
-   } else if (size.type == V4L2_FRMSIZE_TYPE_STEPWISE) {
-@@ -3202,9 +3192,6 @@ gst_v4l2_object_probe_caps_for_format (GstV4l2Object * v4l2object,
-       /* no point using the results list here, since there's only one struct */
-       gst_v4l2_object_update_and_append (v4l2object, pixelformat, ret, tmp,
-           sysmem_tmpl, dmabuf_tmpl);
--
--      v4l2object->max_width = maxw;
--      v4l2object->max_height = maxh;
-     }
-   } else if (size.type == V4L2_FRMSIZE_TYPE_CONTINUOUS) {
-     guint32 maxw, maxh;
-@@ -3235,9 +3222,6 @@ gst_v4l2_object_probe_caps_for_format (GstV4l2Object * v4l2object,
-       /* no point using the results list here, since there's only one struct */
-       gst_v4l2_object_update_and_append (v4l2object, pixelformat, ret, tmp,
-           sysmem_tmpl, dmabuf_tmpl);
--
--      v4l2object->max_width = maxw;
--      v4l2object->max_height = maxh;
-     }
-   } else {
-     gst_structure_free (template);
-@@ -3312,8 +3296,6 @@ default_frame_sizes:
-       min_w = min_h = 1;
-     if (max_w == 0 || max_h == 0)
-       max_w = max_h = GST_V4L2_MAX_SIZE;
--    v4l2object->max_width = max_w;
--    v4l2object->max_height = max_h;
-
-     /* Since we can't get framerate directly, try to use the current norm */
-     if (v4l2object->tv_norm && v4l2object->norms) {
-@@ -3897,14 +3879,11 @@ field_to_str (enum v4l2_field f)
- }
-
- static guint
--calculate_max_sizeimage (GstV4l2Object * v4l2object, guint pixel_bitdepth)
-+calculate_encoded_sizeimage (guint width, guint height, guint pixel_bitdepth)
- {
--  guint max_width, max_height;
-   guint sizeimage;
-
--  max_width = v4l2object->max_width;
--  max_height = v4l2object->max_height;
--  sizeimage = max_width * max_height * pixel_bitdepth / 8 / 2;
-+  sizeimage = width * height * pixel_bitdepth / 8 / 2;
-
-   return MAX (ENCODED_BUFFER_MIN_SIZE, sizeimage);
- }
-@@ -4170,7 +4149,7 @@ gst_v4l2_object_set_format_full (GstV4l2Object * v4l2object, GstCaps * caps,
-
-     if (GST_VIDEO_INFO_FORMAT (&info.vinfo) == GST_VIDEO_FORMAT_ENCODED)
-       format.fmt.pix_mp.plane_fmt[0].sizeimage =
--          calculate_max_sizeimage (v4l2object, pixel_bitdepth);
-+          calculate_encoded_sizeimage (width, height, pixel_bitdepth);
-   } else {
-     gint stride = GST_VIDEO_INFO_PLANE_STRIDE (&info.vinfo, 0);
-
-@@ -4190,7 +4169,7 @@ gst_v4l2_object_set_format_full (GstV4l2Object * v4l2object, GstCaps * caps,
-
-     if (GST_VIDEO_INFO_FORMAT (&info.vinfo) == GST_VIDEO_FORMAT_ENCODED)
-       format.fmt.pix.sizeimage =
--          calculate_max_sizeimage (v4l2object, pixel_bitdepth);
-+          calculate_encoded_sizeimage (width, height, pixel_bitdepth);
-   }
-
-   GST_DEBUG_OBJECT (v4l2object->dbg_obj, "Desired format is %dx%d, format "
-diff --git a/sys/v4l2/gstv4l2object.h b/sys/v4l2/gstv4l2object.h
-index 4b14b7e625..2b8dbd13c5 100644
---- a/sys/v4l2/gstv4l2object.h
-+++ b/sys/v4l2/gstv4l2object.h
-@@ -232,9 +232,6 @@ struct _GstV4l2Object {
-    * on slow USB firmwares. When this is set, gst_v4l2_set_format() will modify
-    * the caps to reflect what was negotiated during fixation */
-   gboolean skip_try_fmt_probes;
--
--  guint max_width;
--  guint max_height;
- };
-
- struct _GstV4l2ObjectClassHelper {
---
-2.43.0
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28-arago.inc b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28-arago.inc
index d9e0df88..e95c4038 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28-arago.inc
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28-arago.inc
@@ -5,7 +5,6 @@ SRC_URI:append = " \
     file://0002-Adding-support-for-bayer-formats-with-IR-component.patch \
     file://0003-v4l2-Changes-for-DMA-Buf-import-j721s2.patch \
     file://0005-HACK-gstv4l2object-Increase-min-buffers-for-CSI-capt.patch \
-    file://0006-v4l2object-use-actual-stream-resolution-for-encoded-.patch \
 "
 
 PR:append = ".arago0"
-- 
2.43.0

