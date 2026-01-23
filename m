Return-Path: <v-singh1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B701D6CFC1
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 04:28:05 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.60871.1769142469824419434
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 22 Jan 2026 20:27:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Ix70uzPr;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.201.68, mailfrom: v-singh1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QuYNggceZNkmY326Ni+zRIvqpYzpiKJgyAto1wqVP5RdE/IeLEpEuZo7X+TYSB7Y7gS+Nd2X7bRR0q8+myJBRrqZ5uyRBtuLaqmQRzW+2M9wmRY2jwTvzLycct29XjzeK6bIGppMXNoZ5Ys4BA+MhpsWEhX6CyuKpEwnsEbGrVBvxWSqBasKJ5l/phtVJYJd0Q5ufAcMYtitNpGQ6QAEDmlyPlHV5lR538VeaM2ydz417KvSre5/27GJp08qbYM0nlXR9QH5DQmHAE6GEKFvCF2Bnka8nmlYEbx6sbTFuR4agUWuq1nqOKXcu2zvV/T9Kwv4l+x3RsgtiVbsg7am1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3h06YEA8BYjBiMf3KT3luxGsSCH/eGTvztE/RnPxaQ0=;
 b=xBfyeQ5yPKpvPKnnrYnnKkmEvaf5HQsYq2bj8C09XjpY5g6fwDW+i23inXnJqN++oawtO+JxxVd68EasaO9mgWeZQdMzp2PGKKoS+5IHsMlNuRmHznlWKyLShhPs5c6JK7XF7PobobsRH1gDu9D60eTj/Yh8gX8uAvFqtG6UcmH2Y4tNojA7WgVG/go9af8VHL0LJFon9Is52VbQRKb2gHE3C1uyS6JDL9fAIh//sJNMIyGlk6+sr4bKiW2tPj6vzHjEMPLqkijUbeDGmWjQoXXW1hoOGa922w2bxMQL+fxRzCkTHb+jcaR6h1D0kir8mIzf2Z2gK+dtbaUC5qwCcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3h06YEA8BYjBiMf3KT3luxGsSCH/eGTvztE/RnPxaQ0=;
 b=Ix70uzPr+g/5X+Z/hAmopFZ93TgGPL4uIZKDCAqfdLUh6Fp/s55v4+SE1Fu+gdKZkpfBFa2FVYVLN/u9T4pXIyXYphLGb7WYQfdLQQz5LiPXHiu5Xvs7RcfMYJSpyGti0jEyg8H93kl3dSR46/0Wwp17xz2Pn7UEq2Xn1d43WE0=
