Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7F2CC6379F
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 20:37:57 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.100172.1673642276143977766
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 13 Jan 2023 12:37:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2C2F140C50;
	Fri, 13 Jan 2023 20:37:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mByHvG7OxIyB; Fri, 13 Jan 2023 20:37:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1172340429;
	Fri, 13 Jan 2023 20:37:54 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 84E401636F8; Fri, 13 Jan 2023 15:37:36 -0500 (EST)
Date: Fri, 13 Jan 2023 15:37:36 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [meta-arago] [dunfell][PATCH 1/4] meta-toolchain-arago: fix
 bashisms
Message-ID: <20230113203736.GB22689@denix.org>
References: <17333D2A2627CE10.12545@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17333D2A2627CE10.12545@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 13 Jan 2023 20:37:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14170

Any comments on this series?


On Thu, Dec 22, 2022 at 10:12:02PM +0000, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> Fix bashisms - helps with making builds in vanilla Ubuntu containers.
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>  .../recipes-core/meta/meta-toolchain-arago.bb | 21 +++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> index 8fed34f5..d2479ad1 100644
> --- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> +++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> @@ -106,13 +106,22 @@ arago_sdk_fixup () {
>  		lexec="${SDK_OUTPUT}/${SDKPATHNATIVE}${prefix_nativesdk}/libexec/gcc/${TOOLCHAIN_SYS}"
>  	fi
>  	tcv=`ls -1 $lexec|head -1`
> -	[ -e ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/lib/$tcv ] || ln -s . ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/lib/$tcv
> -	[ -e ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/usr/lib/$tcv ] || ln -s . ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/usr/lib/$tcv
> -	[ -e ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/lib/${TOOLCHAIN_SYS} ] || ln -s . ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/lib/${TOOLCHAIN_SYS}
> -	[ -e ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/usr/lib/${TOOLCHAIN_SYS} ] || ln -s . ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/usr/lib/${TOOLCHAIN_SYS}
> +	if [ ! -e ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/lib/$tcv ]; then
> +		ln -s . ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/lib/$tcv
> +	fi
> +	if [ ! -e ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/usr/lib/$tcv ]; then
> +		ln -s . ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/usr/lib/$tcv
> +	fi
> +	if [ ! -e ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/lib/${TOOLCHAIN_SYS} ]; then
> +		ln -s . ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/lib/${TOOLCHAIN_SYS}
> +	fi
> +	if [ ! -e ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/usr/lib/${TOOLCHAIN_SYS} ]; then
> +		ln -s . ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/usr/lib/${TOOLCHAIN_SYS}
> +	fi
>  	tcpath="${SDK_OUTPUT}/${SDKPATHNATIVE}${prefix_nativesdk}/${TOOLCHAIN_SYS}"
>  	mkdir -p $tcpath
> -	pushd $tcpath
> +	curdir=$(pwd)
> +	cd $tcpath
>  	ln -s ${SDKTARGETSYSROOT}/include include
>  	if [ "${TOOLCHAIN_BRAND}" != "arago" ]; then
>  		mkdir -p libc
> @@ -122,7 +131,7 @@ arago_sdk_fixup () {
>  	ln -s ${SDKTARGETSYSROOT}/lib lib
>  	ln -s ${SDKTARGETSYSROOT}/usr/lib usr/lib
>  	ln -s ${SDKTARGETSYSROOT}/usr/include usr/include
> -	popd
> +	cd $curdir
>  }
>  
>  fakeroot create_sdk_files() {
> -- 
> 2.25.1

