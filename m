Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85C90C9830B
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 14:56:55 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.372.1790175412309112263
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 23 Sep 2026 07:56:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=irytgqCD;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=JOvNSILw;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: p-bhagat@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68NDX5pZ461328;
	Wed, 23 Sep 2026 09:56:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=0zyAJt2U60Hz9
	wde5o7HNjCsIiqhTW0ZjTSwxLejq8s=; b=irytgqCDC/4bbiyU3Mlkq3btO+YGd
	bh8f+RL91gtsrJNN7omlSMldrmOvAo0rJeWpUyJBQpTnQH4NC7Z2TClOkhlCqJTB
	Lw7jUotvFMMe37Wg+4qcdj0ctJ4ClSA3SLckzPdyCfPPEVdUqo942vebRPB4YjoZ
	zT9V39xNgBiU+Xx40NS4e7f31c3YwpNtO+uJh3wnVyBVSF2QIGPGOGRsB+jCW8Oz
	nQmMUGdu2hTs+mz4Nb+Jz6EKVVgZPQk2dpB0JVCcMK4huqdLTmyP4q6ujw54wwwA
	zQtxbesdSMriKmyzN8AzFOlOj5ZAtWDcIvbV//PSIe6h6zCEqplD2Km8Q==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012008.outbound.protection.outlook.com [52.101.48.8])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gv3tscsqn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 09:56:49 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S/Mt01Z4CQ2qWJz/8qyK2U0tZuQ5HLjE58VPJxp6QMc43/yf3KLNPh5pPqcriSIxRMKwT3DZpObYJ+6vA6Nl9EZj69J4kseqpdAtBqDKThkzMQCJiMjphC5JqqGro/Ynv5fOV8JjslSpRf+34Ob5mA348J1cTaw+kh9i+BS+6D2mjvXQWDWg6qOFf6du597GH24DBRPHTF0kaCLVqZfhFlMZ9CTAu5qJR2ljSkXJg6neVDFUypH42nZISls/cu0zbHFGVN573KEzkrrStL9ds4r1c5XVT8SNvlsrhI1p4UxtirfvCvjOfT5vhthgzpHjYoc8g0LAjMgAxADKQgeKnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0zyAJt2U60Hz9wde5o7HNjCsIiqhTW0ZjTSwxLejq8s=;
 b=aXSniRypcz3oIkg22Qy2Oq14Y35Q/ihqQ031roXhSMZ1mtsoSa9mmWzvZZqbW0tU+EFsp6dtBeVSlnvitNNUlxCAF+SExS25TOP9ssQMjHMzLXPhdtLInR2xrdoduFoaH2ZdfISpSTQMtoIOwEVUWh7Nwxd/HaSy7c310XPWqTIrbDABga6AFUOQwgCeaRpIuu870CjIJ4Y6R9MpIrkpqLJwrvEUKp/kuD8CEczhxKtxKx88Lo436tNP/YabWSE360iju5dSIZB+PnKhzkTo/DfcZwE6g5Lo4XsFqus9oSTrW07s3kTaQKHu1RTK6BHVxqsWM2UZfwn6PERrJ3O6Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0zyAJt2U60Hz9wde5o7HNjCsIiqhTW0ZjTSwxLejq8s=;
 b=JOvNSILw7fYSY8gFYEwNiyiQglYw/HhD7blkMcnB8KIom55W5nNXfxV/3usbK66GiOfG0zo/5gxs9SB5toL+dK5TxpQa3IuarPg2elHsjpjlUzj/Wq9NEKxy/J2k3Bu1CoG9daieMOU5/tDkFEyIYvPKMgL7CroTG2eH0QZgiNY=
