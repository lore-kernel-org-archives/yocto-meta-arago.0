Return-Path: <danishanwar@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64A5E1062872
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 12:10:03 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.55])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19903.1773230995866851616
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 11 Mar 2026 05:09:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=S0LtvDkE;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.56.55, mailfrom: danishanwar@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H4H1kNL6B31H3mxDKyXrTHwWBMdrG7l/TIw6HFriF10f0gPGL6OcENJmupiJNa239bGH0Is4+Te/FrAAww4H/VLS5jDqXUDiCv6YVOpzAukaGaP82+WwWnmGs4HL6P3/ZGUx1teXUxJiC6PcRqdMVlKL9iWXCafJnta/ajY8qX9YFz43Hu9BGCDlRZTWJ6CHiQZm5Wm6PHLc7L7JbboPFgj8icxrj02sNS3XROKNeJE19bfQJCBExHCLiCN66qAC4dnJsrgvRH405iKC3CAQR77zpblelhMgcIV3xQxVkG1bUbWbyPbY/XZa3/NSC9fISGd4Vq64EybDECVr0BCb0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ztCS9ty0bMW20hAHmZW9anf4C0UiwMX3djtUc88ViXU=;
 b=kRwEix/1E7rmpTEuxmlvo9cHJLqH0gGp1AGamgjeA+p8z+8OCcBNxCpCxmRhDzrB3vrYkfqAzBEhCGqvoMwmAHnuvTHWwyjwx25GVtb4+qwm+QQriqnXsIEFxZTvd/f0T0CTKt166wIht945C9/rIK+ihelbIvy+JHgfWHFC8SnoaXCsYAyMMcCSWhe2D3v25TZ7k0fL0egKECcKUHhcUVEKvsF2FTRiIhrEvBH+QVifQCfrHyyb2O5wneF9B/udeQHLGwCt1jLEOibRQATzJbvfrJdO77rCbKBg6/UcE1NE5nUF4PZjb0MPIQr6alYaGmkp0h+AK3atrxHw5PfMSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ztCS9ty0bMW20hAHmZW9anf4C0UiwMX3djtUc88ViXU=;
 b=S0LtvDkEBNrvZwbfDwfgfgRqMr/C0km1zny1+TomKco+o9IRkTqrk7waR9BODsyE/cN+qH27h6Z28sJFfAJtqevZQ3cVuGxBVHCNHpv9mOhEf41uil4ilQ9fAP63CcCBIqLREVk8slyOuSBmVO90KsAuudp6vCVy8qdDVeQBPdA=
