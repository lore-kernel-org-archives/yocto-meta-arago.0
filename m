Return-Path: <j-stiffler@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id E0DBE5298C
	for <meta-arago@arago-project.org>;
	Mon,  9 Oct 2017 12:48:35 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v99CmZJA012174
	for <meta-arago@arago-project.org>; Mon, 9 Oct 2017 07:48:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507553315;
	bh=I9KgMoBQHsrtleaimvICTvGpC2Ao+Ng+A93ESRHVaTU=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=fO9HRRlCjMHqe35VY8Zd4JVDY6mA5PhzAbBgdfxCl54Y1Ybv11YwKhfUnIGwIlY+Z
	IN2SsJOxLKSpmaKen9oBNMD6cVpLYW26iymgmvFwUBn6ILMy0Rqv12wGgrs6Gf++BE
	k9G8fizBN2SRybAkvO+k6il/9OJrw8iuMRt4kiOo=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v99CmZln022438
	for <meta-arago@arago-project.org>; Mon, 9 Oct 2017 07:48:35 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 9 Oct 2017 07:48:35 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 9 Oct 2017 07:48:35 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v99CmZvI011840;
	Mon, 9 Oct 2017 07:48:35 -0500
To: Eric Ruei <e-ruei1@ti.com>, <meta-arago@arago-project.org>
References: <1507305233-4503-1-git-send-email-e-ruei1@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <8223e901-490e-86ee-2fb0-6f75ab5f41d2@ti.com>
Date: Mon, 9 Oct 2017 08:48:35 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1507305233-4503-1-git-send-email-e-ruei1@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [meta-processor-sdk][PATCH] ti-xsgx-ddk-um: add shell file xorg to start/stop Xorg
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
X-List-Received-Date: Mon, 09 Oct 2017 12:48:36 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

I have pushed this to the morty-x11-experimental branch.


On 10/6/2017 11:53 AM, Eric Ruei wrote:
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>   recipes-graphics/libgles/ti-xsgx-ddk-um/xorg       | 40 ++++++++++++++++++++++
>   .../libgles/ti-xsgx-ddk-um_1.15.4564147.bb         |  5 ++-
>   2 files changed, 44 insertions(+), 1 deletion(-)
>   create mode 100644 recipes-graphics/libgles/ti-xsgx-ddk-um/xorg
>
> diff --git a/recipes-graphics/libgles/ti-xsgx-ddk-um/xorg b/recipes-graphics/libgles/ti-xsgx-ddk-um/xorg
> new file mode 100644
> index 0000000..9c036d4
> --- /dev/null
> +++ b/recipes-graphics/libgles/ti-xsgx-ddk-um/xorg
> @@ -0,0 +1,40 @@
> +#!/bin/sh
> +
> +x_start()
> +{
> +
> +	# Start the X Server.
> +	#
> +	/usr/local/XSGX/bin/X -config /usr/local/XSGX/etc/xorg.conf > /dev/null 2>&1 &
> +
> +	echo "Starting Xorg"
> +	return 0;
> +}
> +
> +x_stop()
> +{
> +
> +
> +	# Stop the X Server.
> +	#
> +	[ -f /tmp/.X0-lock ] && read XPID < /tmp/.X0-lock && [ -n "$XPID" ] && kill $XPID && while [ -e /proc/$XPID ] ; do sleep 1; done
> +
> +	echo "Stopping Xorg"
> +	return 0;
> +}
> +
> +
> +# Deal with the type of invocation we get.
> +#
> +case "$1" in
> +start)
> +	x_start
> +	;;
> +stop)
> +    x_stop
> +	;;
> +*)
> +	echo "$0: unknown argument $1." >&2;
> +	;;
> +esac
> +
> diff --git a/recipes-graphics/libgles/ti-xsgx-ddk-um_1.15.4564147.bb b/recipes-graphics/libgles/ti-xsgx-ddk-um_1.15.4564147.bb
> index c959e14..6434869 100644
> --- a/recipes-graphics/libgles/ti-xsgx-ddk-um_1.15.4564147.bb
> +++ b/recipes-graphics/libgles/ti-xsgx-ddk-um_1.15.4564147.bb
> @@ -10,6 +10,8 @@ BRANCH = "ti-img-sgx/${PV}"
>   SRC_URI = "git://git.ti.com/processor-sdk/omap5-sgx-ddk-um-linux-x11-experimental.git;protocol=git;branch=${BRANCH}"
>   SRCREV = "c00eb002f624cddac4956c901314c07d83a13260"
>   
> +SRC_URI += " file://xorg"
> +
>   # There's only hardfp version available
>   python __anonymous() {
>       tunes = bb.data.getVar("TUNE_FEATURES", d, 1)
> @@ -31,7 +33,7 @@ INITSCRIPT_PARAMS = "defaults 8"
>   
>   inherit update-rc.d
>   
> -PR = "r0"
> +PR = "r1"
>   PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 omap5-xsgx-ddk-um-linux"
>   
>   DEPENDS += "udev"
> @@ -54,6 +56,7 @@ S = "${WORKDIR}/git"
>   
>   do_install () {
>       oe_runmake install DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT}
> +    install -m 0644 ${WORKDIR}/xorg ${D}${sysconfdir}/init.d/
>   }
>   
>   SYSROOT_DIRS_append = "/usr/local"


