Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1123CD4F3C
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 16:40:41 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.21])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3176.1779208837102669433
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 19 May 2026 09:40:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=prk1yhaB;
 spf=pass (domain: ti.com, ip: 52.101.62.21, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qW/sfIP5uMpnpKVP79/rBjNnkDHZS6aarSVJkPESeu4fK4+90iBQfFfq+llDVb9ejCYCIiW6dGFJAAUdQTlV1j9bi02pnTQt7nwhAhL1J+4IyL11CG8bgLm0V7QPb4qeObiEI6I1hQO6T+oRgyr0dLyLDPyDgtaghtJi/RmWsi+4u/N6QRlqK1t4veetOMmJsTWP9M59G5p+e40LWNYtBM/zLppgU0cYqPHYfUB5/FUcdpYvFI8mRtRA1SY29q4HQ5mdwWDYpSZti1KIh1N1ivS7aji2S7/8SS6PHMNp4dWUddXkGQqXkv7WtzY/y+eXm0pRk1Cn8HJ3hdagJGqzUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xXsmQYoMgUQn2qseLFN9RT1EuECUETwCHq46KoWpn9E=;
 b=hVr7s2LtpbMFetfp2QQ5aNi74Pi1P3EXPCIWANMx9PbduEukvbDkd0Se2M9ybKVxeQUL7u8dRZO92ZQ2t2sMxbnKmdWTch7qf9r88KBrrrF/7cvjUG0PSjM0wy6RHfnl2/LZ2/qzmSO9yu03mc3/dDU7SYgTwQ62gwJp2eCBokWwxxRiMZmwIh94RiWKhzBdjhv54eKQ/q8Y1jhfaAQdU3CKgOXpxGMUdrwAftj4YNQ6yCiO75PI0GEWF0WqQlhRhFmyDNE0GCQ2xVTC1XnG2TU+bNzUmpDr4dnycyTjVdfXbQndaF0Z5rIfAEYtMu80daPhib2vM3VuwvDArOtj7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xXsmQYoMgUQn2qseLFN9RT1EuECUETwCHq46KoWpn9E=;
 b=prk1yhaBx3KI8O+V2J9AUl8n/SjWiYEvAvDYwdfRuZd9Ols4zqT0kjYjCbn4frB9G7bnseL9/d6wRIq6MMYwOnabALyFm8aRYrFnXIql7mZ6kEMSQs+XnEmFl6z7ReEKVIX7Pmtp743NEuJve6m3V8jM902UAdw4vPBHUSCWD9Y=
Received: from CY5PR15CA0016.namprd15.prod.outlook.com (2603:10b6:930:14::11)
 by PH8PR10MB6599.namprd10.prod.outlook.com (2603:10b6:510:224::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Tue, 19 May
 2026 16:40:33 +0000
Received: from CH3PEPF00000009.namprd04.prod.outlook.com
 (2603:10b6:930:14:cafe::b1) by CY5PR15CA0016.outlook.office365.com
 (2603:10b6:930:14::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.14 via Frontend Transport; Tue, 19
 May 2026 16:40:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH3PEPF00000009.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Tue, 19 May 2026 16:40:31 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 19 May
 2026 11:40:30 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 19 May
 2026 11:40:30 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 19 May 2026 11:40:30 -0500
Received: from [10.249.33.5] ([10.249.33.5])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64JGeU8p211956;
	Tue, 19 May 2026 11:40:30 -0500
Message-ID: <4b9d8cc7-a673-427c-9f59-a9c34dfb34f4@ti.com>
Date: Tue, 19 May 2026 11:40:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][oe-layersetup][master][PATCH]
 configs/arago-wrynose-*: Update Chromium branch to wrynose
To: Thorsten Lannynd <t-lannynd@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <detheridge@ti.com>, <b-brnich@ti.com>, <a-christidis@ti.com>
References: <20260519160723.2353181-1-t-lannynd@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260519160723.2353181-1-t-lannynd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000009:EE_|PH8PR10MB6599:EE_
X-MS-Office365-Filtering-Correlation-Id: a0bcf753-2a8b-4860-e4e2-08deb5c557b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|13003099007|18002099003|56012099003|22082099003|3023799003;
X-Microsoft-Antispam-Message-Info: 
	aDX4ttArDa02VfZrliG6lZAt2l2HBdtbOJqwmH7h9nz0cp12w9iCsD0isfc+P3Q0K9rhhRsc6uSzdalIU1dgAeAKtJXpYM9/xWyap9isb+LLL5xtzApBJkLDnnx5XuwPrZuRhDLEMXLLjpdRWx56otlOMD/tzzaUBWjSOyqqgq8I/eelkZcCGLfnBdls9hkXDKE/HXszEFEhfTflscZbU2M1J+sVcLtuZSQ6xL+jq4cnFH/5KxaMdSTBuQO6DQu5+P5r4YT7R+uxyiKcvyCagG14zH6PvzOwTdfNIkCEW8/qwAXSe5fn0bMkxE7M7zMh8bjrpDw6ZA1zk41GTxhNFRF5Nht5N8KdlHmTOu9e8D4f47CKHswaTIjVwqXBp6OpoXVLuzwsSpF3AryypRc+0e+yngZZw9cC2ohmkuDTbW7jfa7qil/sjXf4KvG25Wrmk7VVXWIwFQlmZF+qVfyKouaMqEHvK5KAgAC6RqlKHWczz7OvNIkF7kdNb6SUkJNHNV0GUxs8SCmfq0upDVwnloZmCJhOH+9ucJJ97ZWMj8rc/52cPP/eAgNgB3zQLtGRSpB0GqeAmP7l5ze+u/jTfB0FtlFzU9ASew7fAwoxweFwjdtq2AuY47W4bpGMzxxP6cb57eboTZTu9yNYBSgKkZ5oRb06PlXtGakyFus3C9MOAl8U6t9k9VT4x0SlfvbX
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(13003099007)(18002099003)(56012099003)(22082099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	RIBAJQ2Aie/kxnoPL1oM032WqaHcy8fRy47FDFThUZrCdBdle1Ra8fWdCOQE3I4mUUJZ+qKkjiLH1zimfYBC2Oup4MXPhMojVd1gBpUhTX675iWbpsPYIneTXAmlhfoFJYYe1YzpjT/Ov1/iZ9w7qYHC9WdRCQM9iRsRd40iyJRWdRgHgk/FcHx7LfNcmrSLOXIBZHofpA/FrlEqTqA6/jnYZCM++PrTpDHrBguK91gUaJIYZ6JfQZvYQyDN28dPOik0Ar8Y5JMTFPM7KhP6Ff6kp9a5O/+jhndftZNibsrW3tfyu0z3L9562Eko9Ex0zQ3toYjwDymKWMwDxfMTGt6mpF3YbanI57qLe4gCppBCgnSW23tVKRXQ2XV5l9JJBhAnWoQH87bRltacL85wj9P6HD98XyXFp0mEjTSI/j8Qpx79LYalu5ylySasnA7N
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 16:40:31.5146
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0bcf753-2a8b-4860-e4e2-08deb5c557b1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF00000009.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6599
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 19 May 2026 16:40:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17532


You are missing a file in the commit:

bitbake-setup/arago-wrynose-chromium-config.conf.json

Can you send a v2?


On 5/19/2026 11:07 AM, Thorsten Lannynd wrote:
> meta-browser has added a branch for wrynose, so replace master with wrynose
> in the arago-wrynose-* config files.
> 
> Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
> ---
>   configs/arago-wrynose-chromium-config.txt     | 2 +-
>   configs/arago-wrynose-config.txt              | 2 +-
>   configs/arago-wrynose-luks-config.txt         | 2 +-
>   configs/arago-wrynose-next-config.txt         | 2 +-
>   configs/arago-wrynose-selinux-config.txt      | 2 +-
>   configs/arago-wrynose-wip-config.txt          | 2 +-
>   kas/arago-wrynose-chromium-config.yml         | 2 +-
>   src/configs/arago-wrynose-chromium-config.xml | 2 +-
>   src/configs/arago-wrynose-config.xml          | 2 +-
>   src/configs/arago-wrynose-luks-config.xml     | 2 +-
>   src/configs/arago-wrynose-next-config.xml     | 2 +-
>   src/configs/arago-wrynose-selinux-config.xml  | 2 +-
>   src/configs/arago-wrynose-wip-config.xml      | 2 +-
>   13 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/configs/arago-wrynose-chromium-config.txt b/configs/arago-wrynose-chromium-config.txt
> index dc98beb..3ac2ecc 100644
> --- a/configs/arago-wrynose-chromium-config.txt
> +++ b/configs/arago-wrynose-chromium-config.txt
> @@ -4,7 +4,7 @@
>   bitbake,https://git.openembedded.org/bitbake,2.18,HEAD
>   meta-arago,https://git.yoctoproject.org/meta-arago,wrynose,HEAD,layers=meta-arago-distro:meta-arago-extras
>   #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD,layers=.:meta-flutter-apps
> -meta-browser,https://github.com/OSSystems/meta-browser.git,master,e07817d8f8ada5340347c34f1ac6d5ee68eaa5ff,layers=meta-chromium
> +meta-browser,https://github.com/OSSystems/meta-browser.git,wrynose,e07817d8f8ada5340347c34f1ac6d5ee68eaa5ff,layers=meta-chromium
>   #meta-selinux,https://git.yoctoproject.org/meta-selinux,wrynose,HEAD,layers=
>   meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.11,HEAD,layers=
>   meta-virtualization,https://git.yoctoproject.org/meta-virtualization,wrynose,HEAD,layers=
> diff --git a/configs/arago-wrynose-config.txt b/configs/arago-wrynose-config.txt
> index 209d6c0..ad467c3 100644
> --- a/configs/arago-wrynose-config.txt
> +++ b/configs/arago-wrynose-config.txt
> @@ -4,7 +4,7 @@
>   bitbake,https://git.openembedded.org/bitbake,2.18,HEAD
>   meta-arago,https://git.yoctoproject.org/meta-arago,wrynose,HEAD,layers=meta-arago-distro:meta-arago-extras
>   #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD,layers=.:meta-flutter-apps
> -#meta-browser,https://github.com/OSSystems/meta-browser.git,master,e07817d8f8ada5340347c34f1ac6d5ee68eaa5ff,layers=meta-chromium
> +#meta-browser,https://github.com/OSSystems/meta-browser.git,wrynose,e07817d8f8ada5340347c34f1ac6d5ee68eaa5ff,layers=meta-chromium
>   #meta-selinux,https://git.yoctoproject.org/meta-selinux,wrynose,HEAD,layers=
>   meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.11,HEAD,layers=
>   meta-virtualization,https://git.yoctoproject.org/meta-virtualization,wrynose,HEAD,layers=
> diff --git a/configs/arago-wrynose-luks-config.txt b/configs/arago-wrynose-luks-config.txt
> index 2d3c618..3975779 100644
> --- a/configs/arago-wrynose-luks-config.txt
> +++ b/configs/arago-wrynose-luks-config.txt
> @@ -4,7 +4,7 @@
>   bitbake,https://git.openembedded.org/bitbake,2.18,HEAD
>   meta-arago,https://git.yoctoproject.org/meta-arago,wrynose,HEAD,layers=meta-arago-distro:meta-arago-extras
>   #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD,layers=.:meta-flutter-apps
> -#meta-browser,https://github.com/OSSystems/meta-browser.git,master,e07817d8f8ada5340347c34f1ac6d5ee68eaa5ff,layers=meta-chromium
> +#meta-browser,https://github.com/OSSystems/meta-browser.git,wrynose,e07817d8f8ada5340347c34f1ac6d5ee68eaa5ff,layers=meta-chromium
>   #meta-selinux,https://git.yoctoproject.org/meta-selinux,wrynose,HEAD,layers=
>   meta-security,https://git.yoctoproject.org/meta-security,wrynose,HEAD,layers=meta-tpm
>   meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.11,HEAD,layers=
> diff --git a/configs/arago-wrynose-next-config.txt b/configs/arago-wrynose-next-config.txt
> index f9d4b7b..c82b29c 100644
> --- a/configs/arago-wrynose-next-config.txt
> +++ b/configs/arago-wrynose-next-config.txt
> @@ -12,7 +12,7 @@ MOTD: NOTE:
>   bitbake,https://git.openembedded.org/bitbake,2.18,HEAD
>   meta-arago,https://git.yoctoproject.org/meta-arago,wrynose-next,HEAD,layers=meta-arago-distro:meta-arago-extras
>   #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD,layers=.:meta-flutter-apps
> -#meta-browser,https://github.com/OSSystems/meta-browser.git,master,e07817d8f8ada5340347c34f1ac6d5ee68eaa5ff,layers=meta-chromium
> +#meta-browser,https://github.com/OSSystems/meta-browser.git,wrynose,e07817d8f8ada5340347c34f1ac6d5ee68eaa5ff,layers=meta-chromium
>   #meta-selinux,https://git.yoctoproject.org/meta-selinux,wrynose,HEAD,layers=
>   meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.11,HEAD,layers=
>   meta-virtualization,https://git.yoctoproject.org/meta-virtualization,wrynose,HEAD,layers=
> diff --git a/configs/arago-wrynose-selinux-config.txt b/configs/arago-wrynose-selinux-config.txt
> index bebdf58..4f7983c 100644
> --- a/configs/arago-wrynose-selinux-config.txt
> +++ b/configs/arago-wrynose-selinux-config.txt
> @@ -4,7 +4,7 @@
>   bitbake,https://git.openembedded.org/bitbake,2.18,HEAD
>   meta-arago,https://git.yoctoproject.org/meta-arago,wrynose,HEAD,layers=meta-arago-distro:meta-arago-extras
>   #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD,layers=.:meta-flutter-apps
> -#meta-browser,https://github.com/OSSystems/meta-browser.git,master,e07817d8f8ada5340347c34f1ac6d5ee68eaa5ff,layers=meta-chromium
> +#meta-browser,https://github.com/OSSystems/meta-browser.git,wrynose,e07817d8f8ada5340347c34f1ac6d5ee68eaa5ff,layers=meta-chromium
>   meta-selinux,https://git.yoctoproject.org/meta-selinux,wrynose,HEAD,layers=
>   meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.11,HEAD,layers=
>   meta-virtualization,https://git.yoctoproject.org/meta-virtualization,wrynose,HEAD,layers=
> diff --git a/configs/arago-wrynose-wip-config.txt b/configs/arago-wrynose-wip-config.txt
> index e2682d2..dd2f194 100644
> --- a/configs/arago-wrynose-wip-config.txt
> +++ b/configs/arago-wrynose-wip-config.txt
> @@ -4,7 +4,7 @@
>   bitbake,https://git.openembedded.org/bitbake,2.18,HEAD
>   meta-arago,https://git.yoctoproject.org/meta-arago,wrynose-wip,HEAD,layers=meta-arago-distro:meta-arago-extras
>   #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD,layers=.:meta-flutter-apps
> -#meta-browser,https://github.com/OSSystems/meta-browser.git,master,e07817d8f8ada5340347c34f1ac6d5ee68eaa5ff,layers=meta-chromium
> +#meta-browser,https://github.com/OSSystems/meta-browser.git,wrynose,e07817d8f8ada5340347c34f1ac6d5ee68eaa5ff,layers=meta-chromium
>   #meta-selinux,https://git.yoctoproject.org/meta-selinux,wrynose,HEAD,layers=
>   meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.11,HEAD,layers=
>   meta-virtualization,https://git.yoctoproject.org/meta-virtualization,wrynose,HEAD,layers=
> diff --git a/kas/arago-wrynose-chromium-config.yml b/kas/arago-wrynose-chromium-config.yml
> index b86cde1..5745c67 100644
> --- a/kas/arago-wrynose-chromium-config.yml
> +++ b/kas/arago-wrynose-chromium-config.yml
> @@ -25,7 +25,7 @@ repos:
>   
>     meta-browser:
>       url: "https://github.com/OSSystems/meta-browser.git"
> -    branch: "master"
> +    branch: "wrynose"
>       commit: "e07817d8f8ada5340347c34f1ac6d5ee68eaa5ff"
>       path: "sources/meta-browser"
>       layers:
> diff --git a/src/configs/arago-wrynose-chromium-config.xml b/src/configs/arago-wrynose-chromium-config.xml
> index 4800d71..2913745 100644
> --- a/src/configs/arago-wrynose-chromium-config.xml
> +++ b/src/configs/arago-wrynose-chromium-config.xml
> @@ -22,7 +22,7 @@
>                   <layer>meta-flutter-apps</layer>
>               </layers>
>           </repo>
> -        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='e07817d8f8ada5340347c34f1ac6d5ee68eaa5ff'>
> +        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='wrynose' commit='e07817d8f8ada5340347c34f1ac6d5ee68eaa5ff'>
>               <layers>
>                   <layer>meta-chromium</layer>
>               </layers>
> diff --git a/src/configs/arago-wrynose-config.xml b/src/configs/arago-wrynose-config.xml
> index f0f6ca7..62f9ac2 100644
> --- a/src/configs/arago-wrynose-config.xml
> +++ b/src/configs/arago-wrynose-config.xml
> @@ -22,7 +22,7 @@
>                   <layer>meta-flutter-apps</layer>
>               </layers>
>           </repo>
> -        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='e07817d8f8ada5340347c34f1ac6d5ee68eaa5ff' disabled='true'>
> +        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='wrynose' commit='e07817d8f8ada5340347c34f1ac6d5ee68eaa5ff' disabled='true'>
>               <layers>
>                   <layer>meta-chromium</layer>
>               </layers>
> diff --git a/src/configs/arago-wrynose-luks-config.xml b/src/configs/arago-wrynose-luks-config.xml
> index d653be8..cb38190 100644
> --- a/src/configs/arago-wrynose-luks-config.xml
> +++ b/src/configs/arago-wrynose-luks-config.xml
> @@ -22,7 +22,7 @@
>                   <layer>meta-flutter-apps</layer>
>               </layers>
>           </repo>
> -        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='e07817d8f8ada5340347c34f1ac6d5ee68eaa5ff' disabled='true'>
> +        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='wrynose' commit='e07817d8f8ada5340347c34f1ac6d5ee68eaa5ff' disabled='true'>
>               <layers>
>                   <layer>meta-chromium</layer>
>               </layers>
> diff --git a/src/configs/arago-wrynose-next-config.xml b/src/configs/arago-wrynose-next-config.xml
> index f2a90e7..fe4783f 100644
> --- a/src/configs/arago-wrynose-next-config.xml
> +++ b/src/configs/arago-wrynose-next-config.xml
> @@ -23,7 +23,7 @@
>                   <layer>meta-flutter-apps</layer>
>               </layers>
>           </repo>
> -        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='e07817d8f8ada5340347c34f1ac6d5ee68eaa5ff' disabled='true'>
> +        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='wrynose' commit='e07817d8f8ada5340347c34f1ac6d5ee68eaa5ff' disabled='true'>
>               <layers>
>                   <layer>meta-chromium</layer>
>               </layers>
> diff --git a/src/configs/arago-wrynose-selinux-config.xml b/src/configs/arago-wrynose-selinux-config.xml
> index b4bca98..044fe26 100644
> --- a/src/configs/arago-wrynose-selinux-config.xml
> +++ b/src/configs/arago-wrynose-selinux-config.xml
> @@ -22,7 +22,7 @@
>                   <layer>meta-flutter-apps</layer>
>               </layers>
>           </repo>
> -        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='e07817d8f8ada5340347c34f1ac6d5ee68eaa5ff' disabled='true'>
> +        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='wrynose' commit='e07817d8f8ada5340347c34f1ac6d5ee68eaa5ff' disabled='true'>
>               <layers>
>                   <layer>meta-chromium</layer>
>               </layers>
> diff --git a/src/configs/arago-wrynose-wip-config.xml b/src/configs/arago-wrynose-wip-config.xml
> index a553ac4..bc4602a 100644
> --- a/src/configs/arago-wrynose-wip-config.xml
> +++ b/src/configs/arago-wrynose-wip-config.xml
> @@ -22,7 +22,7 @@
>                   <layer>meta-flutter-apps</layer>
>               </layers>
>           </repo>
> -        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='e07817d8f8ada5340347c34f1ac6d5ee68eaa5ff' disabled='true'>
> +        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='wrynose' commit='e07817d8f8ada5340347c34f1ac6d5ee68eaa5ff' disabled='true'>
>               <layers>
>                   <layer>meta-chromium</layer>
>               </layers>

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

