Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C21DC982C9
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 16:07:11 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18710.1789574824183151239
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 16 Sep 2026 09:07:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=hXDBvmYj;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=iTxQPQfc;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: p-bhagat@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68GFaRCr3174549;
	Wed, 16 Sep 2026 11:07:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=bI/wOvpSZyH64BH3T5O1Yk/QOQzoTW6TKgzcT1wCV
	tA=; b=hXDBvmYjN+QPuIZe0nZiPqBYy855jyz0DGvXPhba57PuTraZ+L6jgh3KQ
	PD4DfNpiHtLhoeZYZra/s/tSyl50eZE3vDWFvnmoFb8vFdzymQsVSe59ss6xioWE
	Xf6Itp0x0vcYirbqUStJsCyU+EcPrkei9AjPrkrG0qZWtI/Kv/843bFeV7HCbGUj
	ZqR4coMduffbOtEd6gN2hR9FLBhaHMAwmZPGYs6LTLgwWN3Dw48JgsmMUpZOkzKs
	FgrVhwdjDATKF0GQbsuWhxpumjSNgd4R0qQkii59KrUSqB5eLugeA0Qa4d+j4T90
	D5czRnoP21dJEb/i0KLKv3C5OTqhQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011012.outbound.protection.outlook.com [52.101.57.12])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gqqmejgab-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 16 Sep 2026 11:07:00 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NUf8cTE6eoTM9H17gvKidhzJajkTX/qYLf/85s0LP5UFccZCz6JadgK5tlEzTXEx8lMYILf7Ft66zmkG9VgjS6gKoWCJg3u9AHyeuBB+jrWepuI4ZrXdVmxKcT/qvWw0l1OpePIw25zU3+pv/QwWFID4BGCbR9qRLBSyVvQ88xhO9b0vLpUsdYwe9bwejEt3a5VMPKyyvOnRUgOIouW9cagy/HvkB9LF5ZKWu3zm9MgfTfR758GVwySAtcCC0LsSff9rrt0nAKLTzZh7xIDfU1swOw0fyug5LU3OWzdqtpYIY1bSL4r7pkiUY8RNK/A4wVXB22RBmP1nqihR1OfI7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bI/wOvpSZyH64BH3T5O1Yk/QOQzoTW6TKgzcT1wCVtA=;
 b=Wsp/BQURr2LEpEndnfZ58whT0GNfqfgHFfCV99cL7ECTEoBoXuIN1aYUq9cBZoCQAtwYAr6IuPE+6OTU0jipnOKNooZnUTq4OBVTeOs0fMysxr971U66q1tvNeLhhvaQjgPveJhCm9how9TVKqsd54wIU4nUi97IWFBEDVkqoZvfLyDvaiihGCWAezPpZhtoaudqytM7wN0SucPCdOEkJt6sr6Dt8Le6lMDV5yjHA3gbfRmFPC8t5gW4H3l9FuuKw6zBXfAH/WTp3430T3uJN52y4M6awZ4Wt3opadbudDOsGvMTSR9YzhUoZzNF+Wq2awcDxiuXEnRJAaeH3TUYDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bI/wOvpSZyH64BH3T5O1Yk/QOQzoTW6TKgzcT1wCVtA=;
 b=iTxQPQfcx3BKy2p9GFnJDoaHm8x6OwBJ1L8iBRA88B9wU1i7GVuTh6Vfu/bU5M/V2v5e5GWXr9hQfIXNHqbZ+B2ckaIRJ+lpjBQe2ZFm9G5qTHB9gdr/GW1kFrG9vm7O1plCjcmpVZPYR6DkYzAq2Wyt2Z9b1uDFMZ36EqgXBio=
