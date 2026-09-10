Return-Path: <y-hegde@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 585EEC79FB9
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 08:16:44 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8902.1789028195560603821
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 10 Sep 2026 01:16:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Yk4Gm3P/;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=aSNdFdIW;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: y-hegde@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68A5FpWx296497;
	Thu, 10 Sep 2026 03:16:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=Ay0tsusv+baWQ0g
	TsathYrfhZly7lQv9yb+i3j3LoDg=; b=Yk4Gm3P/P8WKHtldjyMAUPS27ktzGjw
	xmkfXwXfCSOPjw/O5E7DfBck/NKqacFyBXFtbXQmyZjWT8MYGAiGCPXC3pPN9ku0
	eBVJ7v/SQNxH8esiAgp4W8ZF6PW+LXVF3wgKnYo4zEabysTOaMqGpFsGRpicwqHK
	3cs9PpSdcT19906UZDmRwGJXypBe5DVGTx3Kf7i6JHKddDd833YrLIX6D3G7ipm5
	R146b9sqhkLxrYT12aSXyUNdEfTwknse3VU6h8rC/ihZo7RLTIPmvGKLVNHuxdWv
	dBg4UCDO9mFIzfTB8ekq9MePo8I+Pk2KuxAWveRFLtiwcbMF+V8bwrg==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013052.outbound.protection.outlook.com [40.93.196.52])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gkcxgbyhr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 10 Sep 2026 03:16:31 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dvlcIKbifYAvfdP+e3A1GtIzhBv/yvzU9cMP/k71A9hBJacLq3rM7Vk6ewyZPvbumkgUlPsUp/tsAlQVLB5+54mB7Eprbf7LuMssWT9G71+56lZ492keCtv1H16mQw0NOl0bd42U7ic414dT958ercxFQaGV4wb3cjI465KVuuy33HJsb9WVZx8MspgNfngrZxF+slenPmkDZfQ2x7ZfKh/4qZJnuI4lePNpTvtpF1oKM7/VgW6flq4JSfHbYAvxmzLQTT4cHXuhhfW2V1TiEkgueyK2+D9rA0J7uMnr0EtlsFwHuMKOpAa/D2FgdejO88dekV8MwffuXHJdb49/bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ay0tsusv+baWQ0gTsathYrfhZly7lQv9yb+i3j3LoDg=;
 b=dyAzhn4RgE+K36juG7HswBnqujPUhFL0Pe0Pb7os4dHt9XMvfjnYtkb/yw8JY3TFOcO1B8H21KebgHSbhD7g7Ebou6ZNb3ps/SSQRe8G0VoFIBXvAnH4F1KY9oNOW0xqrOTUs5qVFkJ8TiaqN/fo7uFWxRRimuLc+xZ4oAL+vGzFxip9ChJyGvitc84jF8GT7kGiq3qO0UrN0BUxkqN25NFgx4rhjF8orDRFYSP55UtBz8ZBEbvMiBT5Kfu0CX8lRMxRKUBHv+UBeQCghqhJesGUNTemgU2Xb2oVwXrg16DgfIEyzQkWXdxJ4LmKdxls1VIviw6LazpHI1xhTe/r2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ay0tsusv+baWQ0gTsathYrfhZly7lQv9yb+i3j3LoDg=;
 b=aSNdFdIWFs0Rfx1MxLu4Dkds8s+dCjGcLWtCuPjj4mmaeeuw2hGuprAr52SUtpIIkuFwu8yE3Gy5McQ48vgCuIIclFIF/h4HMY7qsW0/s75Wp/518SmfeZTUNY5sOPFqH01S5z8atbLQvwDBD7l262YZcnA0fj1L8V1SGdvEdNY=
