Return-Path: <denys@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 0164252AF1
	for <meta-arago@arago-project.org>;
	Thu,  9 Feb 2017 18:55:25 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v19ItPpj011844
	for <meta-arago@arago-project.org>; Thu, 9 Feb 2017 12:55:25 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v19ItPMZ012028
	for <meta-arago@arago-project.org>; Thu, 9 Feb 2017 12:55:25 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 9 Feb 2017 12:55:25 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v19ItPZ4031812;
	Thu, 9 Feb 2017 12:55:25 -0600
Date: Thu, 9 Feb 2017 13:55:24 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Eric Ruei <e-ruei1@ti.com>
Message-ID: <20170209185523.GG2612@edge>
References: <1486665307-39968-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
In-Reply-To: <1486665307-39968-1-git-send-email-e-ruei1@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] packagegroup-arago-qte-toolchain-target(krogoth/morty): add qtbase-staticdev
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
X-List-Received-Date: Thu, 09 Feb 2017 18:55:26 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Eric,

Please fix the subject line.


On Thu, Feb 09, 2017 at 01:35:07PM -0500, Eric Ruei wrote:
> add qtbase-staticdev so that the qtbase related static libraries lib*.a
> , some of which are required for QT application using the custom QPA,
> are included at the sysroot package under linux-devkit
> 
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>  .../packagegroups/packagegroup-arago-qte-toolchain-target.bb           | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
> index 1264e46..73bae9d 100644
> --- a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
> +++ b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
> @@ -1,7 +1,7 @@
>  DESCRIPTION = "Target packages for Qt Embedded SDK"
>  LICENSE = "MIT"
>  
> -PR = "r10"
> +PR = "r11"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> @@ -54,6 +54,7 @@ QT5_DEV = " \
>          qtsvg-mkspecs \
>          qtxmlpatterns-mkspecs \
>          qtbase-dev \
> +        qtbase-staticdev \
>          qtdeclarative-dev \
>          qtscript-dev \
>          qtwebkit-dev \
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

