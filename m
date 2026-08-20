Return-Path: <y-hegde@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C34BC5DF82
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 09:41:27 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3400.1787218885765044064
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 20 Aug 2026 02:41:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=U7fdTAVz;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=gPAnQqgK;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: y-hegde@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K82VGi4047933
	for <meta-arago@lists.yoctoproject.org>; Thu, 20 Aug 2026 04:41:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=AngJVoJugmvI2
	yCW8h6wEA8//B2GQ5uhma8S3docBFY=; b=U7fdTAVzloKJZ3OzFCI8lu8aKIjUS
	CU1dog4ZO9in9gM8D16LwVPOkogoU53k3Li93cSiTuzM37IUMXLNXfNSt7kTspup
	JuVAFWx0eRuKl707DIBVCNdEmU01RWi0gYE+3lD20j8dnCW4Ztrht6wx+Gfa6O9E
	limkawLaAG2OiBiNLRqlRMLn/VFIbnpQl6SUT8bWqAvWaYHfICWLHLEb8Qiui+Dp
	rC+gJ7oyckQIiJw2iyrJqsjfDrYsiK9JI7HKE5bDsKFTuImgoik5FrvkjHiRepox
	KxUpzS+zo/dIO9MRQCz6wopeZPWxc7NnXjqTqB2hpH6PS8PEDGyFEu6zg==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012052.outbound.protection.outlook.com [52.101.53.52])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4g5rttj2nx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-arago@lists.yoctoproject.org>; Thu, 20 Aug 2026 04:41:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w463fu4i8a7dF2IwDFrsLhizjvi8oJFsdu4NuD0AuzaQIgh1wae5uo0wwL3nJO2J+t4czoxAND27vYy5p6XzmVGyQ1Y/Spl0aK4U+B276+EK+2bNmB8wV7RkcDYDkjyEeCfsOnN4lFgFs6dhwRSdhhGcLjPTsGrjSDORb/ZfpzMWjZWuKY9tmvfcYZ41WmwnPec1gjAAPOCc+xE1GXaKe3T0yugg7E/ViKEUp+e9X2hqjqgK9lEY/+ulzfCPqC1QRMulO5VpJ5l7NmhWtq/TcufzfSZr6amhsgDGgNNaoDG1sJUyrPFrIiw9I5e9SpmJcSkbZXu8Q7Yf1ex7gCfJeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AngJVoJugmvI2yCW8h6wEA8//B2GQ5uhma8S3docBFY=;
 b=VGijRTxqCe1xQCcF7RpfqpYG8ueEHNiqTS+mnipN919r+e1abI5mwd6ffPPZ167Ju54hPCA1TW9EV3aztRk5DCVxYWqAIMUnhgFSkUjepHGPH6BX2YnZzKmSv7dmtMAYWJ2uDWyyTByjHJA/rMVGxoAPfuT0/cwnOXxcvIA40gXvwRlJZcJxOWBEpGzQT6biBjkQuLGz5nbsfVmhwO9ItRilPZS7KDU5CkmTWxbpNuIny+Zy19B6OBpn/spz90+nxnDv7nGIloXnP3OvcVHw9U0WLggRad4Ox1oDanAMQNyWflcDnXV2KStcZQcPsD6HwYG3YHqMZIxx7X0/XM81PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AngJVoJugmvI2yCW8h6wEA8//B2GQ5uhma8S3docBFY=;
 b=gPAnQqgKSxdlratUa29ULnPxf6HBIF98IlWwNeKSrDufz7YRWwj4TmGB6fHqIZkrmGDL03STFca9Zq0mDC+CZMlC1VVYV8Xh/HSeY4VCWq5zxr51KLYpwzBFsnSjuFQ4zlCOHvg1ObXuSELGnH7hcuxvPamr+FxOLtg6RFOe5Fs=