Received: from BN0PR02CA0034.namprd02.prod.outlook.com (2603:10b6:408:e5::9)
 by MW4PR10MB6509.namprd10.prod.outlook.com (2603:10b6:303:21b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 11 Mar
 2026 12:09:52 +0000
Received: from BN2PEPF00004FBF.namprd04.prod.outlook.com
 (2603:10b6:408:e5:cafe::a0) by BN0PR02CA0034.outlook.office365.com
 (2603:10b6:408:e5::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.26 via Frontend Transport; Wed,
 11 Mar 2026 12:09:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF00004FBF.mail.protection.outlook.com (10.167.243.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 11 Mar 2026 12:09:50 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Mar
 2026 07:09:47 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Mar
 2026 07:09:47 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 11 Mar 2026 07:09:47 -0500
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62BC9lp9145666;
	Wed, 11 Mar 2026 07:09:47 -0500
Received: from localhost (dhcp-172-24-231-152.dhcp.ti.com [172.24.231.152])
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 62BC9kgA014272;
	Wed, 11 Mar 2026 07:09:46 -0500
From: MD Danish Anwar <danishanwar@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>,
	<denys@konsulko.com>
CC: <c-shilwant@ti.com>, MD Danish Anwar <danishanwar@ti.com>, "Denys
 Dmytriyenko" <denis@denix.org>
Subject: [meta-arago][master][PATCH v3] linuxptp: Add support for HSR in Linux ptp
Date: Wed, 11 Mar 2026 17:39:43 +0530
Message-ID: <20260311120943.3524472-1-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBF:EE_|MW4PR10MB6509:EE_
X-MS-Office365-Filtering-Correlation-Id: 6276b134-2582-42ac-1e98-08de7f6718f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|7142099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	nqDglSaOYQSBvywcfgM+lWS9lkyx0iTojtZDotuD8mVlWHu+r2KduRqDTMYlIDnZWcQe5XxlGhMo+oQN7FjS5czmaJXZQt16wVcJnWPkaEPi5cNmvgaCF6uCbjUEbiFFzZkdHcCkUVfjpCHDvmex7g3liFwBbqUpFL9xv6zh16TGWamUD1C4ZqXUmvK4yjf7S0VnDUOYZpMg07Pp2X2pV7/xcHMCE2ItyyLHkmTUs0nANvwq85y5Y/hkOaBga5u5r4KQG/Z2kwaowb/yB1DVtlx/WONp5GKVN6kqRW8iaAB4aoEK7oph4yj/KMCnjVTD0Uf0DIbkE3OCcqsdPYmFq+9RMC3n+jmpjdz2N3ZepNn5Hx5OwjzDBRNjRdlnPK60WP7OI1l/fT+lKZFGKOvuPzA3mVFjvMJWOsQ6oUoPa98/sE3DcpCPSs19vAU8vcgvpq0Nm0ZPkMp76DyOKVaDZKkPFI6qBbMPuG+jY66IR3xRzaB2V5pamwTaUjxqaVsXFqgVOmbIXIBT1S5aLIOgYUZEQnHnY5wgjCv6SZ6lwdve4KKFtc1sgaVFGT8fHQacHoCm3v4xJHBfYUgIBd2j8xJ72vawXu+vW/IWYZja0jHAHet4rV56DPqoYp3MJWvdKrrpl3ZGReeN4/r5prtTM8QecSCQ+oUGKR0qxkqX4LY48TRpWEFN4GR8S/4p22LcYI0dlhGYq4FRUainmtsfpWUyecXa8qO8Cu98tX3AAjQ=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(7142099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	LF/2j1OuWaq9YVweCUnpc6o5RagrBVlWw/w0odTPpi3YziGt6f1n7Oq3iVPTncZJOtnJsbX6clyQyLof9W7patxVRBYB70hjWaGoA/D785gD9W0qESOaBW2a9+wYa2RsXlk2ch9GJZNbQfs2aVpHVra4NBccUHLKfp3NGf74uER6yqazsH92awi+b4kHghBnIYFIjBcNtI+DXgtHDxmlaXgOKLfpQ13HfMV85rt9AsemGnquzoWdip3oskZPxnF5dFx40K6PtT6ZkI3fVyrgurLFFoT89AfE/F08UNCaYiFxSM3gvrTutTpWrYjUOMBoZCdDbko+7IxUoOavOPciWQIjWcvVIiu+LP7zvzABbLdv/xS/b+MTauWjlhGMpK6dy4tUXLM34Kd8gJymIsLlG19IwvSeUVCeUpGo2J5kgJ9XPzJuLjwmv3a0hZfFMszP
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 12:09:50.9228
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6276b134-2582-42ac-1e98-08de7f6718f7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF00004FBF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6509
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 11 Mar 2026 12:10:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17307

Add patches for support of HSR in linuxptp.

Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
---
Cc: Denys Dmytriyenko <denis@denix.org>
v2 -> v3:
- Added Upstream-Status properly to all the patches.
- Used "arago0" in linuxptp-arago.inc
- Used +=3D instead of :append as suggested by Denys Dmytriyenko <denis@den=
ix.org>

v2 https://lore.kernel.org/all/20260302103515.848554-1-danishanwar@ti.com/

 .../linuxptp/linuxptp-arago.inc               |  20 +
 ...age-of-non-PTP-packets-during-socket.patch |  78 ++
 ...the-concept-of-doubly-attached-clock.patch | 202 +++++
 .../0003-Add-PASSIVE_SLAVE-state.patch        | 272 +++++++
 .../0004-rtnl-Add-rtnl_get_hsr_devices.patch  | 121 +++
 .../0005-port-Add-paired_port-option.patch    | 145 ++++
 ...-a-state-engine-for-redundant-master.patch | 531 ++++++++++++++
 ...ouble-attached-clock-hybrid-clock-HC.patch | 441 +++++++++++
 ...orward-packets-both-ways-in-DAC-mode.patch |  34 +
 ...guard-in-case-PASSIVE_SLAVE-attempts.patch |  34 +
 ...w-to-forward-packets-in-LISTEN-state.patch |  58 ++
 .../0011-raw-Add-HSR-and-PRP-handling.patch   | 690 ++++++++++++++++++
 ...sample-configs-for-the-HSR-PRP-setup.patch | 167 +++++
 .../0013-clock-Add-port-details.patch         |  62 ++
 ...2p_dst_mac-to-avoid-IEEE-802.1-reser.patch |  71 ++
 .../linuxptp/linuxptp_%.bbappend              |   4 +
 16 files changed, 2930 insertions(+)
 create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/linuxpt=
p-arago.inc
 create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/linuxpt=
p/0001-raw-Prevent-leakage-of-non-PTP-packets-during-socket.patch
 create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/linuxpt=
p/0002-port-Add-the-concept-of-doubly-attached-clock.patch
 create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/linuxpt=
p/0003-Add-PASSIVE_SLAVE-state.patch
 create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/linuxpt=
p/0004-rtnl-Add-rtnl_get_hsr_devices.patch
 create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/linuxpt=
p/0005-port-Add-paired_port-option.patch
 create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/linuxpt=
p/0006-fsm-Add-a-state-engine-for-redundant-master.patch
 create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/linuxpt=
p/0007-p2p_hc-Add-a-double-attached-clock-hybrid-clock-HC.patch
 create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/linuxpt=
p/0008-tc-Allow-to-forward-packets-both-ways-in-DAC-mode.patch
 create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/linuxpt=
p/0009-port-Add-a-safe-guard-in-case-PASSIVE_SLAVE-attempts.patch
 create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/linuxpt=
p/0010-tc-Allow-to-forward-packets-in-LISTEN-state.patch
 create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/linuxpt=
p/0011-raw-Add-HSR-and-PRP-handling.patch
 create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/linuxpt=
p/0012-configs-Add-sample-configs-for-the-HSR-PRP-setup.patch
 create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/linuxpt=
p/0013-clock-Add-port-details.patch
 create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/linuxpt=
p/0014-configs-Change-p2p_dst_mac-to-avoid-IEEE-802.1-reser.patch
 create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/linuxpt=
p_%.bbappend

diff --git a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp-arago=
.inc b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp-arago.inc
new file mode 100644
index 00000000..d9658ea2
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp-arago.inc
@@ -0,0 +1,20 @@
+PR:append =3D ".arago0"
+
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/linuxptp:"
+
+SRC_URI +=3D " \
+    file://0001-raw-Prevent-leakage-of-non-PTP-packets-during-socket.patch=
 \
+    file://0002-port-Add-the-concept-of-doubly-attached-clock.patch \
+    file://0003-Add-PASSIVE_SLAVE-state.patch \
+    file://0004-rtnl-Add-rtnl_get_hsr_devices.patch \
+    file://0005-port-Add-paired_port-option.patch \
+    file://0006-fsm-Add-a-state-engine-for-redundant-master.patch \
+    file://0007-p2p_hc-Add-a-double-attached-clock-hybrid-clock-HC.patch \
+    file://0008-tc-Allow-to-forward-packets-both-ways-in-DAC-mode.patch \
+    file://0009-port-Add-a-safe-guard-in-case-PASSIVE_SLAVE-attempts.patch=
 \
+    file://0010-tc-Allow-to-forward-packets-in-LISTEN-state.patch \
+    file://0011-raw-Add-HSR-and-PRP-handling.patch \
+    file://0012-configs-Add-sample-configs-for-the-HSR-PRP-setup.patch \
+    file://0013-clock-Add-port-details.patch \
+    file://0014-configs-Change-p2p_dst_mac-to-avoid-IEEE-802.1-reser.patch=
 \
+"
diff --git a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0001-=
raw-Prevent-leakage-of-non-PTP-packets-during-socket.patch b/meta-arago-dis=
tro/recipes-connectivity/linuxptp/linuxptp/0001-raw-Prevent-leakage-of-non-=
PTP-packets-during-socket.patch
new file mode 100644
index 00000000..10503b0a
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0001-raw-Pre=
vent-leakage-of-non-PTP-packets-during-socket.patch
@@ -0,0 +1,78 @@
+From a2799357f2d8d5d65a2df9995f4b2d89df808869 Mon Sep 17 00:00:00 2001
+From: Cliff Spradlin <cspradlin@google.com>
+Date: Thu, 2 Oct 2025 18:37:54 -0700
+Subject: [PATCH 01/14] raw: Prevent leakage of non-PTP packets during sock=
et
+ init
+
+There were two problems with the socket configuration sequencing:
+
+1) Calling socket(PF_PACKET, SOCK_RAW, htons(ETH_P_ALL)) causes all
+ethernet frames from -all- interfaces to be queued to the socket,
+until bind() is later called.
+
+2) The BPF filter is installed -after- bind() is called, so ethernet
+frames that should be rejected could be queued before the BPF filter
+is installed.
+
+This patch reorders the raw socket initialization so that all
+configuration happens before bind() is called.
+
+Upstream-Status: Submitted [https://lists.nwtime.org/sympa/arc/linuxptp-de=
vel/2026-03/msg00014.html]
+Signed-off-by: Cliff Spradlin <cspradlin@google.com>
+Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
+---
+
+ raw.c | 22 +++++++++++-----------
+ 1 file changed, 11 insertions(+), 11 deletions(-)
+
+diff --git a/raw.c b/raw.c
+index 94c59ad..c809233 100644
+--- a/raw.c
++++ b/raw.c
+@@ -241,7 +241,7 @@ static int open_socket(const char *name, int event, un=
signed char *local_addr,
+ 	struct sockaddr_ll addr;
+ 	int fd, index;
+=20
+-	fd =3D socket(PF_PACKET, SOCK_RAW, htons(ETH_P_ALL));
++	fd =3D socket(AF_PACKET, SOCK_RAW, 0);
+ 	if (fd < 0) {
+ 		pr_err("socket failed: %m");
+ 		goto no_socket;
+@@ -250,6 +250,16 @@ static int open_socket(const char *name, int event, u=
nsigned char *local_addr,
+ 	if (index < 0)
+ 		goto no_option;
+=20
++	if (socket_priority > 0 &&
++	    setsockopt(fd, SOL_SOCKET, SO_PRIORITY, &socket_priority,
++		       sizeof(socket_priority))) {
++		pr_err("setsockopt SO_PRIORITY failed: %m");
++		goto no_option;
++	}
++	if (raw_configure(fd, event, index, local_addr, ptp_dst_mac,
++			  p2p_dst_mac, 1))
++		goto no_option;
++
+ 	memset(&addr, 0, sizeof(addr));
+ 	addr.sll_ifindex =3D index;
+ 	addr.sll_family =3D AF_PACKET;
+@@ -263,16 +273,6 @@ static int open_socket(const char *name, int event, u=
nsigned char *local_addr,
+ 		goto no_option;
+ 	}
+=20
+-	if (socket_priority > 0 &&
+-	    setsockopt(fd, SOL_SOCKET, SO_PRIORITY, &socket_priority,
+-		       sizeof(socket_priority))) {
+-		pr_err("setsockopt SO_PRIORITY failed: %m");
+-		goto no_option;
+-	}
+-	if (raw_configure(fd, event, index, local_addr, ptp_dst_mac,
+-			  p2p_dst_mac, 1))
+-		goto no_option;
+-
+ 	return fd;
+ no_option:
+ 	close(fd);
+--=20
+2.34.1
+
diff --git a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0002-=
port-Add-the-concept-of-doubly-attached-clock.patch b/meta-arago-distro/rec=
ipes-connectivity/linuxptp/linuxptp/0002-port-Add-the-concept-of-doubly-att=
ached-clock.patch
new file mode 100644
index 00000000..c2c344dc
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0002-port-Ad=
d-the-concept-of-doubly-attached-clock.patch
@@ -0,0 +1,202 @@
+From e66abef7649eb8d62caec6c5884376230b4a7b16 Mon Sep 17 00:00:00 2001
+From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+Date: Thu, 18 Sep 2025 12:58:52 +0200
+Subject: [PATCH 02/14] port: Add the concept of doubly attached clock
+
+For IEC62439-3 the clock comparison is mostly the same as with IEEE1588.
+The specification adds an additional comparison step if both messages
+(from the same master) are identical. The suggestion is to use for
+instance the port with the smaller value in the correction field but
+also don't flip between the two ports if port with the smaller
+correction value changes frequently.
+
+Instead pick the first port, and stay with it.
+Use a DAC (doubly attached clock) field to:
+- Check for at least two interfaces
+- Check that the interfaces belong to the same PTP clock domain. Not
+  strictly required but makes it easier. Otherwise the manual
+  synchronisation of the two clocks is required.
+
+Upstream-Status: Submitted [https://lists.nwtime.org/sympa/arc/linuxptp-de=
vel/2026-03/msg00015.html]
+Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
+---
+
+ clock.c  | 29 +++++++++++++++++++++++++++++
+ clock.h  | 13 +++++++++++++
+ config.c |  9 +++++++++
+ ptp4l.8  | 12 ++++++++++++
+ ptp4l.c  |  8 +++++++-
+ 5 files changed, 70 insertions(+), 1 deletion(-)
+
+diff --git a/clock.c b/clock.c
+index 17484d8..2578b55 100644
+--- a/clock.c
++++ b/clock.c
+@@ -151,6 +151,7 @@ struct clock {
+ 	struct time_zone tz[MAX_TIME_ZONES];
+ 	struct ClockIdentity ext_gm_identity;
+ 	int ext_gm_steps_removed;
++	bool use_DAC;
+ };
+=20
+ struct clock the_clock;
+@@ -1394,6 +1395,9 @@ struct clock *clock_create(enum clock_type type, str=
uct config *config,
+ 	} else {
+ 		c->dscmp =3D dscmp;
+ 	}
++	if (config_get_int(config, NULL, "redundant_network") =3D=3D RED_HSR)
++		c->use_DAC =3D true;
++
+ 	c->tsproc =3D tsproc_create(config_get_int(config, NULL, "tsproc_mode"),
+ 				  config_get_int(config, NULL, "delay_filter"),
+ 				  config_get_int(config, NULL, "delay_filter_length"));
+@@ -1475,6 +1479,26 @@ struct clock *clock_create(enum clock_type type, st=
ruct config *config,
+ 		return NULL;
+ 	}
+=20
++	if (config_get_int(config, NULL, "redundant_network") !=3D RED_NONE) {
++		int phc_idx;
++
++		iface =3D STAILQ_FIRST(&config->interfaces);
++		if (interface_tsinfo_valid(iface)) {
++			phc_idx =3D interface_phc_index(iface);
++
++			STAILQ_FOREACH(iface, &config->interfaces, list) {
++				if (interface_tsinfo_valid(iface)) {
++					if (interface_phc_index(iface) !=3D phc_idx) {
++						pr_err("The network devices do not share the PMC");
++					}
++				} else {
++					pr_err("Could not verify PHC device of the network devices");
++				}
++			}
++		} else {
++			pr_err("Could not verify PHC device of the network devices");
++		}
++	}
+ 	/* Create the ports. */
+ 	STAILQ_FOREACH(iface, &config->interfaces, list) {
+ 		if (clock_add_port(c, phc_device, phc_index, timestamping, iface)) {
+@@ -2359,6 +2383,11 @@ enum clock_type clock_type(struct clock *c)
+ 	return c->type;
+ }
+=20
++bool clock_type_is_DAC(struct clock *c)
++{
++	return c->use_DAC;
++}
++
+ void clock_check_ts(struct clock *c, uint64_t ts)
+ {
+ 	if (c->sanity_check && clockcheck_sample(c->sanity_check, ts)) {
+diff --git a/clock.h b/clock.h
+index ce9ae91..b093dd1 100644
+--- a/clock.h
++++ b/clock.h
+@@ -43,6 +43,12 @@ enum clock_type {
+ 	CLOCK_TYPE_MANAGEMENT =3D 0x0800,
+ };
+=20
++enum redundancy_type {
++	RED_NONE,
++	RED_HSR,
++	RED_PRP,
++};
++
+ /**
+  * Appends the active time zone TLVs to a given message.
+  * @param c          The clock instance.
+@@ -382,6 +388,13 @@ struct clock_description *clock_description(struct cl=
ock *c);
+  */
+ enum clock_type clock_type(struct clock *c);
+=20
++/**
++ * Check if the clock is doubly attached clock.
++ * @param c  The clock instance.
++ * @return   True if the clock is DAC, false otherwise.
++ */
++bool clock_type_is_DAC(struct clock *c);
++
+ /**
+  * Perform a sanity check on a time stamp made by a clock.
+  * @param c  The clock instance.
+diff --git a/config.c b/config.c
+index 222f4cd..a1d66bf 100644
+--- a/config.c
++++ b/config.c
+@@ -251,6 +251,13 @@ static struct config_enum bmca_enu[] =3D {
+ 	{ NULL, 0 },
+ };
+=20
++static struct config_enum red_enu[] =3D {
++	{ "none",	RED_NONE },
++	{ "HSR",	RED_HSR },
++	{ "PRP",	RED_PRP },
++	{ NULL, 0 },
++};
++
+ struct config_item config_tab[] =3D {
+ 	PORT_ITEM_UIN("active_key_id", 0, 0, UINT32_MAX),
+ 	PORT_ITEM_INT("allow_unauth", 0, 0, 2),
+@@ -349,6 +356,8 @@ struct config_item config_tab[] =3D {
+ 	PORT_ITEM_STR("ptp_dst_ipv6", "FF0E:0:0:0:0:0:0:181"),
+ 	PORT_ITEM_STR("ptp_dst_mac", "01:1B:19:00:00:00"),
+ 	GLOB_ITEM_INT("ptp_minor_version", 1, 0, 1),
++	PORT_ITEM_STR("redundant_device", ""),
++	PORT_ITEM_ENU("redundant_network", RED_NONE, red_enu),
+ 	GLOB_ITEM_STR("refclock_sock_address", "/var/run/refclock.ptp.sock"),
+ 	GLOB_ITEM_STR("revisionData", ";;"),
+ 	GLOB_ITEM_STR("sa_file", NULL),
+diff --git a/ptp4l.8 b/ptp4l.8
+index 6e3f456..c9a613c 100644
+--- a/ptp4l.8
++++ b/ptp4l.8
+@@ -912,6 +912,18 @@ The default is 128.
+ This option sets the minorVersionPTP in the common PTP message header.
+ The default is 1.
+=20
++.TP
++.B redundant_device
++If the device belongs to a redundant HSR or PRP network, specifiy the
++parent device.
++Default is empty.
++
++.TP
++.B redundant_network
++If PTP is used is a redundant network specify the type which can be eithe=
r
++"HSR" or "PRP".
++The default is "none".
++
+ .TP
+ .B refclock_sock_address
+ The address of the UNIX domain socket to be used by the refclock_sock ser=
vo.
+diff --git a/ptp4l.c b/ptp4l.c
+index ac2ef96..40697c2 100644
+--- a/ptp4l.c
++++ b/ptp4l.c
+@@ -23,6 +23,7 @@
+ #include <string.h>
+ #include <unistd.h>
+=20
++#include "bmc.h"
+ #include "clock.h"
+ #include "config.h"
+ #include "ntpshm.h"
+@@ -214,7 +215,12 @@ int main(int argc, char *argv[])
+ 	type =3D config_get_int(cfg, NULL, "clock_type");
+ 	switch (type) {
+ 	case CLOCK_TYPE_ORDINARY:
+-		if (cfg->n_interfaces > 1) {
++		if (config_get_int(cfg, NULL, "redundant_network") !=3D RED_NONE) {
++			if (cfg->n_interfaces < 2) {
++				fprintf(stderr, "Redundant networks need at least two interfaces\n");
++				goto out;
++			}
++		} else if (cfg->n_interfaces > 1) {
+ 			type =3D CLOCK_TYPE_BOUNDARY;
+ 		}
+ 		break;
+--=20
+2.34.1
+
diff --git a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0003-=
Add-PASSIVE_SLAVE-state.patch b/meta-arago-distro/recipes-connectivity/linu=
xptp/linuxptp/0003-Add-PASSIVE_SLAVE-state.patch
new file mode 100644
index 00000000..bc3a6dcd
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0003-Add-PAS=
SIVE_SLAVE-state.patch
@@ -0,0 +1,272 @@
+From 307a10a50ddd9515ce031f0fefc0b1420a869584 Mon Sep 17 00:00:00 2001
+From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+Date: Thu, 2 Oct 2025 10:09:32 +0200
+Subject: [PATCH 03/14] Add PASSIVE_SLAVE state.
+
+Add PASSIVE_SLAVE which is defined in IEC 62439-3 as an extension to IEC
+61588. It also renames PASSIVE to PASSIVE_MASTER for clarity but lets
+ignore this part.
+
+The PASSIVE_SLAVE acts as SLAVE but does not participate in clock
+adjustments. It will send Delay_Req or Pdelay_Req and respond to those
+packets.
+In management interface the PASSIVE_SLAVE should be exposed as SLAVE.
+
+Add PS_PASSIVE_SLAVE to port_state and EV_RS_PSLAVE to fsm_event. Update
+existing state engines to avoid "unhandled switch case".
+
+Upstream-Status: Submitted [https://lists.nwtime.org/sympa/arc/linuxptp-de=
vel/2026-03/msg00016.html]
+Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
+---
+
+ clock.c           |  3 +++
+ e2e_tc.c          |  2 ++
+ fsm.c             |  3 +++
+ fsm.h             |  2 ++
+ p2p_tc.c          |  4 ++++
+ port.c            | 14 ++++++++++++--
+ port_signaling.c  |  1 +
+ tc.c              |  2 ++
+ unicast_service.c |  1 +
+ util.c            |  2 ++
+ 10 files changed, 32 insertions(+), 2 deletions(-)
+
+diff --git a/clock.c b/clock.c
+index 2578b55..f718adf 100644
+--- a/clock.c
++++ b/clock.c
+@@ -2361,6 +2361,9 @@ static void handle_state_decision_event(struct clock=
 *c)
+ 			clock_update_slave(c);
+ 			event =3D EV_RS_SLAVE;
+ 			break;
++		case PS_PASSIVE_SLAVE:
++			event =3D EV_RS_PSLAVE;
++			break;
+ 		default:
+ 			event =3D EV_FAULT_DETECTED;
+ 			break;
+diff --git a/e2e_tc.c b/e2e_tc.c
+index 82b454a..53cf4eb 100644
+--- a/e2e_tc.c
++++ b/e2e_tc.c
+@@ -75,6 +75,8 @@ void e2e_dispatch(struct port *p, enum fsm_event event, =
int mdiff)
+ 	case PS_SLAVE:
+ 		port_set_announce_tmo(p);
+ 		break;
++	case PS_PASSIVE_SLAVE:
++		break;
+ 	};
+ }
+=20
+diff --git a/fsm.c b/fsm.c
+index ce6efad..9e8c4d8 100644
+--- a/fsm.c
++++ b/fsm.c
+@@ -214,6 +214,9 @@ enum port_state ptp_fsm(enum port_state state, enum fs=
m_event event, int mdiff)
+ 			break;
+ 		}
+ 		break;
++
++	case PS_PASSIVE_SLAVE:
++		break;
+ 	}
+=20
+ 	return next;
+diff --git a/fsm.h b/fsm.h
+index 857af05..e07d9a9 100644
+--- a/fsm.h
++++ b/fsm.h
+@@ -31,6 +31,7 @@ enum port_state {
+ 	PS_PASSIVE,
+ 	PS_UNCALIBRATED,
+ 	PS_SLAVE,
++	PS_PASSIVE_SLAVE, /* Added to IEC 61588:2021, Table 27 (via 62439-3) */
+ 	PS_GRAND_MASTER, /*non-standard extension*/
+ };
+=20
+@@ -53,6 +54,7 @@ enum fsm_event {
+ 	EV_RS_GRAND_MASTER,
+ 	EV_RS_SLAVE,
+ 	EV_RS_PASSIVE,
++	EV_RS_PSLAVE,
+ };
+=20
+ enum bmca_select {
+diff --git a/p2p_tc.c b/p2p_tc.c
+index a8ec63b..7fda10e 100644
+--- a/p2p_tc.c
++++ b/p2p_tc.c
+@@ -40,6 +40,8 @@ static int p2p_delay_request(struct port *p)
+ 	case PS_SLAVE:
+ 	case PS_GRAND_MASTER:
+ 		break;
++	case PS_PASSIVE_SLAVE:
++		break;
+ 	}
+ 	return port_delay_request(p);
+ }
+@@ -92,6 +94,8 @@ void p2p_dispatch(struct port *p, enum fsm_event event, =
int mdiff)
+ 	case PS_SLAVE:
+ 		port_set_announce_tmo(p);
+ 		break;
++	case PS_PASSIVE_SLAVE:
++		break;
+ 	};
+ }
+=20
+diff --git a/port.c b/port.c
+index a1d0f2c..549d72b 100644
+--- a/port.c
++++ b/port.c
+@@ -1023,6 +1023,8 @@ static int port_management_fill_response(struct port=
 *target,
+ 		pds->portIdentity            =3D target->portIdentity;
+ 		if (target->state =3D=3D PS_GRAND_MASTER) {
+ 			pds->portState =3D PS_MASTER;
++		} else if (target->state =3D=3D PS_PASSIVE_SLAVE) {
++			pds->portState =3D PS_SLAVE;
+ 		} else {
+ 			pds->portState =3D target->state;
+ 		}
+@@ -1089,6 +1091,8 @@ static int port_management_fill_response(struct port=
 *target,
+ 		ppn->portIdentity =3D target->portIdentity;
+ 		if (target->state =3D=3D PS_GRAND_MASTER)
+ 			ppn->port_state =3D PS_MASTER;
++		else if (target->state =3D=3D PS_PASSIVE_SLAVE)
++			ppn->port_state =3D PS_SLAVE;
+ 		else
+ 			ppn->port_state =3D target->state;
+ 		ppn->timestamping =3D target->timestamping;
+@@ -1922,6 +1926,7 @@ int port_is_enabled(struct port *p)
+ 	case PS_PASSIVE:
+ 	case PS_UNCALIBRATED:
+ 	case PS_SLAVE:
++	case PS_PASSIVE_SLAVE:
+ 		break;
+ 	}
+ 	return 1;
+@@ -2242,6 +2247,7 @@ int process_announce(struct port *p, struct ptp_mess=
age *m)
+ 	case PS_PASSIVE:
+ 	case PS_UNCALIBRATED:
+ 	case PS_SLAVE:
++	case PS_PASSIVE_SLAVE:
+ 		result =3D update_current_master(p, m);
+ 		break;
+ 	}
+@@ -2289,7 +2295,7 @@ static int process_cmlds(struct port *p)
+ 		p->nrate.ratio =3D 1.0 + (double) cmlds->scaledNeighborRateRatio / POW2=
_41;
+ 		p->asCapable =3D cmlds->as_capable;
+ 		p->cmlds.timer_count =3D 0;
+-		if (p->state =3D=3D PS_UNCALIBRATED || p->state =3D=3D PS_SLAVE) {
++		if (p->state =3D=3D PS_UNCALIBRATED || p->state =3D=3D PS_SLAVE || p->s=
tate =3D=3D PS_PASSIVE_SLAVE) {
+ 			const tmv_t tx =3D tmv_zero();
+ 			clock_peer_delay(p->clock, p->peer_delay, tx, tx, p->nrate.ratio);
+ 		}
+@@ -2437,6 +2443,7 @@ void process_follow_up(struct port *p, struct ptp_me=
ssage *m)
+ 	case PS_MASTER:
+ 	case PS_GRAND_MASTER:
+ 	case PS_PASSIVE:
++	case PS_PASSIVE_SLAVE:
+ 		return;
+ 	case PS_UNCALIBRATED:
+ 	case PS_SLAVE:
+@@ -2668,7 +2675,7 @@ calc:
+=20
+ 	p->peerMeanPathDelay =3D tmv_to_TimeInterval(p->peer_delay);
+=20
+-	if (p->state =3D=3D PS_UNCALIBRATED || p->state =3D=3D PS_SLAVE) {
++	if (p->state =3D=3D PS_UNCALIBRATED || p->state =3D=3D PS_SLAVE || p->st=
ate =3D=3D PS_PASSIVE_SLAVE) {
+ 		clock_peer_delay(p->clock, p->peer_delay, t1, t2,
+ 				 p->nrate.ratio);
+ 	}
+@@ -2752,6 +2759,7 @@ void process_sync(struct port *p, struct ptp_message=
 *m)
+ 	case PS_MASTER:
+ 	case PS_GRAND_MASTER:
+ 	case PS_PASSIVE:
++	case PS_PASSIVE_SLAVE:
+ 		return;
+ 	case PS_UNCALIBRATED:
+ 	case PS_SLAVE:
+@@ -2895,6 +2903,7 @@ static void port_e2e_transition(struct port *p, enum=
 port_state next)
+ 		sad_set_last_seqid(clock_config(p->clock), p->spp, -1);
+ 		/* fall through */
+ 	case PS_SLAVE:
++	case PS_PASSIVE_SLAVE:
+ 		port_set_announce_tmo(p);
+ 		port_set_delay_tmo(p);
+ 		break;
+@@ -2943,6 +2952,7 @@ static void port_p2p_transition(struct port *p, enum=
 port_state next)
+ 		sad_set_last_seqid(clock_config(p->clock), p->spp, -1);
+ 		/* fall through */
+ 	case PS_SLAVE:
++	case PS_PASSIVE_SLAVE:
+ 		port_set_announce_tmo(p);
+ 		break;
+ 	};
+diff --git a/port_signaling.c b/port_signaling.c
+index cf28756..fb42fe6 100644
+--- a/port_signaling.c
++++ b/port_signaling.c
+@@ -147,6 +147,7 @@ int process_signaling(struct port *p, struct ptp_messa=
ge *m)
+ 	case PS_PASSIVE:
+ 	case PS_UNCALIBRATED:
+ 	case PS_SLAVE:
++	case PS_PASSIVE_SLAVE:
+ 		break;
+ 	}
+=20
+diff --git a/tc.c b/tc.c
+index 27ba66f..0fd1bc4 100644
+--- a/tc.c
++++ b/tc.c
+@@ -88,6 +88,7 @@ static int tc_blocked(struct port *q, struct port *p, st=
ruct ptp_message *m)
+ 		break;
+ 	case PS_UNCALIBRATED:
+ 	case PS_SLAVE:
++	case PS_PASSIVE_SLAVE:
+ 		break;
+ 	}
+ 	/* Egress state */
+@@ -102,6 +103,7 @@ static int tc_blocked(struct port *q, struct port *p, =
struct ptp_message *m)
+ 		return 1;
+ 	case PS_UNCALIBRATED:
+ 	case PS_SLAVE:
++	case PS_PASSIVE_SLAVE:
+ 		/* Delay_Req swims against the stream. */
+ 		if (msg_type(m) !=3D DELAY_REQ) {
+ 			return 1;
+diff --git a/unicast_service.c b/unicast_service.c
+index d7a4ecd..7b5196b 100644
+--- a/unicast_service.c
++++ b/unicast_service.c
+@@ -532,6 +532,7 @@ int unicast_service_timer(struct port *p)
+ 	case PS_PASSIVE:
+ 	case PS_UNCALIBRATED:
+ 	case PS_SLAVE:
++	case PS_PASSIVE_SLAVE:
+ 		break;
+ 	case PS_MASTER:
+ 	case PS_GRAND_MASTER:
+diff --git a/util.c b/util.c
+index 4e9263b..4deebe8 100644
+--- a/util.c
++++ b/util.c
+@@ -60,6 +60,7 @@ const char *ps_str[] =3D {
+ 	"PASSIVE",
+ 	"UNCALIBRATED",
+ 	"SLAVE",
++	"PASSIVE_SLAVE",
+ 	"GRAND_MASTER",
+ };
+=20
+@@ -81,6 +82,7 @@ const char *ev_str[] =3D {
+ 	"RS_GRAND_MASTER",
+ 	"RS_SLAVE",
+ 	"RS_PASSIVE",
++	"RS_PASSIVE_SLAVE",
+ };
+=20
+ const char *ts_str(enum timestamp_type ts)
+--=20
+2.34.1
+
diff --git a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0004-=
rtnl-Add-rtnl_get_hsr_devices.patch b/meta-arago-distro/recipes-connectivit=
y/linuxptp/linuxptp/0004-rtnl-Add-rtnl_get_hsr_devices.patch
new file mode 100644
index 00000000..e7e5093e
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0004-rtnl-Ad=
d-rtnl_get_hsr_devices.patch
@@ -0,0 +1,121 @@
+From 66a02d358b66430d297d68699993505ce960ac58 Mon Sep 17 00:00:00 2001
+From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+Date: Wed, 22 Oct 2025 15:32:22 +0200
+Subject: [PATCH 04/14] rtnl: Add rtnl_get_hsr_devices()
+
+Extend rtnl_linkinfo_parse() by supporting HSR. It will return the
+two interface numbers in one 32bit int by using the lower 16bit for
+slave1 and the upper 16bit for slave2.
+
+Provide rtnl_get_hsr_devices() which uses it and returns the resolved
+interface name.
+
+Upstream-Status: Submitted [https://lists.nwtime.org/sympa/arc/linuxptp-de=
vel/2026-03/msg00017.html]
+Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
+---
+
+ rtnl.c | 55 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ rtnl.h |  9 +++++++++
+ 2 files changed, 64 insertions(+)
+
+diff --git a/rtnl.c b/rtnl.c
+index 1037c44..6a0ffc0 100644
+--- a/rtnl.c
++++ b/rtnl.c
+@@ -207,6 +207,7 @@ static int rtnl_linkinfo_parse(int master_index, struc=
t rtattr *rta)
+ {
+ 	struct rtattr *linkinfo[IFLA_INFO_MAX+1];
+ 	struct rtattr *bond[IFLA_BOND_MAX+1];
++	struct rtattr *hsr[IFLA_HSR_MAX+1];
+ 	int index =3D -1;
+ 	char *kind;
+=20
+@@ -227,6 +228,28 @@ static int rtnl_linkinfo_parse(int master_index, stru=
ct rtattr *rta)
+ 			}
+ 		} else if (kind && !strncmp(kind, "team", 4)) {
+ 			index =3D get_team_active_iface(master_index);
++
++		} else if (kind && !strncmp(kind, "hsr", 3) &&
++			   linkinfo[IFLA_INFO_DATA]) {
++			unsigned int slave1, slave2;
++
++			if (rtnl_nested_rtattr_parse(hsr, IFLA_HSR_MAX,
++						     linkinfo[IFLA_INFO_DATA]) < 0)
++				return -1;
++
++			if (!hsr[IFLA_HSR_SLAVE1] || !hsr[IFLA_HSR_SLAVE2])
++				return -1;
++
++			slave1 =3D rta_getattr_u32(hsr[IFLA_HSR_SLAVE1]);
++			slave2 =3D rta_getattr_u32(hsr[IFLA_HSR_SLAVE2]);
++
++			if (slave1 > 0xffff || slave2 > 0xffff)
++				return -1;
++			index =3D slave1 | slave2 << 16;
++			/*
++			 * There is also IFLA_HSR_PROTOCOL which is set to
++			 * HSR_PROTOCOL_HSR or HSR_PROTOCOL_PRP
++			 */
+ 		}
+ 	}
+ 	return index;
+@@ -552,3 +575,35 @@ no_info:
+ 	nl_close(fd);
+ 	return ret;
+ }
++
++int rtnl_get_hsr_devices(const char *hsr_device, char slaveA[IF_NAMESIZE]=
, char slaveB[IF_NAMESIZE])
++{
++	int err, fd;
++	unsigned int hsr_slaves =3D 0;
++
++	fd =3D rtnl_open();
++	if (fd < 0)
++		return fd;
++
++	err =3D rtnl_link_query(fd, hsr_device);
++	if (err) {
++		goto no_info;
++	}
++	err =3D -1;
++
++	rtnl_link_status(fd, hsr_device, rtnl_get_ts_device_callback, &hsr_slave=
s);
++	if (hsr_slaves =3D=3D 0)
++		goto no_info;
++
++	if (!if_indextoname(hsr_slaves & 0xffff, slaveA))
++		goto no_info;
++
++	if (!if_indextoname(hsr_slaves >> 16, slaveB))
++		goto no_info;
++
++	err =3D 0;
++
++no_info:
++	rtnl_close(fd);
++	return err;
++}
+diff --git a/rtnl.h b/rtnl.h
+index 96fee29..d10db32 100644
+--- a/rtnl.h
++++ b/rtnl.h
+@@ -68,6 +68,15 @@ int rtnl_link_status(int fd, const char *device, rtnl_c=
allback cb, void *ctx);
+  */
+ int rtnl_iface_has_vclock(const char *device, int phc_index);
+=20
++/**
++ * Return both slave portts of a HSR device.
++ * param device	The name of the HSR deviec
++ * @param slaveA	The name of the SlaveA device
++ * @param slaveB	The name of the SlaveB device
++ * @return		Zero on success, non-zero otherwise.
++ */
++int rtnl_get_hsr_devices(const char *hsr_device, char slaveA[IF_NAMESIZE]=
, char slaveB[IF_NAMESIZE]);
++
+ /**
+  * Open a RT netlink socket for monitoring link state.
+  * @return    A valid socket, or -1 on error.
+--=20
+2.34.1
+
diff --git a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0005-=
port-Add-paired_port-option.patch b/meta-arago-distro/recipes-connectivity/=
linuxptp/linuxptp/0005-port-Add-paired_port-option.patch
new file mode 100644
index 00000000..ecb1bbff
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0005-port-Ad=
d-paired_port-option.patch
@@ -0,0 +1,145 @@
+From da2828fe4e4a579dac984f1cbee0b62ae5a46630 Mon Sep 17 00:00:00 2001
+From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+Date: Thu, 2 Oct 2025 10:34:10 +0200
+Subject: [PATCH 05/14] port: Add paired_port option.
+
+Add an option to pair ports. This is for a HSR network to find the other
+port.
+
+Upstream-Status: Submitted [https://lists.nwtime.org/sympa/arc/linuxptp-de=
vel/2026-03/msg00018.html]
+Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
+---
+
+ clock.c        |  1 +
+ makefile       |  2 +-
+ port.c         | 50 ++++++++++++++++++++++++++++++++++++++++++++++++++
+ port.h         | 15 +++++++++++++++
+ port_private.h |  1 +
+ 5 files changed, 68 insertions(+), 1 deletion(-)
+
+diff --git a/clock.c b/clock.c
+index f718adf..af82f21 100644
+--- a/clock.c
++++ b/clock.c
+@@ -1051,6 +1051,7 @@ static int clock_add_port(struct clock *c, const cha=
r *phc_device,
+ 		return -1;
+ 	}
+ 	LIST_FOREACH(piter, &c->ports, list) {
++		port_pair_redundant_ports(p, piter);
+ 		lastp =3D piter;
+ 	}
+ 	if (lastp) {
+diff --git a/makefile b/makefile
+index 07199aa..50c2d5a 100644
+--- a/makefile
++++ b/makefile
+@@ -26,7 +26,7 @@ PRG	=3D ptp4l hwstamp_ctl nsm phc2sys phc_ctl pmc timema=
ster ts2phc tz2alt
+ SECURITY =3D sad.o
+ FILTERS	=3D filter.o mave.o mmedian.o
+ SERVOS	=3D linreg.o ntpshm.o nullf.o pi.o refclock_sock.o servo.o
+-TRANSP	=3D raw.o transport.o udp.o udp6.o uds.o
++TRANSP	=3D raw.o transport.o udp.o udp6.o uds.o rtnl.o
+ TS2PHC	=3D ts2phc.o lstab.o nmea.o serial.o sock.o ts2phc_generic_pps_sou=
rce.o \
+  ts2phc_nmea_pps_source.o ts2phc_phc_pps_source.o ts2phc_pps_sink.o ts2ph=
c_pps_source.o
+ OBJ	=3D bmc.o clock.o clockadj.o clockcheck.o config.o designated_fsm.o \
+diff --git a/port.c b/port.c
+index 549d72b..8953738 100644
+--- a/port.c
++++ b/port.c
+@@ -3793,6 +3793,56 @@ err_port:
+ 	return NULL;
+ }
+=20
++void port_pair_redundant_ports(struct port *p1, struct port *p2)
++{
++	const char *p1_name =3D interface_name(p1->iface);
++	const char *p2_name =3D interface_name(p2->iface);
++	const char *p1_hsr, *p2_hsr;
++	struct config *cfg;
++	char hsr_slave_A[IF_NAMESIZE];
++	char hsr_slave_B[IF_NAMESIZE];
++	int ret;
++
++	cfg =3D clock_config(p1->clock);
++
++	/* Do the two ports belong to the same hsr device? */
++	p1_hsr =3D config_get_string(cfg, p1_name, "redundant_device");
++	if (!strlen(p1_hsr)) {
++		return;
++	}
++
++	p2_hsr =3D config_get_string(cfg, p2_name, "redundant_device");
++	if (strcmp(p1_hsr, p2_hsr)) {
++		return;
++	}
++
++	ret =3D rtnl_get_hsr_devices(p1_hsr, hsr_slave_A, hsr_slave_B);
++	if (ret) {
++		pr_err("Failed to query HSR attributes on %s", p1_hsr);
++		return;
++	}
++
++	if (!strcmp(hsr_slave_A, p1_name) && !strcmp(hsr_slave_B, p2_name)) {
++		p1->paired_port =3D p2;
++		p2->paired_port =3D p1;
++	} else if (!strcmp(hsr_slave_A, p2_name) && !strcmp(hsr_slave_B, p1_name=
)) {
++		p1->paired_port =3D p2;
++		p2->paired_port =3D p1;
++	} else {
++		pr_err("On redundant device %s ports %s/%s don't match %s/%s\n",
++		       p1_hsr, hsr_slave_A, hsr_slave_B, p1_name, p2_name);
++		return;
++	}
++
++	pr_notice("Pairing redundant ports %s and %s on %s.",
++		  p1_name, p2_name, p1_hsr);
++}
++
++struct port *port_paired_port(struct port *port)
++{
++	return port->paired_port;
++}
++
+ enum port_state port_state(struct port *port)
+ {
+ 	return port->state;
+diff --git a/port.h b/port.h
+index cc03859..f103006 100644
+--- a/port.h
++++ b/port.h
+@@ -366,4 +366,19 @@ void tc_cleanup(void);
+  */
+ void port_update_unicast_state(struct port *p);
+=20
++/**
++ * Pair two ports which are redundant (as per HSR)
++ *
++ * @param p1  A port instance.
++ * @param p2  A port instance.
++ */
++void port_pair_redundant_ports(struct port *p1, struct port *p2);
++
++/**
++ * Return the paired (rundant port) of this port instance (as per HSR)
++ *
++ * @param port  A port instance.
++ */
++struct port *port_paired_port(struct port *port);
++
+ #endif
+diff --git a/port_private.h b/port_private.h
+index aa9a095..79b1d31 100644
+--- a/port_private.h
++++ b/port_private.h
+@@ -174,6 +174,7 @@ struct port {
+ 		int port;
+ 	} cmlds;
+ 	struct ProfileIdentity profileIdentity;
++	struct port *paired_port;
+ };
+=20
+ #define portnum(p) (p->portIdentity.portNumber)
+--=20
+2.34.1
+
diff --git a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0006-=
fsm-Add-a-state-engine-for-redundant-master.patch b/meta-arago-distro/recip=
es-connectivity/linuxptp/linuxptp/0006-fsm-Add-a-state-engine-for-redundant=
-master.patch
new file mode 100644
index 00000000..a508960c
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0006-fsm-Add=
-a-state-engine-for-redundant-master.patch
@@ -0,0 +1,531 @@
+From 3c5b7a59934a043a6ceb0e3b29e9123c887c5064 Mon Sep 17 00:00:00 2001
+From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+Date: Thu, 2 Oct 2025 10:37:06 +0200
+Subject: [PATCH 06/14] fsm: Add a state engine for redundant master
+
+The FSM ptp_red_m_fsm() and ptp_red_slave_fsm() (slave only) are based
+on ptp_fsm() and ptp_slave_fsm() but add the additional PASSIVE_SLAVE
+handling.
+This state machine is selected once redundant_master has been specified
+for the bmca option.
+
+The bmc_state_decision() will return PASSIVE_SLAVE if a redundant port
+is available and has the best clock.
+
+Upstream-Status: Submitted [https://lists.nwtime.org/sympa/arc/linuxptp-de=
vel/2026-03/msg00019.html]
+Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
+---
+
+ bmc.c    |   6 +
+ config.c |   1 +
+ fsm.c    | 395 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ fsm.h    |  19 +++
+ port.c   |   2 +
+ ptp4l.8  |   3 +
+ 6 files changed, 426 insertions(+)
+
+diff --git a/bmc.c b/bmc.c
+index ebc0789..5ce0b0c 100644
+--- a/bmc.c
++++ b/bmc.c
+@@ -130,6 +130,7 @@ enum port_state bmc_state_decision(struct clock *c, st=
ruct port *r,
+ 				   int (*compare)(struct dataset *a, struct dataset *b))
+ {
+ 	struct dataset *clock_ds, *clock_best, *port_best;
++	struct port *paired_port;
+ 	enum port_state ps;
+=20
+ 	clock_ds =3D clock_default_ds(c);
+@@ -167,6 +168,11 @@ enum port_state bmc_state_decision(struct clock *c, s=
truct port *r,
+ 		return PS_SLAVE; /*S1*/
+ 	}
+=20
++	paired_port =3D port_paired_port(r);
++	if (paired_port && clock_best_port(c) =3D=3D paired_port) {
++		return PS_PASSIVE_SLAVE;
++	}
++
+ 	if (compare(clock_best, port_best) =3D=3D A_BETTER_TOPO) {
+ 		return PS_PASSIVE; /*P2*/
+ 	} else {
+diff --git a/config.c b/config.c
+index a1d66bf..9bddb30 100644
+--- a/config.c
++++ b/config.c
+@@ -248,6 +248,7 @@ static struct config_enum as_capable_enu[] =3D {
+ static struct config_enum bmca_enu[] =3D {
+ 	{ "ptp",  BMCA_PTP  },
+ 	{ "noop", BMCA_NOOP },
++	{ "redundant_master", BMCA_RED_MASTER },
+ 	{ NULL, 0 },
+ };
+=20
+diff --git a/fsm.c b/fsm.c
+index 9e8c4d8..af72fea 100644
+--- a/fsm.c
++++ b/fsm.c
+@@ -338,3 +338,398 @@ enum port_state ptp_slave_fsm(enum port_state state,=
 enum fsm_event event,
+=20
+ 	return next;
+ }
++
++enum port_state ptp_red_m_fsm(enum port_state state, enum fsm_event event=
, int mdiff)
++{
++	enum port_state next =3D state;
++
++	if (EV_INITIALIZE =3D=3D event || EV_POWERUP =3D=3D event)
++		return PS_INITIALIZING;
++
++	switch (state) {
++	case PS_INITIALIZING:
++		switch (event) {
++		case EV_FAULT_DETECTED:
++			next =3D PS_FAULTY;
++			break;
++		case EV_INIT_COMPLETE:
++			next =3D PS_LISTENING;
++			break;
++		default:
++			break;
++		}
++		break;
++
++	case PS_FAULTY:
++		switch (event) {
++		case EV_DESIGNATED_DISABLED:
++			next =3D PS_DISABLED;
++			break;
++		case EV_FAULT_CLEARED:
++			next =3D PS_INITIALIZING;
++			break;
++		default:
++			break;
++		}
++		break;
++
++	case PS_DISABLED:
++		if (EV_DESIGNATED_ENABLED =3D=3D event)
++			next =3D PS_INITIALIZING;
++		break;
++
++	case PS_LISTENING:
++		switch (event) {
++		case EV_DESIGNATED_DISABLED:
++			next =3D PS_DISABLED;
++			break;
++		case EV_FAULT_DETECTED:
++			next =3D PS_FAULTY;
++			break;
++		case EV_ANNOUNCE_RECEIPT_TIMEOUT_EXPIRES:
++			next =3D PS_MASTER;
++			break;
++		case EV_RS_MASTER:
++			next =3D PS_PRE_MASTER;
++			break;
++		case EV_RS_GRAND_MASTER:
++			next =3D PS_GRAND_MASTER;
++			break;
++		case EV_RS_SLAVE:
++			next =3D PS_UNCALIBRATED;
++			break;
++		case EV_RS_PASSIVE:
++			next =3D PS_PASSIVE;
++			break;
++		case EV_RS_PSLAVE:
++			next =3D PS_PASSIVE_SLAVE;
++			break;
++		default:
++			break;
++		}
++		break;
++
++	case PS_PRE_MASTER:
++		switch (event) {
++		case EV_DESIGNATED_DISABLED:
++			next =3D PS_DISABLED;
++			break;
++		case EV_FAULT_DETECTED:
++			next =3D PS_FAULTY;
++			break;
++		case EV_QUALIFICATION_TIMEOUT_EXPIRES:
++			next =3D PS_MASTER;
++			break;
++		case EV_RS_SLAVE:
++			next =3D PS_UNCALIBRATED;
++			break;
++		case EV_RS_PASSIVE:
++			next =3D PS_PASSIVE;
++			break;
++		case EV_RS_PSLAVE:
++			next =3D PS_PASSIVE_SLAVE;
++			break;
++		default:
++			break;
++		}
++		break;
++
++	case PS_MASTER:
++	case PS_GRAND_MASTER:
++		switch (event) {
++		case EV_DESIGNATED_DISABLED:
++			next =3D PS_DISABLED;
++			break;
++		case EV_FAULT_DETECTED:
++			next =3D PS_FAULTY;
++			break;
++		case EV_RS_SLAVE:
++			next =3D PS_UNCALIBRATED;
++			break;
++		case EV_RS_PASSIVE:
++			next =3D PS_PASSIVE;
++			break;
++		case EV_RS_PSLAVE:
++			next =3D PS_PASSIVE_SLAVE;
++			break;
++		default:
++			break;
++		}
++		break;
++
++	case PS_PASSIVE:
++		switch (event) {
++		case EV_DESIGNATED_DISABLED:
++			next =3D PS_DISABLED;
++			break;
++		case EV_FAULT_DETECTED:
++			next =3D PS_FAULTY;
++			break;
++		case EV_ANNOUNCE_RECEIPT_TIMEOUT_EXPIRES:
++			next =3D PS_MASTER;
++			break;
++		case EV_RS_MASTER:
++			next =3D PS_PRE_MASTER;
++			break;
++		case EV_RS_GRAND_MASTER:
++			next =3D PS_GRAND_MASTER;
++			break;
++		case EV_RS_SLAVE:
++			next =3D PS_UNCALIBRATED;
++			break;
++		default:
++			break;
++		}
++		break;
++
++	case PS_UNCALIBRATED:
++		switch (event) {
++		case EV_DESIGNATED_DISABLED:
++			next =3D PS_DISABLED;
++			break;
++		case EV_FAULT_DETECTED:
++			next =3D PS_FAULTY;
++			break;
++		case EV_ANNOUNCE_RECEIPT_TIMEOUT_EXPIRES:
++			next =3D PS_MASTER;
++			break;
++		case EV_MASTER_CLOCK_SELECTED:
++			next =3D PS_SLAVE;
++			break;
++		case EV_RS_MASTER:
++			next =3D PS_PRE_MASTER;
++			break;
++		case EV_RS_GRAND_MASTER:
++			next =3D PS_GRAND_MASTER;
++			break;
++		case EV_RS_SLAVE:
++			next =3D PS_UNCALIBRATED;
++			break;
++		case EV_RS_PASSIVE:
++			next =3D PS_PASSIVE;
++			break;
++		case EV_RS_PSLAVE:
++			next =3D PS_PASSIVE_SLAVE;
++			break;
++		default:
++			break;
++		}
++		break;
++
++	case PS_SLAVE:
++		switch (event) {
++		case EV_DESIGNATED_DISABLED:
++			next =3D PS_DISABLED;
++			break;
++		case EV_FAULT_DETECTED:
++			next =3D PS_FAULTY;
++			break;
++		case EV_ANNOUNCE_RECEIPT_TIMEOUT_EXPIRES:
++			next =3D PS_MASTER;
++			break;
++		case EV_SYNCHRONIZATION_FAULT:
++			next =3D PS_UNCALIBRATED;
++			break;
++		case EV_RS_MASTER:
++			next =3D PS_PRE_MASTER;
++			break;
++		case EV_RS_GRAND_MASTER:
++			next =3D PS_GRAND_MASTER;
++			break;
++		case EV_RS_SLAVE:
++			if (mdiff)
++				next =3D PS_UNCALIBRATED;
++			break;
++		case EV_RS_PASSIVE:
++			next =3D PS_PASSIVE;
++			break;
++		case EV_RS_PSLAVE:
++			next =3D PS_PASSIVE_SLAVE;
++			break;
++		default:
++			break;
++		}
++		break;
++
++	case PS_PASSIVE_SLAVE:
++		switch (event) {
++		case EV_DESIGNATED_DISABLED:
++			next =3D PS_DISABLED;
++			break;
++		case EV_FAULT_DETECTED:
++			next =3D PS_FAULTY;
++			break;
++		case EV_RS_MASTER:
++		case EV_RS_GRAND_MASTER:
++		case EV_RS_SLAVE:
++			next =3D PS_UNCALIBRATED;
++			break;
++		case EV_ANNOUNCE_RECEIPT_TIMEOUT_EXPIRES:
++			next =3D PS_MASTER;
++			break;
++		case EV_NONE:
++			break;
++		default:
++			break;
++		}
++		break;
++	}
++
++	return next;
++}
++
++enum port_state ptp_red_slave_fsm(enum port_state state, enum fsm_event e=
vent,
++				  int mdiff)
++{
++	enum port_state next =3D state;
++
++	if (EV_INITIALIZE =3D=3D event || EV_POWERUP =3D=3D event)
++		return PS_INITIALIZING;
++
++	switch (state) {
++	case PS_INITIALIZING:
++		switch (event) {
++		case EV_FAULT_DETECTED:
++			next =3D PS_FAULTY;
++			break;
++		case EV_INIT_COMPLETE:
++			next =3D PS_LISTENING;
++			break;
++		default:
++			break;
++		}
++		break;
++
++	case PS_FAULTY:
++		switch (event) {
++		case EV_DESIGNATED_DISABLED:
++			next =3D PS_DISABLED;
++			break;
++		case EV_FAULT_CLEARED:
++			next =3D PS_INITIALIZING;
++			break;
++		default:
++			break;
++		}
++		break;
++
++	case PS_DISABLED:
++		if (EV_DESIGNATED_ENABLED =3D=3D event)
++			next =3D PS_INITIALIZING;
++		break;
++
++	case PS_LISTENING:
++		switch (event) {
++		case EV_DESIGNATED_DISABLED:
++			next =3D PS_DISABLED;
++			break;
++		case EV_FAULT_DETECTED:
++			next =3D PS_FAULTY;
++			break;
++		case EV_ANNOUNCE_RECEIPT_TIMEOUT_EXPIRES:
++		case EV_RS_MASTER:
++		case EV_RS_GRAND_MASTER:
++		case EV_RS_PASSIVE:
++			next =3D PS_LISTENING;
++			break;
++		case EV_RS_SLAVE:
++			next =3D PS_UNCALIBRATED;
++			break;
++		case EV_RS_PSLAVE:
++			next =3D PS_PASSIVE_SLAVE;
++			break;
++		default:
++			break;
++		}
++		break;
++
++	case PS_UNCALIBRATED:
++		switch (event) {
++		case EV_DESIGNATED_DISABLED:
++			next =3D PS_DISABLED;
++			break;
++		case EV_FAULT_DETECTED:
++			next =3D PS_FAULTY;
++			break;
++		case EV_ANNOUNCE_RECEIPT_TIMEOUT_EXPIRES:
++		case EV_RS_MASTER:
++		case EV_RS_GRAND_MASTER:
++		case EV_RS_PASSIVE:
++			next =3D PS_LISTENING;
++			break;
++		case EV_MASTER_CLOCK_SELECTED:
++			next =3D PS_SLAVE;
++			break;
++		case EV_RS_PSLAVE:
++			next =3D PS_PASSIVE_SLAVE;
++			break;
++		default:
++			break;
++		}
++		break;
++
++	case PS_SLAVE:
++		switch (event) {
++		case EV_DESIGNATED_DISABLED:
++			next =3D PS_DISABLED;
++			break;
++		case EV_FAULT_DETECTED:
++			next =3D PS_FAULTY;
++			break;
++		case EV_ANNOUNCE_RECEIPT_TIMEOUT_EXPIRES:
++		case EV_RS_MASTER:
++		case EV_RS_GRAND_MASTER:
++		case EV_RS_PASSIVE:
++			next =3D PS_LISTENING;
++			break;
++		case EV_SYNCHRONIZATION_FAULT:
++			next =3D PS_UNCALIBRATED;
++			break;
++		case EV_RS_SLAVE:
++			if (mdiff)
++				next =3D PS_UNCALIBRATED;
++			break;
++		case EV_RS_PSLAVE:
++			next =3D PS_PASSIVE_SLAVE;
++			break;
++		default:
++			break;
++		}
++		break;
++
++	case PS_PASSIVE_SLAVE:
++		switch (event) {
++		case EV_DESIGNATED_DISABLED:
++			next =3D PS_DISABLED;
++			break;
++		case EV_FAULT_DETECTED:
++			next =3D PS_FAULTY;
++			break;
++		case EV_ANNOUNCE_RECEIPT_TIMEOUT_EXPIRES:
++		case EV_RS_MASTER:
++		case EV_RS_GRAND_MASTER:
++		case EV_RS_PASSIVE:
++			next =3D PS_LISTENING;
++			break;
++		case EV_SYNCHRONIZATION_FAULT:
++			next =3D PS_UNCALIBRATED;
++			break;
++		case EV_RS_SLAVE:
++			next =3D PS_UNCALIBRATED;
++			break;
++		case EV_RS_PSLAVE:
++			next =3D PS_PASSIVE_SLAVE;
++			break;
++		case EV_NONE:
++			break;
++		default:
++			break;
++		}
++		break;
++
++	default:
++		break;
++	}
++
++	return next;
++}
+diff --git a/fsm.h b/fsm.h
+index e07d9a9..60f2805 100644
+--- a/fsm.h
++++ b/fsm.h
+@@ -60,6 +60,7 @@ enum fsm_event {
+ enum bmca_select {
+ 	BMCA_PTP,
+ 	BMCA_NOOP,
++	BMCA_RED_MASTER,
+ };
+=20
+ /**
+@@ -81,4 +82,22 @@ enum port_state ptp_fsm(enum port_state state, enum fsm=
_event event, int mdiff);
+ enum port_state ptp_slave_fsm(enum port_state state, enum fsm_event event=
,
+ 			      int mdiff);
+=20
++/**
++ * Run the state machine for a TC+OC setup on a redundant port setup.
++ * @param state  The current state of the port.
++ * @param event  The event to be processed.
++ * @param mdiff  Whether a new master has been selected.
++ * @return       The new state for the port.
++ */
++enum port_state ptp_red_m_fsm(enum port_state state, enum fsm_event event=
, int mdiff);
++
++/**
++ * Run the state machine for a TC+OC setup on a redundant port setup for =
a salve only clock.
++ * @param state  The current state of the port.
++ * @param event  The event to be processed.
++ * @param mdiff  Whether a new master has been selected.
++ * @return       The new state for the port.
++ */
++enum port_state ptp_red_slave_fsm(enum port_state state, enum fsm_event e=
vent, int mdiff);
++
+ #endif
+diff --git a/port.c b/port.c
+index 8953738..dfea6b4 100644
+--- a/port.c
++++ b/port.c
+@@ -3628,6 +3628,8 @@ struct port *port_open(const char *phc_device,
+ 			pr_err("Please enable at least one of serverOnly or clientOnly when BM=
CA =3D=3D noop.\n");
+ 			goto err_transport;
+ 		}
++	} else if (p->bmca =3D=3D BMCA_RED_MASTER) {
++		p->state_machine =3D clock_slave_only(clock) ? ptp_red_slave_fsm : ptp_=
red_m_fsm;
+ 	} else {
+ 		p->state_machine =3D clock_slave_only(clock) ? ptp_slave_fsm : ptp_fsm;
+ 	}
+diff --git a/ptp4l.8 b/ptp4l.8
+index c9a613c..f120f2e 100644
+--- a/ptp4l.8
++++ b/ptp4l.8
+@@ -590,6 +590,9 @@ bridge, clientOnly (which is a global option) can be s=
et to make all ports
+ assume the client role. masterOnly (which is a per-port config option) ca=
n then
+ be used to set individual ports to take on the server role.
+ The default value is 'ptp' which runs the BMCA related state machines.
++On a redundant network (HSR/ PRP) the value 'redundant_master' can be use=
d to
++used to specify a BMCA algorithm which accounts for the redundant ports i=
n such
++a scenario.
+=20
+ .TP
+ .B check_fup_sync
+--=20
+2.34.1
+
diff --git a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0007-=
p2p_hc-Add-a-double-attached-clock-hybrid-clock-HC.patch b/meta-arago-distr=
o/recipes-connectivity/linuxptp/linuxptp/0007-p2p_hc-Add-a-double-attached-=
clock-hybrid-clock-HC.patch
new file mode 100644
index 00000000..5335922b
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0007-p2p_hc-=
Add-a-double-attached-clock-hybrid-clock-HC.patch
@@ -0,0 +1,441 @@
+From 627dc3a86099584260d4519d26f41bbd5c7941f9 Mon Sep 17 00:00:00 2001
+From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+Date: Thu, 2 Oct 2025 10:39:45 +0200
+Subject: [PATCH 07/14] p2p_hc: Add a double attached clock, hybrid clock (=
HC).
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+The double attached clock, hybrid clock, is described in IEC 62439-3 for
+the two PRP/ HSR scenario with two ports.
+
+                =E2=94=8F=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=93
+                =E2=94=83                             =E2=94=83
+                =E2=94=83    Doubly Attached Node     =E2=94=83
+                =E2=94=83    =E2=94=84=E2=94=84=E2=94=84=E2=94=84=E2=94=84=
=E2=94=84=E2=94=84=E2=94=84=E2=94=84=E2=94=84=E2=94=84=E2=94=84=E2=94=84=E2=
=94=84=E2=94=84=E2=94=84=E2=94=84=E2=94=84=E2=94=84=E2=94=84     =E2=94=83
+                =E2=94=83           =E2=95=AD=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=95=AE            =E2=94=83
+                =E2=94=83           =E2=94=82 OC =E2=94=82            =E2=
=94=83
+                =E2=94=83           =E2=95=B0=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=95=AF            =E2=94=83
+                =E2=94=83             =E2=95=91               =E2=94=83
+                =E2=94=83             =E2=95=91               =E2=94=83
+                =E2=94=83           =E2=95=AD=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=95=AE            =E2=94=83
+                =E2=94=83    =E2=95=94=E2=95=90=E2=95=90=E2=95=90=E2=95=90=
=E2=95=90=E2=95=90=E2=94=82 TC =E2=94=82=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=97     =E2=94=83
+                =E2=94=83    =E2=95=91      =E2=95=B0=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=95=AF      =E2=95=91     =E2=94=83
+                =E2=94=83 =E2=95=AD=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=95=AE           =E2=95=AD=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=95=AE =E2=94=83
+                =E2=94=83 =E2=94=82Port A=E2=94=82           =E2=94=82Port=
 B=E2=94=82 =E2=94=83
+                =E2=94=83 =E2=95=B0=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=95=AF           =E2=95=B0=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=95=AF =E2=94=83
+                =E2=94=97=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=9B
+
+The TC has three ports: One for each networking port and one for the OC.
+The TC forwards SYNC packets from port A to B and to the OC to consume
+it. It sends PDELAY_* messages and responds to them.
+The OC receives usually two SYNC message which the TC received on both
+ports. It keeps the "better" one and ignores the other. Therefore it
+synchronises only against one of the two ports. In master mode the OC
+sends a SYNC message on both ports.
+
+Add a HC which implements a TC and OC. Use it if the OC is set and clock
+type is doubly attached.
+The clock is assigned as a special case of OC/ BC. The PTP specification
+mentions clockType for OC/ BC as 0/ 1 but the code is using 0x8000/
+0x4000. I don't where this is used so it pretends to be a OC.
+
+Upstream-Status: Submitted [https://lists.nwtime.org/sympa/arc/linuxptp-de=
vel/2026-03/msg00020.html]
+Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
+---
+
+ makefile       |   2 +-
+ p2p_hc.c       | 331 +++++++++++++++++++++++++++++++++++++++++++++++++
+ port.c         |   9 +-
+ port_private.h |   3 +
+ 4 files changed, 342 insertions(+), 3 deletions(-)
+ create mode 100644 p2p_hc.c
+
+diff --git a/makefile b/makefile
+index 50c2d5a..e42e147 100644
+--- a/makefile
++++ b/makefile
+@@ -31,7 +31,7 @@ TS2PHC	=3D ts2phc.o lstab.o nmea.o serial.o sock.o ts2ph=
c_generic_pps_source.o \
+  ts2phc_nmea_pps_source.o ts2phc_phc_pps_source.o ts2phc_pps_sink.o ts2ph=
c_pps_source.o
+ OBJ	=3D bmc.o clock.o clockadj.o clockcheck.o config.o designated_fsm.o \
+  e2e_tc.o fault.o $(FILTERS) fsm.o hash.o interface.o monitor.o msg.o phc=
.o \
+- pmc_common.o port.o port_signaling.o pqueue.o print.o ptp4l.o p2p_tc.o r=
tnl.o \
++ pmc_common.o port.o port_signaling.o pqueue.o print.o ptp4l.o p2p_tc.o p=
2p_hc.o rtnl.o \
+  $(SECURITY) $(SERVOS) sk.o stats.o tc.o $(TRANSP) telecom.o tlv.o tsproc=
.o \
+  unicast_client.o unicast_fsm.o unicast_service.o util.o version.o
+=20
+diff --git a/p2p_hc.c b/p2p_hc.c
+new file mode 100644
+index 0000000..4c0dbd8
+--- /dev/null
++++ b/p2p_hc.c
+@@ -0,0 +1,331 @@
++/**
++ * @file p2p_hc.c
++ * @brief Implements a Hybrid Clock (Transparent Clock + Ordinary Clock).
++ * @note Copyright (C) 2025 Sebastian Andrzej Siewior <bigeasy@linutronix=
.de>
++ * @note Based on TC/OC which is
++ * @note Copyright (C) 2018 Richard Cochran <richardcochran@gmail.com>
++ * @note SPDX-License-Identifier: GPL-2.0+
++ */
++#include <errno.h>
++
++#include "port.h"
++#include "port_private.h"
++#include "print.h"
++#include "rtnl.h"
++#include "sad.h"
++#include "tc.h"
++
++static int p2p_hc_delay_request(struct port *p)
++{
++	switch (p->state) {
++	case PS_INITIALIZING:
++	case PS_FAULTY:
++	case PS_DISABLED:
++		return 0;
++	case PS_LISTENING:
++	case PS_PRE_MASTER:
++	case PS_MASTER:
++	case PS_PASSIVE:
++	case PS_UNCALIBRATED:
++	case PS_SLAVE:
++	case PS_GRAND_MASTER:
++	case PS_PASSIVE_SLAVE:
++		break;
++	}
++	return port_delay_request(p);
++}
++
++static int port_set_sync_tx_tmo(struct port *p)
++{
++	return set_tmo_log(p->fda.fd[FD_SYNC_TX_TIMER], 1, p->logSyncInterval);
++}
++
++static void flush_peer_delay(struct port *p)
++{
++	if (p->peer_delay_req) {
++		msg_put(p->peer_delay_req);
++		p->peer_delay_req =3D NULL;
++	}
++	if (p->peer_delay_resp) {
++		msg_put(p->peer_delay_resp);
++		p->peer_delay_resp =3D NULL;
++	}
++	if (p->peer_delay_fup) {
++		msg_put(p->peer_delay_fup);
++		p->peer_delay_fup =3D NULL;
++	}
++}
++
++void p2p_hc_dispatch(struct port *p, enum fsm_event event, int mdiff)
++{
++	if (clock_slave_only(p->clock)) {
++		if (event =3D=3D EV_RS_GRAND_MASTER) {
++			const char *n =3D p->log_name;
++			pr_warning("%s: master state recommended in slave only mode", n);
++			pr_warning("%s: defaultDS.priority1 probably misconfigured", n);
++		}
++	}
++
++	if (!port_state_update(p, event, mdiff)) {
++		return;
++	}
++
++	if (!portnum(p)) {
++		/* UDS needs no timers. */
++		return;
++	}
++	/* port_p2p_transition */
++	port_clr_tmo(p->fda.fd[FD_ANNOUNCE_TIMER]);
++	port_clr_tmo(p->fda.fd[FD_SYNC_RX_TIMER]);
++	/* Leave FD_DELAY_TIMER running. */
++	port_clr_tmo(p->fda.fd[FD_QUALIFICATION_TIMER]);
++	port_clr_tmo(p->fda.fd[FD_MANNO_TIMER]);
++	port_clr_tmo(p->fda.fd[FD_SYNC_TX_TIMER]);
++
++	/*
++	 * Handle the side effects of the state transition.
++	 */
++	switch (p->state) {
++	case PS_INITIALIZING:
++		break;
++	case PS_FAULTY:
++	case PS_DISABLED:
++		port_disable(p);
++		sad_set_last_seqid(clock_config(p->clock), p->spp, -1);
++		break;
++	case PS_LISTENING:
++		port_set_announce_tmo(p);
++		port_set_delay_tmo(p);
++		break;
++	case PS_PRE_MASTER:
++		port_set_qualification_tmo(p);
++		break;
++	case PS_MASTER:
++	case PS_GRAND_MASTER:
++		if (!p->inhibit_announce) {
++			set_tmo_log(p->fda.fd[FD_MANNO_TIMER], 1, -10); /*~1ms*/
++		}
++		port_set_sync_tx_tmo(p);
++		sad_set_last_seqid(clock_config(p->clock), p->spp, -1);
++		break;
++	case PS_PASSIVE:
++		port_set_announce_tmo(p);
++		break;
++	case PS_UNCALIBRATED:
++		flush_last_sync(p);
++		flush_peer_delay(p);
++		sad_set_last_seqid(clock_config(p->clock), p->spp, -1);
++		/* fall through */
++	case PS_SLAVE:
++	case PS_PASSIVE_SLAVE:
++		port_set_announce_tmo(p);
++		break;
++	};
++}
++
++static int port_set_manno_tmo(struct port *p)
++{
++	return set_tmo_log(p->fda.fd[FD_MANNO_TIMER], 1, p->logAnnounceInterval)=
;
++}
++
++enum fsm_event p2p_hc_event(struct port *p, int fd_index)
++{
++	int cnt, err, fd =3D p->fda.fd[fd_index];
++	enum fsm_event event =3D EV_NONE;
++	struct ptp_message *msg, *dup;
++
++	switch (fd_index) {
++	case FD_ANNOUNCE_TIMER:
++	case FD_SYNC_RX_TIMER:
++		pr_debug("%s: %s timeout", p->log_name,
++			 fd_index =3D=3D FD_SYNC_RX_TIMER ? "rx sync" : "announce");
++		if (p->best) {
++			fc_clear(p->best);
++		}
++
++		if (fd_index =3D=3D FD_SYNC_RX_TIMER) {
++			p->service_stats.sync_timeout++;
++		} else {
++			p->service_stats.announce_timeout++;
++		}
++
++		if (p->inhibit_announce) {
++			port_clr_tmo(p->fda.fd[FD_ANNOUNCE_TIMER]);
++		} else {
++			port_set_announce_tmo(p);
++		}
++
++		if (p->inhibit_announce) {
++			return EV_NONE;
++		}
++		return EV_ANNOUNCE_RECEIPT_TIMEOUT_EXPIRES;
++
++	case FD_DELAY_TIMER:
++		pr_debug("%s: delay timeout", p->log_name);
++		port_set_delay_tmo(p);
++		tc_prune(p);
++		return p2p_hc_delay_request(p) ? EV_FAULT_DETECTED : EV_NONE;
++
++	case FD_QUALIFICATION_TIMER:
++		pr_debug("%s: qualification timeout", p->log_name);
++		p->service_stats.qualification_timeout++;
++		return EV_QUALIFICATION_TIMEOUT_EXPIRES;
++
++	case FD_MANNO_TIMER:
++		pr_debug("%s: master tx announce timeout", p->log_name);
++		port_set_manno_tmo(p);
++		p->service_stats.master_announce_timeout++;
++		clock_update_leap_status(p->clock);
++		return port_tx_announce(p, NULL, p->seqnum.announce++) ?
++			EV_FAULT_DETECTED : EV_NONE;
++
++	case FD_SYNC_TX_TIMER:
++		pr_debug("%s: master sync timeout", p->log_name);
++		port_set_sync_tx_tmo(p);
++		p->service_stats.master_sync_timeout++;
++		return port_tx_sync(p, NULL, p->seqnum.sync++) ?
++			EV_FAULT_DETECTED : EV_NONE;
++
++	case FD_UNICAST_REQ_TIMER:
++	case FD_UNICAST_SRV_TIMER:
++		pr_err("unexpected timer expiration");
++		return EV_NONE;
++
++	case FD_RTNL:
++		pr_debug("%s: received link status notification", p->log_name);
++		rtnl_link_status(fd, p->name, port_link_status, p);
++		if (p->link_status =3D=3D (LINK_UP|LINK_STATE_CHANGED)) {
++			return EV_FAULT_CLEARED;
++		} else if ((p->link_status =3D=3D (LINK_DOWN|LINK_STATE_CHANGED)) ||
++			   (p->link_status & TS_LABEL_CHANGED)) {
++			return EV_FAULT_DETECTED;
++		} else {
++			return EV_NONE;
++		}
++	}
++
++	msg =3D msg_allocate();
++	if (!msg) {
++		return EV_FAULT_DETECTED;
++	}
++	msg->hwts.type =3D p->timestamping;
++
++	cnt =3D transport_recv(p->trp, fd, msg);
++	if (cnt <=3D 0) {
++		pr_err("%s: recv message failed", p->log_name);
++		msg_put(msg);
++		return EV_FAULT_DETECTED;
++	}
++
++	if (msg_sots_valid(msg)) {
++		ts_add(&msg->hwts.ts, -p->rx_timestamp_offset);
++	}
++	if (msg_unicast(msg)) {
++		pl_warning(600, "cannot switch unicast messages! type %s",
++			   msg_type_string(msg_type(msg)));
++		msg_put(msg);
++		return EV_NONE;
++	}
++
++	dup =3D msg_duplicate(msg, cnt);
++	if (!dup) {
++		msg_put(msg);
++		return EV_NONE;
++	}
++	msg_tlv_copy(dup, msg);
++	if (tc_ignore(p, dup)) {
++		msg_put(dup);
++		dup =3D NULL;
++	} else {
++		err =3D sad_process_auth(clock_config(p->clock), p->spp, dup, msg);
++		if (err) {
++			switch (err) {
++			case -EBADMSG:
++				pr_err("%s: auth: bad message", p->log_name);
++				break;
++			case -EPROTO:
++				pr_debug("%s: auth: ignoring message", p->log_name);
++				break;
++			}
++			msg_put(msg);
++			if (dup) {
++				msg_put(dup);
++			}
++			return EV_NONE;
++		}
++	}
++
++	switch (msg_type(msg)) {
++	case SYNC:
++		if (tc_fwd_sync(p, msg)) {
++			event =3D EV_FAULT_DETECTED;
++			break;
++		}
++		if (dup) {
++			process_sync(p, dup);
++		}
++		break;
++	case DELAY_REQ:
++		break;
++	case PDELAY_REQ:
++		if (dup && process_pdelay_req(p, dup)) {
++			event =3D EV_FAULT_DETECTED;
++		}
++		break;
++	case PDELAY_RESP:
++		if (dup && process_pdelay_resp(p, dup)) {
++			event =3D EV_FAULT_DETECTED;
++		}
++		break;
++	case FOLLOW_UP:
++		if (tc_fwd_folup(p, msg)) {
++			event =3D EV_FAULT_DETECTED;
++			break;
++		}
++		if (dup) {
++			process_follow_up(p, dup);
++		}
++		break;
++	case DELAY_RESP:
++		break;
++	case PDELAY_RESP_FOLLOW_UP:
++		if (dup) {
++			process_pdelay_resp_fup(p, dup);
++		}
++		break;
++	case ANNOUNCE:
++		if (tc_forward(p, msg)) {
++			event =3D EV_FAULT_DETECTED;
++			break;
++		}
++		if (dup && process_announce(p, dup)) {
++			event =3D EV_STATE_DECISION_EVENT;
++		}
++		break;
++	case SIGNALING:
++		if (tc_forward(p, msg)) {
++			event =3D EV_FAULT_DETECTED;
++			break;
++		}
++		if (dup && process_signaling(p, dup)) {
++			event =3D EV_FAULT_DETECTED;
++		}
++		break;
++
++	case MANAGEMENT:
++		if (tc_forward(p, msg)) {
++			event =3D EV_FAULT_DETECTED;
++			break;
++		}
++		if (dup && clock_manage(p->clock, p, dup)) {
++			event =3D EV_STATE_DECISION_EVENT;
++		}
++		break;
++	}
++
++	msg_put(msg);
++	if (dup) {
++		msg_put(dup);
++	}
++	return event;
++}
+diff --git a/port.c b/port.c
+index dfea6b4..be4de6e 100644
+--- a/port.c
++++ b/port.c
+@@ -3592,8 +3592,13 @@ struct port *port_open(const char *phc_device,
+ 	switch (type) {
+ 	case CLOCK_TYPE_ORDINARY:
+ 	case CLOCK_TYPE_BOUNDARY:
+-		p->dispatch =3D bc_dispatch;
+-		p->event =3D bc_event;
++		if (clock_type_is_DAC(clock)) {
++			p->dispatch =3D p2p_hc_dispatch;
++			p->event =3D p2p_hc_event;
++		} else {
++			p->dispatch =3D bc_dispatch;
++			p->event =3D bc_event;
++		}
+ 		break;
+ 	case CLOCK_TYPE_P2P:
+ 		p->dispatch =3D p2p_dispatch;
+diff --git a/port_private.h b/port_private.h
+index 79b1d31..507c296 100644
+--- a/port_private.h
++++ b/port_private.h
+@@ -185,6 +185,9 @@ enum fsm_event e2e_event(struct port *p, int fd_index)=
;
+ void p2p_dispatch(struct port *p, enum fsm_event event, int mdiff);
+ enum fsm_event p2p_event(struct port *p, int fd_index);
+=20
++void p2p_hc_dispatch(struct port *p, enum fsm_event event, int mdiff);
++enum fsm_event p2p_hc_event(struct port *p, int fd_index);
++
+ int clear_fault_asap(struct fault_interval *faint);
+ void delay_req_prune(struct port *p);
+ void fc_clear(struct foreign_clock *fc);
+--=20
+2.34.1
+
diff --git a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0008-=
tc-Allow-to-forward-packets-both-ways-in-DAC-mode.patch b/meta-arago-distro=
/recipes-connectivity/linuxptp/linuxptp/0008-tc-Allow-to-forward-packets-bo=
th-ways-in-DAC-mode.patch
new file mode 100644
index 00000000..628d47ca
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0008-tc-Allo=
w-to-forward-packets-both-ways-in-DAC-mode.patch
@@ -0,0 +1,34 @@
+From 225be4282c6492f3e629fb9e34636020e43ffa82 Mon Sep 17 00:00:00 2001
+From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+Date: Thu, 2 Oct 2025 10:45:44 +0200
+Subject: [PATCH 08/14] tc: Allow to forward packets both ways in DAC mode
+
+In a HSR/ DAC setup, the TC should forward SYNC, FOLLOW-UP packets in
+both directions.
+
+Allow to forward packets both ways in DAC mode.
+
+Upstream-Status: Submitted [https://lists.nwtime.org/sympa/arc/linuxptp-de=
vel/2026-03/msg00021.html]
+Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
+---
+
+ tc.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tc.c b/tc.c
+index 0fd1bc4..109947d 100644
+--- a/tc.c
++++ b/tc.c
+@@ -105,7 +105,7 @@ static int tc_blocked(struct port *q, struct port *p, =
struct ptp_message *m)
+ 	case PS_SLAVE:
+ 	case PS_PASSIVE_SLAVE:
+ 		/* Delay_Req swims against the stream. */
+-		if (msg_type(m) !=3D DELAY_REQ) {
++		if (!clock_type_is_DAC(p->clock) && msg_type(m) !=3D DELAY_REQ) {
+ 			return 1;
+ 		}
+ 		break;
+--=20
+2.34.1
+
diff --git a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0009-=
port-Add-a-safe-guard-in-case-PASSIVE_SLAVE-attempts.patch b/meta-arago-dis=
tro/recipes-connectivity/linuxptp/linuxptp/0009-port-Add-a-safe-guard-in-ca=
se-PASSIVE_SLAVE-attempts.patch
new file mode 100644
index 00000000..e238dd82
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0009-port-Ad=
d-a-safe-guard-in-case-PASSIVE_SLAVE-attempts.patch
@@ -0,0 +1,34 @@
+From 3c7378a38c5c52f9e98637c1fc47a10e3b769cf8 Mon Sep 17 00:00:00 2001
+From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+Date: Thu, 2 Oct 2025 10:46:17 +0200
+Subject: [PATCH 09/14] port: Add a safe guard in case PASSIVE_SLAVE attemp=
ts
+ to sync
+
+Add a error message in case port_synchronize() attempts to synchronize
+the lock on a port in PASSIVE_SLAVE state.
+
+Upstream-Status: Submitted [https://lists.nwtime.org/sympa/arc/linuxptp-de=
vel/2026-03/msg00023.html]
+Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
+---
+
+ port.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/port.c b/port.c
+index be4de6e..119ab13 100644
+--- a/port.c
++++ b/port.c
+@@ -1434,6 +1434,9 @@ static void port_synchronize(struct port *p,
+ 			     clock_parent_identity(p->clock), seqid,
+ 			     t1, tmv_add(c1, c2), t2);
+ 		break;
++	case PS_PASSIVE_SLAVE:
++		pr_err("Port in passive slave attempts to synchronize");
++		return;
+ 	default:
+ 		break;
+ 	}
+--=20
+2.34.1
+
diff --git a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0010-=
tc-Allow-to-forward-packets-in-LISTEN-state.patch b/meta-arago-distro/recip=
es-connectivity/linuxptp/linuxptp/0010-tc-Allow-to-forward-packets-in-LISTE=
N-state.patch
new file mode 100644
index 00000000..a5a4c745
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0010-tc-Allo=
w-to-forward-packets-in-LISTEN-state.patch
@@ -0,0 +1,58 @@
+From 182a054dc04485bbdd352e1f26fab224cfaaecf1 Mon Sep 17 00:00:00 2001
+From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+Date: Thu, 2 Oct 2025 13:01:53 +0200
+Subject: [PATCH 10/14] tc: Allow to forward packets in LISTEN state
+
+In the HSR/ DAC network, the port which receives ANNOUNCE messages
+enters SLAVE state. The other port remains in LISTEN state since it does
+not receive any PTP packets.
+The tc_blocked() forbids to forward a packet if the EGRESS port is in
+listen state.
+
+Allow to forward packets if the EGRESS port is in LISTEN state. If the
+packets make their way through the ring, the port will eventually switch
+to PASSIVE_SLAVE state.
+
+Upstream-Status: Submitted [https://lists.nwtime.org/sympa/arc/linuxptp-de=
vel/2026-03/msg00024.html]
+Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
+---
+
+ tc.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tc.c b/tc.c
+index 109947d..15b83c4 100644
+--- a/tc.c
++++ b/tc.c
+@@ -75,7 +75,6 @@ static int tc_blocked(struct port *q, struct port *p, st=
ruct ptp_message *m)
+ 	case PS_INITIALIZING:
+ 	case PS_FAULTY:
+ 	case PS_DISABLED:
+-	case PS_LISTENING:
+ 	case PS_PRE_MASTER:
+ 	case PS_PASSIVE:
+ 		return 1;
+@@ -86,6 +85,7 @@ static int tc_blocked(struct port *q, struct port *p, st=
ruct ptp_message *m)
+ 			return 1;
+ 		}
+ 		break;
++	case PS_LISTENING:
+ 	case PS_UNCALIBRATED:
+ 	case PS_SLAVE:
+ 	case PS_PASSIVE_SLAVE:
+@@ -97,10 +97,10 @@ static int tc_blocked(struct port *q, struct port *p, =
struct ptp_message *m)
+ 	case PS_INITIALIZING:
+ 	case PS_FAULTY:
+ 	case PS_DISABLED:
+-	case PS_LISTENING:
+ 	case PS_PRE_MASTER:
+ 	case PS_PASSIVE:
+ 		return 1;
++	case PS_LISTENING:
+ 	case PS_UNCALIBRATED:
+ 	case PS_SLAVE:
+ 	case PS_PASSIVE_SLAVE:
+--=20
+2.34.1
+
diff --git a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0011-=
raw-Add-HSR-and-PRP-handling.patch b/meta-arago-distro/recipes-connectivity=
/linuxptp/linuxptp/0011-raw-Add-HSR-and-PRP-handling.patch
new file mode 100644
index 00000000..9abe9063
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0011-raw-Add=
-HSR-and-PRP-handling.patch
@@ -0,0 +1,690 @@
+From d723f1211ff96254672e0ea45d491130f9e15d68 Mon Sep 17 00:00:00 2001
+From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+Date: Wed, 22 Oct 2025 15:42:28 +0200
+Subject: [PATCH 11/14] raw: Add HSR and PRP handling
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+In a HSR network each device as two port attached to the HSR ring. The
+two ports are usually called port A and port B. The communication is
+Ethernet based and the payload part is ETH_P_HSR. After the HSR header,
+for PTP the payload is ETH_P_1588 as usual. So we have either
+
+     =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
+     =E2=94=82 MAC DST =E2=94=82 MAC SRC =E2=94=82 HSR-TAG =E2=94=82 PTP =
=E2=94=82
+     =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=B4=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=B4=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=B4=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98
+or with VLAN enabled
+     =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=AC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
+     =E2=94=82 MAC DST =E2=94=82 MAC SRC =E2=94=82 VLAN-TAG =E2=94=82 HSR-=
TAG =E2=94=82 PTP =E2=94=82
+     =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=B4=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=B4=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=B4=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=B4=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98
+
+The kernel is supposed not to forward HSR packets with ETH_P_1588
+payload. Also it must support socket option PACKET_HSR_BIND_PORT to bind
+the hsr device to one of the two ports via PACKET_HSR_BIND_PORT_A or
+PACKET_HSR_BIND_PORT_B. It needs to support PACKET_HSR_INFO with the
+option PACKET_HSR_INFO_HAS_HDR for the control message in order to send
+HSR with a HSR header. These changes are not merged into the upstream.
+
+PRP is slighly different. It does not operate in a ring but instead both p=
orts
+are connected to different networks. The destination can be reached either=
 by
+network A or network B. Instead of header at the front of the packet, as i=
n the
+HSR case, PRP uses a header at the end of the packet. The requirements in =
terms
+of listening and sending only on one of the ports are the same.
+
+This interface is used by ptp4l to receive both copies of a packets and
+to send a packet on one of the two ports including a PTP timestamp.
+
+The clock is setup as TC which means the forwarding done by ptp4l will
+properly update the correction header. The HSR header of a received
+message is saved so it can be used while the packet is forwarded. This
+is important to keep the MAC address of the sender but also to keep HSR
+fields such as sequence number or port.
+The PDELAY_* packets are not forwarded and instead responded to. Here
+the HSR header is constructed by the HSR stack and the packet is sent
+only on the request port.
+
+The added BPF filter is based on the existing one and adds HSR type
+handling and ignores possible VLAN. The filter drops all packets which
+are sent by "us". The sender is supposed to remove his packets from the
+ring.
+
+Upstream-Status: Submitted [https://lists.nwtime.org/sympa/arc/linuxptp-de=
vel/2026-03/msg00026.html]
+Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
+---
+
+ ether.h   |  15 ++
+ missing.h |  13 ++
+ msg.c     |   3 +-
+ msg.h     |   6 +
+ raw.c     | 411 ++++++++++++++++++++++++++++++++++++++++++++++++------
+ 5 files changed, 405 insertions(+), 43 deletions(-)
+
+diff --git a/ether.h b/ether.h
+index 276eec4..d8c301d 100644
+--- a/ether.h
++++ b/ether.h
+@@ -48,4 +48,19 @@ struct vlan_hdr {
+ 	uint16_t type;
+ } __attribute__((packed));
+=20
++struct hsr_hdr {
++	eth_addr dst;
++	eth_addr src;
++	uint16_t type;
++	uint16_t pathid_and_LSDU_size;
++	uint16_t sequence_nr;
++	uint16_t encap_type;
++} __attribute__((packed));
++
++struct prp_rct {
++         uint16_t sequence_nr;
++         uint16_t pathid_and_LSDU_size;
++         uint16_t prp_suffix;
++}__attribute__((packed));
++
+ #endif
+diff --git a/missing.h b/missing.h
+index c6be8fd..583e035 100644
+--- a/missing.h
++++ b/missing.h
+@@ -137,6 +137,19 @@ enum {
+ #define PTP_PEROUT_REQUEST2 PTP_PEROUT_REQUEST
+ #endif
+=20
++#ifndef PACKET_HSR_BIND_PORT
++#define PACKET_HSR_BIND_PORT	25
++
++/* For HSR, bind port */
++#define PACKET_HSR_BIND_PORT_AB		0
++#define PACKET_HSR_BIND_PORT_A		1
++#define PACKET_HSR_BIND_PORT_B		2
++/* HSR, CMSG */
++#define PACKET_HSR_INFO			1
++#define PACKET_HSR_INFO_HAS_HDR		1
++
++#endif
++
+ #if LINUX_VERSION_CODE < KERNEL_VERSION(6,5,0)
+=20
+ /* from upcoming Linux kernel version 6.5 */
+diff --git a/msg.c b/msg.c
+index 7c236c3..9989456 100644
+--- a/msg.c
++++ b/msg.c
+@@ -32,7 +32,8 @@ int assume_two_step =3D 0;
+ uint8_t ptp_hdr_ver =3D PTP_VERSION;
+=20
+ /*
+- * Head room fits a VLAN Ethernet header, and 'msg' is 64 bit aligned.
++ * Head room fits a VLAN Ethernet header or a HSR-Ethernet header, and 'm=
sg' is
++ * 64 bit aligned.
+  */
+ #define MSG_HEADROOM 24
+=20
+diff --git a/msg.h b/msg.h
+index 58c2287..c53e07b 100644
+--- a/msg.h
++++ b/msg.h
+@@ -29,6 +29,7 @@
+ #include "ddt.h"
+ #include "tlv.h"
+ #include "tmv.h"
++#include "ether.h"
+=20
+ /* Version definition for IEEE 1588-2019 */
+ #define PTP_MAJOR_VERSION	2
+@@ -238,6 +239,11 @@ struct ptp_message {
+ 	 * pointers to the appended TLVs.
+ 	 */
+ 	TAILQ_HEAD(tlv_list, tlv_extra) tlv_list;
++	/**
++	 * Containing the HSR header
++	 */
++	struct hsr_hdr hsr_header;
++	int hsr_header_valid;
+ };
+=20
+ /**
+diff --git a/raw.c b/raw.c
+index c809233..ed8c2c8 100644
+--- a/raw.c
++++ b/raw.c
+@@ -39,6 +39,7 @@
+ #include "address.h"
+ #include "config.h"
+ #include "contain.h"
++#include "clock.h"
+ #include "ether.h"
+ #include "missing.h"
+ #include "print.h"
+@@ -46,6 +47,7 @@
+ #include "sk.h"
+ #include "transport_private.h"
+ #include "util.h"
++#include "rtnl.h"
+=20
+ struct raw {
+ 	struct transport t;
+@@ -53,10 +55,134 @@ struct raw {
+ 	struct address ptp_addr;
+ 	struct address p2p_addr;
+ 	int vlan;
++	unsigned int hsr_port;
+ };
+=20
+ #define PRP_TRAILER_LEN 6
+=20
++#define HSR_MODE	(1 << 8)
++#define PRP_MODE	(2 << 8)
++#define MASK_MODE	(3 << 8)
++
++#define PORT_1		(1 << 0)
++#define PORT_2		(2 << 0)
++#define MASK_PORT	(3 << 0)
++
++#define PORT_HSR_1	(HSR_MODE | PORT_1)
++#define PORT_HSR_2	(HSR_MODE | PORT_2)
++#define PORT_PRP_1	(PRP_MODE | PORT_1)
++#define PORT_PRP_2	(PRP_MODE | PORT_2)
++
++static bool mode_is_hsr(unsigned int hsr_port)
++{
++	return (hsr_port & MASK_MODE) =3D=3D HSR_MODE;
++}
++
++static bool mode_is_prp(unsigned int hsr_port)
++{
++	return (hsr_port & MASK_MODE) =3D=3D PRP_MODE;
++}
++
++static unsigned int get_port_num(unsigned int hsr_port)
++{
++	return hsr_port & MASK_PORT;
++}
++
++static unsigned int set_port_num(enum redundancy_type red_type, unsigned =
int num)
++{
++	unsigned int mode;
++
++	switch (red_type) {
++	case RED_HSR:
++		mode =3D HSR_MODE;
++		break;
++	case RED_PRP:
++		mode =3D PRP_MODE;
++		break;
++	default:
++		return 0;
++	}
++	if (num !=3D PORT_1 && num !=3D PORT_2)
++		return 0;
++	return mode | num;
++}
++
++/*
++ * tcpdump -d
++ *  'ether[12:2] =3D=3D 0x892f && ether[18:2] =3D=3D 0x88F7 and
++ *  (ether[18 +2:1] & 0x8 =3D=3D 0x8) &&
++ *   not ether src 11:22:33:44:55:66'
++ *
++ * (000) ldh      [12]
++ * (001) jeq      #0x892f          jt 2	jf 12
++ * (002) ldh      [18]
++ * (003) jeq      #0x88f7          jt 4	jf 12
++ * (004) ldb      [20]
++ * (005) and      #0x8
++ * (006) jeq      #0x8             jt 7	jf 12
++ * (007) ld       [8]
++ * (008) jeq      #0x33445566      jt 9	jf 11
++ * (009) ldh      [6]
++ * (010) jeq      #0x1122          jt 12	jf 11
++ * (011) ret      #262144
++ * (012) ret      #0
++ */
++static struct sock_filter raw_filter_hsr_norm_general[] =3D {
++	{ 0x28, 0, 0, 0x0000000c },
++	{ 0x15, 0, 10, 0x0000892f },
++	{ 0x28, 0, 0, 0x00000012 },
++	{ 0x15, 0, 8, 0x000088f7 },
++	{ 0x30, 0, 0, 0x00000014 },
++	{ 0x54, 0, 0, 0x00000008 },
++	{ 0x15, 0, 5, 0x00000008 },
++	{ 0x20, 0, 0, 0x00000008 },
++	{ 0x15, 0, 2, 0x33445566 },
++	{ 0x28, 0, 0, 0x00000006 },
++	{ 0x15, 1, 0, 0x00001122 },
++	{ 0x6, 0, 0, 0x00040000 },
++	{ 0x6, 0, 0, 0x00000000 },
++};
++#define FILTER_HSR_GENERAL_SRC0 10
++#define FILTER_HSR_GENERAL_SRC2 8
++
++/*
++ * tcpdump -d
++ *  'ether[12:2] =3D=3D 0x892f && ether[18:2] =3D=3D 0x88F7 and
++ *   (ether[18 +2:1] & 0x8 !=3D 0x8) &&
++ *   not ether src 11:22:33:44:55:66'
++ *
++ * (000) ldh      [12]
++ * (001) jeq      #0x892f          jt 2	jf 12
++ * (002) ldh      [18]
++ * (003) jeq      #0x88f7          jt 4	jf 12
++ * (004) ldb      [20]
++ * (005) and      #0x8
++ * (006) jeq      #0x8             jt 12	jf 7
++ * (007) ld       [8]
++ * (008) jeq      #0x33445566      jt 9	jf 11
++ * (009) ldh      [6]
++ * (010) jeq      #0x1122          jt 12	jf 11
++ * (011) ret      #262144
++ * (012) ret      #0
++ */
++static struct sock_filter raw_filter_hsr_norm_event[] =3D {
++	{ 0x28, 0, 0, 0x0000000c },
++	{ 0x15, 0, 10, 0x0000892f },
++	{ 0x28, 0, 0, 0x00000012 },
++	{ 0x15, 0, 8, 0x000088f7 },
++	{ 0x30, 0, 0, 0x00000014 },
++	{ 0x54, 0, 0, 0x00000008 },
++	{ 0x15, 5, 0, 0x00000008 },
++	{ 0x20, 0, 0, 0x00000008 },
++	{ 0x15, 0, 2, 0x33445566 },
++	{ 0x28, 0, 0, 0x00000006 },
++	{ 0x15, 1, 0, 0x00001122 },
++	{ 0x6, 0, 0, 0x00040000 },
++	{ 0x6, 0, 0, 0x00000000 },
++};
++#define FILTER_HSR_EVENT_SRC0 10
++#define FILTER_HSR_EVENT_SRC2 8
++
+ /*
+  * tcpdump -d \
+  * '((ether[12:2] =3D=3D 0x8100 and ether[12 + 4 :2] =3D=3D 0x88F7 and et=
her[14+4 :1] & 0x8 =3D=3D 0x8) or '\
+@@ -153,32 +279,59 @@ static struct sock_filter raw_filter_vlan_norm_event=
[] =3D {
+=20
+ static int raw_configure(int fd, int event, int index,
+ 			 unsigned char *local_addr, unsigned char *addr1,
+-			 unsigned char *addr2, int enable)
++			 unsigned char *addr2, int enable, unsigned int hsr_port)
+ {
+ 	int err1, err2, option;
+ 	struct packet_mreq mreq;
+ 	struct sock_fprog prg;
+=20
+-	if (event) {
+-		prg.len =3D ARRAY_SIZE(raw_filter_vlan_norm_event);
+-		prg.filter =3D raw_filter_vlan_norm_event;
+-
+-		memcpy(&prg.filter[FILTER_EVENT_POS_SRC0].k, local_addr, 2);
+-		memcpy(&prg.filter[FILTER_EVENT_POS_SRC2].k, local_addr + 2, 4);
+-		prg.filter[FILTER_EVENT_POS_SRC0].k =3D
+-			ntohs(prg.filter[FILTER_EVENT_POS_SRC0].k);
+-		prg.filter[FILTER_EVENT_POS_SRC2].k =3D
+-			ntohl(prg.filter[FILTER_EVENT_POS_SRC2].k);
++	if (mode_is_hsr(hsr_port)) {
++		if (event) {
++			prg.len =3D ARRAY_SIZE(raw_filter_hsr_norm_event);
++			prg.filter =3D raw_filter_hsr_norm_event;
++
++			memcpy(&prg.filter[FILTER_HSR_EVENT_SRC0].k, local_addr, 2);
++			memcpy(&prg.filter[FILTER_HSR_EVENT_SRC2].k, local_addr + 2, 4);
++
++			prg.filter[FILTER_HSR_EVENT_SRC0].k =3D
++				ntohs(prg.filter[FILTER_HSR_EVENT_SRC0].k);
++			prg.filter[FILTER_HSR_EVENT_SRC2].k =3D
++				ntohl(prg.filter[FILTER_HSR_EVENT_SRC2].k);
++		} else {
++			prg.len =3D ARRAY_SIZE(raw_filter_hsr_norm_general);
++			prg.filter =3D raw_filter_hsr_norm_general;
++
++			memcpy(&prg.filter[FILTER_HSR_GENERAL_SRC0].k, local_addr, 2);
++			memcpy(&prg.filter[FILTER_HSR_GENERAL_SRC2].k, local_addr + 2, 4);
++
++			prg.filter[FILTER_HSR_GENERAL_SRC0].k =3D
++				ntohs(prg.filter[FILTER_HSR_GENERAL_SRC0].k);
++			prg.filter[FILTER_HSR_GENERAL_SRC2].k =3D
++				ntohl(prg.filter[FILTER_HSR_GENERAL_SRC2].k);
++		}
+ 	} else {
+-		prg.len =3D ARRAY_SIZE(raw_filter_vlan_norm_general);
+-		prg.filter =3D raw_filter_vlan_norm_general;
+-
+-		memcpy(&prg.filter[FILTER_GENERAL_POS_SRC0].k, local_addr, 2);
+-		memcpy(&prg.filter[FILTER_GENERAL_POS_SRC2].k, local_addr + 2, 4);
+-		prg.filter[FILTER_GENERAL_POS_SRC0].k =3D
+-			ntohs(prg.filter[FILTER_GENERAL_POS_SRC0].k);
+-		prg.filter[FILTER_GENERAL_POS_SRC2].k =3D
+-			ntohl(prg.filter[FILTER_GENERAL_POS_SRC2].k);
++		if (event) {
++			prg.len =3D ARRAY_SIZE(raw_filter_vlan_norm_event);
++			prg.filter =3D raw_filter_vlan_norm_event;
++
++			memcpy(&prg.filter[FILTER_EVENT_POS_SRC0].k, local_addr, 2);
++			memcpy(&prg.filter[FILTER_EVENT_POS_SRC2].k, local_addr + 2, 4);
++			prg.filter[FILTER_EVENT_POS_SRC0].k =3D
++				ntohs(prg.filter[FILTER_EVENT_POS_SRC0].k);
++			prg.filter[FILTER_EVENT_POS_SRC2].k =3D
++				ntohl(prg.filter[FILTER_EVENT_POS_SRC2].k);
++		} else {
++			prg.len =3D ARRAY_SIZE(raw_filter_vlan_norm_general);
++			prg.filter =3D raw_filter_vlan_norm_general;
++
++			memcpy(&prg.filter[FILTER_GENERAL_POS_SRC0].k, local_addr, 2);
++			memcpy(&prg.filter[FILTER_GENERAL_POS_SRC2].k, local_addr + 2, 4);
++			prg.filter[FILTER_GENERAL_POS_SRC0].k =3D
++				ntohs(prg.filter[FILTER_GENERAL_POS_SRC0].k);
++			prg.filter[FILTER_GENERAL_POS_SRC2].k =3D
++				ntohl(prg.filter[FILTER_GENERAL_POS_SRC2].k);
++
++		}
+ 	}
+=20
+ 	if (setsockopt(fd, SOL_SOCKET, SO_ATTACH_FILTER, &prg, sizeof(prg))) {
+@@ -236,7 +389,7 @@ static int raw_close(struct transport *t, struct fdarr=
ay *fda)
+=20
+ static int open_socket(const char *name, int event, unsigned char *local_=
addr,
+ 		       unsigned char *ptp_dst_mac, unsigned char *p2p_dst_mac,
+-		       int socket_priority)
++		       int socket_priority, unsigned int hsr_port)
+ {
+ 	struct sockaddr_ll addr;
+ 	int fd, index;
+@@ -256,8 +409,22 @@ static int open_socket(const char *name, int event, u=
nsigned char *local_addr,
+ 		pr_err("setsockopt SO_PRIORITY failed: %m");
+ 		goto no_option;
+ 	}
++	if (hsr_port) {
++		int option;
++
++		if (get_port_num(hsr_port) =3D=3D 1)
++			option =3D PACKET_HSR_BIND_PORT_A;
++		else
++			option =3D PACKET_HSR_BIND_PORT_B;
++
++		if (setsockopt(fd, SOL_PACKET, PACKET_HSR_BIND_PORT, &option,
++				 sizeof(option))) {
++			pr_err("setsockopt(SOL_PACKET, PACKET_HSR_BIND_PORT) failed: %m");
++			goto no_option;
++		}
++	}
+ 	if (raw_configure(fd, event, index, local_addr, ptp_dst_mac,
+-			  p2p_dst_mac, 1))
++			  p2p_dst_mac, 1, hsr_port))
+ 		goto no_option;
+=20
+ 	memset(&addr, 0, sizeof(addr));
+@@ -345,6 +512,57 @@ static bool has_prp_trailer(unsigned char *ptr, int c=
nt)
+ 	return false;
+ }
+=20
++static int raw_handle_red_device(struct transport *t, struct interface *i=
face,
++				 const char **ret_device)
++{
++	struct raw *raw =3D container_of(t, struct raw, t);
++	const char *name, *main_device;
++	enum redundancy_type red_type;
++	char port_A[IF_NAMESIZE];
++	char port_B[IF_NAMESIZE];
++	const char *type_str;
++	char port_ch;
++	int ret;
++
++	*ret_device =3D NULL;
++	red_type =3D config_get_int(t->cfg, NULL, "redundant_network");
++	if (red_type =3D=3D RED_NONE)
++		return 0;
++
++	type_str =3D red_type =3D=3D RED_HSR ? "HSR" : "PRP";
++
++	name =3D interface_label(iface);
++	main_device =3D config_get_string(t->cfg, name, "redundant_device");
++	if (!strlen(main_device))
++		return 0;
++
++	ret =3D rtnl_get_hsr_devices(main_device, port_A, port_B);
++	if (ret < 0) {
++		pr_err("Failed to query hsr device %s", main_device);
++		return -1;
++	}
++	if (!strcmp(name, port_A)) {
++		raw->hsr_port =3D set_port_num(red_type, PORT_1);
++		port_ch =3D 'A';
++	} else if (!strcmp(name, port_B)) {
++		raw->hsr_port =3D set_port_num(red_type, PORT_2);
++		port_ch =3D 'B';
++	} else {
++		pr_err("raw: %s device %s has no slae %s", type_str,
++		       main_device, name);
++		return -1;
++	}
++	if (!raw->hsr_port) {
++		pr_err("raw: %s failed to assign %s", type_str, name);
++		       return -1;
++	}
++
++	pr_notice("raw: %s interface %s/%s, port %c", type_str, main_device,
++		  name, port_ch);
++	*ret_device =3D main_device;
++	return 0;
++}
++
+ static int raw_open(struct transport *t, struct interface *iface,
+ 		    struct fdarray *fda, enum timestamp_type ts_type)
+ {
+@@ -352,7 +570,7 @@ static int raw_open(struct transport *t, struct interf=
ace *iface,
+ 	unsigned char ptp_dst_mac[MAC_LEN];
+ 	unsigned char p2p_dst_mac[MAC_LEN];
+ 	int efd, gfd, socket_priority;
+-	const char *name;
++	const char *name, *main_device;
+ 	char *str;
+=20
+ 	name =3D interface_label(iface);
+@@ -369,18 +587,21 @@ static int raw_open(struct transport *t, struct inte=
rface *iface,
+ 	mac_to_addr(&raw->ptp_addr, ptp_dst_mac);
+ 	mac_to_addr(&raw->p2p_addr, p2p_dst_mac);
+=20
++	if (raw_handle_red_device(t, iface, &main_device))
++		goto no_mac;
++
+ 	if (sk_interface_macaddr(name, &raw->src_addr))
+ 		goto no_mac;
+=20
+ 	socket_priority =3D config_get_int(t->cfg, "global", "socket_priority");
+=20
+-	efd =3D open_socket(name, 1, raw->src_addr.sll.sll_addr, ptp_dst_mac,
+-			  p2p_dst_mac, socket_priority);
++	efd =3D open_socket(main_device ?: name, 1, raw->src_addr.sll.sll_addr, =
ptp_dst_mac,
++			  p2p_dst_mac, socket_priority, raw->hsr_port);
+ 	if (efd < 0)
+ 		goto no_event;
+=20
+-	gfd =3D open_socket(name, 0, raw->src_addr.sll.sll_addr, p2p_dst_mac,
+-			  p2p_dst_mac, socket_priority);
++	gfd =3D open_socket(main_device ?: name, 0, raw->src_addr.sll.sll_addr, =
p2p_dst_mac,
++			  p2p_dst_mac, socket_priority, raw->hsr_port);
+ 	if (gfd < 0)
+ 		goto no_general;
+=20
+@@ -412,7 +633,9 @@ static int raw_recv(struct transport *t, int fd, void =
*buf, int buflen,
+ 	struct eth_hdr *hdr;
+ 	int cnt, hlen;
+=20
+-	if (raw->vlan) {
++	if (mode_is_hsr(raw->hsr_port)) {
++		hlen =3D sizeof(struct hsr_hdr);
++	} else if (raw->vlan) {
+ 		hlen =3D sizeof(struct vlan_hdr);
+ 	} else {
+ 		hlen =3D sizeof(struct eth_hdr);
+@@ -428,10 +651,47 @@ static int raw_recv(struct transport *t, int fd, voi=
d *buf, int buflen,
+ 	if (cnt < 0)
+ 		return cnt;
+=20
+-	if (has_prp_trailer(buf, cnt))
++	if (!raw->hsr_port && has_prp_trailer(buf, cnt))
+ 		cnt -=3D PRP_TRAILER_LEN;
+=20
+-	if (raw->vlan) {
++	if (mode_is_hsr(raw->hsr_port)) {
++		struct hsr_hdr *hsr_hdr =3D (struct hsr_hdr *) ptr;
++		struct ptp_message *m =3D buf;
++		unsigned int hsr_size;
++
++		hsr_size =3D ntohs(hsr_hdr->pathid_and_LSDU_size) & 0xfff;
++		if (hsr_size !=3D cnt + 6) {
++			pr_notice("Dropping bad sized HSR packet (%d vs %d)", hsr_size, cnt);
++			return 0;
++		}
++
++		memcpy(&m->hsr_header, hsr_hdr, sizeof(struct hsr_hdr));
++		m->hsr_header_valid =3D 1;
++
++	} else if (mode_is_prp(raw->hsr_port)) {
++		struct prp_rct *prp_rct;
++		unsigned int prp_size;
++
++		/* We should have at least the PRP trailer plus a PTP header */
++		if (cnt < sizeof(struct prp_rct) + sizeof(struct ptp_header)) {
++			pr_notice("Dropping too small RPP packet (%d)", cnt);
++			return 0;
++		}
++
++		prp_rct =3D (struct prp_rct *)(buf + cnt - sizeof(struct prp_rct));
++		if (prp_rct->prp_suffix !=3D htons(ETH_P_PRP)) {
++			pr_notice("raw: PRP packet has bad magic value.");
++			return 0;
++		}
++
++		prp_size =3D ntohs(prp_rct->pathid_and_LSDU_size) & 0xfff;
++		if (prp_size !=3D cnt) {
++			pr_notice("raw: Dropping bad sized PRP packet (%d vs %d)", prp_size, c=
nt);
++			return 0;
++		}
++
++		cnt -=3D PRP_TRAILER_LEN;
++	} else if (raw->vlan) {
+ 		if (ETH_P_1588 =3D=3D ntohs(hdr->type)) {
+ 			pr_notice("raw: disabling VLAN mode");
+ 			raw->vlan =3D 0;
+@@ -445,14 +705,37 @@ static int raw_recv(struct transport *t, int fd, voi=
d *buf, int buflen,
+ 	return cnt;
+ }
+=20
++static unsigned int put_cmsg(struct msghdr *msg, unsigned int msg_off, in=
t ctrl_tot,
++			     int level, int type, int len, void *data)
++{
++	struct cmsghdr *cm;
++	int cmlen =3D CMSG_LEN(len);
++
++	if (msg->msg_controllen + cmlen >=3D ctrl_tot)
++		return 0;
++
++	cm =3D msg->msg_control + msg_off;
++	cm->cmsg_level =3D level;
++	cm->cmsg_type =3D type;
++	cm->cmsg_len =3D cmlen;
++
++	memcpy(CMSG_DATA(cm), data, cmlen - sizeof(*cm));
++	cmlen =3D CMSG_SPACE(len);
++	if (cmlen > ctrl_tot - msg_off)
++		cmlen =3D ctrl_tot - msg_off;
++
++	msg->msg_controllen +=3D cmlen;
++	return msg_off + cmlen;
++}
++
+ static int raw_send(struct transport *t, struct fdarray *fda,
+ 		    enum transport_event event, int peer, void *buf, int len,
+ 		    struct address *addr, struct hw_timestamp *hwts)
+ {
+ 	struct raw *raw =3D container_of(t, struct raw, t);
++	struct ptp_message *m =3D buf;
+ 	ssize_t cnt;
+ 	unsigned char pkt[1600], *ptr =3D buf;
+-	struct eth_hdr *hdr;
+ 	int fd =3D -1;
+=20
+ 	switch (event) {
+@@ -467,21 +750,65 @@ static int raw_send(struct transport *t, struct fdar=
ray *fda,
+ 		break;
+ 	}
+=20
+-	ptr -=3D sizeof(*hdr);
+-	len +=3D sizeof(*hdr);
++	if (mode_is_hsr(raw->hsr_port) && m->hsr_header_valid) {
++		struct hsr_hdr *hdr;
++		unsigned int pathid;
++		struct msghdr msg;
++		char control[256];
++		struct iovec iov =3D { ptr, len };
++		unsigned int hsr_option;
+=20
+-	if (!addr)
+-		addr =3D peer ? &raw->p2p_addr : &raw->ptp_addr;
++		ptr -=3D sizeof(*hdr);
++		len +=3D sizeof(*hdr);
+=20
+-	hdr =3D (struct eth_hdr *) ptr;
+-	addr_to_mac(&hdr->dst, addr);
+-	addr_to_mac(&hdr->src, &raw->src_addr);
++		hdr =3D (struct hsr_hdr *)ptr;
++		memcpy(hdr, &m->hsr_header, sizeof(struct hsr_hdr));
++
++		/*
++		 * The sender might have used a larger padding than neccessary.
++		 * Sending a smaller packet requires to update the HSR header.
++		 */
++		pathid =3D ntohs(hdr->pathid_and_LSDU_size) & ~0x0fff;
++		hdr->pathid_and_LSDU_size =3D htons((len - sizeof(struct eth_hdr)) | pa=
thid);
++
++		iov.iov_base =3D ptr;
++		iov.iov_len =3D len;
++
++		memset(control, 0, sizeof(control));
++		memset(&msg, 0, sizeof(msg));
++
++		msg.msg_iov =3D &iov;
++		msg.msg_iovlen =3D 1;
++		msg.msg_control =3D control;
++
++		hsr_option =3D PACKET_HSR_INFO_HAS_HDR;
++
++		put_cmsg(&msg, 0, sizeof(control), SOL_PACKET, PACKET_HSR_INFO,
++			 sizeof(hsr_option), &hsr_option);
+=20
+-	hdr->type =3D htons(ETH_P_1588);
++		cnt =3D sendmsg(fd, &msg, 0);
++		if (cnt < 1) {
++			return -errno;
++		}
++	} else {
++		struct eth_hdr *hdr;
++
++		ptr -=3D sizeof(*hdr);
++		len +=3D sizeof(*hdr);
++
++		if (!addr)
++			addr =3D peer ? &raw->p2p_addr : &raw->ptp_addr;
+=20
+-	cnt =3D send(fd, ptr, len, 0);
+-	if (cnt < 1) {
+-		return -errno;
++		hdr =3D (struct eth_hdr *) ptr;
++		addr_to_mac(&hdr->dst, addr);
++		addr_to_mac(&hdr->src, &raw->src_addr);
++
++		hdr->type =3D htons(ETH_P_1588);
++
++		cnt =3D send(fd, ptr, len, 0);
++		if (cnt < 1) {
++			return -errno;
++		}
+ 	}
+ 	/*
+ 	 * Get the time stamp right away.
+--=20
+2.34.1
+
diff --git a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0012-=
configs-Add-sample-configs-for-the-HSR-PRP-setup.patch b/meta-arago-distro/=
recipes-connectivity/linuxptp/linuxptp/0012-configs-Add-sample-configs-for-=
the-HSR-PRP-setup.patch
new file mode 100644
index 00000000..bc69cc9d
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0012-configs=
-Add-sample-configs-for-the-HSR-PRP-setup.patch
@@ -0,0 +1,167 @@
+From d97b8c6acd6b7711fe9273983222f5a8c2d3c61a Mon Sep 17 00:00:00 2001
+From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+Date: Thu, 2 Oct 2025 11:51:53 +0200
+Subject: [PATCH 12/14] configs: Add sample configs for the HSR/PRP setup
+
+This is a sample config for the HSR/PRP setup.
+
+Upstream-Status: Submitted [https://lists.nwtime.org/sympa/arc/linuxptp-de=
vel/2026-03/msg00022.html]
+Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
+---
+
+ configs/hsr-master.cfg | 30 ++++++++++++++++++++++++++++++
+ configs/hsr-slave.cfg  | 30 ++++++++++++++++++++++++++++++
+ configs/prp-master.cfg | 29 +++++++++++++++++++++++++++++
+ configs/prp-slave.cfg  | 29 +++++++++++++++++++++++++++++
+ 4 files changed, 118 insertions(+)
+ create mode 100644 configs/hsr-master.cfg
+ create mode 100644 configs/hsr-slave.cfg
+ create mode 100644 configs/prp-master.cfg
+ create mode 100644 configs/prp-slave.cfg
+
+diff --git a/configs/hsr-master.cfg b/configs/hsr-master.cfg
+new file mode 100644
+index 0000000..80b342e
+--- /dev/null
++++ b/configs/hsr-master.cfg
+@@ -0,0 +1,30 @@
++# HSR example. Two redundant ports, paired. The interfaces implement a HC
++# consisting of two TC and attached OC for internal synchronisation. Both
++# ports should use the same PTP-clock.
++# Can become master.
++# See the file, default.cfg, for the complete list of available options.
++
++[global]
++clientOnly 0
++priority1 127
++priority2 128
++logAnnounceInterval 0
++logSyncInterval 0
++path_trace_enabled 1
++tc_spanning_tree 1
++network_transport L2
++delay_mechanism P2P
++
++profileIdentity 00:0c:cd:01:01:01
++redundant_network hsr
++use_syslog    0
++verbose       1
++logging_level 6
++
++[eth1]
++redundant_device hsr0
++BMCA redundant_master
++
++[eth2]
++redundant_device hsr0
++BMCA redundant_master
+diff --git a/configs/hsr-slave.cfg b/configs/hsr-slave.cfg
+new file mode 100644
+index 0000000..31f9a33
+--- /dev/null
++++ b/configs/hsr-slave.cfg
+@@ -0,0 +1,30 @@
++# HSR example. Two redundant ports, paired. The interfaces implement a HC
++# consisting of two TC and attached OC for internal synchronisation. Both
++# ports should use the same PTP-clock.
++# Slave only mode.
++# See the file, default.cfg, for the complete list of available options.
++
++[global]
++clientOnly 1
++priority1 255
++priority2 255
++logAnnounceInterval 0
++logSyncInterval 0
++path_trace_enabled 1
++tc_spanning_tree 1
++network_transport L2
++delay_mechanism P2P
++
++profileIdentity 00:0c:cd:01:01:01
++redundant_network hsr
++use_syslog    0
++verbose       1
++logging_level 6
++
++[eth1]
++redundant_device hsr0
++BMCA redundant_master
++
++[eth2]
++redundant_device hsr0
++BMCA redundant_master
+diff --git a/configs/prp-master.cfg b/configs/prp-master.cfg
+new file mode 100644
+index 0000000..b719d6b
+--- /dev/null
++++ b/configs/prp-master.cfg
+@@ -0,0 +1,29 @@
++# PRP example. Two redundant ports, paired. The interfaces implement a OC=
.
++# Both ports should use the same PTP-clock.
++# Can become master.
++# See the file, default.cfg, for the complete list of available options.
++
++[global]
++clientOnly 0
++priority1 127
++priority2 128
++logAnnounceInterval 0
++logSyncInterval 0
++path_trace_enabled 1
++tc_spanning_tree 1
++network_transport L2
++delay_mechanism P2P
++
++profileIdentity 00:0c:cd:01:01:01
++redundant_network prp
++use_syslog    0
++verbose       1
++logging_level 6
++
++[eth1]
++redundant_device prp0
++BMCA redundant_master
++
++[eth2]
++redundant_device prp0
++BMCA redundant_master
+diff --git a/configs/prp-slave.cfg b/configs/prp-slave.cfg
+new file mode 100644
+index 0000000..3a6ee29
+--- /dev/null
++++ b/configs/prp-slave.cfg
+@@ -0,0 +1,29 @@
++# PRP example. Two redundant ports, paired. The interfaces implement a OC=
.
++# Both ports should use the same PTP-clock.
++# Slave only mode.
++# See the file, default.cfg, for the complete list of available options.
++
++[global]
++clientOnly 1
++priority1 255
++priority2 255
++logAnnounceInterval 0
++logSyncInterval 0
++path_trace_enabled 1
++tc_spanning_tree 1
++network_transport L2
++delay_mechanism P2P
++
++profileIdentity 00:0c:cd:01:01:01
++redundant_network prp
++use_syslog    0
++verbose       1
++logging_level 6
++
++[eth1]
++redundant_device prp0
++BMCA redundant_master
++
++[eth2]
++redundant_device prp0
++BMCA redundant_master
+--=20
+2.34.1
+
diff --git a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0013-=
clock-Add-port-details.patch b/meta-arago-distro/recipes-connectivity/linux=
ptp/linuxptp/0013-clock-Add-port-details.patch
new file mode 100644
index 00000000..3d249491
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0013-clock-A=
dd-port-details.patch
@@ -0,0 +1,62 @@
+From c53696be307c03a2002ff2239cf2a6442042e1de Mon Sep 17 00:00:00 2001
+From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+Date: Fri, 24 Oct 2025 10:04:33 +0200
+Subject: [PATCH 13/14] clock: Add port details.
+
+Add state of the port to the output. It helps to identify the port state
+if the transition message is no longer available. In HSR/PRP mode there
+is more than one port involved. The output may look like
+
+| ptp4l[265.598]: master offset      -1366 s2 freq   +7242 path delay     =
  413  1-SLAVE 2-PASSIVE_SLAVE
+
+Upstream-Status: Submitted [https://lists.nwtime.org/sympa/arc/linuxptp-de=
vel/2026-03/msg00025.html]
+Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
+---
+
+ clock.c | 21 +++++++++++++++++++--
+ 1 file changed, 19 insertions(+), 2 deletions(-)
+
+diff --git a/clock.c b/clock.c
+index af82f21..134e7d1 100644
+--- a/clock.c
++++ b/clock.c
+@@ -2091,6 +2091,22 @@ static int clock_synchronize_locked(struct clock *c=
, double adj)
+ 	return 0;
+ }
+=20
++static char *get_port_states(struct clock *c)
++{
++       static char buffer[128];
++       struct port *piter;
++       int len =3D 0;
++
++       LIST_FOREACH(piter, &c->ports, list) {
++               enum port_state ps =3D port_state(piter);
++
++               len +=3D snprintf(buffer + len, sizeof(buffer) - len,
++                               " %d-%s",
++                               port_number(piter), ps_str[ps]);
++       }
++       return buffer;
++}
++
+ enum servo_state clock_synchronize(struct clock *c, tmv_t ingress, tmv_t =
origin)
+ {
+ 	enum servo_state state =3D SERVO_UNLOCKED;
+@@ -2178,9 +2194,10 @@ enum servo_state clock_synchronize(struct clock *c,=
 tmv_t ingress, tmv_t origin)
+ 		clock_stats_update(&c->stats, tmv_dbl(c->master_offset), adj);
+ 	} else {
+ 		pr_info("master offset %10" PRId64 " s%d freq %+7.0f "
+-			"path delay %9" PRId64,
++			"path delay %9" PRId64 " %s",
+ 			tmv_to_nanoseconds(c->master_offset), state, adj,
+-			tmv_to_nanoseconds(c->path_delay));
++			tmv_to_nanoseconds(c->path_delay),
++			get_port_states(c));
+ 	}
+=20
+ 	clock_notify_event(c, NOTIFY_TIME_SYNC);
+--=20
+2.34.1
+
diff --git a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0014-=
configs-Change-p2p_dst_mac-to-avoid-IEEE-802.1-reser.patch b/meta-arago-dis=
tro/recipes-connectivity/linuxptp/linuxptp/0014-configs-Change-p2p_dst_mac-=
to-avoid-IEEE-802.1-reser.patch
new file mode 100644
index 00000000..cfd8efc8
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0014-configs=
-Change-p2p_dst_mac-to-avoid-IEEE-802.1-reser.patch
@@ -0,0 +1,71 @@
+From f054430bbd53d3720b228d78ac711c3f70c08e2e Mon Sep 17 00:00:00 2001
+From: MD Danish Anwar <danishanwar@ti.com>
+Date: Wed, 18 Feb 2026 15:45:27 +0530
+Subject: [PATCH 14/14] configs: Change p2p_dst_mac to avoid IEEE 802.1
+ reserved range
+
+The default p2p_dst_mac (01:80:C2:00:00:0E) is in the IEEE 802.1 reserved
+range which can cause issues with switches and HSR handling. Change it to
+01:1B:19:00:00:01 which is in the PTP multicast address range.
+
+Upstream-Status: Pending
+Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
+---
+
+ configs/hsr-master.cfg | 1 +
+ configs/hsr-slave.cfg  | 1 +
+ configs/prp-master.cfg | 1 +
+ configs/prp-slave.cfg  | 1 +
+ 4 files changed, 4 insertions(+)
+
+diff --git a/configs/hsr-master.cfg b/configs/hsr-master.cfg
+index 80b342e..98d310a 100644
+--- a/configs/hsr-master.cfg
++++ b/configs/hsr-master.cfg
+@@ -14,6 +14,7 @@ path_trace_enabled 1
+ tc_spanning_tree 1
+ network_transport L2
+ delay_mechanism P2P
++p2p_dst_mac 01:1B:19:00:00:01
+=20
+ profileIdentity 00:0c:cd:01:01:01
+ redundant_network hsr
+diff --git a/configs/hsr-slave.cfg b/configs/hsr-slave.cfg
+index 31f9a33..f906436 100644
+--- a/configs/hsr-slave.cfg
++++ b/configs/hsr-slave.cfg
+@@ -14,6 +14,7 @@ path_trace_enabled 1
+ tc_spanning_tree 1
+ network_transport L2
+ delay_mechanism P2P
++p2p_dst_mac 01:1B:19:00:00:01
+=20
+ profileIdentity 00:0c:cd:01:01:01
+ redundant_network hsr
+diff --git a/configs/prp-master.cfg b/configs/prp-master.cfg
+index b719d6b..9ffe759 100644
+--- a/configs/prp-master.cfg
++++ b/configs/prp-master.cfg
+@@ -13,6 +13,7 @@ path_trace_enabled 1
+ tc_spanning_tree 1
+ network_transport L2
+ delay_mechanism P2P
++p2p_dst_mac 01:1B:19:00:00:01
+=20
+ profileIdentity 00:0c:cd:01:01:01
+ redundant_network prp
+diff --git a/configs/prp-slave.cfg b/configs/prp-slave.cfg
+index 3a6ee29..b42c565 100644
+--- a/configs/prp-slave.cfg
++++ b/configs/prp-slave.cfg
+@@ -13,6 +13,7 @@ path_trace_enabled 1
+ tc_spanning_tree 1
+ network_transport L2
+ delay_mechanism P2P
++p2p_dst_mac 01:1B:19:00:00:01
+=20
+ profileIdentity 00:0c:cd:01:01:01
+ redundant_network prp
+--=20
+2.34.1
+
diff --git a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_%.bba=
ppend b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_%.bbappend
new file mode 100644
index 00000000..09958c5a
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_%.bbappend
@@ -0,0 +1,4 @@
+LINUXPTP_ARAGO =3D ""
+LINUXPTP_ARAGO:arago =3D "linuxptp-arago.inc"
+
+require ${LINUXPTP_ARAGO}

base-commit: 3230bc79957bd71775e0273ea1f4eab8d676123a
--=20
2.34.1


