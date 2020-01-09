Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 4CA1E52995
	for <meta-arago@arago-project.org>;
	Thu,  9 Jan 2020 23:13:29 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 009NBiD4038935
	for <meta-arago@arago-project.org>; Thu, 9 Jan 2020 17:11:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1578611504;
	bh=+RX4uleJbIICQCjdOt+Cl4WfK8k8vu+FsS8XacUdrBM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=qKqXeJ2Lfj8RZuXu/CcNyM5ucs2U16Jewtf/omTuvNXmYzxF2CPgmd7S7uLA4SY+n
	d0bAuyHJ2d27kCuCsDZdfpIvz07XbIbuOgE/og8/3BGWT9CezheTozNhUUgluNInf9
	eZtTU9J7HzMDyfaupChtyG2l9N0BxlHFQ4w0ll0s=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 009NBiU5046739
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 9 Jan 2020 17:11:44 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 9 Jan 2020 17:11:43 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 9 Jan 2020 17:11:44 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 009NBhrS037884;
	Thu, 9 Jan 2020 17:11:43 -0600
Date: Thu, 9 Jan 2020 18:11:43 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Yuan Zhao <yuanzhao@ti.com>
Message-ID: <20200109231143.GP2305@beryl>
References: <20200108180412.117869-1-yuanzhao@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200108180412.117869-1-yuanzhao@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org, Caleb Robey <a0232989@ti.com>
Subject: Re: [PATCH] tidl-api: update BBAI mcbench script
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
X-List-Received-Date: Thu, 09 Jan 2020 23:13:29 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Jan 08, 2020 at 12:04:12PM -0600, Yuan Zhao wrote:
> Signed-off-by: Caleb Robey <a0232989@ti.com>
> Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
> ---
>  ...p-2-group-layer-use-cases-with-1-dsp.patch | 34 +++++++++++++++++++
>  .../recipes-ti/tidl-api/tidl-examples_git.bb  |  3 +-
>  2 files changed, 36 insertions(+), 1 deletion(-)
>  create mode 100644 meta-arago-extras/recipes-ti/tidl-api/files/0002-replace-2-dsp-2-group-layer-use-cases-with-1-dsp.patch
> 
> diff --git a/meta-arago-extras/recipes-ti/tidl-api/files/0002-replace-2-dsp-2-group-layer-use-cases-with-1-dsp.patch b/meta-arago-extras/recipes-ti/tidl-api/files/0002-replace-2-dsp-2-group-layer-use-cases-with-1-dsp.patch
> new file mode 100644
> index 00000000..0c78ccf0
> --- /dev/null
> +++ b/meta-arago-extras/recipes-ti/tidl-api/files/0002-replace-2-dsp-2-group-layer-use-cases-with-1-dsp.patch
> @@ -0,0 +1,34 @@
> +tidl-api: replace 2 dsp + 2 group layer use cases with 1 dsp
> +
> +    The BBAI only has enough CMEM for 4 EVEs, 1 DSP, and 2 group
> +    layers. In the case of all of our networks, the difference between
> +    1 and 2 dsps is essentially nonexistent. (PLSDK-3189)
> +
> +Upstream-Status: Accepted

Since the patch is marked as "Accepted", shouldn't a simple SRCREV bump be 
enough?


> +Signed-off-by: Caleb Robey <a0232989@ti.com>
> +Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
> +---
> + examples/mcbench/scripts/all_5729.sh | 9 ++++-----
> + 1 file changed, 4 insertions(+), 5 deletions(-)
> +
> +diff --git a/examples/mcbench/scripts/all_5729.sh b/examples/mcbench/scripts/all_5729.sh
> +index defec72..0fee8a1 100755
> +--- a/examples/mcbench/scripts/all_5729.sh
> ++++ b/examples/mcbench/scripts/all_5729.sh
> +@@ -7,8 +7,7 @@ export TIDL_NETWORK_HEAP_SIZE_DSP=56623104
> + export TIDL_NETWORK_HEAP_SIZE_EVE=67108864
> + export TIDL_NETWORK_HEAP_SIZE_DSP=8388608
> + ./mcbench -g 2 -d 1 -e 4 -c ../test/testvecs/config/infer/tidl_config_mobileNet1_lg2.txt -f 50 -i ../test/testvecs/input/preproc_2_224x224_multi.y
> +-./mcbench -g 2 -d 2 -e 4 -c ../test/testvecs/config/infer/tidl_config_mobileNet1_lg2.txt -f 50 -i ../test/testvecs/input/preproc_2_224x224_multi.y
> +-./mcbench -g 2 -d 2 -e 4 -c ../test/testvecs/config/infer/tidl_config_mobileNet2_lg2.txt -f 50 -i ../test/testvecs/input/preproc_2_224x224_multi.y
> +-./mcbench -g 2 -d 2 -e 4 -c ../test/testvecs/config/infer/tidl_config_inceptionNetv1_lg2.txt -f 50 -i ../test/testvecs/input/preproc_0_224x224_multi.y
> +-./mcbench -g 2 -d 2 -e 4 -c ../test/testvecs/config/infer/tidl_config_j11_v2_lg2.txt -f 50 -i ../test/testvecs/input/preproc_0_224x224_multi.y
> +-./mcbench -g 2 -d 2 -e 4 -c ../test/testvecs/config/infer/tidl_config_j11_v2_dense_lg2.txt -f 50 -i ../test/testvecs/input/preproc_0_224x224_multi.y
> ++./mcbench -g 2 -d 1 -e 4 -c ../test/testvecs/config/infer/tidl_config_mobileNet2_lg2.txt -f 50 -i ../test/testvecs/input/preproc_2_224x224_multi.y
> ++./mcbench -g 2 -d 1 -e 4 -c ../test/testvecs/config/infer/tidl_config_inceptionNetv1_lg2.txt -f 50 -i ../test/testvecs/input/preproc_0_224x224_multi.y
> ++./mcbench -g 2 -d 1 -e 4 -c ../test/testvecs/config/infer/tidl_config_j11_v2_lg2.txt -f 50 -i ../test/testvecs/input/preproc_0_224x224_multi.y
> ++./mcbench -g 2 -d 1 -e 4 -c ../test/testvecs/config/infer/tidl_config_j11_v2_dense_lg2.txt -f 50 -i ../test/testvecs/input/preproc_0_224x224_multi.y
> +-- 
> +2.17.1
> +
> diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb b/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
> index c7016ad5..e5afad1c 100644
> --- a/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
> +++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
> @@ -6,7 +6,8 @@ LICENSE = "BSD"
>  include tidl-api.inc
>  require recipes-ti/includes/ti-paths.inc
>  
> -PR = "${INC_PR}.0"
> +PR = "${INC_PR}.1"
> +SRC_URI += "file://0002-replace-2-dsp-2-group-layer-use-cases-with-1-dsp.patch"
>  
>  COMPATIBLE_MACHINE = "dra7xx"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> -- 
> 2.24.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