Received: from BLAPR03CA0083.namprd03.prod.outlook.com (2603:10b6:208:329::28)
 by DSWPR10MB997886.namprd10.prod.outlook.com (2603:10b6:8:369::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Wed, 23 Sep
 2026 14:56:46 +0000
Received: from BN1PEPF0000467F.namprd03.prod.outlook.com
 (2603:10b6:208:329:cafe::89) by BLAPR03CA0083.outlook.office365.com
 (2603:10b6:208:329::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.13 via Frontend Transport; Wed,
 23 Sep 2026 14:56:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN1PEPF0000467F.mail.protection.outlook.com (10.167.243.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 14:56:45 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 09:56:01 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 09:56:00 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 23 Sep 2026 09:56:00 -0500
Received: from localhost (ula0502350.dhcp.ti.com [10.24.52.241])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68NEtx2C2240678;
	Wed, 23 Sep 2026 09:56:00 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <denis@denix.org>,
        <j-sahu@ti.com>, <p-gupta5@ti.com>, <r-soni@ti.com>, <reatmon@ti.com>,
        <s-kapoor@ti.com>, <s-sinha@ti.com>, <sen@ti.com>, <y-hegde@ti.com>
Subject: [master/wrynose][PATCH v4 0/4] Add PipeWire audio stack
Date: Wed, 23 Sep 2026 20:25:39 +0530
Message-ID: <20260923145543.2140007-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000467F:EE_|DSWPR10MB997886:EE_
X-MS-Office365-Filtering-Correlation-Id: b58b8760-88a3-4f00-a695-08df1982e2d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|1800799024|23010399003|82310400026|56012099006|10067099003|13003099007|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	vAZ41wIpjfrYrD2VX3TNZTiIp1JlxIifvZLXUGPn3nT2PrHAAtwS71/y3vU2Rv27EeBDjHqsHOPOi/k403CALdYv9PQHwFDb+yTiyHaPx4yDGfQcjT4Mfr2PZQsjTeZNFUdqB7b+AYS6GFvYokPyoQysnfXNRshbmcu4yCmthlBS94s55E9KyUZftRaAAM9bGU6/QxeRtowqX80imR6AgrNhJY/hITagu7IXtPATsGrNqyxOEVbvSnNmJibegOeE0cAvKhfNUCZs3lN7TUubSuF/O0neCw7sky8pkoQzqd2njxjN2nd4re2IXM67nJh4CGpJ3z51KTQyhnQul/hdEfoK+YwW+gOGgipCTDBf2VZhIeN6zL+6dugaW10NU3wNjLFkZFmT4/gxjsCOMNLhBdQcqTNVQ1w/kbyWGuW/1zv2LuGDfheCRQ7ql36xxwJBSHy/O/QsYF3/ZVe/x+m+PH9gpS94/c6xFMNePSjVY3RxHHRd65RE7O3uFFuH24LouBlZaPwJN3c4z4IQDAzZ+slbMVyMih+h69DmSMw0QxZs+Ds9SfI1Pun50VTF7kTYXgZY9vCBQlKNzBQt6R24rDDKBwWRvWBc7+QymPeF6ljLKizAAs2rMH/bzn0NgNYkI764m76OdIvqyxhWvESPKw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(23010399003)(82310400026)(56012099006)(10067099003)(13003099007)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ui7C/ZGhX1lguXbaVsRJmTquCHACxktBHK64GQEWItK6okFpAwmQ7xg75Ant3I13/n9a50b64SOi4dYE2ftj3RTOqrzJHbWlqrfHtxeItHruP3Z8YyWKLkm0eRsQ9GJq91hrYRyJvdWKTta6kDnKUN/jHtx8T6vVAQ7JeMfhLV43PRgsQq6xUt1cWfHFbqC+/sbdxi22sboj2EZX8qOea4PW4dCGGtNevEOnnXC8Vsz8ztChbFAuq9GA50SlLtW96TPFin8tGJ717HCuE9o8E9eFh+cbB/MNs10qS3mqCbTi8WnMu/VdMvzTZMwQLSPHakUPycCxWYzEVvIswmz3qYE60EptpCmpJyRf2XwleskRt/wAMCVUGpFB1GC8PdOiafBMTHUTu16j3Ut6HRCpZ4VMREk4a7CbRtTS9MxMHlNDsq4Xy4Fc7ObCilLlF3Ww
X-Exchange-RoutingPolicyChecked: 
	ReL69Z5gS1xkO5yXwcN9x6iV3l67Gejqys1FXArFQNoHPCjPOXDOWRZcmQilZjFZljOOyVw/Q9tb4H5bqKf418um4cAysVqj0Z1ZK6ybRZAHrxBoucigoR9sMsydg3wGCxGCpw4GRA3Bc5vyvzkvtWRsn6U7JD29Hn47bqNhpOtk/EVw6oTVUfCT53KqpGBly8FlGX/3qJUneX+MYBPQtIieE6GWWWTXqMdyCstbDBOTBgjT8Gx84Xh4mb79K0fz99OtFhh7qan4yGzm0PO0fjY8lExM9B5l82L2BESxpXHtr+SYserd8ex7CvJIPbCoRhsFHtldPp02piQqYQCQmg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 14:56:45.0841
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b58b8760-88a3-4f00-a695-08df1982e2d5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF0000467F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR10MB997886
X-Authority-Analysis: v=2.4 cv=INaXmQvG c=1 sm=1 tr=0 ts=6ab3e8b2 cx=c_pps
 a=XFLf1xCRaRgjZQpZvgYG5g==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=WcVicg93AAAA:8 a=iGHA9ds3AAAA:8 a=Urp1N-mI1X3pp880L9YA:9
 a=K2J6eEO5HafFHa66XerQ:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: wxdlNlXi79L8sVQo2ZSX-56T45rO_if0
X-Proofpoint-GUID: wxdlNlXi79L8sVQo2ZSX-56T45rO_if0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1OSBTYWx0ZWRfX1Lif0sJV8lac
 lDcG98PjBMhCCNqVKkHyiRx0D+3PRMKQ8CuWUa9/VLoKxwbWA7hYJNjsMwbLmmrbpYwTkK+35U3
 5E7bsMqqYTI4kX3yavycS5NTNKBQ6i/KXw38ce7eLlmgJ8wPzu8yhcixE1NNvFEehpoZy2RmYfQ
 iXoYuUZJIlNR6WhmhWf5qj+bqwuDwBTJsRIz1XYv7pGQtU3WL/hdnEQWM26FWQyejOZUDW5U1Wl
 QRhDI9UnKw4zTyclWMBgd3CMf0CFfLWZQG9Szlx684NGqghUxNwCfuLoSpckt+Ej3lGvxTO9ecF
 5Acx1exo+jExiKH6tHjIy6AFq/ynX7eoBu4ow2G1YjLYsJ50FxpkOcda7KZ9SoqTEXsJmNFFXnz
 EwtFhlIwq8/ncxLErhq3iwhrwv8A24TqY/yW9P0jI4X255GAmun3XP8fsMrkttEAHplcVktGpV3
 6j6laqx8vTfKgswSLMg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1OSBTYWx0ZWRfX6IY8sOpYRblP
 e/3r9wyTqxOlK4qWjSaz+0ayX6lWDPMD4b6pNOdXHT3KbflZsBIWZmpQVI7dvoiqgucBUxI0bxW
 4VFfTlgee+qBMX6rlwMbVLM1Pg2fCR4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230059
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 23 Sep 2026 14:56:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17697

This patch series introduces PipeWire audio support for all platforms,
replacing PulseAudio with the modern PipeWire audio server architecture.

PipeWire is a modern audio/video server that provides low-latency,
high-preformance audio processing with better resource management and
flexible routing capabilities.
WirePlumber serves as the session manager, providing policy management
and device configuration for PipeWire, enabling automatic audio routing
and device handling.

More info can be found here:
- https://pipewire.org/
- https://docs.pipewire.org/

Change log
v3->v4:
	- Moved pipewire package to packagegroup-arago-multimedia
v2->v3:
	- Removed platform specific changes (meta-ti-extras)
	- Updated commit msg
	- Added pipewire packages to packagegroup-arago-connectivity
v1->v2:
	- Updated commit msg
	- Updated conf files to use default values (except 8 channel for
	  am62d)
	- Remove redundant define in pipewire and wireplumber recipe
	- Added a check for systemd before installing service files
	- Removed speexdsp to decrease image size

v3-https://lists.yoctoproject.org/g/meta-arago/message/17690
v2-https://lists.yoctoproject.org/g/meta-arago/message/17677
v1-https://lists.yoctoproject.org/g/meta-arago/message/17640

Paresh Bhagat (4):
  packagegroup-arago-connectivity: Remove pulseaudio
  pipewire: Add systemd service via bbappend
  wireplumber: Add audio defaults service and enable session manager
  packagegroup-arago-multimedia: Add PipeWire audio stack

 meta-arago-distro/conf/distro/arago.conf      |  4 ---
 .../packagegroup-arago-connectivity.bb        |  8 -----
 .../packagegroup-arago-multimedia.bb          | 18 +++++++++++
 .../pipewire/pipewire-arago.inc               | 14 ++++++++
 .../pipewire/pipewire/pipewire.service        | 26 +++++++++++++++
 .../pipewire/pipewire_%.bbappend              |  4 +++
 .../wireplumber/wireplumber-arago.inc         | 22 +++++++++++++
 .../wireplumber/set-audio-defaults.service    | 21 ++++++++++++
 .../wireplumber/set-audio-defaults.sh         | 32 +++++++++++++++++++
 .../wireplumber/wireplumber_%.bbappend        |  4 +++
 10 files changed, 141 insertions(+), 12 deletions(-)
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago.inc
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/pipewire.service
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire_%.bbappend
 create mode 100644 meta-arago-distro/recipes-multimedia/wireplumber/wireplumber-arago.inc
 create mode 100644 meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.service
 create mode 100755 meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.sh
 create mode 100644 meta-arago-distro/recipes-multimedia/wireplumber/wireplumber_%.bbappend

-- 
2.34.1


