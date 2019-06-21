Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 3C8B352980
	for <meta-arago@arago-project.org>;
	Fri, 21 Jun 2019 13:01:22 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5LD0eEX120742
	for <meta-arago@arago-project.org>; Fri, 21 Jun 2019 08:00:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561122040;
	bh=JzARQqNNZAIFesgk4VZhMahfnnt3nZ1lOQ2hFry1w6I=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=OfnRVkeohIAyWNp/uiotilSK+COYv1fdFI34PKhIZwueyg728uqOhZvu/72vv0gpz
	AqRtkVsv5BGTKOppWEYKGRk+sn3ppWGUD2+MpexZM1PvNQkFUJSQzM3XXmEleJNHui
	56B3iaZokLUkxL/jBy6oBkSpMnz2sHIH+SBF1/PA=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5LD0e9c126870
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 21 Jun 2019 08:00:40 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 21 Jun 2019 08:00:39 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 21 Jun 2019 08:00:39 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5LD0dB0020496;
	Fri, 21 Jun 2019 08:00:39 -0500
To: Yuan Zhao <yuanzhao@ti.com>, <meta-arago@arago-project.org>
References: <20190619154326.111392-1-yuanzhao@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <0b8795c8-cc5a-f4df-7286-78e0abb83dca@ti.com>
Date: Fri, 21 Jun 2019 09:00:39 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190619154326.111392-1-yuanzhao@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [thud/ti2019.01][PATCH] tidl-api: fix l2 scratch size for TIDL execution
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
X-List-Received-Date: Fri, 21 Jun 2019 13:01:22 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Can you please back-port this to ti2019.01?


Thank you,

Jake


