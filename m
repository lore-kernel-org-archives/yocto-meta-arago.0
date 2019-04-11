Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 30A91529DA
	for <meta-arago@arago-project.org>;
	Thu, 11 Apr 2019 12:23:55 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3BCNZ1p050466
	for <meta-arago@arago-project.org>; Thu, 11 Apr 2019 07:23:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1554985415;
	bh=v6kE3m72r/tj10rJzc02qC9iXe0KeV4l6BG/xNVjlSw=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=xy01+dwOwfIz+w7CaG/ks/0CaS+q6MCmnGisyWpEG4/+Uf2ToYUQ/IT7Fri3ZHlIe
	PRj+3wW6mSV3bwTjM6c003SjPcf8703M3nlJ83Sw6tHUNgChErIw1IUFpduscEL7DD
	JahbjHqL5A08aEyGLBMgJL/+cUIsAe8OVe+3U6K4=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3BCNZMO001990
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 11 Apr 2019 07:23:35 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 11 Apr 2019 07:23:34 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 11 Apr 2019 07:23:34 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3BCNYwI028574;
	Thu, 11 Apr 2019 07:23:34 -0500
To: Denys Dmytriyenko <denys@ti.com>, <meta-arago@arago-project.org>
References: <1548959216-35829-1-git-send-email-denys@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <8c63f394-1b1d-fead-46ce-a487807c361e@ti.com>
Date: Thu, 11 Apr 2019 08:23:34 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1548959216-35829-1-git-send-email-denys@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [master][PATCH] HACK: FIXME: arago-core-tisdk-image: disable "sdk-host" packagegroups
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
X-List-Received-Date: Thu, 11 Apr 2019 12:23:55 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

I have been looking into this. Unless we can overlay some of the python 
libraries, it will be impossible to use the existing framework to 
install packages not created by the package_write_* task [1].

So that leaves 2 options: (1) overhaul the sourceipk class to leverage 
the package_write_* tasks, or (2) add a custom way to install these 
packages in an image, similar to how it is done for the filesystems and 
devkit. Do you have any other ideas?

And as this only breaks the sourceipk packages, can we add back the 
non-sourceipk packages, such as ti-tisdk-setup and ti-tisdk-makefile? 
The packaging in tisdk-build-scripts requires the setup scripts to be 
present in the SDK image.


Thank you,

Jake


[1] 
https://github.com/openembedded/openembedded-core/commit/c7c5f4065c102fde4e11d138fb0b6e25bffe0379

On 1/31/2019 1:26 PM, Denys Dmytriyenko wrote:
> Custom-made srcipk packages are foreign to the system and have issues installing
> into SDK. Disable for now, until resolved.
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>   .../recipes-core/images/arago-core-tisdk-image.inc | 23 +++++++++++-----------
>   1 file changed, 12 insertions(+), 11 deletions(-)
>
> diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
> index 76102a1..da5d44d 100644
> --- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
> +++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
> @@ -55,14 +55,15 @@ IMAGE_INSTALL_QT = "\
>   IMAGE_INSTALL_QT_keystone = ""
>   IMAGE_INSTALL_QT_omapl138 = ""
>   
> -IMAGE_INSTALL = "\
> -    packagegroup-arago-tisdk-addons-sdk-host \
> -    ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-tisdk-opencl-sdk-host','',d)} \
> -    packagegroup-arago-tisdk-crypto-sdk-host \
> -    ${@bb.utils.contains('MACHINE_FEATURES','sgx','packagegroup-arago-tisdk-graphics-sdk-host','',d)} \
> -    packagegroup-arago-tisdk-matrix-sdk-host \
> -    packagegroup-arago-tisdk-multimedia-sdk-host \
> -    packagegroup-arago-tisdk-hmi-sdk-host \
> -    packagegroup-arago-tisdk-amsdk-sdk-host${ARAGO_KERNEL_SUFFIX} \
> -    ${IMAGE_INSTALL_QT} \
> -"
> +IMAGE_INSTALL = ""
> +# Disable all "sdk-host" packagegroups due to issues installing "srcipk" packages
> +#    packagegroup-arago-tisdk-addons-sdk-host \
> +#    ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-tisdk-opencl-sdk-host','',d)} \
> +#    packagegroup-arago-tisdk-crypto-sdk-host \
> +#    ${@bb.utils.contains('MACHINE_FEATURES','sgx','packagegroup-arago-tisdk-graphics-sdk-host','',d)} \
> +#    packagegroup-arago-tisdk-matrix-sdk-host \
> +#    packagegroup-arago-tisdk-multimedia-sdk-host \
> +#    packagegroup-arago-tisdk-hmi-sdk-host \
> +#    packagegroup-arago-tisdk-amsdk-sdk-host${ARAGO_KERNEL_SUFFIX} \
> +#    ${IMAGE_INSTALL_QT} \
> +#"

