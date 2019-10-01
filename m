Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 312FB520DF
	for <meta-arago@arago-project.org>;
	Tue,  1 Oct 2019 12:39:30 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x91CcJ6A112110
	for <meta-arago@arago-project.org>; Tue, 1 Oct 2019 07:38:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569933499;
	bh=W6ip9HuETUUGEgOSvHs03UFb9G4YQQjm0ayMpt4+piU=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=qNeNQz5tT/jGwJ7rUpzIpfJ3uKFSRe3kB1VhKNRGuALs7JxfATmV/CI1TLD1Gcxd/
	gwsMSCQ64HwMpr4g7V79RawwJVQQDp5I5199L+OcuQj5KUtbY3XWaUfAp7r80kcuav
	z8NXzjkwvD6b3/qov21DULLu8O3sA1YVvAlBuefE=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x91CcIRk116213
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 1 Oct 2019 07:38:18 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 1 Oct 2019 07:38:08 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 1 Oct 2019 07:38:08 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x91CcI6q058228;
	Tue, 1 Oct 2019 07:38:18 -0500
To: Yuan Zhao <yuanzhao@ti.com>, <meta-arago@arago-project.org>
References: <20190930160730.84383-1-yuanzhao@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <6966f35e-015a-d50c-12ea-4eb8c0535144@ti.com>
Date: Tue, 1 Oct 2019 08:38:18 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190930160730.84383-1-yuanzhao@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [PATCH] tidl-api: update to version 1.3.3
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Oct 2019 12:39:30 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Please backport to ti2019.03


Thank you,

Jake


On 9/30/2019 12:07 PM, Yuan Zhao wrote:
> - Revert workaround for allocation bug that is now fixed
>    in OpenCL TIDL firmware 01.01.19.02
>
> Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
> ---
>   meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> index edfd208f..e3e124d0 100644
> --- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> +++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> @@ -1,4 +1,4 @@
> -PV = "1.3.2"
> +PV = "1.3.3"
>   INC_PR = "r0"
>   
>   LIC_FILES_CHKSUM = "file://license.txt;md5=e3daeabffb9fc131a73f16d16cbdb118"
> @@ -8,7 +8,7 @@ GIT_PROTOCOL = "git"
>   BRANCH = "master"
>   
>   SRC_URI = "${GIT_URI};protocol=${GIT_PROTOCOL};branch=${BRANCH}"
> -SRCREV = "b83df643de46c2ae198dfdac859e51f6b4acc1ea"
> +SRCREV = "092a2ed047b02d9668fddebe61d4e5920bfbfb3f"
>   
>   # default patchdir is ${S}
>   S = "${WORKDIR}/git"