Received: from BN0PR04CA0170.namprd04.prod.outlook.com (2603:10b6:408:eb::25)
 by DS7PR10MB5007.namprd10.prod.outlook.com (2603:10b6:5:3ab::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 09:41:22 +0000
Received: from BN1PEPF00004686.namprd03.prod.outlook.com
 (2603:10b6:408:eb:cafe::18) by BN0PR04CA0170.outlook.office365.com
 (2603:10b6:408:eb::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Thu, 20
 Aug 2026 09:41:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN1PEPF00004686.mail.protection.outlook.com (10.167.243.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 20 Aug 2026 09:41:21 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 04:41:21 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 04:41:21 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 20 Aug 2026 04:41:21 -0500
Received: from localhost (uda1250336.dhcp.ti.com [10.24.51.123])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67K9fJbK4087414;
	Thu, 20 Aug 2026 04:41:20 -0500
From: Yogesh Hegde <y-hegde@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <praneeth@ti.com>, <prudhvi@ti.com>, Yogesh Hegde <y-hegde@ti.com>
Subject: [master/wrynose][PATCH] websocketd: update to main branch
Date: Thu, 20 Aug 2026 15:11:17 +0530
Message-ID: <20260820094117.697002-1-y-hegde@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004686:EE_|DS7PR10MB5007:EE_
X-MS-Office365-Filtering-Correlation-Id: a189e2ad-1d35-4569-2fec-08defe9f3186
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|23010399003|82310400026|1800799024|13003099007|3023799007|56012099006|10067099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Hf/hMsBIUU/JTn3UA5jaFHe/n27PyusW/uKanJry4aGb3A0jeoANXWH1XgejV/DAs971KN7WmssZ5AvD4wtFf1/zqgjLdXx7F9SYip8qF8fZzGnF7KjuNHbmqVhg1furwqgntKqMJtdxrNx4klyoIEpoqZwseIs63ZSEJbI/2OUKE0Vi/mcTQH382WBdpz4gqQbhkEhWx3qKtdD0MGtZmYyd50jqGv2djmYsH49C3L8BZDWOJjusDEVdm1Eh/HVDMUYaJM+fdlEu1ekEXuyyOlDZbargPQJxWnHZQBZ9KNjmgMeA78+efdNoo+AVOiL3j9qJKYAjhLsaA7Omlm5hUrIPzc1J9c2eOFdyR73lJGYQQMezzxGOARaMettQFMXJj0x5LniEaweLL1cBrUp+PYVleAIjIoeN3H3wCaQjMlp72Ok3wU9ylEuG2cfyTVHxZnK6kADoRgpgFOSEehxkCFkplZ/cSftx1z7ysAykPGeANZdnXdNr/pgtIk9AXM1sx+6Xmm4aFol2608dh8Dpo1qsKP/lWYTRgrE2j4QaCClKvXN63kyTaQaK0Iz+UNwzGsmJni8rdc0OaBVd9PDnSAQBXtPgCynyuvCJ4+kM+Zn77BOXE+5kJOgMmzUEIl0xAmfxSuN3lUbbpSFCKfNCqpEi/OQVRmfmTTQrfUNR8ulLFw1d8yxHe2EXq+9F5tzJRp2Fqx9AHgOalIE7rzuZKg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(82310400026)(1800799024)(13003099007)(3023799007)(56012099006)(10067099003)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	20j0W7w6+JIqQRMvKc8uJo90oeQ0hNwitgFm8q6NxtHNdLgAp4Qjzjb6yif6fFUGUZ4Hreni0JBUwkTlo+Kk12fyTE2GOSGI1FsTjccs7Zex1XlsvoPipGA2VP/tONzCU4QyTW2CNPTqbM6hzA1sDuQFkyOlS2fseYVBfQfxX1LhtvrGfaoNzymUqSQJmZm4nUdVD9exiPycw0zZaeqgkCbA2DD0ToDYKw281M3y//rAeQBBWBuLVToUw4EJgIHAPDGPRIVPV/OR1kV3KjvjCYpIXlDUsgxctuY0pBjHadBd7KCyn9CQXntDjjm9cY7Gv7cGuHYyDKrUuRUMDfRfDK+2e0sU4koSNalWZhz68oPYyu81DYD33YLRnOExU9jNrYh3CY6tjFTk0R7w0QO61RmXH+Jp86svAutJP4MGSBf4aN2kgIbqXd8agn6RqYyK
X-Exchange-RoutingPolicyChecked: 
	snmDZIGn2kpsRDNb4PTWS6LwBSsGVMvSzuRvpi2G+yF9MQ9ATpkzMOQm50ZldsOTg3cwPVKqWyCk5vMbUuXn5oAp7hyxOCHeHo8TeLOrS2neqDb8fLILMwYLsID1lUVl6WiNdKgEA0NvLw6ZAz4xZoUyTAZHc1k7AEYFzbgutfUCdqrxhjEcvSfbx1MfWQXouBqYgpY69YhN4NI88I5twqWyYPbuuVNJ2zCstdR5phjtME0WKR9B8yj3sfa8ve4npPjC0x515oA4LujUlbfe1I/Q9VikRaVYyoiAlC83xtORs/5v9yauHt5Y2VQsAanx/Ns/Im9P7Oe6WGbvPxqyXg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 09:41:21.6173
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a189e2ad-1d35-4569-2fec-08defe9f3186
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00004686.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5007
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3MCBTYWx0ZWRfX407qgbxXx4gI
 +j/VCwu/YpezAkErgdWANI6QcAeiOvqSWNoS+0LFzBhaZqjFhkWhfD0NUL0USBiYVcT8yZTrbWZ
 4j7Iyopzvs4dZvskX4VZcDc2GyMyZ6kkTVOeFYxNFR5SuCAItodoL16ZJriWYT4eJwa0YibsG1z
 4BZ9pa4DJCmv2Sy2flInZzlfSHLQcY0UhASCt1Nuj/gs/odz7Jkm71jwYaDQ+ynIHDGxYQ2B87e
 qH/zi0b8xAgTVMXRtfCeZEIhicKXFxpepdGRKuG+wqifwxiPlHF6e5SP0KLp60bocq+DeIGpX+q
 d0Ilah9TKK+8CE3Dt2vUtGqOw1NYZImSmg2v9hgjKuAjOJmmYulLPZC7iubDnVkD+qWmwzuVyqF
 d0IDgLYPvjKaZUOdX29KgAubftjOGgee4cKE4999lPf9BDxww++tPtSPzphiX/MQmsVDwErUozj
 OtW7NiUWQKKqg9YsUuA==
X-Authority-Analysis: v=2.4 cv=aoyCzyZV c=1 sm=1 tr=0 ts=6a86cbc4 cx=c_pps
 a=Bsy78vmKOeQIAJqgrxlU3A==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=NEAV23lmAAAA:8 a=sozttTNsAAAA:8
 a=odtfVjYXCuJzLiihVH4A:9
X-Proofpoint-ORIG-GUID: y1Y3X_PgxAVhkZgatc_pU6IrOzVnhqNC
X-Proofpoint-GUID: y1Y3X_PgxAVhkZgatc_pU6IrOzVnhqNC
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3MCBTYWx0ZWRfXx0p5FZWqYryn
 E9OqTytTKQAQ7Xr7lQIJw2DzhXgzfMEFPxTgwGp2jfCAsRB6x+GqP2UZYkYMpha2gq8zmtbeyO7
 LG0CkmkKQcp3wK2p5RHbF7YtfEF33z8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200070
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 20 Aug 2026 09:41:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17603

Fix do_fetch() errors caused by Upstream [0] commit, which moved master -> main.

[0]: https://github.com/gorilla/websocket/commit/66b9c49e59c6c48f0ffce28c2d8b8a5678502c6d

Signed-off-by: Yogesh Hegde <y-hegde@ti.com>
---
 .../recipes-devtools/websocketd/websocketd_0.4.1.bb             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.4.1.bb b/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.4.1.bb
index 4e1cef0f..49f3130e 100644
--- a/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.4.1.bb
+++ b/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.4.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=a14d7befdbee1290ac5c472c
 S = "${WORKDIR}"
 
 SRC_URI = "\
-    git://${GO_IMPORT}.git;protocol=https;branch=master;destsuffix=src/${GO_IMPORT} \
+    git://${GO_IMPORT}.git;protocol=https;branch=main;destsuffix=src/${GO_IMPORT} \
     git://${GO_IMPORT_websocket}.git;protocol=https;branch=main;name=websocket;destsuffix=src/${GO_IMPORT_websocket} \
     file://0001-examples-Move-to-python3.patch \
 "
-- 
2.34.1


