Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40470C982C9
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 14:58:37 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7908.1768575512575181332
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 16 Jan 2026 06:58:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=pW9SAb/z;
 spf=pass (domain: list.ti.com, ip: 52.101.46.29, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FoBiIQeOAt/rAwcZ9VfEF44KHR6qGNzbG4RwFZzW4Sx6nJ8HSqScN/b0ouSxol047aARBk4SnGYYBRD+ASmQKPsKxPSZZFRRnjQv3W/8mwFXdu8LUCctlII1bEXZSDV4F63ebPSQLaIpZDRbB+MnGJsVdgLUHr3yR8kRzmLh73BmeR1e+Cq5+YVLH301FcPZCv+elozmFKOMluHSSSyaI0JI6o/xaqx6rrUEvtiUe1vxlIvBsU4uk04o977Aiiximh68MOFi63DCVU1C++UbkBFjRaCArnbh3ThdQAr/M41pmUT6ozwBsNHT5wHKXACyIp/0hEd9GVqFc0qBxEGSIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=35Rc5MPN+2TzFtjKzaAziArPxQZC7oNWQ50gWbiXSo4=;
 b=tXJp2kygDm06LlaB9fDqPYZ7Q+nSSwelVdI5ZLPEVvV0uj50c5GeOKxz+4QXL6zNj3maANbQEe/N+iCNjTPFw7BiVRcxiuWcGZXWIfz8rCMYDaSn7hw7VRx+lifJOjk0MDdpOQiYjsm+07qbJgtDyR9/qOZw+yB5GpcBmMiAhkUyOBqYQdsnhQmBfd1qr1sdHrJAy8E0d6nRsDgKYw6H7x6/D9n7Ohh/iW74j8DlUntInb3faH0kEdgspHrHfcDd8Jzp3KFXfociK3Ajn8xZemyNzDAD3vraLAI75ikG720k2lwJ8Mrtl4UzUFAi4n2FocToxtTpnW6HcDeS/wmV6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35Rc5MPN+2TzFtjKzaAziArPxQZC7oNWQ50gWbiXSo4=;
 b=pW9SAb/zY/5eeX8MC/7Fyi2nA4AoJ0phEizaXfgFOsFAA2sV1XIj2ZgIOQajV+yKvIH3sKD+N3Fd2CXlKh2b4nmnFKG+5meQQ+PcDHZjbUxoyqmHwfC0pgqBmqkqLSt4j3a2HIle7q6XNHkFzHTgDUNbwTa2ZAnbpSMT5v2qenMPvI4lpzFck56rRgjbj3LA9L8eCTBjhCanDdq1aJssT3b/Cxmqw/sQHD4Q06xDTjnk8SV+TuTCF0zjJplMMLXCMMKIW5LkalceWbm3m8G6cUjrOkIlCVDY9b6wfWB8dO+niSXlLEOxCNUptGMo6RfkEKGvSVxddQOJApCsc2iU/g==
Received: from SJ0PR03CA0340.namprd03.prod.outlook.com (2603:10b6:a03:39c::15)
 by SJ2PR10MB7112.namprd10.prod.outlook.com (2603:10b6:a03:4c6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 14:58:29 +0000
Received: from SJ1PEPF00001CE0.namprd05.prod.outlook.com
 (2603:10b6:a03:39c:cafe::6) by SJ0PR03CA0340.outlook.office365.com
 (2603:10b6:a03:39c::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.9 via Frontend Transport; Fri,
 16 Jan 2026 14:58:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00001CE0.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 14:58:28 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 08:58:28 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 08:58:27 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 16 Jan 2026 08:58:27 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60GEwRDp3304881;
	Fri, 16 Jan 2026 08:58:27 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id AAD2F9ACF4; Fri, 16 Jan 2026 08:58:27 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>
Subject: Re: [meta-arago][master][PATCH v2 1/2] gstreamer1.0-plugins-good: Add QT6 PACKAGECONFIG support
Date: Fri, 16 Jan 2026 08:58:27 -0600
Message-ID: <20260116145827.7730-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260116143722.2135247-1-j-sahu@ti.com>
References: <20260116143722.2135247-1-j-sahu@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE0:EE_|SJ2PR10MB7112:EE_
X-MS-Office365-Filtering-Correlation-Id: d6c4d111-35ec-4436-f173-08de550fb57a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013|34020700016|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?MYcL0yqLYT+5TzmOo1+JKdvSgpGN18NOT7NuzCyQ+oso0EGn5jErTh56Iq8j?=
 =?us-ascii?Q?39MTWUpmdVmheR7K5ZQT0XBuijVmufmzMnjbhjgDhaRR2u4rHyZz/mPCtAWm?=
 =?us-ascii?Q?vSKZDEWkXASC0rULsvDQt5SKVErAKgh1+nCqXh9utt2QJeNqKbGXZ8PovzaQ?=
 =?us-ascii?Q?BwTLHIbiKZNWVZkE5gpHIQINSIJxDhy86ztNxtmuIopn5KX9NIIZAdIJ4ynE?=
 =?us-ascii?Q?9GW9sQH648Qvt26M1YTDbkHPpAiopIU6AQeZhvGaKGiA7Ye2Sa5MwWIzmMlc?=
 =?us-ascii?Q?MseRqx9KR3R6fz+bi2h0Ov1yQHk6kpqMYIf96d99JygbYMvsNEkwXEGIj1uY?=
 =?us-ascii?Q?BTnW7k4Gmeb/iCAZO2Au3Iw3pkgJ2jdgTnppGoDfEMB2Xsx2dGI1X860LKQA?=
 =?us-ascii?Q?UdO54XrA+4EqXt0eMWUMHuluAGmfTIv1BZmSs67/a8yQMwxKyruqV7WhQjIw?=
 =?us-ascii?Q?HvAsNNh1wud/ykZ8O/5fOhdvE8yTDaitl9Fv/f2kIPZPBZCMDLtlmAhrVH6B?=
 =?us-ascii?Q?EQetg7RU7cAktQSLfu/ekxp+imjSoq4TrSZ/34+rvQI3bpacsi8JiCCSKj+6?=
 =?us-ascii?Q?OnW74033n+9bFxGAg1T+Iu1uNR91TnMTxaBaE+lZjYRfiXfnB0sLKkFEoag+?=
 =?us-ascii?Q?tnKV+6XFoqNhjQeUlIwdIQcoPWhq6R717RXD2KQoTVYw0rmcMlNqhPdllsCL?=
 =?us-ascii?Q?ouRsOR7yQadKbYEQ/JxSs0g7peVh+EvtLfh/g8Y9JoHACekVeaYQMOA5hei/?=
 =?us-ascii?Q?5mdwfSxGwh4ve1j+KeKHsomOXWw3ZnXsTyET7Mrw1IxXmRR7ovhUyeP5K3XF?=
 =?us-ascii?Q?J2XAW+c7fzuB7giUZgTZS9dCiVFnvGgnEyTqWbluKMGmPpBL9WgX2xfrCCYe?=
 =?us-ascii?Q?SC1xbEnR1zZ/vuOmBapGHdk1cK5nrp00VU9iCfqrKI6I8al+vZ4xHtIWjBBY?=
 =?us-ascii?Q?vTOymlc2eVZKKSHzn9Z4eSUadQ6C+hAxmmhRndkQyk58fmJH5d8OkqANuP5m?=
 =?us-ascii?Q?SOJYSro4gJLgGs/M9z1A3oB852tzFqzBU6w9OarTI63q/vVF1eJIGm4ud15e?=
 =?us-ascii?Q?kWzouaTAI/lCE2t0m0BE+K4uYsr3vPR7EKU/zxmGKh756aV16jBwkfhffN5/?=
 =?us-ascii?Q?gQUAx4MET4sLjrBncz4cGTsNQX0vD7yxM2PjTwrqiM/xMZlS5wD75Wx4RCKd?=
 =?us-ascii?Q?t5ZAKhJRMiD5Ogr4R5NIR/od3UQDSYMkp6YdKBFHt5HcwZwN3wGNj/dt/TYw?=
 =?us-ascii?Q?yeuxEYgPjC5bjmmIwU0tBn1D18scpsNaaDYYgDGb6Moy1M5Z9/zr7Z87C13Y?=
 =?us-ascii?Q?njOh0XHDN/xO3P4G2HbyWcoCCTOL97eG8/RXfhwgyzPUrpH1r3MFFh9J9FDF?=
 =?us-ascii?Q?bb1vfcAYgOyLNNjPjzSkkMUQfr8kEhctk6xg2lpCafxbrfqnVkzuh7V1E9zC?=
 =?us-ascii?Q?v3UKJv0LDXbpnNkOD3rY3QTFj94dZCGmhOzRfiH3fcV7pymvkAILHFzlu2jg?=
 =?us-ascii?Q?YCm/iAPaAS0SWDFm7Htw/FvUVbUqvUPte5vw5jlcMkk6u6cIXRikZaTlxOc3?=
 =?us-ascii?Q?pFx8CeLe1MpDdiOtm412l5mWrSQ4Iv35RtwM5MRkHEf91cajyb0E3A3/D+On?=
 =?us-ascii?Q?uqhGKiU9DiXnzm2jsU1eyMGjYkpZMHKDzq1I4iPtXRakEjoO7uteKpNDw+wZ?=
 =?us-ascii?Q?R9kBPw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(34020700016)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 14:58:28.9451
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6c4d111-35ec-4436-f173-08de550fb57a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CE0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7112
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 16 Jan 2026 14:58:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16968

meta-arago / na / 20260116143722.2135247-1-j-sahu

PRC Results: PASS

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
WARN - [meta-arago][master][PATCH v2 1/2] gstreamer1.0-plugins-good: Add QT=
6 PACKAGECONFIG support
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-arago][master][PATCH v2 2/2] meson: Add patch to fix Qt6 priva=
te header detection for cross-compilation
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887



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
- Patch Series: [meta-arago][master][PATCH v2 1/2] gstreamer1.0-plugins-goo=
d: Add QT6 PACKAGECONFIG support
- Submitter: From: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
- Date: Date: Fri, 16 Jan 2026 20:07:21 +0530
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: 2ff7465844b3a4e1d427c5313992ea1ff=
538de20

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: packagegroup-arago-console: Fix package names for alsa-ut=
ils-*
- Commit SHA: be06bc570c51981bdb0b71de0eec0dda1b52d2f6

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
  yocto-check-layers: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




