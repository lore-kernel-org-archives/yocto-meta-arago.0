Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 991BACCF2DE
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 14:14:55 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35527.1792419290905430198
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 19 Oct 2026 07:14:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=LAB96eTV;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=DyHjOyQK;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: p-bhagat@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JDwahm490224;
	Mon, 19 Oct 2026 09:14:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=PMPjxMhCFRxli
	kZDVb+Bd72GcHEFJIvCx16or4wBbrA=; b=LAB96eTVCmzD2ylk10vO6Gly8tP+S
	EakJKdB+XdQD6yoVbDYqAo8kPpPC+nZXfiXsqOXHapLz08S0hduvRwbBv5dBepUg
	qeA4yKXVd6cUkjUOCPsUaBapCPzus9ofFrGqn7J9Nm5kABGLYjBpY1aXgiKyEAe9
	FVRVjdTI9cpIGose4+ZEvD/0wtzL7IGu7lcOjfUodLqQq9MUpSL1CRBZuJ4cPCLr
	JwqW5vkXWP8Bv35/+MqwMIu+IL1l1wqA8GOzlyez837tQICPKbF9wKelfk8klZh5
	LLn56OTxrsjIZPiCRiFBJQbrDJjxqU8si9IXxD1ZgXOLejUKdwroYz43A==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012039.outbound.protection.outlook.com [52.101.48.39])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hcrd5xfyw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 19 Oct 2026 09:14:48 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fGV0RQn15/WTyOY+i+3TPEWLoyyInwtkTe4VwuA/le4to/wi4xV/M6uCnHxY/4Br1xaQ1Bu5IvBCm7ieg33Ld6VbKrUVv7H6Z/6ciTRFTkyNfosb7YfDVGzHpZuBr8li0JI0JH2FciN7luXCB7bTeLl5vlDOK3QQ1Dm/oi1LzFxPqvHG17UBOngAvXiH97ElMmz/mH6fz39XMkkLNmUznh5V48qxfNWEXSdak0h6FfaqtcL319QtOosVDgoRK/ljQA7Em2foE0SzitaFFetynfRUoTsH1Fjtlj0w40VzHN58qDDjm6Js6G3kbnSv5YX44Cyo/5YNgUOlBF+034zzzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMPjxMhCFRxlikZDVb+Bd72GcHEFJIvCx16or4wBbrA=;
 b=gkmPjW0EBgjtv5gPYiNpnPQk3ckqgLRTi7vJEdqnYBYxmWG2mAiETAFC1jaN4xU0Xs6/WEffO2yaJQF9HSyFaT1KcpD04FZVqW1LPhL92ChMQrt5T2/XEmOg4+mUbNDdGLI8mXvJ7Z1Zioi3q2f8XMJ3kEcSou+AnyCM/97Z+iJoTKZrPWdTa9U6ZkKVK6djc4Lv26OTTapC+ANsP8Mn23li0eYDNyLZcnGOP00rBsm16Z9A1QUH75YjENOd/GJCKZ8RQCzBkYhCwoBFsMfcAox1GqwrtgJ+7s9YnQjVNJNB/RySeFJx8PWOZ5871q4uvagT7pON9iQRV4qzVMKeIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMPjxMhCFRxlikZDVb+Bd72GcHEFJIvCx16or4wBbrA=;
 b=DyHjOyQKmuMCp152uegSB5cFKy43pTfgQsP4LF7DFawnKIuPA9CfnPW9VDupg2Pw0vDC97R4fZLVTVBlcF9RRP74FNcJr+NSE/CDe0IA5SyTT3vkm0jotMr8TEoOXpbAuDrxqkBI93iFiF+pnElqAEbCpRCmv6HxbIBJ19xCH7Y=
