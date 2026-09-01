Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43702C61DFD
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 03:03:35 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.979.1788231805252962987
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 31 Aug 2026 20:03:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=VZvMPNQX;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=jlbN7CpP;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: p-bhagat@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 681111fD1146946;
	Mon, 31 Aug 2026 22:03:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=PPIqtprkyUYuIIpZxj53wRI8TsKw22Y8L2k9vMuMC
	Sg=; b=VZvMPNQXpWY4X4O+dtohp31KnGXPzpSycVzEsI5xdjFnQW/OIKYhAa/HC
	p14XvqaQqhm04f6O0epNqWVtgJRMpi2tw6jiuI3w6xyanxMfd1M9PunymGDVtDl6
	yWCZtjZzL7nZnB9y1zN7lsuR99f1G7X3tTHkdanErteBAWhgVutAouTtqqQIgLUa
	51V1CTisj/A4LkcLqz1RpUwShuMO1uHk9V/Wq/HUZFIg+nUP8XZJKV6YysCL33CA
	oQipj2sfffJVzivmUQBfq6eKQ2dgPJIsFzPxty02POZXA32TkzpwXV2XelH1XvCP
	sbsyt5bwhcBQTuwcf277szenH07Gw==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010019.outbound.protection.outlook.com [52.101.85.19])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gdmp2gqtv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 22:03:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k/jLYKjNWxy/qm4Ugl+/oyRPO1IctEyNbDAOgsIlRmEKwhwEYVXy1PSkj2bqNSaGjNciLd7/WFAVc6Cu9Y383kG9aUC7IM34OfraakYfzbRryCVbWrAcyVgww8z/sigasgp++Y6KwuKRn4aNtBdWLF5OLhq131Xvo/3mdFuBeGqJmWTDgXlyZD92i+BeuDCa2NlISTQk98eJeiONd3wmTqsh9UwA2mB2QklF8dcn2C+lEP0tqF5piCfBkbTQaxbwlCjeOiQQRx9SnENPolU6Nf+OIkZvjJgtHTCn1rPWkcwzyWEkXFCZHCvNbE8xE8vAeDvIzTalFDin3KL1ZKBMIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PPIqtprkyUYuIIpZxj53wRI8TsKw22Y8L2k9vMuMCSg=;
 b=MU8LF49ienGvFnOSnf1usJXNqKDsq7H2Z+5fSzMfkry0Cpkz9idCN9ZBGmeiPrTYTWaAA4271fzd75oIhQNS2MRivsqhnp3gdhMzKD0xT1EOgevWlTaYWC+ruvoQM7zc5dNn5YTgN6gs2z+j/WLRQpYL+MQhk9FEO5YyzQv8hnFIes82Xng5XUXvJf4keg8w9OiXummrFZCDXvZN71WpoIIg0m9idbG5Xq0z/csfgUuQRDF25VpCEKgS3EEErQ86E6ua4Qq+qUBQjkkVoKctcZljSRKL5o234WN6QVGcq8JXAMFS9XVyWQqHKJN2q38V3x9Wenu3lSx/08Q5gGETHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PPIqtprkyUYuIIpZxj53wRI8TsKw22Y8L2k9vMuMCSg=;
 b=jlbN7CpPtpQMJEU5CdRmqEbnYrX9PGcuvXFCLBKlulculyoGw5OHsVofP5+EEqSJEx8O1Dt5Fd6gmaY7FabK2EBMGf86oNWOxwRLCeGdx+HohaOlEMQvsdgu3TQ3KJVl+/wPuY3GS1mqZ6xfwu1HnLtUNLOC1tC61OrKOd1i6ZI=