Received: from SJ0PR03CA0012.namprd03.prod.outlook.com (2603:10b6:a03:33a::17)
 by IA1PR10MB5945.namprd10.prod.outlook.com (2603:10b6:208:3d7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Fri, 23 Jan
 2026 04:27:45 +0000
Received: from BY1PEPF0001AE1C.namprd04.prod.outlook.com
 (2603:10b6:a03:33a:cafe::8) by SJ0PR03CA0012.outlook.office365.com
 (2603:10b6:a03:33a::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Fri,
 23 Jan 2026 04:27:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BY1PEPF0001AE1C.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 04:27:44 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 22:27:43 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 22:27:43 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 22 Jan 2026 22:27:43 -0600
Received: from uda0513920.dhcp.ti.com (uda0513920.dhcp.ti.com [172.24.233.77])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60N4RfYm1704885;
	Thu, 22 Jan 2026 22:27:42 -0600
From: vishnu singh <v-singh1@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>, <denis@denix.org>
Subject: [master][PATCH 0/2] Add Zeroconf networking support for Dante DEP
Date: Fri, 23 Jan 2026 09:57:39 +0530
Message-ID: <20260123042741.10313-1-v-singh1@ti.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1C:EE_|IA1PR10MB5945:EE_
X-MS-Office365-Filtering-Correlation-Id: 21f63486-43ad-48ac-21f7-08de5a37c14c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3cRMFSoL79Y2IR84neYQUIsj2rjcQusnPNvdju+zBQAe0Hgm+MVG4b7ryVeH?=
 =?us-ascii?Q?izfoqAPnw6uDR2Q7dgK0cnD1rWzRDSmuXI4OT/qpPESTKGHY//V5MdWbo1qI?=
 =?us-ascii?Q?HrG393w5F5m2ZOjTx0pNd4lDZOaqcHuKMcxScmhMiHfuIY4r+RKxdxq/Ws3H?=
 =?us-ascii?Q?qtv0IDXR2EfCcX4gEtFuxkOmncliba58yA23Xl4uPJXOYmbNMm1kiznp/aR2?=
 =?us-ascii?Q?bGzKhGEyC2S0U2U8NCICwkwgtH+3S4+1d1yn+TNSdMmGEI6Q+Sf8pusVyF1b?=
 =?us-ascii?Q?Bndi7l3Ndqqb/M36D5jQqIA68fxzyNF6HOW9tdBq7I6pnz0xwoliM2xmIJeK?=
 =?us-ascii?Q?9KA5mhaREnbExpLkItV1dVOETwA9140i5y+2MCOk+14NDItDaa2mQ14tnucp?=
 =?us-ascii?Q?na/Ctd8iNNrPbkwRGe1zLn3lOUkdPy7UlykfxrOQNJ19hJzjM0BT/kCKrhSI?=
 =?us-ascii?Q?KVfFYuBe7+dtfgFxfYGW7E9hTY0jFuuOfKlnyGsIQ8Zfagp0M3WV0AhHvcbO?=
 =?us-ascii?Q?caylvectNlS6zl0umB6UVyZ4vo2WCjfuUa9d0DqDOhjNOePzIyAK0Lg/g24V?=
 =?us-ascii?Q?NP9z4BUAYSX2pLhzca2nIigfmlN9D1pLcMfc0fQO78r3jkXykOJUJY7MTGrE?=
 =?us-ascii?Q?tpppsiq2B8I9y9qo4JQQluhzRYZv83b17HTP1hr47giZqViZhQVteD+yaWTr?=
 =?us-ascii?Q?OEW1K3/da5HmKXXQUPaGsRvMrlhqlTGO7GGM6TfTSqhpjqbCcj1STCcQFwp4?=
 =?us-ascii?Q?rJ8X8ZO3e0SSB2XIc3vT5Ynqx/zZFNQ61o0GdCv8SOkpu5RBWyBaTBjqqu3c?=
 =?us-ascii?Q?+1EuSaeBw3psfHrdpOVveYNqe/m18nV2Bnbc17V67fuw2wHPgf2mS8DQ3Fwd?=
 =?us-ascii?Q?FEgTegnlNQ0z5MNurSvL46PHgIMys9Xo5qjPwowZqGO8j3z8bbZsLp1Qv4px?=
 =?us-ascii?Q?V1QbRXWUTnCa8JKfUIKHyYf4q6xm2lrz+QFlekd3nR8AyOPvtwrGxDjerd/K?=
 =?us-ascii?Q?56X8JSjj5laD6lXmkgg+tlHexXCgK55OlKTqRAKBYEY9x+3cnaWafFctE8FW?=
 =?us-ascii?Q?j5BA+CSGalbw5EuB2yYCxjKb8HPp+QFeXwbyHdYV45NY5lyR7IGf7nISUaoF?=
 =?us-ascii?Q?ZOoRNbkpIojNzlrCSGyfo95pmbcYlrVwptVvOZZM5x+JQsptoQPYyZ6JktS0?=
 =?us-ascii?Q?F+Dqpf0U4jOiq9agn/qGLY4ry8jjNnZOKpPbpqrdS6X2yfggug2GnAEh1OVR?=
 =?us-ascii?Q?9elQamhowqOPrOcpOEZyKE0mks5PeUdvuyp9RFYOEx1/3ke5ZLqSOioeHfwL?=
 =?us-ascii?Q?opYWODaymsQ2g0MxuZLT1RKemTopTD/3Xu9iwdqI8sgVwV9g24m0py/TAJcy?=
 =?us-ascii?Q?rYMbVbqOkblCVUGGAHf4GA8kw7KW5JmjOyoWslLtX+RSGVx34ZIxPWLb1LE0?=
 =?us-ascii?Q?XdZRMesGWNI8mJUlxDad9EgwwUpgfSe+pUZMeqZFEaE78tswQZfquvGG7y+R?=
 =?us-ascii?Q?1XcxunGTC2MKaY76Fy1iuA2+Sjk47qySYYJ1yMbKuaqm3XczDcs1RfQipg4r?=
 =?us-ascii?Q?JPP5dxEMLl9E70G9cW814yEh+tLrRSVQ+XMD84qu2sRLLC3o+vMFSYZymzEk?=
 =?us-ascii?Q?/CgM8DkZXmYhFGiXgUGWtgoYUsNoNWycjFssnXHc/58zKxiXDqlqPgEXkSDs?=
 =?us-ascii?Q?QOrx3Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 04:27:44.4570
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21f63486-43ad-48ac-21f7-08de5a37c14c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BY1PEPF0001AE1C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB5945
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 23 Jan 2026 04:28:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17013

From: Vishnu Singh <v-singh1@ti.com>

This patch series adds Zeroconf networking support required for Dante Devic=
e
Enrollment Protocol (DEP) functionality. Dante audio networking relies on
Zeroconf capabilities for automatic device discovery and configuration in
professional audio environments.

The series includes two complementary approaches to enable full Zeroconf su=
pport:

1. Adding the necessary packages (zeroconf and avahi-autoipd) to the connec=
tivity
   packagegroup to provide mDNS and DNS-SD service discovery functionality.

2. Configuring systemd-networkd to enable IPv4 Link-Local addressing for al=
l
   Ethernet interfaces, ensuring devices can obtain IP addresses automatica=
lly
   when no DHCP server is available.

Together, these changes provide the complete Zeroconf stack needed for Dant=
e DEP:
- Automatic IP address assignment (169.254.x.x/16)
- Multicast DNS hostname resolution (.local domains)
- Service discovery and advertisement
- DNS Service Discovery (DNS-SD)

This implementation ensures that Dante audio devices can discover each othe=
r and
communicate properly in zero-configuration environments, which is essential=
 for
professional audio networking deployments.

Vishnu Singh (2):
  packagegroup-arago-tisdk-connectivity: add zeroconf and avahi-autoipd
  systemd-networkd: Enable IPv4 Link-Local addressing for Ethernet
    interfaces

 .../packagegroups/packagegroup-arago-tisdk-connectivity.bb  | 6 ++++++
 .../recipes-core/systemd/systemd/10-eth.network             | 1 +
 .../recipes-core/systemd/systemd/15-eth.network             | 1 +
 .../recipes-core/systemd/systemd/60-usb.network             | 1 +
 4 files changed, 9 insertions(+)

--=20
2.50.1


