Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 38462529BC
	for <meta-arago@arago-project.org>;
	Wed, 18 Dec 2019 19:16:03 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBIJEP6I060843
	for <meta-arago@arago-project.org>; Wed, 18 Dec 2019 13:14:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576696465;
	bh=A0O1EAtdK1qX+bD/gsWKCXupEeDyQupSIB86ck4q6Gk=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=zNQpO7ZKoJS8RiMoBFh3wImJ9GiU3INCbK7JPSkj+VukXBG6zh/ySwvqurbPxOqUA
	eAiuUmFsMbXXkSUduxsMJzNcxEtnZvAHlvLjLqIHnUNFQCEphxsjiJDW6nAssg+Zkl
	9XUIzwoLbncMMgku1WPc/yhPAZ3DEYZtOFEj3DZM=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBIJEPnm071000
	for <meta-arago@arago-project.org>; Wed, 18 Dec 2019 13:14:25 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Wed, 18 Dec 2019 13:14:25 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Wed, 18 Dec 2019 13:14:25 -0600
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBIJEOF4122489;
	Wed, 18 Dec 2019 13:14:25 -0600
To: Yuan Zhao <yuanzhao@ti.com>, <meta-arago@arago-project.org>
References: <20191217183018.68680-1-yuanzhao@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <5b7e8c33-6fc5-c13b-4e9a-2e31ffdbd947@ti.com>
Date: Wed, 18 Dec 2019 14:14:24 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191217183018.68680-1-yuanzhao@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [master/thud/ti2019.05][PATCH] ocl: update version to 01.02.00.01
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
X-List-Received-Date: Wed, 18 Dec 2019 19:16:03 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Please backport to ti2019.05.


Thank you,

Jake

On 12/17/2019 1:30 PM, Yuan Zhao wrote:
> - Update prebuilt ocl-tidl-fw to work with updated IPC in PSDK 6.2
> - Fix l3_noc message during CoreSDK IPU1 remoteproc boot
>
> Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
> ---
>   meta-arago-extras/recipes-ti/ocl/ocl.inc               | 4 ++--
>   meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta-arago-extras/recipes-ti/ocl/ocl.inc b/meta-arago-extras/recipes-ti/ocl/ocl.inc
> index 0a6dccc4..cc4ed6d4 100644
> --- a/meta-arago-extras/recipes-ti/ocl/ocl.inc
> +++ b/meta-arago-extras/recipes-ti/ocl/ocl.inc
> @@ -1,5 +1,5 @@
>   # patch version at the end needs to be in double digits
> -PV = "1.2.00.00"
> +PV = "1.2.00.01"
>   INC_PR = "r0"
>   
>   LIC_FILES_CHKSUM = "file://../debian/copyright;md5=2e3965a73a8a49c23836467266120dff"
> @@ -10,7 +10,7 @@ OCL_GIT_URI = "git://git.ti.com/opencl/ti-opencl.git"
>   OCL_GIT_PROTOCOL = "git"
>   OCL_GIT_BRANCH = "master"
>   
> -OCL_SRCREV = "301ecd37ac5553a8c94c87a0083b8d929e1d1a1e"
> +OCL_SRCREV = "850361c85cd00fcb9df958e016c792936ef4aa2b"
>   
>   BRANCH = "${OCL_GIT_BRANCH}"
>   SRC_URI = "${OCL_GIT_URI};protocol=${OCL_GIT_PROTOCOL};branch=${BRANCH}"
> diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb
> index 322f9017..0e8b46d6 100644
> --- a/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb
> +++ b/meta-arago-extras/recipes-ti/ocl/opencl-tidl-fw_git.bb
> @@ -3,7 +3,7 @@ SUMMARY = "OpenCL TIDL firmware for AM57xx"
>   LICENSE = "TI-TFL"
>   LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=082a028431c455252c1e1d3d1021d382"
>   
> -PV = "01.01.19.02"
> +PV = "01.02.00.01"
>   PR = "r0"
>   
>   require recipes-ti/includes/arago-paths.inc
> @@ -15,7 +15,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>   GIT_URI      = "git://git.ti.com/opencl/opencl-firmware.git"
>   GIT_PROTOCOL = "git"
>   BRANCH       = "master"
> -SRCREV       = "f9402b2b6b06185af7663bae0061c6fad12cff07"
> +SRCREV       = "9e3d0b34f604203f275fba4807481a8a763a4f63"
>   
>   SRC_URI      = "${GIT_URI};protocol=${GIT_PROTOCOL};branch=${BRANCH}"
>   

