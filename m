Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83DE6C9830E
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 14:57:05 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.375.1790175420831263359
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 23 Sep 2026 07:57:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=j9XkxQvS;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=QVc9i4J0;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: p-bhagat@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N9XQpS446146;
	Wed, 23 Sep 2026 09:56:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=u325X5uHUBmtIXOAlDbXf8tmGVFV7YTWXjCqxDU0l
	sI=; b=j9XkxQvSWb/kGz06jZyk6KwTbNh4laW0721wJA/SMXmM/gUsYOYun9aER
	OVEfhvQ6+NcZ5QgOF/w43/9yLbjS4TA/7lse3ofjsONq/i0PQBFJZEm7zObJah76
	c2QAPKRX8WV8qFhF+DJ+gAnQZJe1Way0efoMOW0cUKGYajlU3Bcf9GvalR7gHKRy
	IROm/YHtBpk4+i3nCOyBPtfocrLaN992xO5K6sMuuRApZV0rWLMSGL0gF1xjFwt2
	iF8zVf15JuV/70fcWoB2YGE4RQg9Zznf0WQWUsIHh1Xtwz1hum8Xm6H75iwvoOTZ
	hmgHdZ1wJF8tunv6ZnbjrrvmKpfxw==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010005.outbound.protection.outlook.com [40.93.198.5])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gv54tmasd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 09:56:59 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rX8rHQqyxRJ3bEShNOxiLIQnI9Eksk95HfK6/FbMn7JG0NBXlNDIPlvR+AQkD8EtWLE+x5AJymGS3KeNGFKBrtPqZyjSpaKtqlMDmyGY8bdQYdHhAHjy2IANJCyZZt/4b9h0xA7RPDzCR3uBoYL+iQGCdSyVGbGn9961ALD6BmFNLbu1Aa/uWQFeO4EzSvEXoFJQ7bweMI3Y5n/Tp1kVrpx7LpgqhuDYVZU1IHwTtkv/7P4rngnRyd9L/eUT/VGed6U9RVLWxk/9orfOja4v+T1Thhqdwzs5IAcS4zPvim8StXShNfNRK54EKwvbuB4t/72oyZYHjuvxA+hYTikEHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u325X5uHUBmtIXOAlDbXf8tmGVFV7YTWXjCqxDU0lsI=;
 b=bPk5RWjJT09BFeIJJAe6XZ76XnZtJLkVHelVLokKWhG5+LHoMg6a/Jy/iDek2Dbwlo/JCmcvLtsbP5pSIBS6o881ddzeS87H58LJ9HhJRbwm4Dn4/Z3UuKoXG/UuryPtNxn8mO2n2/Dtx3XAC8iVSFOt0F0rOOPZ0hypGRHpxMPh5z/PXBs2FN2ldIwpKAqx54sp07VfK9IvAtvZ+Rw5XH/Q0bcTKtMMbbYNsXtxGVWvgSfIc65qzT4ESkYwO/24NvuNG5ICOukrmafCKwko9YwDTIzj7V9Ma37+EOuAMNWlsIRLcennW6Dm6Cn9MULLdDLmtJLnAmjvfs38o86oLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u325X5uHUBmtIXOAlDbXf8tmGVFV7YTWXjCqxDU0lsI=;
 b=QVc9i4J0DfoSMcyMAjt0RF07P8eNNgBs3F4YzxTW5iDhRCJotTAt/gPYoLESPmSgReuu0W2bNneYdOyil2CNCkmzXHZPhIZKQUl5cN+o3tEmesCJBMsPUL/mbrgZHwJ2kvkI40jRuadJVxrcsBTfoiFsFerOgmjL1YWkg/EC/S8=
