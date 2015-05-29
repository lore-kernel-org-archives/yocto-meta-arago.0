Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id E1F8152A83
	for <meta-arago@arago-project.org>;
	Fri, 29 May 2015 20:01:25 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4TK1Ok4008265
	for <meta-arago@arago-project.org>; Fri, 29 May 2015 15:01:24 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4TK1Omk019561
	for <meta-arago@arago-project.org>; Fri, 29 May 2015 15:01:24 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 29 May 2015 15:01:24 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4TK1NSE021008;
	Fri, 29 May 2015 15:01:24 -0500
Date: Fri, 29 May 2015 16:01:23 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150529200123.GU16418@edge>
References: <1432811095-3754-1-git-send-email-j-stiffler@ti.com>
	<1432811095-3754-4-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1432811095-3754-4-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 3/5] arago-source-ipk: Enable debugss-module-drv source ipk.
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
X-List-Received-Date: Fri, 29 May 2015 20:01:26 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ack

On Thu, May 28, 2015 at 07:04:53AM -0400, Jacob Stiffler wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  .../conf/distro/arago-source-ipk.conf              |    4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-distro/conf/distro/arago-source-ipk.conf
> index 105f40d..ab12e09 100644
> --- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
> +++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
> @@ -210,6 +210,10 @@ CREATE_SRCIPK_pn-cmem-mod = "1"
>  SRCIPK_INSTALL_DIR_pn-cmem-mod = "board-support/extra-drivers/${PN}-${PV}"
>  SRCIPK_PACKAGE_ARCH_pn-cmem-mod = "${MACHINE_ARCH}"
>  
> +CREATE_SRCIPK_pn-debugss-module-drv = "1"
> +SRCIPK_INSTALL_DIR_pn-debugss-module-drv = "board-support/extra-drivers/${PN}-${PV}"
> +SRCIPK_PACKAGE_ARCH_pn-debugss-module-drv = "${MACHINE_ARCH}"
> +
>  CREATE_SRCIPK_pn-ti-linux-driver-examples = "1"
>  SRCIPK_INSTALL_DIR_pn-ti-linux-driver-examples = "example-applications/linux-driver-examples-${PV}"
>  
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

