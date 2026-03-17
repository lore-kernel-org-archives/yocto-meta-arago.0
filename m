Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75360FF6E80
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 21:02:12 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.86962.1773781325081914176
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 14:02:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=l410UVdF;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.195.48, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BdSiorMZLiO8wa7gK6xnq7NTo4g8NDL3So30iZYSMGLAVt1/N2ZyeZStCV1U7rFL4OjIyEIVpVXYkUu5XQQ4nYK6NNLq3PQ5AlmLTkoA4VMUMwLHHiAEQFqj5Lemu6ark6YG2c/15CdGTZMbzEl3JkcLv1WaSP+dw6zpC0jVE+HkbhUDvTM1xtf8qgC5VgawSo34rGVkJv02XBYGp/SVqcMN9DZQxqChWBzdEJORVcGgiR9OLLo5QwhBOT3Qn04wHv2rU4CibJ87kWMpMM71DOo/iH2TE0z0719i1k7w1WWN5w4rR44xGjMdAgh7TK/Q+ug3y2YJUBdPy+cEf6JqiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kufVZj8NSnTulb9NeWvRI57a8iSPSArqA4sxNIAW6LY=;
 b=PQqbQbdB399hgPTndmEEsjMBzy0cGmpxmVpqN6alWRB6sNG6ep9bJ6z6hYD5w5r/5gmBUCVh7YUVlDYj6ZMhMPXfVSKd0RtLLWVrBan3AYiNLtGTEAJ1V53EffIDpv4FRI7/9DEwiSRIA30I/DtJ7ND1aUjo3n2PZuxkkbRVDI8bfXdHltHFz4n71Vc8lrIBv09RlNF2490qAw8Ki6Rkr7M98eeL7lUwkDOYjgUHg8XBQ8uPlLOV7EJwDDSBm7BJL+bC74kIu4HdryAUui9HVP2yJO06W09rPdqQ3fgm4NZNX29ihATVjgokkJ6v8eCSxdWwYuCzwRoPTiz5EUkrOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kufVZj8NSnTulb9NeWvRI57a8iSPSArqA4sxNIAW6LY=;
 b=l410UVdFP60EhjByh451gvxApOXafYb6/UM/S5Ear62wGLr5IaanPFSmiEjAL8C3Di3Jzk7vVt2qDeinrJMC/rEOcU+I97mXQusTKsduUKkB56O72MQ6ZZwbg3mRXrzJdCYRnVtP4JTSomli+1tjdSIhXppMO07MJbStlj9ODWw=
Received: from PH7PR13CA0002.namprd13.prod.outlook.com (2603:10b6:510:174::6)
 by LV8PR10MB7967.namprd10.prod.outlook.com (2603:10b6:408:206::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Tue, 17 Mar
 2026 21:02:02 +0000
Received: from CY4PEPF0000E9D3.namprd03.prod.outlook.com
 (2603:10b6:510:174:cafe::6) by PH7PR13CA0002.outlook.office365.com
 (2603:10b6:510:174::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.24 via Frontend Transport; Tue,
 17 Mar 2026 21:02:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000E9D3.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 21:02:00 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 16:01:38 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 16:01:38 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Mar 2026 16:01:38 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.216])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62HL1cLX3835377;
	Tue, 17 Mar 2026 16:01:38 -0500