Received: from SJ0PR13CA0060.namprd13.prod.outlook.com (2603:10b6:a03:2c2::35)
 by DM4PR10MB6183.namprd10.prod.outlook.com (2603:10b6:8:8b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Tue, 1 Sep
 2026 03:03:22 +0000
Received: from SJ1PEPF00001CEB.namprd03.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::89) by SJ0PR13CA0060.outlook.office365.com
 (2603:10b6:a03:2c2::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Tue, 1
 Sep 2026 03:03:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00001CEB.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Tue, 1 Sep 2026 03:03:21 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 31 Aug
 2026 22:03:06 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 31 Aug
 2026 22:03:06 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 31 Aug 2026 22:03:06 -0500
Received: from localhost (ula0502350.dhcp.ti.com [10.24.52.241])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 681335Tf938826;
	Mon, 31 Aug 2026 22:03:06 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <reatmon@ti.com>, <v-singh1@ti.com>,
        <c-shilwant@ti.com>, <y-hegde@ti.com>, <afd@ti.com>, <j-sahu@ti.com>,
        <praneeth@ti.com>, <s-sinha@ti.com>, <s-kapoor@ti.com>,
        <p-gupta5@ti.com>, <r-soni@ti.com>, <sen@ti.com>
Subject: [master/wrynose][PATCH 4/4] recipes-core: arago-default-image: Add PipeWire audio stack
Date: Tue, 1 Sep 2026 08:32:33 +0530
Message-ID: <20260901030233.686017-5-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260901030233.686017-1-p-bhagat@ti.com>
References: <20260901030233.686017-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEB:EE_|DM4PR10MB6183:EE_
X-MS-Office365-Filtering-Correlation-Id: c8f92205-3145-4402-0ef5-08df07d5949d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|6133799003|18002099003|22082099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	lnOt9Uja3cwoKVFKiR6jbqThRO0PnxLfE8J0FFD4SDS6A2YwENWT5AbJ7LdxSg6feRAEBxnQIlwvCm4Svg4RVfd7NzqJ7aqv9TOfgRZwoYikGdZ7SeTUx01vtRHv15PwEkA5SnJ4wE/ETfLKVD4XD3G6MqXZag8kiaoBzUHHm2/NyZH5GS9kyNK8//LjpGWuug1sMujsABNXtG2JyZ/ciywP3VSWgSWVEZEQCf6akWxgzUcFDRR0ZclUEJY6JmCmlLD7tt3M2+xATK7Lxs9yg9dpKuwWEPFQuhDLFFg5Te5fJduDjYibWV8QNkNRq+tYLaYX8CeFG7Sa6Bn1qvCewGwxg0ULBlu5QyXEfwfvjD/b64DvLqgzNzAgUNs8Fl/Q7P9jEJ1VB6jRBefRf5U3/6vLhldPCJ/lCGXx8p922omQJGaf+alvlseOmX6jXX9Rooo3hbN7i4W62rSFkv6Hy51kj6h+s7oh00WvhJ3dY+DV7RebZzK1qu0hlKmxWEUCc6JC8PZ7niEt1n4L2fyk/P0SQYFt69+uFUXz3Oqh+u25k7JUevcUCicO43rQyTgUp/mjgCdiF7ppSiGjY1/C3J7dNVtlYAf1+wtSXcVNUDglYNjRIc2CXP/xKiDZ8nNCx+KDL+Ik3yKRFvhL0SqDrXGAZTP6h9sQ4PRJW7Ru2TEaSE7GG3zygXMnCNfWf7fEEyI4dkc9bL3Ht8hZdeqDzQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(6133799003)(18002099003)(22082099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	/2QipTO68HHQeq+AfZXQY7GrrRNb+POghfyTyR1MtUA//oPUWBxTg55nucDDZPlrE0IDpw4H4iYNuBTPpfrrjH3HoszMagRrhqufsjdpHoyvoh5jWnq/oYK8TOuRhd8RoRUx/4yvtlpW428/qDY57t9hA7uUfvF0GS4V1d8Ei6M5wNKo6vLAbc61W0+el3E4/MpKiFQMdfEQ1IkvBUSmMOILbM+cnZwL0Zp1HWmC1Lxz0ptc65/9mU33w971GF8GOlptOxPjiNdntbgP1XumvofJZTr2JRIB5NfxdKNAWcm3xoQl773yx3OFb/0gzCpzXTrptt0H7EcVAWSOnBoBJI/gH0KN22nQkpiEfUOZjWPkNd3RatlB36JsHYu8t4CWKlP4RUjtTC5p0j0g8Ev36v++cJAHrqwbm+ycyUV8GKS5EfQtfkBerLRqYJjFnay0
X-Exchange-RoutingPolicyChecked: 
	k3dcMsYd2csDpPEGhrETGfjNB/mN9xeQIrfNHMePCRnNgscbAB+dMHAdwh0Qaap+KqQ/ZxBRPcjLJW2DXJOpVfFVzrCBIor2MsKmWnPIGz93b/iCl4UKIzHu5OSjJpSq+TroFNI483GWVNRAVW9hyqZ/e+w/BpFvVEtK2cf4Hglm1Mkl13dFxSFhXHEZHmUIzLfJEunlw6M8I/PDi9cjiQn4AQT2Eq8sApBK+XywCN+uZgTnNt/2FWgdQ6dmGoBsxBfSE91PVM6mGMl8hB+ViOXWlpalI7CJEICHY3SmSd4+GJxGyDs9IH7GDFEAZbp2WTzsY7rzKNWZpnoySNcQVA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 03:03:21.1415
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8f92205-3145-4402-0ef5-08df07d5949d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CEB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6183
X-Proofpoint-GUID: XwDPJ5OTA868mih8cpW1ypmSvwO9IKKl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDAyNCBTYWx0ZWRfX40/d1/PwDpxR
 /y8OGzmr6eIko/ZinTWperdGh/7NM31NB5LcGVH0O4r1Mt5Or9Goa6edPtz7zbWjpDlJfsCh2SW
 bjGEXDekZ3tQWZ5ow6GHaV4koD9mspvCE246+eLSfA8mpU+kdBIOojJSsNMk+yWu6AcYphYqqLd
 iKiuX5pR17qVyWFXhFtQA9m3XKcNHC62ENFtxlRBQIHSoct5jOjkv2mPutLU1KX/nLeMJBGBDL3
 4bIjN9zRUF+HCqx/wfHSRdAdisHPx2t9IeiKkuH7/uwoYn12x1HdjnXP7S3xRkfFTRRSS27RWNd
 u6IBG7pMcUzbVhOtw0q5uD9M1kafzdimZrAveCfBbkwEdKQWzZsD2BN/PNj+CAfh99IoDwUm/qc
 Si/YJ6Nfb1uKX8aGJW8hem16PNiLJey6iUvZAT5FfK/Qdx7YffVwRCs1vEu7RT/fo84QEVFRxC9
 tv/+aWAVfVFhg9FAFBg==
X-Proofpoint-ORIG-GUID: XwDPJ5OTA868mih8cpW1ypmSvwO9IKKl
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDAyNCBTYWx0ZWRfX0PgIraTVx92K
 gWOwUdIvV5mUZYTA1LMPbuY++JaRRHcmCkL//j79noDEBc1u8NaZKCiwTOQ9HvZRw+Sre9un5+m
 kiTvR28avyJcZamd5WwddEHRr3TCPKg=
X-Authority-Analysis: v=2.4 cv=QuVuG1yd c=1 sm=1 tr=0 ts=6a96407c cx=c_pps
 a=fdYRkKHAJehZsuGPaltaPA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=5xKsKj-xuoGtBIhO-7gA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010024
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 01 Sep 2026 03:03:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17641

Include PipeWire and WirePlumber as the default audio stack across all
platforms. This brings in the core PipeWire daemon, ALSA integration,
PulseAudio compatibility layer via pipewire-pulse, GStreamer plugin, SPA
plugins, and the WirePlumber session manager.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 .../images/arago-default-image.bb             | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/meta-arago-distro/recipes-core/images/arago-default-image.bb b/meta-arago-distro/recipes-core/images/arago-default-image.bb
index e01f7c2f..87b55a68 100644
--- a/meta-arago-distro/recipes-core/images/arago-default-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-default-image.bb
@@ -43,3 +43,23 @@ IMAGE_INSTALL += "\
     ${DEVTOOLS} \
     docker \
 "
+
+PIPEWIRE = " \
+    gstreamer1.0-pipewire \
+    libpipewire \
+    lua \
+    pipewire \
+    pipewire-alsa \
+    pipewire-alsa-card-profile \
+    pipewire-dev \
+    pipewire-modules-meta \
+    pipewire-pulse \
+    pipewire-spa-plugins-meta \
+    pipewire-spa-tools \
+    pipewire-tools \
+    speexdsp \
+    wireplumber \
+    wireplumber-dev \
+"
+
+IMAGE_INSTALL:append = " ${PIPEWIRE}"
-- 
2.34.1


