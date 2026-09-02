Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7B34C624D4
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 17:06:35 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.616.1788368786463798913
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 02 Sep 2026 10:06:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=aGy4M/mA;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=nIiuT95/;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 682GUCTV2803900;
	Wed, 2 Sep 2026 12:06:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=6GnRSsftHkzxzdco9DrIq9evd7lC+Csh+s90LBu3F
	84=; b=aGy4M/mAFDzrPPOR+j/8sRc5gbBYgpR9DfulU6eDbDyV2FCtji4/LKyic
	/CVsRvXLko5uZ73/etGbnjLoi0nKLMqfVZrwuNvhNzD9nGXEXHtiGRLCV1d2ZRUm
	EMVG7JGtnkKJggEr6PC+EdiwrwdFJ7j8NJdiljvZ+u19k9u2ybQyW+49Vb0IYAZx
	NoB6m54F3gwkHRFo2RKgTa4bG91CqHuRCjrzbqhQj4jmC9Ani6HTw4yYxngeRCV6
	xr2cTsUb0D3R+fIUwyTLQ+x854aYGmzmLSVIzWbARW9jLT7fvNNdUjKUm0d+KdUC
	nPshOr9cdikkJjdW/BzIP/DGr2IRA==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010027.outbound.protection.outlook.com [52.101.193.27])
	by m0380145.ppops.net (PPS) with ESMTPS id 4ge7gqdtp5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 02 Sep 2026 12:06:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nqClEiQaBzBtAm1ELn6rTTzJnuztzMHoSfTzXwHd6h4HgOt6hN2Yy2jGtgSII30R99YbOAVTM18zu3D9aeQketkxFwNmqufAUNSz1Vm0RC9YjNeCbeUGoOX4wRZSUcjT30xohDj6BfWFauhV7/GHiD/rpAcNyBtHlubJY0VSY99eNQAKLcz8j8JNM4XtMlp7RZjCxaQEDP+dbnCb1sUsqJwKY6CUplFP9lEM4DiVxJZOpYwosT04JzTJVBMKJTnr/KK1B2mDmKEAdi/JEMYAAzENMJK+9z1217d9tetu2mN6hH0XZjPYdoer1s/t74IYDgqdz1pxibaTpw8pSjAmLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6GnRSsftHkzxzdco9DrIq9evd7lC+Csh+s90LBu3F84=;
 b=MoiDRrxZYb858pVwNEUeQzvLbp4TcGm8m1NmqmZdDdcbSImuOB4r156UFhpDtOorDFGLOcIiPU/99vBTLG/t+Oqg2Bqz0+HEJUshkutlxKBFt4kkkLckvJh8Vw0JtcVlpFt1sGfppgBG1zvBQD/O5agvF5vwa8x5roOb5OYIJSK7Jn3xDZdj3/K8Z/Ql5+U6uEYNq1dbZ9yKYkPY/Jpagn+LxktDG0fkWdMnEu7ZcakAk78vA0hTPlaOhnxrj4kcMsvI/sm94MzLOPpuORFJp8k/wevYaUNWsPuf3ijv51KbRURyVHG1VI7HFtS3doowT0GgokZd4MWNFy5qR0uxwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6GnRSsftHkzxzdco9DrIq9evd7lC+Csh+s90LBu3F84=;
 b=nIiuT95/gSLIUTX9UWa1hFnLDi/wXLthxD+1Rert7txnevCajqTFojggXrN5cI+8RO1/xldORQgRfhPCJBswokPLWLhtQbEwyxEIL2bZljOlmhYSqQrNv8wTs4QHmgKSgJpagP//rNnPUWnkn7ssFcGNepx933ZymkGxHNC81v8=