From: <a-christidis@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] flutter-samples-material-3-demo: Add --no-pub build option
Date: Tue, 17 Mar 2026 16:01:38 -0500
Message-ID: <20260317210138.46226-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D3:EE_|LV8PR10MB7967:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fda9c43-c101-4e79-f047-08de84686ec1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	n+lX4s72+FQBvtDBOlkpXK9Spkula7H1OEr0JQKZ4YqC6n9vBCtr18g0VwJjVlziVQlZEERVJrBf+7smzK8QsNdohDOCRoLuSAFCE7pEgH57SB/hVn8v8hepcJqLyd7iA4UCxLi93YRuajfPCjqllkWJ/X8SmlNSRAct8QDBR+Y954ZFVdHlNnjak4S6q/GkatlrCNyguNJYpb977p6NJHC/FrGShwoPQjW8ktGpY/6nP4T8QQ7XjCeTrgSYCybD2lIvV63MT/MsFz/gYsT/TRPLRgzfYUJBytVbedOmHEUw3HnRrWzux7fWUES1LUdSF3Qar73mVltk/bfL7Lv21TlS/RtZgvI9eExQkQ1EZrISsIw5N/pHy4R0SbXchCbljMmoR9eElWiXYmWB+BNi+CUVYmd7DLGXQvjLbjEa0npSXgWGnbdNkU6A+cWXe6qH5duofmVwGEKgoGPY/ROxPOjI3n5+ovBxBZn0uykAEa4rR6m5AjB4WVgnJzolJFrmXmXJ/5SFGHPhIdbL/dT40Kr0Ij19TItrTiTzx01vxsvZ4kRSRKxKT7OuiNvhCcLhw7HG+3u3S/oKO7R0Yn6Aa5DMKOB3fRn6IQC/QWRvPc0F9fzjGx80N0yLSYdQiPn5VQ4FE6w1x/g4VMWpHu8Xgk4wC1rCJQ4gOwfg9B+n27rXMUawXh7/My52qa3ffvCcnO39bvfhORTg7/pw7o1OpiAX4uvhsOQeZDjHgtBvba+y4XvG2w+Li17D9zo9yd8VI+OtRYSaBuZ09JpZi0a1Yw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	2BFCNSPPSd6ld95pQA1Ww3J7IFD7su4Cz8wfh7PC2hHxfAXLd8ZkHyJq+vOF4tHLDMtl1VUd8IuqKWIdLxoOdQJzqKH574Xi+CA0smFhX0ooD0aMygXJO+Qb9r9WXvsoL4KLTr+DMHI/CaG1CVvXK6ql5Mg13BcMvoC6SH8fZKfN4fGOG3H9fbkp1aCMdIG+DoTEnKEKoZzpOxDwX8CnDtEUTM+eJbvoNGhiaSqMq/fFjfnSxqoOMBXlUzY+L5GJw7JHfUJomTgTmqRlb2F7BzIhsIa7d0Gb5gs+VcbPZMVJ6HnnHZRibD82O49h/gIfA/++C/Ls+zuekfAIDSq0Q6cCHxETSIR/W2UGuendnDenfC/0dDvRqYje6mrZ6kktQD1hvy8Uehv4d0Lt09N59LIeoUACjUIICDYsAurXykWjc96Dqnbu/ZMU5KzuOxto
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 21:02:00.1926
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fda9c43-c101-4e79-f047-08de84686ec1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9D3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7967
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 17 Mar 2026 21:02:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17385

From: Antonios Christidis <a-christidis@ti.com>

Append "--no-pub" option to flutter.

There is a patch pending upstream, [1]. The maintainer is inactive/on
vacation.

The upstream patch modifies a class, there is no clean way to modify
a class, so I'm editing FLUTTER_BUILD_ARGS which gets consumed by the
class. The end behavior is the same.

[1] https://github.com/meta-flutter/meta-flutter/pull/744

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 check_yocto_rules.json                                        | 1 +
 .../flutter/flutter-samples-material-3-demo-arago.inc         | 1 +
 .../flutter/flutter-samples-material-3-demo_%.bbappend        | 4 ++++
 3 files changed, 6 insertions(+)
 create mode 100644 meta-arago-test/dynamic-layers/flutter-layer/recipes-gr=
aphics/flutter/flutter-samples-material-3-demo-arago.inc
 create mode 100644 meta-arago-test/dynamic-layers/flutter-layer/recipes-gr=
aphics/flutter/flutter-samples-material-3-demo_%.bbappend

diff --git a/check_yocto_rules.json b/check_yocto_rules.json
index 25c8c952..70bbe734 100644
--- a/check_yocto_rules.json
+++ b/check_yocto_rules.json
@@ -23,6 +23,7 @@
             "meta-arago-extras/recipes-extended/sysrepo/libyang_%.bbappend=
",
             "meta-arago-test/dynamic-layers/qt6-layer/recipes-core/package=
groups/ti-test.bbappend",
             "meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics=
/flutter/flutter-wayland-client_%.bbappend",
+            "meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics=
/flutter/flutter-samples-material-3-demo_%.bbappend",
             "meta-arago-test/recipes-benchmark/stream/stream_%.bbappend",
             "meta-arago-test/recipes-extended/bc/bc_%.bbappend"
         ]
diff --git a/meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/=
flutter/flutter-samples-material-3-demo-arago.inc b/meta-arago-test/dynamic=
-layers/flutter-layer/recipes-graphics/flutter/flutter-samples-material-3-d=
emo-arago.inc
new file mode 100644
index 00000000..b2c9e13d
--- /dev/null
+++ b/meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/flutter=
/flutter-samples-material-3-demo-arago.inc
@@ -0,0 +1 @@
+FLUTTER_BUILD_ARGS:append =3D " --no-pub"
diff --git a/meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/=
flutter/flutter-samples-material-3-demo_%.bbappend b/meta-arago-test/dynami=
c-layers/flutter-layer/recipes-graphics/flutter/flutter-samples-material-3-=
demo_%.bbappend
new file mode 100644
index 00000000..f0ae3799
--- /dev/null
+++ b/meta-arago-test/dynamic-layers/flutter-layer/recipes-graphics/flutter=
/flutter-samples-material-3-demo_%.bbappend
@@ -0,0 +1,4 @@
+FLUTTER_ARAGO =3D ""
+FLUTTER_ARAGO:arago =3D "flutter-samples-material-3-demo-arago.inc"
+
+require ${FLUTTER_ARAGO}
--=20
2.34.1


