Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5DB8C982F1
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 10:26:54 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7006.1790072813402286260
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 22 Sep 2026 03:26:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=jW0eAfYT;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=fiXzn1Eq;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: p-bhagat@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M7YgaA1035305;
	Tue, 22 Sep 2026 05:26:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=omgAo733d7sIahzUhMujaYgs5nrry+HRH47B1eAOz
	YQ=; b=jW0eAfYTa4nziqVjLfy4l4Iu5f2gP21JzKVwwfWGJZTl8UO6p1UyGZVQw
	j/rZQshb9AT06u+ECPjOA6o28djHUKJzlI0kqaE36igiCbMMYbPFsCDaEgrS4mPZ
	EYOEPf5OV23NTSpcEcLjvtOHqp3tionnocjeTho8qh7y0SMTizomIn3bkbyAe1R6
	KesPyEvLkul5gVEP5YL48JmWkkOoxXaCiN6gejBWF1Zqmnr9tnxQe8f2gLPrYcpV
	F60Ea1P+KzE5H457EfCmR7QmaazZfBSaaqnEoZrCql3ocroXAa1W+XJuXZOTT9iP
	x/GGhV75l6NreDmzwYnxoK1v7H8Iw==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012063.outbound.protection.outlook.com [52.101.53.63])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gugxm27ue-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 05:26:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hz960v8xLUMuBlf6W2v4luCtC/esjgdaRZfDywbmKHHdQRWBkf72xgmoLojM30j/RnyDv6dW01DqJaMPFfpJvbp03P+lmEzDcl61N3sYKiXLJ1bYNOcxZSTD9UEfvnf945Xgn7zc5wngPt2t3yZddasmqYYK/frtm9RbvnxJmjdYPdxbKyph5TbWcbigWAeTVng2q69qwPvYLs4V1uknYTViDAb3X3Oy37kHowSn8rhVE7w270Rv4MLmEJfgdLBAFGcyULX8c41/KiRCVy7kLtC7vExkcBlxNY35TiWwdOtmnuu4NE5sR3palY+mDSu1qNdX6xX9C6HTDdO/o14ZoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=omgAo733d7sIahzUhMujaYgs5nrry+HRH47B1eAOzYQ=;
 b=zVXvjgPGzBswoby0Cpmn7YctUtVRay/LmJGrsY1i75VDE8UOupwK5chHUqX1r49ImPgbKuJVW4r+dSYiNWcHgcGYZPgMYrxhZ06P4QojP1ffvY9QkI+LRJ9CAis5Sh0bDsfFDADRCMZvjpUfadvMrCpRZPMXfXa3/hFqQaCrE2+jWIzl/CdrYE0PLrL5R2YfssFGhs8aTht+agXRxG32wgj0Gj4jYuRD9MxbAlsV8K0j2HJ9eJvvDvMUAqsiPPXSn2uZY3xBJK9i37vRXzdT7bVPSjahplSGw8PeNWgPeNxtgyRIh1EVbbY2Kyfsh0+u4OzzZpytjkI53Zl+FOQQdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=omgAo733d7sIahzUhMujaYgs5nrry+HRH47B1eAOzYQ=;
 b=fiXzn1Eq+2KIkY9rGo5mXNp1Q3LLQ+cZ3Is8KsycjlI9oZzy5eaGnvf9hxN6eZXj6nP4M3W0fSjpv1TUdWj4FvXLp0jKjp/zjW63MIdSBP4k9aPVltEzxLgaT2FfgWVrtFh6x/RBjbiPhh8MfQh7D9GVs5xilugpscr2frWGmkU=
