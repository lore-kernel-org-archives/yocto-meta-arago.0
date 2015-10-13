Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 33DCA529B5
	for <meta-arago@arago-project.org>;
	Tue, 13 Oct 2015 17:22:09 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9DHM6ZE001539
	for <meta-arago@arago-project.org>; Tue, 13 Oct 2015 12:22:06 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9DHM6KX023292
	for <meta-arago@arago-project.org>; Tue, 13 Oct 2015 12:22:06 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 13 Oct 2015 12:22:06 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9DHM6oe001271;
	Tue, 13 Oct 2015 12:22:06 -0500
Date: Tue, 13 Oct 2015 13:21:50 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20151013172150.GI28164@edge>
References: <1444398420-20954-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1444398420-20954-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] unshallow-repositories: Fix for 64-bit nativesdk
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
X-List-Received-Date: Tue, 13 Oct 2015 17:22:15 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Oct 09, 2015 at 09:47:00AM -0400, Jacob Stiffler wrote:
> * Use SDKMACHINE to obtain the location of the nativesdk git
>   executable.
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  .../unshallow-repositories/unshallow-repositories.sh                 | 2 +-
>  .../unshallow-repositories/unshallow-repositories_1.0.bb             | 5 ++++-
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories/unshallow-repositories.sh b/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories/unshallow-repositories.sh
> index f20a9b5..61bdb88 100755
> --- a/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories/unshallow-repositories.sh
> +++ b/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories/unshallow-repositories.sh
> @@ -35,7 +35,7 @@
>  install_dir="__SDK_INSTALL_DIR__"
>  
>  # Find git binary within the host native bin directory
> -sdk_git_bin="$install_dir/linux-devkit/sysroots/i*/usr/bin/git"

.../linux-devkit/sysroots/*86*-linux/usr/bin/git ?


> +sdk_git_bin="$install_dir/linux-devkit/sysroots/__SDKMACHINE__*/usr/bin/git"
>  sdk_git_bin=`which $sdk_git_bin`
>  
>  if [ "$sdk_git_bin" = "" ]
> diff --git a/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories_1.0.bb b/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories_1.0.bb
> index f1ea414..12fd4f2 100644
> --- a/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories_1.0.bb
> +++ b/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories_1.0.bb
> @@ -4,12 +4,15 @@ LIC_FILES_CHKSUM = "file://../unshallow-repositories.sh;beginline=3;endline=19;m
>  
>  SRC_URI = "file://unshallow-repositories.sh"
>  
> -PR = "r0"
> +PR = "r1"
>  
>  do_install () {
>      install -d ${D}/
>      install -d ${D}/bin
>      install -m 0755 ${WORKDIR}/unshallow-repositories.sh ${D}/bin
> +
> +    sed -i -e "s|__SDKMACHINE__|${SDKMACHINE}|g" \
> +        ${D}/bin/unshallow-repositories.sh
>  }
>  
>  FILES_${PN} = "/*"
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

