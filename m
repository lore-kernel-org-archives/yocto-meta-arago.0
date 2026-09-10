Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF339C79FBF
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 19:58:18 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23834.1789070297644908234
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 10 Sep 2026 12:58:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=K97sV+d6;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=l1fDsZzL;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AIPHTC3794030;
	Thu, 10 Sep 2026 14:58:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=HdY0EMwpkvdhv
	0ZP6AHuAUEOIplYLfQ1KCWMZO04GvE=; b=K97sV+d6feXhvlJf86ehivCotfK6g
	jexejBmejVGx4x+x+9ddGbdWkGakjsE7FngxhmGDgDfmh6bsKIN86NuKVNzNJzC5
	BzitgQRmVbaCdA0ouhG2iTDo38sfLqpKrCZfHA29eHIPI+Idls0lbCwo5QzvUSDu
	eNkyLq+rUqn5Ay5wFeQBab1zPW6ZpwTixERAGfVkZfIVdvlydaegza+h9t8nslk5
	3Vnedq+3+Ye9gY//NbV7iy8Q3Mg/uTulSoSIItpClif7PA002/b68k05k6ux9Dgk
	iGfp9dcvQ55PQwqiIoJ26tk6DIXV4E7jvEgxaYjG7ee9xPEZQex74EUMg==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012051.outbound.protection.outlook.com [52.101.53.51])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gkyx21csy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 10 Sep 2026 14:58:15 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Msc8yH5Sm3hSR/w0uATFiNkDscCqaP7L5McI4QrgStxCpy+g62u4vgOqyPpHVLvZjnUd+XZltWre9UvBrYgYCHYuvleTEemQQFVacLryQtqd8KibXBdkK8dgNP2g9lVQ0fD7D11saaa7dTUQWVeonLJPLZCIb5bt2acVUyr3gu83gbVd2+9tVlwiPbza0cMrNoN3GyN86A+MUmT/vS0ReaAQhnl2G50f8wukmcYbnis0IgA9q6p4+FcFIKnwtpHAwLVgkOSfFoX7ptgMvJzmcEGiHosERMItIcFE8npFen/iJRhJevYZOYZNUk8BNvkKDDxUdsSYzg1WWNRTJAhvOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HdY0EMwpkvdhv0ZP6AHuAUEOIplYLfQ1KCWMZO04GvE=;
 b=BWR+8sHx5nL5qgxFT2icdpvnFS3POufx0+mbH5424K0QJUeqmQ1JV62D0G5NrBBxHuQgti8tMdCDGR2fR+PuX8nwHhzDBntDRQEF8yn6dC9SPfO/zpqHUU6GQt87alBzNiuCa4uQkPbv5In0dKbZsLkGsC05jse2foWr1kyQaXcP30jy5wXGtiEmBJJNkC86IUW9lsZx/MbHIVvkiPn6Mk05ljaSK32laskZrgrwa/gN9axjaDhYZihINzTnN73IING5FcffBkm/LhJaALlO8lv3dpzBAc7PIgtZbYMjXQjSFbUi20DZYt+LMsu/6630xl3k18HOs9DJmUK+HgW8CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HdY0EMwpkvdhv0ZP6AHuAUEOIplYLfQ1KCWMZO04GvE=;
 b=l1fDsZzLaBkcfJWi5HQ7i5y7x9nCW0J0KPyO6c7HexGRX36HJLBviG0Dtk0ygMljiThb4kzWryqZSf83uJUtKEKqfvCyZ3535WYYm53r9FZSEbUbfBzJgN2V4dFOXrIjCCh4xKnVDI4CR07vaATUf4AEGARY5gj3Kdo34hsYB+E=