Received: from DM6PR04CA0008.namprd04.prod.outlook.com (2603:10b6:5:334::13)
 by IA1PR10MB6710.namprd10.prod.outlook.com (2603:10b6:208:419::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 16:06:58 +0000
Received: from DS3PEPF0000C37F.namprd04.prod.outlook.com
 (2603:10b6:5:334:cafe::48) by DM6PR04CA0008.outlook.office365.com
 (2603:10b6:5:334::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Wed,
 16 Sep 2026 16:06:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS3PEPF0000C37F.mail.protection.outlook.com (10.167.23.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Wed, 16 Sep 2026 16:06:56 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 16 Sep
 2026 11:06:38 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 16 Sep
 2026 11:06:38 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 16 Sep 2026 11:06:38 -0500
Received: from localhost (ula0502350.dhcp.ti.com [10.24.52.241])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68GG6b5M2261243;
	Wed, 16 Sep 2026 11:06:37 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <praneeth@ti.com>, <reatmon@ti.com>, <v-singh1@ti.com>,
        <c-shilwant@ti.com>, <afd@ti.com>, <j-sahu@ti.com>, <p-gupta5@ti.com>,
        <r-soni@ti.com>, <s-kapoor@ti.com>, <s-sinha@ti.com>, <sen@ti.com>,
        <y-hegde@ti.com>, <devarsht@ti.com>
Subject: [master/wrynose][PATCH v2 2/4] recipes-multimedia: Add PipeWire bbappend, service and config files
Date: Wed, 16 Sep 2026 21:35:45 +0530
Message-ID: <20260916160547.1287287-3-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260916160547.1287287-1-p-bhagat@ti.com>
References: <20260916160547.1287287-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37F:EE_|IA1PR10MB6710:EE_
X-MS-Office365-Filtering-Correlation-Id: d5d6702c-86a0-4193-7bf3-08df140c87fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|36860700016|376014|56012099006|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	3TK2pb0FDG+KeAdDrix5pHvbXwtPusfTRlfghwsavhko967tSwp8piADXsVvMpq3wRJfthwY5dadSkCFOgE+4qVDKCFx2kLNedq91TPOvG/9oUELt6q5u8f5FCDEbOboPzf1RC7FdaaNG+BESrhiWBObL86UdHQ2vXBJXGjEpZn6iSg824QQVwuubYvmORHrTpOHDsFIQigYPEJtBwXbCewDLEd7HBix+CLeP0vBZr7jkXbfhd+G99o2J4G028Qcpv751LZZbg8t60modQ5VParScm7q6E28T+IW8SyzOx0R6IkqPyLkaeLhbA1R7w09o/SyEN3zl5QzfP15Hwjix6ZG8vH/vKrutp7q0M7onaHP1natLnYhule6oN5GB0xJF87Czmyffboi5Qo5nNQke2ZweSJfsS7QNjS+A4qLJ1Ncohktl9q0ZXaHKHf6sMOYUy5ZaqgtRGMfAA8ZUKaIbxfq1x/e1e0wz95VxaWHsu3K/d2Z+b3uhxniE2ZZd7k6mfZY2Xy2hvaaU7+WjrM4UoucXP6RxK2sNqwr6w16lfkpgCZODT+OiJsRQiVTjNTISbgPnidFo+7RsvHM6765J/clLX99GIm1pWLw7W7GXDIyWvisOK6qftL6P7aJiIPg12ACy+9hGpZ4J1Fz24P7HnTnx5hFWKvXG50EZOQWaklGqvvkf+e8BBdm0hvaZcBVBB4DU/UUF0wN0MwAwcwizQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(36860700016)(376014)(56012099006)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	4/9ZRERqzYVvEa1RGCiX38X+oXzd4/Jsq0bceyKN8zZQujy6Pg/IugiGLMyb/PHsN1Lke4m35drUTRFq8SM4H3KOWP7bKsTvLHrQiCMWtFftv5rRJ1hvEk7dvrcyDlR888N7XnG8+kG441iFVGeOsW+5Du27gFXOz/gX7ousWfv/HFa5X+7+OozGoROMDYAu91qlFVy63AEwbgOZo/GQHkBaFoo6De1jxPLKr0wKqe1js2vraLOV2geRHMxkGPqsRLkE8MupXtb7Cv7TcqoPnF3JQH14zU2ik7H59ICgIavK36jWEoDArIQlODffNKjANvYkvoHAy9NBOZYjTwpTLWmeLGsIp/yNeQBZdHAdMUqO7M9gccHh+ySgqbdTB2xh8/opPfsCtFfQQigfhOxAP9F1E9Qcj+LSw53oGxjmex154zUuKGRPGxdR9mcJWLF5
X-Exchange-RoutingPolicyChecked: 
	f4+2dHwP5+9uatpCxvuTWy5yfs9zHogN5BWdd0QSc61rSQbwh6WjDVLUX+08CLIYLtxNWwGFSzeREsRzWuDPzoWJQ+tFpQtJt+xROILA6615ufromE8IuASlfr4mPidsbarHe87zEZrDb/d7/BB4eRpIVUTU9RgZ95u4PKOxmSMaY9T1Cagq4bgFfcOOHuIP6sPyIq2CAV3puB3G9zZDJ388aQggyLlDCrq2oiJbCD9c1CpxvdUr5BXuzSSJg0lesixkaR+j/pTw+tektTNEuIdjgz4rRPIbW1ugfV4GOg7z3NpOcRT6YSCnjmbf1Zec0ESwmbhA7UeLWuo7I9zCOQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 16:06:56.2413
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5d6702c-86a0-4193-7bf3-08df140c87fa
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF0000C37F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6710
X-Proofpoint-GUID: ighxCao-ZG-AwuDob0T57TW8roRQrGrY
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIxOCBTYWx0ZWRfX6JRsnjPchDc/
 sQ3r69ohw+sV7u1M1u77reF9fUtgsSHqVcYxY/e1rxbTPXy7KCUD5WLSNxZGKEoCWgTt2VIw9et
 xfbVzCYrl1TV8zdTvtLC32X0gKp1f1Q=
X-Authority-Analysis: v=2.4 cv=ausnmiZV c=1 sm=1 tr=0 ts=6aaabea4 cx=c_pps
 a=6brTJxCCefizds7ERwDNzw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=mPo6Z6jKialA3I5sQgAA:9
X-Proofpoint-ORIG-GUID: ighxCao-ZG-AwuDob0T57TW8roRQrGrY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIxOCBTYWx0ZWRfX6LpnLVolCoMT
 e6ts+TwLxIe7b++7RyXNT5wIPdD3J6uxmNH9zTLLyy2thYH6jSLQ3ikhd7mfRODOpIJ6NI7Z6Pp
 GmPmgWagpUS1nSUSCrKAyhJ++rsXxPdGT0T/k95iwUOkOz1xYFZc6xiVDdgWb3cOwpvCVP9ccOH
 BNVfwegHI60AE+sQfZUykY8D2NFnY+n1EflxDxM8uPbPT+zCPk8tzFtYMeKyMc8bDz2ZxSXiMr0
 OZMI5DV4TBXRC1OtyLPmGYJePzW0IcEQcbgxZyOqOyiPCIxaY2DjZhXMos0mk74GcyPwqaX1j7j
 SQMkTFCwQImLOsiWnVMNvn1y7TI7zaTEq8XCecjolQXuoTXImtK5o1gLFFMXTLdP55oHKicpSMy
 rEQwrbpDBys8j4fUJ1D2V0gWSczbrsYo9DcWBPLgeAiTYTWDvYr7c/2I2uNAAVbcpeNCsxjYbrm
 xtFGB33tFZniO3Ndnxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160218
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 16 Sep 2026 16:07:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17674

Extend the PipeWire recipe to add platform-specific ALSA configuration
and service file. Service file added to start PipeWire as a system
service with proper socket dependency.

Add sink and source configuration for 8-channel audio playback and
capture on the AM62D2EVM as the default configuration is 2-channel.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 .../pipewire/pipewire-arago.inc               | 28 +++++++++++++++++++
 .../am62dxx-evm/90-pipewire-sink.conf         | 17 +++++++++++
 .../am62dxx-evm/91-pipewire-source.conf       | 17 +++++++++++
 .../pipewire/pipewire/pipewire.service        | 26 +++++++++++++++++
 .../pipewire/pipewire_%.bbappend              |  4 +++
 5 files changed, 92 insertions(+)
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago.inc
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/pipewire.service
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire_%.bbappend

diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago.inc b/meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago.inc
new file mode 100644
index 00000000..6545c364
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago.inc
@@ -0,0 +1,28 @@
+PR:append = ".arago1"
+
+FILESEXTRAPATHS:prepend := "${THISDIR}/pipewire:"
+SRC_URI:append = " file://pipewire.service"
+
+# AM62D-specific config files
+SRC_URI:append:am62dxx-evm = " \
+    file://90-pipewire-sink.conf \
+    file://91-pipewire-source.conf \
+"
+
+do_install:append() {
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}${systemd_system_unitdir}
+        install -m 0644 ${UNPACKDIR}/pipewire.service ${D}${systemd_system_unitdir}/
+    fi
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
index 00000000..f22ed291
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf
@@ -0,0 +1,17 @@
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
+            api.alsa.path          = "hw:AM62D2EVM,0"
+            audio.rate             = 48000
+            audio.channels         = 8
+            audio.position         = [ FL FR FC LFE RL RR SL SR ]
+        }
+    }
+]
diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf
new file mode 100644
index 00000000..ac7635de
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf
@@ -0,0 +1,17 @@
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


