Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43A3FE9A04A
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 05:57:39 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.35])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6275.1771394252333258799
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Feb 2026 21:57:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=RsWjt0DL;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.195.35, mailfrom: p-bhagat@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e4hMcIlK91cYzDoFwmI+hl4WHsF2MlRBrZjQxSevwYsKiLncLeMjGvBR8LvYHO+jwPIFlXLtUNth7fS5kXxnS+FEO1wN9ldjN/OJqbVQ3Y7jxVHOISJzuELQ0d+C+6NSUVYBrWqLmoj1Ts+f8Wcb1cx/MwLpBtmdXDSGepyIAD+2BCE+77tRlDUmIgL3Gn0hxGjqWmIefIn6iVpAE6C28aRacX/DKV1glG9upw8wB/QSB+xbvp802NAIMfylAFQY9aHH3Lt9pj55WYiWLJgjyafwXvJlouvgQK2HSSL1FrXkvdGb90YFDjq009ITYm7aAel9cLSIXbXkbrR4uWZ/Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lv+pLs6I5ZtkbIAvSXwQIu7ygHMCwTUKo5Ye6lVfHro=;
 b=UmDgwqagyL6eeh3Bul+Am2RoWH0X9Y2nGVQzVQtEGoHd6u/Tqe/5baQ8F/w/DkQpCG0J2ok2ALBUCjApLVf3JJMC0X/zxYCfY5VDOlu9ZWPrMz22nVyE+DErDq/8sjl4pGsBEYByncS4yXaamqukKhKIXawtl1qJwA/2Sjv7VGBwQGMfKZPtlwSsGGmThiWokk2gnR/aaisAztR/xcL1BuqCZzmRbXTqx54pIjZi6XcLMHgpYLmehvPpqiwHRUkWFqBaKbpAN7xs5RhS50YTVA4kqtSLwo0lfFGG3lsjlKLHPyWpFHf10TXahXU+EMCYSQbunMu2IASCLRT7m/HWCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lv+pLs6I5ZtkbIAvSXwQIu7ygHMCwTUKo5Ye6lVfHro=;
 b=RsWjt0DL4HZ/Dipo18hsq/j5md6E5FUwPOCHPpd0wHzqm+DIpKFkHHijjvAKSvwMZ+lQQBtjjo4IjR6sSe5Ft9W2Wrq8eF0/K1QRB2EVXBiHl/KswZXaS/AQhykOWFTaD+IEe/WEAZgKBU/9JgApYa5czDtxPNGFY1NPytCq3UU=
