Return-Path: <gehariprasath@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74C0FC61DC6
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 08:10:04 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1574.1787904598655932252
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 28 Aug 2026 01:09:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=UqHW8lYm;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=mZgdmaix;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: gehariprasath@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S65HXs569238;
	Fri, 28 Aug 2026 03:09:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=4AWEXDqUnDJc8
	VO0WK1alV2rfNtL5Wbr6JbEzCDeWNc=; b=UqHW8lYmTiS9bs5o9M6ObE8/0wKaF
	+UDvvDDxmGq9LkarLPnK4qluq5jo3YJaa97XGegYpz9m8aA4OCizlu45DvrZ7nDw
	Vuwn0liC8FsIvq9yIdUL2qn5SHkz/FKKK2GUKDuKAqeFSwZiMuSLzwSY9p7JPTbY
	MV+tI50TuikL5ZoB3GtiATAX+wnGtUO/fARjgyy5VAYkAOnwZVKGJDLALmPtQt9F
	xjUZ7s4WHxAZawLlCW/81H4v3OHkMlNIR9EaxjwtrEsgLkOHfH5FgGZH3vor3YyH
	mot3hkGwF65+BKL/wv1tYykfWR1CJu3qDWbZXMuoj23maC3LxaRT2e3Og==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010068.outbound.protection.outlook.com [40.93.198.68])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gb24r1ck7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 28 Aug 2026 03:09:57 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TCkzGmCzajnDhSMv7XWtFtARUFwBfrsYmau2IXP7f8UX6Yb2E/ETQa/2Don7UKJzC0ukjSNO/GsJmDbjtlJ4cygDCe1qCpZNEv2E+ndtn2evmSTwdBiZA9O2Npy5xDAyuauNnlSPjQExtR3ocE084jx0XYMzEmzaJJsX7cXb1LxIsGM6IvvylEgnsES5UOJDEsi+98br7HTYkMgMnYzvJsGnggc58Mvi6GK9DzXan22kakZiq1dKfGU3l+CwQCVtcS7InIXGFmE2CeMu2ozBjY1TZZjPWM58iVDlzm1GWxr2jokz4Hpm7A2pttkR94hQ1M/Y7K8wFKQQKHFmfDKatw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4AWEXDqUnDJc8VO0WK1alV2rfNtL5Wbr6JbEzCDeWNc=;
 b=QgUXpi99kx0QbRIbZYcpUxUCDeG3T+LbYGugjrAEIvGU23xcsPZHOwe+mmEzfErUCI+OUpnpJP+JaXCAfZtOCEi2i39J1/Ya7R0lfPi05m22zegGy60gtnQoEVtQ1fd5ATRuaVQuev565r0E1ERktJqEjICCiRNaCCitHdXXLh+a/F4tZwJlTGbibVIoymhf62oqNAt5oPydL/PiESVzpamepA/nBERoNNJov7BXFM5o0rygvgrz58KB1l3i4n2dnRMdWMxwAu4aDAy2HS5/jupUBSVL9CVemPrTahqj6wDdffhK1noFlg6VNBgRHmowp2rBz3a3ST+G/5YLUnDKxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4AWEXDqUnDJc8VO0WK1alV2rfNtL5Wbr6JbEzCDeWNc=;
 b=mZgdmaix3NewqbgF/y6BzyyrbcxmMeVq/mS+ZRDQpk6petBRs6uyqldlWwAmuazN7W2FG4cs6ziSHGOwj8sOElJFGS4XENp3M2pEr5+rySdGhCOt3lquYGXS8/VElp5gcC7g5jPkDCm7PkIs+xAZnM2+3mbRF4c+1iGr0UDMDEo=
