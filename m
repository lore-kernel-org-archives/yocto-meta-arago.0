Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5B1AC982FA
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 10:27:14 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7070.1790072828310443304
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 22 Sep 2026 03:27:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=n0yCDRe/;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=otKuORy6;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: p-bhagat@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M7j9XV1034864;
	Tue, 22 Sep 2026 05:27:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Tztedoek1X03UoVY4ODwSPH+mmVF/IGEgt4LtFvRh
	HI=; b=n0yCDRe/Zq5qRQxzi9kYN+3FLdl60biZEJuTqKqDBIIHNcyb3BHinTTxM
	30yJFRGGPMDUOutREL+V35pkrckc4XcjnVvDhgpYFH4wRub/qeisxQ11R0tBTzwL
	OZjQQCWZq5LWKNqdr6ll/Lox+UDgC/V4HSZ5co8VfFB/V678cd+yf0/MTLbZYT+m
	Al3hfsnosOJuqM2XhSHwNyYJlGciyAYMy6khdjcRuGPF/xGwSWGi3XcG4g0BWnN4
	uEVeut3vmUGJ8tQWZ/9InF59K8TEhnAj6Ra/Ws43b160vZN4Xx+EYkxn9L02Ll6H
	tsTRxspcA+Q29QQj85Ze3lhkrN6lQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013009.outbound.protection.outlook.com [40.93.201.9])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gugxm27vf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 05:27:06 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AmpLr8XL6BZQ00uoJhfmqfB4pu2ojGOqMqJ7c5OomgVYMPf7FmR/c3/Gxxaz1B8lP2sCJlxgKOk6gUf6yilsYXBf/uUge85nq/Kp6ZtJqXCImrZUibAECEMsIsz1WBa0mtu4okSFyOdr28wNigQSeOHQVwT1wKT3W0ochspxsYcsDSf3WY2LojGDFhodA7CBZIEF4ktM6b05D9uGczBuF0f01As/qvwZGdU/L2zu25wB42xVxRrium72msn1lrLr120qgloh0hWOzg01poex7o3ptxdYHXhf0trOMAmmdRcdvCTEsrxsnF+LgB1EtQOItWhxQrZfQXtVUvw+PUWqLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tztedoek1X03UoVY4ODwSPH+mmVF/IGEgt4LtFvRhHI=;
 b=Y0Yc6AEEa8sGstOpiIefKIgBbluBDZ7JiBg5DuWGr40u9BAhAdtnecK/fT4eTIFYIly+4rBoCbHeXQu1XLtI+r2x9UOOs1en4Ja9t7NHhg6we1oQjBjNh/ua+PjpgFDgLqmZejFm04YSJuwKmrq1q8AOeEhHrWuiEEX/0KtlOF5yr7S5mgUsGP8rAfIRG1QoP+EfrkGKMHIZRsn9OvyxH2gNQHXs0P7haAN5nkET3J6Gp41hkSO1sOOWlLpyt3HADN7L0EO323czMPTXG99qpMa8NRSTLCIkNDquaPHydLPJpYX5H3pbXojQk44Ccw7as83k8rAwZ79KkQHdW8GA8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tztedoek1X03UoVY4ODwSPH+mmVF/IGEgt4LtFvRhHI=;
 b=otKuORy6wYTaqmcNBQ4Z2U/IA2nK5QU+Exp0s55cFQwe3CgIEvwfTLKNovINLctB0LV9Hk0hE28XuPjemMcisUgkDASzM75/RrqTXxwOHFtHY2W/tbL9TATm8I/uysgU32XLd0n8geb6cg6RLQqPfDC6+OMycsPXPw6BNsabOu8=
