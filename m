Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 23BAD52998
	for <meta-arago@arago-project.org>;
	Tue, 18 Jun 2019 12:37:23 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5ICagSC128860
	for <meta-arago@arago-project.org>; Tue, 18 Jun 2019 07:36:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560861402;
	bh=s5Tl0q8OqW7WYtVogUTyGjaezgnJfbq1/TditutkvIg=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=kCPY44EHDDStUGfTTS0TQa7p9zvyWLsFq4YUWIyYiYKHgeMm8jJFLeVSBFzzOTFsN
	8Y0iRIg22iYdVgizHZeFnZo8OwpsEvi2BrDM4domG3JKzrjm3xqwpQuX0lWFsi/Xk8
	WOredlCCsLQTPDvrtIYFP0R8yJljLcm3XU3zy2Rw=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5ICafYZ100128
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 18 Jun 2019 07:36:41 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 18 Jun 2019 07:36:41 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 18 Jun 2019 07:36:41 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5ICafZP055369
	for <meta-arago@arago-project.org>; Tue, 18 Jun 2019 07:36:41 -0500
To: <meta-arago@arago-project.org>
References: <1560774988-9601-1-git-send-email-j-stiffler@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <fd56fae8-d260-c2af-982e-f42538ef283e@ti.com>
Date: Tue, 18 Jun 2019 08:36:41 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1560774988-9601-1-git-send-email-j-stiffler@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [master/thud/ti2019.01][PATCH] Revert "packagegroups: disable armnn for now due to gcc8 breakage"
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
X-List-Received-Date: Tue, 18 Jun 2019 12:37:23 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Can you please back-port this to ti2019.01.


Thank you,

Jake

On 6/17/2019 8:36 AM, Jacob Stiffler wrote:
> This reverts commit dbc7318ccfef2fa2fd606a51b84965e32b4a2442.
>
> The armnn build issues have been resolved.
>
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>   .../packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb  | 3 +--
>   .../packagegroups/packagegroup-arago-tisdk-addons.bb             | 3 +--
>   .../packagegroups/packagegroup-arago-tisdk-matrix.bb             | 9 ++++-----
>   3 files changed, 6 insertions(+), 9 deletions(-)
>
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
> index 375473c..390effb 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
> @@ -153,8 +153,7 @@ EXTRA_LIBS_append_k2e = " libulm-staticdev \
>                                 gdbserver-c6x-dev \
>   "
>   
> -ARMNN_PACKAGES = ""
> -#ARMNN_PACKAGES = "armnn-dev"
> +ARMNN_PACKAGES = "armnn-dev"
>   
>   EXTRA_PACKAGES = ""
>   EXTRA_PACKAGES_append_ti33x = " voxelsdk-dev \
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> index 2f903ff..a7be94a 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> @@ -144,8 +144,7 @@ EXTRA_PACKAGES_omapl138 = " \
>       protobuf \
>   "
>   
> -ARMNN_PACKAGES = ""
> -#ARMNN_PACKAGES = "armnn"
> +ARMNN_PACKAGES = "armnn"
>   
>   EXTRA_PACKAGES_append_ti33x = " voxelsdk \
>                                   arm-compute-library \
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> index e33f910..78f9c56 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> @@ -89,11 +89,10 @@ MATRIX_OPENCV_OPENCL_APPS_omap-a15 = " \
>        matrix-machinevision-demo-simplepeopletracking \
>   "
>   
> -MATRIX_ARMNN_APPS = ""
> -#MATRIX_ARMNN_APPS = " \
> -#    matrix-armnn-demo-staticimg     \
> -#    matrix-armnn-demo-livecam       \
> -#"
> +MATRIX_ARMNN_APPS = " \
> +    matrix-armnn-demo-staticimg     \
> +    matrix-armnn-demo-livecam       \
> +"
>   
>   MATRIX_APPS = ""
>   

