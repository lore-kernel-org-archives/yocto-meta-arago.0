Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC279F47CD7
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 21:00:28 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.26])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.54598.1772744423383619702
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 13:00:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=Xy1EGUfe;
 spf=pass (domain: list.ti.com, ip: 40.93.201.26, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m03NQS8/ZAUMVcaVM3q/lvYrHz9GxAC95VNKWGS0P7awU75wrT0ktv5ecvgJerwa9ZqydXfIpj1fESB23W1ykMupn6zOwuuiNHFTeefokT1EEBSIJ+ZyMH/1nRfI+8kRek4FFOoFtb7V3XY3+7ukL55PmQAwpGKoj9EHfzCww3vbM4vt+zNUBPo1t+jpkQIHfqQIqPgHcE9Ayz5sS3bLl53EM/Wg7dYQW0P2wOS44gXo1JiKfBfigEJWvvRSNd5/Cy1xhq5F/xjkx4/k9+6+j7p9nk3RtAAd+T7Au5kmij8GYNUMYEHo+MvnMOLQtsQPyy2YGpPJRh9WEM9NlfIepg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jeqfgK1LIdhbRfbEK1S5slP/PL+IbzNeL82cbsnFzUY=;
 b=EMgzUd8gLSbvpmnFE4tWiwTFDnpX0YnAP1kdrNbsP3sHzx0MgEVx8D6n7z7uEdjYU9L3/r/heaJNkriL/dUDsR8S9zEwtvU4OlOk0jIu61xkEy8b6SMroFqZ1E7tS5KlaUhtV+CvprNNnsh077a891v9FvYnDfWdgD9aWSpY7g0p0gpYwkGThgZ4MyPLUZV2OYNziS/djmh+JdF9/H+68ehy7dWUKFy70X9DbXYrNnSbT8QtMiwHVSFKgH5xYBn17OmPwkFOupPnOpG4TI8cQDQZYISl/Kb8uwIw//wpPwqD63IoA84MLlgthQRYVcJAXAw5wZZLI/k0fcqzMvfcfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jeqfgK1LIdhbRfbEK1S5slP/PL+IbzNeL82cbsnFzUY=;
 b=Xy1EGUfe/ly9UuxfOuij3uhjjWuwOZWWND4qwYk9e6hdRQsh6nIO1bwkL4tfsxEa+ih5zkCBW9rDz5blju48BxbR5QJZKGazKPh6eT3Tv70BTeo2J8CiPUmSkOU1FfY5uEfPiTWZC32upTNInDc3eZ0o6Eay2YdnagJXEPpdTrMtXF5U1x8g0PzIWFvaGScRYaMeZTaU77u1ZqrRpdGIDtlT4gs2Xv44UpcUIN+ZhwzTjNAUHLvR3wqRtLM85PyRFhmrV1LsmJxwBLeqjtmnsUnFasNcCHDx+CeWVUUxnPiw6I05Me4yeefwFaqXXX/m2MGYKkYlM5YfnwHi5lE5jg==
Received: from SJ0PR13CA0095.namprd13.prod.outlook.com (2603:10b6:a03:2c5::10)
 by SAVPR10MB997817.namprd10.prod.outlook.com (2603:10b6:806:4e5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 21:00:21 +0000
Received: from BY1PEPF0001AE1B.namprd04.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::4b) by SJ0PR13CA0095.outlook.office365.com
 (2603:10b6:a03:2c5::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Thu,
 5 Mar 2026 21:00:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BY1PEPF0001AE1B.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 21:00:21 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 15:00:20 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 15:00:20 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 15:00:20 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625L0Kj23029534;
	Thu, 5 Mar 2026 15:00:20 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 39ACB18565F; Thu,  5 Mar 2026 15:00:20 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: <a-christidis@ti.com>
CC: <denys@konsulko.com>, <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] emptty: add version 0.15.0
Date: Thu, 5 Mar 2026 15:00:20 -0600
Message-ID: <20260305210020.1828246-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260305205455.267385-1-a-christidis@ti.com>
References: <20260305205455.267385-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1B:EE_|SAVPR10MB997817:EE_
X-MS-Office365-Filtering-Correlation-Id: 6761bcc3-58e3-427d-0a6f-08de7afa36bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|34020700016|36860700016|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	Aqenn/TD68Fnf0fxBRNsrn4lDXoV3x1YiP+flHLOcJwHr4jUGwUWL1w0vkNPec6ChKeFmiGtr1OkV7RpfdExr0b8odTXxFr/QdF/ul3jR02+vbgexo3kX54XeCSLHsc270QNRRPrEfJiDFF9ByR6PUajN1zxmcETrW5s6cmzZVcRUGUkjoz9hc9IlLNcMG3rdZp7U9kMPsBrrF1obE6MtNtUsBewHPOhj22zxQSw/lzdIRKKB7qWfQbwKosQ3WVjYszewq44WcCdHUU3lN0rTPdGWGNvMhSYhTYLWFhgpf/Q0oDAQCVQtEOTVUMbfZ7fajcrafT/CFdE/gdXtXndFxaHMRrZERl8y22UWB43NLMs64k6csVzKLTlSZQ+/DINXgaPVTaptjaawGHjHchXQ77+y7IQwwYs/CdpM3zEcrqpprEqNAAWB/CbC4AU2S7cfezrcN+ExIzSvFfYUvZl+36dLl9GP1m9bTla2W2YRUTZumEt9wG1EBzkyn0aZJ7ig7iWL8kS8KzXd1L8Ij7gk5CJUIjVEC9SmEJWVlyFfq3ASfhiEkUsRklzRcOQwAAaaMWqRchzqzOjqWzPq1wavyKPRANuyJj6rg07UPOoRizWzYvs5Xk8z6Rhj6snGqRIuAHz2EJZtXjk02GI/+pKcgpWg45Po4MEYPcFwxPdKXX4VhCGmvtKmXU1U7S3xDuw9wjAO/C4buzM+pw4+tffKzfe+K7dqci1AjSNelA5Iynb+d+P8TTma8ULsAqpc5rgd5U34HWqf1hmYaaiOPd2pg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(34020700016)(36860700016)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	C2INw008XQKUJQabT0QZ/cDPaAxLJGbI/FeCoe6pBuBcJjGIEs8w4ZU+dG+phQTQ0Seqe6EfIZOY1hlCg0nDg/7W55pXZ80n4Cz34yyFxIkHoCLf45ahkBgtW6YXHx92XBVI2HIfpV1Jp/sBi/3wXWdUhgklurr7y/rXhdKVRq06e3VXcS+ORCUyO+rAy6I1nq+ZqYtF9FQlLT9zmk+O0DuRQFHaY7JwMFK6hZo18Se3j7vpweYyuuKeUBJdG4gYO3f02R/WSmaW4m4vyl8EesQIY5L3UNM58DGpkVO1B+yqeF8nEl2sZ2NSJYSnGl71yCyKdsBn79O7N6T9OqxnxglIri7KWKu7lbXtekbAZW/ntWweZxfl27xLyqdQpCfTT9tS8mb9mgqGgPUUXXL8faLKjJZSAY4KJPxg+A6lK9UJUWTeuR3kq6YgxVePDwjX
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 21:00:21.0664
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6761bcc3-58e3-427d-0a6f-08de7afa36bc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BY1PEPF0001AE1B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR10MB997817
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 Mar 2026 21:00:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17268

meta-arago / na / 20260305205455.267385-1-a-christidis

PRC Results: FAIL

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
FAIL - [meta-arago][master][PATCH] emptty: add version 0.15.0
    ERROR: Missing Upstream-Status in added patch file: hunk(1) 0001-emptty=
-add-version-0.15.0.patch (UPSTREAM-STATUS-1)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887




