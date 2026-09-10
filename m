Return-Path: <y-hegde@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63F9BC79F9F
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 08:29:54 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9085.1789028985224883448
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 10 Sep 2026 01:29:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=SuqMrhvc;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=JQLkItH6;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: y-hegde@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68A5FQ3r2299254;
	Thu, 10 Sep 2026 03:29:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=EDKjLno3mDkR3HX
	zaQCRcMDm8YioXByYq6yyNvovmRU=; b=SuqMrhvcnn2EhyLVXpPh71SjGMyegQ6
	ni7QN5PMKtMdOurNg8k8JaoENCI9Q0fAkpDEXRspC4bEDW4fLx02eullDPOsEdOq
	CJ6oYjllwAPU0QdnGGrOAYqK/CpfrPiGzX4b8Lg6W6Mhl0GWbtSBPxnOW/MLXiqc
	k96kKQm8hFnUHEUajflXKMEoRvOga2opWLFGDwsgG8Im1j0XWXFG3YQYM33aXles
	9BeZxKRq6OsvE1+hhRLz1uqBEGuZprqjqCzsO9W3fexp0ZEDl02B5BEs96l5uZl3
	B1joxflYqzxu6R1XkdydBTep+kfcdCwZVFrS68YB+nQ3r5Cz2a62l7Q==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010038.outbound.protection.outlook.com [40.93.198.38])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gkcxev1kn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 10 Sep 2026 03:29:43 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vRI8hSlvSlhErsVfEesoq9Gf8mmbnanTj+fy7wqRJLg6MkogkRoTTHX+igNdW7UK+E8WzKndDSPS+mg53/vcTO6uB/LS09PlX9YqnBply5nnfh+VTrn3GFdlMQuFW0JekQ2X1sObrY84a+84Bk+bELMjkzLLJbNogpjjecl9nOPbjv1lXk/1EOUKaawbJs2PCh8XukhCGEtlmFZnIvnRgpvUv/4uXq455AQS0BlpxKHLruNOX0azlzWJnyI/8knmEzZev8wZ7gvg+ctzGhg6XOW9K7zdmkgKRkRik2NHkYg79HZEnr5LcmNXoy66epZZTp+O6z7t02UwrYAGoXBNQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EDKjLno3mDkR3HXzaQCRcMDm8YioXByYq6yyNvovmRU=;
 b=m0cF/L7EBYiwFRtjSQlAYwl/1G/KPMeDf3feHma1uryBqNyJ43UGXbjJZLeE8zhQbl+nZF+iiU1EKly7lSC/TZ8y6SsvfLGliXqEiNy6flSFyVSS4xCd6Ufmp59cmQp7A0O+xR5AiDWcE2cVnPAbj8oYDT/Xew7EqULF+EkGz8AryRfHgINf3yZikWHqv1ytMdYbl/tEa3Jxy5LTAzqQJuZyznr7WFlkxLbANu7+Ne8lmsgB8gY3XrPOALTY9Juoioj/4D/tT9MNfY60zoIGlcuc3VEpBvQJ7eMUp9hdj0JzGpKkUgFoV4chwZgQztK/48mQCgrOZJ66Bvfk0lBjAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EDKjLno3mDkR3HXzaQCRcMDm8YioXByYq6yyNvovmRU=;
 b=JQLkItH6ERhb0jPar++NtwLCWtyL0zmHmcCD8iVKL66IUv68dnHaiIWDmeN++rCAW4JasMf4UKgZ6U8aS570Ha5Wf6ISaMpdg0RqDi7diqUuL153Nawp0yeiqjwvwlQ/ELzos/ta2prQSuH3fvZaQPqezIUHtOpYvvxDqNDAJxc=
