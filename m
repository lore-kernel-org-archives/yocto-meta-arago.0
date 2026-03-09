Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45F0AF3C266
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 13:46:37 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14549.1773063993233433404
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 09 Mar 2026 06:46:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=NzG4HjwD;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.200.66, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yM5zvuoV+JVm6B3tbZyayR1n5aF+4AHpbjJwbobPLpQTc9IrYv80W+aE6aM9wpYByAJsQVyADKAo7rAdGtQz74kV6zqQdFazItNgG+P//NybKloQvG+RGiQeLwBKnXPpkhfbk/d4zNDa06043Zo0YSq2uIQ6Qziob7LAZkzLnGH6n2nBMpWifkxrVkDvMullBh2xCephixPlaD9x71uUBx0Vo7QnoVWxeEvv/KGB8RFYxIuE7LH9/kxdh8Me/rUBXkuOzhbjzNkBpc9vU5G/T1vW0eopMkBGW83qcllRovIDgen15/Tj0a5MpOc9vlmpW17mr8eb9akFieeYdmZQGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oU2tzdgxvajdzgtZPFdASG3hFDW9y2hqOs4Hcs8O3UI=;
 b=YafwjS4lOZBloq9xC6FjcN/qtiJ+fza6Iw6+T/HYr222axqAeNTcgPEy5K0MMEiUmufzxIMxvwA6GX9uDtZqaeHV5SheNeaMo7vpdmE+0XELgiZyYcaWyem/1o0Qk/M9eJfEEB5esmwKJL1YjOZqyzY/ljywudOhameKFCH1xNenkEGktP1Qzv2R0icGDIgeHgldEuq3YbalDjo7HB5qJ57Q4tnFJl8up3IKug8RpwYIgH24kUqtuKhPKbH7q/llIarndwNSF09owUQCNwThhWWcvuSYBbMpK30G0Cub+vTNA7TVyQUroCfzlOQ7j8q6eZiPedGaCceI5Jbmzxt9Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oU2tzdgxvajdzgtZPFdASG3hFDW9y2hqOs4Hcs8O3UI=;
 b=NzG4HjwDBhoS5DSmgIRmhwlWKlE7P4+o6HgjOQ5sf6lA3pD6J03Ew7azRb0JE7UOM3WRe2ZvPb16D4hkH27AJly2gjYuunQYqlthNnnv0r76iW6kzf2lRn+0erDDMrekxqQ9PA9bnmOr6gANOhB10Fj+CIj1hgJCiiY/JpnNiXw=
Received: from SJ0PR13CA0134.namprd13.prod.outlook.com (2603:10b6:a03:2c6::19)
 by BLAPR10MB4914.namprd10.prod.outlook.com (2603:10b6:208:30d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.23; Mon, 9 Mar
 2026 13:46:30 +0000
Received: from SJ1PEPF000023CB.namprd02.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::e4) by SJ0PR13CA0134.outlook.office365.com
 (2603:10b6:a03:2c6::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.24 via Frontend Transport; Mon,
 9 Mar 2026 13:46:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF000023CB.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Mon, 9 Mar 2026 13:46:26 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 08:46:26 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 08:46:26 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Mar 2026 08:46:26 -0500
Received: from [10.249.65.90] ([10.249.65.90])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 629DkP5Z685708;
	Mon, 9 Mar 2026 08:46:26 -0500
Message-ID: <0c2b4b1c-7694-44e2-b98f-83770572e11d@ti.com>
Date: Mon, 9 Mar 2026 08:46:25 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH 1/2] ti-test: Remove the pcitest
 application
To: Aksh Garg <a-garg7@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <denys@konsulko.com>, <c-shilwant@ti.com>, <s-vadapalli@ti.com>,
	<danishanwar@ti.com>
