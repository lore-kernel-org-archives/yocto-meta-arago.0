Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 82DAB529F8
	for <meta-arago@arago-project.org>;
	Wed, 11 Mar 2015 23:47:24 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2BNlKtL008558
	for <meta-arago@arago-project.org>; Wed, 11 Mar 2015 18:47:20 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2BNlJCD021430
	for <meta-arago@arago-project.org>; Wed, 11 Mar 2015 18:47:19 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 11 Mar 2015 18:47:19 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2BNlJ1Z000864;
	Wed, 11 Mar 2015 18:47:19 -0500
Date: Wed, 11 Mar 2015 19:47:18 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20150311234718.GC23587@edge>
References: <1426074538-21653-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
In-Reply-To: <1426074538-21653-1-git-send-email-a0393906@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago 1/2] packagegroup-*-graphics: Add omapdrm-pvr
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
X-List-Received-Date: Wed, 11 Mar 2015 23:47:26 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

This doesn't work:

| /home/jenkins/tisdk-build-am57x/build-CORTEX_1/arago-tmp-external-linaro-toolchain/work/am57xx_evm-oe-linux-gnueabi/omapdrm-pvr/1.9.2253347-r6c/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/osfunc.c:116:2: error: #error "A preemptible Linux kernel is required when using workqueues"


Also I see these messages, but I don't think they are fatal:

| ../config/core.mk:419: $(KERNELDIR)/vmlinux does not exist. Kbuild may fail.
| /bin/sh: dos2unix: command not found

-- 
Denys


On Wed, Mar 11, 2015 at 05:18:57PM +0530, Karthik Ramanan wrote:
> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  .../packagegroup-arago-tisdk-graphics.bb           |    3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
> index f854596..1043ce5 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
> @@ -38,9 +38,8 @@ GRAPHICS_RDEPENDS_omap3 = "\
>  GRAPHICS_RDEPENDS_omap-a15 = "\
>      libgbm \
>      omap5-sgx-ddk-um-linux \
> +    omapdrm-pvr \
>      "
> -# Put this back when compile issues are fixed against 3.14
> -#    omapdrm-pvr
>  
>  GRAPHICS_BLTSVILLE = ""
>  GRAPHICS_BLTSVILLE_omap-a15 = " \
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