Received: from MN2PR15CA0059.namprd15.prod.outlook.com (2603:10b6:208:237::28)
 by BN0PR10MB4949.namprd10.prod.outlook.com (2603:10b6:408:12b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 2 Sep
 2026 17:06:17 +0000
Received: from BN7PEPF00000091.namprd03.prod.outlook.com
 (2603:10b6:208:237:cafe::6d) by MN2PR15CA0059.outlook.office365.com
 (2603:10b6:208:237::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 17:06:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN7PEPF00000091.mail.protection.outlook.com (10.167.245.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 17:06:15 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 2 Sep
 2026 12:05:30 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 2 Sep
 2026 12:05:30 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 2 Sep 2026 12:05:30 -0500
Received: from [10.249.64.139] ([10.249.64.139])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 682H5UrE4155594;
	Wed, 2 Sep 2026 12:05:30 -0500
Message-ID: <579bddf2-f57a-4dcb-a209-91b95af1caa9@ti.com>
Date: Wed, 2 Sep 2026 12:05:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master/wrynose][PATCH 2/4] recipes-multimedia: Add PipeWire
 bbappend, service and config files
To: Paresh Bhagat <p-bhagat@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <v-singh1@ti.com>, <c-shilwant@ti.com>,
        <y-hegde@ti.com>, <afd@ti.com>, <j-sahu@ti.com>, <praneeth@ti.com>,
        <s-sinha@ti.com>, <s-kapoor@ti.com>, <p-gupta5@ti.com>,
        <r-soni@ti.com>, <sen@ti.com>
References: <20260901030233.686017-1-p-bhagat@ti.com>
 <20260901030233.686017-3-p-bhagat@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260901030233.686017-3-p-bhagat@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF00000091:EE_|BN0PR10MB4949:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b8db7af-9c0f-481b-cc1a-08df09147ff9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|376014|36860700016|6133799003|10067099003|4143699003|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	9KfUpG1yrcux9FnYXhIn/bCZ5qwSlOKf1wuXyCugbYNxPLgzidLBVPA7x4pU6ke6S9pPulUUshbBEWyHdH9bHot6mMDXLh6rHmsOeMbX3tsGH4BwfCHadtLXJByRxPs3yv74l/PuYZSu+f58ugvLk5f4JcZuFIhoTcrNP8ClIO/zh1jSJUx8gebPeE75XUdX8B7fhgSBFw7KgJJrjpKV3guHGJFhWycrTzM7jB3mcdBKRQbOnUcnhriA/LY27cuyYqCud5qgZ7fNOxosuz5rEi++M5OpFEouIJqYSTYbeB3aDfURCDaKW/ZNREZPBgtOUWN8Kmye5SQlZpMegPFir4Iv1htk+l8/+eWxd1e6Go+dUmnEdFnK0yBM7gKLIwXLEs28qJ6nHVhAZ49Ecxb5cnknmUnPm/0sBbG4DHYTU8eyzHRHa0mVT1MVOt6EpZSGc53VY9dHWh0n7m1stScOrdRmqZmY3/VByE7zwK97OjZndlAFtPk48PuiPi9toAsTFKZl/UXPmLR7uAxUE6ThalXp5soxhJ3pyHLX5yP9bmJMaZhr9mZlrgTq2Xjc6Q1ZVNy5Ub26AeTsJtyzO7ovk/+j7AQjsfnWwW8PUFUW+K/U1Wr+HRDVBx7cYI8+wPaps14SPDmzSkaCgp23uoSeIguwIYYbWwqgGB9fyduGK53wO/VMz8Q1XUePbWnrO5Eq19yce+mVzJOllbkgOUXUyQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(376014)(36860700016)(6133799003)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	S2057BHXk5dnP35ari2wiu3nuJCvAB/1ZnBEu7AYJinV3RE85+nd5G1cE4DJqBv8/fYWMvd7meQRyAsDaSXHxAkiGzCKqau0VbeHwAGjdONFPmpmC0DCzibFgS6Qhd/P3MKsyTtDdM50PMrBGGVOa0wAl4aHtBRBqBT4SuqLBSyrNBt1MYFWwViWiPAKCIo53o/euISames2oB8UOAUFyMf8TkFxyEncSjic/bwbPWaoqewcwfK/QbCp4M/xRj8fw63AmfZyNM6c/BYtozFbD2q7W8ZXknW/1qnqiRsim8sUguOWOmS5F5jLaOoMp9YeF4/iPOgpE5YQGvC55U6zhcz6Wr5gWOB2i/sKTTKgAeKk/JXyjESsdxatkHfnxC9NetieGgb6qAoU6EP6I54JxgLvi14ly/S3yAHAtJpw+0ZuImi+rqxKnT8lfptK9raW
X-Exchange-RoutingPolicyChecked: 
	TlQyMy2t/PpfPWTKGz3Qn+Gm2y9P+HqFNj7snUeVS9RpkGGjTSThdYHTumo0TZA829v2GbankOMd3W5gdYO7KB4Lz/dVozDJp9Ppy48cClPCm/g0vff5L6I6Jiz4JSfJ4gFsFdX6MCflXgZkqMIBzYY3+9zh1ph0xeWuBmU1oatZAHJ14/4kihJAg8eIF1e6ikWtxrZzZuawj7VQGRV3xg0tl82Icros01A5BX3vKi9+rhuwlXo4AIIUh8j0unSFYFLHcSszzYp+9YOh36GFSurNL15F9YGFt3CW/2+GY/DnrxRxpTXhXcW3lRKzBHOf+YaCJu9UtTFyue/TriHuKQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 17:06:15.9790
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b8db7af-9c0f-481b-cc1a-08df09147ff9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN7PEPF00000091.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4949
X-Authority-Analysis: v=2.4 cv=fZ6dDUQF c=1 sm=1 tr=0 ts=6a98578f cx=c_pps
 a=/qs4bcqls8FpsUBDM29/qQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8
 a=4YxNGjf1-XRZkW2kwpMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: pGppiuXZP40Id81ebK9-mdqwiYgxCCI1
X-Proofpoint-ORIG-GUID: pGppiuXZP40Id81ebK9-mdqwiYgxCCI1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE1MSBTYWx0ZWRfX+Ci5jbIw1KYg
 3vynHNkSRV3O9xMahuterBNK+xGPfV7QRiEMN31kdppoBNOQT8IPF90VpSiAdKwbifHTDtr77sJ
 KhhdMiqaKLslfqLMbKIsjENJxCvUy6s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE1MSBTYWx0ZWRfX3a8we97QknyT
 D+LAPNv3TlA9TEBJ0iIaWb6CNxz30YZYWNiSfEjW/39uaiUxZPRAD0j2wmkHwt2gaLmgHCQ3Ivs
 iH+sJ8khZ1N6yuuFXprcHBqUeI423D7gzq2k80P/MQPisDNUopyygoYU3Mwbq4axYtUssTJ5j+l
 gtvBpcF+kOmsle0lWQvhajxHhgkA9/ssjuji3fGDqNradzs74E+HCYUZ7GyRnGtkX1GBP967mD9
 NGE1pTcmgKfh0UvPLvNGO/EGAiC5VTAwgWV2yWDYz8zhRcPZ0aeDrTSy8ZuBxpYzMy6H04VO6Y+
 VXs8THViDPfEbvthANWQz8jgzG0Fr/VV0qeGFE0OIByaLfghVgXPCuhqHiyHrPhRjjsTkT4WOei
 PEMOmNZNjt1z1/oimTV5Zfz6DD+4vBqGjOSbdV4mXIVm8NkYaXc+kifrenbYwgDzt/TDD5ak+hG
 iJJNBZx6krVbF2bQ/2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020151
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 02 Sep 2026 17:06:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17649



On 8/31/2026 10:02 PM, Paresh Bhagat wrote:
> Extend the PipeWire recipe to add platform-specific ALSA configuration
> and service file. Service file added to start PipeWire as a system
> service with proper socket dependency.
> 
> Add sink and source configuration for 8-channel audio playback and
> capture on the AM62D2EVM as the default configuration is 2-channel.
> 
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>   .../pipewire/pipewire-arago.inc               | 28 +++++++++++++++++++
>   .../am62dxx-evm/90-pipewire-sink.conf         | 21 ++++++++++++++
>   .../am62dxx-evm/91-pipewire-source.conf       | 21 ++++++++++++++
>   .../pipewire/pipewire/pipewire.service        | 26 +++++++++++++++++
>   .../pipewire/pipewire_%.bbappend              |  4 +++
>   5 files changed, 100 insertions(+)
>   create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago.inc
>   create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf
>   create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf
>   create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/pipewire.service
>   create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire_%.bbappend
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
> +
> +do_install:append:am62dxx-evm() {
> +    install -d ${D}${sysconfdir}/pipewire/pipewire.conf.d
> +    install -m 0644 ${UNPACKDIR}/90-pipewire-sink.conf ${D}${sysconfdir}/pipewire/pipewire.conf.d/
> +    install -m 0644 ${UNPACKDIR}/91-pipewire-source.conf ${D}${sysconfdir}/pipewire/pipewire.conf.d/
> +}


Are these settings truly am62d specific?  And do any of the other 
platforms need special configs?

For all of the other platforms will they work without configs like these?


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

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

