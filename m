Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20628C4452B
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 18:53:59 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30893.1784660038297599777
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 21 Jul 2026 11:53:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=DKHvkkYI;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=Uqrohk3L;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66LH62Kf1424509;
	Tue, 21 Jul 2026 13:53:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=SmhYtga8+w6X8
	LRQf/yMCgnGIzI0YBu6TWqfWCa53os=; b=DKHvkkYIHRo7Tlyl3+CJGpV0jrbOJ
	vNkFoQFTYN0ahwk1kSJUOJ8nzANAfMHyO6MHgqScJ7PBrL+IrjOzkhluJLvxf831
	mNTevbCM/JsuqWuwsxszXv2H1yuYoS7ZJdxv++YRMe5VJpAFUajPf53z7o1sk4NI
	qpqEc/3Cns8d7ykHN0LmTmpUKjpKJgHTDLhESTQ8nCUxmXaUzUtd7Gp46t/UTT2W
	giYNMHplIXxVLwdW0Up+YwufIy2TkI8ohMVgPzLuKr8Zww85unmHD1R1zUmYIQtD
	JXGVIA5lJdkWjuqbvK4Mg0TYfmIQyCWhjisucr1AQYvUkMYQtMXWf8vWg==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010029.outbound.protection.outlook.com [52.101.193.29])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fj077n5rs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 21 Jul 2026 13:53:56 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZP/KyBOPy0BQB5pARQy1SnhA4UBH1BRhDqkSwQCzGsAff73QMtKeg0lDXtn82uVspk4hh3/auTwed88x9P7dNN0CZKU1NEeUi/wDTTy17HQhold47se6RZCnZTv+Uv4z/n1uBIkRoi9p6WW1aZCNppHCYnJk6Ldm7lzP4KlsQNFGZmjlrEqlz31qa+THwqTQkHbHrxsnAepfhjLQsErcoDZjPESPaOS41ur/jQOKfste+k5nzCPDbHPjEU/JrSzzTRmq3eyGwUPT1VxiyYsUNuWAPie25/QjOjugSLlV1o62s4nrAWnZRaloNzjPLXNGhYm6oACsbaDk/gDNZHIKXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SmhYtga8+w6X8LRQf/yMCgnGIzI0YBu6TWqfWCa53os=;
 b=EYwdIjjYl1oQdH/xOBz3Y4s5QPMslLRsG2KRJgu9GqEaIFe1bps2vwcUA6fmHcMgMv3uq7XN+zegqicG5s3ZSlmOv8oqeQecU8D2sKNHd9OC3K28GVb14P5d2yfLKnaEM7naxppFxAH2rnJxkjHcvuKtPX+l6TzAzUymjHZIpWJj2q2AzXNBgFokNFJc0NQ0gg0dofle/zM5hPUFoPo/g6F3fTqRx2ghioMw/wti8wG4KHmNfe7itLtpSXfrLguiL6XZb2JudEo3nuf9sXFmP04RET9R/kXvesdh+uHAd1bXeCd7N6NjGzj6PoB/XMVNuaElstjDRiOLYbMvoqlgeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SmhYtga8+w6X8LRQf/yMCgnGIzI0YBu6TWqfWCa53os=;
 b=Uqrohk3LMd5b2zVxZnAE1Bpjri0bHRfUXZxuS3Vxf7ZCJgRYi5YdGJq/zN8w/wBhGrk4tc2Di4NvzxEv6YQgGB6H5sI+tvvD7Sm3D8m0OBXi0ImuPotmcXn7ESsTv5mVP2rQTNPOOgWd/wx/c/kKzn/PzoQJcjNjdMTphEj0CdU=
