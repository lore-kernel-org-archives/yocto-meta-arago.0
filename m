Return-Path: <y-hegde@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65983C43458
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 09:32:26 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5404.1783589544399133762
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 09 Jul 2026 02:32:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=mO4Y4wat;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=qXNMjjYW;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: y-hegde@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6697cdlD435673;
	Thu, 9 Jul 2026 04:32:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=skU6yfrV3yN7n
	xhq0eDt7QyerHKAQT0KBS8Q80Lt3VU=; b=mO4Y4wat2M/JLjxJTjZW4oDrRRiZR
	dzqc9vDsYBPNgdgICLQfPUn4C4NfXI5nBipzGDguAb3yqDr1D2EJ+Y4N6IL67T0o
	CUZNPDVzYjhmf12h257P101rSU33ApHev1JD6cAKKbn782CUVdjiKH/W++/ULoij
	jMJrODZ/MGfJsYYHZzBEoYhNsOC6TENxd9Be9B8ngZwlaGcC9QqhvjdFLcJuCKoe
	3O2Eyo5yw+aSfHhkkeECOljWMabJve0CdgIXajyIaasdN539Rx1JfBcInkNchbdq
	hl0ti73satCt2c7alVG+5KAR8PpCvKudYVQraEhGubh/eKkgt5vGAlndg==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010042.outbound.protection.outlook.com [52.101.201.42])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fa1962uj6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 04:32:22 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TdQwamy1jBVwaJnlHrmnKi2NJXpJcFO0ikKOvr1FBdPxfkbF+/LS9fuNes8FKJ557CsvLn1en0vFNmF1baBdWq7Gp1eiKoxiZ5Ud/XWU6IpC1XPdzrIp2gr//Y2o6t1rR8KQVOvC3L4Hgw56zrLCkCEER7Rhw0RWFoPJ59XWEKSCdFQOlScSBvjRC/VDgWf0J2U6vdCxLVyW+152XFMg5NwjJCi2UfPm8rZbj+leMvKmuwRNA78odJzrRNX3FBHVRZS6w3ChvHKU6vebEfF4yC5kEUXf2zZuWhyJN/xm5Uto+PaLn1pyIojhx6X8p27ak9qSTB3zQGX0i1mKE01Yqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=skU6yfrV3yN7nxhq0eDt7QyerHKAQT0KBS8Q80Lt3VU=;
 b=EksHgXnCdB0udL6b4qc9bm2xzdM8IJ/k3aS4e/j67PAxlfbHZX3V7cMAcJUqfHcmXE39hr0Bfclzsq2lbwyRvJOatwqbtJrgba2K0Day16a3As7aBdsBjylpcse67PYU73l3X2KgR7bp4obnVPu7rHYb4kbFAJdIrEdWOTJCUCAiIEmJQOjbqqd1GJPlpvkGYv99LzqANyDmWl48ouhM2OH6h4G2eTbanDxORaLv/yyJfoZl4/54emt8upBIue6gCl0v5hY/4u6CQhHRWwacW08lgEqmxXBXKN1QqPu0bVkhcrZY0dXW534a2lBAMS/AWZ+scy+i4yIA6f4Bz/eHJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=skU6yfrV3yN7nxhq0eDt7QyerHKAQT0KBS8Q80Lt3VU=;
 b=qXNMjjYWJK84y68ajWEUEq+Mfm36PwpxfgAsZ809hoUyTe8tZlPIcJ1DGa9MTrDPM5IE12EoG9BxNXanyQuu1LVA6Vhwz0+V+RPmCXYuh53J+ezu7wXwOW3GqhoJeJDmkMjADNxDdYfkkr4CHiVy9Q6Usg+lcVsFVSPg1mtGN0A=
