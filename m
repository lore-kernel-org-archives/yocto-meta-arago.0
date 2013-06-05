Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id D5D995299C
	for <meta-arago@arago-project.org>;
	Wed,  5 Jun 2013 19:15:35 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r55JFYJS022213
	for <meta-arago@arago-project.org>; Wed, 5 Jun 2013 14:15:34 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r55JFYhH001007
	for <meta-arago@arago-project.org>; Wed, 5 Jun 2013 14:15:34 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 5 Jun 2013 14:15:34 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r55JFY23012371;
	Wed, 5 Jun 2013 14:15:34 -0500
Date: Wed, 5 Jun 2013 15:15:34 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20130605191533.GS12092@edge>
References: <1370459422-30924-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1370459422-30924-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] meta-toolchain-arago: Fix mkspecs and qt.conf for Qt Creator
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
X-List-Received-Date: Wed, 05 Jun 2013 19:15:36 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Jun 05, 2013 at 02:10:22PM -0500, Franklin S. Cooper Jr wrote:
> * Needed to adjust the location of the mkspecs and update the Prefix option in
>   qt.conf for Qt Creator to properly detect the Qt installation within the SDK.
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../meta/meta-toolchain-arago-tisdk.bb             |    2 +-
>  .../recipes-core/meta/meta-toolchain-arago-qte.bb  |    6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb b/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb
> index 114ae1c..68df1bf 100644
> --- a/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb
> +++ b/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb
> @@ -4,7 +4,7 @@ TOOLCHAIN_CLEANUP_PACKAGES ?= "libgnutls-dev libgnutls-extra26 libgnutls-openssl
>  
>  require recipes-core/meta/meta-toolchain-arago-qte.bb
>  
> -PR = "r2"
> +PR = "r3"
>  
>  toolchain_create_sdk_env_script_append() {
>      echo -e 'export PS1="\[\\e[32;1m\][linux-devkit]\[\\e[0m\]:\w> "' >> $script
> diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
> index 11ff5b4..a104ca0 100644
> --- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
> +++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
> @@ -5,7 +5,7 @@ TOOLCHAIN_SUFFIX ?= "-qte-sdk"
>  
>  require meta-toolchain-arago.bb
>  
> -PR = "r14"
> +PR = "r15"
>  
>  QT_DIR_NAME = "qtopia"
>  
> @@ -35,11 +35,11 @@ toolchain_create_sdk_env_script_append() {
>  	qt_conf="${SDK_OUTPUT}/${SDKPATHNATIVE}${bindir_nativesdk}/qt.conf"
>  	touch $qt_conf
>  	echo '[Paths]' >> $qt_conf
> -	echo 'Prefix = $(SDK_PATH)' >> $qt_conf
> +	echo 'Prefix = $(SDK_PATH_TARGET)' >> $qt_conf
>  	echo 'Libraries = $(OE_QMAKE_LIBDIR_QT)' >> $qt_conf
>  	echo 'Headers = $(OE_QMAKE_INCDIR_QT)' >> $qt_conf
>  
>  	# make a symbolic link to mkspecs for compatibility with Nokia's SDK
>  	# and QTCreator
> -	(cd ${SDK_OUTPUT}/${SDKPATH}; ln -sf sysroots/${REAL_MULTIMACH_TARGET_SYS}${datadir}/${QT_DIR_NAME}/mkspecs mkspecs;)
> +	(cd ${SDK_OUTPUT}/${SDKPATH}/sysroots/${REAL_MULTIMACH_TARGET_SYS}; ln -sf usr/share/${QT_DIR_NAME}/mkspecs mkspecs;)

Can use SDKTARGETSYSROOT here.


>  }
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

