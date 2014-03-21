Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id E16275208C
	for <meta-arago@arago-project.org>;
	Fri, 21 Mar 2014 20:17:12 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s2LKHCWR028730
	for <meta-arago@arago-project.org>; Fri, 21 Mar 2014 15:17:12 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s2LKHCcN002514
	for <meta-arago@arago-project.org>; Fri, 21 Mar 2014 15:17:12 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 21 Mar 2014 15:17:11 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s2LKHBTv008087;
	Fri, 21 Mar 2014 15:17:11 -0500
Date: Fri, 21 Mar 2014 16:17:11 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20140321201711.GR12929@edge>
References: <1394229426-12753-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1394229426-12753-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 1/4] tisdk-install: Add SDK_PATH_TARGET varaible
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
X-List-Received-Date: Fri, 21 Mar 2014 20:17:13 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Franklin,

I pushed these 5 patches to dora now. Do you need them in dylan? But they 
didn't make the cut for the release, though.

Denys


On Fri, Mar 07, 2014 at 03:57:03PM -0600, Franklin S. Cooper Jr wrote:
> * Some software like cryptodev-linux needs to know where to install header or
>   library files that may be needed to cross compile.
> * These files should go to the SDK_PATH_TARGET directory that is defined in
>    environment-setup.
> * Add that variable to Rules.make to enable proper cross compiling from the top
>   level Makefile.
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../tisdk-install/tisdk-install/sdk-install.sh     |    4 ++++
>  .../tisdk-install/tisdk-install_1.0.bb             |    2 +-
>  2 files changed, 5 insertions(+), 1 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install/sdk-install.sh b/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install/sdk-install.sh
> index 86799c1..c0284c7 100644
> --- a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install/sdk-install.sh
> +++ b/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install/sdk-install.sh
> @@ -94,6 +94,10 @@ GCC_VERSION=`ls $install_dir/linux-devkit/sysroots/$SDK_SYS/usr/lib/gcc/$TOOLCHA
>  TOOLCHAIN_TARGET_INCLUDE_DIR="linux-devkit/sysroots/$REAL_MULTIMACH_TARGET_SYS/usr/include"
>  TOOLCHAIN_INCLUDE_DIR="linux-devkit/sysroots/$SDK_SYS/usr/lib/gcc/$TOOLCHAIN_SYS/$GCC_VERSION/include"
>  
> +SDK_PATH_TARGET="linux-devkit/sysroots/$REAL_MULTIMACH_TARGET_SYS/"
> +
> +sed -i -e s=__SDK_PATH_TARGET__=$SDK_PATH_TARGET= $install_dir/Rules.make
> +
>  # Update CCS project files using important paths to headers
>  
>  find $install_dir/example-applications -type f -exec sed -i "s|<TOOLCHAIN_TARGET_INCLUDE_DIR>|$TOOLCHAIN_TARGET_INCLUDE_DIR|g" {} \;
> diff --git a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_1.0.bb b/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_1.0.bb
> index 9548ee5..98304b4 100644
> --- a/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_1.0.bb
> +++ b/meta-arago-distro/recipes-tisdk/tisdk-install/tisdk-install_1.0.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://../sdk-install.sh;beginline=3;endline=19;md5=4b899037
>  
>  SRC_URI = "file://sdk-install.sh"
>  
> -PR = "r2"
> +PR = "r3"
>  
>  do_install () {
>      install -d ${D}/
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

