Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0825BC624A4
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 03:03:25 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.949.1788231804390532687
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 31 Aug 2026 20:03:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=KELy6Zxe;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=UJzFLPXg;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: p-bhagat@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 681112lY1146976;
	Mon, 31 Aug 2026 22:03:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=PwoIslcf7EAtu
	mu2qH1dBX2Ncl6GoMekkTU8tkiZObo=; b=KELy6Zxe+Vxka0frCsjMVRwP97uEg
	xZD2z0kuHNcgHG7qXX6p6+iYWrLCVN9d6UADuliDr00bBerJzWKstQoWC0ozFrOM
	4TQ8ltMf4bRytPARKlZfGL+BWQQ/hcRE5sdt48P3SfOtxl7hYVAcUE22/HjC66ot
	qivKodn0UzJpYhKwvDbd6KQvt4iZMnyWc/w0L+sr5k83fT9j8dpEsjhKKwl4u5+p
	94ghcUpKmOZqId5EoBqwdXX569BMvuy13hrqAsXimR59SUdEOArPdqvNd5xsXsoW
	jjUHeAboN+9s5YxRh16v//QDz7+JP/7KnWp3RPZ/538XrJhx/yQF/8iIg==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010056.outbound.protection.outlook.com [52.101.85.56])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gdmp2gqtu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 22:03:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wcx0xN/lX0z8+Cv20gyi8GO4rxwSTq1DPsc3OwTNShg3VmmH2poePqwPM6X2B7/dlns02NFBLXIKYDEnnkov7HvE6dGFvABzf5sSuy8Ltny7OPyPviprPobXYA5WvSgr3/UFhJ3LWPIN3o8pjiISQtsKhQCLkrn3bu6+W8KA/B8FyEvAD2f84vSV12Do8U/buTS9qObHrMkhRX/imVNIPWKlr+Wt29E1l0boL8vADC3/xdL39K2nDCyH3mSydqR1FDN87gj0lEPKfsZA3OHOXD3OghUS+gUbZEBOjWQOf6bXZaELwSpj1zB+m++ZK3KSumRnlXcc7r78J6B7sNF9Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PwoIslcf7EAtumu2qH1dBX2Ncl6GoMekkTU8tkiZObo=;
 b=EUCHTrui1sIqCRc8EfjYOxq1EutyO7knoCMwZ8mV7UhY+664xR80R0BxSGdzkoXF46xRcASlJL7kQhQ3+H8VcSYlvcX/Fj7dLjvbZYxzaFOcUZBS8caxFYi0sxKxsewb7/0oTU0cy0jw592dwp7CRR0Ja2p4mjjd0F8dipsIaZJPVTDO4wvV6zVqKvp70XJE3DiUM86oELISpOWGQCXO3B8BgwgkyLlP9yOtg+6MeX12+IOI2V9KmSrfRlERiOecMLRHlrCDgAkZOnS9l66qr8y6MYcZo2KoaI9vlpG0Nwu1zmEl/HEO3zbDHvx/G+e6CWFBZT+DgKSNzfQJ9R1j6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PwoIslcf7EAtumu2qH1dBX2Ncl6GoMekkTU8tkiZObo=;
 b=UJzFLPXggKSKwfPJIczEag0ELxWF9GJblWQuosIADk0ua6Ng/jdxd5tjvTXwU/I2Rsm9nzcDjg95mtwY8P3QyTbg+pm2K84MF/h5CWIMKpsFQaQTN/3LZtKjUevQ1BrAAPqyEOdL8+Ej5pEGq9z3pHVhUG3lUi5R0/pBMVDVLko=
