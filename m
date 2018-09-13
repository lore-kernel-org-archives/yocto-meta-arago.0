Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id C6C4C52993
	for <meta-arago@arago-project.org>;
	Thu, 13 Sep 2018 16:18:24 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8DGIGCE097281
	for <meta-arago@arago-project.org>; Thu, 13 Sep 2018 11:18:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536855496;
	bh=ZAG03AODmr3XBQJ1OU0gf0Oj+ZmypjkJ+73plgcGGWM=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=KEp57B+f3SQVIAYq6w7wFw8CA0Xa2ID87IJDAn9mjV4mdHx3UAwDxbvD3doekLg3x
	tt/VhSxggqBgFeeQXmiBzigxzjPwnlnkm3KUojZotSI3P1yAKzyXqDRmCd9b4KKmOO
	VU/KthV3dCxA+syaXoOtTjcd+0Xy+4eXzWwHwjeg=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8DGIGi9005074
	for <meta-arago@arago-project.org>; Thu, 13 Sep 2018 11:18:16 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 13 Sep 2018 11:18:16 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 13 Sep 2018 11:18:16 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8DGIGCq003891;
	Thu, 13 Sep 2018 11:18:16 -0500
To: Yuan Zhao <yuanzhao@ti.com>, <meta-arago@arago-project.org>
References: <20180907205041.85540-1-yuanzhao@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <9cc32e56-96cd-1738-95e3-aa4cc5f66cca@ti.com>
Date: Thu, 13 Sep 2018 12:18:16 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180907205041.85540-1-yuanzhao@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [PATCH] tidl-api: update to version 01.01.00.00
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
X-List-Received-Date: Thu, 13 Sep 2018 16:18:25 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Can you please backport this to ti2018.03?


Thank you,

Jake


On 9/7/2018 4:50 PM, Yuan Zhao wrote:
> Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
> ---
>   meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc         | 6 +++---
>   meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb      | 2 +-
>   meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb | 2 +-
>   meta-arago-extras/recipes-ti/tidl-api/tidl-viewer_git.bb   | 2 +-
>   4 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> index f1a34eb0..97c2b68d 100644
> --- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> +++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> @@ -1,11 +1,11 @@
> -PV = "1.0.0.2"
> +PV = "1.1.0.0"
>   INC_PR = "r0"
>   
> -LIC_FILES_CHKSUM = "file://tidl_api_manifest.html;md5=ae816cc40db02fe06193212437ad00e8"
> +LIC_FILES_CHKSUM = "file://tidl_api_manifest.html;md5=fb8d8b8edb866b0b233462139d1c3222"
>   
>   GIT_URI = "git://git.ti.com/tidl/tidl-api.git"
>   GIT_PROTOCOL = "git"
>   BRANCH = "master"
>   
>   SRC_URI = "${GIT_URI};protocol=${GIT_PROTOCOL};branch=${BRANCH}"
> -SRCREV = "06585057d0f47bb930647123557bc5a1506dabda"
> +SRCREV = "a229faf1c14ddfa48e44d271ddfad44e4e7fc033"
> diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb b/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
> index 9c41ef11..47e98ef9 100644
> --- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
> +++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
> @@ -1,6 +1,6 @@
>   SUMMARY = "TIDL API"
>   DESCRIPTION = "TIDL API header and library. Refer TIDL API User's Guide for details."
> -HOMEPAGE = "http://software-dl.ti.com/mctools/docs/tidl-api/intro.html"
> +HOMEPAGE = "https://downloads.ti.com/mctools/esd/docs/tidl-api/intro.html"
>   LICENSE = "BSD"
>   
>   include tidl-api.inc
> diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb b/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
> index a1f3ea68..94f215c3 100644
> --- a/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
> +++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
> @@ -1,6 +1,6 @@
>   SUMMARY = "TIDL API examples"
>   DESCRIPTION = "Examples of TIDL API. Refer TIDL API User's Guide for details."
> -HOMEPAGE = "http://software-dl.ti.com/mctools/docs/tidl-api/intro.html"
> +HOMEPAGE = "https://downloads.ti.com/mctools/esd/docs/tidl-api/intro.html"
>   LICENSE = "BSD"
>   
>   include tidl-api.inc
> diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-viewer_git.bb b/meta-arago-extras/recipes-ti/tidl-api/tidl-viewer_git.bb
> index 3c761747..9a2cff13 100644
> --- a/meta-arago-extras/recipes-ti/tidl-api/tidl-viewer_git.bb
> +++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-viewer_git.bb
> @@ -1,6 +1,6 @@
>   SUMMARY = "TIDL Network Viewer"
>   DESCRIPTION = "TIDL Network viewer using dot and graphviz"
> -HOMEPAGE = "http://software-dl.ti.com/mctools/docs/tidl-api/intro.html"
> +HOMEPAGE = "https://downloads.ti.com/mctools/esd/docs/tidl-api/intro.html"
>   LICENSE = "BSD"
>   
>   include tidl-api.inc


