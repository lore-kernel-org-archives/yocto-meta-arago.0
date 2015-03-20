Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id C4D515297F
	for <meta-arago@arago-project.org>;
	Fri, 20 Mar 2015 23:39:29 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2KNdSYG015071
	for <meta-arago@arago-project.org>; Fri, 20 Mar 2015 18:39:28 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2KNdRDV001692
	for <meta-arago@arago-project.org>; Fri, 20 Mar 2015 18:39:27 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 20 Mar 2015 18:39:27 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2KNdRsA032026;
	Fri, 20 Mar 2015 18:39:27 -0500
Date: Fri, 20 Mar 2015 19:39:26 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150320233926.GR11557@edge>
References: <1426791202-23545-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1426791202-23545-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] sdk-install: Modify create-sdcard with user-supplied installation directory.
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
X-List-Received-Date: Fri, 20 Mar 2015 23:39:30 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Does this require a corresponding change to create-sdcard.sh in setup scripts? 
Or should it go on its own?


On Thu, Mar 19, 2015 at 02:53:22PM -0400, Jacob Stiffler wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  .../tisdk-install/tisdk-install/sdk-install.sh     |    6 ++++++
>  .../tisdk-install/tisdk-install_1.0.bb             |    2 +-
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install/sdk-install.sh b/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install/sdk-install.sh
> index cf90089..65c5b69 100644
> --- a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install/sdk-install.sh
> +++ b/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install/sdk-install.sh
> @@ -102,6 +102,12 @@ then
>      sed -i -e s=__SDK_INSTALL_DIR__=$install_dir= $install_dir/bin/unshallow-repositories.sh
>  fi
>  
> +# Modify create-sdcard.sh to have user-supplied installation directory
> +if [ -f "${install_dir}/bin/create-sdcard.sh" ]
> +then
> +    sed -i -e "s|ti-sdk.*\[0-9\]|${install_dir##*/}|g" ${install_dir}/bin/create-sdcard.sh
> +fi
> +
>  # Update CCS project files using important paths to headers
>  
>  find $install_dir/example-applications -type f -exec sed -i "s|<TOOLCHAIN_TARGET_INCLUDE_DIR>|$TOOLCHAIN_TARGET_INCLUDE_DIR|g" {} \;
> diff --git a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_1.0.bb b/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_1.0.bb
> index 83efd61..a3b88d9 100644
> --- a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_1.0.bb
> +++ b/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_1.0.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://../sdk-install.sh;beginline=3;endline=19;md5=4b899037
>  
>  SRC_URI = "file://sdk-install.sh"
>  
> -PR = "r4"
> +PR = "r5"
>  
>  do_install () {
>      install -d ${D}/
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