Received: from SA1PR02CA0015.namprd02.prod.outlook.com (2603:10b6:806:2cf::19)
 by MN6PR10MB7999.namprd10.prod.outlook.com (2603:10b6:208:4f4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.5; Thu, 10 Sep
 2026 08:29:33 +0000
Received: from SA2PEPF00003AEB.namprd02.prod.outlook.com
 (2603:10b6:806:2cf:cafe::2c) by SA1PR02CA0015.outlook.office365.com
 (2603:10b6:806:2cf::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Thu, 10
 Sep 2026 08:29:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SA2PEPF00003AEB.mail.protection.outlook.com (10.167.248.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 08:29:31 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 10 Sep
 2026 03:29:13 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 10 Sep
 2026 03:29:13 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 10 Sep 2026 03:29:13 -0500
Received: from localhost (uda1250336.dhcp.ti.com [10.24.51.123])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68A8TCWs1981472;
	Thu, 10 Sep 2026 03:29:13 -0500
Date: Thu, 10 Sep 2026 13:59:11 +0530
From: Yogesh Hegde <y-hegde@ti.com>
To: Paresh Bhagat <p-bhagat@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <denis@denix.org>, <reatmon@ti.com>,
        <v-singh1@ti.com>, <c-shilwant@ti.com>, <afd@ti.com>, <j-sahu@ti.com>,
        <praneeth@ti.com>, <s-sinha@ti.com>, <s-kapoor@ti.com>,
        <p-gupta5@ti.com>, <r-soni@ti.com>, <sen@ti.com>
Subject: Re: [master/wrynose][PATCH 3/4] recipes-multimedia: Add wireplumber
 audio configuration
Message-ID: <20260910082911.tskvsfvvpxln3qdw@uda1250336>
References: <20260901030233.686017-1-p-bhagat@ti.com>
 <20260901030233.686017-4-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260901030233.686017-4-p-bhagat@ti.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEB:EE_|MN6PR10MB7999:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d393d74-4290-49cd-defc-08df0f15a363
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|23010399003|1800799024|4143699003|6133799003|10067099003|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	Psd7y9REiaw/59oR6XJemopBBdSMrlx0gK5tdlqNdr7f8yvwLipis9cqEUZscqWsYKBXQHtbSKiYFlV2zyuInzP/Zf4Z+oGgOpw3MRw1k8GBoICg2+GusI72mkmhws+JePwr5KPO7RO1anHgyJARXiaU8oBM/2/mctKq3tAdiQgOFcYmdJMKouLVyoyaO4P0wqRUcswLnmwWFrEmMP55AeRBX66L8d0UL0aGbeDN6johuZ4wW1IyFFxd0leNhWlAhNZVXOr0ZhXTS+GkyT6dg1hH9fvqyL3vrKLlpl03h315HJvyDRliG9okRNt7vViJ3jeZDRSKY/gaetK9naiUsQ5cwmwydtIflRgT5EZG2vKCSWpOVOdtJyLnrxBHzi/ERLMKEoc9UbgvYqiMsTkWrB7VVX1zIKXlNPUDUF1qCH+18gPoVm/uoSbFzsLpfwLi+3zVF88DdAVvHv5lCdY12DxQsXTZ4vQdNGfSijJyRVqb+ORydjZZQfG2Wp0BXqwZ1X0xvkpZyE/ghxaTMoQdzBbEOintxJpdTIMPytFl92dHC86bp//V/hS1NNR9GzqBCqdqFh3uzajzB5eio75ASxasxvIHH5avswFanhXkfis9OrOLfdTyw9WXHriRm1K1xMSLm7q1v3T50IhauepnzL1f1Aa44cfmjvP5mF7jj6V3gXx8aeRfLvI/wO+svWT4LthUQ64KbhrUODyQx7dOzg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(23010399003)(1800799024)(4143699003)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	hjr8CTpzGVX5mVz+LpmvOZsrwOblWZPjKg3jGoTAioYXfE0m3k9On6JvIwAlVsaEit2gmFyUEC3ndLOGefJ2kUDO0FA6GFfgH4QsozZ0snD6NJgitJLNNg/3cfjBK6WcXgd381QAFeM4GnG88IdewgwDujxQI3jxverPGMGIOOoWPKKkdqlPy+FJO+q7xOdmERB5qIkTn0T/ioH92F9k5BXl2W4ci4abcbIm+Y0G88wA/IYnOuHCWNXbbfPpmX/zlThh5dZs9jkgcn4J7DXtkmeQJYv6uONzZP7v3Wcf8NuMp//aR27oJUsSdfdmHGZjjYxItwo1F6VJX8D+L9r8A2ZhT1K3E/EqMoZtPgIRw3i66Ubdt1Agbguyw+8leUqiKuTYn2dPAGJLqGwVHccAnZMn8o4dnsx12i9uJfk3WC+LGFTXbT4SJkobieCl8OGk
X-Exchange-RoutingPolicyChecked: 
	BHoOAsfDMyABA6d3iIkyD2OVyaogudln8lqb/FcHnI9ujSGtUxkBjbqktyng+qP296ZU0kY/vlqRiaYdqz2PUnfdjKbkMTkgQ1GBrN8+9MSrvhMu2Co41/U/xRCo00Hh9ebaOoFiwy8iCGxPB4ZmlaEU9fure9bZ5hGrRUothMSYB31A6+yXq7ztY+GP4J2WRwLS6IftSOjb/tOAW3eQhZNQFStFwR0VaneSe1wqjyc50EbXezC7kG0X+FsirhQSko2qhGTa9T0FQSZkcnWdy80MLbqNru9sc9/b6z0f9C8gQm/5CztoMs+VCbqJu5EEYMtvE/xw6tocLx10E0zkDQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 08:29:31.9167
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d393d74-4290-49cd-defc-08df0f15a363
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003AEB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7999
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA5NCBTYWx0ZWRfX40fY9Wh0FsC9
 lQN5j+hzwp9/l30nLNqQvbNvfOs/GC4RlD0WD0SYiwUS410KWFexGXG+WLzZKX98vDqZQNnKrCO
 g7wKAoMlLan7/cCC8hZaxaKy2PIXoLA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA5NCBTYWx0ZWRfX6sj0+MgrPqdh
 7y7wnOhyP0kUbmJB4tZ8bxVKTtID9/S+dzjchhdX46Env4x0JVUd99g/Ogp8VgS2JoHfVQc+e5F
 aUXJ38F7rbmh6yxVp+97jT7PIGpIxiuAJvHkGk7S9OukRZrA61bVVMC0WDoY444OM6sPQ065+k4
 clCE1eX54CvqABtaHauoRddTEs/Qb1dRrNljo0aXrGuCwvQPDEbccuPBcdI4wV4aFfjdM5xBs90
 sYFp+rGvasAVoGxF+1TzF/+0cg2QBTNVtEOXiYrTcJHrpODrzbFP7VSJJSFcjnUQ6A52haMRFml
 EyzfnHRhOpAzYMo+6hVfN1qDxBjul5bBnfXBkxbYa3CsnBdtXNbIEMgpuMK3yC/QCcMuff5qC7B
 jhMN87gd612L0WDC/7/G35iXrqfip1CoEjd+qD2FLS2gGp0f8TLxcf/vw1RrNM0IFr3T9b2MaGH
 9Z6zOmcYeBXzgXB+PKA==
X-Proofpoint-GUID: NlHxYc1xrxNRS20_cjlnX7IJNJT1hukK
X-Authority-Analysis: v=2.4 cv=F8fC5ahN c=1 sm=1 tr=0 ts=6aa26a77 cx=c_pps
 a=04So32024hOmtaefayDOVw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8
 a=NJa33is7fccks0xoRA4A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: NlHxYc1xrxNRS20_cjlnX7IJNJT1hukK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100094
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 10 Sep 2026 08:29:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17661

Hi Paresh, 

On 08:32-20260901, Paresh Bhagat wrote:
> Extend the wireplumber recipe to enable the session manager on all
> plaorms and provide AM62D2 EVM specific audio initialization.
> A set-audio-defaults.sh script is packaged to configure default audio
> sinks and sources at runtime, managed by a dedicated systemd service
> that runs after wireplumber starts.
> 
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>  .../wireplumber/wireplumber-arago.inc         | 33 +++++++++++++++++++
>  .../wireplumber/set-audio-defaults.service    | 21 ++++++++++++
>  .../wireplumber/set-audio-defaults.sh         | 32 ++++++++++++++++++
>  .../wireplumber/wireplumber_%.bbappend        |  4 +++
>  4 files changed, 90 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-multimedia/wireplumber/wireplumber-arago.inc
>  create mode 100644 meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.service
>  create mode 100755 meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.sh
>  create mode 100644 meta-arago-distro/recipes-multimedia/wireplumber/wireplumber_%.bbappend
> 
> diff --git a/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber-arago.inc b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber-arago.inc
> new file mode 100644
> index 00000000..6325d26c
> --- /dev/null
> +++ b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber-arago.inc
> @@ -0,0 +1,33 @@
> +PR:append = ".arago1"
> +
> +FILESEXTRAPATHS:prepend:am62dxx-evm := "${THISDIR}/wireplumber:"
> +
> +SRC_URI:append:am62dxx-evm = " \
> +    file://set-audio-defaults.sh \
> +    file://set-audio-defaults.service \
> +"
> +
> +inherit systemd
> +
> +# Enable wireplumber for all platforms
> +SYSTEMD_PACKAGES = "${PN}"
> +SYSTEMD_SERVICE:${PN} = "wireplumber.service"

`wireplumber.service` file seems to be missing. `meta-openembedded` does
not add the file neither does `meta-arago` nor the patch.

> +SYSTEMD_AUTO_ENABLE:${PN} = "enable"
> +
> +do_install:append:am62dxx-evm() {
> +    # Install the script
> +    install -d ${D}${bindir}
> +    install -m 0755 ${UNPACKDIR}/set-audio-defaults.sh ${D}${bindir}/
> +
> +    # Install the systemd service file
> +    install -d ${D}${systemd_system_unitdir}
> +    install -m 0644 ${UNPACKDIR}/set-audio-defaults.service ${D}${systemd_system_unitdir}/
> +}
> +
> +SYSTEMD_PACKAGES:am62dxx-evm = "${PN}"
> +SYSTEMD_SERVICE:${PN}:am62dxx-evm = "wireplumber.service set-audio-defaults.service"

Consider append instead of `=` in the line above, so that the variable does not get
overridden. 

> +SYSTEMD_AUTO_ENABLE:${PN}:am62dxx-evm = "enable"

Is there a need to re-define `SYSTEMD_AUTO_ENABLE:${PN}:am62dxx-evm = "enable"` 
and `SYSTEMD_PACKAGES:am62dxx-evm = "${PN}"` ?

> +
> +FILES:${PN} += " \
> +    ${bindir} \
> +"
> diff --git a/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.service b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.service
> new file mode 100644
> index 00000000..191b89f5
> --- /dev/null
> +++ b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.service
> @@ -0,0 +1,21 @@
> +[Unit]
> +Description=Set PipeWire Default Audio Devices
> +# Wait for pipewire and wireplumber services to be started
> +After=pipewire.service wireplumber.service
> +# Ensure udev has settled so audio devices are available
> +After=systemd-udev-settle.service
> +Wants=pipewire.service wireplumber.service
> +
> +[Service]
> +Type=oneshot
> +ExecStart=/usr/bin/set-audio-defaults.sh
> +StandardOutput=append:/var/log/set-audio-defaults-output.log
> +StandardError=append:/var/log/set-audio-defaults-error.log
> +RemainAfterExit=yes
> +TimeoutStartSec=90
> +# Restart on failure with delay
> +Restart=on-failure
> +RestartSec=5
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.sh b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.sh
> new file mode 100755
> index 00000000..49be177e
> --- /dev/null
> +++ b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.sh
> @@ -0,0 +1,32 @@
> +#!/bin/sh
> +
> +# Wait for WirePlumber to be ready
> +i=1
> +while [ "$i" -le 30 ]; do
> +    wpctl status >/dev/null 2>&1 && break
> +    sleep 1
> +    i=$((i + 1))
> +done
> +
> +# Additional delay for nodes to appear
> +sleep 2
> +
> +# Find audio sink ID
> +SINK_ID=$(pw-cli info alsa_audio_sink 2>/dev/null | head -n 1 | awk '{print $2}')
> +if [ -n "$SINK_ID" ]; then
> +    wpctl set-default "$SINK_ID"
> +    echo "Set default sink to ID: $SINK_ID (alsa_audio_sink)"
> +else
> +    echo "Could not find alsa_audio_sink"
> +fi
> +
> +# Find audio source ID
> +SOURCE_ID=$(pw-cli info alsa_audio_source 2>/dev/null | head -n 1 | awk '{print $2}')
> +if [ -n "$SOURCE_ID" ]; then
> +    wpctl set-default "$SOURCE_ID"
> +    echo "Set default source to ID: $SOURCE_ID (alsa_audio_source)"
> +else
> +    echo "Could not find alsa_audio_source"
> +fi
> +
> +echo "Done"
> diff --git a/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber_%.bbappend b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber_%.bbappend
> new file mode 100644
> index 00000000..541b2963
> --- /dev/null
> +++ b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber_%.bbappend
> @@ -0,0 +1,4 @@
> +WIREPLUMBER_ARAGO = ""
> +WIREPLUMBER_ARAGO:arago = "wireplumber-arago.inc"
> +
> +require ${WIREPLUMBER_ARAGO}

-- Yogesh 

