Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB570C982F1
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 10:27:14 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7014.1790072830947987169
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 22 Sep 2026 03:27:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=b60DsmKj;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=iHl+OjVa;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: p-bhagat@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68M60UFt932462;
	Tue, 22 Sep 2026 05:27:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=WAjXrQ1XNFhzMovYmw7rMDCb9bSddgLpT8GqpHrpm
	Jk=; b=b60DsmKjZsjjOKSbsU4/LN0yoyUF9BQHLhjdIFhQTZLP9K1MMKTEuCEdk
	EsnMUpzuxseMBY5rP0gntx6aSUL+BjIufSx9AxcojJ40W37QgpKywhm+hei8QRlC
	z9491alOLjeGJKsJExdrHw48cHUTZfmj34Wn1sHd07wrSzPPAbSWaIQpP80CQzQO
	Iz+ejazAPnwYUstdw2gNgCzLrIAaxeMqsznft4yGWS0KyIrfsd0cdvfzfnxisyBw
	GrpZBFfyGT/dYsXQEQvS6CjTRx58lX3yKlOa8JVhpe8NGR6XY9bOyeQjz1lQN+QF
	rHGfQCxfq465mImOddf8Qa0Q6vCjQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011050.outbound.protection.outlook.com [52.101.52.50])
	by m0380145.ppops.net (PPS) with ESMTPS id 4guf4x2x37-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 05:27:09 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bSuru/5p0rnh0EaodL65IlKLeP0lKhCQHfNsrGC5+sR3BsRaMUGpStaqmoK7jVcHW605wU8oO3r8XMT1abB/SPiBVVyvrQbbJkoJ6QSjgwMkE2PmoLbmEaq/lxnioBd+szq7gEVQwAnF3KrDhlzbF//yF2E6C7KQRwYIjodo9T1jkwvo9Rk3F9I/O2IaOCv3ZrSadYAYyO83Xxi26+On295jNMHsIEPtJgUoefnuGWOyXr/n57xWx9YP8ysa/F5mJsbF16leEzP7qHi0O6A+YrqtvNZOY58C3IMo5107p+fEwKJbDv4kZ1wfcXAitIALw9lGVJiZWfWWhmK7KcoRiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WAjXrQ1XNFhzMovYmw7rMDCb9bSddgLpT8GqpHrpmJk=;
 b=ipNVMXh23w42O86spOHb+NukxqgExWcPVydy84fE6nB65hESY7+DcovV4Z4DgInVbt2ItgCXOyvcnw+8oz7VMi2L7AFY8dq1U4hrt1U9NGu+Dqw8KTNWLiYFt9oC3MDAQAoD4dIJjviXLCIRrspYj0sis6xYeXcHIRjof8EVKglEC8OFhusTMHLl1q9TsfXvh+xicqcM7jnVPTL/h6tCETOMfJ+ncPToxIFmTFwPo97qvi53EYWiYNGQOmUdqGfMiuNPCuVZUwOT1To2hyg9ystVdxgz8QOQtwK95PRtT0o9cgfL7ZwfHj7uxPW7g9hF27s0zeTmhrZMtcSZjN6Png==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WAjXrQ1XNFhzMovYmw7rMDCb9bSddgLpT8GqpHrpmJk=;
 b=iHl+OjVamhGjuw/iG8y/rMA/8wRAFlNrGbb+G626+D8yugfBFv81oUSzi6IEW8EgMvFNhD2MwwjQp1ccv2HkA/iuB91XillFVMj1nwUHci47jFamHKP8HOqmEMw+8oSPUQeQApnT/ndiqE9zJrxSEXrjpvpHYIXRILDzbPh9qIk=
