Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5160C61DD3
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 20:53:07 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6494.1788209585841854480
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 31 Aug 2026 13:53:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=PE2uTMHB;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=p/o6BBmk;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VISL7o1812841;
	Mon, 31 Aug 2026 15:53:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=sqRAj3QNqTyF+
	SpYWNiQORuSAMGWIGTTa1eoaXwoKDo=; b=PE2uTMHBE0Yb8GydwMkGwZbUApYZd
	MkMXkQ9yh77dfGKoRHOuGkBC5zCDPW2jt6bezDhCklP4cSUy8mWmiCYWEEb1ZuCw
	BGMglH4Ndh3Si5ktnY2fWJiJ5BuW/6vyR9fer8vYlV5jk4lWPVdLy/Ub/fW9jRLz
	omPDBsEVFO8LraeIt66sGd1FlTNIUa4HcyXl8MDkCl9B6KGDZtSdoHaRrmpvWJSr
	ww8Bb4MmLYFByrz4rhF5sW5KuCHF7Hob+3DUzojufAndNJ2oSE45HlLd9SXkLeR9
	Jggh7F3uVlX/HWBs3In9GGE5Lb1IXfnqeF9zJ2X/wBfFWKhpTE/uVni+w==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010028.outbound.protection.outlook.com [52.101.56.28])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gcet48kxe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 15:53:03 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WAJuYGLV2y8yh0UkO7errXGadXrf2Kqfnm+EZWZVRg+GgXiamnJOtokF1VsfGdV+oXr7B103pK/drZ/Lf+5mJYN6j4Et2H/gr6JfKjqYRcHfEhrJzRLW4rJUfJveTJJraGxNG4Mdj30D8aTihRDYvBvO4M3Aa8t2vL4ARZMXjksbwxQ4Uw2HT/KdihEYlQJ+AAZQMBjBxj4pUdnljgsyFAr6ZmV2t3uu1+AexrG/HWRaQhs+eSp5VtLrt6kv5isSsTI+jWp/rWq7PyDe1J6amAiq9K03FjRCuh8eu9ve6axX3KwF27GJudpuBZBZ2uYdXX4tglRShP4NvM/+hpf9MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sqRAj3QNqTyF+SpYWNiQORuSAMGWIGTTa1eoaXwoKDo=;
 b=Zfex0bED6irUAh4tNkEn8D2jfyLxPLnjZ7KySK/jnbb+NsxjGHGH5QhoZElkFJ0EFTlvwouqOMIgQzgjZVC4BG9+R3M2XC8DdBXaGqz5wgvbrid4boP5DOJaK3vnRshmyDB2MGa67nR//I0eO9mYLti7c0hLXblBuV1L0fe/Lrw1UyjDpmYuYWnZQbenMISW0bqnImMLX86snuqwNZOgoxlfebO/F+3tJJ4piuWhL/nvlaY+eyNP3ADEwR8dFl70UEFb+/h91uY6c5gO9kPEYt8EawDANUZ7NwstQWT6W5sV0qVIsdh8K0f7HUfl+2URlDQ9YvEPEa7KL8l3iM0Z0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sqRAj3QNqTyF+SpYWNiQORuSAMGWIGTTa1eoaXwoKDo=;
 b=p/o6BBmkX0yCjscaI9ZolxINjcSqYB2TCp2Erf4+5Y5Wry0yH3XPr6kNq5SYhibGzqX7n4Gg1A/66yT1v96bsD7AjeniDNXztbEzYJdyisWZMVRwhBWdOH0heGGKotCNjkoKSxbpHQ4uLHszKjQtegqSdp4v9kbeRi3fElIrwow=