Received: from SN6PR2101CA0009.namprd21.prod.outlook.com
 (2603:10b6:805:106::19) by BLAPR10MB5171.namprd10.prod.outlook.com
 (2603:10b6:208:325::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 05:57:29 +0000
Received: from SN1PEPF000397B5.namprd05.prod.outlook.com
 (2603:10b6:805:106:cafe::9f) by SN6PR2101CA0009.outlook.office365.com
 (2603:10b6:805:106::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.10 via Frontend Transport; Wed,
 18 Feb 2026 05:57:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF000397B5.mail.protection.outlook.com (10.167.248.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 18 Feb 2026 05:57:28 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 23:57:27 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 23:57:27 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Feb 2026 23:57:27 -0600
Received: from localhost (ula0502350.dhcp.ti.com [172.24.233.249])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61I5vQeT4083986;
	Tue, 17 Feb 2026 23:57:27 -0600
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <praneeth@ti.com>, <reatmon@ti.com>, <v-singh1@ti.com>,
	<y-hegde@ti.com>, <j-sahu@ti.com>, <khasim@ti.com>
Subject: [master][RFC PATCH v3 0/3] Add pipeWire audio stack
Date: Wed, 18 Feb 2026 11:27:12 +0530
Message-ID: <20260218055715.219075-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B5:EE_|BLAPR10MB5171:EE_
X-MS-Office365-Filtering-Correlation-Id: d31d67e5-0427-418d-62f8-08de6eb29930
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xbufAQ8sovc8/vQFjdCx0tQ+yK4DBCyiwUAqdawBiZdIOxpl9rbbZlF7Pau8?=
 =?us-ascii?Q?0UitIj4LdJ5kyPHWW+PqSlDsoSlbcMpiyFTy+kKGC2WRvdkwClJhSce95L+N?=
 =?us-ascii?Q?QAX3JK2PRKMNzGSqY0OJbQE46OenQruIpIwp1iKKEEq1bXs+bpEMDK+d1oZC?=
 =?us-ascii?Q?a4IvFnDaF5FFhCUzeDvQgP+/RD4l6ZTqqqTRXcXBrLdKbCYXAhg1odrO48k/?=
 =?us-ascii?Q?fVe5kUr0AIJ8d2K1YIIe0KaCf8h9/LjMjgEv3QEYoPpS22F91vvHx2SWLfXi?=
 =?us-ascii?Q?DuVyNl3vv+bc0uMVJ+kKEXKxKsl3e/eO6Uxr00HCjUPipaqa6UnVB2CsqybS?=
 =?us-ascii?Q?R7WtTC2360Snt8kwYqzo9LFxICj0nznnEqcLHT9ouxBb26QNQPZWUxHl2iwb?=
 =?us-ascii?Q?7cok/7uvQEDp16VJVCvyNqNjcJa/p4NnnVj0OKfuymiHuf2x9A7JQfLqiyU2?=
 =?us-ascii?Q?m9MejSDHnwwCqDyPdvjjarsTFSoGbkhszolVhb1VSV4qCsde2WJjVPIWAk/m?=
 =?us-ascii?Q?Cygr4NUytnohhDjtdpUUifbKZDB1r1XSpSOLo029Z4iwk308cAYOleeeee3E?=
 =?us-ascii?Q?CpCZiAvLr8UpNcJ3+67g4Ljw4u/1CT4WEKe+MUVEjBOS+DfBL5RpnX9rN/9H?=
 =?us-ascii?Q?xuUf6J17vkdgsntkb3FOVFRoXcOp5sSHFWzz6N7TigIWgTzNwvMutv5RfGJQ?=
 =?us-ascii?Q?h/Xr3pNFGZzCfm8HcHikcOfJJOfZ9AhtEZjN+y4iY5F7+mOQalmo7in/UknX?=
 =?us-ascii?Q?wNhsSnLl6sYuSEXk4wvh5dNCVbEVanyu8iTWPceNguKHqOIve0MHrj5uBN/e?=
 =?us-ascii?Q?g+BerNdFDMG2z7HjjycR/NAEJNU8ONh+MGgrEsN2G2X19FbukVKTE0FQHq0j?=
 =?us-ascii?Q?d9GHXnQWWASEv4qyTwNNcB754YoGFThJHwUKSnClKmfTWBqqXz6LUo5asTdh?=
 =?us-ascii?Q?Ny3FiRpv9A50K9OdNZSW1xG2mFncRrHbtNiVACcBZULwt07OUK+1XUIXsS8/?=
 =?us-ascii?Q?plXC8RP1gcZ2+8lFnb109n3+2n0RjBpMJRc365SmXgAooo9bSINeG9r/Akot?=
 =?us-ascii?Q?1KR9v5szSIKMGosmI7lHyThWC9ERml1gO6A764mCni3wrPUj7E2LiubVldcA?=
 =?us-ascii?Q?crmUK5BDAvHD66ZupDLxgc7WvatTzaG/K3ne2YqcvDZCSS5X7pAq7ys9ok1D?=
 =?us-ascii?Q?LOs5li6luBZjvex3EQEIGoAnbfJiDZyIV2uM1oARP51IbCmqGrgZAmbCDR09?=
 =?us-ascii?Q?RUaGvbqy/TEIkqr/dtNNarSqOSoYJ2XaWLfv2VHWRvwIhZwTCoQAHrGlTZIw?=
 =?us-ascii?Q?WFDRo4LADRCZSL3i14GsadmqOSiBcHy2VT1vG2Ng3XFt91hNDUBlD6FJAiJS?=
 =?us-ascii?Q?Pb7o6ij7rfKjye7xoh0MDJPqDTyYUMdHMDSQH50ZjdZYHJV5+QRQWtrFknvu?=
 =?us-ascii?Q?Eoa+yY0gaSY0iLJQDFP7iYenDrT/cJMMJZfFUTmcR1ulLRFJcua3sPGP4fJR?=
 =?us-ascii?Q?5+JQVctyS0CWDFUdXQVqYvg2XoUL6aM536SC0lMV06eBmr4By3n7856ErFMi?=
 =?us-ascii?Q?Inqdt/+udAVvfPFGKBje6BjWdmfExhDuhY+YrQVxfXyG3+ozY+FtipuoBLIV?=
 =?us-ascii?Q?OA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	JCsn/rKlOReitCV7Purcw98u3mBicQuQuPxzmsXIkGFXenWwT16Kwybnm6AJRqmcxCSLMN0FR1AiXNC9iSCiowKFBCBGyvervblcLIsuwmAfDU0+PbmCjdcbsLGN/b0pf7tI+C8WzixL6KiZku17fZO5437QS0BtQ+jXIHtluqq6e/g7qksHXVbVKKKqrpA9IK+/JjL/e77lMNqc1J+b6UyArLLqJYOyf4rnWHMbVAF4ccWp36wQRJGPYRMzfFyvJo+wJ9Om0eAwXaPvsj2uqTGVDe9lRTOkp6gA1+kePUHPIMAPmpceJ+08RLyZlfldapkIrVXvuya4sEloR2wLxhUtIGIDGv/i8l7fCZJDNE57lK3+Srrt73XzXp6YhH+4TaWrqc55Ahb6ZBYWz5JdAyARWfK6xBVtsgKYeMct8g1h8+wdOyVDY+pxf1an3SrQ
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 05:57:28.5787
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d31d67e5-0427-418d-62f8-08de6eb29930
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000397B5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5171
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 18 Feb 2026 05:57:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17115

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
Patch 3: Enable PipeWire audio stack in arago-default-image for all AM62* v=
ariants.

Changes in v3:
- Changed target image from tisdk-default-image to arago-default-image.
- Introduced modular architecture with .inc files:
  * Created pipewire-arago.inc and wireplumber-arago.inc for better organiz=
ation.
  * Added conditional inclusion using PIPEWIRE_ARAGO and WIREPLUMBER_ARAGO =
variables.
- Updated build system references:
  * Changed from ${WORKDIR}/sources to ${UNPACKDIR} for file installation p=
aths.
- Improved directory structure:
  * Renamed AM62D config directory from am62dxx-evm/ to am62dxx/.
- Changed set-audio-defaults.sh from bash to POSIX shell (#!/bin/sh).

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

Link to v2: https://lists.yoctoproject.org/g/meta-arago/message/17095
Link to v1: https://lists.yoctoproject.org/g/meta-arago/message/17022

Paresh Bhagat (3):
  recipes-multimedia: Add pipewire configuration files
  recipes-multimedia: Add wireplumber audio configuration
  recipes-core: arago-default-image: Add pipewire audio stack support

 .../images/arago-default-image.bb             | 23 +++++++++++++
 .../pipewire/pipewire-arago.inc               | 19 +++++++++++
 .../pipewire/pipewire/90-pipewire-sink.conf   | 19 +++++++++++
 .../pipewire/pipewire/91-pipewire-source.conf | 19 +++++++++++
 .../pipewire/am62dxx/90-pipewire-sink.conf    | 19 +++++++++++
 .../pipewire/am62dxx/91-pipewire-source.conf  | 19 +++++++++++
 .../pipewire/pipewire_%.bbappend              |  4 +++
 .../wireplumber/wireplumber-arago.inc         | 28 ++++++++++++++++
 .../wireplumber/set-audio-defaults.service    | 14 ++++++++
 .../wireplumber/set-audio-defaults.sh         | 32 +++++++++++++++++++
 .../wireplumber/wireplumber_%.bbappend        |  4 +++
 11 files changed, 200 insertions(+)
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire-=
arago.inc
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/=
90-pipewire-sink.conf
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/=
91-pipewire-source.conf
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/=
am62dxx/90-pipewire-sink.conf
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/=
am62dxx/91-pipewire-source.conf
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire_=
%.bbappend
 create mode 100644 meta-arago-distro/recipes-multimedia/wireplumber/wirepl=
umber-arago.inc
 create mode 100644 meta-arago-distro/recipes-multimedia/wireplumber/wirepl=
umber/set-audio-defaults.service
 create mode 100755 meta-arago-distro/recipes-multimedia/wireplumber/wirepl=
umber/set-audio-defaults.sh
 create mode 100644 meta-arago-distro/recipes-multimedia/wireplumber/wirepl=
umber_%.bbappend

--=20
2.34.1


