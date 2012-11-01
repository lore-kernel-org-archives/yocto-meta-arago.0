Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id B1C49529A5
	for <meta-arago@arago-project.org>;
	Thu,  1 Nov 2012 18:57:55 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id qA1IvsML021948;
	Thu, 1 Nov 2012 13:57:54 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qA1IvsR5025669;
	Thu, 1 Nov 2012 13:57:54 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 1 Nov 2012 13:57:54 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id qA1Ivsol009630;
	Thu, 1 Nov 2012 13:57:54 -0500
Date: Thu, 1 Nov 2012 14:57:54 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
Message-ID: <20121101185754.GE22705@edge>
References: <1351795310-4966-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1351795310-4966-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org, "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: Re: [PATCH] meta-toolchain-arago-qte: Fix Qt library and include files path
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
X-List-Received-Date: Thu, 01 Nov 2012 18:57:55 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Nov 01, 2012 at 01:41:50PM -0500, Franklin S. Cooper Jr wrote:
> * Within the toolchain sdk the Qt library files are located at
>   SDK_PATH/arm-arago-linux-gnueabi/usr/lib not at SDK_PATH/usr/lib.
>   The Qt include files are located in a similar location but instead of /usr/lib
>   it is located at /usr/include.
> * This commit points qmake to the proper location of these Qt library and include
>   files.
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../recipes-core/meta/meta-toolchain-arago-qte.bb  |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
> index 54040e0..e349783 100644
> --- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
> +++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
> @@ -5,7 +5,7 @@ TOOLCHAIN_OUTPUTNAME = "${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}-qte-sdk-${SDK_ARC
>  
>  require meta-toolchain-arago.bb
>  
> -PR = "r3"
> +PR = "r4"
>  
>  QT_DIR_NAME = "qtopia"
>  
> @@ -17,8 +17,8 @@ toolchain_create_sdk_env_script_append() {
>      echo -e 'export OE_QMAKE_CXX=\x24{TARGET_PREFIX}g++' >> $script
>      echo -e 'export OE_QMAKE_LINK=\x24{TARGET_PREFIX}g++' >> $script
>      echo -e 'export OE_QMAKE_AR=\x24{TARGET_PREFIX}ar' >> $script
> -    echo 'export OE_QMAKE_LIBDIR_QT=$SDK_PATH${libdir}' >> $script
> -    echo 'export OE_QMAKE_INCDIR_QT=$SDK_PATH${includedir}/${QT_DIR_NAME}' >> $script
> +    echo 'export OE_QMAKE_LIBDIR_QT=$SDK_PATH/$TARGET_SYS${libdir}' >> $script
> +    echo 'export OE_QMAKE_INCDIR_QT=$SDK_PATH/$TARGET_SYS${includedir}/${QT_DIR_NAME}' >> $script

Ah, right, I didn't notice that I borked these 2 with my last patch...


>      echo 'export OE_QMAKE_MOC=$SDK_PATH${bindir_nativesdk}/moc4' >> $script
>      echo 'export OE_QMAKE_UIC=$SDK_PATH${bindir_nativesdk}/uic4' >> $script
>      echo 'export OE_QMAKE_UIC3=$SDK_PATH${bindir_nativesdk}/uic34' >> $script
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

