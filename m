Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77211EA8138
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 15:52:15 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.25])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22733.1770738734332855978
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 10 Feb 2026 07:52:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=EsA5nqhm;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.201.25, mailfrom: p-bhagat@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=icODAEi4Hk6urA9S+KPGyeuRdxEaUqRN4Xdwb6Wy2bCWOFqHfZKpdU4eia8oy8Vvp3Rm82t996k8xusFkkBcLoLV58XCkCpv0VQBkFD5PNZ1oNgPcQdE1ybvqMXpq/lzz8pfV6S0Z9VBMu2LYIm737dHj8v5cPJ8zGZD8xRxRfRhwDeMUjH0807Ny5SZMSFlfPbKePhLGfv7wcEP77XoasCAaEERhB74aDW1jXpnaVRVQqgibA5NpHZLcMlax5699FnGVCLmWvin9FvNxyj1SzJhdceagv5xf40nW6MS3TEEehOF3fCaJJx963alz7LKcpocc9uUjqhF4jpPzVHfdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VJ9mQvyTNOjs4DKjeXC+6+/HNTizVFRMOn+PxW+WIV8=;
 b=OKekjQXZXA/Og6BoYQFWY8pSV9NMg85odU3nWVr65mnCzpOOLzglNvmpMKZsCZaMtPtnYyPC3bP4D2TEj4HQaLIiGvy57yjwXUlZRp6yDscZ4wVlIJmWbx5VFI+R9phWkStZIhdk2zYYbLW+UdN0MTHGj4UR5e9Y3CX/qRV1Z2WbUhAHtxoDmIeT9TkqbnoqH28XqFzCoAaNP2MvyctYSgcIxSrYglLXdxAqlT/bzEy5RpN61q6zn3IJDytFdHT+x6WPOC8N1p+TTPMyF0KEppw8KzF+gHn6QhaXNA6o7NgLtfIh3KAlHCK/eQ38Gw3vC+13YkrCYBMXtu4tG282rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VJ9mQvyTNOjs4DKjeXC+6+/HNTizVFRMOn+PxW+WIV8=;
 b=EsA5nqhmuNkjMbiKVGXHZXG+Fu+6J83EYboW8JOJOfgcgUDDsrvZe2tyjWYVvn47E47YbGBzmzxalRwhgZwVn+fthwYxPQtlRLqJkkaGC2Q//G164VLU+6uKGZ5WCwlonWU6a7aKB336gsyamm1Ew9EVOK5WkTpS44R1QkjdKwU=