Received: from PH7P220CA0052.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32b::34)
 by IA1PR10MB6169.namprd10.prod.outlook.com (2603:10b6:208:3a7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Mon, 19 Oct
 2026 14:14:41 +0000
Received: from SJ5PEPF000001EB.namprd05.prod.outlook.com
 (2603:10b6:510:32b:cafe::97) by PH7P220CA0052.outlook.office365.com
 (2603:10b6:510:32b::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Mon, 19
 Oct 2026 14:14:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001EB.mail.protection.outlook.com (10.167.242.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 19 Oct 2026 14:14:38 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 19 Oct
 2026 09:13:53 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 19 Oct
 2026 09:13:53 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 19 Oct 2026 09:13:53 -0500
Received: from localhost (ula0502350.dhcp.ti.com [10.24.52.241])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69JEDqZF3887435;
	Mon, 19 Oct 2026 09:13:53 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <reatmon@ti.com>, <praneeth@ti.com>, <v-singh1@ti.com>,
        <j-sahu@ti.com>, <y-hegde@ti.com>
Subject: [master/wrynose][PATCH] wireplumber: Remove set-audio-defaults service and script
Date: Mon, 19 Oct 2026 19:43:39 +0530
Message-ID: <20261019141339.3884587-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EB:EE_|IA1PR10MB6169:EE_
X-MS-Office365-Filtering-Correlation-Id: 92fe8a62-a44c-4a01-c08f-08df2deb4f6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|376014|36860700016|56012099006|261009223027099003|10067099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	nS1fbYoGQ1LohU64yeGNNYk6Wq7S9iibIJVUWqU1hPu3ZITFV0uG2jAUPHgXMRllImTUSwAkZgERDlOioOMDZe7RvLl8Vvb1cEEU79lqnqmHNE4OzchyULutshjWoGhu8SzbAu5DhGLc5oyHoYM6db4zZi658B1ncExTc405HBrXPUesh5RDiMvU7lhEVmlKztB5TvNBOurexGuJkZTVXNoyJ2+vb4xGdJZg/I/QG65xHNUyBnHEAyznuQYY6+/iFjHX52gHqfj0IlInot9tgEXv39Vshk2NpCQQa9qdi2rLbjNjFwIs7ln6vVRjliMEcKJ47TJt6ZyxkUCuScdkp24E+tUDdYIXQ/wa5TGMxHYoGaci1NyUOxVRpG1HIiSN1Qi4BttIIZH+IIq43OtAuXrmRdpYzXRrWuRSYZ9nmyrESu6myKfZlUNqPg7r+9MErkM/MGjNMcZStK/MnDoGfn4FngJ7jdu92nnvEz2zFBCpxob/iklhurROpdhBGJ0wxVSpkIEGXzdJYv9u7INeu19LMpt3r5X8ZTA1sLzUf6z5tJZj54zZQV7IeBrmOfV4ngYULanBY5iDC/nEPlgON6/1R9kUiVCNfvLpiJEknGSEMouMo3Z1x20BYjsiBYYZbdf54FaYyDYm0c55oXU2hB+BTlvoxox6m1mPU1cUWKIC/EmcpDh0xPB1E5SNMxtDAZhkCULJUZ+dyiy3xXqALg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(376014)(36860700016)(56012099006)(261009223027099003)(10067099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	0Th2cV4C2/B23x7jfi5Z/JHJ72b78yWWptUFMgZvyb6VCmde1uApfP2oBR1pU6akkwpP8TUhdS+i1De/ykJrHeoqzi+96Wd3nFLE1shQyiBK9rT7qi0TVdudVgheXsfqsc8AYkCB8OIEE8teiKYD9W3nu2s3jrreH84QMBS6uIAZ384mOnmhePwTmeFLWSlMW+R5GimIfDrSr58gBArgoEs+BMoyRQG++EAt5Dj25mmYTIdkf5NTc4mEguIuaeq9jDB1zBcbBETHScapI58B3hI6HUP78pyXqQwDJ1rJf1ZKgGt/Pi1aeRmH+QtpzNCaRhibdimLG/gKsy3mEe+k89i/fEw8pRz1UB+9cL1YYD5wFQHKpeLvtuar4+v15iAEV3NWi3lGtJj3RsLwAgVSkDOpZBaqCgO+7VqGImchLrUa5ez9Izho8u3HUoYXx//r
X-Exchange-RoutingPolicyChecked: 
	whIT6HqX0nL0Nay/aaz/i2zdi7gWXWORjJm44nmONEKDhHOPJFz4pIBeRjnPUZnEm1ZQCurq/t/5+jJLkQ1DyChqwzYUXWCkBzqmh1w+b/NDib1t99dTQ2kE4N39vnCslVU3g6ExLlDTdE6rVHVX2Is+4rWuB/4uCZ3u8+qA8q9r9QVmnZi2tmy52X3soDDNLx4pG92vzbB7FT/at3haLkjwjT94buqq0ALNyy4HDQiV1yMwyc60A5D3SHA/xD17n24xNPgKekgU0QvBzKnyIOFttnSjFcAwih+HNwFHKatUsrIgD99RNS4xntAE2te9i16E9hTOJ36LEgmOxeAZTA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 14:14:38.1722
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92fe8a62-a44c-4a01-c08f-08df2deb4f6c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6169
X-Proofpoint-ORIG-GUID: ZJbb04udYn48wIceeyFnR3gS7ytuubQj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1NiBTYWx0ZWRfX33ZEsA+mpoBs
 7geRHGiQ1OdR8WXsfrM7EkjjRyIAV6fUSGqyWB2kC7/ocxu9FJ6SyKOwniXqsp0LVU6ClpglK4I
 0SR5hTJh7gm6DBe2hXjlgOOeG6+f8KhpwIekHvOuvknkGI5qw39Q0pKCpWSrIqFFBp08gLxEQhS
 x3b88bbn1ihzjevI+NqG/sdQIhGJiqx/onfb8iGlQ+f9uiyiKTFbpR3jYaanYD1f55eNwZ6zxM8
 UP0fJLdlXagsHqBZn4bdTFBCXCDZzLcEsES1mwOHWGcFQTbh2HVNPZFv55KdmI9Xk8L0tV1PNqJ
 dUz38N0PI7TggBtbkr6LOYcxQIGS996LeVsqEOs/PjzKTW2D01uQ6g5rgVXP+RWWokEpPG7x2hj
 xqK7OmmfpMRm0cQ8eCyFMe3ogLOoczSn1MkFrp6t+WdWcHLnoXyN6W/wG9ss+0f+/EEAAs7AC3s
 DEw9jVNlKHGZZnT0m8A==
X-Authority-Analysis: v=2.4 cv=ReYFmFtv c=1 sm=1 tr=0 ts=6ad625d9 cx=c_pps
 a=8rPU+5JwkgyrUHCwJFKWcg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=zfrOFr88hbCFSeMAe_gA:9
X-Proofpoint-GUID: ZJbb04udYn48wIceeyFnR3gS7ytuubQj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1NiBTYWx0ZWRfX6GiGEeXSuArR
 9LRhU5aZnu7g9/4ZLEpiKiYXvgautlhk5P7I7CMDK7nQ4Yj5ajK8qs/+Fw4OkDc+B6DB11pdyVz
 INWP+Pr3PVGbSsa+SOE2lqTRFmAPS2I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190056
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 19 Oct 2026 14:14:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17746

Audio defaults can be configured directly in PipeWire via metadata
instead of using a separate script and systemd service so remove
set-audio-defaults service and script from image.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 .../wireplumber/wireplumber-arago.inc         | 23 ++-----------
 .../wireplumber/set-audio-defaults.service    | 21 ------------
 .../wireplumber/set-audio-defaults.sh         | 32 -------------------
 3 files changed, 2 insertions(+), 74 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.service
 delete mode 100755 meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.sh

diff --git a/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber-arago.inc b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber-arago.inc
index 158734a6..8fcb5f97 100644
--- a/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber-arago.inc
+++ b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber-arago.inc
@@ -1,22 +1,3 @@
-PR:append = ".arago1"
+PR:append = ".arago2"
 
-FILESEXTRAPATHS:prepend := "${THISDIR}/wireplumber:"
-
-SRC_URI:append = " \
-    file://set-audio-defaults.sh \
-    file://set-audio-defaults.service \
-"
-
-do_install:append() {
-    install -d ${D}${bindir}
-    install -m 0755 ${UNPACKDIR}/set-audio-defaults.sh ${D}${bindir}/
-
-    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
-        install -d ${D}${systemd_system_unitdir}
-        install -m 0644 ${UNPACKDIR}/set-audio-defaults.service ${D}${systemd_system_unitdir}/
-    fi
-}
-
-SYSTEMD_SERVICE:${PN}:append = " wireplumber.service set-audio-defaults.service"
-
-FILES:${PN}:append = " ${bindir}/set-audio-defaults.sh"
+SYSTEMD_SERVICE:${PN}:append = " wireplumber.service"
diff --git a/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.service b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.service
deleted file mode 100644
index 423972f7..00000000
--- a/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.service
+++ /dev/null
@@ -1,21 +0,0 @@
-[Unit]
-Description=Set PipeWire Default Audio Devices
-# Wait for pipewire and wireplumber services to be started
-After=pipewire.service wireplumber.service
-# Ensure sound-card is ready
-After=sys-devices-platform-sound-sound-card0-controlC0.device
-Wants=pipewire.service wireplumber.service
-
-[Service]
-Type=oneshot
-ExecStart=/usr/bin/set-audio-defaults.sh
-StandardOutput=append:/var/log/set-audio-defaults-output.log
-StandardError=append:/var/log/set-audio-defaults-error.log
-RemainAfterExit=yes
-TimeoutStartSec=90
-# Restart on failure with delay
-Restart=on-failure
-RestartSec=5
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.sh b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.sh
deleted file mode 100755
index 49be177e..00000000
--- a/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.sh
+++ /dev/null
@@ -1,32 +0,0 @@
-#!/bin/sh
-
-# Wait for WirePlumber to be ready
-i=1
-while [ "$i" -le 30 ]; do
-    wpctl status >/dev/null 2>&1 && break
-    sleep 1
-    i=$((i + 1))
-done
-
-# Additional delay for nodes to appear
-sleep 2
-
-# Find audio sink ID
-SINK_ID=$(pw-cli info alsa_audio_sink 2>/dev/null | head -n 1 | awk '{print $2}')
-if [ -n "$SINK_ID" ]; then
-    wpctl set-default "$SINK_ID"
-    echo "Set default sink to ID: $SINK_ID (alsa_audio_sink)"
-else
-    echo "Could not find alsa_audio_sink"
-fi
-
-# Find audio source ID
-SOURCE_ID=$(pw-cli info alsa_audio_source 2>/dev/null | head -n 1 | awk '{print $2}')
-if [ -n "$SOURCE_ID" ]; then
-    wpctl set-default "$SOURCE_ID"
-    echo "Set default source to ID: $SOURCE_ID (alsa_audio_source)"
-else
-    echo "Could not find alsa_audio_source"
-fi
-
-echo "Done"
-- 
2.34.1