Received: from CH2PR08CA0015.namprd08.prod.outlook.com (2603:10b6:610:5a::25)
 by DM3PPF7961280CE.namprd10.prod.outlook.com (2603:10b6:f:fc00::c32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 10:27:01 +0000
Received: from CH3PEPF0000000F.namprd04.prod.outlook.com
 (2603:10b6:610:5a:cafe::69) by CH2PR08CA0015.outlook.office365.com
 (2603:10b6:610:5a::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Tue,
 22 Sep 2026 10:27:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH3PEPF0000000F.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 10:27:00 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 05:26:31 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 05:26:30 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 22 Sep 2026 05:26:30 -0500
Received: from localhost (ula0502350.dhcp.ti.com [10.24.52.241])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68MAQTZX665385;
	Tue, 22 Sep 2026 05:26:30 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <denis@denix.org>,
        <j-sahu@ti.com>, <p-gupta5@ti.com>, <r-soni@ti.com>, <reatmon@ti.com>,
        <s-kapoor@ti.com>, <s-sinha@ti.com>, <sen@ti.com>, <y-hegde@ti.com>
Subject: [master/wrynose][PATCH v3 1/4] packagegroup-arago-connectivity: Remove pulseaudio
Date: Tue, 22 Sep 2026 15:55:56 +0530
Message-ID: <20260922102559.3717785-2-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260922102559.3717785-1-p-bhagat@ti.com>
References: <20260922102559.3717785-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000F:EE_|DM3PPF7961280CE:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d2f84e5-1cdf-457e-1da3-08df18940999
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|23010399003|36860700016|1800799024|6133799003|18002099003|22082099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	0SH6M6HK+f+YWPn5LpXuOUovtZE4ys6amcWoptwRV5gLM3Znfy4A30B+EeN/mzjNNcoQzdgsIi61Sh+945lP2H81QBNLybzZu18Nk+eSB/DbbFuPeg82dRr16B/ruQG+Nar6IciACMGU7Zp8CucjEj0PJA5m9XeG7AVWMFChg5wjwIYwpU4CE4UGst9Z98lgltibpTAup8k7671UQbDFeiuZRpyE9UXogBSAEzoVUMf2EcqH9BC6pI2kpOGqThh1RmDJOsBgYrL1yGmFEF2qq9AXSwTG+owunTpj0GXMJ7HeUhw+7BnHKow9899lfD3RuMW2GXtZI0/IlrXqtZ4QO95ph2bHuKlS8egll9p+idlGPV0CYUmn21xhUH5aM+u6kBJ+nwAGLvA7oUopS1nVXzOJhls+3Ijp9A/V47UVPZWq1i4bzbvEUpKjKJ+zlN4MTZxB7UCLazDf1Y/pBD0nMLjm/IOXkTonvfXVMEbvuNLs7vJEz7dib/B85xUYNIr3iviv6PToyWvF3bWQW67palycDmcPJtI59KOg3GI7te6mQAhBEnxOLHdvSxvLJuK4CNNXve0OzA3u3KF4q1JGBxnsxeXY3pNjX9KPQW+ItPcSghVvkSyEaKl9021H0vjeEUFOfzn4/MVWK4r/F2rottGAbJoEpX/EZuv/Iy4zM3nNAsmfvTUZZC8nqpStILSpLZGEtTc+NZE8S0StK4Nmfw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(36860700016)(1800799024)(6133799003)(18002099003)(22082099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	hfvYRGkOK/Ydv2rWy5iBBFKPStGhTo+3hSRz/Cq4rdUTyxav7OhVXrL03tZsCaB+urbgVoRYBeNSpICkaTaMuSfnUuWNF84juNSdREDEdCiD7MFNDD6STZxRXYmYg0ZEjnejYGH1RttBfG4dcIiDKLXeTT2atSItaPJYRD4daUZtexYybu97Oj+DOjPmQk2lt4WifcHQSy4Fefp324e+FPMHjSLDjY7CyertRZm8rEjMa1kcAk+SupC4WvPdMElWI6rsK9ojRJhxI862VhmgB4ze1LXtQEWcDlthtgPYBFit2LVHYvmYAIpEWu//hONVtaaQ6mv9ZR2BzXexH9nllLOG1TPzHy3qbrfqlZpIyBsCj9XjP5qywmrrIq8u166VOsS84aVeeq2yHKYCkoSEbLwv5rxIMpSm1DOx59kq8Cizr0WMdcmBnFoUzb5OA+OP
X-Exchange-RoutingPolicyChecked: 
	pvmZozBTanGg3FlXT/Mj9DjupGh0TODLEEGJ1R0oe56RpjsWgXfXo5ZH41+uy3azEijwGGMqK82g+R3wLdCIumD+hEnD9JCXFBO8yyDSwssvzZXF/aMj5viT8QnPcLuvRe7duUVg1D3Jbi33Rn3jMOiX5IQY294hMQ58yiAtDugYQOckL5G0tekM8RNU3puv3I4wcXfUkjqnqu6EKHQO5p9Eb2PztjfLwPhUo8hYmW0FNyBFlcBjsdW0WWvDnZUQY/7HMil4VudrtA8nsqxJyEVSHxbhKVld8oRTmtPUcO2g0qZmXoX3xrE8LvdZCCwpBwzPRroRRSogWoF7CDXdOQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 10:27:00.4309
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d2f84e5-1cdf-457e-1da3-08df18940999
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF0000000F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF7961280CE
X-Proofpoint-ORIG-GUID: bFJ1A-VHtN6c54m54cpxmB2WrwXkOwwM
X-Proofpoint-GUID: bFJ1A-VHtN6c54m54cpxmB2WrwXkOwwM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE1MCBTYWx0ZWRfX9DIhBmCiy4Il
 jjTj80utzZdadukqEpkf6eLxX/EHO+x5lPv2w30v1iiswLjqc7NH+15nQ0VEtg4sO+g2n4GhbrH
 9DKR+eLipG8sgO2GH58T3X3ljSecsoTMgk1oBQQ5Tb/ahkxG9oCYKL+WqfZhKh1SSkK+IGL5/XH
 arpDz69uNR7bkDltJydI3Vsq7zEPPOCSQ3PjxQXoTQBQ4woWmxNVvuzwQ5AjJlYrRhgcCCG3Zt4
 5b81t1L/0bj/919BdG1Y+Fa0ZsKJGFCD1lLoGfI+q4SjNwAZOR3VXFqwrr5+cB9nRHc04GAo4zP
 w6B0Uqo/cTOLINJu/B/WEm+gfB/lR3l1LBDr9y7vFQCD2NeclITv5nqhyVpBaLjvaR0j93XNscI
 XrMBVWika8Ri05NRTRgg0r8bS57QiUNS9S1BhSvj5LvyYocTsUB5z/Kx9BF37lXNDRvKqWmkURL
 lB5wYrHm2S9HloPQMaA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE1MCBTYWx0ZWRfXy62rIh+hrqRV
 BoaYwYxXpOhKcLgCCFwwlftJzuuaTUNbAwOT/7aUHnWm1mAixV9VQacHoPHukeTWHde0OdWoSJ+
 4tj7DHvtH0+h9l1/qNIVlOy4fbn0WHM=
X-Authority-Analysis: v=2.4 cv=INeXmQvG c=1 sm=1 tr=0 ts=6ab257fa cx=c_pps
 a=bo0f5OQ5EW/jR9k4kEC/jg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=c1_A9w9KVkEXk37WPw4A:9
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
 <meta-arago@lists.yoctoproject.org>; Tue, 22 Sep 2026 10:27:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17691

Remove pulseaudio and its Bluetooth modules from BT_COMMON as we
transition to PipeWire audio stack. pipewire-pulse and
pipewire-spa-plugins-bluez5 provide equivalent Bluetooth audio support.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf                  | 4 ----
 .../packagegroups/packagegroup-arago-connectivity.bb      | 8 --------
 2 files changed, 12 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index f3feb8b5..dd0d6072 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -107,10 +107,6 @@ PACKAGECONFIG:append:pn-gstreamer1.0-plugins-bad = " kms"
 # Enable gstreamer plugin for libcamera
 PACKAGECONFIG:append:pn-libcamera = " gst"
 
-# Disable pulseaudio routing in alsa by default
-PACKAGECONFIG:remove:pn-alsa-plugins = "pulseaudio"
-RDEPENDS:pulseaudio-server:remove = "alsa-plugins-pulseaudio-conf"
-
 # Enable gstreamer based video for kmscube
 PACKAGECONFIG:append:pn-kmscube = " gstreamer"
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-connectivity.bb
index 98e8f897..a1de8f4d 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-connectivity.bb
@@ -37,14 +37,6 @@ BT_COMMON = "\
     bluez5-obex \
     bluez5-noinst-tools \
     bluez5-testtools \
-    pulseaudio \
-    pulseaudio-server \
-    pulseaudio-module-loopback \
-    pulseaudio-module-bluetooth-discover \
-    pulseaudio-module-bluetooth-policy \
-    pulseaudio-module-bluez5-device \
-    pulseaudio-module-bluez5-discover \
-    pulseaudio-lib-bluez5-util \
     sbc \
     linux-firmware-ibt-18 \
 "
-- 
2.34.1


