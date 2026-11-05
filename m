Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5725.1793911068828892095
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Nov 2026 12:37:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=dMMDkF6i;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=Jx96MF6W;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: afd@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6A5HghBw1414091;
	Thu, 5 Nov 2026 14:37:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=3c2YUZFyA8byzBl6juTnfMRQY9piK37w5xaHNWhRb
	vY=; b=dMMDkF6iOGxJfbsgKrnw+fA2n1iUV5RjoYVxcg88nFxNZofBVwdjSpbLz
	q+KACR/f+4TEYGOt7vVnrXpRUOtAFx3omOFBiXpeShuRs/VDbBpyFnCzx5ZYWzQk
	VuZ1vzqZ5xbqhfeFQrQeuEApsHvtr9vlzBfIt1U380zuL9ByVHYIcGedKbNf5UFu
	tvAPCOVyJy/2lGvo+mwMnntPKfHXQCX0Kus1dMEDNgEccMDXn5z1TFCeosc/VB3h
	iNrr/PwPrBckrArZ/Ro2fMKuNLkJz3LHPByz3BhttwcSPKzLgoVv776TKXhK9dWm
	H3Rl1bYXiEeIW1ikVUpQ7nAEApAuw==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012003.outbound.protection.outlook.com [52.101.43.3])
	by m0380145.ppops.net (PPS) with ESMTPS id 4hrq6tm1tt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 14:37:47 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gdNKh8a+/6p7bTSrd3yu/VelAgwPvn7qYpoWhW5vGKgdxzj766Nj/mZA88YzBMWM+u3YhrQEt/SjoVREuI1QBUDekq1K9iGJLxFFAAF+tpHHQ6rvJGgknA6gYVRlKQ/bh5phgkmWDIGUJx3eJfZXusZPAXjaE0+PPTHHgnXxsGDQohiV1ejBmSlD+SwSX5UbA28UBUW1LunnA2NIb2MpCQpHW4eNfrbY6wofKDY+jLdhlIvlQ5QbB7XlQWOJeg3bLpvxwR+ww8kqm/1HAh4PcXjcereT2Z+LUSYHh0K12ryW8/0AI7AOBZSfJkG7kyoykDV0Yz7nfz/auKWXYtDy8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3c2YUZFyA8byzBl6juTnfMRQY9piK37w5xaHNWhRbvY=;
 b=FkFkrAL9JqMLY2KAJ0s+4UMnw/dPOzxI997Zk7ecuxt1SATy+s5hJ3zWjoDb43/jJTLlEQR290hw/Hjtg3jH3/3pnrDMDSnXdiocs7DzCpfLXvsVNkiz7p5eBPMhhWLDiJBqq48FzW5rmUJ+3KGaaekbkTu/W8mJBzivoLovxRerTjXXlhbTfRJZ4CbXnLABqRZhbWahMDsJolGHjsQMaHH2gdJK88mhsGEpUQv0CtemXjVwjx7UqO7hAFXIPTC4FwEO9iwcTwU226OpBOZ0lnYYKk9ZLKqqY46z5iNazXXYPHet6BpxjZOAca9Hc+QFXQuQmJ3pq3VV0V081x+svg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3c2YUZFyA8byzBl6juTnfMRQY9piK37w5xaHNWhRbvY=;
 b=Jx96MF6W+Z/Xvk3lBgp5r2QhfdFT9/55PWc2XzFWmFGb11CbvMSlxz12LqG+dATyM0NYNGzRL8bXnqkoVgdhr68yaNNL2faXuWpA0GK8/7zHUVTcOJa1cxM4pZ2mx/N3wQPbAQA6sQG07FqXCNpw2fggoG3QZQkKy1M8yyMDdJk=
