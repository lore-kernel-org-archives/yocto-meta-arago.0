Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id D33D452980
	for <meta-arago@arago-project.org>;
	Fri, 21 Jun 2019 13:01:08 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5LD0Qqp097535
	for <meta-arago@arago-project.org>; Fri, 21 Jun 2019 08:00:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561122026;
	bh=Jyu7tVOv8XUqcbb9GPc1SBy2FMLEimhONAdCWNgzmqU=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=Fmd/iaL78C7R38IQCejo7CQXw2OUk7mq5Alv25zzQW/rgzv30lUM1+wQtQOEn5ByJ
	eDFypWzSU068cx0jhev9oz/LjSLEZmmwjFpSDwJPqE/VQbqT72laOJr+mfw+b9MYje
	atDsLrrabX+qyvRXIBaie0KEv//GDBEouKdymrl8=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5LD0Qgg015544
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 21 Jun 2019 08:00:26 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 21 Jun 2019 08:00:26 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 21 Jun 2019 08:00:26 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5LD0QK6035570;
	Fri, 21 Jun 2019 08:00:26 -0500
To: Yuan Zhao <yuanzhao@ti.com>, <meta-arago@arago-project.org>
References: <20190619135602.98492-1-yuanzhao@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <43d97e9c-c12e-e0db-915b-db82eee13c92@ti.com>
Date: Fri, 21 Jun 2019 09:00:26 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190619135602.98492-1-yuanzhao@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [thud/ti2019.01][PATCH] ocl: Fix dsp l2 cache size update issue
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
X-List-Received-Date: Fri, 21 Jun 2019 13:01:09 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Can you please back-port this to ti2019.01?


Thank you,

Jake


On 6/19/2019 9:56 AM, Yuan Zhao wrote:
> - Required for TIDL DSP execution
>
> Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
> ---
>   .../ocl/files/0002-OpenCL_l2_cache_size.patch      | 49 ++++++++++++++++++++++
>   .../recipes-ti/ocl/opencl-monitor_git.bb           |  4 +-
>   2 files changed, 52 insertions(+), 1 deletion(-)
>   create mode 100644 meta-arago-extras/recipes-ti/ocl/files/0002-OpenCL_l2_cache_size.patch
>
> diff --git a/meta-arago-extras/recipes-ti/ocl/files/0002-OpenCL_l2_cache_size.patch b/meta-arago-extras/recipes-ti/ocl/files/0002-OpenCL_l2_cache_size.patch
> new file mode 100644
> index 00000000..7a81a137
> --- /dev/null
> +++ b/meta-arago-extras/recipes-ti/ocl/files/0002-OpenCL_l2_cache_size.patch
> @@ -0,0 +1,49 @@
> +diff --git a/monitor/src/builtins.c b/monitor/src/builtins.c
> +index fbf3bf3..4edf61c 100644
> +--- a/monitor/src/builtins.c
> ++++ b/monitor/src/builtins.c
> +@@ -159,7 +159,7 @@ EXPORT int __cache_l2_none()
> + EXPORT int __cache_l2_32k()
> + {
> +     int32_t scratch_delta = __cache_l2_size() - (32 << 10);
> +-    uint32_t scratch_size  = kernel_config_l2.L2_scratch_size;
> ++    int32_t scratch_size  = kernel_config_l2.L2_scratch_size;
> +     if (-scratch_delta > scratch_size) return 0;
> +     kernel_config_l2.L2_scratch_size += scratch_delta;
> +
> +@@ -173,7 +173,7 @@ EXPORT int __cache_l2_32k()
> + EXPORT int __cache_l2_64k()
> + {
> +     int32_t scratch_delta = __cache_l2_size() - (64 << 10);
> +-    uint32_t scratch_size  = kernel_config_l2.L2_scratch_size;
> ++    int32_t scratch_size  = kernel_config_l2.L2_scratch_size;
> +     if (-scratch_delta > scratch_size) return 0;
> +     kernel_config_l2.L2_scratch_size += scratch_delta;
> +
> +@@ -187,7 +187,7 @@ EXPORT int __cache_l2_64k()
> + EXPORT int __cache_l2_128k()
> + {
> +     int32_t scratch_delta = __cache_l2_size() - (128 << 10);
> +-    uint32_t scratch_size  = kernel_config_l2.L2_scratch_size;
> ++    int32_t scratch_size  = kernel_config_l2.L2_scratch_size;
> +     if (-scratch_delta > scratch_size) return 0;
> +     kernel_config_l2.L2_scratch_size += scratch_delta;
> +
> +@@ -205,7 +205,7 @@ EXPORT int __cache_l2_512k() { return 0; }
> + EXPORT int __cache_l2_256k()
> + {
> +     int32_t scratch_delta = __cache_l2_size() - (256 << 10);
> +-    uint32_t scratch_size  = kernel_config_l2.L2_scratch_size;
> ++    int32_t scratch_size  = kernel_config_l2.L2_scratch_size;
> +     if (-scratch_delta > scratch_size) return 0;
> +     kernel_config_l2.L2_scratch_size += scratch_delta;
> +
> +@@ -219,7 +219,7 @@ EXPORT int __cache_l2_256k()
> + EXPORT int __cache_l2_512k()
> + {
> +     int32_t scratch_delta = __cache_l2_size() - (512 << 10);
> +-    uint32_t scratch_size  = kernel_config_l2.L2_scratch_size;
> ++    int32_t scratch_size  = kernel_config_l2.L2_scratch_size;
> +     if (-scratch_delta > scratch_size) return 0;
> +     kernel_config_l2.L2_scratch_size += scratch_delta;
> +
> diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
> index 0ab21a1a..00aa773c 100644
> --- a/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
> +++ b/meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
> @@ -5,7 +5,9 @@ LICENSE = "BSD"
>   include ocl.inc
>   require recipes-ti/includes/arago-paths.inc
>   
> -PR = "${INC_PR}.0"
> +SRC_URI += "file://0002-OpenCL_l2_cache_size.patch;patchdir=${WORKDIR}/git"
> +
> +PR = "${INC_PR}.1"
>   
>   inherit update-alternatives
>   

