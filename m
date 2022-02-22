Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.9853.1645511825953261994
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 22:37:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BF9D840C24;
	Tue, 22 Feb 2022 06:37:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VrjIH1Jge80Z; Tue, 22 Feb 2022 06:37:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7D9D340A28;
	Tue, 22 Feb 2022 06:36:57 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id AC51817476C; Tue, 22 Feb 2022 01:36:56 -0500 (EST)
Date: Tue, 22 Feb 2022 01:36:56 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: devarsht@ti.com
Cc: meta-arago@lists.yoctoproject.org, nikhil.nd@ti.com, nsekhar@ti.com,
	vigneshr@ti.com, praneeth@ti.com, Ryan Eatmon <reatmon@ti.com>,
	a-m1@ti.com
Subject: Re: [meta-arago][dunfell][PATCH] external-arm-toolchain: Remove EAT_TOOL_CHAIN symlinks
Message-ID: <20220222063656.GP26229@denix.org>
References: <20220222062027.6390-1-devarsht@ti.com>
MIME-Version: 1.0
In-Reply-To: <20220222062027.6390-1-devarsht@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

NAK.

On Tue, Feb 22, 2022 at 11:50:27AM +0530, Devarsh Thakkar via lists.yoctoproject.org wrote:
> As per below commit in https://git.yoctoproject.org/meta-arm/log/?h=dunfell,
> 
> "1644922 external-arm-toolchain: Align glibc packaging to OE TARGET_SYS"
> 
> the upstream recipe external-arm-toolchain.bb doesn't use EAT_TARGET_SYS for
> installing toolchain anymore and the recipe is directly using TARGET_SYS
> for copying.
> 
> So remove EAT_TARGET_SYS symlinks as they are not required anymore and instead
> copy directly to ORIG_TARGET_SYS.
> 
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> ---
>  .../recipes-core/meta/external-arm-toolchain.bbappend     | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend b/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend
> index 5a51aaa0..ea4df2ff 100644
> --- a/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend
> +++ b/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend
> @@ -6,12 +6,6 @@ do_install_append() {
>  	install -d ${D}${sysconfdir}
>  	echo -e "/lib\n/usr/lib" >> ${D}${sysconfdir}/ld.so.conf
>  
> -	if [ ${EAT_TARGET_SYS} != ${ORIG_TARGET_SYS} ]; then
> -		ln -sf ${EAT_TARGET_SYS} ${D}${libdir}/${ORIG_TARGET_SYS}
> -		ln -sf ${EAT_TARGET_SYS} ${D}${includedir}/c++/${EAT_VER_GCC}/${ORIG_TARGET_SYS}
> -		mv ${D}${libdir}/gcc/${EAT_TARGET_SYS} ${D}${libdir}/gcc/${ORIG_TARGET_SYS}
> -		ln -sf ${ORIG_TARGET_SYS} ${D}${libdir}/gcc/${EAT_TARGET_SYS}
> -	fi
>  
>  	ln -sf libatomic.so.1 ${D}${libdir}/libatomic.so
>  	ln -sf libgomp.so.1 ${D}${libdir}/libgomp.so
> @@ -22,7 +16,7 @@ do_install_append() {
>  	ln -sf libasan.so.5 ${D}${libdir}/libasan.so
>  	ln -sf libgfortran.so.5 ${D}${libdir}/libgfortran.so
>  
> -	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/libgcc* ${D}${libdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
> +	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/libgcc* ${D}${libdir}/${ORIG_TARGET_SYS}/${EAT_VER_GCC}/
>  }
>  
>  # Below FILES_* overrides are due to TARGET_SYS -> ORIG_TARGET_SYS move in ${libdir}/gcc
> -- 
> 2.17.1