Received: from BN9PR03CA0090.namprd03.prod.outlook.com (2603:10b6:408:fc::35)
 by CH3PR10MB7575.namprd10.prod.outlook.com (2603:10b6:610:167::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Mon, 31 Aug
 2026 20:53:00 +0000
Received: from BN1PEPF00005FFC.namprd05.prod.outlook.com
 (2603:10b6:408:fc:cafe::72) by BN9PR03CA0090.outlook.office365.com
 (2603:10b6:408:fc::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.12 via Frontend Transport; Mon,
 31 Aug 2026 20:52:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN1PEPF00005FFC.mail.protection.outlook.com (10.167.243.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Mon, 31 Aug 2026 20:52:59 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 31 Aug
 2026 15:52:42 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 31 Aug
 2026 15:52:42 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 31 Aug 2026 15:52:42 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67VKqgVU467110;
	Mon, 31 Aug 2026 15:52:42 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1x18zi-0000000DmUm-0Vq2;
	Mon, 31 Aug 2026 15:52:42 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] gstreamer1.0-plugins-good: Drop unneeded patches
Date: Mon, 31 Aug 2026 15:52:42 -0500
Message-ID: <20260831205242.3284673-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFC:EE_|CH3PR10MB7575:EE_
X-MS-Office365-Filtering-Correlation-Id: 33526aae-7fdc-4093-7165-08df07a1d74e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|56012099006|10067099003|6133799003|3023799007|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	TCxgXA5qxyFo27RTacle8OM9x4Qg43j6LjTVashu4keOOUC25k1oOS7xd58n2bBtXd/W5GYSpczW1zwDj+R/2BMR/TnrWbFoM7QGuxIdo5hU7/pnzl3g3oj6khmJHjbnE/AhcewQa0aKQ/OF4j78XnIc8u61gI9kvO35WljoqQLgzHTnIHsctkPSDFfJ6ApS7/wPkwMjPLwzrPAavh3B1Qw/Ywzasjw/8otlVceigiU93lNIWswhp6U2P3wNU+X0/Q71m7TORLgGuNRCXHoft98d0P8JmzkxUTkZjf1sExlbIlpdcCkwMWM/jjr54C1+EQyt4+NxmziIWN/tRDQAjejiXh5WWnIUU4pX5mqgTe5ryNcP8R1//B/F57Mrn/J92HAOrqElNHzzwzqX9RYSKrLTEgDPcyijKD0kRrKMYQiV8RwwdHW7ewJyr9e6QHoexlf1ELm81xJPBmfRtJqGpt7b/08BjJnksEhrdNCvpz/l43D1mW7orAgaxpWWjT0OlwvAXKO0OPhxJfinHD4i2QSFMGOsQC9OwL9ddvdb7fuflKTqitcjwtXiE1D9TDJ89TPE+Tf0jhj0danP1C0nCuFHN0FE/j1sMREk/vWBcB8rYifI0hIM5/sOpl4IfEFFVrmondkBg1JikhCtZ5q5x4EL25IysYraXKJFjHHmHarHZYNiegl2TvAm/S53GwnnYmSqGjoS65AzSrHJENFMQw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(56012099006)(10067099003)(6133799003)(3023799007)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	dWS6r/TkdV/J6xeRDhbJukepAzNVa2v6diw63bP/NAxUuJ5c4BlSNuBXWOwGoJbKP5booEPSNuvfAqL1wGqMQCzqt030jb5LHXbODvBrzONZ33IZReJHGWfR7B6JEE1wErzrpkJ0/sZXwpEPNs1GliiI3NU1YIEQhUBdQxnfpv1eUhU5hKNpoSEU31YXEfxr0GMPnnptXTLe6rZXc2TYbXt3Xv3etVystKfDBYR+fdXUbq8+T9N4CunEK4FIKUqeRvWDBOcxMDTFzE9bwvpM/k7yTNF0JJKp/9FqSOHSg+kkHMy0mFk5+xA+pBQDARLyI5pGSyKKPHgsKZNtmmSK/ny7IxCshyLenM4j/zdL8VhOLQLtFQSCbZ3fICoTiHQKAv8K6aZErX0z+Nampjh0S9QoNtQzqJ7b7CChQxKfJIwdXD8tp43wGAiuxT3c0b4/
X-Exchange-RoutingPolicyChecked: 
	rYBhDed7HtRaRnyraQG96adrqGLH/T9EXulF0qw2CIC3Sguz7yO8O5gGnXb7abfIJDXCWDorEmAJcfrljZ5JHZ+9eOJF6k9WafPU9I+ACfTgpaaDigOL0jFidqbE7A2uzyzEr8NinPelSKTC9w4LcxyZVV6wrs36dzUmmGfEGfoWnKKhm4tN/mnwAXmWm9mb/zVEUuTlp1Rr+RPGtkqAiGkoPMgm377sAsAjLfmieeYV9yR/dn9qq6IJaduJ3avzg3C3/YZMnxyTpvXXpLjWE8VoDzKRqFlRZ+TGRBPvQ3Dua5MfwrFOTln5obUos3BPl43tOPi9zE/jOmbCqsLu6w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 20:52:59.2114
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33526aae-7fdc-4093-7165-08df07a1d74e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00005FFC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7575
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE3OSBTYWx0ZWRfX4pUQD5qEDLXG
 7+PZYDuhv8jihceg1aVvdM4icgyW4e/4yliAFMCVeaSGxkUxkoBAfKCdV0JIiw6KMXPI9MWQr7c
 y1P+NalE1IeMnoUDlYYhFW2WtXBEdb88j6jCTp1ofOiAR95PTH8W/nFESGQ5EvQC+5umI7ZYOEP
 YnyHH94i07bGvbDfPtMqDsUZYaQ6ZN7AK9iiuBlX2LeqhvpPzjWGG0LWjMRvrWPiZe+nzrwANvQ
 WTG7JjRRAwUC15wG0irxQEgVrAlaaduOYcyItZga/dUUyzALRLgFAjC+N6u8IgVqB/bgHuoJf3k
 XyPydOT8vJF0qjU86e2VKdRK/mcmvo2Md+lvD7v4Dcht34JsOtGD708iBkk1q+tdaEERBezoeyr
 xiu2Xmo2zb7C3uZP8QXXvhCFgOqRSDOWnT6V2BKazX3NDXxGL8KMPpWKYrGIfTWz2OMgjBkXLl+
 XVdQW53wJx467gLG55Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE3OSBTYWx0ZWRfX3nC+gr/0Txif
 Q3lfpT31d6c/zze4Lfjvu8iy45bII4d5kE8CTuICQ60rpMsAq5GuPNSZ9+hOW/mTBn4SPI+FtYn
 wRHKYenHT1OUg8AFPfjlmFveDB8UwHM=
X-Proofpoint-ORIG-GUID: c5EDUI2L2_IPec4rQepVtge8an3IvAWX
X-Proofpoint-GUID: c5EDUI2L2_IPec4rQepVtge8an3IvAWX
X-Authority-Analysis: v=2.4 cv=LrSiDHdc c=1 sm=1 tr=0 ts=6a95e9af cx=c_pps
 a=M48x8qJemVpu2SzQJjJwbA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=Q4-j1AaZAAAA:8 a=sozttTNsAAAA:8 a=Am4ss40yAAAA:8
 a=VnNxfWlsPmcc04mLrVgA:9 a=9H3Qd4_ONW2Ztcrla5EB:22 a=lf-hbUz_c89dky27wAWH:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_06,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310179
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 31 Aug 2026 20:53:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17625

A recent version bump in oe-core [1] has moved to a version where these
two patches are no longer needed.  Drop them.

[1] https://git.openembedded.org/openembedded-core/commit/?id=171b0ae0160d38e423c9447b883a4fd709808be8

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...ence-to-contiguous-format-if-support.patch | 52 -------------------
 ...pt-non-contiguous-if-contiguous-form.patch | 35 -------------
 .../gstreamer1.0-plugins-good_1.28-arago.inc  |  2 -
 3 files changed, 89 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0004-v4l2-Give-preference-to-contiguous-format-if-support.patch
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0007-v4l2object-Attempt-non-contiguous-if-contiguous-form.patch

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0004-v4l2-Give-preference-to-contiguous-format-if-support.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0004-v4l2-Give-preference-to-contiguous-format-if-support.patch
deleted file mode 100644
index ff617655..00000000
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0004-v4l2-Give-preference-to-contiguous-format-if-support.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 0238a430b19e5302dc924321225a3e24778bd2b0 Mon Sep 17 00:00:00 2001
-From: Devarsh Thakkar <devarsht@xilinx.com>
-Date: Fri, 9 Mar 2018 10:30:47 -0800
-Subject: [PATCH] v4l2: Give preference to contiguous format if supported
-
-Currently gstreamer uses single format GST_VIDEO_FORMAT_NV12 for both
-NV12 (which uses single contiguous buffer for luma and chroma)
-and NV12M (uses two non-contiguous buffers for luma and chroma )
-and if device supports both NV12M and NV12 then it gives preference
-to NV12M over NV12.
-
-The logic to give preference to NV12 before NV12M whenever GST_VIDEO_FORMAT_NV12
-is set.
-
-Upstream-Status: Pending
-
-Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
-Signed-off-by: Prasanth Babu Mantena <p-mantena@ti.com>
----
- sys/v4l2/gstv4l2object.c | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/sys/v4l2/gstv4l2object.c b/sys/v4l2/gstv4l2object.c
-index e9026da..ad9f630 100644
---- a/sys/v4l2/gstv4l2object.c
-+++ b/sys/v4l2/gstv4l2object.c
-@@ -2013,17 +2013,17 @@ gst_v4l2_object_get_caps_info (GstV4l2Object * v4l2object, GstCaps * caps,
-   }
-
--  /* Prefer the non-contiguous if supported */
--  v4l2object->prefered_non_contiguous = TRUE;
-+  /* Prefer the contiguous if supported */
-+  v4l2object->prefered_non_contiguous = FALSE;
-
--  if (fourcc_nc)
--    fmt = gst_v4l2_object_get_format_from_fourcc (v4l2object, fourcc_nc);
-+  if (fourcc)
-+    fmt = gst_v4l2_object_get_format_from_fourcc (v4l2object, fourcc);
-   else if (fourcc == 0)
-     goto unhandled_format;
-
-   if (fmt == NULL) {
--    fmt = gst_v4l2_object_get_format_from_fourcc (v4l2object, fourcc);
--    v4l2object->prefered_non_contiguous = FALSE;
-+    fmt = gst_v4l2_object_get_format_from_fourcc (v4l2object, fourcc_nc);
-+    v4l2object->prefered_non_contiguous = TRUE;
-   }
-
-   if (fmt == NULL)
-     goto unsupported_format;
---
-2.39.0
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0007-v4l2object-Attempt-non-contiguous-if-contiguous-form.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0007-v4l2object-Attempt-non-contiguous-if-contiguous-form.patch
deleted file mode 100644
index 4878ea49..00000000
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0007-v4l2object-Attempt-non-contiguous-if-contiguous-form.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 8d29018dd31be2045f6724db0942ae1a7da0a789 Mon Sep 17 00:00:00 2001
-From: Brandon Brnich <b-brnich@ti.com>
-Date: Tue, 10 Mar 2026 19:47:35 -0500
-Subject: [PATCH] v4l2object: Attempt non-contiguous if contiguous format isn't
- present
-
-Gstreamer previously had logic that would set fourcc even if the format
-being negotiated didn't have a contiguous option - YUYV for example. A fix
-was sent to properly set either forcc/forcc_nc properly. For formats that
-don't have contiguous formats, that would mean attempting non-contiguous
-options wouldn't happen. Attempt non-contiguous formats before erroring
-out if applicable.
-
-Upstream-Status: Inappropriate [TI-custom]
-
-Signed-off-by: Brandon Brnich <b-brnich@ti.com>
----
- sys/v4l2/gstv4l2object.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/sys/v4l2/gstv4l2object.c b/sys/v4l2/gstv4l2object.c
-index dbfe4992be..b4a7c32f31 100644
---- a/sys/v4l2/gstv4l2object.c
-+++ b/sys/v4l2/gstv4l2object.c
-@@ -2167,7 +2167,7 @@ gst_v4l2_object_get_caps_info (GstV4l2Object * v4l2object, GstCaps * caps,
-
-   if (fourcc)
-     fmt = gst_v4l2_object_get_format_from_fourcc (v4l2object, fourcc);
--  else if (fourcc == 0)
-+  else if (fourcc_nc == 0)
-     goto unhandled_format;
-
-   if (fmt == NULL) {
---
-2.43.0
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28-arago.inc b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28-arago.inc
index a2204efb..d9e0df88 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28-arago.inc
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28-arago.inc
@@ -4,10 +4,8 @@ SRC_URI:append = " \
     file://0001-v4l2jpegenc-Add-support-for-cropping-in-JPEG-Encoder.patch \
     file://0002-Adding-support-for-bayer-formats-with-IR-component.patch \
     file://0003-v4l2-Changes-for-DMA-Buf-import-j721s2.patch \
-    file://0004-v4l2-Give-preference-to-contiguous-format-if-support.patch \
     file://0005-HACK-gstv4l2object-Increase-min-buffers-for-CSI-capt.patch \
     file://0006-v4l2object-use-actual-stream-resolution-for-encoded-.patch \
-    file://0007-v4l2object-Attempt-non-contiguous-if-contiguous-form.patch \
 "
 
 PR:append = ".arago0"
-- 
2.43.0


