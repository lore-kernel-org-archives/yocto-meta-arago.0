Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 089B8C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 20:48:42 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.846.1647982121184683545
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 13:48:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=vJzRWCNu;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: nm@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22MKmdmo039280;
	Tue, 22 Mar 2022 15:48:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647982119;
	bh=NzLBYL6bfYlNoRC6H3Bg7/uZ2AQkcPFvmMLwDscOuP8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=vJzRWCNu4m4IC9PVBxtEy2t96F2fglkJHrHVfBgjRls3nhzvYgi4m4W0ak9VyWlv8
	 LBHh1Ygs8LzAnH89Y4vc6jqkNn6GlE5GLD+VMXbzDqMMRcB+wgZURqxTa5Y1k5NN2y
	 x9oSHEJTlepLSimcLkA4TXegqjiU4+Ow859kp/tk=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22MKmd83012162
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Mar 2022 15:48:39 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 22
 Mar 2022 15:48:39 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 22 Mar 2022 15:48:39 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22MKmd47057862;
	Tue, 22 Mar 2022 15:48:39 -0500
Date: Tue, 22 Mar 2022 15:48:39 -0500
From: Nishanth Menon <nm@ti.com>
To: <reatmon@ti.com>
CC: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][dunfell][PATCH 1/3] ti-tisdk-makefile: adding uboot
 r5 config variable for am62xx
Message-ID: <20220322204839.pjd274ubfw6pkuos@elaborate>
References: <20220322193554.24404-1-reatmon@ti.com>
 <20220322193554.24404-2-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220322193554.24404-2-reatmon@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 22 Mar 2022 20:48:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13714

On 14:35-20220322, Ryan Eatmon via lists.yoctoproject.org wrote:
> From: Nishanth Menon <nm@ti.com>
> 
> lets add support for the latest of TI SoC.
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> index 7bda8eed..7fb47bbb 100644
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> @@ -363,6 +363,7 @@ K3_UBOOT_MACHINE_R5_j7-evm = "j721e_evm_r5_config"
>  K3_UBOOT_MACHINE_R5_j7-hs-evm = "j721e_hs_evm_r5_config"
>  K3_UBOOT_MACHINE_R5_j7200-evm = "j7200_evm_r5_config"
>  K3_UBOOT_MACHINE_R5_j721s2-evm = "j721s2_evm_r5_config"
> +K3_UBOOT_MACHINE_R5_am62xx-evm = "am62xx_evm_r5_config"
>  
>  do_install_append_k3() {
>      cat >> ${D}/Rules.make << __EOF__
> -- 
> 2.17.1


We probably also will need update to
recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
and recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb


same update is needed in ti-tisdk-makefile
PRU_ICSS_INSTALL_TARGET_am64xx ..

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

