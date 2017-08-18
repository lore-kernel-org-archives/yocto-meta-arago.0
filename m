Return-Path: <denys@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 154155297F
	for <meta-arago@arago-project.org>;
	Fri, 18 Aug 2017 19:53:09 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7IJr88g009993
	for <meta-arago@arago-project.org>; Fri, 18 Aug 2017 14:53:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1503085988;
	bh=Yng3fZ7VdLisyNf4sEdCZOSCZjhUheVDZGhg1WWOsfQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ZNtqJLSRYqQpWnZ7gj85r48O2ps5558uy9NKQG2cQpmYV2rdJa6yopAUkD/SCh6Yu
	6bAIoEqJ8+I9xPJ3Y4KXQAFQE5YV7ymLo/JhOy07F54MPoNg/J+QbSsQyokC9aIiGq
	tSEor6x7kZUGkD8ywHbMPZBcLt/LBaaw2H5Wmmso=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7IJr8E0032293
	for <meta-arago@arago-project.org>; Fri, 18 Aug 2017 14:53:08 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 18 Aug 2017 14:53:08 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 18 Aug 2017 14:53:08 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7IJr8jO003919;
	Fri, 18 Aug 2017 14:53:08 -0500
Date: Fri, 18 Aug 2017 15:53:04 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Hongmei Gou <h-gou@ti.com>
Message-ID: <20170818195304.GC28233@edge>
References: <1503085785-9443-1-git-send-email-h-gou@ti.com>
MIME-Version: 1.0
In-Reply-To: <1503085785-9443-1-git-send-email-h-gou@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] matrix-gui: update init scripts to execute /etc/profile.d/*.sh only when they exist
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
X-List-Received-Date: Fri, 18 Aug 2017 19:53:09 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Aug 18, 2017 at 03:49:45PM -0400, Hongmei Gou wrote:
> Signed-off-by: Hongmei Gou <h-gou@ti.com>
> ---
>  meta-arago-extras/recipes-core/matrix/matrix-gui/init    | 16 ++++++++++------
>  .../recipes-core/matrix/matrix-gui/init.eglfs            | 14 +++++++++-----
>  meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb  |  2 +-
>  3 files changed, 20 insertions(+), 12 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui/init b/meta-arago-extras/recipes-core/matrix/matrix-gui/init
> index 3ec0a55..4a002d1 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui/init
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui/init
> @@ -5,12 +5,16 @@ GUI_OPTS="http://localhost:80/ __MATRIX_FLAGS__"
>  PIDFILE="/var/run/matrix-gui-2.0.pid"
>  
>  # Important System Environment Variables
> -SCRIPTS=/etc/profile.d/*.sh
> -
> -for f in $SCRIPTS
> -do
> -    source $f
> -done
> +DIR=/etc/profile.d
> +SCRIPTS=$DIR/*.sh
> +
> +if [ "$(ls -A $DIR)" ];
> +then
> +    for f in $SCRIPTS
> +    do
> +        source $f
> +    done
> +fi

Why not simply this:

for sh in /etc/profile.d/*.sh ; do
        [ -r "$sh" ] && . "$sh"
done

That's what other distros are doing and it works fine.



>  test -x "$matrixgui" || exit 0
>  
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui/init.eglfs b/meta-arago-extras/recipes-core/matrix/matrix-gui/init.eglfs
> index 213f859..bc93cd3 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui/init.eglfs
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui/init.eglfs
> @@ -5,12 +5,16 @@ GUI_OPTS="http://localhost:80/ __MATRIX_FLAGS__"
>  PIDFILE="/var/run/matrix-gui-2.0.pid"
>  
>  # Important System Environment Variables
> -SCRIPTS=/etc/profile.d/*.sh
> +DIR=/etc/profile.d
> +SCRIPTS=$DIR/*.sh
>  
> -for f in $SCRIPTS
> -do
> -    source $f
> -done
> +if [ "$(ls -A $DIR)" ];
> +then
> +    for f in $SCRIPTS
> +    do
> +        source $f
> +    done
> +fi
>  
>  test -x "$matrixgui" || exit 0
>  
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> index aecc3be..507a98c 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a886c9ef769b2d8271115d2502512e5d"
>  
>  SECTION = "multimedia"
>  
> -PR = "r31"
> +PR = "r32"
>  
>  INITSCRIPT_NAME = "matrix-gui-2.0"
>  INITSCRIPT_PARAMS = "defaults 97"
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

