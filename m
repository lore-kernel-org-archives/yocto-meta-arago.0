Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.7264.1646229058079680561
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 02 Mar 2022 05:50:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Vc5EOHkW;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 222Dor4i049950;
	Wed, 2 Mar 2022 07:50:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1646229053;
	bh=oHptqwUXA/eXPMB6yh0s17AhZMyiIkBzNMBYeLEZGeo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Vc5EOHkWZ7zNb4vY6IydzOi3z2eTLnCKWIo55maz6BbmlqZk3upx3wjgur/A44Ues
	 rcG7MonA2g7DqNqyQBvczVYbs+uty+ozsKCLEtwUFwtyS7INdmMW/DbDXFvN+mDVhh
	 mSIgNzqtfKfXM3wHopg+Aj+ccd0syRR6S1W4zDZY=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 222DorQk053917
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 2 Mar 2022 07:50:53 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 2
 Mar 2022 07:50:53 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 2 Mar 2022 07:50:53 -0600
Received: from [10.249.37.96] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 222DoqfG121772;
	Wed, 2 Mar 2022 07:50:52 -0600
Message-ID: <46f32e91-bb5e-df34-6ad6-912a459cf314@ti.com>
Date: Wed, 2 Mar 2022 07:50:52 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [meta-arago][dunfell][PATCH] ti-tisdk-setup: Update SRCREV to latest
To: Aparna M <a-m1@ti.com>, <meta-arago@lists.yoctoproject.org>,
        <praneeth@ti.com>, <denis@denix.org>
CC: <nikhil.nd@ti.com>, <devarsht@ti.com>
References: <20220225141125.15517-1-a-m1@ti.com>
From: "Ryan Eatmon" <reatmon@ti.com>
In-Reply-To: <20220225141125.15517-1-a-m1@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 2/25/2022 8:11, Aparna M wrote:
> Update SRCREV to include updates to create-sdcard.sh, uboot setup env
> scripts and tftp support for HS EVMs.
> 
> Signed-off-by: Aparna M <a-m1@ti.com>
> ---
>   .../recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb              | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
> index 886a8b55..2e35f6e2 100644
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://setup.sh;beginline=3;endline=31;md5=fc4b04a33df6d892c
>   PR = "r46"

The PR needs to bump also.  PR = "r47".


>   BRANCH ?= "master"
> -SRCREV = "42a8379fda829f34c374ddfca0242a479a84d454"
> +SRCREV = "22f4e5af1894a60d9e7d04caf83f26a556c14eca"
>   SRC_URI = "git://arago-project.org/git/projects/tisdk-setup-scripts.git;protocol=git;branch=${BRANCH}"
>   
>   S = "${WORKDIR}/git/"

-- 
Ryan Eatmon
reatmon@ti.com
