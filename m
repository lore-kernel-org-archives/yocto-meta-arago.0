Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5216.1793782991560718853
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 04 Nov 2026 01:03:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=PIktlxX/;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=j8o5aGbt;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: y-hegde@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6A48IuIp1694611
	for <meta-arago@lists.yoctoproject.org>; Wed, 4 Nov 2026 03:03:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=IStTm4WhszTjC
	kPs5QD0mBU5MvnUIgnry1VF0bNFDs0=; b=PIktlxX/T2FX3HZTpQsZIycQf6uZL
	axyuSCbFiXh/Gs6ZN2RVJHVPEISh0uWomHlr9CYmw3qJSVQtqg1e4u52iBgX8boZ
	Vy4wsi5TJjKpK6Ngdxwi6ht6kn7C+fz12tS8yCC++g7NAPK8aB49S5w1FW7H84d9
	3qCAT68SPKv8yP39OHoX4t1ruSxv2xKPKkp8LFixeobC8oVS0szIO2m40w6I0bmG
	6sLKIuuU0ced/VpIzc8rjU4LbN9/RxrS4BtlMLcRCA+Lqgw3DO8Of9i05LYYrPW7
	aUP5U+3xMihy1Fu7OSFHmtvwae+ifRaNGRgpxzb0Rpi0dsypQsOWB6mpg==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011003.outbound.protection.outlook.com [52.101.62.3])
	by m0380145.ppops.net (PPS) with ESMTPS id 4hqqra36rm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-arago@lists.yoctoproject.org>; Wed, 04 Nov 2026 03:03:11 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fUs7j/A6F+NhA3H5zYQDgn2jyWbigqDFxSWVofQndQYtNSITk2wRjYjPuHvUwr9C0MywQTCGSxdrjChWDjWKJqRjTrAK1efnKSV5F+FR5G13g7bGAbsfnZ/X/WC0xSCq52l82gXgc8jtOnBKyaW3z6qFHgo8xhc/18pIVaFGbCo3W8w5fYpbk+xwnUBm9H80qKpYoobWvw2YoysDZBClrZs0HqttbI5EuRwcq6QgO7LGcRIYJxM3mj+e1xU6+zOP15/fqIkL0kUbYMUqhFjR2mRIeyK5wFjE2UzYKIYh6XDuFXrFFnRaw60rs/WLVMzcuNi/H/aQZSeTHf5+qOqGwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IStTm4WhszTjCkPs5QD0mBU5MvnUIgnry1VF0bNFDs0=;
 b=Zdvxq9ijgO0NWwceZW8UKXYrvpPj3Ew42jIE0mXzijGXnClzn6Q0pV716IVGcfMtxAfEHq8XvK5GXffmtFXh8LS6WU7mp7zdJsRx4yPgtR0Ha5gYwRT22z5D1bWRYO2XycNMSWFx8opp7CRM/ZVjSSsrO7qSeBVvGBZhXsCAz6nFUzqm2PHRW5hzYL2KdyaVRJGS6N75diDg3jUcIqRHuQVbjEhMFbRtbNpKutJgODJrz2H1CxVNePWWoQP07QEmz60byCiN09DALnZRTfo/a5eVTuQUZ4vzjYTVhDSCYXy/xVzJirxUw3CAbhbOS1pz0GgKsrwuTrIPIye85sMSCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IStTm4WhszTjCkPs5QD0mBU5MvnUIgnry1VF0bNFDs0=;
 b=j8o5aGbtTUD/a0m/UDuPLuTzOUt+7hkPp+MPhaHKAE6ssuewuw7msQXGztGG/+uG2slCjuCla8hdZ2lM492kXM2BPXu5WYfcHrGM1Te1ZIwgSQpHxush7HarMpHrf+se3dmRaTUJWgQil9niWtTx9LY26Vrhu61uVCVMQA6tP3g=
