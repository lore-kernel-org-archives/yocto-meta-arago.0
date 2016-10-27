Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 9479A5299E
	for <meta-arago@arago-project.org>;
	Thu, 27 Oct 2016 22:03:33 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u9RM3VB2015594
	for <meta-arago@arago-project.org>; Thu, 27 Oct 2016 17:03:31 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u9RM3VKH028267
	for <meta-arago@arago-project.org>; Thu, 27 Oct 2016 17:03:31 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 27 Oct 2016 17:03:30 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u9RM3Ubx013371;
	Thu, 27 Oct 2016 17:03:30 -0500
Date: Thu, 27 Oct 2016 18:03:30 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Eric Ruei <e-ruei1@ti.com>
Message-ID: <20161027220329.GQ12745@edge>
References: <1477605310-15958-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
In-Reply-To: <1477605310-15958-1-git-send-email-e-ruei1@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] arago-source-ipk.conf: add SRCIPK for ti-gc320-driver
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
X-List-Received-Date: Thu, 27 Oct 2016 22:03:36 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ack

On Thu, Oct 27, 2016 at 05:55:10PM -0400, Eric Ruei wrote:
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>  meta-arago-distro/conf/distro/arago-source-ipk.conf | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-distro/conf/distro/arago-source-ipk.conf
> index 90ae80f..96f2db2 100644
> --- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
> +++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
> @@ -206,6 +206,9 @@ SRCIPK_INSTALL_DIR_pn-gdbserverproxy-module-drv = "board-support/extra-drivers/$
>  CREATE_SRCIPK_pn-ti-sgx-ddk-km = "1"
>  SRCIPK_INSTALL_DIR_pn-ti-sgx-ddk-km = "board-support/extra-drivers/${PN}-${PV}"
>  
> +CREATE_SRCIPK_pn-ti-gc320-driver = "1"
> +SRCIPK_INSTALL_DIR_pn-ti-gc320-driver = "board-support/extra-drivers/${PN}-${PV}"
> +
>  CREATE_SRCIPK_pn-ti-linux-driver-examples = "1"
>  SRCIPK_INSTALL_DIR_pn-ti-linux-driver-examples = "example-applications/linux-driver-examples-${PV}"
>  
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

