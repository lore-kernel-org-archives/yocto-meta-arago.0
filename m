Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 1E7DB520DF
	for <meta-arago@arago-project.org>;
	Tue,  1 Oct 2019 12:39:20 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x91Cc9Hq112058
	for <meta-arago@arago-project.org>; Tue, 1 Oct 2019 07:38:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569933489;
	bh=xKCUQGq/XkwqgZG8aVcACOdYuRSGuOzEa8/Z6988odw=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=i4NyyZBjaWwyR9+noSTGCHYPSnsn6PaT5L9++KDheRoOBxHUEkT1Fd4zseeU3y1jE
	+ZMByrOJ6TDMv3jCUJ+7jrxCG+/0SstehrpaFR4uYiESeEuWlqjPZ8BMT479oxFf4y
	gIYL9r7VDoZYbi8Gq7iI7mbjorD0JfhPuzw1AhrE=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x91Cc8UM115922
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 1 Oct 2019 07:38:09 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 1 Oct 2019 07:37:58 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 1 Oct 2019 07:37:58 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x91Cc870084171;
	Tue, 1 Oct 2019 07:38:08 -0500
To: Yuan Zhao <yuanzhao@ti.com>, <meta-arago@arago-project.org>
References: <20190930155758.84306-1-yuanzhao@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <10712fbc-1896-422c-4ad7-ce3f43fbfc38@ti.com>
Date: Tue, 1 Oct 2019 08:38:08 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190930155758.84306-1-yuanzhao@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [PATCH] ocl: update version to 01.01.19.02
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
X-List-Received-Date: Tue, 01 Oct 2019 12:39:20 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Please backport to ti2019.03


Thank you,

Jake


On 9/30/2019 11:57 AM, Yuan Zhao wrote:
> - Update OpenCL TIDL firmware to 01.01.19.02
>
> Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
> ---
>   meta-arago-extras/recipes-ti/ocl/ocl.inc               | 4 ++--
>   meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta-arago-extras/recipes-ti/ocl/ocl.inc b/meta-arago-extras/recipes-ti/ocl/ocl.inc
> index 1bfb47d2..9193c488 100644
> --- a/meta-arago-extras/recipes-ti/ocl/ocl.inc
> +++ b/meta-arago-extras/recipes-ti/ocl/ocl.inc
> @@ -1,5 +1,5 @@
>   # patch version at the end needs to be in double digits
> -PV = "1.1.19.01"
> +PV = "1.1.19.02"
>   INC_PR = "r0"
>   
>   LIC_FILES_CHKSUM = "file://../debian/copyright;md5=2e3965a73a8a49c23836467266120dff"
> @@ -11,7 +11,7 @@ OCL_GIT_PROTOCOL = "git"
>   OCL_GIT_BRANCH = "master"
>   
>   
> -OCL_SRCREV = "517b95417982e001cda8948509fcc75e0a5b2f14"
> +OCL_SRCREV = "b178e67080afff815f8f7cccb123176cf6048322"
>   
>   BRANCH = "${OCL_GIT_BRANCH}"
>   SRC_URI = "${OCL_GIT_URI};protocol=${OCL_GIT_PROTOCOL};branch=${BRANCH}"
> diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb
> index 96901c16..322f9017 100644
> --- a/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb
> +++ b/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb
> @@ -3,7 +3,7 @@ SUMMARY = "OpenCL TIDL firmware for AM57xx"
>   LICENSE = "TI-TFL"
>   LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=082a028431c455252c1e1d3d1021d382"
>   
> -PV = "01.01.19.01"
> +PV = "01.01.19.02"
>   PR = "r0"
>   
>   require recipes-ti/includes/arago-paths.inc
> @@ -15,7 +15,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>   GIT_URI      = "git://git.ti.com/opencl/opencl-firmware.git"
>   GIT_PROTOCOL = "git"
>   BRANCH       = "master"
> -SRCREV       = "6124427f1eb33fa2afb5152442f4eca930ffd10a"
> +SRCREV       = "f9402b2b6b06185af7663bae0061c6fad12cff07"
>   
>   SRC_URI      = "${GIT_URI};protocol=${GIT_PROTOCOL};branch=${BRANCH}"
>   