Received: from BL1PR13CA0230.namprd13.prod.outlook.com (2603:10b6:208:2bf::25)
 by DM6PR10MB4396.namprd10.prod.outlook.com (2603:10b6:5:21e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 14:56:57 +0000
Received: from BN1PEPF00004682.namprd03.prod.outlook.com
 (2603:10b6:208:2bf:cafe::16) by BL1PR13CA0230.outlook.office365.com
 (2603:10b6:208:2bf::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Wed,
 23 Sep 2026 14:56:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN1PEPF00004682.mail.protection.outlook.com (10.167.243.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 14:56:55 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 09:56:11 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 09:56:11 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 23 Sep 2026 09:56:11 -0500
Received: from localhost (ula0502350.dhcp.ti.com [10.24.52.241])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68NEuAkp2241013;
	Wed, 23 Sep 2026 09:56:11 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <denis@denix.org>,
        <j-sahu@ti.com>, <p-gupta5@ti.com>, <r-soni@ti.com>, <reatmon@ti.com>,
        <s-kapoor@ti.com>, <s-sinha@ti.com>, <sen@ti.com>, <y-hegde@ti.com>
Subject: [master/wrynose][PATCH v4 4/4] packagegroup-arago-multimedia: Add PipeWire audio stack
Date: Wed, 23 Sep 2026 20:25:43 +0530
Message-ID: <20260923145543.2140007-5-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260923145543.2140007-1-p-bhagat@ti.com>
References: <20260923145543.2140007-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004682:EE_|DM6PR10MB4396:EE_
X-MS-Office365-Filtering-Correlation-Id: a8b4f7d8-968a-419c-418e-08df1982e904
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|376014|1800799024|6133799003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	WEzyqT4xus2b5swC3bp2FL52nMjGnLpScZwOrA2anfugcnm1wSFQggYDCEYM0PcecrA/9YFbimnkRrsI5KiJVW2fhD1ow2YU4CWY9ckozKZvwy5TLkK6mkpAHw0l5oOX/3bJAQZA1B+JAmtBeC+O9R9Xlna3BKCkUtdnuekOB5ciClxScO2saoa++4iLZ3j9svLIfl9BjyWNU67H9N+Ck55GWw5aCrPdN4MNq9MoP57ieZoCiiovIJVBFD89JxCgVasflAr8RuFh+4/CPg8CqyQfdrgvkFWqAPl64rsUQ6re72xtk+dBLuNZACjC1LefZ7eDNYgMYz/wKFzfMcx9l4cWhw5hQQOhqjLTaGq0fm6bGNngY0M5ebEVdsVQeM+RhyFiE0dvBP3yKgKdWL2ibU+2zi+05UShx1Ku5nTeINSn80x+6UHaxv2BQZVLEo4tBEl9zadEQSQZ5XQePgKLqnzy0m1b1jTYQ6hrqVTjJkGi4MqjK6Gru9+Q5kTz1PWrY8Y94YlCFKPGnS2ev5OrLUT880GlDRaQRT8Cnxpjaoczg8ecCtg5XSKYkQ08jViEXFYuq1N+17+7DdzNpGXHlE/dASRY8RJO+GmSKGrADhaSARAK6UGasmkHlLUWduroSlsOuShhTTaPZBsq0WOHKXtzc8UBPl+cYZKXK9PD8EYDKwf70kYXbSc4oAa8ewMPpm7ULI9pcLiv3jKkWc/7cw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(376014)(1800799024)(6133799003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	kQPwQczkNbvY4RNRRaKmIiZ/JlGGElXbFrIrp9sGxVXUfH2DCQ5aVGvVR2fiUozjm07muSzrACTpyNGLQeHsUkfTdfTHxqYeU/cqHyp/lFRT1ktATepktVxuACzHATeEQwniOkIeRTXfzCylnRPLL+4NQZlfF77PsmE5dOOu/NBLOO6KsRn0zWAE2RXNgMF2ZsA1FgceIhfy1RPd8zZYmaI1YO9dmH7AWDaly30F/0IfW1kf29qAQY+GopazxeWEYNJ1MQFx/NIdBlTs++UNw8VRn0PlEKaf3o0zmugF2vtNBDUfux+hBJEiyi61wIJ4QkjJ9Y0arT+4hGkNdNflKL8ueec5NmG08DgnXkz/n9sqVB4J+Lm8Mb1LxEpb3TCCYkX0iC0ksD9OZInrKOqsaZZcsLDcJMp9NAfw591xHlfqcoN3tnF4AEviog4bQ5nv
X-Exchange-RoutingPolicyChecked: 
	wfCTagWzfAEvE12L8HTrENmf9ajKlqRyzxOYm5HvlSDmpaoevaCtUX4pKqKUdGGCK7qHsOUz/HrfpHyoxI4h11qTNJtXTa6qRvp4us+ymg69RUJsO/yvwH943GFHtOauCE9UYTQEyJLJAR+cd5PfaNpMK919+PiP6SLkd/KHw4gYniBCDAea4lMhL7WjuW4fOhX1waJliqIXxzhNlhSiRO1EVhE3N3qeql54GFCHrPoCrM30oPvIV5kKLPR5H0Wf+3KBTUp/iAkeagvsJU5pNGqgOm6TI+jooOtzg0oIpz/w241wLCgRtcmWRrTgaLCdqKJw18fapAGrf+mYTHB89Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 14:56:55.4476
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8b4f7d8-968a-419c-418e-08df1982e904
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00004682.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4396
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1OSBTYWx0ZWRfXxG74AU4RU4v/
 h1uvJQ/LLADgXe8iZW/n4ihSN1qKkWI2EjbbTMGPnjumulutkKhB5B9yL/PyR9yInSujPKhRf8t
 0VfIJW2YWgJVfMJfvPXukgKEiq5TUjw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1OSBTYWx0ZWRfX7TqNkOnYPnTV
 JTjXyIdYYFcjThpxLmFqsYg+Ij8RaK616aKElojnbM1Zq6Ci3mXGZy35vp7V3YvNcYK7TO56ypq
 zDSGJ5SOuwoatpkGU3oy08JuY5wgOPFSYCLhiN+8jxoc6oiKkgPmonRoxv5+eAkqjNqIpfzXcdk
 k4OwhsXJ/WDgCEJPHRkSDMiCPcBlFQgTyPfSHm4sJvGmDio63YOFf97xamiDXUL/BhBKmMhF6l7
 YM6du9j+BdVlhnPp3lvhi4Yg4rYgEoHinWPESaF7G83rJ6Fqy6etm5C/w//GW9FfP5yoF26WFk0
 xGxccOqXYK5A7yf2Tn24uQJ7ilgzisCe0yH2dxcgKvwMrCfmexxUDJmok6kIxpgCOmIAiCesRU/
 BsEdGnft4MkZTF/nuCXcaXFcNXAW8ktvOv8Omk3CNiaJdj4jIv26uACWrD9eOFy2c7HOi/S5EGv
 vSDRrY3uQSNC5SRCgUg==
X-Proofpoint-ORIG-GUID: zVCX0FdSkNtxdWxMYt8DWPhBc-g9tyFq
X-Authority-Analysis: v=2.4 cv=TpFzFzXh c=1 sm=1 tr=0 ts=6ab3e8bb cx=c_pps
 a=bt8r0o3PvT4lvF5YbTRm1A==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=EJCTUxw7txar835kgjMA:9
X-Proofpoint-GUID: zVCX0FdSkNtxdWxMYt8DWPhBc-g9tyFq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230059
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 23 Sep 2026 14:57:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17699

Include PipeWire and WirePlumber as the default audio stack across all
platforms. This brings in the core PipeWire daemon, ALSA integration,
PulseAudio compatibility layer via pipewire-pulse, GStreamer plugin, SPA
plugins, and the WirePlumber session manager.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
Moved pipewire package to packagegroup-arago-multimedia.bb

 .../packagegroup-arago-multimedia.bb           | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-multimedia.bb
index b292502f..198b3dac 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-multimedia.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-multimedia.bb
@@ -30,9 +30,27 @@ ACCEL_MM:append:am57xx = " \
     ipumm-fw \
 "
 
+# PipeWire stack packages
+PIPEWIRE = " \
+    gstreamer1.0-pipewire \
+    libpipewire \
+    pipewire \
+    pipewire-alsa \
+    pipewire-alsa-card-profile \
+    pipewire-dev \
+    pipewire-modules-meta \
+    pipewire-pulse \
+    pipewire-spa-plugins-meta \
+    pipewire-spa-tools \
+    pipewire-tools \
+    wireplumber \
+    wireplumber-dev \
+"
+
 RDEPENDS:${PN} = "\
     ${AUDIO} \
     packagegroup-arago-gst \
     ${MULTIMEDIA} \
     ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', '${ACCEL_MM}', '', d)} \
+    ${PIPEWIRE} \
 "
-- 
2.34.1