Received: from CH2PR04CA0019.namprd04.prod.outlook.com (2603:10b6:610:52::29)
 by PH0PR10MB5895.namprd10.prod.outlook.com (2603:10b6:510:14c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Tue, 1 Sep
 2026 03:03:17 +0000
Received: from BL6PEPF00022572.namprd02.prod.outlook.com
 (2603:10b6:610:52:cafe::40) by CH2PR04CA0019.outlook.office365.com
 (2603:10b6:610:52::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Tue, 1
 Sep 2026 03:03:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL6PEPF00022572.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Tue, 1 Sep 2026 03:03:15 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 31 Aug
 2026 22:02:57 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 31 Aug
 2026 22:02:57 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 31 Aug 2026 22:02:57 -0500
Received: from localhost (ula0502350.dhcp.ti.com [10.24.52.241])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68132uB2938543;
	Mon, 31 Aug 2026 22:02:57 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <reatmon@ti.com>, <v-singh1@ti.com>,
        <c-shilwant@ti.com>, <y-hegde@ti.com>, <afd@ti.com>, <j-sahu@ti.com>,
        <praneeth@ti.com>, <s-sinha@ti.com>, <s-kapoor@ti.com>,
        <p-gupta5@ti.com>, <r-soni@ti.com>, <sen@ti.com>
Subject: [master/wrynose][PATCH 0/4] Add PipeWire audio stack
Date: Tue, 1 Sep 2026 08:32:29 +0530
Message-ID: <20260901030233.686017-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022572:EE_|PH0PR10MB5895:EE_
X-MS-Office365-Filtering-Correlation-Id: e8ffc359-df15-4c69-46a2-08df07d59175
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|56012099006|10067099003|6133799003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	mWrxLGSLOw+OUOLXm5C7q9TkCEWeiqis2bis1s8JeuqjOp8MVJcy4Ss9al1KnvmgXJt3iut9JgIaa0dWd/idA/oSTvLOgM56G2NbR5EIYRTqCid47k4tU9AmynYANJz2XijIQZtDnNArrCiJJXOmWcUvUXFsuSsVF33js6YUmzUKwg/SJLbFQs+qROl+NTK14/atr3dQolto5e7vJTPViJ9MxVlZJhMqxe6jH0GOecE/s8wyHLw5dorqgZ2XftUu5sg2+YvR0LeNJTJ1zAVRfVNIDflEqgCaV81z8C4w3aKhzasoVNGCwgoXZmcoyZ33dJ0xr6xNN/wuJ7Z3Fs7iJI+T6kygTOiOSSTSl33MWLQfMq/UENn5/Si3sTITsDQTKEp2J4aNGHm5fsWNYJg1g7DG+Pt4DX8KBbK+TS8JeHEFtGOjKOl46DD83gWEjJzzJAd+YhepOEdubm95PbKqUmcuIVTFAx3dtI4mCza2zZ2lpjZEEZh5QIq2Y5DJIdDQYDjNT3Sqa9dlLI+ldWKZsSgSfWOHyjGKanUtU/tWx2wzPXp0b2GcJjUVrd1nVWghvXfQ3KBD8bofEPfKqf8rTyx5cdwI3F0G6G3QcOLAwKM/lFbe05m1ltRpjzUuNHiiGR2KNqyetD2CmxoyqDmuIw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(56012099006)(10067099003)(6133799003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	njhU8FrySTvfKSXk3OWhCvwfQll2ppqe8+4+JPxaCMOCbkQW8+NB0Y2XwVGFNqzztBE42Yr2vK4cZMQp4yLNyo6nvgPg3VkEghGfKzk8MoegtgEHJ168QRBfcbGLDGj84r99Kr+0vCqR9/sN0PYmbyoySAnnNnbTMw0Fh2pwP4xpIi2dhNcWcSz6uIexLijMxAF6Hei6i46RiIWT6Oi0/pUK/ItPK1yN0XlXWh5jpCUgdzES5ynHloeSa0taT8tlD5A4Z7tvTIMafDwvDU8awnJzOMexpxuRi79NKbYgrU3v5R17gUaBwqhf8xroT43VvE2BNE7UFOwjHBDlifqGZwBDF6DJY/giC15Jbu17fnkpLy2sgpKEpHmSI9uPoBdvXy8BOthhQSYOG6th7GJgh/Q8TmFXSIDqzeI2eJqyNEj/U2/81KIcBG0PDu8W4ET+
X-Exchange-RoutingPolicyChecked: 
	rJbnG9T6AbyQ/sejw1v+WvNgqWovVu/zWRX2EjzHha7b7WTuAprvqpttQ0kcJrdza3Uf+YTradCY9RkR3cvrWDEAL/BX3gttNRUdE8ydGcfCWpSjrp+0tAaHFf2O2B04B0hJc4OUUdT8uIvOa1gBQlPoH/2ogvX7I+IJ+8+UBkSo3/uQztPp8KuJ6BmYScQ5l/xqeEy8OiPvPf1su/NaLysHmFsM+vdZJrsZxxnW+DLRdbe8+h0pXppJWXT9cRazM4BGVKN+dXIB3n9KcxjgDcINPputEbShnXe3mS1pcd4+ntzWatvVd/atKLRqU9+GHVfBGhujevvoU+ndSq2pOA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 03:03:15.8525
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8ffc359-df15-4c69-46a2-08df07d59175
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF00022572.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5895
X-Proofpoint-GUID: loXJWVHwlgupOTvjaJKkWTZ1yDp7xcGn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDAyNCBTYWx0ZWRfX2ELx2qPo0/h6
 n25ob82iFQEWDHhtdY8kYLzLXgprSa8McTfn4bhHU83bPFaokkuuOUW1GAWNpAx325Oy3jKVzqN
 3WRYfrmAlchOWv09znNYEBJaTZSsOahCVfiKgpM0KNQAJGpWhFW4Bfc4s7UEam4Lcd0wuejZXBZ
 vIelZffpWr9ut1C7MNqhCo9+u7RS/n/Kkx5xyEt+GGf2Oe6m/sKw1O0gEPRU89XkFWAoNNsLXjf
 3v14wzb4lmsDc3HFvjfEqrYKSajYAZrMYG6qAIgZaSnbFAi9a+KtxXMBKQWASl5fjDEYMhEOxJv
 dTEBiU0zH8P0gbMc9Rw98cPf+411HG1j9e7E8Dmx+2MQFZMCeJWKlzfjtNbg6zVsWIXfYcLLyvS
 1/i6ayxhNgnBa8+Mc0lRCjb+uy/cbx5xsiO3FIFsSCHCO3fEJP97kZ/ZTOObvoWf2avm+W8+1s2
 i9TA9EzqdYfG1wa+3Eg==
X-Proofpoint-ORIG-GUID: loXJWVHwlgupOTvjaJKkWTZ1yDp7xcGn
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDAyNCBTYWx0ZWRfX4IF6sBj7UEao
 KBJoSc/1jmRqajxByQlKWEHUuIEAqvX89/KrtSwsTxRkWb9Ct9At5Hh/d7pW8bmMr4R67zR6i8R
 VVWLzhC9s9F8mgeDSJmuPVEidzb6aM0=
X-Authority-Analysis: v=2.4 cv=QuVuG1yd c=1 sm=1 tr=0 ts=6a96407b cx=c_pps
 a=CnS1ju6qDdjTg6bRefQovg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=WcVicg93AAAA:8 a=iGHA9ds3AAAA:8 a=Urp1N-mI1X3pp880L9YA:9
 a=K2J6eEO5HafFHa66XerQ:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010024
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 01 Sep 2026 03:03:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17640

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

Previous RFC series
https://lists.yoctoproject.org/g/meta-arago/message/17115
Most of the review commnest from previous RFCs are addressesd here.

Paresh Bhagat (4):
  packagegroup-arago-connectivity: Remove pulseaudio
  recipes-multimedia: Add PipeWire bbappend, service and config files
  recipes-multimedia: Add wireplumber audio configuration
  recipes-core: arago-default-image: Add PipeWire audio stack

 meta-arago-distro/conf/distro/arago.conf      |  4 ---
 .../images/arago-default-image.bb             | 20 +++++++++++
 .../packagegroup-arago-connectivity.bb        |  8 -----
 .../pipewire/pipewire-arago.inc               | 28 ++++++++++++++++
 .../am62dxx-evm/90-pipewire-sink.conf         | 21 ++++++++++++
 .../am62dxx-evm/91-pipewire-source.conf       | 21 ++++++++++++
 .../pipewire/pipewire/pipewire.service        | 26 +++++++++++++++
 .../pipewire/pipewire_%.bbappend              |  4 +++
 .../wireplumber/wireplumber-arago.inc         | 33 +++++++++++++++++++
 .../wireplumber/set-audio-defaults.service    | 21 ++++++++++++
 .../wireplumber/set-audio-defaults.sh         | 32 ++++++++++++++++++
 .../wireplumber/wireplumber_%.bbappend        |  4 +++
 12 files changed, 210 insertions(+), 12 deletions(-)
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago.inc
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/pipewire.service
 create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire_%.bbappend
 create mode 100644 meta-arago-distro/recipes-multimedia/wireplumber/wireplumber-arago.inc
 create mode 100644 meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.service
 create mode 100755 meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.sh
 create mode 100644 meta-arago-distro/recipes-multimedia/wireplumber/wireplumber_%.bbappend

-- 
2.34.1


