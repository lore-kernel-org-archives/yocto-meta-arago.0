Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 6E1C4529C0
	for <meta-arago@arago-project.org>;
	Mon,  2 Jul 2018 18:12:27 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w62ICLkt048166
	for <meta-arago@arago-project.org>; Mon, 2 Jul 2018 13:12:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1530555141;
	bh=isbDnpBpOOuWmJwtWkm9YFAruXMW8bLdQj+8V/9EVK4=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=twiDOtXNPXuys19EyRD/+tFnztYJQH8n7F415BFrJOtul0Pa8y/HTPLIMRhwTF0yn
	iqpCVquk8m79LiQqQpKgLeoFVA84iHnP8KEOoYD3wh18d3npKRk71v1CNexcgcLNQl
	ahbo5LgIvH+wbZVGbkYOrhLiu0GXuQPm6hN6ytuw=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w62ICLZ0025304
	for <meta-arago@arago-project.org>; Mon, 2 Jul 2018 13:12:21 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 2 Jul 2018 13:12:20 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 2 Jul 2018 13:12:20 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w62ICKo3003387;
	Mon, 2 Jul 2018 13:12:20 -0500
To: Djordje Senicic <x0157990@ti.com>, <meta-arago@arago-project.org>
References: <1530555007-22337-1-git-send-email-x0157990@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <9cc7d088-3b5d-fd9a-20b3-5be2e995b0de@ti.com>
Date: Mon, 2 Jul 2018 14:12:20 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1530555007-22337-1-git-send-email-x0157990@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com
Subject: Re: [EXTERNAL] [meta-processor-sdk][PATCH] tidl: Add tidl-demos and tidl-utils to opencl packagegroups
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
X-List-Received-Date: Mon, 02 Jul 2018 18:12:27 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

NAK, These packages are not available.


On 7/2/2018 2:10 PM, Djordje Senicic wrote:
> * tidl-utils: ARM and x86 binary utilities, like tidl-viewer
> * tidl-demos: System level demo, like tidl-examples package
>
> Signed-off-by: Djordje Senicic <x0157990@ti.com>
> ---
>   .../packagegroups/packagegroup-arago-tisdk-opencl-sdk-target.bbappend   | 2 +-
>   recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bbappend     | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-target.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-target.bbappend
> index 694fa75..35e362e 100644
> --- a/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-target.bbappend
> +++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-target.bbappend
> @@ -1,3 +1,3 @@
>   PR_append = ".tisdk0"
>   
> -UTILS_append_am57xx-evm = " tidl-examples-dev"
> +UTILS_append_am57xx-evm = " tidl-examples-dev tidl-demos-dev"
> diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bbappend
> index 782affe..bf50cea 100644
> --- a/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bbappend
> +++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bbappend
> @@ -1,6 +1,6 @@
>   PR_append = ".tisdk0"
>   
> -TIDL_PKGS = "tidl-examples-dev tidl-viewer"
> +TIDL_PKGS = "tidl-examples-dev tidl-viewer tidl-utils tidl-demos-dev"
>   
>   EXTRA_PKGS_append_am57xx-evm = " ${TIDL_PKGS}"
>   EXTRA_PKGS_append_am57xx-hs-evm = " ${TIDL_PKGS}"