Received: from PH8P220CA0044.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:2d9::11)
 by IA6PR10MB997682.namprd10.prod.outlook.com (2603:10b6:208:5dc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Thu, 10 Sep
 2026 19:58:13 +0000
Received: from CY4PEPF0000FCC2.namprd03.prod.outlook.com
 (2603:10b6:510:2d9:cafe::62) by PH8P220CA0044.outlook.office365.com
 (2603:10b6:510:2d9::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Thu, 10
 Sep 2026 19:58:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000FCC2.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 19:58:12 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 10 Sep
 2026 14:57:23 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 10 Sep
 2026 14:57:23 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 10 Sep 2026 14:57:23 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68AJvNTd2955726;
	Thu, 10 Sep 2026 14:57:23 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1x4ktf-00000005cx0-1deA;
	Thu, 10 Sep 2026 14:57:23 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][wrynose][PATCH] gstreamer1.0-plugins-good: Move to 1.28.4
Date: Thu, 10 Sep 2026 14:57:23 -0500
Message-ID: <20260910195723.1341293-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC2:EE_|IA6PR10MB997682:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e084162-0095-45f6-a2b4-08df0f75d820
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|23010399003|376014|1800799024|36860700016|13003099007|6133799003|56012099006|3023799007|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	7SfXlCoafRZDs6hNO3NfwZqK0/EHJgsSbArhUt8KJV/8UsANyjvMoWyoNLwmz4YwohIJZroxuONakWpYWil2PG5j4RlTdXyV9KCO9mwu1Jqg4btIkmFZ4ElRWDlgnXtyJ0kMYioisIenLLecrfKCIzO2JzZGbI7+ZxkTjtq3uB8DIQBoKT3XdxzR0mgVhkdesObbLQlDTaxQLlMuQBQjQt6Yzjv8blwJ0MxReveGYeDsHN9CiQB8Y57UtuTjtN6IghMaBZ9btcClX5AP5FinVki26qgjVEHAAo/dbgfshvykrN+Txck7DTGAUU/ecqaXskWQg4w3icCrNMfD3KZsoctrqP8HhGcGymwIpN2hjAXhP3UjRwpBPISMMXv8juaNx4/DHjqEEX51fMIIyhBJLk0qqCvlDUZl4quXh8nYBJFBO9NXsAK+5cOpOtZf9w8mAV4kBkfIV5e+DShHIRkygOpNuMOQlWoue/RQmZj+PM34rLASsXytf4Y/QamYPgMe3EPhhAp1KrbaWto0jdQp9LyAJgQelLrxi+ICEb/kwihLQteyZPuoVlTFM25yxCwaz6BBRPw+qwGi/lEq01cnygjBa4RvQa/kFPexrOk2ouIJL3IhPfcPOF05VfEnFx2uCjhUvE9fS3VYIs0a/8h9TOkQjjsTYGiRjzWsIGvrXfy9FLQKah/zePbZh0Jkdzm4iae91dOeeD3tdDfxKqUQBQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(1800799024)(36860700016)(13003099007)(6133799003)(56012099006)(3023799007)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Qiu74fzFZ13jaoRuPlXVjXlBd4CEppRb7R3kHjeKkgX9YTN+MbPuLSd8OS6i85CM+951Zk4zUaElklSMV2CKwYGRT2u7Im08O+3Yt63DtE1yI4zP6KhjOceowxSGk+Xgz9cxf7PuESwj7IzTP7C0Bc1dUCp63Djga+losTJ5VAFnwKoEUwyHtkhRUEDkeFGQanupmLkZldTguyyr3LiXejWPpktHFpWhTKszso/BUC4ep9ohFH/vzOjCqwm/QJZd3DQPNO43bFROh37P/mOn5rf3tQoZIurO3Fo6UP2EfuP8vqkNxwosEPnibI9puVglVZnXyeGk83xd/fr6xB+3eI9jqMBBsxKgEuFCkoJyRgtDrfZqKwMrC9Ma9AfN7eFTw99fAFVHHaqLaenumi2zOPmA8r0sMfGgU12O8CY5GK5rzqloxxNq79EiUaMCL54B
X-Exchange-RoutingPolicyChecked: 
	4SbMLIdkDaFl593Pt9QkoeyirxsbTa2zKRuG3EP3FTyaisyVv72iseW9XMkoa3IMphVexkWfHKfBINIColb8vcIN1wRvo1Mdp9HeA+odyTrAOCaL99Z3/qWvYSy+rK1VohBmxpWQmEX0p06gh30sdGdG1yXuMk729HULHzL9SbPCpjdJlbHQVWF4vc/gV9soMC7vvdQ19WE0ZafjefFPDlf2f07UBxXuU0uJF3Ym+tnxSdgvYyHjkYwxQmNg08ABseO/Ej1flfBKDAdLxXVijCY3AoqPKRiy42w/voOI8nKg7Q7MbllV5hTRs5HFz9flmZixG06ALIbnFpq5MJvaxA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 19:58:12.0680
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e084162-0095-45f6-a2b4-08df0f75d820
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000FCC2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA6PR10MB997682
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDI0OCBTYWx0ZWRfX5566e0ir3KLN
 MfBl/Sz7dgHpuFhz5aNiuwGAzNMflIRqAPFL7/wP/opYu70czZyjH9yNul+Ol3a05SGwVsNh2rB
 uYp/fkqjZXKcvTGUsf5HCKlA7OyyKkk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDI0OCBTYWx0ZWRfXzdlyYUQO315U
 gJWODFfVilpSM4Pj1vKbjRT9I2XoVJ1uWBUO4V6CTQkUTK6OkAKMdsapX+a+p0q7eeLuTqqa2dX
 lJR6aKIsOA3HuTNnaKmipidNVtHMW7UNTJQ082NbXZWOn54RRjr2JRIXM4ElEek0zWN6adzd6dK
 3VMA+jm4Yg8d3mmRaFOy8nmxboCcrgkP+kWTjXQV3rPubHnZOsOJSCpXIK4StZylyB1cUm7gnNe
 570octKrCpNcM9sqfoZo++wtQysslvGiouaZQS1vlMqNj0aydbskSVWSMuLUwetTO4hTcuJY1Kj
 JGYcvuwjXIn7ODdhpZblvjk1Co0sKrWB1n00pIUfex0Hxex33DEfNWzncopzv0T7o09jRmQlhvQ
 B5S381lrSv2YSSD3GlxlF9ACld9CDvEI/psUGcKgM/n+xG9w64+lbD+de/bMi3zBZ+xE72A6lHs
 e5821ANi2MOTpP13L2Q==
X-Proofpoint-ORIG-GUID: Y8tCY5hSQKAOh6Owfpgn3VzE0GS8RDx4
X-Proofpoint-GUID: Y8tCY5hSQKAOh6Owfpgn3VzE0GS8RDx4
X-Authority-Analysis: v=2.4 cv=UJ5Ijyfy c=1 sm=1 tr=0 ts=6aa30bd7 cx=c_pps
 a=Q0mMAVO0nY0JadJ+SMvTrQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=Q4-j1AaZAAAA:8 a=sozttTNsAAAA:8 a=KWvlojpNHRZ8j1zzLcAA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_06,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100248
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 10 Sep 2026 19:58:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17664

A recent version update in oe-core [1] has bumped the version to 1.28.4.
We need to update one of our patches to match the new code base.

[1] https://git.openembedded.org/openembedded-core/commit/?h=wrynose&id=810339318721e08a69231c475153cef2e74fe131

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../0003-v4l2-Changes-for-DMA-Buf-import-j721s2.patch     | 8 ++++----
 .../gstreamer/gstreamer1.0-plugins-good_1.28-arago.inc    | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0003-v4l2-Changes-for-DMA-Buf-import-j721s2.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0003-v4l2-Changes-for-DMA-Buf-import-j721s2.patch
index b4622fd6..e369eaca 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0003-v4l2-Changes-for-DMA-Buf-import-j721s2.patch
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0003-v4l2-Changes-for-DMA-Buf-import-j721s2.patch
@@ -24,7 +24,7 @@ diff --git a/sys/v4l2/gstv4l2bufferpool.c b/sys/v4l2/gstv4l2bufferpool.c
 index d85f036..e6a60dc 100644
 --- a/sys/v4l2/gstv4l2bufferpool.c
 +++ b/sys/v4l2/gstv4l2bufferpool.c
-@@ -83,7 +83,7 @@ enum _GstV4l2BufferState
+@@ -92,7 +92,7 @@ enum _GstV4l2BufferState
  static void gst_v4l2_buffer_pool_complete_release_buffer (GstBufferPool * bpool,
      GstBuffer * buffer, gboolean queued);
 
@@ -33,7 +33,7 @@ index d85f036..e6a60dc 100644
  gst_v4l2_is_buffer_valid (GstBuffer * buffer, GstV4l2MemoryGroup ** out_group,
      gboolean check_writable)
  {
-@@ -1584,11 +1584,22 @@ gst_v4l2_buffer_pool_complete_release_buffer (GstBufferPool * bpool,
+@@ -1624,11 +1624,22 @@ gst_v4l2_buffer_pool_complete_release_buffer (GstBufferPool * bpool,
              gst_v4l2_allocator_reset_group (pool->vallocator, group);
              /* queue back in the device */
              if (pool->other_pool)
@@ -62,9 +62,9 @@ diff --git a/sys/v4l2/gstv4l2bufferpool.h b/sys/v4l2/gstv4l2bufferpool.h
 index 60340c2..cec4207 100644
 --- a/sys/v4l2/gstv4l2bufferpool.h
 +++ b/sys/v4l2/gstv4l2bufferpool.h
-@@ -124,6 +124,9 @@ gboolean            gst_v4l2_buffer_pool_orphan  (GstV4l2Object * v4l2object);
+@@ -124,6 +124,9 @@ void                gst_v4l2_buffer_pool_enable_resolution_change (GstV4l2Buffer
 
- void                gst_v4l2_buffer_pool_enable_resolution_change (GstV4l2BufferPool *self);
+ void                gst_v4l2_buffer_pool_release_buffers (GstV4l2BufferPool * pool);
 
 +gboolean            gst_v4l2_is_buffer_valid (GstBuffer * buffer, GstV4l2MemoryGroup ** out_group,
 +                                              gboolean check_writable);
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28-arago.inc b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28-arago.inc
index 9e418b86..a2204efb 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28-arago.inc
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28-arago.inc
@@ -1,11 +1,11 @@
 FILESEXTRAPATHS:prepend := "${THISDIR}/gstreamer1.0-plugins-good:"
 
 SRC_URI:append = " \
+    file://0001-v4l2jpegenc-Add-support-for-cropping-in-JPEG-Encoder.patch \
     file://0002-Adding-support-for-bayer-formats-with-IR-component.patch \
     file://0003-v4l2-Changes-for-DMA-Buf-import-j721s2.patch \
     file://0004-v4l2-Give-preference-to-contiguous-format-if-support.patch \
     file://0005-HACK-gstv4l2object-Increase-min-buffers-for-CSI-capt.patch \
-    file://0001-v4l2jpegenc-Add-support-for-cropping-in-JPEG-Encoder.patch \
     file://0006-v4l2object-use-actual-stream-resolution-for-encoded-.patch \
     file://0007-v4l2object-Attempt-non-contiguous-if-contiguous-form.patch \
 "
-- 
2.43.0