Received: from CH0PR04CA0076.namprd04.prod.outlook.com (2603:10b6:610:74::21)
 by IA1PR10MB6148.namprd10.prod.outlook.com (2603:10b6:208:3a8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 10:27:05 +0000
Received: from CH3PEPF00000010.namprd04.prod.outlook.com
 (2603:10b6:610:74:cafe::47) by CH0PR04CA0076.outlook.office365.com
 (2603:10b6:610:74::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.13 via Frontend Transport; Tue,
 22 Sep 2026 10:27:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH3PEPF00000010.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 10:27:03 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 05:26:33 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 05:26:33 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 22 Sep 2026 05:26:33 -0500
Received: from localhost (ula0502350.dhcp.ti.com [10.24.52.241])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68MAQW4T3957790;
	Tue, 22 Sep 2026 05:26:32 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <denis@denix.org>,
        <j-sahu@ti.com>, <p-gupta5@ti.com>, <r-soni@ti.com>, <reatmon@ti.com>,
        <s-kapoor@ti.com>, <s-sinha@ti.com>, <sen@ti.com>, <y-hegde@ti.com>
Subject: [master/wrynose][PATCH v3 2/4] recipes-multimedia: Add PipeWire bbappend and service
Date: Tue, 22 Sep 2026 15:55:57 +0530
Message-ID: <20260922102559.3717785-3-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260922102559.3717785-1-p-bhagat@ti.com>
References: <20260922102559.3717785-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000010:EE_|IA1PR10MB6148:EE_
X-MS-Office365-Filtering-Correlation-Id: 342d6225-cf4b-40ee-926d-08df18940b72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|6133799003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	wrfbYrIoTF+R2y11wQ4r/366gPNlsZWhqL5YNcWMcw1TCinvk5OgGzfQtlceTC6BeHcunE5CxJug5MAg2B8X6Eo7h8yA2BF/zeU/2Ubva3g3DnDGJLyuCWL8KE/B8m9OaFnadsIiS0NfefunGq42xR7oOYnodVQSAnqBqbDBFcBPQmuhYJ61Y7Fno2TjnLwVpDu8i8FG1kVLPv1QVdnrhB/cKlW7hPrDAuDBCynaByyOTGsoDxEKfzDhxZ/ZNE2wl5Qzk25WXOZJdHDKQl3ZVkXcUWSckaD+sn/oVBU1/A79lHPpcd1ANPM86u0VHc0jstgqNIm+6Yq9s73fGVSfqu8eBbnUyZfE607dXvZbUs0MwolIfYF6EwukGO6UuxUDibkrmkmc9yXMOORFCULVeiaGq/5QPrYZ5AxMCoxIZPw8tKvVfLYWA3M2ErIBZ3SyBILnyc5b2j6ZlpChU2EPSCi7WSQhrWE8+WhgsYJkJWdgKW1T8is9+GDcE+FKE578BVQijYXyppwEQZqEf2mguJk7i4mxj69oXGO+J2oD+Ms3G4bh02HkTwt2/T8O8XWxSYkYq25CodhPhkwtvKlfF5baCKFxstuQ9RGU79IPUf7Nfshj3O8TT5OADRZS+kQPnOgtcinGFKoiMBUq1HKIiMd0hHy/GQwA06XaeTOjl82kbK3gnZCofZlJoBi/LX0wRaext9kSOeIEiqkEoy6zrA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	aDjgvht+UODgmhBZer2t/F+X8KKF7m7wcv3C1L/mUDu+7gwESGDoe4SEa6yWDFP9ZdzpcDVTLOPfXEOAzvLF0Y/6ZDo5o48cxJoNILpbUvbziyP3kKZK7RB1gk28Wsv4BmPmWpdXCVV1kAs2fHaLgA5XstDOMu0RiGAuhmtgtNCGgj/RK9PRCPPLrSsnK4VIV+avdCWLnwGAS6iTyl+5q3aS1N6HNQQE1QE4F+JgejjIuiJiBoZ0wPpnlDQ8zD9fMkjql+h42GDK3MLXfWkzjdpxJWjuWYnNah3KKe1d19tokQnQNnAR7qjaFf/rNcxnZm9skYA2Jg422vYuNgixiNmhAZczi1TgThUg0Xz96+Bo+2gePgRHzEgSWNBtWDCz6QazMPkQ8s9pmjukN2xr3l4M7upCsrJxjUyQnZR062RHPDDzpqrOwNz6JUj7rU2B
X-Exchange-RoutingPolicyChecked: 
	yZh9ejQcJMvUZ2uJzLHV2ytS8PvA3o7IerNsmvPeArCAJRILbKIOgI0LTrWlx7mQt/ZVQEHKPx73syAeW4TS9tSENtb+hrNKl3rjL0/UCq7GBs7m5NvPKEAx2mb1lFwfLyGsCJpzWxnacjPhtPhvYOMTAqpUt/cda3kVadgivA/kfea5GpxFwXhV+OahP9zI6fDW2mCZF9JmMetxZfC0i6pihwBqr3ym/Ho+1P499p14JqcVgn14fPhJ2zrr1m19ZsJc6B1zL+RUNG+n7vm3mzLAoYd8IF5wYRWvtIwNHlonweN/4PF8qPOGKmEvDqv1eiDPAX3PzbjeQymY+eyNDQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 10:27:03.5182
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 342d6225-cf4b-40ee-926d-08df18940b72
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF00000010.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6148
X-Proofpoint-ORIG-GUID: Z3WhUGAKgFgyFmMQAtUTA2utPoEqOELw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE1MCBTYWx0ZWRfX4ohmjMCYeX3O
 JvBeuCAGV9BDA61uCnnH5+eT9Tv1RaLRoSjC3VZDUiXXWMi37b57CDsXrYnO8REs9H5q5qNKsu9
 mEj66yWRz7cJkjOU6JWH+MqBDKnwVbqrg3aCyYYOre03ZNKoOJd3CvX68mxSgNqkMNxS39Z4dkB
 1iAzwbu5hRfbgRZ+lnWWF80TarELvaRVE2jQIiiU57L4MtzQTd26fH+rsn34fIhB9/ES9tK7cHO
 8B/T3IbeEiYbbvwIItsk5bTGq/kKADdNKhyJqI8KI0x5oocnW9xJ1V7JGw2uhlryK/kavHs81mw
 WJqyo6H8C8hFBjhVFYOq4pECVVKOuvLVsxWABItuugcxE8Jj+a7v3A4abFe821zBga4urz/+OKn
 fhtOC84nBz616cf/ieKEzTdHBgUpAYg7Sb/4vYRaFvfD2/g+eu3/UUnYrxhi4XFjEpgoCA2Sjo6
 +ObTXaHq7d2EKFkKNaQ==
X-Proofpoint-GUID: Z3WhUGAKgFgyFmMQAtUTA2utPoEqOELw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE1MCBTYWx0ZWRfX87LzmoYlKcYy
 TWhuQdYQkI3508eHfrDSASonXamZy2GDr4V7GXwOtKTJQSDWqtoynpIQZGZN4k01iEO5P9Jjlfo
 fFLsKd+WGxT5MIMRbH8VWinrcVBJwJ0=
X-Authority-Analysis: v=2.4 cv=XYYcX455 c=1 sm=1 tr=0 ts=6ab257fd cx=c_pps
 a=Vy3FhvgG8Thl4oebyZnGOA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=2YTg0G2jCm4xzRVDYEEA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220150
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 22 Sep 2026 10:27:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17692

Extend the PipeWire recipe to add service file to start PipeWire as a
system service with proper socket dependency.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 .../pipewire/pipewire-arago.inc               | 14 ++++++++++
 .../pipewire/pipewire/pipewire.service        | 26 +++++++++++++++++++
 .../pipewire/pipewire_%.bbappend              |  4 +++
 3 files changed, 44 insertions(+)
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago.inc
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/pipewire.service
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire_%.bbappend

diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago.inc b/meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago.inc
new file mode 100644
index 00000000..7d7fc91b
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago.inc
@@ -0,0 +1,14 @@
+PR:append = ".arago1"
+
+FILESEXTRAPATHS:prepend := "${THISDIR}/pipewire:"
+SRC_URI:append = " file://pipewire.service"
+
+do_install:append() {
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}${systemd_system_unitdir}
+        install -m 0644 ${UNPACKDIR}/pipewire.service ${D}${systemd_system_unitdir}/
+    fi
+}
+
+PACKAGECONFIG:append = " pipewire-jack"
+PACKAGECONFIG:remove = "jack"
diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire/pipewire.service b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/pipewire.service
new file mode 100644
index 00000000..d204b15c
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/pipewire.service
@@ -0,0 +1,26 @@
+[Unit]
+Description=PipeWire Multimedia Service
+# Ensure kernel modules are loaded and sound-card is ready
+After=systemd-modules-load.service sys-devices-platform-sound-sound-card0-controlC0.device
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


