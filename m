Return-Path: <denys@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 2932E529BA
	for <meta-arago@arago-project.org>;
	Fri, 24 Feb 2017 17:53:28 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v1OHrRxj022612
	for <meta-arago@arago-project.org>; Fri, 24 Feb 2017 11:53:27 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v1OHrRYS005926
	for <meta-arago@arago-project.org>; Fri, 24 Feb 2017 11:53:27 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 24 Feb 2017 11:53:27 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v1OHrRsh005470;
	Fri, 24 Feb 2017 11:53:27 -0600
Date: Fri, 24 Feb 2017 12:53:27 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20170224175326.GP26872@edge>
References: <1487919859-151383-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
In-Reply-To: <1487919859-151383-1-git-send-email-a0393906@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [master] packagegroup-*-addons: enable glsdk-example-apps
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
X-List-Received-Date: Fri, 24 Feb 2017 17:53:29 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Does it actually build? I disabled it last time because it was breaking.


On Fri, Feb 24, 2017 at 12:34:19PM +0530, Karthik Ramanan wrote:
> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb     | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> index 97184b1..291816d 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Task to install additional utilities/demos for SDKs"
>  LICENSE = "MIT"
> -PR = "r55"
> +PR = "r56"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> @@ -54,10 +54,10 @@ UTILS_append_omap-a15 = " mmc-utils \
>                            uio-module-drv-test \
>  "
>  
> -#                        glsdk-example-apps
>  UTILS_append_dra7xx = " canutils \
>                          dsptop \
>                          gdbc6x \
> +                        glsdk-example-apps \
>  "
>  
>  UTILS_append_keystone = " \
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