Received: from MW4PR04CA0121.namprd04.prod.outlook.com (2603:10b6:303:84::6)
 by IA1PR10MB396264.namprd10.prod.outlook.com (2603:10b6:208:5a0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 20:37:44 +0000
Received: from MW1PEPF0001888E.namprd03.prod.outlook.com
 (2603:10b6:303:84:cafe::43) by MW4PR04CA0121.outlook.office365.com
 (2603:10b6:303:84::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 20:37:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MW1PEPF0001888E.mail.protection.outlook.com (10.167.249.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 5 Nov 2026 20:37:43 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 14:37:27 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 14:37:27 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 5 Nov 2026 14:37:27 -0600
Received: from ula0226330.lan ([10.249.37.218])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6A5KbQgo828660;
	Thu, 5 Nov 2026 14:37:27 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Randolph Sapp <rs@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH 2/2] libdrm: Remove ltp-ddt test harness workaround
Date: Thu, 5 Nov 2026 14:37:26 -0600
Message-ID: <20261105203726.1306888-2-afd@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105203726.1306888-1-afd@ti.com>
References: <20261105203726.1306888-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001888E:EE_|IA1PR10MB396264:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e602d2f-b3f3-45b6-9848-08df3b7ca494
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|1800799024|23010399003|36860700016|18002099003|22082099003|261009223027099003|261026121527099003|261022075727099003|261021123027099003|261028144727099003|261022105027099003|261021121427099003|261026140227099003|10067099003|56012099006|261102123227099003;
X-Microsoft-Antispam-Message-Info: p2pbtqBwvyvpDlV70bFaPvJq0gJo0aEENRXbgiOlelIx7U/XTAoadF4XJciaoc/0cwnctqaF+yKzA/OXjLHdFcsvd3Q7vPGuIRMuMNjxzHQoc44Jvv3s4aELBzTtQ5ofJd+GTQUkTho5gkxNm4Qyz0LXpnk7XfYpXUXIyZEOnDqZTmZJ3YiREQkQCDo7ujIwxzaOQpBbq9uuEwKZLOvu4CBZKgynKTSuBRyM7RD798fuBEnqcZvVrO7mQQe8UXcZL6ZyWm7Nn6e5pFOqPxOqmYnhtrgJMaJDZ12BH0IiMpFzhulOn6nHOfZoCTuayw14MnkHz8RVgRd9nWmfw+cM++3UDlmW59DA8WChA1AYgFfdAjcPkA4Aye/acr5n5gs0B1MKTFwRF5fr6lnvkntKwaAJI2lj8v5bgo0AYop7AUtdEMPhCRO9ovmQwtHAX0nwAJy486Do3jm8c9h3btDWdFXngb6XEl5Bz7h0HNAvUf1exAl7jmMxbd+hgw4BZc5hSEH8HtrcJikJF9yNHlk57oe7EbyA/tBg5TkAkSlQcYx3TdJQ8LM56LFsEEzjlZY1by1tBMSM3/CohBO48isp7v+Vtse9YzOWws/XdkO80LBhtux0jskLv4xMaI60WJ3VvE/SBfjN4oLHsjxrwfgWmFgrIHi81B5Lklfj/8+NcDRRxs7OO5a4NQhZ/PgK6iJiCCU9p/DPYotI7k2sG37Qvg==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(23010399003)(36860700016)(18002099003)(22082099003)(261009223027099003)(261026121527099003)(261022075727099003)(261021123027099003)(261028144727099003)(261022105027099003)(261021121427099003)(261026140227099003)(10067099003)(56012099006)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: /GbczqY0O6RbGOjueOUbuq2/cIeg0WsZHHZ0GLsrHISKb1VqAStlgVvun/pcKGlckH0noYkfUE0GIld2KrmdJrPDkc3kKRoEEUDCUHxF3qombzEa9yUDBHGx75RqOuvDnTv0djH5HTve+l2OISgBHFEmeyvBfrwfMzNd2faa0wueNZOef2/XXsAJMEwU9JOn9hGN2Er5OVVKHW9xiFGECgTrJc6U0hs/E0CgVcTlBxOH1bsLdF8EAiqINGmy+0pI7PuAeIeHiU7oH8iv+Wd9BaZ2QXNDS0sY3nLLmF62IJA5Lx6cSKJHzgON3L6/GojYdaHi6jqjwV1PS3jsWVWARbRnz78pRksMctQ4d0t+nszolo8L0ZdJ5/BgTSmQCodVrpI2+QN1k8eUo/58d5zA7hnmEXgW/H3GBaBprpHaOrBfZOoWnZ/XY4Kwt3GTGRae
X-Exchange-RoutingPolicyChecked: A5JtfyQOlvEbscznWJUP7V8y6yQGyGtRgWxZIDk4YeQNzoH//Pi8uWFvcTH4q6aImqwMwmTK1ofAUUyBxJn7R1kJK3JdLa4+mFdqPFKK+53C0SERYy67/nPWR7H3A0gRgFaHx59sJyYvxACXkHs7XeydbmHAxPRu0GYp6C0gxRUq6NrlxjbLqx0cUGxaa+QV+uLtoYCuXLI0/rpl4srBxZ7t/Kcvx+FQnkjz1uEbG5v78qTRiCACPy29wk4P/AyovCyDjmXp8Y7i02McSxT3YS1D2j9usmZ2ADVWYTeB8A2RP0lEMFAY7iNX/5+YkY0PlkefXgNkNHWd6IMiUIM2ag==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 20:37:43.1704
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e602d2f-b3f3-45b6-9848-08df3b7ca494
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MW1PEPF0001888E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB396264
X-Proofpoint-GUID: 9BNekWjKHgmjNlOLxy5GwfdVY8VRTtjw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4MSBTYWx0ZWRfXy7T8yTw+EHGP
 NZFbnifB2Yb3LnnZvrj3Jc7d9fqHTkD2Q9G6PKX4gJ2VBN7skF5iEccEM2tUzT4O8xZL9pp/Wek
 zxFIxGtHL3B1mN55ak9DVq9VNjo2Lic=
X-Proofpoint-ORIG-GUID: 9BNekWjKHgmjNlOLxy5GwfdVY8VRTtjw
X-Authority-Analysis: v=2.4 cv=Q6xHcI2a c=1 sm=1 tr=0 ts=6aece91b cx=c_pps
 a=ayBBURk7jZ4GzqZFlR2IhQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=0gcC27t9AAAA:8 a=U7h9TOUEC-U1Gz_-LxQA:9
 a=f5sM90hAhNS9OGT-JDKn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4MSBTYWx0ZWRfX03duu7VZ+15x
 AEvgzgQO8ieuktdTkd5tSj3Z8cYuhMZG21J31XOUscgjQ2ymjQSRSuMkbp8HKiubVPvbLFSiTgd
 V6epBZtdE7iQlvCewAEGt4Cofdp+EMkRwU7UUrAEBtxyGXFBXBJaLZXvNBsYU5kcTzyu6K57lUW
 lbgy0XtOOcor35qfjD3NH8vEmFHlClIVz5+4vJ99lUwE+qDkUQrfUjMjV4IL73jHDSbDblwcavF
 7Soomdc/VbOtniQEdYwhbgaYTEO2DCjZ6ku1f6MgMfAlKaKTbnKrmma+dmJIyfNk0uDdJzbT2iG
 4H/llGqiRibSB+iqIT06jyXTACW+kTsS7jkA4+nzcNNERnykgO+emJRlqhf8h7T1hPspM/DV7S3
 OEsVzgtaQOWpASA982DhUtkRrTFRWwRwoF/5rSZqsgG4XE43wlxY+lWiIFIVXVJDlBoFy/Zt6TT
 Gzygm1YJZLpBMozorXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050081
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arago@lists.yoctoproject.org>; Thu, 05 Nov 2026 20:37:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17765
Content-Type: text/plain; charset="utf-8"

Modetest exits on stdin input. ltp-ddt sends data to stdin when a test
is run, so a workaround was added to modetest. Instead the test harness
should be fixed. If it has not been or cannot be fixed, then this patch
should be worked upstream and carried in meta-ti-test until then, not
here in the distro layer.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-graphics/drm/libdrm-arago.inc     |  7 --
 ...dd-option-to-run-a-test-indefinitely.patch | 77 -------------------
 .../recipes-graphics/drm/libdrm_%.bbappend    |  4 -
 3 files changed, 88 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-graphics/drm/libdrm-arago.inc
 delete mode 100644 meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-to-run-a-test-indefinitely.patch
 delete mode 100644 meta-arago-distro/recipes-graphics/drm/libdrm_%.bbappend

diff --git a/meta-arago-distro/recipes-graphics/drm/libdrm-arago.inc b/meta-arago-distro/recipes-graphics/drm/libdrm-arago.inc
deleted file mode 100644
index 6703fd1d..00000000
--- a/meta-arago-distro/recipes-graphics/drm/libdrm-arago.inc
+++ /dev/null
@@ -1,7 +0,0 @@
-FILESEXTRAPATHS:prepend := "${THISDIR}/libdrm:"
-
-SRC_URI += " \
-file://0001-Add-option-to-run-a-test-indefinitely.patch \
-"
-
-PR:append = ".arago4"
diff --git a/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-to-run-a-test-indefinitely.patch b/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-to-run-a-test-indefinitely.patch
deleted file mode 100644
index 5b051361..00000000
--- a/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-to-run-a-test-indefinitely.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From 115aa882abeb6db92c7588f3fb0953593fa2f634 Mon Sep 17 00:00:00 2001
-From: Alejandro Hernandez <ajhernandez@ti.com>
-Date: Tue, 3 Mar 2020 09:52:06 -0500
-Subject: [PATCH] Add option to run a test indefinitely
-
-This patch adds option -t to the modetest cli. When this option is
-speficied modetest will not stop on stdin input. This patch
-allows using modetest within ltp-ddt, before this patch modetest
-was not able to run in ltp-ddt because ltp-ddt sends data to stdin
-when a test is run
-
-Upstream-Status: Pending
-
-Signed-off-by: Alejandro Hernandez <ajhernandez@ti.com>
-Signed-off-by: Denys Dmytriyenko <denis@denix.org>
----
- tests/modetest/modetest.c | 12 ++++++++----
- 1 file changed, 8 insertions(+), 4 deletions(-)
-
-diff --git a/tests/modetest/modetest.c b/tests/modetest/modetest.c
-index d9e761e..687f7a4 100644
---- a/tests/modetest/modetest.c
-+++ b/tests/modetest/modetest.c
-@@ -1888,7 +1888,7 @@ static void clear_cursors(struct device *dev)
- 		bo_destroy(dev->mode.cursor_bo);
- }
- 
--static void test_page_flip(struct device *dev, struct pipe_arg *pipes, unsigned int count)
-+static void test_page_flip(struct device *dev, struct pipe_arg *pipes, unsigned int count, int dont_stop)
- {
- 	unsigned int other_fb_id;
- 	struct bo *other_bo;
-@@ -1946,7 +1946,7 @@ static void test_page_flip(struct device *dev, struct pipe_arg *pipes, unsigned
- 		fd_set fds;
- 
- 		FD_ZERO(&fds);
--		FD_SET(0, &fds);
-+		if (!dont_stop) FD_SET(0, &fds);
- 		FD_SET(dev->fd, &fds);
- 		ret = select(dev->fd + 1, &fds, NULL, NULL, &timeout);
- 
-@@ -2194,7 +2194,7 @@ static void usage(char *name)
- 	exit(0);
- }
- 
--static char optstr[] = "acdD:efF:M:P:ps:Cvrw:o:S:";
-+static char optstr[] = "acdD:efF:M:P:ps:Cvrw:o:S:t";
- 
- int main(int argc, char **argv)
- {
-@@ -2208,6 +2208,7 @@ int main(int argc, char **argv)
- 	char *module = NULL;
- 	unsigned int i;
- 	unsigned int count = 0, plane_count = 0;
-+	int dont_stop = 0;
- 	unsigned int prop_count = 0;
- 	struct pipe_arg *pipe_args = NULL;
- 	struct plane_arg *plane_args = NULL;
-@@ -2314,6 +2315,9 @@ int main(int argc, char **argv)
- 
- 			prop_count++;
- 			break;
-+		case 't':
-+			dont_stop = 1;
-+			break;
- 		default:
- 			usage(argv[0]);
- 			break;
-@@ -2464,7 +2468,7 @@ int main(int argc, char **argv)
- 				set_cursors(&dev, pipe_args, count);
- 
- 			if (test_vsync)
--				test_page_flip(&dev, pipe_args, count);
-+				test_page_flip(&dev, pipe_args, count, dont_stop);
- 
- 			if (drop_master)
- 				drmDropMaster(dev.fd);
diff --git a/meta-arago-distro/recipes-graphics/drm/libdrm_%.bbappend b/meta-arago-distro/recipes-graphics/drm/libdrm_%.bbappend
deleted file mode 100644
index 7a9bed64..00000000
--- a/meta-arago-distro/recipes-graphics/drm/libdrm_%.bbappend
+++ /dev/null
@@ -1,4 +0,0 @@
-LIBDRM_ARAGO = ""
-LIBDRM_ARAGO:arago = "libdrm-arago.inc"
-
-require ${LIBDRM_ARAGO}
-- 
2.43.0

