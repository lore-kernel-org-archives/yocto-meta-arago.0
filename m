Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id EAEFA529E0
	for <meta-arago@arago-project.org>;
	Tue,  6 Jan 2015 18:16:13 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t06IGDtT019901
	for <meta-arago@arago-project.org>; Tue, 6 Jan 2015 12:16:13 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t06IGDNo015653
	for <meta-arago@arago-project.org>; Tue, 6 Jan 2015 12:16:13 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 6 Jan 2015 12:16:12 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t06IGCHY008580;
	Tue, 6 Jan 2015 12:16:12 -0600
Date: Tue, 6 Jan 2015 13:16:12 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150106181612.GV4759@edge>
References: <1420554576-19650-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1420554576-19650-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] ti-tisdk-makefile: Makefile_cryptodev: Need ARCH and KERNEL_DIR for clean target.
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
X-List-Received-Date: Tue, 06 Jan 2015 18:16:14 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ack

On Tue, Jan 06, 2015 at 09:29:36AM -0500, Jacob Stiffler wrote:
> * Otherwise will fail if host kernel headers are not present.
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  .../ti-tisdk-makefile/Makefile_cryptodev           |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cryptodev b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cryptodev
> index c05dc66..980b236 100644
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cryptodev
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_cryptodev
> @@ -12,7 +12,7 @@ cryptodev_clean:
>  	@echo ================================
>  	@cd board-support/extra-drivers; \
>  	cd `find . -maxdepth 1 -name "cryptodev*"`; \
> -	make clean
> +	make ARCH=arm KERNEL_DIR=$(LINUXKERNEL_INSTALL_DIR) clean
>  
>  cryptodev_install:
>  	@echo ================================
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

