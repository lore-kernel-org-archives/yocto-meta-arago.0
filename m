Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30112C61DFD
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 03:03:25 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.976.1788231798337812490
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 31 Aug 2026 20:03:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=R7nF9/BA;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=Ikca/p9L;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: p-bhagat@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 681339hj2619329;
	Mon, 31 Aug 2026 22:03:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=UU7eaZQl5vJTyvLEBxR0Ngcph2i1CNjLwYrs+XnHB
	pg=; b=R7nF9/BAxaeeXgxxHSVbcnQbfj+kkf2fQE6OMwW/uASrFt7WHq+0POjQ7
	KN8YgJYMFKypcrzLLkGTRTSyljgagjIhBqAAz1KHM9nXex0DA16lSq7y/s+OWjCC
	4Gc4Ii+Eup2qiEUWuHa/Ve56qYzqGSFgHqSuSej0Ta4SzTbsE1Po2T+RWjdnDWj8
	NOTti7ShYsuLzAvRMOexbDeO9BM/DC+iElSussCoH6NYiILPJ+YGZ3aCPv5acxf5
	iYTIKF2u+qcLtG5KaJulR4tuy5Yo5z6Dj774uXLFBOv8VgHvH22It5I/m8+ur6Aj
	XIMzol1k9l/iVQ3LyxczIzSGF003A==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010002.outbound.protection.outlook.com [52.101.193.2])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gdpfag00k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 22:03:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VZDkN7PQdtKLvZd4wGzu9DqWrMCD8Wvt0DhYC5RSUcBSxfB0pBjiKazTGFNiagLQatNynd2mr7IG+he/z5DMsquDeuNoc9mTQzLwd/QHGZgL/Ge2JiWaqSwWKlqvQSemYRNjXACzgGBUMO/NtNd/xZqYZ0kOstDscEvztIkY1fqFC2X6fq+JAaQJT6gBZ5JirWlaBRkZaa2oWRhc9WdZm4tTYy/RXMHkXOG82B2zwOuQc3U1+fT4uVJ/yH0/NwaQidMmWti0n9tSqjTQS8cBXuoHoVT3D2Ztj0IR8AZeOW/whCrkx+1wPt/G/TJrP6/NE9jEEooTMjMMI6yrlS1oAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UU7eaZQl5vJTyvLEBxR0Ngcph2i1CNjLwYrs+XnHBpg=;
 b=Ts02phpW+yttTktbwSbybh48oqE+Ios7Q9d+qmuU8u1G69G7H+Rr4WNpwndRrOu5PA7Waw5y/F/AfRbKIz4HihMchi3ZRQDGET1oawtYKx4XWb80ULeP7UhsTxJ73aSn8T1D3/VwL+ajnaz/BtGx7HQfZ+3GKtIehqFW3JSljkSA3Cl5isVxcF292ZhJTjqFAuZyhQ4RQBOKSVEFy0YqYx9zkAU03Hio6W5h7LzKEfdSX14xak7cCTN6D6mxno0P0TUvaRw5RgCKw6xp4npZhqsaljakLPKfVww30oXF1goY3xJKnHfS7U+BOoxD6uUki6f8/UVTsaugfpkvRJDiDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UU7eaZQl5vJTyvLEBxR0Ngcph2i1CNjLwYrs+XnHBpg=;
 b=Ikca/p9L+uWVG9eWfKAZPnGmqxX6Jy/hA3S+Rpb68DiaT2bEzmszYqBkemiCmmHsUO6vtJ3xC06qgQloWTGySUm4NATnhrpUorZd16H3iBw0gNGXJwY4kRJlkd09qRLj070keTnFJo42bYmRG8Di1Xfkf/UyvKzdxsBHnQnxnHo=
