Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89798C98311
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 14:57:05 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.362.1790175415988548641
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 23 Sep 2026 07:56:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=b2FdtkcC;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=fvQa4W3D;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: p-bhagat@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NDgPGY775676;
	Wed, 23 Sep 2026 09:56:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Tl/LjpY0svLuwylpklQThEe845EcWEdcSk/eJI6j8
	vI=; b=b2FdtkcC5Q96v70drzSPOdGCftMFdTmDrbwiDPrlxQfgeMjbR2DxXGQFs
	25PyTBHmuF7znKOwrI6lFCUvQVZeHW2Kxjmg/rpmqm07L4KgXVDth17nYu8cfac8
	GkVCt1SjRnNze8ut2J5vRM88Y5oQ36uPG6SMHxFy5NyHnQTeAwz2TJftxmMX7Q1o
	eHtmrv58c9a7ba8CjR2pLL6l5IOWQadRlI4pXCnY3nyQALjQQ0kYiqHhVBU3d4Vu
	0JbUpfQaW7Hwr6mIB8/0huZD5wD5D9XFXuvxNatu0AWfMuBb9+7sASO1HMPzsKKO
	7KaoMhoxp849etDo7NQQZ6eM20vdQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010045.outbound.protection.outlook.com [52.101.46.45])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gv2ycw1b6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 09:56:54 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kvX8cyCCSE5HzyCh+mNm2L3El9hcZNxPVgRuf5ZYxZLU94kU3dzm2/hAAElVDHMXi3s19EjKuhQnCkvSQKqbPU/66WABx+u5XqYsa7zMHftwGgke9G9cuSeGrJ4vJXQZaA1pv7Q1GliT1KNSw51yOHSDBhdSCSz7MPSCBDzUrsW5F64lCbK6Fm+pNkqF7iUgI+igzmioPCujIwRBBE6W96ayHB+zWStkdBUch30fkCdUV4BxreQ7QNUb34VAf0GG/3++TfAVZ55d5dVDxnRiuwJL0nqYCXE80aDQyEWPDuZN1VDrRp7V4+nsz3lprasv02d38gmGM7OpCOhRiui0eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tl/LjpY0svLuwylpklQThEe845EcWEdcSk/eJI6j8vI=;
 b=kvsU8uV6pCyEzhVD656oOVUZogXf5vEF9EENzMUagT+W7zefYGd8hcsjMkflycB8AfwqqGfmW+HnoAW8sHO6f6kCns4UNY/dze88ogVBANXPzCljCQ6NlwYCmd9GAECsJ4TSJuUyq4EVij7F3RhtkrT/hlvL5enyUDupzHC1dTTxFzRSVeiM6MRRI4gMb2mtybykKak+eIC2DOjO1qw6lx6otl59GCcfaIwmqrlHK32K1V+nrpLdzLQ17cea8mj6iMSAWsZMfbqENw6ttOnjIESoL8GMWFtz1C7TVRJ7LTemyLyuoua94lbL5xihP46j9K3bgkQrX/hTeuzz4MH6kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tl/LjpY0svLuwylpklQThEe845EcWEdcSk/eJI6j8vI=;
 b=fvQa4W3Dk/hP0tX1zh6CFspQgwHFnifI/tUP9nJwVnPIxgIt0T3sYpmDy1koR8tnIZFNMZHOfasuF7BxYSqrLu6cs5x+0qr71XhHdNG0Zcp/DUupCQtamC/0lb3PJ8mfXEVeN8ZSOokodo49pJSXcJ7dPd++dJtDUnFdwIHLM+c=
