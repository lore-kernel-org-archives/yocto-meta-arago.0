Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id B033A5296F
	for <meta-arago@arago-project.org>;
	Mon, 18 Nov 2013 18:32:46 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAIIWkON023894
	for <meta-arago@arago-project.org>; Mon, 18 Nov 2013 12:32:46 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAIIWjaw029565
	for <meta-arago@arago-project.org>; Mon, 18 Nov 2013 12:32:45 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 18 Nov 2013 12:32:45 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAIIWjXY014818;
	Mon, 18 Nov 2013 12:32:45 -0600
Date: Mon, 18 Nov 2013 13:32:45 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20131118183244.GH19813@edge>
References: <1384711613-29582-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1384711613-29582-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] meta-toolchain-arago-qte: Fix location for host Qt tools
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
X-List-Received-Date: Mon, 18 Nov 2013 18:32:47 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sun, Nov 17, 2013 at 12:06:53PM -0600, Franklin S. Cooper Jr wrote:
> * By default Qt5 is looking at cortexa8hf-vfp-neon-oe-linux-gnueabi/bin instead
>   of the proper location i686-arago-linux/usr/bin/qt5.
> * Update qmake.conf to insure qmake looks at the proper location for host
>   binaries.

What is this needed for exactly? I hadn't had any issues using qmake and 
command-line build with the v3 of the patches. Is it specific to QtCreator?

-- 
Denys


> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../recipes-core/meta/meta-toolchain-arago-qte.bb  |    8 +++++++-
>  1 files changed, 7 insertions(+), 1 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
> index e3bf80f..6220578 100644
> --- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
> +++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
> @@ -5,7 +5,7 @@ TOOLCHAIN_SUFFIX ?= "-qte-sdk"
>  
>  require meta-toolchain-arago.bb
>  
> -PR = "r16"
> +PR = "r17"
>  
>  # There could be qt5, qt4e and qt4x11 providers, but we don't support qt4x11 for now
>  QT_DIR_NAME = "${@base_conditional('QT_PROVIDER', 'qt5', 'qt5', 'qtopia', d)}"
> @@ -46,6 +46,12 @@ toolchain_create_sdk_env_script_append() {
>  	echo 'Libraries = $(OE_QMAKE_LIBDIR_QT)' >> $qt_conf
>  	echo 'Headers = $(OE_QMAKE_INCDIR_QT)' >> $qt_conf
>  
> +	if [ "${QT_PROVIDER}" = "qt5" ]
> +	then
> +		echo 'HostBinaries = ../${SDK_SYS}/usr/bin/qt5' >> $qt_conf
> +	fi
> +
> +
>  	# make a symbolic link to mkspecs for compatibility with Nokia's SDK
>  	# and QTCreator
>  	(cd ${SDK_OUTPUT}/${SDKTARGETSYSROOT}; ln -sf .${QT_MKSPECS_LOCATION}/${QT_DIR_NAME}/mkspecs mkspecs;)
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