Received: from SJ0PR13CA0046.namprd13.prod.outlook.com (2603:10b6:a03:2c2::21)
 by SA2PR10MB4474.namprd10.prod.outlook.com (2603:10b6:806:11b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Tue, 1 Sep
 2026 03:03:13 +0000
Received: from SJ1PEPF00001CEB.namprd03.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::9c) by SJ0PR13CA0046.outlook.office365.com
 (2603:10b6:a03:2c2::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Tue, 1
 Sep 2026 03:03:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00001CEB.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Tue, 1 Sep 2026 03:03:11 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 31 Aug
 2026 22:03:02 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 31 Aug
 2026 22:03:02 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 31 Aug 2026 22:03:02 -0500
Received: from localhost (ula0502350.dhcp.ti.com [10.24.52.241])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 681331uN1966878;
	Mon, 31 Aug 2026 22:03:01 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <reatmon@ti.com>, <v-singh1@ti.com>,
        <c-shilwant@ti.com>, <y-hegde@ti.com>, <afd@ti.com>, <j-sahu@ti.com>,
        <praneeth@ti.com>, <s-sinha@ti.com>, <s-kapoor@ti.com>,
        <p-gupta5@ti.com>, <r-soni@ti.com>, <sen@ti.com>
Subject: [master/wrynose][PATCH 2/4] recipes-multimedia: Add PipeWire bbappend, service and config files
Date: Tue, 1 Sep 2026 08:32:31 +0530
Message-ID: <20260901030233.686017-3-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260901030233.686017-1-p-bhagat@ti.com>
References: <20260901030233.686017-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEB:EE_|SA2PR10MB4474:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dd25595-bab7-41f7-27cc-08df07d58ead
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|18002099003|22082099003|56012099006|3023799007|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	6XSKb/46rjpKGq+wr3l7yd2gOjVwYO4D9KU5eZqUNQzRf0YyyfhZtKj2hT1Bg6xbxYpMCINyRSEcisiQImlFsA+jKhbzWw3pJPHPVlYHjU05ksoPk8O+vhljg/GngDCf81vxmrr4/Nykpf061Rw3ctk4wK9RlY6XcSZAALDHkMvbeSsGYbZMGC6EztnXVQqjsYOfShunE8ZWPg8XT1uSeayY5ui0EXaA0jIwUsc6VsiD2Y//0O8YFCmjcUis0WaqQr9eops7odiYSSQ7kNIOU45nrZro+GPMWmL6/2pM53DQBWvxGGOVfhOnlZDujx1yDcWLKeUrOB1m09vQ7+wKTt8qQOmx4ySSNTmPxGIKwp+HL5UhnqPMiGFTtSEgc7q9THCQ9Io1XgulXssaXLudqjCxZ2qvdqGNysLyp294T/X9Hc/qzwJ/p3LlJjIPhxs8pr4KzClTTA/+/t010ffXooQf6bAjarzx3jhyxpTR09ZXniwskuPtGdSLsolyTGUY5hzYVQg3PZ59QtKJBM/6zBKCP1qp814Pi0wBF0YkxR6gUE7OXk5u01NAy7rw6q4+wb34Y9m9tlXSWSB7vr6I8c8DoBTbxEvh++E0aMI0R3CHSZj3k1q8JO1sVXO9+Nh9I+5Fet/cG0Ivt9c5VgajYgnle0t9isV6QUNe+ZiR4lIsl2FR3+oX3qBgb1cqstsGo9cbqJiK1b9RJjhvR5Lhjg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(3023799007)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	fYlNmlpUlWzRy1V39YeZc01y8yEzAMzfzPjEkVA5gghJny7GYwAJSwafuB39pkN9gbLQ+aNR8IB78d1+qWjlm8MKjGcHhwtzKH/8YXfQjY/Am416FDA+Y2aqnjGim+BnRTdsgVK+DwNfyDw+MGn5EIlDVA7K2Ly40q7JRhjHWLY92fdl1uzmWTq9sZjQ6fzwkT4NUK/UD+2tpSo/9J5csPkyJYBFpVm7QGifi5r0DQ9cwRNryUs8iL2MujJJvIkyZWp4FjYSwtFM0iiycwiGIB64O4j3R0dS55zqpJ/m8kKBMTOBtqUdmKc+YPjVZWg6uuXHZGCP6uqE7VPkQ+BFT0PK7zamS27ZlaTqaar4uoN0NPfxHxNzwQYPWl/v4nvVMooXiAduQg79yQxHLHawjfLezasRLROlYEbFCRU0xqL9m1Lfd+1/s/m6X5GvS66y
X-Exchange-RoutingPolicyChecked: 
	3a0LP7RkzDYOGWee1W5fKPtBUJikP7W02RawG2wyt7UAm513vL7Acs67Xeuxvg9tFHS95q37seoYONABRwcQu1wm35xBZ1MXyQcS7Gw43EdmC53DOnp1uvrpwoY4dc3YVCWte5xDETEEtVp5hdIPb2V3TSP8vC26zSj3zSbaQEI577SY5/HDv2fDfAg2pBhYa2gRvj2lModDMiGt3NR+hrb9CeA7TZXteb8xESgYf02PMyriVXK7IdAhO+VvC12e9ripwFKo8cR5OThtLXdKbkr8/SoqpQHYwTOAVioFfHtJPIw7JkCj87tSX2yG8muNA/WNKX8NUQ3H3UsIQyfgaA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 03:03:11.2398
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dd25595-bab7-41f7-27cc-08df07d58ead
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CEB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4474
X-Authority-Analysis: v=2.4 cv=Cp2PtH4D c=1 sm=1 tr=0 ts=6a964074 cx=c_pps
 a=NtDnjKqRhcbz7rYDj/0C3A==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=tfc8JHuBm_BX2qARNwsA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDAyNCBTYWx0ZWRfX4tvHuflboBVY
 zaju+7daz8f2yZvsmEFELdfsE7ZeKNn9cYxhFTXtsv7w3l1CdWwCOYNhKYsJ1ukx5hVtJw94LDD
 kNXax8ZtxAlzlpMyTAm9uYr8P0Cc2HxasTdUFCB7mDGkkBbhjBmxwIzLIqTe39zN6dIg6a4kxyb
 FxkofL1g1OPBzaKDIlnrNhlsDQpKsnR+a8n0vRbiTA0/h7eVQwUdp8PlDAQNlsHZiJV83AW7+EH
 jSP0JVNyCH1w6IoEgAxfnInG+dx1KRXwjt0ghMGMK9K3CTieWEJhjmT7bZRhBLEI6tDoIhoGbRl
 zxhMuEGmh6Wpbac/k2oJX2lflyyNGM8HXf+MN7XLviHrK0K6x7DzjtCdm7QW7vA1NKq/bZAU4NR
 kWzBxlaKVA/fnAJ0D3SwccyyoLYR9n/gEqZcGg11nFMJ8KAZI0DZFIHdHU2ydK8/tO5RKTPXqdW
 pi51dsj04atZik/cMcQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDAyNCBTYWx0ZWRfX8zatmH2pS4LN
 0ZaX8Kppnf82dA7Sz5vR0R87u0sOVIE5YuLNHBdxTy7uxk5J585Ju7LJy3RIEfMaGfs8b8m9eUs
 gWJzRTD+FDPf6JO8RaUw6fInAasDzEU=
X-Proofpoint-ORIG-GUID: 4Mik2oZoquMAvOs60hus0zrpD8ECbyN0
X-Proofpoint-GUID: 4Mik2oZoquMAvOs60hus0zrpD8ECbyN0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010024
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 01 Sep 2026 03:03:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17639

Extend the PipeWire recipe to add platform-specific ALSA configuration
and service file. Service file added to start PipeWire as a system
service with proper socket dependency.

Add sink and source configuration for 8-channel audio playback and
capture on the AM62D2EVM as the default configuration is 2-channel.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 .../pipewire/pipewire-arago.inc               | 28 +++++++++++++++++++
 .../am62dxx-evm/90-pipewire-sink.conf         | 21 ++++++++++++++
 .../am62dxx-evm/91-pipewire-source.conf       | 21 ++++++++++++++
 .../pipewire/pipewire/pipewire.service        | 26 +++++++++++++++++
 .../pipewire/pipewire_%.bbappend              |  4 +++
 5 files changed, 100 insertions(+)
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago.inc
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/pipewire.service
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire_%.bbappend

diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago.inc b/meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago.inc
new file mode 100644
index 00000000..b3e0c555
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago.inc
@@ -0,0 +1,28 @@
+PR:append = ".arago1"
+
+# Pipewire service for all platforms
+FILESEXTRAPATHS:prepend := "${THISDIR}/pipewire:"
+SRC_URI:append = " file://pipewire.service"
+
+# AM62D-specific config files
+FILESEXTRAPATHS:prepend:am62dxx-evm := "${THISDIR}/pipewire:"
+SRC_URI:append:am62dxx-evm = " \
+    file://90-pipewire-sink.conf \
+    file://91-pipewire-source.conf \
+"
+
+do_install:append() {
+    install -d ${D}${systemd_system_unitdir}
+    install -m 0644 ${UNPACKDIR}/pipewire.service ${D}${systemd_system_unitdir}/
+}
+
+do_install:append:am62dxx-evm() {
+    install -d ${D}${sysconfdir}/pipewire/pipewire.conf.d
+    install -m 0644 ${UNPACKDIR}/90-pipewire-sink.conf ${D}${sysconfdir}/pipewire/pipewire.conf.d/
+    install -m 0644 ${UNPACKDIR}/91-pipewire-source.conf ${D}${sysconfdir}/pipewire/pipewire.conf.d/
+}
+
+FILES:${PN} += " ${sysconfdir}"
+
+PACKAGECONFIG:append = " pipewire-jack"
+PACKAGECONFIG:remove = "jack"
diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf
new file mode 100644
index 00000000..86481af6
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf
@@ -0,0 +1,21 @@
+# PipeWire source configuration for AM62D.
+
+context.objects = [
+    {
+        factory = adapter
+        args = {
+            factory.name           = api.alsa.pcm.sink
+            node.name              = "alsa_audio_sink"
+            node.description       = "Audio Output"
+            media.class            = "Audio/Sink"
+            api.alsa.period-size   = 1024
+            api.alsa.headroom      = 0
+            api.alsa.disable-mmap  = false
+            api.alsa.disable-batch = false
+            api.alsa.path          = "hw:AM62D2EVM,0"
+            audio.rate             = 48000
+            audio.channels         = 8
+            audio.position         = [ FL FR FC LFE RL RR SL SR ]
+        }
+    }
+]
diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf
new file mode 100644
index 00000000..71b7ec76
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf
@@ -0,0 +1,21 @@
+# PipeWire source configuration for AM62D.
+
+context.objects = [
+    {
+        factory = adapter
+        args = {
+            factory.name           = api.alsa.pcm.source
+            node.name              = "alsa_audio_source"
+            node.description       = "Audio Input"
+            media.class            = "Audio/Source"
+            api.alsa.period-size   = 1024
+            api.alsa.headroom      = 0
+            api.alsa.disable-mmap  = false
+            api.alsa.disable-batch = false
+            api.alsa.path          = "hw:AM62D2EVM,0"
+            audio.rate             = 48000
+            audio.channels         = 8
+            audio.position         = [ FL FR FC LFE RL RR SL SR ]
+        }
+    }
+]
diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire/pipewire.service b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/pipewire.service
new file mode 100644
index 00000000..c26bf93f
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/pipewire.service
@@ -0,0 +1,26 @@
+[Unit]
+Description=PipeWire Multimedia Service
+# Ensure kernel modules are loaded and udev has finished device processing
+After=systemd-modules-load.service systemd-udev-settle.service
+
+Requires=pipewire.socket
+
+[Service]
+LockPersonality=yes
+MemoryDenyWriteExecute=yes
+NoNewPrivileges=yes
+SystemCallArchitectures=native
+SystemCallFilter=@system-service
+Type=simple
+AmbientCapabilities=CAP_SYS_NICE
+ExecStart=/usr/bin/pipewire
+Restart=on-failure
+RestartSec=2
+RuntimeDirectory=pipewire
+RuntimeDirectoryPreserve=yes
+User=pipewire
+Environment=PIPEWIRE_RUNTIME_DIR=%t/pipewire
+
+[Install]
+Also=pipewire.socket pipewire-manager.socket
+WantedBy=default.target
\ No newline at end of file
diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire_%.bbappend b/meta-arago-distro/recipes-multimedia/pipewire/pipewire_%.bbappend
new file mode 100644
index 00000000..dc32422b
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire_%.bbappend
@@ -0,0 +1,4 @@
+PIPEWIRE_ARAGO = ""
+PIPEWIRE_ARAGO:arago = "pipewire-arago.inc"
+
+require ${PIPEWIRE_ARAGO}
-- 
2.34.1


