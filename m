Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 35BFC5299C
	for <meta-arago@arago-project.org>;
	Wed, 18 Sep 2019 12:36:07 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8ICYxjc046248
	for <meta-arago@arago-project.org>; Wed, 18 Sep 2019 07:34:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568810099;
	bh=FD5Ke/JJqvmChVKb4iNLrRpSIjfxULE1ZOsSF1txXwM=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=tq2Wmv5fIJoFp/HCveVY4HJvBjPMPNGY557fwCplIosgli1D7EV61iP0Muz4fCm14
	4TwTCUoy5cYFd9FGJL8Jr+12PartSVAnZtowjql45paeRDqPCLA/mtNoXdgF8FMIYg
	LcvX/Xw9b3kJcxzWl+8SZ1NFDcYdtqkb+mHjBO9U=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8ICYxKh065573
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 18 Sep 2019 07:34:59 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 18 Sep 2019 07:34:58 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 18 Sep 2019 07:34:59 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8ICYwEm042820;
	Wed, 18 Sep 2019 07:34:58 -0500
To: Djordje Senicic <x0157990@ti.com>, <meta-arago@arago-project.org>
References: <20190917232658.941-1-x0157990@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <16e1b511-f6bb-7b6e-bcb6-e4b4fc32731d@ti.com>
Date: Wed, 18 Sep 2019 08:34:55 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190917232658.941-1-x0157990@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [PATCH] opencv: Fix morph.cl related compilation error
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
X-List-Received-Date: Wed, 18 Sep 2019 12:36:07 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Please backport to ti2019.03.


Thanks,

Jake

On 9/17/2019 7:26 PM, Djordje Senicic wrote:
> - C6x intrinsic _min2(), _max2() cannot be applied to data types such as uchar3
>
> Signed-off-by: Djordje Senicic <x0157990@ti.com>
> ---
>   .../0001-morph.cl-fix-compilation-error.patch | 35 +++++++++++++++++++
>   .../recipes-support/opencv/opencv_3.1.bb      |  1 +
>   2 files changed, 36 insertions(+)
>   create mode 100644 meta-arago-extras/recipes-support/opencv/opencv/0001-morph.cl-fix-compilation-error.patch
>
> diff --git a/meta-arago-extras/recipes-support/opencv/opencv/0001-morph.cl-fix-compilation-error.patch b/meta-arago-extras/recipes-support/opencv/opencv/0001-morph.cl-fix-compilation-error.patch
> new file mode 100644
> index 00000000..5f279f31
> --- /dev/null
> +++ b/meta-arago-extras/recipes-support/opencv/opencv/0001-morph.cl-fix-compilation-error.patch
> @@ -0,0 +1,35 @@
> +From c3befabd0420d6665cc61931af5aea00e82977e3 Mon Sep 17 00:00:00 2001
> +From: Djordje Senicic <x0157990@ti.com>
> +Date: Tue, 17 Sep 2019 19:16:00 -0400
> +Subject: [PATCH] morph.cl: fix compilation error
> +
> +Upstream-Status: Inappropriate [other]
> +
> +- TI C6x intrinsic _min2(), _max2() cannot be applied to data types  such as uchar3.
> +
> +Signed-off-by: Djordje Senicic <x0157990@ti.com>
> +---
> + modules/imgproc/src/opencl/morph.cl | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/modules/imgproc/src/opencl/morph.cl b/modules/imgproc/src/opencl/morph.cl
> +index 8e3ab2fa0..47243ca0c 100644
> +--- a/modules/imgproc/src/opencl/morph.cl
> ++++ b/modules/imgproc/src/opencl/morph.cl
> +@@ -90,11 +90,11 @@
> + #if defined INTEL_DEVICE && defined DEPTH_0
> + #define MORPH_OP(A, B) ((A) < (B) ? (A) : (B))
> + #else
> +-#define MORPH_OP(A, B) _min2((A), (B))
> ++#define MORPH_OP(A, B) min((A), (B))
> + #endif
> + #endif
> + #ifdef OP_DILATE
> +-#define MORPH_OP(A, B) _max2((A), (B))
> ++#define MORPH_OP(A, B) max((A), (B))
> + #endif
> +
> + #define PROCESS(y, x) \
> +--
> +2.17.1
> +
> diff --git a/meta-arago-extras/recipes-support/opencv/opencv_3.1.bb b/meta-arago-extras/recipes-support/opencv/opencv_3.1.bb
> index acc9d71e..c9670fc6 100644
> --- a/meta-arago-extras/recipes-support/opencv/opencv_3.1.bb
> +++ b/meta-arago-extras/recipes-support/opencv/opencv_3.1.bb
> @@ -22,6 +22,7 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv \
>       file://0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch \
>       file://fixgcc60.patch \
>       file://fixpkgconfig.patch \
> +    file://0001-morph.cl-fix-compilation-error.patch \
>       file://0001-Fix-sign-macro-redefinition-compile-time-error.patch;patchdir=../contrib \
>   "
>   

