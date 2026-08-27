Return-Path: <gehariprasath@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA313C61DB9
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 15:08:06 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38364.1787843279811015156
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 27 Aug 2026 08:08:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=VdTZGilk;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=cmPsjI/R;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: gehariprasath@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RF0Ynr3048228;
	Thu, 27 Aug 2026 10:07:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=VswUj/XKYiiWd
	WVP+TiT/ckTUKytFkCulrljYrwYC7k=; b=VdTZGilkOsfFKvQbJ2c1T6280cnZO
	2eJGY7/vIxjG5p4Ltw9yVb7Gl3Hsw0PKVzT2FN+nMIIlOwtPuJBrstmMLixLuo2O
	Pw2K4+G6VI7KDRZDwQfPRxeq3xSOjxMA7HzdaHH0LSOcsiCSoMWhQ053MB5rMjfJ
	gInAuKuOQF9a/ImvD6GoOBTW99ce6ejytdg5svxUNLAMGcUXH5ShD/YJnee8N1ef
	3Qg8ws7E7ITNyzJ+F3cScSx5/DjatdMQXQ7W733LoGzFLdsG0mN10qDEYWM7fphm
	JQI05VytyhMV0gi3/iYlqjQCri8fF8wCPq+/myNYz0C3/R+3oUhe8BRrA==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010000.outbound.protection.outlook.com [52.101.61.0])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gakag1ktj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 27 Aug 2026 10:07:57 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=stKG6INpRu7d/gPcuDoPPxnpRE5dJ29z20zE/0KvOavBA+p0lfzFhw0NyO7wiDOpIHz1McD3Rq5V8tcWiStDh9n8ZiA5pkrsonlnu/vrtJG5ncpK2xTrud9TMfmTdkTG+OtZudeUdbN3I900dw4KGddI2nBKrsZvkcoI1d2+WFig7ouuk0rGKhZL3Kar8k/ZcU1zyLfXHlCybF5JKzi/a9IZiZJ3Gldxarij4pHrN0vvPgQXOK85DFhNn8PJjRiqxZhfsPsM18x0YwpUFsOnq2ZaOW/BZDiOJ2pnxYiQZyiEjvMAwDFrnCY90tWQClFEglGroaTt2NxnzUzXEhPU/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VswUj/XKYiiWdWVP+TiT/ckTUKytFkCulrljYrwYC7k=;
 b=LuBejlJrg9Ze+cu/jrjH2QlaFDB5i6vVYJuCBc7iXwCc3pIvZzd2b0pUXrzDZxVnLvxXJVaoFTsL8bbHhxX1H+Ulj9q8z8j+tGd+p/ruGHFPkhZe9BG2aRnUBzUHgclrJOSrmKlkMSPzj/Mhk94F58Fu0pc2mFAUSZGoqv5JRsedt10lCSnlzTKTDS6zWNBe8HZQNxAHtCsGQQiuNNuW0Fl7xPzZwM6psQ6eTdrcd3UDoNIh0qCZjyfgWLzlZEehS78J9BvFkoS2s+HM3Wm/cn1Jyq1DrOL8j7zRT+EBXEFAQVt3ffNK+Cywdf5wRvbKsdlF1RW6TTcJXrZGZv/uqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VswUj/XKYiiWdWVP+TiT/ckTUKytFkCulrljYrwYC7k=;
 b=cmPsjI/RSrVwmOYtG3usupbRLNnm85Ckw67RnuRIlV6X7sTqpaUshmLSzv8W5g+ASN1ZOU58phj3GfvBrupNn+dcm6zTc9XeJnIs0ZT5UdCEVQSMN8+zZlHnbFA6fe4WAVUHnXl84UEeXNAwDLzbeLl0BXRljI72ukV4AOYvZ+M=
