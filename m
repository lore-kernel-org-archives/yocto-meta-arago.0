Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 94CBC529B3
	for <meta-arago@arago-project.org>;
	Tue, 16 Dec 2014 17:14:27 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id sBGHERsv031164
	for <meta-arago@arago-project.org>; Tue, 16 Dec 2014 11:14:27 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id sBGHER3t020913
	for <meta-arago@arago-project.org>; Tue, 16 Dec 2014 11:14:27 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 16 Dec 2014 11:14:26 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id sBGHEQid022537;
	Tue, 16 Dec 2014 11:14:26 -0600
Date: Tue, 16 Dec 2014 12:14:26 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20141216171426.GD29971@edge>
References: <1418749862-2529-1-git-send-email-fcooper@ti.com>
	<1418749862-2529-3-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1418749862-2529-3-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 3/3] ti-tisdk-makefile: Remove dual camera demo and make t-stat Qt 4 only
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
X-List-Received-Date: Tue, 16 Dec 2014 17:14:27 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Dec 16, 2014 at 11:11:02AM -0600, Franklin S. Cooper Jr wrote:
> From: "Franklin S. Cooper Jr" <fcooper@ti.com>
> 
> * Dual camera demo does not currently work on the 3.14 kernel. So disable for
>   now.
> * T-stat needs to be tweaked to work again on Qt 5.4. Remove for now.

Have you looked at what got broken with Qt 5.4? It used to work with 5.2...


> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |    6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> index 0077223..e371307 100644
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> @@ -36,7 +36,7 @@ SRC_URI = "\
>      file://Makefile_cryptodev \
>  "
>  
> -PR = "r35"
> +PR = "r36"
>  
>  MAKEFILES_COMMON = "linux \
>                      matrix-gui \
> @@ -44,7 +44,7 @@ MAKEFILES_COMMON = "linux \
>                      am-sysinfo \
>                      matrix-gui-browser \
>                      refresh-screen \
> -                    qt-tstat \
> +                    ${@base_conditional('QT_PROVIDER', 'qt5', '', 'qt-tstat', d)} \
>                      oprofile-example \
>  "
>  MAKEFILES = ""
> @@ -75,8 +75,6 @@ MAKEFILES_append_ti43x = " u-boot-spl \
>                             ti-crypto-examples \
>                             linux-dtbs \
>                             wireless \
> -                           dual-camera-demo \
> -                           image-gallery \
>                             cryptodev \
>  "
>  
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

