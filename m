Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAC7DCD6E79
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 19:42:53 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.63319.1780947766609762978
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 08 Jun 2026 12:42:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=uT6KxPzE;
 spf=pass (domain: ti.com, ip: 40.107.209.64, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oPZ/uQHI/luVP7bMnteiwMZYlvUWd4Iwqm8mstxNKS1WOc0kWk1C0u58hAahY8/MkE4+uuweTjKalAw3dsF6FOLOrm5ojnmgjI/etaOw2vU5w11eiVu3jv4Chq4wSq4uYVnOus7Jsqc1OsCLkBFe2oK+r3rW1Lm/oTmnWrN8+u5jpkh2zuuSCyltF7VqTlqoTsbDBhj+b378YRXrr5pAzWY/z7O7eGxI28Vpo74MuoJjIU+s2pIDhwRM0lw/1lkSfcgQGRwPa2DUgRuzw/ECvWe7o3GRurzNQBRAQKxyRe5VsS0z0tTUb5nnszJN4C4rC2kIbYWCUGecvfglaofpYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=814DXaVzcvb7sCHBDg6MIB3jGANM2eWpwR4LKfQas5k=;
 b=NjO9DStKzHNv13Xv+uVkvhOOs5dGAEY7FbIRZfYSPuoKbpRhYqlqr+UQtfnRJcYH9GXedEL5vD17Cld1MkJn7TEVa50SLMeNRT3iDzmdm6M6cFnfjLfLzrlXvA3YDQ6y4ZWDTLjqNRNQYZptMi+sa9dfoCT8vxV2GQaleSszwzjpFRRT5zEON5KWV1LgmGgak6+dm/JPEhv9fw17EmMl45YURefHM8Lot4CIKlXd54sA9wJ/e+T2NHopmObcafdO6akPr1MQpmsPC7Pr5uW6U0UIGwOvSRjyrhuuq7R0Jg4xRddL4pV7ZPUPWKztpaKOeASdtwXNiAj7oXkx7kchVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=814DXaVzcvb7sCHBDg6MIB3jGANM2eWpwR4LKfQas5k=;
 b=uT6KxPzEHklurgdzd5YoGgptde/Qt8GmNDI1jE5lgJlQMhwIwE/l7ajJ6lCttY0noTbW82KXbHdyG0jGXRm5pvAYCSwe0rRyG5R9ZuD8OwIMVbqkKNNxhBJt0VmNHIc4R0fPxCVLIhymXb0v7m5i3ZG+l1i7KafpquQTYNPB3NY=
Received: from CH0P221CA0018.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11c::19)
 by SJ0PR10MB6351.namprd10.prod.outlook.com (2603:10b6:a03:479::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 19:42:42 +0000
Received: from DS2PEPF00003441.namprd04.prod.outlook.com
 (2603:10b6:610:11c:cafe::42) by CH0P221CA0018.outlook.office365.com
 (2603:10b6:610:11c::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.13 via Frontend Transport; Mon, 8
 Jun 2026 19:42:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS2PEPF00003441.mail.protection.outlook.com (10.167.17.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Mon, 8 Jun 2026 19:42:42 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 8 Jun
 2026 14:42:41 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 8 Jun
 2026 14:42:41 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 8 Jun 2026 14:42:41 -0500
Received: from [128.247.81.216] (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.216])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 658Jge7K093431;
	Mon, 8 Jun 2026 14:42:41 -0500
Message-ID: <d6a7ab7a-7015-48a0-a748-c29cd0dc9eba@ti.com>
Date: Mon, 8 Jun 2026 14:42:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [oe-layersetup][master][PATCH]
 poky-{wrynose,master}: Add meta-openembedded
To: <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
References: <20260605201200.4033109-1-reatmon@ti.com>
Content-Language: en-US
From: Antonios Christidis <a-christidis@ti.com>
In-Reply-To: <20260605201200.4033109-1-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003441:EE_|SJ0PR10MB6351:EE_
X-MS-Office365-Filtering-Correlation-Id: dff421a7-cfa4-4dab-f00f-08dec5961b37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|13003099007|3023799007|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	scfmrhqd4g79JPD0WDD7GkfVnk/bvzT99n5RtYUUZqHyyzdAKQ9RgLQfgrbfl+GoijiOePuTvSvpGsOw6M9QXVAFcTwQNN7WFaKeAczFy8bSsAhqEVbyixbKVoQ+ymBt8HaAKMPwKW4dq1JwJ6EnYU+3hNNeaTkC4rh7TsNGb2apTA77/HmcEqEh2y4Nmu6pHgD2KVixqqn6CXtAPu1KPhy1QPlfXFbtcZBFwZUCbBxP0BDdnGZIN9WTEk483Af5NkaU05NDKdp8MkLHIQiHYipDIc1Vj/rlVOSeJI294dieqCQC/vNPvIehavx/QQSkzc5QYzrKZOiT+P4GcIo4g85rAVlb2HqQpi2k7BNFBnPYFOMt2F0boUPO/PcO2bKLMobm4bgMeNv/2P1yoBL+j4mi1Ix70dm8ht5t4FpkJ1T8QUq5nFRj27kUBKb1Zsn0zIFnNKQumdQ5o2hfjwOCvASouE3z2OBbJgSSfKdmX/qc8f+QCVQ2hoQNqBsYlMD0JzzQRs6ZUOi8SFJmYI/kHSO0Inx0ddVZqxHKyFMnrIqSvjPSQnZiZglnY8ZLpMlgG1eD68ofMgj7TrUsdVAiUS3tfbZ/8m77mmrLaQ4huP8bgOrQS5H1gL+ogtIlRcx00skWdX3pT/njA7ZIsANKLaOzu0QKwDMtkbdwaRbR3Ac=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(13003099007)(3023799007)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	QO82bQMPeN4kSIzNr0CeshB9qh+9yUm4jt4OMj3J0BqADqecJDv8sbfGUk0MXCNeessKRohGHenqmylHNqwNapvDSXPzYq4cPrURItgrULk+ahvNBuckTjDHGTt3NZFzqjzFvgURePeRUImciNDp2HWANHk5hPKcDQQfqvehGKA47DqwS9TXV0q5YVEYcIw5emR96B3jFc/a6/vuYHuuaJlDgEKs9AodK4XesYsSNwfvgapnrNR8fMdCqtt8r14iVvQ+R6coYvJu8v6k/q2gVKf+1bmJRLrHyiGkMgirQ+ewLBQCBCi1oyCLSNNC/c69z6jrNugfiWojfypTy5wjk52CTjrYXuVTALYXqdMjmzYHSUcmdKcHhOKOYyn/onky0yPzGrgWk++vLeiOk+M8PrVtNy7U5zHw8b1coBaVmSgA+hQxOM5KICkrL15nPBLD
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 19:42:42.4611
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dff421a7-cfa4-4dab-f00f-08dec5961b37
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003441.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB6351
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 08 Jun 2026 19:42:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17552

As requested, tested the following patch and this looks good.


Tested-by: Antonios Christidis <a-christidis@ti.com>


On 6/5/26 3:11 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
> We missed the fact that meta-ti-test requires a few layers from
> meta-openembedded.
>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   bitbake-setup/poky-master-config.conf.json      | 13 ++++++++++++-
>   bitbake-setup/poky-master-wip-config.conf.json  | 13 ++++++++++++-
>   bitbake-setup/poky-wrynose-config.conf.json     | 13 ++++++++++++-
>   bitbake-setup/poky-wrynose-wip-config.conf.json | 13 ++++++++++++-
>   configs/poky-master-config.txt                  |  1 +
>   configs/poky-master-wip-config.txt              |  1 +
>   configs/poky-wrynose-config.txt                 |  1 +
>   configs/poky-wrynose-wip-config.txt             |  1 +
>   kas/poky-master-config.yml                      | 10 ++++++++++
>   kas/poky-master-wip-config.yml                  | 10 ++++++++++
>   kas/poky-wrynose-config.yml                     | 10 ++++++++++
>   kas/poky-wrynose-wip-config.yml                 | 10 ++++++++++
>   src/configs/poky-master-config.xml              |  8 ++++++++
>   src/configs/poky-master-wip-config.xml          |  8 ++++++++
>   src/configs/poky-wrynose-config.xml             |  8 ++++++++
>   src/configs/poky-wrynose-wip-config.xml         |  8 ++++++++
>   16 files changed, 124 insertions(+), 4 deletions(-)
>
> diff --git a/bitbake-setup/poky-master-config.conf.json b/bitbake-setup/poky-master-config.conf.json
> index 4726117..854cd44 100644
> --- a/bitbake-setup/poky-master-config.conf.json
> +++ b/bitbake-setup/poky-master-config.conf.json
> @@ -35,6 +35,17 @@
>         },
>         "path": "meta-yocto"
>       },
> +    "meta-openembedded": {
> +      "git-remote": {
> +        "remotes": {
> +          "origin": {
> +            "uri": "https://git.openembedded.org/meta-openembedded"
> +          }
> +        },
> +        "rev": "master"
> +      },
> +      "path": "meta-openembedded"
> +    },
>       "meta-ti": {
>         "git-remote": {
>           "remotes": {
> @@ -74,7 +85,7 @@
>         {
>           "name": "poky",
>           "description": "Yocto Project Poky reference distro build",
> -        "bb-layers": [ "meta-yocto/meta-poky","meta-yocto/meta-yocto-bsp","meta-ti/meta-ti-test","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","oe-layersetup" ],
> +        "bb-layers": [ "meta-yocto/meta-poky","meta-yocto/meta-yocto-bsp","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-filesystems","meta-ti/meta-ti-test","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","oe-layersetup" ],
>           "oe-fragments": [ "oe-layersetup/localconf/local-poky-v3" ],
>           "oe-fragments-one-of": {
>             "machine": {
> diff --git a/bitbake-setup/poky-master-wip-config.conf.json b/bitbake-setup/poky-master-wip-config.conf.json
> index b949b3f..3b58e71 100644
> --- a/bitbake-setup/poky-master-wip-config.conf.json
> +++ b/bitbake-setup/poky-master-wip-config.conf.json
> @@ -35,6 +35,17 @@
>         },
>         "path": "meta-yocto"
>       },
> +    "meta-openembedded": {
> +      "git-remote": {
> +        "remotes": {
> +          "origin": {
> +            "uri": "https://git.openembedded.org/meta-openembedded"
> +          }
> +        },
> +        "rev": "master"
> +      },
> +      "path": "meta-openembedded"
> +    },
>       "meta-ti": {
>         "git-remote": {
>           "remotes": {
> @@ -74,7 +85,7 @@
>         {
>           "name": "poky",
>           "description": "Yocto Project Poky reference distro build",
> -        "bb-layers": [ "meta-yocto/meta-poky","meta-yocto/meta-yocto-bsp","meta-ti/meta-ti-test","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","oe-layersetup" ],
> +        "bb-layers": [ "meta-yocto/meta-poky","meta-yocto/meta-yocto-bsp","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-filesystems","meta-ti/meta-ti-test","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","oe-layersetup" ],
>           "oe-fragments": [ "oe-layersetup/localconf/local-poky-v3" ],
>           "oe-fragments-one-of": {
>             "machine": {
> diff --git a/bitbake-setup/poky-wrynose-config.conf.json b/bitbake-setup/poky-wrynose-config.conf.json
> index 80c5557..9f6617c 100644
> --- a/bitbake-setup/poky-wrynose-config.conf.json
> +++ b/bitbake-setup/poky-wrynose-config.conf.json
> @@ -35,6 +35,17 @@
>         },
>         "path": "meta-yocto"
>       },
> +    "meta-openembedded": {
> +      "git-remote": {
> +        "remotes": {
> +          "origin": {
> +            "uri": "https://git.openembedded.org/meta-openembedded"
> +          }
> +        },
> +        "rev": "wrynose"
> +      },
> +      "path": "meta-openembedded"
> +    },
>       "meta-ti": {
>         "git-remote": {
>           "remotes": {
> @@ -74,7 +85,7 @@
>         {
>           "name": "poky",
>           "description": "Yocto Project Poky reference distro build",
> -        "bb-layers": [ "meta-yocto/meta-poky","meta-yocto/meta-yocto-bsp","meta-ti/meta-ti-test","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","oe-layersetup" ],
> +        "bb-layers": [ "meta-yocto/meta-poky","meta-yocto/meta-yocto-bsp","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-filesystems","meta-ti/meta-ti-test","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","oe-layersetup" ],
>           "oe-fragments": [ "oe-layersetup/localconf/local-poky-v3" ],
>           "oe-fragments-one-of": {
>             "machine": {
> diff --git a/bitbake-setup/poky-wrynose-wip-config.conf.json b/bitbake-setup/poky-wrynose-wip-config.conf.json
> index 6906490..2bac793 100644
> --- a/bitbake-setup/poky-wrynose-wip-config.conf.json
> +++ b/bitbake-setup/poky-wrynose-wip-config.conf.json
> @@ -35,6 +35,17 @@
>         },
>         "path": "meta-yocto"
>       },
> +    "meta-openembedded": {
> +      "git-remote": {
> +        "remotes": {
> +          "origin": {
> +            "uri": "https://git.openembedded.org/meta-openembedded"
> +          }
> +        },
> +        "rev": "wrynose"
> +      },
> +      "path": "meta-openembedded"
> +    },
>       "meta-ti": {
>         "git-remote": {
>           "remotes": {
> @@ -74,7 +85,7 @@
>         {
>           "name": "poky",
>           "description": "Yocto Project Poky reference distro build",
> -        "bb-layers": [ "meta-yocto/meta-poky","meta-yocto/meta-yocto-bsp","meta-ti/meta-ti-test","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","oe-layersetup" ],
> +        "bb-layers": [ "meta-yocto/meta-poky","meta-yocto/meta-yocto-bsp","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-filesystems","meta-ti/meta-ti-test","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","oe-layersetup" ],
>           "oe-fragments": [ "oe-layersetup/localconf/local-poky-v3" ],
>           "oe-fragments-one-of": {
>             "machine": {
> diff --git a/configs/poky-master-config.txt b/configs/poky-master-config.txt
> index 45639a7..d92ea2c 100644
> --- a/configs/poky-master-config.txt
> +++ b/configs/poky-master-config.txt
> @@ -3,6 +3,7 @@
>   
>   bitbake,https://git.openembedded.org/bitbake,master,HEAD
>   meta-yocto,https://git.yoctoproject.org/meta-yocto,master,HEAD,layers=meta-poky:meta-yocto-bsp
> +meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HEAD,layers=meta-networking:meta-python:meta-oe:meta-filesystems
>   meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=meta-ti-test:meta-ti-extras:meta-beagle:meta-ti-bsp
>   meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
>   oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
> diff --git a/configs/poky-master-wip-config.txt b/configs/poky-master-wip-config.txt
> index 0a14f48..7f9ca86 100644
> --- a/configs/poky-master-wip-config.txt
> +++ b/configs/poky-master-wip-config.txt
> @@ -3,6 +3,7 @@
>   
>   bitbake,https://git.openembedded.org/bitbake,master,HEAD
>   meta-yocto,https://git.yoctoproject.org/meta-yocto,master,HEAD,layers=meta-poky:meta-yocto-bsp
> +meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HEAD,layers=meta-networking:meta-python:meta-oe:meta-filesystems
>   meta-ti,https://git.yoctoproject.org/meta-ti,master-wip,HEAD,layers=meta-ti-test:meta-ti-extras:meta-beagle:meta-ti-bsp
>   meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
>   oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
> diff --git a/configs/poky-wrynose-config.txt b/configs/poky-wrynose-config.txt
> index 50d7a79..ae03273 100644
> --- a/configs/poky-wrynose-config.txt
> +++ b/configs/poky-wrynose-config.txt
> @@ -3,6 +3,7 @@
>   
>   bitbake,https://git.openembedded.org/bitbake,2.18,HEAD
>   meta-yocto,https://git.yoctoproject.org/meta-yocto,wrynose,HEAD,layers=meta-poky:meta-yocto-bsp
> +meta-openembedded,https://git.openembedded.org/meta-openembedded,wrynose,HEAD,layers=meta-networking:meta-python:meta-oe:meta-filesystems
>   meta-ti,https://git.yoctoproject.org/meta-ti,wrynose,HEAD,layers=meta-ti-test:meta-ti-extras:meta-beagle:meta-ti-bsp
>   meta-arm,https://git.yoctoproject.org/meta-arm,wrynose,HEAD,layers=meta-arm:meta-arm-toolchain
>   oe-core,https://git.openembedded.org/openembedded-core,wrynose,HEAD,layers=meta
> diff --git a/configs/poky-wrynose-wip-config.txt b/configs/poky-wrynose-wip-config.txt
> index c541fb2..eed3890 100644
> --- a/configs/poky-wrynose-wip-config.txt
> +++ b/configs/poky-wrynose-wip-config.txt
> @@ -3,6 +3,7 @@
>   
>   bitbake,https://git.openembedded.org/bitbake,2.18,HEAD
>   meta-yocto,https://git.yoctoproject.org/meta-yocto,wrynose,HEAD,layers=meta-poky:meta-yocto-bsp
> +meta-openembedded,https://git.openembedded.org/meta-openembedded,wrynose,HEAD,layers=meta-networking:meta-python:meta-oe:meta-filesystems
>   meta-ti,https://git.yoctoproject.org/meta-ti,wrynose-wip,HEAD,layers=meta-ti-test:meta-ti-extras:meta-beagle:meta-ti-bsp
>   meta-arm,https://git.yoctoproject.org/meta-arm,wrynose,HEAD,layers=meta-arm:meta-arm-toolchain
>   oe-core,https://git.openembedded.org/openembedded-core,wrynose,HEAD,layers=meta
> diff --git a/kas/poky-master-config.yml b/kas/poky-master-config.yml
> index 1b8035c..fea9644 100644
> --- a/kas/poky-master-config.yml
> +++ b/kas/poky-master-config.yml
> @@ -23,6 +23,16 @@ repos:
>         meta-poky:
>         meta-yocto-bsp:
>   
> +  meta-openembedded:
> +    url: "https://git.openembedded.org/meta-openembedded"
> +    branch: "master"
> +    path: "sources/meta-openembedded"
> +    layers:
> +      meta-networking:
> +      meta-python:
> +      meta-oe:
> +      meta-filesystems:
> +
>     meta-ti:
>       url: "https://git.yoctoproject.org/meta-ti"
>       branch: "master"
> diff --git a/kas/poky-master-wip-config.yml b/kas/poky-master-wip-config.yml
> index ede97d9..1df0998 100644
> --- a/kas/poky-master-wip-config.yml
> +++ b/kas/poky-master-wip-config.yml
> @@ -23,6 +23,16 @@ repos:
>         meta-poky:
>         meta-yocto-bsp:
>   
> +  meta-openembedded:
> +    url: "https://git.openembedded.org/meta-openembedded"
> +    branch: "master"
> +    path: "sources/meta-openembedded"
> +    layers:
> +      meta-networking:
> +      meta-python:
> +      meta-oe:
> +      meta-filesystems:
> +
>     meta-ti:
>       url: "https://git.yoctoproject.org/meta-ti"
>       branch: "master-wip"
> diff --git a/kas/poky-wrynose-config.yml b/kas/poky-wrynose-config.yml
> index 34577f3..575b468 100644
> --- a/kas/poky-wrynose-config.yml
> +++ b/kas/poky-wrynose-config.yml
> @@ -23,6 +23,16 @@ repos:
>         meta-poky:
>         meta-yocto-bsp:
>   
> +  meta-openembedded:
> +    url: "https://git.openembedded.org/meta-openembedded"
> +    branch: "wrynose"
> +    path: "sources/meta-openembedded"
> +    layers:
> +      meta-networking:
> +      meta-python:
> +      meta-oe:
> +      meta-filesystems:
> +
>     meta-ti:
>       url: "https://git.yoctoproject.org/meta-ti"
>       branch: "wrynose"
> diff --git a/kas/poky-wrynose-wip-config.yml b/kas/poky-wrynose-wip-config.yml
> index e023e9f..a388a04 100644
> --- a/kas/poky-wrynose-wip-config.yml
> +++ b/kas/poky-wrynose-wip-config.yml
> @@ -23,6 +23,16 @@ repos:
>         meta-poky:
>         meta-yocto-bsp:
>   
> +  meta-openembedded:
> +    url: "https://git.openembedded.org/meta-openembedded"
> +    branch: "wrynose"
> +    path: "sources/meta-openembedded"
> +    layers:
> +      meta-networking:
> +      meta-python:
> +      meta-oe:
> +      meta-filesystems:
> +
>     meta-ti:
>       url: "https://git.yoctoproject.org/meta-ti"
>       branch: "wrynose-wip"
> diff --git a/src/configs/poky-master-config.xml b/src/configs/poky-master-config.xml
> index 8562f36..f5005d3 100644
> --- a/src/configs/poky-master-config.xml
> +++ b/src/configs/poky-master-config.xml
> @@ -16,6 +16,14 @@
>                   <layer>meta-yocto-bsp</layer>
>               </layers>
>           </repo>
> +        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='master' commit='HEAD'>
> +            <layers>
> +                <layer>meta-networking</layer>
> +                <layer>meta-python</layer>
> +                <layer>meta-oe</layer>
> +                <layer>meta-filesystems</layer>
> +            </layers>
> +        </repo>
>           <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='master' commit='HEAD'>
>               <layers>
>                   <layer>meta-ti-test</layer>
> diff --git a/src/configs/poky-master-wip-config.xml b/src/configs/poky-master-wip-config.xml
> index 9e4d6c0..441d125 100644
> --- a/src/configs/poky-master-wip-config.xml
> +++ b/src/configs/poky-master-wip-config.xml
> @@ -16,6 +16,14 @@
>                   <layer>meta-yocto-bsp</layer>
>               </layers>
>           </repo>
> +        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='master' commit='HEAD'>
> +            <layers>
> +                <layer>meta-networking</layer>
> +                <layer>meta-python</layer>
> +                <layer>meta-oe</layer>
> +                <layer>meta-filesystems</layer>
> +            </layers>
> +        </repo>
>           <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='master-wip' commit='HEAD'>
>               <layers>
>                   <layer>meta-ti-test</layer>
> diff --git a/src/configs/poky-wrynose-config.xml b/src/configs/poky-wrynose-config.xml
> index 3a0a19f..696e75e 100644
> --- a/src/configs/poky-wrynose-config.xml
> +++ b/src/configs/poky-wrynose-config.xml
> @@ -16,6 +16,14 @@
>                   <layer>meta-yocto-bsp</layer>
>               </layers>
>           </repo>
> +        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='wrynose' commit='HEAD'>
> +            <layers>
> +                <layer>meta-networking</layer>
> +                <layer>meta-python</layer>
> +                <layer>meta-oe</layer>
> +                <layer>meta-filesystems</layer>
> +            </layers>
> +        </repo>
>           <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='wrynose' commit='HEAD'>
>               <layers>
>                   <layer>meta-ti-test</layer>
> diff --git a/src/configs/poky-wrynose-wip-config.xml b/src/configs/poky-wrynose-wip-config.xml
> index 4e2d9f1..dc63d21 100644
> --- a/src/configs/poky-wrynose-wip-config.xml
> +++ b/src/configs/poky-wrynose-wip-config.xml
> @@ -16,6 +16,14 @@
>                   <layer>meta-yocto-bsp</layer>
>               </layers>
>           </repo>
> +        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='wrynose' commit='HEAD'>
> +            <layers>
> +                <layer>meta-networking</layer>
> +                <layer>meta-python</layer>
> +                <layer>meta-oe</layer>
> +                <layer>meta-filesystems</layer>
> +            </layers>
> +        </repo>
>           <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='wrynose-wip' commit='HEAD'>
>               <layers>
>                   <layer>meta-ti-test</layer>