Received: from SA0PR11CA0141.namprd11.prod.outlook.com (2603:10b6:806:131::26)
 by SA1PR10MB7831.namprd10.prod.outlook.com (2603:10b6:806:3b5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 18:53:48 +0000
Received: from SN1PEPF00036F3F.namprd05.prod.outlook.com
 (2603:10b6:806:131:cafe::ab) by SA0PR11CA0141.outlook.office365.com
 (2603:10b6:806:131::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Tue,
 21 Jul 2026 18:53:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SN1PEPF00036F3F.mail.protection.outlook.com (10.167.248.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Tue, 21 Jul 2026 18:53:45 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 21 Jul
 2026 13:53:30 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 21 Jul
 2026 13:53:30 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 21 Jul 2026 13:53:30 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66LIrTG12008658;
	Tue, 21 Jul 2026 13:53:30 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wmFar-0000000Cc5q-42B5;
	Tue, 21 Jul 2026 13:53:29 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] recipes: Convert to SPDX license strings
Date: Tue, 21 Jul 2026 13:53:29 -0500
Message-ID: <20260721185329.3006359-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3F:EE_|SA1PR10MB7831:EE_
X-MS-Office365-Filtering-Correlation-Id: 53ab3694-dea9-4c57-0b25-08dee759643f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|18002099003|13003099007|10067099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	vfOQj0ltAD8C0uiSMs765yrN7YrFaNp3XzCG3pJB7ZFkkVtdkXxZjOtuL+f/a8xeDBZOt07iEvcWztiExCj5yMsNz5x15Xysx0jnnxrdm18XqmFSbHfweRNPOMp0CTmVlwuAVkLvUZfhBpvvK+9vITueDfYUzSX3CuyMKy/FaaBdjwapEIPGe4u0SmtvPF/c7i94mdz4XnRps0MJDT/r3RUmvk0PgoO8Qni9j64tCytiaD3JM/qcHfnUPvGYU5M5PycP8EZW4287ygEpw+LEBk2/WhaiU0z2fHQvC9kjHCeXCaKHAtmX84YXb6BDh8Lc3uDUpA4M3g/SRG4OMpfamgRcdnZCYd+aRl3WN2agnMzbVaFjqp8afNEZwGg/4kECA0I8aWsL6XHQgwUTC2OC6q9MiubLwOpaNdyvd10mwB3PwIU/p1ZiNW2v8cWdf3yr/ghnOY+HXvotDal7ET2MwdSoH4eGzWsnoZh1GoeW4FV+nvHmtZluPJ8N7VWc/irE7ibPHkCFquOY7nPH6vBYs42KYShEGrSwoD1zesWEHGGz0wyAMle43dNvZLDSsnJUAs3F0KS0XtIiDpoZabsPqSO0tXlrFEEQvtGcjY6DMWDUJ2j2b71NH4Y7ZZU4EccZDOTvEsBcWuv7TxQdYl6NIw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(18002099003)(13003099007)(10067099003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	XpBWL/vv0kiSQo/mPTvu7g9t6+OL/8ZeN2FswtPYbZJNETMHKq/9aqm3XdINpRouuoCTeNR/sAsxwaub+njuNK3IvU9SrVGEGtccHAiXYLfi2V2ic5AMMUDUgbpJW8cH5tH33INf+ncjaJWDtqpXTgLSmGKYWccWzRCG78eScITfbCfFrLh5P/b4e154NrDjRODLqOMf0Wt6xYpaE0oEkYq1aJfY1fBDgR2q+n98soc1k1pBWRt4XY5N9Svg+8scaPJnJW1gNX47PEqDYfjkw2rwBIg3ejGF3hGQadXZ68DO9bIptGmkM0wAVFx/k28PfuWybno2merFM1QIxZEykQZovjyeHMP3BtRZoldIiZheedO+DcXo+XmFxKpffHHRb7kjmPaGTDBHxDs6nahz0g5gQJOP9HV9fog08EM1MXW7yoS4Bons4X32wbr+i0l+
X-Exchange-RoutingPolicyChecked: 
	q2geFRwAWaGlFAOAIyLza8x+kLOFiZxdS44+s83s1K4vwzsEJpoZAvu1c8hrOIznIqhzB05LHOZ8do+Xod3eyvXiiUrg9xKKVizuZzLLEZFcGvxim+7WZcQeFnRsPwq8izTZ0DQ/8Ss5505Kn38aEQoOv+oi8mEyT0E3AUYf7OUkueuuXtm78oANxasG5otNf9a1ThwMIkyXU91JJKw0b8KZHWTpiY6KkfLg5UTpUan4cZwdcS+hyolmGFzehrBkO35Iaji3a5TTHyGsQu/j4+iw4dW9nIATXIdN6Psv8LZKGW70YhxC9rXQjTOFam5kkm1uJ9Hdu62WPfQf0cfqFg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 18:53:45.2372
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53ab3694-dea9-4c57-0b25-08dee759643f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF00036F3F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7831
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5OCBTYWx0ZWRfX2y1i7u63Us0B
 DNZ2vo2FSftrMyKApQT9dJ0KZnxkAGgJ3PhqztpaYpkjklu/87CmG2eBAl4bXRDZuwuk4TZ4PR6
 ye95LUjaZ28wwUcOYZ1ghEf2qZMk8iiJ1giIy6HcH3eyfA8RGV+zfHTLUTcz6Qhy3wtnAuWL1Rb
 mAHajV/FeMwAduinDPvQ36jjjnmVVx3pgY7oUu7T+omwfOqUHHIN5AcIXFs2XO4Nq5vp6qALFBS
 yrgu8CO13k6ARwFTG/SHKXO8/MEuC2SP+hBqSFqZVoG5fE7lz5Y7as+CgfM1vp2XZ9yemW7F5P9
 58PRZ6cJ8RULzf3YxoPj/5eBs35j78XPza4OtAFrx6yBC8EunTkVlnB+zbun73XpD4Sbn5Q8MeY
 pH6msBTz/fxMGuFHpzdTxM9669w+0lBtHf09mrWt9EDJGEhCcEhcQw2919q7M/81x82RAtqI89i
 lZv1qvC7kNzGiu2SNlw==
X-Proofpoint-ORIG-GUID: 1K7-UJhGu2TuZ9L5I5wLywML3ZmCpJXR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5OCBTYWx0ZWRfX3LW/WlHvL2Bm
 rSSDZAARq96gvWcQZM5FFJuq1vXLXZ6jM64kH0c9rLe7mU3ZCxhrAnpl9HpfV2V9R86FGQyBnIM
 JfnbTq4O2Lx8WGEaZ/9AOkjZNyZs5z0=
X-Authority-Analysis: v=2.4 cv=KabidwYD c=1 sm=1 tr=0 ts=6a5fc044 cx=c_pps
 a=sujALEMa9QlLHAoAbbwPUw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=ZpVaWaFtAAAA:8 a=e5mUnYsNAAAA:8 a=NEAV23lmAAAA:8 a=sozttTNsAAAA:8
 a=IsReIQ8KXyup9Eq9nfYA:9 a=5tn4MO8azEBWFjlAA-rn:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: 1K7-UJhGu2TuZ9L5I5wLywML3ZmCpJXR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210198
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 21 Jul 2026 18:53:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17588

Converts all LICENSE strings to SPDX licenses expressions

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb   | 2 +-
 meta-arago-extras/recipes-devtools/statcol/statcol.bb       | 2 +-
 meta-arago-extras/recipes-multimedia/nnshark/nnshark_git.bb | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb b/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb
index 62cb0ee6..8dab581b 100644
--- a/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb
+++ b/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb
@@ -4,7 +4,7 @@ These applications can be used for Mesa validation and benchmarking."
 HOMEPAGE = "http://mesa3d.org"
 BUGTRACKER = "https://bugs.freedesktop.org"
 
-LICENSE = "MIT & PD"
+LICENSE = "MIT AND LicenseRef-PD"
 LIC_FILES_CHKSUM = "file://src/xdemos/glxgears.c;beginline=1;endline=20;md5=a481fbdb2ac800ecb12405c33bcfacae \
                     file://src/xdemos/glxdemo.c;beginline=1;endline=8;md5=b01d5ab1aee94d35b7efaa2ef48e1a06"
 
diff --git a/meta-arago-extras/recipes-devtools/statcol/statcol.bb b/meta-arago-extras/recipes-devtools/statcol/statcol.bb
index 09937483..add422c7 100644
--- a/meta-arago-extras/recipes-devtools/statcol/statcol.bb
+++ b/meta-arago-extras/recipes-devtools/statcol/statcol.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Statistics collector application"
 
-LICENSE = "TI-TSPA"
+LICENSE = "LicenseRef-TI-TSPA"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bb6bc27cd44417c389a180bd62f552a0"
 
 PV = "1.0.4+git"
diff --git a/meta-arago-extras/recipes-multimedia/nnshark/nnshark_git.bb b/meta-arago-extras/recipes-multimedia/nnshark/nnshark_git.bb
index 8afe7def..811ee398 100644
--- a/meta-arago-extras/recipes-multimedia/nnshark/nnshark_git.bb
+++ b/meta-arago-extras/recipes-multimedia/nnshark/nnshark_git.bb
@@ -1,7 +1,7 @@
 SUMMARY = "A GStreamer NNstreamer pipelines real-time profiling plugin"
 HOMEPAGE = "https://github.com/nnstreamer/nnshark"
 
-LICENSE = "GPL-2.0-only & LGPL-2.1-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e1caa368743492879002ad032445fa97 \
                     file://COPYING.LESSER;md5=66c40c88533cd228b5b85936709801c8"
 
-- 
2.43.0