Received: from CH2PR15CA0003.namprd15.prod.outlook.com (2603:10b6:610:51::13)
 by CO1PR10MB4658.namprd10.prod.outlook.com (2603:10b6:303:91::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 10:26:46 +0000
Received: from CH2PEPF00000140.namprd02.prod.outlook.com
 (2603:10b6:610:51:cafe::98) by CH2PR15CA0003.outlook.office365.com
 (2603:10b6:610:51::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.13 via Frontend Transport; Tue,
 22 Sep 2026 10:26:46 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF00000140.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 10:26:44 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 05:26:36 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 05:26:35 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 22 Sep 2026 05:26:35 -0500
Received: from localhost (ula0502350.dhcp.ti.com [10.24.52.241])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68MAQY4U665485;
	Tue, 22 Sep 2026 05:26:35 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <denis@denix.org>,
        <j-sahu@ti.com>, <p-gupta5@ti.com>, <r-soni@ti.com>, <reatmon@ti.com>,
        <s-kapoor@ti.com>, <s-sinha@ti.com>, <sen@ti.com>, <y-hegde@ti.com>
Subject: [master/wrynose][PATCH v3 3/4] recipes-multimedia: Add wireplumber audio configuration
Date: Tue, 22 Sep 2026 15:55:58 +0530
Message-ID: <20260922102559.3717785-4-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260922102559.3717785-1-p-bhagat@ti.com>
References: <20260922102559.3717785-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000140:EE_|CO1PR10MB4658:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ba6b3c3-e6ca-41b0-70dc-08df18940067
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|23010399003|56012099006|3023799007|6133799003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	A7ofDD0huo7tYO0wb8mDnQIGVmaIKNWe4wEObEuJfsBHQppXhtJq36zkYvq/0YQ0cRjQ0Qs79/hgkdda/gJRAdsrBuvZIXQvfZ1AE6xcllTL8FtnJ2I2VZgJyDEcyDGyxvsrDL4DMxKoGNOeHGSWHyVOc3IeNDMEEAKB4TGlc8tWOO2SoFA/wCOiHPC+kjtLm/h4BYNHeO8Ft29fGrqq1r1ma3g+9iTxePjSmVlPiPeWZNDDtn4s6PGVmS/nvttZztzzK3+qF69xkn/Y9vEbZbYzL3Zk7NR4ybz/CPtab2gQv86bCNsReZhYwGaB3/110mdKLo8hUAsoKgmwjaygVZib+o7CRUa0dnm80bkMGlybWQUuNaBuRocppGIso8fIVjLWN4cLZHElDXeq0DUs7bF6fPIGgWnOhLWNGO73HY0RlPURmM14u+07v0fAQuRAxK7cIyp8gUTYfqUC2SaDHh6sz2+uXRoFwAejugeKXIBlbchXLlvOfkjNWz9PAWOmkXOzCJV3NBoI3VsfBe3cdJXFUB40smhxLdxmYTi8mh6eL0MAs8Y7jUs+IpjUCOdLjlB5xxqFWlOOPcAtdQKbEtIK/9vZkPiWJnBHE0pQfcnkxye3Hu7mWpC4HtKg6xJ+9RcR1Kt8bj0EDYopCerLMkcLL9MQAoCzH7FJQhrgaepMZ6jbZ+Hl5JcBO7RSwIFviFY6E8iCNVhJbZy0zWnaYw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(23010399003)(56012099006)(3023799007)(6133799003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	tBo747w10TZiRTSlr7xzb4j5ScBtEGC7qiu2+yYLfcfNqaTrk/WE26m6FuLXNdcRxs5WyG9/ehFGh1x0HMTlfjPra1E5G73hR3O2WmyF/DotvojXLsMWr25m8HHpMbh8q15b7Z9Wuad3IRvOpxuXwYuqvkXAbeN/adkP5/5xgOVY2rzWCL7kUcPQPQutYKrESY8Kck7hZILP2BGoON/3vZ4XnBSg/hPv5Om8EHQ8BkU8KcU4ZZDP0+rwu1Z98G0onqbzruwgA2C0goKc/2j+QDwJl1JdJZteAhyZHRS8O1emWlv9TEeGa5ewZm+j16QmuPwrvEtQXLQMfTZ3z8YTdGZTETacJ24WSxsbOLcG2lP+1S8CnszpOBMGqATHWBhW61DAVqXuhDsjDwEFXnBytvEw8utrM1mJhxgIev58CXoPNDjhf3AO7eE25Qhwq9Rn
X-Exchange-RoutingPolicyChecked: 
	4Sq3VnzWM5naqH9CV4vvGdXkALXuLlbrrbwD/tsSNqeIFACKcw3pHZom021gbBYJAYEwhUeRWiD+p6mnyQ9NryHl778U1gT4EEyCgu4npapC/2ZGXZIoi9mk4KR3/F76ZE74q+Ja07veVeFe8X1TblQp5wBNcTEHxp4gJc6+xc5oqdvzvUTykGRNXupe9fF+bmS9azSHzcaSh0MQmys7Rr4ZKARqigATCmZYbLwOiqty9n5dCifQEaVTo1wh8kGuidq3xLdO/abAhbtnlxTGBomHVNhuIcXCodWclUfTxm78c5ZLHNUr+cOt1adY8wW5syUKskC5SEzup5shSA/dBQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 10:26:44.9924
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ba6b3c3-e6ca-41b0-70dc-08df18940067
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000140.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4658
X-Proofpoint-ORIG-GUID: SkY_zpYH-dffDqq-0M0lLVMNvJnZgr0z
X-Proofpoint-GUID: SkY_zpYH-dffDqq-0M0lLVMNvJnZgr0z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE1MCBTYWx0ZWRfX9Jy6m+zc6a8U
 4eqiI9VOKDJWrekzBm/O+RO3oAKxtk2Tqh8xQWf9Xw47eo19cK0KWl0PRvQ+ZDPLuUw81lMzi0n
 O2E/nqgOsjX8oyQIZorJAJ0aLt6Qo0Jcmy3pKsxWedtic2nyhx9+ygx94/HG2okqNiZiQJQcToP
 MFzN8M6ovoXNnbztlS1YonIfqJWVhvDWrY00RBZ+Q412Bev8hCqF5u1LEkv0ZtbBYwRMGcII9VN
 qkLuJ4B1BV0jLXI0GTbgmcWaZmAo6J/Bu7bGfLAo/ORrXA2NBOnTrFavm+90x3sHwvBG1PXwg6z
 DTPTq9crD6PmPqKKri20rA0xkd6agM4Ckzr8l38MBiF1hC2FmwmkbTfVB9Kn/KRRAV28aqVEoxG
 DBWbYxsjc87Eulj1FfYsDTohYZHIau9LWaumeUh40Vj9X/ABJB9pMDssU4vGzF+QEko+k9YFZG0
 N0smmlzK8tS5quKbvzQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE1MCBTYWx0ZWRfX/lBsPjPTDAVM
 OiEMg2caDlRC63RHmX/87c4ss8GV13RYIlRbKWISYDF3Jet3VuBep3Sk8o6/d8WtpHQ0oaogcq8
 ozTj5atXRa3QlZ99Uq1C7toWlgoafPM=
X-Authority-Analysis: v=2.4 cv=INeXmQvG c=1 sm=1 tr=0 ts=6ab257ea cx=c_pps
 a=e6K3ZeJSw2wYQu/wAm/p+g==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=ZsI1D44bINRuIHTABBAA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220150
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 22 Sep 2026 10:26:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17688

Extend the wireplumber recipe to enable the session manager on all
platforms and provide board specific audio initialization if needed.
A set-audio-defaults.sh script is packaged to configure default audio
sinks and sources at runtime, managed by a dedicated systemd service
that runs after wireplumber starts.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 .../wireplumber/wireplumber-arago.inc         | 22 +++++++++++++
 .../wireplumber/set-audio-defaults.service    | 21 ++++++++++++
 .../wireplumber/set-audio-defaults.sh         | 32 +++++++++++++++++++
 .../wireplumber/wireplumber_%.bbappend        |  4 +++
 4 files changed, 79 insertions(+)
 create mode 100644 meta-arago-distro/recipes-multimedia/wireplumber/wireplumber-arago.inc
 create mode 100644 meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.service
 create mode 100755 meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.sh
 create mode 100644 meta-arago-distro/recipes-multimedia/wireplumber/wireplumber_%.bbappend

diff --git a/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber-arago.inc b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber-arago.inc
new file mode 100644
index 00000000..158734a6
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber-arago.inc
@@ -0,0 +1,22 @@
+PR:append = ".arago1"
+
+FILESEXTRAPATHS:prepend := "${THISDIR}/wireplumber:"
+
+SRC_URI:append = " \
+    file://set-audio-defaults.sh \
+    file://set-audio-defaults.service \
+"
+
+do_install:append() {
+    install -d ${D}${bindir}
+    install -m 0755 ${UNPACKDIR}/set-audio-defaults.sh ${D}${bindir}/
+
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}${systemd_system_unitdir}
+        install -m 0644 ${UNPACKDIR}/set-audio-defaults.service ${D}${systemd_system_unitdir}/
+    fi
+}
+
+SYSTEMD_SERVICE:${PN}:append = " wireplumber.service set-audio-defaults.service"
+
+FILES:${PN}:append = " ${bindir}/set-audio-defaults.sh"
diff --git a/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.service b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.service
new file mode 100644
index 00000000..423972f7
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.service
@@ -0,0 +1,21 @@
+[Unit]
+Description=Set PipeWire Default Audio Devices
+# Wait for pipewire and wireplumber services to be started
+After=pipewire.service wireplumber.service
+# Ensure sound-card is ready
+After=sys-devices-platform-sound-sound-card0-controlC0.device
+Wants=pipewire.service wireplumber.service
+
+[Service]
+Type=oneshot
+ExecStart=/usr/bin/set-audio-defaults.sh
+StandardOutput=append:/var/log/set-audio-defaults-output.log
+StandardError=append:/var/log/set-audio-defaults-error.log
+RemainAfterExit=yes
+TimeoutStartSec=90
+# Restart on failure with delay
+Restart=on-failure
+RestartSec=5
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.sh b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.sh
new file mode 100755
index 00000000..49be177e
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.sh
@@ -0,0 +1,32 @@
+#!/bin/sh
+
+# Wait for WirePlumber to be ready
+i=1
+while [ "$i" -le 30 ]; do
+    wpctl status >/dev/null 2>&1 && break
+    sleep 1
+    i=$((i + 1))
+done
+
+# Additional delay for nodes to appear
+sleep 2
+
+# Find audio sink ID
+SINK_ID=$(pw-cli info alsa_audio_sink 2>/dev/null | head -n 1 | awk '{print $2}')
+if [ -n "$SINK_ID" ]; then
+    wpctl set-default "$SINK_ID"
+    echo "Set default sink to ID: $SINK_ID (alsa_audio_sink)"
+else
+    echo "Could not find alsa_audio_sink"
+fi
+
+# Find audio source ID
+SOURCE_ID=$(pw-cli info alsa_audio_source 2>/dev/null | head -n 1 | awk '{print $2}')
+if [ -n "$SOURCE_ID" ]; then
+    wpctl set-default "$SOURCE_ID"
+    echo "Set default source to ID: $SOURCE_ID (alsa_audio_source)"
+else
+    echo "Could not find alsa_audio_source"
+fi
+
+echo "Done"
diff --git a/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber_%.bbappend b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber_%.bbappend
new file mode 100644
index 00000000..541b2963
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber_%.bbappend
@@ -0,0 +1,4 @@
+WIREPLUMBER_ARAGO = ""
+WIREPLUMBER_ARAGO:arago = "wireplumber-arago.inc"
+
+require ${WIREPLUMBER_ARAGO}
-- 
2.34.1


