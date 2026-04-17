Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87751F99C6B
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 21:49:57 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.14])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.56247.1776462596178440528
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 17 Apr 2026 14:49:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=HWM0MI3P;
 spf=pass (domain: list.ti.com, ip: 40.93.195.14, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xd9RAvbd6Mpn2I7QVbbD3bAxB33w8K77Wml2Bi0bI+rE/CUtfNNF9CJ3nHivi1ai1/avzoOhlLSe0Y4O8vVY/m5IbdIQVWwNOJrY9oHZmwXgZplmP3ZGY9blQlheVLuQRZIPGZ9685I2e1KzCQZN+MpDErCTqlUHfJZRp8FKF5YTJEp1uXbq06+6ymELX35R8hudUc2Bn0QR68xobXef2QbVgd545T2Hx7+XUqriJuFoy3O3IHZKvzz+FEFIQML+aUWPc91UOMEsDj6/lLTLxuM3aqK50GdL/+gOjoncJ+MmE2mWHfJsQH8iqd2IG0hqtsyp/QWcuwnaXNdfDEtFOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0gcU8Y9KTkVNC+qdVlhpO1DU/y+v2PeYwxRyyii6+9g=;
 b=mj7L//8fpjY2ri0sX06giJyvDUTJezy1bbMOItBO3xJhKPvU0z+2A/Azy2kHsQYeiTvDrQ8xeifdWg8AeztqUUtvrQweWLn1Ck6q6M5LXnBFuTPM7ePL2U4/HtuQpRtxUsXu7/BcEYRu3XWtTxR4AwI8RLkaEr5Dv4c1ILa13+3fCiSJ0hIV1pQww7uO8hEqifBaFjI3iomDy8wXsBtT3RkaSzsEQA8WSaD5/BTp1ciWyYNzUNyKEzwbVf7Ni2Em77/N3MBh/wInLQbl1jpNd/Q0K6geNKZbPAx346P6CIMBWvWEifwCm7xWbRtTNkRJzXQ5kJsC7alahFzj7qfk7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0gcU8Y9KTkVNC+qdVlhpO1DU/y+v2PeYwxRyyii6+9g=;
 b=HWM0MI3PQ/5WdqHUSzhEQV2XPeIbI25dVcPZSpdVKtuT2MdzO46vPlpmd4AMwqcPvIgfIfv3AVgPmkZdDKYkY9He353m/t62asZ/hYaVtwTsAe6su3bHKwlyWmmcBYH6vV8ty6S757fwaCj/JFXNYoGb5480mZ9P6rl4EseyMeWkHojps5tAp10kXf5NKrmJMrcVemuDXeP7Dcoigk6dlr1aqSniBiCuxm4BOz8cMMy1oEQm5Xrr7XOSVpjyiyKSh+HyCgBTmu+J/TZ1/baq9T6CWCYZCra9rDHGB7IKbn9GnVwVxI09PW0bESa5tXgdxZb3qlcYST0yL5uF0+PS/w==
Received: from PH8P221CA0059.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:349::10)
 by LVWPR10MB997861.namprd10.prod.outlook.com (2603:10b6:408:3c0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Fri, 17 Apr
 2026 21:49:53 +0000
Received: from SJ1PEPF000023D9.namprd21.prod.outlook.com
 (2603:10b6:510:349:cafe::19) by PH8P221CA0059.outlook.office365.com
 (2603:10b6:510:349::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.52 via Frontend Transport; Fri,
 17 Apr 2026 21:49:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF000023D9.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.0 via Frontend Transport; Fri, 17 Apr 2026 21:49:52 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 17 Apr
 2026 16:49:52 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 17 Apr
 2026 16:49:52 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 17 Apr 2026 16:49:52 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63HLnqq72790217;
	Fri, 17 Apr 2026 16:49:52 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 0DDBD9ACF4; Fri, 17 Apr 2026 16:49:52 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH v2] arago: Bump DISTRO_VERSION
Date: Fri, 17 Apr 2026 16:49:52 -0500
Message-ID: <20260417214952.1642164-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260417211902.2612419-1-reatmon@ti.com>
References: <20260417211902.2612419-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D9:EE_|LVWPR10MB997861:EE_
X-MS-Office365-Filtering-Correlation-Id: 801bcf0a-f13c-49f7-3bb5-08de9ccb41ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	4P2+9PBv3vGP9+0qbeJEIECoVFxaGG/f89Qp8NZVd1rlK7XtWEF9mmXUWVVOooFUY3OPj5lLnbJF47XFJexBNCwk5qeqdbzSPmWaVnVGZcrf/9F6ywgLfoRXVKOdw1D3YJhEMmGoeMJlRmJEa83QIxMKxK+cOHpRh7PtE2oB1koSpZpqTJKYnHkoiG7TL92s8N1tFG8bTEl0r8dnEl+o8nf+EM0yDQrtbSTqT4jOU5ptAb5Mu3MVvotH5B7GVTzLtriblc4x9/YAyxc9hbnGSBeOJlp1PQZK22DHNcz+uS2hKCpAzdQpzXP1DQb6DOYA7b/T2Wsxo3GcXRICZRV1jgI704DyGY+mOh+ZeW+6YmywWFX8rZNJkf+KchvsDAXGt8KipzaOJzntk2v5Oum4VworUArXlbIaWeZX1UwHo+mpU8T+P0UgwwnrVq+jRn3V6+74U4z0BMyqydNCaAMHcg0gOAiqJ1NKlD03neMoSYSHWAY8VFQUCsFbk8PzwDCOXMQoVR4laPrZeLyWcmH++MPfyyYSg0hu/1kjfJu5vguA2MW1tS9aDG3TMGuNUef1ioqBuDy3f61802ou6DvffE4xoITM+rN0nmBovUJjHg9q0yctWOE9B8u6EqOMxXmqzMD854QBQPnxpXcl2F0dm3hqiOlQQiECYE1X9Lxx1LnIvSk6I3P+K1KmJ+JSTe/a55CyoTHijWLQrt0YEfhMIrHLtfNgqt66ayMTCIJHVjEgIUyczYbS3hoW4qgdrAndZjGYN3z8yOIu2AfbLp9nUQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	4AC82vhZBguQTWhEemI/IJ6m43AyRBhRdYUSgSSVcQu/Bg5q6unjG2WRhQ+UjELEhtQONzK1z+C8+W+55maX0A55czixTZx1xlPeQw++uwCR+9ghHs284Lp1CR8Z7Mf/ECvj7es73XPrF5WxpECuaEiJ3M9N64ZSq3fq+95PJpywY5YzNW/isRoOj+RXnqjPX2eKNaC4MsPgdXWYjxIfeBoiNrhIQmm5vb6SX0GpPU5XNu2Nhz78wgJZ6RpO0mmWVBADF+ct+J9OTq5zkczUHXuUTAb/q3GqzlzC6bFrH3DFhPms6K8zl2V+PhrER7JuKbaiD6cK1ZNniInM+9xHN/elKEGth04EwImNZ4o6hJWuX4zDqDxebyHzuT9kPgwAeC9hW+BxqIJJnV4ZCi/DQ3QVQjHB9KwNuW73T3rOOgUqDl5KjkuY5mAM0bboavlW
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 21:49:52.8215
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 801bcf0a-f13c-49f7-3bb5-08de9ccb41ce
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023D9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVWPR10MB997861
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 17 Apr 2026 21:49:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17475

meta-arago / na / 20260417211902.2612419-1-reatmon

PRC Results: FAIL

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
All patches passed



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][master][PATCH v2] arago: Bump DISTRO_VERSION
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Fri, 17 Apr 2026 16:19:02 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: b0e872002563309c84ab0827e99d250cc=
a02aa76

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202604161800
- Commit SHA: bd0032b4c131438b9597b75f991e21ead44ccfbb

Patches
----------------------------------------
All patches applied



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-repo: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master - FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

ERROR: Multiple recipes found for mesa-demos
    oe-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
    meta-arago/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb




