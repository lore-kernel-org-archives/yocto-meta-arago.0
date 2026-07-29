Return-Path: <j-sahu@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D16F6C54F51
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 13:53:41 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11945.1785333214756072548
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 29 Jul 2026 06:53:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=KD8uQ8b9;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=Zfl7ZBNg;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: j-sahu@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TDAsK02827294;
	Wed, 29 Jul 2026 08:53:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=5ZFkcq6Dc4Asw0fFdwapnKxLx/4XCcXp7Oy3PxsRG
	e0=; b=KD8uQ8b97QQqPIW4WZqTjba0uLsjco6u4kn/w2J6rsjGh03C1ysPbrbQ7
	x0x9s828eFuf9iAsVv7PWGBAfY4vfeMjEkq3gX+Hup9RqBU+t/+mPjDXycZIstfn
	/4s8hCMPsLezR7Mh0GMBQiKBFE6rWIOLLyiYn4ZtIz8wznC19QjgPsWguslLDiqg
	ivWvP3N8oOYs5Xxf/OvLAGZ1YhQVill6mnDYMPdoY72InaJJha0Llra0hHu23/3l
	4d/tnbRp8oMVymJ5kavHRZmaUl0pKrYuTlVcas5lrQJN5rwVz3wP2JmRkPRjB6FG
	AhfykbGfzRrq1qxo1vWwXMJ1e2qag==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012038.outbound.protection.outlook.com [40.107.209.38])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fqh2b8mrx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 29 Jul 2026 08:53:32 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NQ69UkWwkByH9eDRBAsFkI547z3XFubDYnMfPrpvtUs+om1QEqphrQPt3xHS6RK3HLxIRuxICBrW7KHereAcJRZ4iddaeMc4NUu0WQ0+4YmQNnog8/PrSyJbtQoMaCmkg7fyWUoTpOJvS/yEhM6W8gs7e8ys5t1BwI2SwbYArKxKPDs6y7gNOYNKvz9lhWPVAje+hsQu048wqXXJ8eJr79+eLLsa9SG1KWDWzGmxxK622GuOy/5ZkWnuktDd+jAh1gyNZooRiBvGbrLv5e/3nRV3wM+KWHSVawMDUQ40Mlr8HFmiNih5sYwsSJEdVDXmNQFbQWcYau+VgViZjXQVBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ZFkcq6Dc4Asw0fFdwapnKxLx/4XCcXp7Oy3PxsRGe0=;
 b=tgiBh6xUWbm5PUgst+GFdfID/LuRo3DIxhTBrJTdt+QYG6qO9ALMUY3Pg45Ev0ngQ0x63HOUQKF0ULIGbViTFEdTCsCk3pd47k2PC3Z6YcL790xShf0ZyJw7K49aMd/xcaw82+V8Uv/F9XjXOIDuxwNm/J+VYozPywFgo0eAEoRbcSxtBh/jslhcLsOeYvlSaH+e8SB5H3vmAnybubdykzt3N+zmf5TLGWBXPGn0z+kGlb2I0MdW+13j/cg47EBmkyATNei2EP800tzbyeNTorvDTy18kOf1g9LunZwU5uyvWAVaM1NRTDL8TNOYSSL/mNkiPd/SAsKj3gThhmNVGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ZFkcq6Dc4Asw0fFdwapnKxLx/4XCcXp7Oy3PxsRGe0=;
 b=Zfl7ZBNg1LwthgPoHkAQ98OU91vQzStygSsh215TbLIqjoQP0Rvg+X4lT4lTBDZ76fCXb8xnnpEafjWKMOF3wKao/Cgippc/81ESKUPAgXut6zc0gxXo33SBsGTq3jkf57pPpv15GOnW4R/ogvd4/9iTJ8n8ps5nKs8FvBQriKI=
