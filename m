Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE664EB64D9
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 15:02:26 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.373.1687878138205726721
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 27 Jun 2023 08:02:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=yUmOCMDR;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35RF2EB0018671;
	Tue, 27 Jun 2023 10:02:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687878134;
	bh=YbjTQWaAHNY0QRQQLYokCBAp9Jg3LwGWNPmPvT3FbQ4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=yUmOCMDRC4O/uMVbFw1ZUpjRxRzSfQ78eCcSkZ7WrvOglzssL1IWccdnX9GQu5kGW
	 vvZLr7Q6ndOhL6Ixw6663n41OVOlvj7oKwr4acHj6EjprCSSBbAaLXggpTZ/a2Pz98
	 MNZ1xSMD/Zciz1BJ+9yT3oKkTDSG+AksQLPLfHS8=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35RF2E4L046493
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 27 Jun 2023 10:02:14 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 27
 Jun 2023 10:02:13 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 27 Jun 2023 10:02:13 -0500
Received: from [10.250.37.10] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35RF2DEl025483;
	Tue, 27 Jun 2023 10:02:13 -0500
Message-ID: <a8c84035-031b-66d2-4ff9-027015d99f0c@ti.com>
Date: Tue, 27 Jun 2023 10:02:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [master/kirkstone][PATCH v4 5/8] meta-arago-extras: sysrepo: Add
 libredblack needed for sysrepo
Content-Language: en-US
To: Ravi Gunasekaran <r-gunasekaran@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <reatmon@ti.com>, <g-gupta@ti.com>, <praneeth@ti.com>
References: <20230627144249.30543-1-r-gunasekaran@ti.com>
 <20230627144249.30543-6-r-gunasekaran@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230627144249.30543-6-r-gunasekaran@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 27 Jun 2023 15:02:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14716

On 6/27/23 9:42 AM, Ravi Gunasekaran wrote:
> libredblack is needed to build sysrepo. Add recipe for libredblack.
> 
> The recipe is taken as-is from the commit 09f73e7 ("update for honister")
> from the public repo [1].
> 
> [1] - https://github.com/sartura/meta-sysrepo
> 
> Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
> ---
> 
> Changes since v3:
> ----------------
> No change
> 
> Changes since v2:
> ---------------
> Newly introduced in this series
> 
>   .../libredblack/libredblack_git.bb            | 21 +++++++++++++++++++
>   1 file changed, 21 insertions(+)
>   create mode 100644 meta-arago-extras/recipes-sysrepo/libredblack/libredblack_git.bb
> 
> diff --git a/meta-arago-extras/recipes-sysrepo/libredblack/libredblack_git.bb b/meta-arago-extras/recipes-sysrepo/libredblack/libredblack_git.bb
> new file mode 100644
> index 00000000..ea51b618
> --- /dev/null
> +++ b/meta-arago-extras/recipes-sysrepo/libredblack/libredblack_git.bb
> @@ -0,0 +1,21 @@
> +SUMMARY = "Library for handling red-black tree searching algorithm"
> +DESCRIPTION = "A library to provide the RedBlack balanced tree searching and sorting algorithm."
> +LICENSE = "LGPLv2.1"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=de174fb5a92cdbe038c88dc4c4316f99"
> +
> +SRC_URI = "git://github.com/sysrepo/libredblack.git;protocol=https"
> +
> +PV = "1.0+git${SRCPV}"
> +SRCREV = "a399310d99b61eec4d3c0677573ab5dddcf9395d"
> +
> +S = "${WORKDIR}/git"
> +
> +# NOTE: if this software is not capable of being built in a separate build directory
> +# from the source, you should replace autotools with autotools-brokensep in the
> +# inherit line

This comment isn't needed.

I understand the 1:1 copy from the original repo, but after you should have another patch
that comes back and cleans these up. If they are to live in meta-arago they need to be up
to the standards.

Andrew

> +inherit python3native autotools
> +
> +# Specify any options you want to pass to the configure script using EXTRA_OECONF:
> +EXTRA_OECONF = " --without-rbgen "
> +
> +BBCLASSEXTEND = "native nativesdk"