Received: from BLAP220CA0014.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::19)
 by CY8PR10MB7193.namprd10.prod.outlook.com (2603:10b6:930:76::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 9 Jul
 2026 09:32:19 +0000
Received: from BL02EPF00021F6E.namprd02.prod.outlook.com
 (2603:10b6:208:32c:cafe::a7) by BLAP220CA0014.outlook.office365.com
 (2603:10b6:208:32c::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Thu, 9
 Jul 2026 09:32:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL02EPF00021F6E.mail.protection.outlook.com (10.167.249.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 09:32:17 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 9 Jul
 2026 04:31:46 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 9 Jul
 2026 04:31:46 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 9 Jul 2026 04:31:46 -0500
Received: from localhost (yogi-work-pc.dhcp.ti.com [10.24.51.123])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6699Vjnw923208;
	Thu, 9 Jul 2026 04:31:45 -0500
From: Yogesh Hegde <y-hegde@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <praneeth@ti.com>, <prudhvi@ti.com>, <j-sahu@ti.com>, <c-shilwant@ti.com>,
        <denys@konsulko.com>, Yogesh Hegde <y-hegde@ti.com>
Subject: [master/wrynose][PATCH] systemd: drop 15-eth.network and consolidate eth interfaces in 10-eth.network
Date: Thu, 9 Jul 2026 15:01:41 +0530
Message-ID: <20260709093141.3785706-1-y-hegde@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6E:EE_|CY8PR10MB7193:EE_
X-MS-Office365-Filtering-Correlation-Id: 3918be69-6500-46ee-fd53-08dedd9cf7f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|376014|36860700016|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	webgm7ZRddwSbP2swVfWAMTrk/0n3WJllmi4pOmW9oV/xkJnpGB0yauaumlWjkKQxUgscGl9bIGz4h6pqTa8qrxTfhJuyremtqsTrvnKXuQDGUknlEPet3Mqg6c0b3wRX0hgptnvkeJ9+Vln97SDFQysvzbAMoJ4+Z3IvaTJh5tOPystY/YYriegTrkZi1HBpJJiXx3kkm9E2T11gFw22nN6ObkTRAT7zBTzZQKu4NCMK0DQsLvdfHWf21vwRzqjfpxI6D9mnSZrz5VtWiJ37dv6xu7jRgzGXohus7LXmehfbOyJS88VFi2TLjwrALZVxkCk0ZjKKdDogS64N2mvTtZy6qOjC+DXmSelZm+0t8o49kKiuO/gqV2K2jsfvUDBZ7/8pLrTBY8t3Sm68tj/YHISplr4TREXhFeAXUKyE38vVg2rVkTaitRoyojrqZPnuQInpvFiBO+We62ZFfybEZ9nWM0cd0EogmC75GkmctubTveAQkHW+IbTFL4FgQm8d11hwzMJJtcv8zDDAB2G9zaBI0cgL23ptQ2cFgoFV6dCzGzT5pvw65qkQu0lblgab1v1nCoG8R5LQUcXdHFodHiLk9MEbCIKM5KAjePUM4SslcwtLQR2Ez0YAzKUR+s10XsnV9U+6ADNuelFFUa2kZ9ciqhfFUiAfXFYvun7buKfvf53Lc0cfoScxRu3NITcSermfdvbVeGhJAun/O92sw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(376014)(36860700016)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	CpEOElSMen3sV4ZJYxRft8KI4J0SC22Cb/COss1tBIGqJmZ4yePm6PcCIoCHz6TRaya9IeLVZlZ8TSX98mcYoER/EUXfViXvxvRHRBvbLiZwgU4nHFJIrFPc1nqDnWRU73D51lIm2O2PpPyH+o5XAN8GfxaOmROtbpL8R2ypflT0kMVNSAVZSm1Bzju2xNPqZecqR7JV8qggHZebZvzk9QIm1lb5G226DMuFGO0IsSXX4hQEyq3Sv0yr/i1F6Kwv8n+vGXK7R1rmP5yEDLLyWRR2k2+TijsaDcfvIkeZ8wVa2CrzFimGDENjezdlvPT/dZq3/qoGel2zjPsyyDLc/f6QeTN4eJZ1t/irzh+mSk3pZ4O9rFTIrffTQXBphFPwrBJXWA6939DGvwx2ikkdKB9gqrD2rhosyXKpfgDrCZ5QWGOT8jACjUfxrWtktvyO
X-Exchange-RoutingPolicyChecked: 
	ED2Ovy689C43GXL7Czzzhn9K353pE12eUD8Hu6rQM2AHVodPg2FooIsJbmgI+o08PeCN0whfhV2RokWRVeW+603/V4vBfFfSgc58T2uerLkQTKUZXUsBFJItFTwYXOt/T7qZgZkCzYrQQJGoMCqGiiXaw+O06YNupAOGw9kCMHhP88FS479k1Au4jd+5LVIGaHC64IUPJM1yyKYFr8SmS0lSlAnIPgJ2svh2gN1wAaJGqn7WjSW6sU7IMFapikbItoKDhmMEiASal0VhAzUcDf9DIc4W+m1cYTCHLD7gwc9oQP4GFVdzjhuVZAi4hc3DFYMaOqC9hKuZHC9cmIqxqg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 09:32:17.6577
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3918be69-6500-46ee-fd53-08dedd9cf7f3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00021F6E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7193
X-Authority-Analysis: v=2.4 cv=Q//iJY2a c=1 sm=1 tr=0 ts=6a4f6aa6 cx=c_pps
 a=/Dg/agRq+0IGp9KZEOxzXg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=lSQgTcT31mFcMGne69sA:9
X-Proofpoint-GUID: -saznK3v2YKu9RsqTM1aD-eUGduKcYDj
X-Proofpoint-ORIG-GUID: -saznK3v2YKu9RsqTM1aD-eUGduKcYDj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA5MSBTYWx0ZWRfX9vLXW99Vrso+
 tnzZ8/ydt/k7laU3G1jNgFLHduT+8E0L7rdJ51Hzby0bfhvSCi7SNIZr0EZr7BLzw6cHIjdwXPa
 eGX1nX95s1b2Ts42HjepufWC2ys1etY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA5MSBTYWx0ZWRfXw5V+WTdvfYZE
 kirGuXM06W3rEFYCSVdgcWAUVXMnjSHjSpm1AwO7kA+K4GIQzdUZwqgKtXsPelEzpPy2gpDn370
 JjTnd1be9xJYtDwtua+UG/9WxVZl5YPwSXokDBohZrWAX24HNvcrR5+r1zmzvrjMk0YLFW+hLmd
 3XItIhSMYWk2C8eBli5rnNKP9UyGZIwBPnCgGppMhWDDTW/hg7acX/kR14iP6j/sdFWy03iqFBf
 9D8NyYPoiBhdXRjXyq28rGMrRl5eCNw7lKKuGxcpPqVUPcCe5oJTUdtJS+ttiigxceI3fzaD7VC
 Za0uCrARPvQ+773fdgAXneaiaZLYJfkUuBgnM/+7RJEBUaSFdMhnr9Bs4BQ6qQEcQB8setrjl2Z
 3m1wD8QZXVjo7dzpPds/VIm/DEzbVZuIqb3cMzapK1sFTDkh2lO2RgELI88evNkji/XuirC5lEJ
 QWj+a7Pi1noYGc0XI5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 clxscore=1011
 spamscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090091
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 09 Jul 2026 09:32:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17586

With 15-eth.network systemd-networkd ignores non-eth0 interfaces for
online detection, causing systemd-networkd-wait-online.service to stall
for 2mins even when ethX interfaces was already online.

Commit 9289107c addressed this by passing --any to systemd-wait-online,
i.e service exists as soon as any interface comes online. This makes the
commit 513e31b4 - marking ethX interfaces as RequiredForOnline=no via a
separate 15-eth.network - redundant.

Signed-off-by: Yogesh Hegde <y-hegde@ti.com>
---
 .../recipes-core/systemd/systemd-arago.inc             |  2 --
 .../recipes-core/systemd/systemd/10-eth.network        |  2 +-
 .../recipes-core/systemd/systemd/15-eth.network        | 10 ----------
 3 files changed, 1 insertion(+), 13 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-core/systemd/systemd/15-eth.network

diff --git a/meta-arago-distro/recipes-core/systemd/systemd-arago.inc b/meta-arago-distro/recipes-core/systemd/systemd-arago.inc
index 3ca38edc..cfd41b1d 100644
--- a/meta-arago-distro/recipes-core/systemd/systemd-arago.inc
+++ b/meta-arago-distro/recipes-core/systemd/systemd-arago.inc
@@ -4,7 +4,6 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/systemd:"
 
 SRC_URI:append = " \
     file://10-eth.network \
-    file://15-eth.network \
     file://30-wlan.network \
     file://60-usb.network \
     file://timesyncd.conf \
@@ -14,7 +13,6 @@ SRC_URI:append = " \
 do_install:append() {
     install -d ${D}${sysconfdir}/systemd/network/
     install -m 0644 ${UNPACKDIR}/10-eth.network ${D}${sysconfdir}/systemd/network/
-    install -m 0644 ${UNPACKDIR}/15-eth.network ${D}${sysconfdir}/systemd/network/
     install -m 0644 ${UNPACKDIR}/30-wlan.network ${D}${sysconfdir}/systemd/network/
     install -m 0644 ${UNPACKDIR}/60-usb.network ${D}${sysconfdir}/systemd/network/
 
diff --git a/meta-arago-distro/recipes-core/systemd/systemd/10-eth.network b/meta-arago-distro/recipes-core/systemd/systemd/10-eth.network
index aad5e194..fdde1fe7 100644
--- a/meta-arago-distro/recipes-core/systemd/systemd/10-eth.network
+++ b/meta-arago-distro/recipes-core/systemd/systemd/10-eth.network
@@ -1,5 +1,5 @@
 [Match]
-Name=eth0
+Name=eth*
 KernelCommandLine=!root=/dev/nfs
 
 [Network]
diff --git a/meta-arago-distro/recipes-core/systemd/systemd/15-eth.network b/meta-arago-distro/recipes-core/systemd/systemd/15-eth.network
deleted file mode 100644
index 0aa8b22d..00000000
--- a/meta-arago-distro/recipes-core/systemd/systemd/15-eth.network
+++ /dev/null
@@ -1,10 +0,0 @@
-[Match]
-Name=eth*
-KernelCommandLine=!root=/dev/nfs
-
-[Link]
-RequiredForOnline=no
-
-[Network]
-LinkLocalAddressing=ipv4
-DHCP=yes
-- 
2.34.1