Received: from DM6PR21CA0027.namprd21.prod.outlook.com (2603:10b6:5:174::37)
 by PH7PR10MB7718.namprd10.prod.outlook.com (2603:10b6:510:30d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 13:53:22 +0000
Received: from DS2PEPF000061C7.namprd02.prod.outlook.com
 (2603:10b6:5:174:cafe::9d) by DM6PR21CA0027.outlook.office365.com
 (2603:10b6:5:174::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8 via Frontend Transport; Wed, 29
 Jul 2026 13:53:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS2PEPF000061C7.mail.protection.outlook.com (10.167.23.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Wed, 29 Jul 2026 13:53:21 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 29 Jul
 2026 08:53:21 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 29 Jul
 2026 08:53:21 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 29 Jul 2026 08:53:21 -0500
Received: from jeevan-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (jeevan-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.50.159] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66TDrGLY748174;
	Wed, 29 Jul 2026 08:53:19 -0500
From: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
Subject: [oe-layersetup][master][PATCH 2/2] configs/arago-wrynose-*: Update meta-flutter branch to wrynose
Date: Wed, 29 Jul 2026 18:54:08 +0530
Message-ID: <20260729132408.2783245-2-j-sahu@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260729132408.2783245-1-j-sahu@ti.com>
References: <20260729132408.2783245-1-j-sahu@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C7:EE_|PH7PR10MB7718:EE_
X-MS-Office365-Filtering-Correlation-Id: d994720e-4ee2-4820-ba10-08deed78c096
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|23010399003|36860700016|10067099003|56012099006|22082099003|18002099003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info: 
	jdAep/XMBzJUc3qmwIyj24Kbis8PKZCUivOIqpNAZOeU6b2lsOc2AWi6y5L7UkUYyJaViorfhfbNE2rA9bXV1elFCNjq+EupkwD4Z9JqqLe5Gr46NkZwwlqwCr6VlnXUytVih7Oh9a2ddWoWKQTp39rDzNv6aN07Y2G48hUzBe3RTQKaI6nMXLYj+P6Cv+mYKg63+vfZ3CAt/yFV/P9zB1TKXiEnPcFqNVRyFNeCCpjsaM0/v8wgDFC63zESl+sYq1ho9gn+0wySFekx1UAzQi6BTLWsWOHv1ktBZClxZVzYm/M23XczHh0Yx768+JIA2RP9GCJ7gr8HcUvVFiKCl9T6JdnGJiXWrXCWZvSylK1k8xpYfoJFwxP6bkE1GJp1G484rhoCoYtSQwOkjpLhqAMypnRwG2HOpPr8RiYaxp4Fn42sCwl/D8rU5m5rG6Yu7aX9OxApCRCV7XnJgBqc18A2/XdZX3fQnOqE9O/4vGOQUrUokRxHvwo2ntY6MF9BHrrYuKHpLBZ0xtmFCF+8a8MbxaWq5emo+pGkfLD91bHndk+q/Ps3L78J+y05Yb9a8uv8Ny7RFP9IExWfOyVgpu0JoCrZKWLBaRm2kW5VScu5OjA5CINou4UEpzsHPaLRvYkzHgS3Bd8IfFvqjFg4bQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(23010399003)(36860700016)(10067099003)(56012099006)(22082099003)(18002099003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	oAx74pdXt7pgE9ugFd3S4ldYMJ1+yhHX1g07jRBE7i3cN8Xq0aaXi9h2Q3DT7mbkt+igm9V6or3rYvfM9g+3HOTdRWiWUqaQ0+G39A79M2mAp90gVns9LlF4oEUEjeW/Q5gryy/DgxVtV9tTPLAwyh7TZkR9UPx6LoXPTQtUv8Gbtc0O/dYzbch2troOdWKg/isECFJOeCMOaR49oPKPOE+nQulYaEptZ3h2jCxVm285eiNN2aDjZHEB1d2cwAdVafHJHu4PlHEKaLzBaLobbbBM/pzHK8ci5FFwIp/Giny3zQjE+I3UkvPPdVFs029Jd1YqKjF8GpYqIaMz/qyVyoTDv0I6bvuoiaU5MZKa2B+i+Z91m0pi1GsGM+D11gJ6UpnBMQfWsA46PyVx3ZY/x+XAIHR8pqiO+wf8hL0LfMKkGWLFqYJDwPohdPU3bee4
X-Exchange-RoutingPolicyChecked: 
	I5WqdueUcfaSA0zdLHI8CIiyoOkgF2ItmGOE68tdkeG/QTYcrYPQZvzUXdL8r+QW2ImtMT2wKM+pwWNNI4sGOvWMf30Pxn1o1Wj7NzerZjhhvRVLarnT24Ei54gBZh9nS0gs16B6Kc+JJy/Xz1UJtf0YU2tivPVSQN5KTi09+0bP8DPb3s+iNGL6ekriDoyYwxJQnCzhZE1y5s233keafAyxfc42knUq9j2LnCirAV8JT0+2rXgPd4vVlmmOcnhYK9dUftIbZfNY2YfadPAyHP9HUzm2ATn5V+EOtgcLPpeYSGdNe0mTl/p5e1irae/7xyhEZI42KkAHG64HABriYg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 13:53:21.5179
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d994720e-4ee2-4820-ba10-08deed78c096
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF000061C7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7718
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDExNCBTYWx0ZWRfX5bxcgQ6s270D
 kC+ARafjVpKrpd4hCVeQB5SBP/Jiv04OS/CtUOAqn1SXrYKr8PUjqhzydc5koVNl4mEo/a9Yw7A
 tVjljQrOuBy6yD0osH+Zogmx1Jyosds=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDExNCBTYWx0ZWRfX9XoYE7bdJguH
 I7BLN9W6Ez2U7ZACvc7LtKSkGmBxxP2dBobI+fBn3p/4Fk3Wrj8SAUNkznoILDPxs4uwBODcAGU
 znKpcDXe2+hqyah/wbVoOo1ATXbP59wSJinBO25g4oJU4y2J/VvMo7Daqq40vkLXTpT+9m7T3dv
 DrpwDeCFZPxIRsaRt+/BJ1h4UaIb5sYvJLPh+rbORmAAmzAqle6CLOavbnZvZCMTz5j/IAK6brE
 9/My4ZN/kZM6oPu47y6PpnRN/H2PBnHpi3kAVubhJR0Hmb3iCDSaJPQ3lQI8AUE0WiknDzs1IiZ
 4hezUUTSe2O3u19Dtx5k7Z0ZXmnbARaOHO0iOJU2PgMh385oQzr4bye7pOTVF47jllvAIqgjoYd
 k3konP+ff3FgfGMrLjVJleuxnCcutMbwA/yFGsp9alp5t9PKT2LfymY8zt1hMZ2s8dFXhKB+K1v
 5B2a8QUT//fSh2Yw+Wg==
X-Authority-Analysis: v=2.4 cv=dcywG3Xe c=1 sm=1 tr=0 ts=6a6a05dc cx=c_pps
 a=YpUwD7Le0KImUpHpM7zjfA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=iGHA9ds3AAAA:8
 a=WNDY76dxAAAA:8 a=sozttTNsAAAA:8 a=s0WAETm9y1zXLlR9Zz8A:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=HFDSX3BADwN2sFIQuyTb:22
X-Proofpoint-ORIG-GUID: qgN8tzj1pcKYmnJ8FuDDLnnx13RWYtDT
X-Proofpoint-GUID: qgN8tzj1pcKYmnJ8FuDDLnnx13RWYtDT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_05,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1011 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290114
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 29 Jul 2026 13:53:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17598

Update meta-flutter branch from master to wrynose across all
arago-wrynose configs as the wrynose branch was created in
meta-flutter that can be used for testing wrynose builds.

Signed-off-by: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
---
 bitbake-setup/arago-wrynose-flutter-config.conf.json | 2 +-
 configs/arago-wrynose-chromium-config.txt            | 2 +-
 configs/arago-wrynose-config.txt                     | 2 +-
 configs/arago-wrynose-flutter-config.txt             | 2 +-
 configs/arago-wrynose-luks-config.txt                | 2 +-
 configs/arago-wrynose-next-config.txt                | 2 +-
 configs/arago-wrynose-selinux-config.txt             | 2 +-
 configs/arago-wrynose-wip-config.txt                 | 2 +-
 kas/arago-wrynose-flutter-config.yml                 | 2 +-
 src/configs/arago-wrynose-chromium-config.xml        | 2 +-
 src/configs/arago-wrynose-config.xml                 | 2 +-
 src/configs/arago-wrynose-flutter-config.xml         | 2 +-
 src/configs/arago-wrynose-luks-config.xml            | 2 +-
 src/configs/arago-wrynose-next-config.xml            | 2 +-
 src/configs/arago-wrynose-selinux-config.xml         | 2 +-
 src/configs/arago-wrynose-wip-config.xml             | 2 +-
 16 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/bitbake-setup/arago-wrynose-flutter-config.conf.json b/bitbake-setup/arago-wrynose-flutter-config.conf.json
index cecbec1..1605a13 100644
--- a/bitbake-setup/arago-wrynose-flutter-config.conf.json
+++ b/bitbake-setup/arago-wrynose-flutter-config.conf.json
@@ -42,7 +42,7 @@
             "uri": "https://github.com/meta-flutter/meta-flutter.git"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "meta-flutter"
     },
diff --git a/configs/arago-wrynose-chromium-config.txt b/configs/arago-wrynose-chromium-config.txt
index 3ac2ecc..6f7aad8 100644
--- a/configs/arago-wrynose-chromium-config.txt
+++ b/configs/arago-wrynose-chromium-config.txt
@@ -3,7 +3,7 @@
 
 bitbake,https://git.openembedded.org/bitbake,2.18,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,wrynose,HEAD,layers=meta-arago-distro:meta-arago-extras
-#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD,layers=.:meta-flutter-apps
+#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,wrynose,HEAD,layers=.:meta-flutter-apps
 meta-browser,https://github.com/OSSystems/meta-browser.git,wrynose,e07817d8f8ada5340347c34f1ac6d5ee68eaa5ff,layers=meta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,wrynose,HEAD,layers=
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.11,HEAD,layers=
diff --git a/configs/arago-wrynose-config.txt b/configs/arago-wrynose-config.txt
index ad467c3..7fcb52b 100644
--- a/configs/arago-wrynose-config.txt
+++ b/configs/arago-wrynose-config.txt
@@ -3,7 +3,7 @@
 
 bitbake,https://git.openembedded.org/bitbake,2.18,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,wrynose,HEAD,layers=meta-arago-distro:meta-arago-extras
-#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD,layers=.:meta-flutter-apps
+#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,wrynose,HEAD,layers=.:meta-flutter-apps
 #meta-browser,https://github.com/OSSystems/meta-browser.git,wrynose,e07817d8f8ada5340347c34f1ac6d5ee68eaa5ff,layers=meta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,wrynose,HEAD,layers=
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.11,HEAD,layers=
diff --git a/configs/arago-wrynose-flutter-config.txt b/configs/arago-wrynose-flutter-config.txt
index f25f2d3..9f76aae 100644
--- a/configs/arago-wrynose-flutter-config.txt
+++ b/configs/arago-wrynose-flutter-config.txt
@@ -3,7 +3,7 @@
 
 bitbake,https://git.openembedded.org/bitbake,2.18,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,wrynose,HEAD,layers=meta-arago-distro:meta-arago-extras
-meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD,layers=.:meta-flutter-apps
+meta-flutter,https://github.com/meta-flutter/meta-flutter.git,wrynose,HEAD,layers=.:meta-flutter-apps
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,wrynose,HEAD,layers=
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.11,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,wrynose,HEAD,layers=
diff --git a/configs/arago-wrynose-luks-config.txt b/configs/arago-wrynose-luks-config.txt
index 3975779..46feae2 100644
--- a/configs/arago-wrynose-luks-config.txt
+++ b/configs/arago-wrynose-luks-config.txt
@@ -3,7 +3,7 @@
 
 bitbake,https://git.openembedded.org/bitbake,2.18,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,wrynose,HEAD,layers=meta-arago-distro:meta-arago-extras
-#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD,layers=.:meta-flutter-apps
+#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,wrynose,HEAD,layers=.:meta-flutter-apps
 #meta-browser,https://github.com/OSSystems/meta-browser.git,wrynose,e07817d8f8ada5340347c34f1ac6d5ee68eaa5ff,layers=meta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,wrynose,HEAD,layers=
 meta-security,https://git.yoctoproject.org/meta-security,wrynose,HEAD,layers=meta-tpm
diff --git a/configs/arago-wrynose-next-config.txt b/configs/arago-wrynose-next-config.txt
index c82b29c..1f3af6e 100644
--- a/configs/arago-wrynose-next-config.txt
+++ b/configs/arago-wrynose-next-config.txt
@@ -11,7 +11,7 @@ MOTD: NOTE:
 
 bitbake,https://git.openembedded.org/bitbake,2.18,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,wrynose-next,HEAD,layers=meta-arago-distro:meta-arago-extras
-#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD,layers=.:meta-flutter-apps
+#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,wrynose,HEAD,layers=.:meta-flutter-apps
 #meta-browser,https://github.com/OSSystems/meta-browser.git,wrynose,e07817d8f8ada5340347c34f1ac6d5ee68eaa5ff,layers=meta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,wrynose,HEAD,layers=
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.11,HEAD,layers=
diff --git a/configs/arago-wrynose-selinux-config.txt b/configs/arago-wrynose-selinux-config.txt
index 4f7983c..fc751ef 100644
--- a/configs/arago-wrynose-selinux-config.txt
+++ b/configs/arago-wrynose-selinux-config.txt
@@ -3,7 +3,7 @@
 
 bitbake,https://git.openembedded.org/bitbake,2.18,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,wrynose,HEAD,layers=meta-arago-distro:meta-arago-extras
-#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD,layers=.:meta-flutter-apps
+#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,wrynose,HEAD,layers=.:meta-flutter-apps
 #meta-browser,https://github.com/OSSystems/meta-browser.git,wrynose,e07817d8f8ada5340347c34f1ac6d5ee68eaa5ff,layers=meta-chromium
 meta-selinux,https://git.yoctoproject.org/meta-selinux,wrynose,HEAD,layers=
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.11,HEAD,layers=
diff --git a/configs/arago-wrynose-wip-config.txt b/configs/arago-wrynose-wip-config.txt
index dd2f194..18deb1c 100644
--- a/configs/arago-wrynose-wip-config.txt
+++ b/configs/arago-wrynose-wip-config.txt
@@ -3,7 +3,7 @@
 
 bitbake,https://git.openembedded.org/bitbake,2.18,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,wrynose-wip,HEAD,layers=meta-arago-distro:meta-arago-extras
-#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD,layers=.:meta-flutter-apps
+#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,wrynose,HEAD,layers=.:meta-flutter-apps
 #meta-browser,https://github.com/OSSystems/meta-browser.git,wrynose,e07817d8f8ada5340347c34f1ac6d5ee68eaa5ff,layers=meta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,wrynose,HEAD,layers=
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.11,HEAD,layers=
diff --git a/kas/arago-wrynose-flutter-config.yml b/kas/arago-wrynose-flutter-config.yml
index c2fe2d9..6840565 100644
--- a/kas/arago-wrynose-flutter-config.yml
+++ b/kas/arago-wrynose-flutter-config.yml
@@ -25,7 +25,7 @@ repos:
 
   meta-flutter:
     url: "https://github.com/meta-flutter/meta-flutter.git"
-    branch: "master"
+    branch: "wrynose"
     path: "sources/meta-flutter"
     layers:
       .:
diff --git a/src/configs/arago-wrynose-chromium-config.xml b/src/configs/arago-wrynose-chromium-config.xml
index 2913745..5e24efe 100644
--- a/src/configs/arago-wrynose-chromium-config.xml
+++ b/src/configs/arago-wrynose-chromium-config.xml
@@ -16,7 +16,7 @@
                 <layer>meta-arago-extras</layer>
             </layers>
         </repo>
-        <repo name='meta-flutter' url='https://github.com/meta-flutter/meta-flutter.git' branch='master' commit='HEAD' disabled='true'>
+        <repo name='meta-flutter' url='https://github.com/meta-flutter/meta-flutter.git' branch='wrynose' commit='HEAD' disabled='true'>
             <layers>
                 <layer>.</layer>
                 <layer>meta-flutter-apps</layer>
diff --git a/src/configs/arago-wrynose-config.xml b/src/configs/arago-wrynose-config.xml
index 62f9ac2..8b07c8e 100644
--- a/src/configs/arago-wrynose-config.xml
+++ b/src/configs/arago-wrynose-config.xml
@@ -16,7 +16,7 @@
                 <layer>meta-arago-extras</layer>
             </layers>
         </repo>
-        <repo name='meta-flutter' url='https://github.com/meta-flutter/meta-flutter.git' branch='master' commit='HEAD' disabled='true'>
+        <repo name='meta-flutter' url='https://github.com/meta-flutter/meta-flutter.git' branch='wrynose' commit='HEAD' disabled='true'>
             <layers>
                 <layer>.</layer>
                 <layer>meta-flutter-apps</layer>
diff --git a/src/configs/arago-wrynose-flutter-config.xml b/src/configs/arago-wrynose-flutter-config.xml
index 4e536be..d6f407c 100644
--- a/src/configs/arago-wrynose-flutter-config.xml
+++ b/src/configs/arago-wrynose-flutter-config.xml
@@ -16,7 +16,7 @@
                 <layer>meta-arago-extras</layer>
             </layers>
         </repo>
-        <repo name='meta-flutter' url='https://github.com/meta-flutter/meta-flutter.git' branch='master' commit='HEAD'>
+        <repo name='meta-flutter' url='https://github.com/meta-flutter/meta-flutter.git' branch='wrynose' commit='HEAD'>
             <layers>
                 <layer>.</layer>
 		<layer>meta-flutter-apps</layer>
diff --git a/src/configs/arago-wrynose-luks-config.xml b/src/configs/arago-wrynose-luks-config.xml
index cb38190..a9e7149 100644
--- a/src/configs/arago-wrynose-luks-config.xml
+++ b/src/configs/arago-wrynose-luks-config.xml
@@ -16,7 +16,7 @@
                 <layer>meta-arago-extras</layer>
             </layers>
         </repo>
-        <repo name='meta-flutter' url='https://github.com/meta-flutter/meta-flutter.git' branch='master' commit='HEAD' disabled='true'>
+        <repo name='meta-flutter' url='https://github.com/meta-flutter/meta-flutter.git' branch='wrynose' commit='HEAD' disabled='true'>
             <layers>
                 <layer>.</layer>
                 <layer>meta-flutter-apps</layer>
diff --git a/src/configs/arago-wrynose-next-config.xml b/src/configs/arago-wrynose-next-config.xml
index fe4783f..bc089b7 100644
--- a/src/configs/arago-wrynose-next-config.xml
+++ b/src/configs/arago-wrynose-next-config.xml
@@ -17,7 +17,7 @@
                 <layer>meta-arago-extras</layer>
             </layers>
         </repo>
-        <repo name='meta-flutter' url='https://github.com/meta-flutter/meta-flutter.git' branch='master' commit='HEAD' disabled='true'>
+        <repo name='meta-flutter' url='https://github.com/meta-flutter/meta-flutter.git' branch='wrynose' commit='HEAD' disabled='true'>
             <layers>
                 <layer>.</layer>
                 <layer>meta-flutter-apps</layer>
diff --git a/src/configs/arago-wrynose-selinux-config.xml b/src/configs/arago-wrynose-selinux-config.xml
index 044fe26..997ae81 100644
--- a/src/configs/arago-wrynose-selinux-config.xml
+++ b/src/configs/arago-wrynose-selinux-config.xml
@@ -16,7 +16,7 @@
                 <layer>meta-arago-extras</layer>
             </layers>
         </repo>
-        <repo name='meta-flutter' url='https://github.com/meta-flutter/meta-flutter.git' branch='master' commit='HEAD' disabled='true'>
+        <repo name='meta-flutter' url='https://github.com/meta-flutter/meta-flutter.git' branch='wrynose' commit='HEAD' disabled='true'>
             <layers>
                 <layer>.</layer>
                 <layer>meta-flutter-apps</layer>
diff --git a/src/configs/arago-wrynose-wip-config.xml b/src/configs/arago-wrynose-wip-config.xml
index bc4602a..2a646ee 100644
--- a/src/configs/arago-wrynose-wip-config.xml
+++ b/src/configs/arago-wrynose-wip-config.xml
@@ -16,7 +16,7 @@
                 <layer>meta-arago-extras</layer>
             </layers>
         </repo>
-        <repo name='meta-flutter' url='https://github.com/meta-flutter/meta-flutter.git' branch='master' commit='HEAD' disabled='true'>
+        <repo name='meta-flutter' url='https://github.com/meta-flutter/meta-flutter.git' branch='wrynose' commit='HEAD' disabled='true'>
             <layers>
                 <layer>.</layer>
                 <layer>meta-flutter-apps</layer>
-- 
2.34.1