Received: from BN9PR03CA0769.namprd03.prod.outlook.com (2603:10b6:408:13a::24)
 by DSVPR10MB998076.namprd10.prod.outlook.com (2603:10b6:8:41c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.4; Thu, 10 Sep
 2026 08:16:28 +0000
Received: from BN1PEPF00004682.namprd03.prod.outlook.com
 (2603:10b6:408:13a:cafe::97) by BN9PR03CA0769.outlook.office365.com
 (2603:10b6:408:13a::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Thu, 10
 Sep 2026 08:16:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN1PEPF00004682.mail.protection.outlook.com (10.167.243.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 08:16:27 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 10 Sep
 2026 03:15:47 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 10 Sep
 2026 03:15:47 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 10 Sep 2026 03:15:47 -0500
Received: from localhost (uda1250336.dhcp.ti.com [10.24.51.123])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68A8Fk6V2938412;
	Thu, 10 Sep 2026 03:15:46 -0500
Date: Thu, 10 Sep 2026 13:45:45 +0530
From: Yogesh Hegde <y-hegde@ti.com>
To: Paresh Bhagat <p-bhagat@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <denis@denix.org>, <reatmon@ti.com>,
        <v-singh1@ti.com>, <c-shilwant@ti.com>, <afd@ti.com>, <j-sahu@ti.com>,
        <praneeth@ti.com>, <s-sinha@ti.com>, <s-kapoor@ti.com>,
        <p-gupta5@ti.com>, <r-soni@ti.com>, <sen@ti.com>
Subject: Re: [master/wrynose][PATCH 2/4] recipes-multimedia: Add PipeWire
 bbappend, service and config files
Message-ID: <20260910081545.vl276qiry2psvqel@uda1250336>
References: <20260901030233.686017-1-p-bhagat@ti.com>
 <20260901030233.686017-3-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260901030233.686017-3-p-bhagat@ti.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004682:EE_|DSVPR10MB998076:EE_
X-MS-Office365-Filtering-Correlation-Id: dfdb9eef-ce92-40cb-49d5-08df0f13cfbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|23010399003|82310400026|1800799024|4143699003|10067099003|18002099003|22082099003|6133799003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: 
	9N80ElmoPZN3jDH8EJ5MazliSo1VAFgKsLD7ZkVOUwsGyKC5WyS2kyqj9G/zhWyuIj/jcrX9tIqVaaaHQ9SVsdtGZvAl3uRYZjB1nz3aozar16tBYU0HgrrTIdfOYO04jQwuFeZGzR2ITKTS3qoLDnKLXshTkZ0tvh3S85FzV/vxm42acTRuHjf3fvekeFPT0WUHvi4oF9PdPQf70F442uj74nKSNTsc/nnhSE8F5/7/1znrX4LQnwP6tzwBuehMxdLmPzhR30UQnaFsSA9qxBywhdO1tB8T9ojcHTEjbIKue0XrLH3usorzJqJI6G3Zhw4s/UhEt3saIKBHTntxmeyErfUsI9NbF9TYWmlmhf/g0vURHQ0ZCr/RhTF19rbYQ+W8O+HLE24kl5CUCaU0C9OcSv/aHcF2edTPZvjJMA3RaJeg6RQIkepCq6Rw+X7WMt4zOH+Udwj3K/ENZ7fviBYnf+8FBpLiel6mjIdKd7O6Xzm+8+mLfW3OM2MtMk85IOmb3MhD90Bn1FCZs0TE3RyrcOLts0bdmd1uteVv6la/jZ50vE999LTx7CAJVCuIZ/0Paj/rTI55YtPjo4V6DnGexv65XiCHewBkSbtRYh5Lj1bLMLLioi+/+2jOm6f7xA+cL6vDC/JQyzOcltOGDoBRfkNQihii5MIuuf6OJ9Cvmr4H1Ro0VfJ8kP/Xz30mFmiV9jnibCSWibBCRhGiTg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(82310400026)(1800799024)(4143699003)(10067099003)(18002099003)(22082099003)(6133799003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Tl0sdXNIh7/Ao3qsxZbTzB7OckDaLGe7UCmb4pgcjgv6+1VyjIKBPLdbTra2tJa0oHJgSAUGs3/Ix7oPlfcB/nY2+2IpboK2/pwDkZv0kSBA0K/PBnjED9jOWiOzuK4A+Oi22xA4OPmoRqPIM2GxgY3DXyXVoT1AGnhAF/IHMTFtpJIcqMdkhK7GlBkbsStVA6wj4RJLyhwHPOBk4oXY2J4iZNretxJPGuqeIue8+lB/RfnlLKHlXeye1xvOjDPQVBoC1RiEsk9GW7+sOs4jgro5kEAqAflu7ReoYVPRwbZkqvCH234FuV46xRER+U7Dhtk/bkO5mUpEgPo7yJLrMhR2/WaC7jG0ETovQLqXEI7V8GxPoXrsWPvP+EJEH9URoA+5YcF/KzLIVylIctC15ebv9zQWg2amGwzP6Tkn3f3NSQyMTqMVTepFHNAlqSpz
X-Exchange-RoutingPolicyChecked: 
	5euSyMMXHIOkDNF53+c6qAhsSVLaAG4UMvIcJIwjv7tmQON63Fb3FBbpob5xGdfiysCBfddDUEHBGZPIF/AjoghzL14/WvVKHVaEjAoBifdjmWy4gTpCSFLclrC7GFtGrQHaw87OY5Bp2rlKg4GsnjbctRAfW+e2twii32JU3Z/1Cb0NwD6o5+er0FFzCITdaROK17CT8aU+/vgKL9e3z/H7c0k/Ctt3yUl0Kl9ROa4TFr1tuSyYi5STXQdvbl1yKdehwrGn+zVQx6OrM0GEiCZ2jydvz+WC4aeKFrae6TJEbCd9pIjzUGN0Cw6Yu964L99lPJzFLA6UWOJndoXO5A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 08:16:27.2994
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfdb9eef-ce92-40cb-49d5-08df0f13cfbf
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00004682.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR10MB998076
X-Proofpoint-ORIG-GUID: jg0R-mvr5SOhtB67mqoqS1ByAKXRWa00
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA5MSBTYWx0ZWRfX5+JPLw7wyiKI
 7gH5h3XKrtCwEs4KCdZrCi5tOUGckFytn72dQxhIZEjiOZAwR/1oJ/kzbw0IpDhvadMM/dRGWOK
 1wnacu9DnEYjQAj/TGui0+ae7nbJvd0=
X-Proofpoint-GUID: jg0R-mvr5SOhtB67mqoqS1ByAKXRWa00
X-Authority-Analysis: v=2.4 cv=MqbHeGae c=1 sm=1 tr=0 ts=6aa2675f cx=c_pps
 a=6cA/pxPA0XCUgbB+gUSklg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=4YxNGjf1-XRZkW2kwpMA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA5MSBTYWx0ZWRfX6iQ1M8VjUrJk
 9RwIY8+l3FaRlOD2Z9Y7gXtfJ7/zmpyZBwWaTs/NlGWaLuGHqrDj65SX2yEFqf1TiWc8EM+yZ1d
 DsUhQRGOoLx3i+8pCnE+uSrh1jz0+lsmIrM1OqHviaZyVMqeYbJLdTMt2K7DISD2awptoeeosFS
 +A7jjlb9FJDmU59D1XMi0UClLJPOl8JKcTXULjvl7NBjkbo3L5J9eewsYjm496KzI8aaEidquTs
 iOq0/v48KN3qcevxSUJQqwQTJCaUOGOivj3ab3YasP6QWSGj/Q73bBSSFPwrPAiKDKsw2pkQHDJ
 PmC6cR1VDnFyDmi6oyQQtlXcQvNzy8JVGtDYsLuNHyzdypo0j06X6FbM0qlGMNLvJYWQZ7BXH/x
 rwcG2qCU7ii4wSHQzlFPcJHlyt+2+O5Rlmo1Af+aWr0/h5Xof5voGzhgS8EJStrpzQJe7tsgPuA
 Dx5l8SYEzIER7snG4WA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100091
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 10 Sep 2026 08:16:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17660

Hi Paresh, 

On 08:32-20260901, Paresh Bhagat wrote:
> Extend the PipeWire recipe to add platform-specific ALSA configuration
> and service file. Service file added to start PipeWire as a system
> service with proper socket dependency.
> 
> Add sink and source configuration for 8-channel audio playback and
> capture on the AM62D2EVM as the default configuration is 2-channel.
> 
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>  .../pipewire/pipewire-arago.inc               | 28 +++++++++++++++++++
>  .../am62dxx-evm/90-pipewire-sink.conf         | 21 ++++++++++++++
>  .../am62dxx-evm/91-pipewire-source.conf       | 21 ++++++++++++++
>  .../pipewire/pipewire/pipewire.service        | 26 +++++++++++++++++
>  .../pipewire/pipewire_%.bbappend              |  4 +++
>  5 files changed, 100 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago.inc
>  create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf
>  create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf
>  create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/pipewire.service
>  create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire_%.bbappend
> 
> diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago.inc b/meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago.inc
> new file mode 100644
> index 00000000..b3e0c555
> --- /dev/null
> +++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago.inc
> @@ -0,0 +1,28 @@
> +PR:append = ".arago1"
> +
> +# Pipewire service for all platforms
> +FILESEXTRAPATHS:prepend := "${THISDIR}/pipewire:"
> +SRC_URI:append = " file://pipewire.service"
> +
> +# AM62D-specific config files
> +FILESEXTRAPATHS:prepend:am62dxx-evm := "${THISDIR}/pipewire:"
> +SRC_URI:append:am62dxx-evm = " \
> +    file://90-pipewire-sink.conf \
> +    file://91-pipewire-source.conf \
> +"
> +
> +do_install:append() {
> +    install -d ${D}${systemd_system_unitdir}
> +    install -m 0644 ${UNPACKDIR}/pipewire.service ${D}${systemd_system_unitdir}/
> +}

drop the do_install:append, this installs the service file even if systemd absent from the rootfs 
bloating the rootfs. pipewire recipe already installs the service file via systemd class 
`SYSTEMD_SERVICE:${PN} = "pipewire.service"`

> +
> +do_install:append:am62dxx-evm() {
> +    install -d ${D}${sysconfdir}/pipewire/pipewire.conf.d
> +    install -m 0644 ${UNPACKDIR}/90-pipewire-sink.conf ${D}${sysconfdir}/pipewire/pipewire.conf.d/
> +    install -m 0644 ${UNPACKDIR}/91-pipewire-source.conf ${D}${sysconfdir}/pipewire/pipewire.conf.d/
> +}
> +
> +FILES:${PN} += " ${sysconfdir}"
> +
> +PACKAGECONFIG:append = " pipewire-jack"
> +PACKAGECONFIG:remove = "jack"
> diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf
> new file mode 100644
> index 00000000..86481af6
> --- /dev/null
> +++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf
> @@ -0,0 +1,21 @@
> +# PipeWire source configuration for AM62D.
> +
> +context.objects = [
> +    {
> +        factory = adapter
> +        args = {
> +            factory.name           = api.alsa.pcm.sink
> +            node.name              = "alsa_audio_sink"
> +            node.description       = "Audio Output"
> +            media.class            = "Audio/Sink"
> +            api.alsa.period-size   = 1024
> +            api.alsa.headroom      = 0
> +            api.alsa.disable-mmap  = false
> +            api.alsa.disable-batch = false
> +            api.alsa.path          = "hw:AM62D2EVM,0"
> +            audio.rate             = 48000
> +            audio.channels         = 8
> +            audio.position         = [ FL FR FC LFE RL RR SL SR ]
> +        }
> +    }
> +]
> diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf
> new file mode 100644
> index 00000000..71b7ec76
> --- /dev/null
> +++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf
> @@ -0,0 +1,21 @@
> +# PipeWire source configuration for AM62D.
> +
> +context.objects = [
> +    {
> +        factory = adapter
> +        args = {
> +            factory.name           = api.alsa.pcm.source
> +            node.name              = "alsa_audio_source"
> +            node.description       = "Audio Input"
> +            media.class            = "Audio/Source"
> +            api.alsa.period-size   = 1024
> +            api.alsa.headroom      = 0
> +            api.alsa.disable-mmap  = false
> +            api.alsa.disable-batch = false
> +            api.alsa.path          = "hw:AM62D2EVM,0"
> +            audio.rate             = 48000
> +            audio.channels         = 8
> +            audio.position         = [ FL FR FC LFE RL RR SL SR ]
> +        }
> +    }
> +]
> diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire/pipewire.service b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/pipewire.service
> new file mode 100644
> index 00000000..c26bf93f
> --- /dev/null
> +++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/pipewire.service
> @@ -0,0 +1,26 @@
> +[Unit]
> +Description=PipeWire Multimedia Service
> +# Ensure kernel modules are loaded and udev has finished device processing
> +After=systemd-modules-load.service systemd-udev-settle.service
> +
> +Requires=pipewire.socket
> +
> +[Service]
> +LockPersonality=yes
> +MemoryDenyWriteExecute=yes
> +NoNewPrivileges=yes
> +SystemCallArchitectures=native
> +SystemCallFilter=@system-service
> +Type=simple
> +AmbientCapabilities=CAP_SYS_NICE
> +ExecStart=/usr/bin/pipewire
> +Restart=on-failure
> +RestartSec=2
> +RuntimeDirectory=pipewire
> +RuntimeDirectoryPreserve=yes
> +User=pipewire
> +Environment=PIPEWIRE_RUNTIME_DIR=%t/pipewire
> +
> +[Install]
> +Also=pipewire.socket pipewire-manager.socket
> +WantedBy=default.target
> \ No newline at end of file
> diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire_%.bbappend b/meta-arago-distro/recipes-multimedia/pipewire/pipewire_%.bbappend
> new file mode 100644
> index 00000000..dc32422b
> --- /dev/null
> +++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire_%.bbappend
> @@ -0,0 +1,4 @@
> +PIPEWIRE_ARAGO = ""
> +PIPEWIRE_ARAGO:arago = "pipewire-arago.inc"
> +
> +require ${PIPEWIRE_ARAGO}


-- Yogesh