Received: from DM6PR07CA0103.namprd07.prod.outlook.com (2603:10b6:5:330::35)
 by PH0PR10MB7078.namprd10.prod.outlook.com (2603:10b6:510:288::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.6; Wed, 23 Sep
 2026 14:56:49 +0000
Received: from CH2PEPF0000013F.namprd02.prod.outlook.com
 (2603:10b6:5:330:cafe::7b) by DM6PR07CA0103.outlook.office365.com
 (2603:10b6:5:330::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.16 via Frontend Transport; Wed,
 23 Sep 2026 14:56:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH2PEPF0000013F.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 14:56:46 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 09:56:04 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 09:56:03 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 23 Sep 2026 09:56:03 -0500
Received: from localhost (ula0502350.dhcp.ti.com [10.24.52.241])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68NEu24U3133879;
	Wed, 23 Sep 2026 09:56:03 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <denis@denix.org>,
        <j-sahu@ti.com>, <p-gupta5@ti.com>, <r-soni@ti.com>, <reatmon@ti.com>,
        <s-kapoor@ti.com>, <s-sinha@ti.com>, <sen@ti.com>, <y-hegde@ti.com>
Subject: [master/wrynose][PATCH v4 1/4] packagegroup-arago-connectivity: Remove pulseaudio
Date: Wed, 23 Sep 2026 20:25:40 +0530
Message-ID: <20260923145543.2140007-2-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260923145543.2140007-1-p-bhagat@ti.com>
References: <20260923145543.2140007-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013F:EE_|PH0PR10MB7078:EE_
X-MS-Office365-Filtering-Correlation-Id: 890147fb-74e5-421a-662b-08df1982e3e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|10067099003|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	EMQzBnCddLXpsiCx+FNXDCldAeE6OC3SX9rrOJ9bixQIUZ2Iix+EI1PAFXOas+6v6pshlXOfJQ74/h4MJlu5QeDVUEMJwY9eLSC8qPakH70br0FGhdaf2xw6YxjnQ9ydglapbYpU3FMSYdDudTzrzwm/j5LFQ44Rd0YBm7y3p3wG69Vjp4Wt3nUI4TVlRJPPN2lQYfa/82BnSJ9z9+gw5lObHUmc6jlb6fDj/YO0C/x9WXZNX0ZXseoRVZrI2DPAhzEOADPzARSxwwL15KXOVt1F5WqbDc9T9xuTt9VwkDHJBpNFScV7NMKWYXSFZ27RErIUW1YjLaCKklwiQ3+pK87AVNIVvYF6ILHvi4g6HyWOH+FQk1OIOdh+5sSNL5hIoHYLXFujfR1CAu97vkf42tIqF8o/Su99b2QlTE2yLDAA54JjTCA1G8dAb3XPm5mgM+lZahJzwb29/aYz04R4hDlRuN7iHOeqndJzWS3Hgb+EI0aYi4SzELJmTskUi4NuxeqQx91+FPHVgoecbObrgqVtEtwAL0Kkw8oPI1wbqUw/GfCX8g8GFkzNJv+o1VyXp8Ix6liU3XTAyDbdvA3hEHUzFqyheTaH1S+xzosIxU0bqZYjIambCtbxEibkAm5JSidXYdYeMjJojRuDPEidLXE7oBXu5NN/g2TDVpj8+RNVbBOme4N8uNw8siSaYJPnm+1H1B1XPVuNA1T0g2skMA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ZaamI2133WTLelLHyeQRyJoZ6UFZy0qphHdfJkRn4byQ6VH/23XEeEPVgnyyauZW9SJiVEX13igx+ss1bSBINmmq4bab8NGoBUtfdnxMTbdxhjaBOJQTKcp7mgFPBOP0Q3bVXCWQ3xCHz1DWOiSl/uGAisEGdZtZLCKR80eqxMnTMcrhBPLfjxGEkl1WYM1nyreYdHrovFlQ/BIT99WFYcinjDES1BziSWJ3c52+LqifIF2EQ6IKby48mu84V6ANI1a3BSGCQ4U0ZAbw9EsTP2Oo6pAzN30Md+7FPJ1m0NGVuchQ3tAY5InRQjGhrRfNBkWsu0od3H/AKZotIQzLLucqErU3rqNwM7CXuJLsB0jee22BQotz1ex6lZXl3Cyl+GHiOqXhHVQrcMXrgBKdA5PgXnQBmsJelrerBem+OHfKJb9MoPEDOBLaLDPraybU
X-Exchange-RoutingPolicyChecked: 
	B75epLMNCmVtY/aCyGc9ua3XgCyExQKZIeRrAsOTO/p1hXcv946IXxojX+Y/IbvX3q5/R3Fmg0UJuea5x4QCan1NO+uqAfbvrXj9fi3kXL0yDwWcfP7bikhN6PGYZmTssEZaO2YAkUo5MXgF54rE7C/RF42Ekd6SSzN1tso1KzX1R2jqrwLMTInWSaQJfyh1zmomjenXrbTfwQ++b9vEcPeQsaH4cdAQccn2iO2kWouRdGiKVsXb242F2b/OwMzE6P9p+kHh+WPyB9pQbEKSoD98EeXaS/fxwUQ/kV/Wczq4/Jf8FQDVcBpNlzxt1n5UUbpxdMB3vCFiV2ccMOkIkQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 14:56:46.8808
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 890147fb-74e5-421a-662b-08df1982e3e4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF0000013F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7078
X-Proofpoint-GUID: zvHqOyq0c6aOSN-ANVQI-yrs5vhOzz-0
X-Authority-Analysis: v=2.4 cv=WZKZ+EhX c=1 sm=1 tr=0 ts=6ab3e8b6 cx=c_pps
 a=lEAAG6kgDLZw1ps4cEx4qA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=c1_A9w9KVkEXk37WPw4A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1OSBTYWx0ZWRfXx8vyREIpeU+5
 FcmTZFJzgUHJ888iiInoMNZVMFCljGAgR4DP8V59ozpRvpoukT0yEwdSj5xfaCV6QjTMVd80OGT
 jC7gxP+DZf+7K/fBfnIPic8e345D52ovAjhGorGzjUhksvoofdVRgQujZVfo3BIo/xP3c5zEVxy
 1xWlHQXY4VE2txF4ATaiqUfYUg257FW2oDYg4O10lFOWCUZuOKh/isDMNyZoAeUU0FhvHA/Y2i9
 8bpkTu8rRBqjVqYthOy4E38khqGgH1ObkNmQ/HGTuGvyFRdrEcdB7zBZCZVj5iA3f4aKsAIW1Dn
 Hol9R9D9R7sAlzpLkrzYfIzt7BI6JPPGq83QD/AOHhcH+ys5daB7R8UCMQ9XrhPgjH0KzrUcdJY
 RubeeLNzRFDPrRHbyGzltov8Fq+gkFew+B26JCT9mM2QforkBUwl5EJ9bIroJxpZVJIFq+RiOYq
 HuT2gktkWdMbHs18GIQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1OSBTYWx0ZWRfXyQaakeBbuJWl
 RIKt3AtM+xL7ea7aIUEcgSaMknnoTOh6I8OjnGRijZJ02/UyTIyaMil4NjMazPWOk2i4GNG4QQi
 rMAIxgCvg0DgblTvstcyzu9TvD5ERZY=
X-Proofpoint-ORIG-GUID: zvHqOyq0c6aOSN-ANVQI-yrs5vhOzz-0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230059
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 23 Sep 2026 14:57:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17698

Remove pulseaudio and its Bluetooth modules from BT_COMMON as we
transition to PipeWire audio stack. pipewire-pulse and
pipewire-spa-plugins-bluez5 provide equivalent Bluetooth audio support.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
Updated commit msg

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


