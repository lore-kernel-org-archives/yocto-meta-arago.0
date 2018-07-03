Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 6BA0F52993
	for <meta-arago@arago-project.org>;
	Tue,  3 Jul 2018 13:28:15 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w63DS9cP124043
	for <meta-arago@arago-project.org>; Tue, 3 Jul 2018 08:28:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1530624489;
	bh=F2LcHyWNNYdqFASu4ecD88DPYM+vPinSfDRuaszJps8=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=Mc/nN/kkbv9V6mtIiYwJAyrEljMEs1Bf8ayNFjqhedeHlJJdZ6BqLKl2rZdax9xtb
	YITxozJlJgRxvWp3Vj4Ds6DURuYKljJGASMAYPJc0ZcNJ6c0rgRyuJW3eHSAnLOvP7
	dsqkDeEbAFjA4x+HOUZwCHyM2eyazvryE2tjgcY4=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w63DS9Zn012570
	for <meta-arago@arago-project.org>; Tue, 3 Jul 2018 08:28:09 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 3 Jul 2018 08:28:08 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 3 Jul 2018 08:28:08 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w63DS8n3011376
	for <meta-arago@arago-project.org>; Tue, 3 Jul 2018 08:28:08 -0500
To: <meta-arago@arago-project.org>
References: <1530119512-30012-1-git-send-email-j-stiffler@ti.com>
	<1530119512-30012-3-git-send-email-j-stiffler@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <cf145d85-3eb0-4ce7-ffec-a2a51ca12cfb@ti.com>
Date: Tue, 3 Jul 2018 09:28:08 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1530119512-30012-3-git-send-email-j-stiffler@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [rocko/master][PATCH 3/3] tisdk-image: enhance cleanup of image
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
X-List-Received-Date: Tue, 03 Jul 2018 13:28:16 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Can you please apply this to the ti2018.01 branch?


Thank you,

Jake


On 6/27/2018 1:11 PM, Jacob Stiffler wrote:
> * The upstream image class is creating many more directories and file
>    by default in an image.
> * As this SDK image is not a filesystem, we do not need these
>    defaults.
> * Clean up these directories and files using a customizable list.
>
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>   meta-arago-distro/classes/tisdk-image.bbclass | 17 ++++++++++++++---
>   1 file changed, 14 insertions(+), 3 deletions(-)
>
> diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-arago-distro/classes/tisdk-image.bbclass
> index 39e6461..4ae3a80 100644
> --- a/meta-arago-distro/classes/tisdk-image.bbclass
> +++ b/meta-arago-distro/classes/tisdk-image.bbclass
> @@ -859,12 +859,23 @@ tisdk_image_build () {
>       cp ${WORKDIR}/opkg.conf ${IMAGE_ROOTFS}/etc/
>   }
>   
> +TISDK_IMAGE_CLEANUP_DIRS ?= "var etc lib boot dev home media mnt proc run sbin sys tmp usr"
> +TISDK_IMAGE_CLEANUP_FILES ?= "bin/bash bin/bash.bash bin/sh"
> +
>   tisdk_image_cleanup () {
> +    # Some extra files are now pulled in by the general image class, so remove
> +    # them.
> +    for file in ${TISDK_IMAGE_CLEANUP_FILES}
> +    do
> +        [ ! -f ${IMAGE_ROOTFS}/$file ] || rm -f ${IMAGE_ROOTFS}/$file
> +    done
> +
>       # Move the var/etc directories which contains the opkg data used for the
>       # manifest (and maybe one day for online updates) to a hidden directory.
> -    mv ${IMAGE_ROOTFS}/var ${IMAGE_ROOTFS}/.var
> -    mv ${IMAGE_ROOTFS}/etc ${IMAGE_ROOTFS}/.etc
> -    mv ${IMAGE_ROOTFS}/lib ${IMAGE_ROOTFS}/.lib
> +    for dir in ${TISDK_IMAGE_CLEANUP_DIRS}
> +    do
> +        [ ! -d ${IMAGE_ROOTFS}/$dir ] || mv ${IMAGE_ROOTFS}/$dir ${IMAGE_ROOTFS}/.$dir
> +    done
>   }
>   
>   license_create_manifest() {