On 6/19/2019 11:43 AM, Yuan Zhao wrote:
> - Required for DSP only execution of jdetnet_voc network
>
> Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
> ---
>   .../files/0001-tidl-api_l2_cache_size.patch        | 41 ++++++++++++++++++++++
>   meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc |  6 +++-
>   .../recipes-ti/tidl-api/tidl-api_git.bb            |  2 --
>   .../recipes-ti/tidl-api/tidl-examples_git.bb       |  2 --
>   .../recipes-ti/tidl-api/tidl-viewer_git.bb         |  4 +--
>   5 files changed, 47 insertions(+), 8 deletions(-)
>   create mode 100644 meta-arago-extras/recipes-ti/tidl-api/files/0001-tidl-api_l2_cache_size.patch
>
> diff --git a/meta-arago-extras/recipes-ti/tidl-api/files/0001-tidl-api_l2_cache_size.patch b/meta-arago-extras/recipes-ti/tidl-api/files/0001-tidl-api_l2_cache_size.patch
> new file mode 100644
> index 00000000..84e12a18
> --- /dev/null
> +++ b/meta-arago-extras/recipes-ti/tidl-api/files/0001-tidl-api_l2_cache_size.patch
> @@ -0,0 +1,41 @@
> +diff --git a/tidl_api/dsp/ocl_wrapper.cl b/tidl_api/dsp/ocl_wrapper.cl
> +index e75ed1d..cb56302 100644
> +--- a/tidl_api/dsp/ocl_wrapper.cl
> ++++ b/tidl_api/dsp/ocl_wrapper.cl
> +@@ -46,6 +46,7 @@ void ocl_tidl_initialize(global unsigned char*            createParams,
> + {
> +     // Set L1 cache to 16KB. TIDL requires 16KB of L1 scratch
> +     __cache_l1d_16k();
> ++    __cache_l2_64k();
> +
> +     ocl_dsp_tidl_initialize(createParams, netParamsBuffer,
> +                             externalMemoryHeapBase, initializeParams,
> +@@ -66,5 +67,6 @@ void ocl_tidl_process(global OCL_TIDL_ProcessParams* processParams,
> + kernel void ocl_tidl_cleanup()
> + {
> +     ocl_dsp_tidl_cleanup();
> ++    __cache_l2_128k();
> +     __cache_l1d_all();
> + }
> +diff --git a/tidl_api/src/ocl_device.cpp b/tidl_api/src/ocl_device.cpp
> +index ab0bf26..d9351cd 100644
> +--- a/tidl_api/src/ocl_device.cpp
> ++++ b/tidl_api/src/ocl_device.cpp
> +@@ -511,7 +511,7 @@ static bool CheckOpenCLVersion(cl_platform_id id)
> +     err = clGetPlatformInfo(id, CL_PLATFORM_VERSION, 0, nullptr, &length);
> +     if (err != CL_SUCCESS) return false;
> +
> +-    std::unique_ptr<char> version(new char[length]);
> ++    std::unique_ptr<char[]> version(new char[length]);
> +     err = clGetPlatformInfo(id, CL_PLATFORM_VERSION, length, version.get(),
> +                             nullptr);
> +     if (err != CL_SUCCESS) return false;
> +@@ -543,7 +543,7 @@ static bool PlatformIsAM57()
> +     err = clGetPlatformInfo(id, CL_PLATFORM_NAME, 0, nullptr, &length);
> +     if (err != CL_SUCCESS) return false;
> +
> +-    std::unique_ptr<char> name(new char[length]);
> ++    std::unique_ptr<char[]> name(new char[length]);
> +
> +     err = clGetPlatformInfo(id, CL_PLATFORM_NAME, length, name.get(), nullptr);
> +     if (err != CL_SUCCESS) return false;
> diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> index 648167df..04049e73 100644
> --- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> +++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
> @@ -1,5 +1,5 @@
>   PV = "1.3.0"
> -INC_PR = "r0"
> +INC_PR = "r1"
>   
>   LIC_FILES_CHKSUM = "file://license.txt;md5=e3daeabffb9fc131a73f16d16cbdb118"
>   
> @@ -9,3 +9,7 @@ BRANCH = "master"
>   
>   SRC_URI = "${GIT_URI};protocol=${GIT_PROTOCOL};branch=${BRANCH}"
>   SRCREV = "785170685ca6a5c11876b05ddf74741c419393be"
> +
> +# default patchdir is ${S}
> +SRC_URI += "file://0001-tidl-api_l2_cache_size.patch"
> +S = "${WORKDIR}/git"
> diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb b/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
> index fbea9aa8..15f107cc 100644
> --- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
> +++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api_git.bb
> @@ -24,8 +24,6 @@ RDEPENDS_${PN} += "opencl-runtime \
>                      opencv \
>   "
>   
> -S = "${WORKDIR}/git"
> -
>   EXTRA_OEMAKE = " -C ${S}/tidl_api \
>                    TARGET_ROOTDIR=${STAGING_DIR_HOST} \
>                    TI_OCL_CGT_INSTALL=${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x \
> diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb b/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
> index 2f5ca537..0eb821f9 100644
> --- a/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
> +++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
> @@ -24,8 +24,6 @@ RDEPENDS_${PN} += "tidl-api \
>                      json-c \
>   "
>   
> -S = "${WORKDIR}/git"
> -
>   EXTRA_OEMAKE = " -C ${S}/examples \
>                    TARGET_ROOTDIR=${STAGING_DIR_HOST} \
>                    TI_OCL_CGT_INSTALL=${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x \
> diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-viewer_git.bb b/meta-arago-extras/recipes-ti/tidl-api/tidl-viewer_git.bb
> index c97b3a3b..5690c77e 100644
> --- a/meta-arago-extras/recipes-ti/tidl-api/tidl-viewer_git.bb
> +++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-viewer_git.bb
> @@ -5,12 +5,10 @@ LICENSE = "BSD"
>   
>   include tidl-api.inc
>   
> -PR = "${INC_PR}.1"
> +PR = "${INC_PR}.0"
>   
>   DEPENDS = "boost boost-native ti-cgt6x-native clocl-native"
>   
> -S = "${WORKDIR}/git"
> -
>   TARGET_class-target = "arm"
>   TARGET_class-native = "x86"
>   TARGET_class-nativesdk = "x86"

