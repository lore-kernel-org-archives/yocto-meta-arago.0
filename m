Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF413EB64D9
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 14:09:57 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.14465.1687874994524072609
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 27 Jun 2023 07:09:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=qjPeWzEu;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35RE9oDR004869;
	Tue, 27 Jun 2023 09:09:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687874990;
	bh=v3A//EeF1heaZaxo0pj16Hde8qEfp8ujIR20IRJNs+I=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=qjPeWzEu1KTg5mYbShD3rCmvDgdRJuu1cj9MzEfxfST2iWpV7cRVvwz02ER/hmEwV
	 4K0YDq+9MrMgvreRfIyXxsQNBy2AENWcGNCMs+4gmcWMIPQL0S5x7pk1pEWT/bBNoc
	 Atp6HTZNOru8GmoKEuGyB888L232UKJhtEfRqfig=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35RE9oNL047895
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 27 Jun 2023 09:09:50 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 27
 Jun 2023 09:09:50 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 27 Jun 2023 09:09:50 -0500
Received: from [10.249.34.224] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35RE9ocG003707;
	Tue, 27 Jun 2023 09:09:50 -0500
Message-ID: <a6e8706a-77d6-77d1-1aea-dac62789bcbc@ti.com>
Date: Tue, 27 Jun 2023 09:09:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [master/kirkstone][PATCH v3 8/8] tisdk-default-image: Add package
 group for netopeer/sysrepo
Content-Language: en-US
To: Ravi Gunasekaran <r-gunasekaran@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <g-gupta@ti.com>, <praneeth@ti.com>
References: <20230627100345.24340-1-r-gunasekaran@ti.com>
 <20230627100345.24340-9-r-gunasekaran@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230627100345.24340-9-r-gunasekaran@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 27 Jun 2023 14:09:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14704



On 6/27/2023 5:03 AM, Ravi Gunasekaran wrote:
> Add new package group for netopeer2, sysrepo, nw-configurator
> and yang models.
> 
> Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
> ---
> 
> Changes since v2:
> ----------------
> Removed "PACKAGE_ARCH" as this is not machine specific.
> 
> Changes since v1:
> ----------------
> Added a new package group packagegroup-arago-tisdk-sysrepo instead of
> using ARAGO_DEFAULT_IMAGE_EXTRA_INSTALL.
> 
>   .../recipes-core/images/tisdk-default-image.bb    |  1 +
>   .../packagegroup-arago-tisdk-sysrepo.bb           | 15 +++++++++++++++
>   2 files changed, 16 insertions(+)
>   create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-sysrepo.bb
> 
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> index bb825e09..7769c97c 100644
> --- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> PACKAGE_ARCH+++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb

Something is wrong with this patch... It does apply at all. I think it 
is the PACKAGE_ARCH that appears on the above line.  Not sure where that 
came from, but git/patch does not like it.


> @@ -28,6 +28,7 @@ IMAGE_INSTALL += "\
>       ti-analytics \
>       ti-demos \
>       ${ARAGO_DEFAULT_IMAGE_EXTRA_INSTALL} \
> +    packagegroup-arago-tisdk-sysrepo \
>   "
>   
>   export IMAGE_BASENAME = "tisdk-default-image"
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-sysrepo.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-sysrepo.bb
> new file mode 100644
> index 00000000..c0bb599b
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-sysrepo.bb
> @@ -0,0 +1,15 @@
> +SUMMARY = "Netopeer2 and Sysrepo packagegroup"
> +LICENSE = "MIT"
> +
> +inherit packagegroup
> +
> +ARAGO_NETOPEER_SYSREPO = "\
> +    sysrepo \
> +    netopeer2-server \
> +    nw-configurator \
> +    tsn-yang-models \
> +"
> +
> +RDEPENDS:${PN} = "\
> +    ${ARAGO_NETOPEER_SYSREPO} \
> +"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

