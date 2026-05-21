Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 029A8CD4F3D
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 13:44:20 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36853.1779371049490063981
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 21 May 2026 06:44:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=vZRezEDE;
 spf=pass (domain: ti.com, ip: 40.107.200.19, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g0jRTPRe0Ag/YmsQ71F1Al3cRvAXwom6x51UsHhk8uIghKicfmf+IRvQkSxjwvDmWlf3I7E/wc49u/rP8S8vVrsZgoThmN2KN6tFkSyXpJULvdlGJlv1/r5LnYxHR1h8LY5it7K1ridUMJsN/VnthDKnPVqBwabT8BZiQTq6j0s6gaKQtH4dhmr1IBVRv3M1zk79e01Mn4geXr0jlOnKo9AiRBZ+tnPWM9wpPAYPaxPxZL6+dgnWXw8onqEOpS+NB6sGLEGNidMY6mq2n28RfvQ/KHqVX/1POBt3Qs484G+fOtZSalSUbNFS/uqEYuuJj9Dke6r9G5K9+ZlfOuJsOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UgsLPO7bi2L2s+UjF7K+obqJ8t+snUiT/sM0U2y2/A0=;
 b=CwAR2BTi+FfCrGRz2HJPDLrJTY14hbFYhupPQ9qA5dcj/l/P3r2IjljQd1NMt85RHLEhXTqzuZzNGLDk5vvSMLVLHeDFdGwqwpVfjrWi9lBBoHxJvvSftd3BWYVBUoZfN15l06TSt2yGk8wNiugQIZvfGUG7/YhR0kO7PTCWcnB43jmqsWohOpJXchAUrbQDRJro7e2K5mxMoC1xm8Q/SzgLieV/HXH+54w/oiSfk1ZGIVqn6OJHx9KbQRJSdhtJ1PM80XT+dn5/5BIIy6aYW491R2M5gTdWt386dM0UO51b3Q/oyvjdm4LTTz9WBe8NvvjQSi/DQeNSy8SINZ7VGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UgsLPO7bi2L2s+UjF7K+obqJ8t+snUiT/sM0U2y2/A0=;
 b=vZRezEDENxYJvIdzi6ZPjESzYNT4JWc9T3WSm/gQikt3O7dU49UHfZVFfzrlYaE2WYmFy9P+V7ZHKglXR+kQtginoV7b0VpKtv8ZyhlKwEk7wRmOqxPV8VqiN2w9CXdtsmP1GIgdS3q1KZZAW0L02398MBWErMrpps5+ODtE/yU=
Received: from SJ0PR13CA0077.namprd13.prod.outlook.com (2603:10b6:a03:2c4::22)
 by SN7PR10MB6450.namprd10.prod.outlook.com (2603:10b6:806:2a1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 13:44:05 +0000
Received: from CO1PEPF000075EF.namprd03.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::c3) by SJ0PR13CA0077.outlook.office365.com
 (2603:10b6:a03:2c4::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.6 via Frontend Transport; Thu, 21
 May 2026 13:44:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF000075EF.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Thu, 21 May 2026 13:44:03 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 21 May
 2026 08:43:55 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 21 May
 2026 08:43:55 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 21 May 2026 08:43:55 -0500
Received: from [10.249.33.167] ([10.249.33.167])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64LDhtFm3664947;
	Thu, 21 May 2026 08:43:55 -0500
Message-ID: <6503db3c-8486-450f-9315-176d548d92d7@ti.com>
Date: Thu, 21 May 2026 08:43:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][oe-layersetup][PATCH] configs:
 processor-sdk-analytics: Add 11.2 release config for J722S
To: Puyush Gupta <p-gupta5@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <s-sinha@ti.com>
References: <20260521101743.69711-1-p-gupta5@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260521101743.69711-1-p-gupta5@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EF:EE_|SN7PR10MB6450:EE_
X-MS-Office365-Filtering-Correlation-Id: 895d22bf-59ab-472a-4388-08deb73f05ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|13003099007|56012099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	UPNMPEab75mJcLlvMGoi+VK39+mvtFKOJTaAsNR/PuOrvzWk2anzfnnzM3uHpe+KnpZkRflw4AorUULlvqIk2/Sqr842S1xNxJx51pTnWLNz0fSqPLDMiHaZ586aRixXtWrzjE1qrPJF7iqevezblO9pj5cpDljXt+bjdlTPWKHSxva+d69g2k29MZvwy298Ouqfm2bdRPMvAQvDTK/XTDCliwbJ9l4lSD4BoA8IE6tQXHtL6qA36W8KYI2nZp6RszMvwf7NL3bxQHeINdDns3xdDlVSo3OthI/a6JuK56WXnpAq0R7e49VgAWBrPL0/hzO7567VNbqt0sANT0Ju0k9chvk4gkdotwAeS8Ch5OTpMzA04h+0C3apeGrHnSTqCYYcrbAqUIXqXZ7ZVdAtUjWvtvp1mfv2YO3ugBXWQo2iZh5QZ+lpm2dEO4h64BuywQWu0BE4RHS5/KgdtqyLWDbqebOLWUETqYxvcfEUY6qGUUZ6g31+zMUAafaSUkfRsUoxBy+mDNAegP3rzgHwzcLmAOxpuEwPelSMoVOXJPITI8tU35kVrdck9o36Iuw/VXcBlqAnQjDZtDLCjXey//NXtiSgTpVgQJ363GoE4tYol+7OTo6HKfEtxa2a6OWlL+boSwHPHSRLayFgxojXoJP2tqD/PD1I1rMTK84zYLP2RjlqW73Z3cKhQcBkcnbN
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(13003099007)(56012099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	+KG87Hq+09YRUm0LJ6A9eWuxf8+8yfmNMGigwvZloIjalzC4/8Pi+cF6rBXAHHqYz2F/CTEgQLOPRHZVOyLnx4Q+D9o+MuJmQqeCsbEYWhEn+B5PsdGiEh4v3dhIxshrgqUYRNN1U01PzxoT3M7UwBRq9MqcSXisT6PddaaPChaOE96hCxqk+yImhs7YaqQjVGU/IR858d1WQrNjFAxBlFl8GAWDQcfoMULct9HvMp4081RxXRs4jm/WhuccmSkQ6hHeyjXqJMoHV5W1B+dFbGSyUMNVq9CNeHUOJyuk+J/MjgJtXJru846NEQXHZcRlS6Enj42HbFeKXQEo8LZQnuhhcmUtSBof7pjvJaALvq5PQX70JVOYE809UwABr7iy7q+V08DN7kbUC8LcgJVgFR0tJpNMw27McrBrLZytBsYeb/5jVzlCZb1lNvZgvuSO
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 13:44:03.7885
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 895d22bf-59ab-472a-4388-08deb73f05ad
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000075EF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6450
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 21 May 2026 13:44:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17535


NAK.  Comments below.


On 5/21/2026 5:17 AM, Puyush Gupta wrote:
> Signed-off-by: Puyush Gupta <p-gupta5@ti.com>
> ---
>   conf/fragments/localconf/local-arago64-v2.conf |  4 ++--
>   ...processor-sdk-analytics-11.02.00-config.txt | 18 +++++++++---------
>   ...processor-sdk-analytics-11.02.00-config.yml | 18 +++++++++---------
>   ...processor-sdk-analytics-11.02.00-config.xml | 18 +++++++++---------
>   src/templates/local-arago64-v2.conf.xml        |  2 --
>   5 files changed, 29 insertions(+), 31 deletions(-)
> 
> diff --git a/conf/fragments/localconf/local-arago64-v2.conf b/conf/fragments/localconf/local-arago64-v2.conf
> index 1e102fc..10f88aa 100644
> --- a/conf/fragments/localconf/local-arago64-v2.conf
> +++ b/conf/fragments/localconf/local-arago64-v2.conf
> @@ -1,5 +1,5 @@
> -BB_CONF_FRAGMENT_SUMMARY = "TI oe-layersetup build defaults for Arago 64bit builds v2"
> -BB_CONF_FRAGMENT_DESCRIPTION = "TI oe-layersetup build defaults for Arago 64bit builds v2"
> +BB_CONF_FRAGMENT_SUMMARY = ""
> +BB_CONF_FRAGMENT_DESCRIPTION = ""

Why are you changing these values?


>   # CONF_VERSION is increased each time build/conf/ changes incompatibly
>   CONF_VERSION = "2"
> diff --git a/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.00-config.txt b/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.00-config.txt
> index 10cbc2d..e439cb2 100644
> --- a/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.00-config.txt
> +++ b/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.00-config.txt
> @@ -1,21 +1,21 @@
>   # This file takes repo entries in the format
>   # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
>   
> -bitbake,https://git.openembedded.org/bitbake,2.8,8dcf084522b9c66a6639b5f117f554fde9b6b45a
> -meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,1640df60b0f75722b9e5923a5bfba3767e7d97a8,layers=meta-arago-distro:meta-arago-extras:meta-arago-test
> +bitbake,https://git.openembedded.org/bitbake,2.8,d3b4c352dd33fca90cd31649eda054b884478739
> +meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,efba4adb406b9675641ee85ea3bce1c375ef5963,layers=meta-arago-distro:meta-arago-extras:meta-arago-test
>   #meta-browser,https://github.com/OSSystems/meta-browser.git,master,27ca52f635a31f5f9762813a8527dd31323549b7,layers=meta-chromium
>   #meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,HEAD,layers=
>   meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,c7d71f4cece4d1fe3110c945b9bd40ca82960e05,layers=
> -meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,17ac21e7d7f6f40a87618b22278b63bcfa14dbf2,layers=
> -meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,e76bf51a92b41d4cb185fc164ae43a863910ccd1,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
> +meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,3dd635f613f7299d986a8ab6bc9f584370f8ed1d,layers=
> +meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,5124ac4a658899158f4a7a2ddf1d2ca931ec7d0e,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
>   meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/rust,a8046d5ec53b1856169ac795aa87cb0d5db84c04,layers=
> -meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,ea8c0b1cf1ab8a0b327e3feb1144c1ccf05b8278,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
> +meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,a444d3137a527d4a405986a5ffa143ed7dfc0961,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
>   meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,a81c19915b5b9e71ed394032e9a50fd06919e1cd,layers=meta-arm:meta-arm-toolchain
> -meta-clang,https://github.com/kraj/meta-clang,scarthgap,5c602337ea1a80fb7217eeda04e396cf90587dca,layers=
> +meta-clang,https://github.com/kraj/meta-clang,scarthgap,5bce7e26a38a58bb52242494e54ab2af40009574,layers=
>   #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,scarthgap,HEAD,layers=.:meta-flutter-apps
> -oe-core,https://git.openembedded.org/openembedded-core,scarthgap,2b3d2b671a149cbeea2bdc9ba42192da2015c3b7,layers=meta
> -meta-tisdk,https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git,scarthgap,32482cad2f630892b733c1457b9e9d835b098174,layers=meta-ti-foundational
> -meta-edgeai,https://git.ti.com/git/edgeai/meta-edgeai.git,scarthgap,7d07e25a15632494d6c30efb09d68de1c95f9394,layers=
> +oe-core,https://git.openembedded.org/openembedded-core,scarthgap,52380df998b3a8fe6a091f8547434a3231320a8e,layers=meta
> +meta-tisdk,https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git,scarthgap,755bc6a5007feb1d1dcf6f2a155442f997e37e5a,layers=meta-ti-foundational
> +meta-edgeai,https://git.ti.com/git/edgeai/meta-edgeai.git,scarthgap,216d5badbf187e8e8cfa298534e5e1d37d7d69a1,layers=
>   
>   OECORELAYERCONF=./sample-files/bblayers.conf.sample
>   OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
> diff --git a/kas/processor-sdk-analytics/processor-sdk-analytics-11.02.00-config.yml b/kas/processor-sdk-analytics/processor-sdk-analytics-11.02.00-config.yml
> index d90ea43..feebda7 100644
> --- a/kas/processor-sdk-analytics/processor-sdk-analytics-11.02.00-config.yml
> +++ b/kas/processor-sdk-analytics/processor-sdk-analytics-11.02.00-config.yml
> @@ -11,7 +11,7 @@ repos:
>     bitbake:
>       url: "https://git.openembedded.org/bitbake"
>       branch: "2.8"
> -    commit: "8dcf084522b9c66a6639b5f117f554fde9b6b45a"
> +    commit: "d3b4c352dd33fca90cd31649eda054b884478739"
>       path: "sources/bitbake"
>       layers:
>         .: disabled
> @@ -19,7 +19,7 @@ repos:
>     meta-arago:
>       url: "https://git.yoctoproject.org/meta-arago"
>       branch: "scarthgap"
> -    commit: "1640df60b0f75722b9e5923a5bfba3767e7d97a8"
> +    commit: "efba4adb406b9675641ee85ea3bce1c375ef5963"
>       path: "sources/meta-arago"
>       layers:
>         meta-arago-distro:
> @@ -35,13 +35,13 @@ repos:
>     meta-virtualization:
>       url: "https://git.yoctoproject.org/meta-virtualization"
>       branch: "scarthgap"
> -    commit: "17ac21e7d7f6f40a87618b22278b63bcfa14dbf2"
> +    commit: "3dd635f613f7299d986a8ab6bc9f584370f8ed1d"
>       path: "sources/meta-virtualization"
>   
>     meta-openembedded:
>       url: "https://git.openembedded.org/meta-openembedded"
>       branch: "scarthgap"
> -    commit: "e76bf51a92b41d4cb185fc164ae43a863910ccd1"
> +    commit: "5124ac4a658899158f4a7a2ddf1d2ca931ec7d0e"
>       path: "sources/meta-openembedded"
>       layers:
>         meta-networking:
> @@ -60,7 +60,7 @@ repos:
>     meta-ti:
>       url: "https://git.yoctoproject.org/meta-ti"
>       branch: "scarthgap"
> -    commit: "ea8c0b1cf1ab8a0b327e3feb1144c1ccf05b8278"
> +    commit: "a444d3137a527d4a405986a5ffa143ed7dfc0961"
>       path: "sources/meta-ti"
>       layers:
>         meta-ti-extras:
> @@ -79,13 +79,13 @@ repos:
>     meta-clang:
>       url: "https://github.com/kraj/meta-clang"
>       branch: "scarthgap"
> -    commit: "5c602337ea1a80fb7217eeda04e396cf90587dca"
> +    commit: "5bce7e26a38a58bb52242494e54ab2af40009574"
>       path: "sources/meta-clang"
>   
>     oe-core:
>       url: "https://git.openembedded.org/openembedded-core"
>       branch: "scarthgap"
> -    commit: "2b3d2b671a149cbeea2bdc9ba42192da2015c3b7"
> +    commit: "52380df998b3a8fe6a091f8547434a3231320a8e"
>       path: "sources/oe-core"
>       layers:
>         meta:
> @@ -93,7 +93,7 @@ repos:
>     meta-tisdk:
>       url: "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
>       branch: "scarthgap"
> -    commit: "32482cad2f630892b733c1457b9e9d835b098174"
> +    commit: "755bc6a5007feb1d1dcf6f2a155442f997e37e5a"
>       path: "sources/meta-tisdk"
>       layers:
>         meta-ti-foundational:
> @@ -101,5 +101,5 @@ repos:
>     meta-edgeai:
>       url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
>       branch: "scarthgap"
> -    commit: "7d07e25a15632494d6c30efb09d68de1c95f9394"
> +    commit: "216d5badbf187e8e8cfa298534e5e1d37d7d69a1"
>       path: "sources/meta-edgeai"
> diff --git a/src/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.00-config.xml b/src/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.00-config.xml
> index a2295f0..9c71b5c 100644
> --- a/src/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.00-config.xml
> +++ b/src/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.00-config.xml
> @@ -7,10 +7,10 @@
>       <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
>       <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
>   
> -    <bitbake url='https://git.openembedded.org/bitbake' branch='2.8' commit='8dcf084522b9c66a6639b5f117f554fde9b6b45a'/>
> +    <bitbake url='https://git.openembedded.org/bitbake' branch='2.8' commit='d3b4c352dd33fca90cd31649eda054b884478739'/>
>   
>       <repos>
> -        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='scarthgap' commit='1640df60b0f75722b9e5923a5bfba3767e7d97a8'>
> +        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='scarthgap' commit='efba4adb406b9675641ee85ea3bce1c375ef5963'>
>               <layers>
>                   <layer>meta-arago-distro</layer>
>                   <layer>meta-arago-extras</layer>
> @@ -28,10 +28,10 @@
>           <repo name='meta-qt6' url='https://code.qt.io/yocto/meta-qt6.git' branch='6.9' commit='c7d71f4cece4d1fe3110c945b9bd40ca82960e05'>
>               <layers/>
>           </repo>
> -        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='scarthgap' commit='17ac21e7d7f6f40a87618b22278b63bcfa14dbf2'>
> +        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='scarthgap' commit='3dd635f613f7299d986a8ab6bc9f584370f8ed1d'>
>               <layers/>
>           </repo>
> -        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='scarthgap' commit='e76bf51a92b41d4cb185fc164ae43a863910ccd1'>
> +        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='scarthgap' commit='5124ac4a658899158f4a7a2ddf1d2ca931ec7d0e'>
>               <layers>
>                   <layer>meta-networking</layer>
>                   <layer>meta-python</layer>
> @@ -44,7 +44,7 @@
>           <repo name='meta-lts-mixins' url='https://git.yoctoproject.org/meta-lts-mixins' branch='scarthgap/rust' commit='a8046d5ec53b1856169ac795aa87cb0d5db84c04'>
>               <layers/>
>           </repo>
> -        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='scarthgap' commit='ea8c0b1cf1ab8a0b327e3feb1144c1ccf05b8278'>
> +        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='scarthgap' commit='a444d3137a527d4a405986a5ffa143ed7dfc0961'>
>               <layers>
>                   <layer>meta-ti-extras</layer>
>                   <layer>meta-beagle</layer>
> @@ -57,7 +57,7 @@
>                   <layer>meta-arm-toolchain</layer>
>               </layers>
>           </repo>
> -        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='scarthgap' commit='5c602337ea1a80fb7217eeda04e396cf90587dca'>
> +        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='scarthgap' commit='5bce7e26a38a58bb52242494e54ab2af40009574'>
>               <layers/>
>           </repo>
>           <repo name='meta-flutter' url='https://github.com/meta-flutter/meta-flutter.git' branch='scarthgap' commit='HEAD' disabled='true'>
> @@ -66,17 +66,17 @@
>                   <layer>meta-flutter-apps</layer>
>               </layers>
>           </repo>
> -        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='scarthgap' commit='2b3d2b671a149cbeea2bdc9ba42192da2015c3b7'>
> +        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='scarthgap' commit='52380df998b3a8fe6a091f8547434a3231320a8e'>
>               <layers>
>                   <layer>meta</layer>
>               </layers>
>           </repo>
> -        <repo name='meta-tisdk' url='https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git' branch='scarthgap' commit='32482cad2f630892b733c1457b9e9d835b098174'>
> +        <repo name='meta-tisdk' url='https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git' branch='scarthgap' commit='755bc6a5007feb1d1dcf6f2a155442f997e37e5a'>
>               <layers>
>                   <layer>meta-ti-foundational</layer>
>               </layers>
>           </repo>
> -        <repo name='meta-edgeai' url='https://git.ti.com/git/edgeai/meta-edgeai.git' branch='scarthgap' commit='7d07e25a15632494d6c30efb09d68de1c95f9394'>
> +        <repo name='meta-edgeai' url='https://git.ti.com/git/edgeai/meta-edgeai.git' branch='scarthgap' commit='216d5badbf187e8e8cfa298534e5e1d37d7d69a1'>
>               <layers/>
>           </repo>
>       </repos>
> diff --git a/src/templates/local-arago64-v2.conf.xml b/src/templates/local-arago64-v2.conf.xml
> index 797bd39..d9d2ae7 100644
> --- a/src/templates/local-arago64-v2.conf.xml
> +++ b/src/templates/local-arago64-v2.conf.xml
> @@ -1,6 +1,4 @@
>   <local-conf-template name='local-arago64-v2.conf'>
> -    <summary>TI oe-layersetup build defaults for Arago 64bit builds v2</summary>
> -    <description>TI oe-layersetup build defaults for Arago 64bit builds v2</description>
>       <line># CONF_VERSION is increased each time build/conf/ changes incompatibly</line>
>       <line>CONF_VERSION = "2"</line>
>       <line></line>

Why did you change this file at all?

NAK.


-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