Received: from BN9PR03CA0576.namprd03.prod.outlook.com (2603:10b6:408:10d::11)
 by PH8PR10MB997904.namprd10.prod.outlook.com (2603:10b6:510:3d7::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.8; Fri, 28 Aug
 2026 08:09:54 +0000
Received: from LV8PEPF00000068.namprd03.prod.outlook.com
 (2603:10b6:408:10d:cafe::a9) by BN9PR03CA0576.outlook.office365.com
 (2603:10b6:408:10d::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.11 via Frontend Transport; Fri,
 28 Aug 2026 08:09:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 LV8PEPF00000068.mail.protection.outlook.com (10.167.248.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 28 Aug 2026 08:09:54 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 03:09:31 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 03:09:30 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 28 Aug 2026 03:09:30 -0500
Received: from gehariprasath.dhcp.ti.com (gehariprasath.dhcp.ti.com [10.24.52.136])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67S89S402424862;
	Fri, 28 Aug 2026 03:09:28 -0500
From: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
To: <reatmon@ti.com>, <afd@ti.com>
CC: <praneeth@ti.com>, <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>, <s-kapoor@ti.com>,
        <p-gupta5@ti.com>, <u-kumar1@ti.com>,
        Hari Prasath Gujulan Elango <gehariprasath@ti.com>
Subject: [meta-arago][scarthgap][PATCH] tisdk-default-image: add ti-vendor-kernel-headers-dev to DEVTOOLS
Date: Fri, 28 Aug 2026 13:39:18 +0530
Message-ID: <20260828080918.1161144-1-gehariprasath@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF00000068:EE_|PH8PR10MB997904:EE_
X-MS-Office365-Filtering-Correlation-Id: db319c8e-eacb-4e82-f1a6-08df04dbbe4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|10067099003|6133799003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	YjA0MgBn+zHvblDlFx2b32XlP7392HEaYmB1/iUDBiIi1VoqVEdcDLZKbLoQWr8UENR0xk0bxkdpYQKgxBz6QduQWOcur/jGQk4cDoCyvLS8ASo5IBXevcXEJQUVEGeuAMcvBajTfFoyleEQAypk+FgV7ZTK9c0dEbCv/Mmp3Cnnu0DdGniNCKcsgkWC7nHW1MEcUGy8sCIkHv6Gk1in++R84WNmVVaPiQ0wlWB8KVMNu0blhOo0a71TtBa275k+msxImIjCHjZGham8lkGKaVT2eZ+uTtFxxh8q3SNOMGoaBNjicOeksvHx9UwKuy6PVGGPcpWXw5Aq391HOGgR2T4keNEK9apx726PlzFP+13lHiBPfLhi0cWi1l/E2roR9Gl1GuiiBM6p849IC8tVGOGxNJTTflfXEto+EUryXhrJEcL+QL7XniHOL0JQgpS/Vb4a6ec/dTi/AIEeTIlo6DChxfbQgi5nLN7UM3T66fhC00OuXqFDHDnZe/lLdt8MYCJTlHIy4PJt/PT6T9XRFAY6bNiXAogPpGIH61NF0tzZvaCljc3sBG45i3CPRgKcQtbT0fCIIGNe79Gblx0xWvovz0TgyrjpZ4jTgJpjqWCLAb9FCD6p2Th+qYP6MstNthPrkOMJDjqRI1Ha0WGDLZ876YHv+XsFCXUFKf0EE98XR+8sHtC++KE7RoblibNUcFO7nK6GwJNjSqQRufVv9Q==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(10067099003)(6133799003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	rnINa7Z4GQRzf4tHfR9jNa7Vz4BekYbpJ4raBXYVNxxHrzNrHQ8LKyvkpx2/g7x30Y/dehbUDdQkxjZfQRwsS8QfTyqLi1b9i09zuIuPBmN3UBZ8JC8nSDtkkn0KCYuCTeisSR3hszTnKsUk9BHCGYPP/xLKLfBLLiY93VwPubYtbI9VLPF/HgldIxYX0nSloA9QzJqFvpMFMDbN+RwNc8mqmwFYiBVCX+D4b5rPCyt/mjRtcPaGYyPwfs1peguoYd6R/6NHoh3MtR3v7RBusimCNrWf7qgBSFTyKU/dnBFBortDVnydZkVbWydWax3/neQZeNi9ji0u6EkvfMXwTYAYW1n9pa9o8g/Pa5p/fIAaLGO4RYxizWznyXak9MO2EYYvB5p+8ARJQH8tv4HT6/xuZQUtNuGUXMH1v7GMLzr0Dj18/9NTtwXIrf4yP4wR
X-Exchange-RoutingPolicyChecked: 
	jH4GfGM6S3AWcmTj/4sJDM6fjQ37UK3XVT+wcU0xur+GFBBnwUQA0/x/NnlDucPo2S8cpSAbKYD256EyMpjcq91QwwVuGHFAmgKbLNVNGtzutsIgPheG27a4eOgsuvIYeFDpLTDwfC4aRn12k+i9JBny/W0WApRZc4Yad1yNjn2czrgUxF05b+cSTHv61dUWh5LcXUhLyzgAxkCBrc19vVaeEh3LRvedrmYgCdhoVM/cs6msQYSnBH00BszTtDEPeqdbisBwb+p1CqYy/6+5s/87hb9hGJfP1wVwsEkqD5QbDvbgOnW/spO/sfH8suJ2Z4rkm3uch+XTi31dKgcc4Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 08:09:54.5880
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db319c8e-eacb-4e82-f1a6-08df04dbbe4d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	LV8PEPF00000068.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB997904
X-Proofpoint-GUID: VeEMy9z_0g-lAgLmAlk7tm1KFFxxrzZ9
X-Proofpoint-ORIG-GUID: VeEMy9z_0g-lAgLmAlk7tm1KFFxxrzZ9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA2OSBTYWx0ZWRfX1u3KEKZjxFX2
 lj2+3fQLaPaU6rsfoaVHiJbU00FyOsMRiC26RaISfgRzP5DwXiOekgt7btu42gj5ZY7aXlaYCb1
 zGgi2s7r7iCOSu23OEyrZiqGNIzf/J/e4Y7Q/kgzgzqT3ArGxFR3phhTn4G6kyNRlRNSI5KAbg2
 PNjNsO16h8WynTTZSibKBZJYyK1viqRMspxoGIexhu9loutTpo2V+8cT3npfzbg5CV1sRfMWsiv
 HlHZNtPU7GKdJERYEQl1zBz2iS34GUs+MA7LJXQpnkcZYS9aeisInp4THBTegOJjOSkIoT9v9EF
 ZKmWuDTorQIGolrYF0rjr2BBYQkjCHw5gmgEAcFPZUrwq+/pi5MAUK782qKiKdcqyOrcgYiRmlZ
 dGsCZEAmfqtT17H55UhsA/k0DhqcyAw+RJ5GpZ9kuVzb0WRSQESd5uCaxS0HScxulec1ZVA/X/y
 VhhL96Q9giuYLTfRMXA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA2OSBTYWx0ZWRfXzREZT35eC2su
 8iFv2tinqjjBJQ1W4RcxOZU92tLk7zQ5LtZT1gb1EAIc835Ifbx+ARvBkF3nLAw7oS4cgDRRjnU
 Rsx9x4UgW5LpuLjU8F7Ets05OWaOrgw=
X-Authority-Analysis: v=2.4 cv=L6gtheT8 c=1 sm=1 tr=0 ts=6a914255 cx=c_pps
 a=48c6PaPq82/B1OY+thwv9A==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=iesYxoW1svnkQyt5-KEA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280069
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 28 Aug 2026 08:10:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17618

TI vendor kernel uapi additions (e.g. DMA_HEAP_IOCTL_EXPORT) isn't
present in the standard header provided by the linux-libc-headers,
so on-target compilation against them needs the ti-vendor-kernel-headers-dev
package alongside linux-libc-headers-dev.

Signed-off-by: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
---
 meta-arago-distro/recipes-core/images/tisdk-default-image.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
index 264d1b2d..cac6628e 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
@@ -36,6 +36,7 @@ IMAGE_FSTYPES:remove:omapl138 = "ubifs ubi"
 
 DEVTOOLS = " \
     linux-libc-headers-dev \
+    ti-vendor-kernel-headers-dev \
     build-essential \
     packagegroup-core-tools-debug \
     git \
-- 
2.34.1