Received: from DM6PR21CA0026.namprd21.prod.outlook.com (2603:10b6:5:174::36)
 by SA1PR10MB5712.namprd10.prod.outlook.com (2603:10b6:806:23f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.8; Thu, 27 Aug
 2026 15:07:53 +0000
Received: from CY4PEPF0000E9D4.namprd03.prod.outlook.com
 (2603:10b6:5:174:cafe::2e) by DM6PR21CA0026.outlook.office365.com
 (2603:10b6:5:174::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8 via Frontend Transport; Thu, 27
 Aug 2026 15:07:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000E9D4.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Thu, 27 Aug 2026 15:07:53 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 27 Aug
 2026 10:07:24 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 27 Aug
 2026 10:07:24 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 27 Aug 2026 10:07:24 -0500
Received: from gehariprasath.dhcp.ti.com (gehariprasath.dhcp.ti.com [10.24.52.136])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67RF7MKb2074966;
	Thu, 27 Aug 2026 10:07:22 -0500
From: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
To: <reatmon@ti.com>
CC: <praneeth@ti.com>, <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>, <s-kapoor@ti.com>,
        <p-gupta5@ti.com>, <u-kumar1@ti.com>,
        Hari Prasath Gujulan Elango <gehariprasath@ti.com>
Subject: [meta-arago][scarthgap][PATCH] linux-libc-headers: add DMA_HEAP_IOCTL_EXPORT uapi patch
Date: Thu, 27 Aug 2026 20:37:19 +0530
Message-ID: <20260827150719.821469-1-gehariprasath@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D4:EE_|SA1PR10MB5712:EE_
X-MS-Office365-Filtering-Correlation-Id: 5303c356-c41e-4adf-2952-08df044cf7d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|23010399003|18002099003|5023799004|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	SV/LkLY80n7uZkOMsyeTE7kl8dvMhKPNamruuQYE9UIuKRlCHoQyQHQ67xJ4cOZa1PxFr2nf2wvqGunJeog+ssUcFvExaxPPGHjus4u3ggTfgYON0/9pshsKqixR6Dldmiv7zdZI8otuAk0ZnbPZvmk1ERstxODkY62+uGlvasocEtcYvWUDjOt9owf9DMdJV+EWtWkKcDWTy+3ut2gZir6dU+ilTUNbKVnTG2opELJHA4bmQb1vjKOAD2F8wK1k3Tqj5gyqEVS4IuefKUjijtq45jha09QuLRwTCX8HxkIFpozVPBTtUtwHvcZ5+TNewXoWUGTw4FM9bWEPvlSaMO/x4ANipe3gg/KuIz5iNEig/umrFUDdOutIcoA9PtqtN7KjNHTY3qW1dans2UveKRca75hZ21N9PDPJFNzPWJnsxq+/StxMKhOmhXLZGthOpf78tnwkkxRIurKfl1+WzKrb1taeiXQilIHnVFyj0nbs+d8ayUa3Eg8WIkcwMfN8m4YUXBJJovYTxQ3hi7qFB1/oDdHN2Xfi6wlKagIop80q9Nk6KKMakYnRT4FYPwNgRPKSgJAk+CokSFRmmR49wzSrtoS1rOm+8wPG3yK26mogMNJkc9DQUO8Dvu24uxrDJ0EERDvUk0nkGd9HUc4R2cqKNXRLvlIQc84y33hPf5iV4zGQ3Ltpu3vcj5EreOFANcqGqOoCBCJkv6KdDybjiQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(23010399003)(18002099003)(5023799004)(56012099006)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	XE5NFT9ZJ3kBC7OYnlSUuWPUrZGnwZEtbm3WMvjXf48k/ZWVh6j43ww+7nCq5pFpwJOKxvBuac6rxQDL2x+zggIVGmhQwh27PK0sgCm3U74Qy2yMlCtrKsbDQSPQrj1pvHlkPlLCBXIHbn7LlzPqsvTKoImu3IEy1zhhnDZtxYOdaS3DjMSfBrnvAhPw5ctMrx6hH9NoKEwDI6AsbH5Frn3hSR6JF+Wl7WSuiZNfOIKStxnb4GYos/U0ZnPou1o+D+n7Qzbaal+e8lOeCBvQ3Kfs+2OcviZmV8hdQj+UrdYrD5oSP8DxEnyRTCJz+aHHbSKH6Sv2Yhvqm5t1rvpIwxKQiEC7eoOCiUAHdE1ExoV95O7dNRXCGz4W2+jfBqiKPB3AqUQj3BEX1k3g81z5jpPKdHxDV4MWAPx9zhR6YDZsa47vVwsPQe7ytD1d+uUA
X-Exchange-RoutingPolicyChecked: 
	iFCKanRLIGGeePNyira0ODuf5PfJU3JFrt6x7oxE+ksp2hKIDNcTgV701XUXs3hlJ8F/7FOrvea1VlwiRMvLap2TPfLsnBzqVp5cQJwNcElN3kEZ8Y40kFj+qpK7wd6KaFWHm9NWs2/3hoUMPAlWKkO7ih2qwurZy4/4Mz52TH4EL92VyOFon8NYq6Dmm88RugdmQMuxKOPjBPiDIjycR+z2AVjay6+MwTEejB+NTXhEOX9W+PC+rzq1AHc1xnXL2PZdFsFPWPRT0D5FjIykt+WXoFYFdgMRdZjCOjw0J6COOigNekpHrOp0VeHQApqT6GupskWIukpayVgh8KRlrQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 15:07:53.1116
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5303c356-c41e-4adf-2952-08df044cf7d7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9D4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5712
X-Proofpoint-ORIG-GUID: Ibhx4oKo_RMmaFUttipcjisX2v3_TPly
X-Proofpoint-GUID: Ibhx4oKo_RMmaFUttipcjisX2v3_TPly
X-Authority-Analysis: v=2.4 cv=VrMTxe2n c=1 sm=1 tr=0 ts=6a9052cd cx=c_pps
 a=QHQ/c+VJRs0sJIezHEQ2hg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8
 a=cmk3cbLDabu0MS_V7sgA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDEyNyBTYWx0ZWRfX5OSJ/acmuU8C
 GLOP/s5e02tIQb1JnOa8nAkESHg6GEqR2sTMEzdoa9OBGCInhYrMpBCZvzQ0wqynaRJCXHEo9Xl
 Lc5SdbIbirOZSh9q+gvjQpC5fmgak0mCil2L2b1mUZ0yTyhV4jknufE2u0XDQDJ7/5kQKzpMVsi
 1Aqzt4McoeARD0usuFV4rfNEumYY8aAa40nyO26Jww4lgvcSqSsPcIEnspVB3qsxoo/9hHqUAVM
 6naSMeJvuy3tccamYDi4MHDPS4Ms5j1kbsm/9DXsIGLnjbaSAB13aBqq+NbUsxew2Rn34hWa5Cj
 G1HbjJzk4WiwjbetLS6dB7ZbNxXUtyFeNmrNY2pxwbOJbrLj6FC/QNQkP7ThvjPfcp3VgAlTqLY
 CS5SLMOV6HbCGz8v0UYBlL3bXmmWFXfKkg57SdK2Lv+14B6EfKFYPTbTIYH6qqcsq/ThRhzy5wo
 7DT9YOTOqhJl9mmYfpQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDEyNyBTYWx0ZWRfX9WGSsx0K+SZm
 ORGUUjYpiWItCtDuBtpNAJgGawxp1QOfhCydoC0BGK7pGpKXUn7Xc/FTqfT3tzPb6CfZtJH2rTT
 gFXzXF5tZtHot3ahbzKRkd8PxICTKCo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_06,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 clxscore=1011 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608270127
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 27 Aug 2026 15:08:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17607

Copy the TI vendor kernel dma-heap.h header, which has the
DMA_HEAP_IOCTL_EXPORT ioctl that the default linux-libc-headers
doesn't have.

Signed-off-by: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
---
 .../0001-dma-heap-add-export-ioctl.patch      | 58 +++++++++++++++++++
 .../linux-libc-headers_%.bbappend             | 10 ++++
 2 files changed, 68 insertions(+)
 create mode 100644 meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-dma-heap-add-export-ioctl.patch
 create mode 100644 meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_%.bbappend

diff --git a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-dma-heap-add-export-ioctl.patch b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-dma-heap-add-export-ioctl.patch
new file mode 100644
index 00000000..e96c9ff0
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-dma-heap-add-export-ioctl.patch
@@ -0,0 +1,58 @@
+From: Andrew Davis <afd@ti.com>
+Subject: [PATCH] dma-buf: heaps: expose DMA_HEAP_IOCTL_EXPORT uapi
+
+Mirrors ti-linux-kernel commit 8715cc31cfe8a191ade660ff787fedbadcb187d4
+("TI: HACK: dma-buf: heaps: Add Heap export from offset IOCTL"), limited
+to the include/uapi/linux/dma-heap.h hunk. The kernel already ships this
+ioctl; linux-libc-headers fetches its own independent pristine tarball
+and knows nothing about it, so userspace can't see the symbol without
+this patch.
+
+Upstream-Status: Inappropriate [TI kernel hack, not upstream]
+Signed-off-by: Andrew Davis <afd@ti.com>
+Signed-off-by: Udit Kumar <u-kumar1@ti.com>
+
+diff --git a/include/uapi/linux/dma-heap.h b/include/uapi/linux/dma-heap.h
+index a4cf716a49fa6..db749800b6c16 100644
+--- a/include/uapi/linux/dma-heap.h
++++ b/include/uapi/linux/dma-heap.h
+@@ -39,6 +39,25 @@ struct dma_heap_allocation_data {
+ 	__u64 heap_flags;
+ };
+
++/**
++ * struct dma_heap_export_data - metadata passed from userspace for export
++ * @offset:		offset from heap base
++ * @len:		size of the allocation
++ * @fd:			will be populated with a fd which provides the
++ *			handle to the allocated dma-buf
++ * @fd_flags:		file descriptor flags used when allocating
++ * @heap_flags:		flags passed to heap
++ *
++ * Provided by userspace as an argument to the ioctl
++ */
++struct dma_heap_export_data {
++	__u64 offset;
++	__u64 len;
++	__u32 fd;
++	__u32 fd_flags;
++	__u64 heap_flags;
++};
++
+ #define DMA_HEAP_IOC_MAGIC		'H'
+
+ /**
+@@ -50,4 +69,13 @@ struct dma_heap_allocation_data {
+ #define DMA_HEAP_IOCTL_ALLOC	_IOWR(DMA_HEAP_IOC_MAGIC, 0x0,\
+ 				      struct dma_heap_allocation_data)
+
++/**
++ * DOC: DMA_HEAP_IOCTL_EXPORT - allocate memory at offset
++ *
++ * Takes a dma_heap_export_data struct and returns it with the fd field
++ * populated with the dmabuf handle of the export.
++ */
++#define DMA_HEAP_IOCTL_EXPORT	_IOWR(DMA_HEAP_IOC_MAGIC, 0x1,\
++				      struct dma_heap_export_data)
++
+ #endif /* _UAPI_LINUX_DMABUF_POOL_H */
diff --git a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_%.bbappend b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_%.bbappend
new file mode 100644
index 00000000..7f0345ab
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_%.bbappend
@@ -0,0 +1,10 @@
+# linux-libc-headers fetches its own pristine kernel.org tarball, independent
+# of ti-linux-kernel, so it doesn't see TI's out-of-tree dma-heap ioctl even
+# though the running kernel already has it. This carries a minimal, purely
+# additive patch (no existing symbols touched) so that ioctl is visible to
+# userspace via /usr/include/linux/dma-heap.h without re-sourcing the whole
+# recipe from our kernel tree.
+
+FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"
+
+SRC_URI += "file://0001-dma-heap-add-export-ioctl.patch"
-- 
2.34.1