Received: from BN1PR10CA0027.namprd10.prod.outlook.com (2603:10b6:408:e0::32)
 by BN0PR10MB4950.namprd10.prod.outlook.com (2603:10b6:408:12a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 09:02:06 +0000
Received: from MN1PEPF000793FB.namprd05.prod.outlook.com
 (2603:10b6:408:e0:cafe::7a) by BN1PR10CA0027.outlook.office365.com
 (2603:10b6:408:e0::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.9 via Frontend Transport; Wed, 4
 Nov 2026 09:02:06 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MN1PEPF000793FB.mail.protection.outlook.com (10.167.249.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 09:02:04 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 4 Nov
 2026 03:01:12 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 4 Nov
 2026 03:01:12 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 4 Nov 2026 03:01:12 -0600
Received: from localhost (uda1250336.dhcp.ti.com [10.24.51.123])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6A491Bva854251;
	Wed, 4 Nov 2026 03:01:12 -0600
From: Yogesh Hegde <y-hegde@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <praneeth@ti.com>, <prudhvi@ti.com>, <r-sharma3@ti.com>, <devarsht@ti.com>,
        Yogesh Hegde <y-hegde@ti.com>
Subject: [master/wrynose][PATCH] packagegroup-arago-multimedia: add application to debug drm
Date: Wed, 4 Nov 2026 14:31:08 +0530
Message-ID: <20261104090108.2136937-1-y-hegde@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF000793FB:EE_|BN0PR10MB4950:EE_
X-MS-Office365-Filtering-Correlation-Id: 88ef1351-d131-4920-201c-08df3a524bf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|23010399003|10067099003|18002099003|56012099006|261021121427099003|261028144727099003|261102123227099003|261026140227099003|261009223027099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: 26CzJyQ9+yJ0i4bvKu9BKZM69j4xS7w6TvpKNaUHcWGYVahwFOSCsHtMtxVwLJGugfH5VXUqY8qTId5NOu4DV/fJSw+E/zSAu15GQp83uyzgn/a2FuahHF0P5fmoAHDOxS+a7XC1CzLNYdccC0/prJP4pFUk1eprY9lBVtKd/6tBNRmL8MH5ZBS2SWiffqFRe8VyXH6pR6g/RnP0upGCTo4s4FnsZa+p/gKN/JZsg36k0oichGG4+eOhvLx8OMyXOBNewu7yXupPcho/o5bttzWLN0a1QdWojeXQNtgkvLuxiuFGemKbj2iUt2xapEUTQetzCV4/nLMJxtSUenRW2OHt+PVG2uuV0HXKRhITs9sq6UZNKwWWGk4qOGZ7pnh0yYnwIwZpJsxvaeTp+fg+cwRUIwRzGW33NnrxMRQA4/6PMl6eLYlUmWNDj2Shj+vNMtWxISuWA4Txah1yiV5sDd6EMv3BP35G5mzhVM2v4XlMo0kwvETKZsRB0Uh7weISle+d0+LBb6F66Dm2Whl4wTpZYmHpZ+0u698/z7yI/+xhXqq9WGweRsM/D5Q6BJwdmg/yisHlvrnSWv8wojGgWyUwAdLdEQfEp5VG5iXhsBVUgXnUTWQ15XWKATJRy7yLU6c/I8hHoBgSJqyISejH+t6gym5QPTouDUTuRgvQy8ABU56+hLrhUEF6FCpU6Br0s/rskxmXGrNv199FPMw1uQ==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(23010399003)(10067099003)(18002099003)(56012099006)(261021121427099003)(261028144727099003)(261102123227099003)(261026140227099003)(261009223027099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 9XdIHvXtCAW+gMUMbw+zSJ3C9kBF1sitVca1agCr8+Ov/aZX8uf/UIveebtJ0bNAVdnGXGe/7c6Q5RrNOhMvWKbyFa4PY5TSanktzrd8QB+kpOGiS/+b+FUdDkbSoZGmA9vRYmgK44FbNThQnHYA6RA7IdyiMUBYb8ju6FKpNcpLuJJUR9r8qu5nwIm09KGTR4jajVNVskDsfY5B1QrzaQFVsskoyhcgkRjZWCEaojrlTyqN8Zb8/3PI+sdwRHh+7zQSmpru4DL4DCJr1utA1sLA0eAP3tI8+01wpJPRr9DXqEleUQCdnTTgZ0znLbaLvrAGsEtUOC3erDiMHCCF65QOc8kp7ma18shmnookMYHOCkfrOjp5eZn6tSX5Na5pP2P+6ncGJpH3G6y8u6Kb6/Qn0VDfzLkDqHJgw+NoS5DPAX/JkidSufarP6hQwXlS
X-Exchange-RoutingPolicyChecked: M++W0pFuMwjsAlDlucnLZFfc5yKyOZAvsba2FuIqRMYInLC2yzMSJVx88SaDzk8nlAOYYXah3nn7/R2qxtrATMGsQLGNawmjNX5QitBsQOLgrOERLxAn4stRZMFbQZtuJpc5bBDZjxQckU2yHe/z86A8KxJTLuMmq8d5+HYTFV4d/PQU68tQxN8TkK5Pp5TRsT5F792NqeDQ5340NdDhOp9OkbDbpzJj4S/ALZXIENmoU2QoDFiPBbSQuXel3NhJkFXriX/HoOgi4sQ8q1EgpjWllR2HFWhNzFePq11Elr1RpCM6i8/0UXQr5bmmNasfhDfmm8Qv07fZNANLkjclCg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 09:02:04.4974
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88ef1351-d131-4920-201c-08df3a524bf7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF000793FB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4950
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzNSBTYWx0ZWRfX51VzumWImPaR
 6r08qRCPUifd3U6kRqjMdwq3XbyvN+LY+G6IpBx0h+P0bTE6bdiT7XoCHcYC5L1uUyHr5k2Tmms
 uQRAuoi6AOAQH9TL5f3RkwbjktjDNsc=
X-Authority-Analysis: v=2.4 cv=F9TC5ahN c=1 sm=1 tr=0 ts=6aeaf4cf cx=c_pps
 a=G+edI3GLQse3gACT8XNfSw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=3qPXMCljZZEiIn5PtyMA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzNSBTYWx0ZWRfX5KEWUux1hKka
 eaoW7070VZ8bilYqxehUZDV04IUIXWJQlijECUOOUJVFb63h6Cw8ELXuPy5EJCiwYdZ4wXZGzpT
 EuSJ6CBwuQIIxL8x+7d1Gh1ZGY3JtVLK0/q0qAJtmW3eni0QSRC2a4OElvFFXpQb86kK7mf9yc3
 UgMUP+x3MgXAe+hamXkaQ/VnTR7bLjubicaMZrw4uXDG/lReWUBNiip7xh2LhF7j1mBseSXCCcW
 VtWXS+UDA5e6pU8tvXvUlqW6QkcdDfyMDQpZK52rLolb7QcJagz9SVI4NVeGJvLtW0K2LxEP+A+
 /fBIuJgGxnGf2gDdE9nRfW6LWHdRlVi3Dp6vLr4QQ2hjVZoB/UAfpvGNn3YlYpBqRzeqZ2XaK+S
 B3D6cY2MAXL5gwQ5UCN+i8mh40aOBWBabS5chox1HAyirXVo+ViJSeSteTJmTYWRfoGshVvaTSa
 bmKHSYPx3TAZIizHe7g==
X-Proofpoint-ORIG-GUID: sMlFnugCgsX2YdyF9IyY7z7bbftqU-Su
X-Proofpoint-GUID: sMlFnugCgsX2YdyF9IyY7z7bbftqU-Su
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040035
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arago@lists.yoctoproject.org>; Wed, 04 Nov 2026 09:03:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17754
Content-Type: text/plain; charset="utf-8"

Add drm-framebuffer and drm-info packages that help get more info and
debug DRM devices.

Signed-off-by: Yogesh Hegde <y-hegde@ti.com>
---
 .../packagegroups/packagegroup-arago-multimedia.bb          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-multimedia.bb
index 198b3dac..457626da 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-multimedia.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-multimedia.bb
@@ -47,10 +47,16 @@ PIPEWIRE = " \
     wireplumber-dev \
 "
 
+DISPLAY = " \
+    drm-framebuffer \
+    drm-info \
+    "
+
 RDEPENDS:${PN} = "\
     ${AUDIO} \
     packagegroup-arago-gst \
     ${MULTIMEDIA} \
     ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', '${ACCEL_MM}', '', d)} \
     ${PIPEWIRE} \
+    ${DISPLAY} \
 "
-- 
2.34.1