Received: from CH2PR10CA0006.namprd10.prod.outlook.com (2603:10b6:610:4c::16)
 by IA1PR10MB6242.namprd10.prod.outlook.com (2603:10b6:208:3a2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Tue, 10 Feb
 2026 15:52:11 +0000
Received: from DS3PEPF000099D8.namprd04.prod.outlook.com
 (2603:10b6:610:4c:cafe::4a) by CH2PR10CA0006.outlook.office365.com
 (2603:10b6:610:4c::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Tue,
 10 Feb 2026 15:52:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS3PEPF000099D8.mail.protection.outlook.com (10.167.17.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Tue, 10 Feb 2026 15:52:09 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Feb
 2026 09:52:08 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Feb
 2026 09:52:08 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 10 Feb 2026 09:52:08 -0600
Received: from localhost (ula0502350.dhcp.ti.com [172.24.233.249])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61AFq7GZ032935;
	Tue, 10 Feb 2026 09:52:07 -0600
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <denis@denix.org>, <reatmon@ti.com>
CC: <praneeth@ti.com>, <v-singh1@ti.com>, <y-hegde@ti.com>, <khasim@ti.com>,
	<j-sahu@ti.com>
Subject: [master][RFC PATCH v2 0/3] Add pipeWire audio stack
Date: Tue, 10 Feb 2026 21:21:58 +0530
Message-ID: <20260210155201.3029549-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D8:EE_|IA1PR10MB6242:EE_
X-MS-Office365-Filtering-Correlation-Id: 67bc8134-72c7-489a-0603-08de68bc59af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?gyPikf3jl+0gy9iPAK1JaIVt9ytLeaR0XG/jvlmXaqaEfQNMMPDDq6OQe5TZ?=
 =?us-ascii?Q?nB9/4k9eCw31T9oQ/jcUq6hut/jrIUsW2MnyNCNLGLzffQSyEiM+NxbvbrlV?=
 =?us-ascii?Q?ZfTnHGTn2UlvyfnV3QBfpEzF/jY4kqGA57o8CNMoUqejxpU6bMEnot2+/3gs?=
 =?us-ascii?Q?0rEmgwSATENodGnI4omlA6OhnmCWS+wdF4B7Mzvf67/J8iZ59+ZmijXMhSk6?=
 =?us-ascii?Q?vRGN/NF84/HyzseFcfIIiQv2TrYGV/gy/ECAXD2d0vrf+W9COkn3lVcltN6y?=
 =?us-ascii?Q?5zjlggMEoW5GloutzWIrv7mq6jNt18joJQ/AzIBoBjKA3nOtsVCn98xmdv8f?=
 =?us-ascii?Q?EpThl57HUMP+x/MlHFW+fz/A5yVxDEQwMddbbwcq5q7pRO/UGci8XnG3ERqC?=
 =?us-ascii?Q?jGhMyIaojDJgp773eSkp3lZkaD3+vP1KAFumbnKsrxyHHAECZYfsiKSW01MJ?=
 =?us-ascii?Q?+LmQTWnkZLNbh6moIGV+cpCIAfNi3GhD0u7aWfmnLPJWV2NDom6lNLqgP4rQ?=
 =?us-ascii?Q?96TkvqbYX4kpwc4PMAYCemAXhEka0bLyBUHWlO8+5fG0GLxd/MAxITGGspsZ?=
 =?us-ascii?Q?rNyGdkpfhmAeM+dMohkqaGSWHhnDfjkbrUza6sxzpZSSPMWyXNX2OeECAwnW?=
 =?us-ascii?Q?UShAT8gUcYa0gYZwWSSA2MDoQ590utaU9Y4vzJqv52JynURX8aG98Vah2lJo?=
 =?us-ascii?Q?ROkn+i2uh9I2xfatmyOR/MhqDhJSZHdQzCnmJnrX2Luwh4WAQ7xqVPzWNNMy?=
 =?us-ascii?Q?HQlHPfqJqdVbY3kZ/ogMF/7/5AbfziQv5RfHROB9GJ1K/pF2VIncBBdD0XZr?=
 =?us-ascii?Q?YyFdgvW75W+VVsQeNU6preGGPDQMDoK7NBv5NVgD9c+CWO6N2o21QKHSlPiJ?=
 =?us-ascii?Q?fkApCowpPav98aYbuNr35P6Xsl2B7tbsEMR9EK97yP7AppKfK74fix3lFbpw?=
 =?us-ascii?Q?sLnkXixKRzfYFriwKHlsEo5JROBBDcnfvct7/OwSmIBX4oDiYF121rFaLumz?=
 =?us-ascii?Q?eaF1WgjJCuXbLOwnZHWLUgH+61peW8vfTDYyV5G7wyUWLtiK4jaiMmHbVqCF?=
 =?us-ascii?Q?+FbKJFp/YwagZxi/TFf+KJiBPsiZN4a1zYJfd4rxSCD65/5cyDBcFe4cUIVV?=
 =?us-ascii?Q?EVSrYLwzKkFlCfoxibtBG56OarVkhpjcTqcmRppCWpsmnNhGm65iJr1iaSPf?=
 =?us-ascii?Q?7TnsLwm0uTGGlar7Ir2oJ20QEaiKz7pslpe0JeRd60YeVhMy8m5AVj7JOY4Q?=
 =?us-ascii?Q?kLqi+HDptS0vOLE2Arc/GaTgEk9J2I7kd55EViD2mrsqA0xCF2yXjpH7jU/F?=
 =?us-ascii?Q?IykkMg46kueJndVwW3Q/qnvo+xQI1ZrRShs/AReihp2jIip26spxDu3aM/pw?=
 =?us-ascii?Q?4wGnQ3NHui9Dvu5gE/0pVGXTQ4zQqK8s2C9lGU5gIQ5MaUoxe6v/aIyokWCW?=
 =?us-ascii?Q?RX1QMiXyCG/g69dsu/mF4LAnSaLm5LyiXnQu3m2MvB76LbDy6mH2ijF7rWHe?=
 =?us-ascii?Q?/PzdDjY4EQcyn8X7/vNuK7DAbxzzqB6VCGcNjoXDdT4Fi36yeKnlQ7Wmr+6M?=
 =?us-ascii?Q?C2gaqLDpQRDEBGNxjnsvOuTI5NblQFQGhcKMzpSt12vkOYwjEU/eBA78GNfX?=
 =?us-ascii?Q?7g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Hhd6SCdvBkeRjeLX6Xs/hu6FvZlojYYEpoKr+9bEBUuHd2kYEGNSe24Zprf38kSCsRfCW+nkuQtBJ9Hs0PwDovdWy7nWHBnQmm+ux2MDTQVTcqeQRnmJoh8AsP89kWnDWCj0MOT6ZJ8cOzlirserJWAx+wBSn/UB79OiAXINKYYu+lAuKLa0tCFsTme1Xob4OWTuKCt7LS5KdMljRo8oodxpxHlzJwjYRT1/5f1I087xdGU4agw1u/fewQbkxHvvNnrTX/8dNCP9I62g3RdxCJ/+HDWNpcE4KcmbZP/BgUvMe9le2b+uRSFt4kGKMIboR/D4EJyJxt604ZOcMzXEXhwfyDCbYKSuBzN0KyqGn230mvHQ8SXdCxq82Ry09opQgqqnE55N2K7xWeIfkbiAoAG2rGSmzakpWz/s3ZDo1B3VMC47chCgcOUCM/T0kKN9
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 15:52:09.9905
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67bc8134-72c7-489a-0603-08de68bc59af
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099D8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6242
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 10 Feb 2026 15:52:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17095

This patch series introduces PipeWire audio support for AM62* platforms,
replacing PulseAudio with the modern PipeWire audio server architecture.
This implementation is intended for inclusion in the 12.1 release, starting
with am62* platforms.

PipeWire is a modern audio/video server that provides low-latency, high-per=
formance
audio processing with better resource management and flexible routing capab=
ilities.
WirePlumber serves as the session manager, providing policy management and =
device
configuration for PipeWire, enabling automatic audio routing and device han=
dling.

More info can be found here:
- https://pipewire.org/
- https://docs.pipewire.org/

The series includes:

Patch 1: Add PipeWire configuration files with separate configurations for
         generic AM62* (2-channel) and AM62D (8-channel) audio.
Patch 2: Add WirePlumber configuration with audio defaults service.
Patch 3: Enable PipeWire audio stack in tisdk-default-image for all AM62* v=
ariants.

Changes in v2:
- Expanded scope from AM62D-only to all AM62* platforms.
- Changed from scarthgap to master branch targeting.
- Restructured configuration approach:
  * Renamed config files from 90-multichannel.conf/92-capture.conf to
    90-pipewire-sink.conf/91-pipewire-source.conf for clarity.
  * Added generic 2-channel configurations for standard AM62* variants.
  * Added AM62D-specific 8-channel configurations in am62dxx-evm/ directory=
.
  * Updated node names for consistency (alsa_audio_sink/alsa_audio_source)
- Enhanced bbappend recipe:
  * Changed from version-specific (pipewire_1.0.9) to generic (pipewire_%).
  * Updated file installation paths to use ${WORKDIR}/sources/.
- Modified image integration approach:
  * Moved from individual package lists per machine to PIPEWIRE variable.
  * Added support for AM62* machine variants instead of just AM62D.
  * Consolidated package management within the default image recipe.
- Updated service file and script as per comments.

Link to v1: https://lists.yoctoproject.org/g/meta-arago/message/17021

Paresh Bhagat (3):
  recipes-multimedia: Add pipewire configuration files
  recipes-multimedia: Add wireplumber audio configuration
  recipes-core: tisdk-default-image Add pipewire audio stack support

 .../images/tisdk-default-image.bb             | 23 ++++++++++++++
 .../pipewire/pipewire/90-pipewire-sink.conf   | 19 ++++++++++++
 .../pipewire/pipewire/91-pipewire-source.conf | 19 ++++++++++++
 .../am62dxx-evm/90-pipewire-sink.conf         | 19 ++++++++++++
 .../am62dxx-evm/91-pipewire-source.conf       | 19 ++++++++++++
 .../pipewire/pipewire_%.bbappend              | 17 +++++++++++
 .../wireplumber/set-audio-defaults.service    | 14 +++++++++
 .../wireplumber/set-audio-defaults.sh         | 30 +++++++++++++++++++
 .../wireplumber/wireplumber_%.bbappend        | 27 +++++++++++++++++
 9 files changed, 187 insertions(+)
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/=
90-pipewire-sink.conf
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/=
91-pipewire-source.conf
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/=
am62dxx-evm/90-pipewire-sink.conf
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/=
am62dxx-evm/91-pipewire-source.conf
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire_=
%.bbappend
 create mode 100644 meta-arago-distro/recipes-multimedia/wireplumber/wirepl=
umber/set-audio-defaults.service
 create mode 100755 meta-arago-distro/recipes-multimedia/wireplumber/wirepl=
umber/set-audio-defaults.sh
 create mode 100644 meta-arago-distro/recipes-multimedia/wireplumber/wirepl=
umber_%.bbappend

--=20
2.34.1