References: <20260309130109.52886-1-a-garg7@ti.com>
 <20260309130109.52886-2-a-garg7@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260309130109.52886-2-a-garg7@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CB:EE_|BLAPR10MB4914:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d23cd2c-fb91-4838-ec49-08de7de242cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	fqtmGADwBYexX4j2rkcOAAJtueQ9HYzkW8KEQ5Mft+goNp3uoYmlK+MHBMsAEu/Vjiz05tbtnsiL9XN2KAaH76maXhRJFJao5R0CTDL4nQhcm0AG3Z/ZhOi79gHrjupAZ1/NwXP+/jTLmOwzO9icD8ykjl3+T4zANl2ZZesLcaRXbKoZyoAxQIc+yCT6nhlzd8afIlup6qb4JAxf1jRLXhLsGMpLybXPG+e0zI6bekoFQFa4V29TGN2Gdq3X41JnmzRYlFHTVZpX45ZI0ixL4mOx+wuGb6BdbytlCKi0kb895aFN7qdCbtqxggDheRoKbWXi7QOMWbZ0XgGjHzora2HQYSpuKatprg0wwCX5/Idf28bhpc2AUHb3B6BSb8lEPiQSXsy6Hbt3kzLQqq6GU3JpNm6IWZg5RKie8vnhsQ1IzeRoIhSjTc7lCjHU44HAm6pxBF/wsDP8Z8w2qBASew8H8AkcNXeyYqMzVRGK0a7y/tH0xRV708Zk3/EZD5vOkExEa7gf0Ax0AaUKuGLtu6kzh0DhKaofZVtCDS+dAfKmuo92T1PmFyAT1Wpds4YfLQWHNxKiRloPJ6k+Y/4ZiLT9i59DezmplT7ksKxUOUyro15JmQJmR2v7NFUUnd3riqaVL+ql+qpsE4ZgTQ9l/PTYvm+FAqBRcMYc5cW4A1G2duNowG1amtrnJfjxP+SJZaZiaZAnPFL3YwFrGHB2TJVbGBlF8Yoa+5Lf7bgVpzVPK5zlXIsqBlj4EjxqCCPzvpvB882i5rKvZGMdNsouoA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	sD+mIeYZy27dyo5EhOBWIc5zu0WZW1oWMOeSIXqmEhIDLGS/xR/ee+iDwHYbKYDEkf0vmUzjJGSU3LZOrVKtmCcR58f3BtST0l0ZPwlpG94fjREVa+kQl2O6xVbwgUgUy1ZNKla8qK7D43YIsVt6hEHNnnC5yQ09KGPVs8cCIIFwXa+jrp7bEAeU9ZjvkzPIj0siXDO0Pu/olMDOj9UgmKVI97desBsnJoWcSHFEYRvptwLI31zGmLPTwAGsy2bMv2D0mmMefK+f+URKVodBmgDzISVdGA1/6Px1tNi3nQiXknk3CntS0f2wjgh3Pdjcaj8NTqj+wY33O5Gti4vIGxYQ7x/bCtO3gJgsr2RbXVbaZ/bNyyh2KJueXA+L0WwzHIuqGeB5Qv2T1akwxP9xFqac6/p5FnP0eFvcfFE+gDn66HqT+pBlCfYguK1iZLQC
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 13:46:26.8906
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d23cd2c-fb91-4838-ec49-08de7de242cf
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023CB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4914
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 09 Mar 2026 13:46:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17295

We can't just remove this globally.  We need to base this on the bsp 
that is being built.

If you build the 6.12 kernel with master then you will not get a tool 
that works and will try and include a tool that will not work.

We will need to support this until the 6.12 kernel rolls out of support 
in master.

More comments inline

On 3/9/2026 8:01 AM, Aksh Garg wrote:
> The 'pcitest' application, used to test the PCIe endpoint functionality,
> is obsolete on the 6.18 kernel. Hence, remove the pcitest application
> from packagegroups.
> 
> Signed-off-by: Aksh Garg <a-garg7@ti.com>
> ---
>   .../packagegroup-arago-bootstrap.bb            |  1 -
>   .../recipes-core/packagegroups/ti-test.bb      |  1 -
>   .../recipes-kernel/pcitest/pcitest_5.10.bb     | 18 ------------------
>   3 files changed, 20 deletions(-)
>   delete mode 100644 meta-arago-test/recipes-kernel/pcitest/pcitest_5.10.bb
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bootstrap.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bootstrap.bb
> index e7a28eb80575..35c54ce7b176 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bootstrap.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bootstrap.bb
> @@ -11,7 +11,6 @@ UTILS = " \
>   	 evtest \
>   	 memtester \
>   	 nbench-byte \
> -	 pcitest \
>   	 serialcheck \
>   	 yavta \
>   	 hdparm \

UTILS:remove:bsp-ti-6_18 = "pcitest"


> diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> index 65cf7f1ea614..25d8cce5d615 100644
> --- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> +++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> @@ -37,7 +37,6 @@ TI_TEST_BASE = "\
>       nbench-byte \
>       openntpd \
>       ${@"optee-test" if d.getVar('OPTEEMACHINE') else ""} \
> -    pcitest \
>       pciutils \
>       perf \
>       powertop \

TI_TEST_BASE:remove:bsp-ti-6_18 = "pcitest"


> diff --git a/meta-arago-test/recipes-kernel/pcitest/pcitest_5.10.bb b/meta-arago-test/recipes-kernel/pcitest/pcitest_5.10.bb
> deleted file mode 100644

You cannot remove the recipe since it is still needed for 6.12 support.


> index 9ab0dbedf4ba..000000000000
> --- a/meta-arago-test/recipes-kernel/pcitest/pcitest_5.10.bb
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -SUMMARY = "Linux Kernel PCI test"
> -LICENSE = "GPL-2.0-only"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
> -
> -BRANCH = "ti-linux-5.10.y"
> -SRCREV = "73aa709ca10103b61fba3a07471dbb4dcb56db45"
> -SRC_URI = "git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git;protocol=https;branch=${BRANCH}"
> -
> -do_compile () {
> -	cd ${S}/tools/pci
> -	${CC} ${CFLAGS} ${LDFLAGS} -o pcitest pcitest.c
> -}
> -
> -do_install () {
> -	install -d ${D}${bindir}
> -	install -m 0755 ${S}/tools/pci/pcitest ${D}${bindir}
> -	install -m 0755 ${S}/tools/pci/pcitest.sh ${D}${bindir}
> -}

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

