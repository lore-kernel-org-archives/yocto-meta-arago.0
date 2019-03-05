Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id AFE5B52978
	for <meta-arago@arago-project.org>;
	Tue,  5 Mar 2019 23:18:15 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x25NI8Sd100669
	for <meta-arago@arago-project.org>; Tue, 5 Mar 2019 17:18:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1551827888;
	bh=MdGJ6nZdJn5LrJ9PC+/fgzK9WNPW5yFeee73c/IUlHY=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=thK5uTaPPl/V+DrBqOGMSGUcrp5vl2cdmpZFWFkAvTsv7qPUs79Gxd6ngy30kU5aP
	kd28EF8Yu/GTLBo0muI91L828d+YbM/8foM6fizFcAxD3b17QstkER9bEC9Rz8Z+ea
	LyaOGXPbf9XqGvX8SI7QQnnCei9ncQxEtNGAaSME=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x25NI8YW068343
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 5 Mar 2019 17:18:08 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 5 Mar 2019 17:18:08 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Tue, 5 Mar 2019 17:18:08 -0600
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x25NI7fZ010840;
	Tue, 5 Mar 2019 17:18:07 -0600
To: Yuan Zhao <yuanzhao@ti.com>, <meta-arago@arago-project.org>
References: <20190305011558.55639-1-yuanzhao@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <e2664c44-0afa-f127-3f35-8a381474868b@ti.com>
Date: Tue, 5 Mar 2019 18:18:06 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190305011558.55639-1-yuanzhao@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [PATCH v2] ocl: update version to 01.01.18.00
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
X-List-Received-Date: Tue, 05 Mar 2019 23:18:16 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Please apply to rocko.

- Jake

On 3/4/2019 8:15 PM, Yuan Zhao wrote:
> - Runtime support update for TIDL API 01.03.00
> - Update OpenCL TIDL firmware to 01.01.18.00
>
> Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
> ---
>   meta-arago-extras/recipes-ti/ocl/ocl.inc               | 4 ++--
>   meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta-arago-extras/recipes-ti/ocl/ocl.inc b/meta-arago-extras/recipes-ti/ocl/ocl.inc
> index be32b0bc..21247177 100644
> --- a/meta-arago-extras/recipes-ti/ocl/ocl.inc
> +++ b/meta-arago-extras/recipes-ti/ocl/ocl.inc
> @@ -1,5 +1,5 @@
>   # patch version at the end needs to be in double digits
> -PV = "1.1.17.02"
> +PV = "1.1.18.00"
>   INC_PR = "r0"
>   
>   LIC_FILES_CHKSUM = "file://../debian/copyright;md5=2e3965a73a8a49c23836467266120dff"
> @@ -10,7 +10,7 @@ OCL_GIT_URI = "git://git.ti.com/opencl/ti-opencl.git"
>   OCL_GIT_PROTOCOL = "git"
>   OCL_GIT_BRANCH = "master"
>   
> -OCL_SRCREV = "fef8ff7679dacfac7b208531be07550fa7e3673e"
> +OCL_SRCREV = "a50d8b41cc30bdf4faf1998ec3fc7d0a3093b795"
>   
>   BRANCH = "${OCL_GIT_BRANCH}"
>   SRC_URI = "${OCL_GIT_URI};protocol=${OCL_GIT_PROTOCOL};branch=${BRANCH}"
> diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb
> index a47d9128..a9ec413a 100644
> --- a/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb
> +++ b/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb
> @@ -3,7 +3,7 @@ SUMMARY = "OpenCL TIDL firmware for AM57xx"
>   LICENSE = "TI-TFL"
>   LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=082a028431c455252c1e1d3d1021d382"
>   
> -PV = "01.01.17.01"
> +PV = "01.01.18.00"
>   PR = "r0"
>   
>   require recipes-ti/includes/arago-paths.inc
> @@ -15,7 +15,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>   GIT_URI      = "git://git.ti.com/opencl/opencl-firmware.git"
>   GIT_PROTOCOL = "git"
>   BRANCH       = "master"
> -SRCREV       = "2f1715affab9ef4debf02769cf113dc1922cf75f"
> +SRCREV       = "3b98f405d98416a66678dec01d8f7ef244f379b6"
>   
>   SRC_URI      = "${GIT_URI};protocol=${GIT_PROTOCOL};branch=${BRANCH}"
>   

