Return-Path: <denys@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 50825529A6
	for <meta-arago@arago-project.org>;
	Tue, 22 Aug 2017 21:39:06 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7MLd62P002374
	for <meta-arago@arago-project.org>; Tue, 22 Aug 2017 16:39:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1503437946;
	bh=pRz3MVxhxu+YbRNJGpMxkPCXSCoJ0KgWQs5vKxtXHF0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Epyum2dKqL/uM3i/dNyOMrz64UPZ3hlDQjjT09uOD7PWDD0j6vmE1DSEpqQVVEvdN
	th1NKNeqcu95+PoW0vg7auihqjd+JMvbvSeLTS0Dx6WzlGODkZXn34nCEoXhBV3JWs
	LrGat8CH/Ztx8Ta54AZGiGlM0k1ivMXMsycI/+Bk=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7MLd6RJ003909
	for <meta-arago@arago-project.org>; Tue, 22 Aug 2017 16:39:06 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 22 Aug 2017 16:39:05 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 22 Aug 2017 16:39:05 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7MLd5QW005093;
	Tue, 22 Aug 2017 16:39:05 -0500
Date: Tue, 22 Aug 2017 17:39:02 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Hongmei Gou <h-gou@ti.com>
Message-ID: <20170822213901.GQ28233@edge>
References: <1503097164-20985-1-git-send-email-h-gou@ti.com>
MIME-Version: 1.0
In-Reply-To: <1503097164-20985-1-git-send-email-h-gou@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH v2] matrix-gui: update init scripts to execute /etc/profile.d/*.sh only when they exist
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
X-List-Received-Date: Tue, 22 Aug 2017 21:39:06 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks, merged.


On Fri, Aug 18, 2017 at 06:59:24PM -0400, Hongmei Gou wrote:
> Signed-off-by: Hongmei Gou <h-gou@ti.com>
> ---
> v2 change: simplify the check as suggested by Denys
> 
>  meta-arago-extras/recipes-core/matrix/matrix-gui/init       | 7 ++-----
>  meta-arago-extras/recipes-core/matrix/matrix-gui/init.eglfs | 7 ++-----
>  meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb     | 2 +-
>  3 files changed, 5 insertions(+), 11 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui/init b/meta-arago-extras/recipes-core/matrix/matrix-gui/init
> index 3ec0a55..5124c38 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui/init
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui/init
> @@ -5,11 +5,8 @@ GUI_OPTS="http://localhost:80/ __MATRIX_FLAGS__"
>  PIDFILE="/var/run/matrix-gui-2.0.pid"
>  
>  # Important System Environment Variables
> -SCRIPTS=/etc/profile.d/*.sh
> -
> -for f in $SCRIPTS
> -do
> -    source $f
> +for sh in /etc/profile.d/*.sh ; do
> +    [ -r "$sh" ] && . "$sh"
>  done
>  
>  test -x "$matrixgui" || exit 0
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui/init.eglfs b/meta-arago-extras/recipes-core/matrix/matrix-gui/init.eglfs
> index 213f859..df07c05 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui/init.eglfs
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui/init.eglfs
> @@ -5,11 +5,8 @@ GUI_OPTS="http://localhost:80/ __MATRIX_FLAGS__"
>  PIDFILE="/var/run/matrix-gui-2.0.pid"
>  
>  # Important System Environment Variables
> -SCRIPTS=/etc/profile.d/*.sh
> -
> -for f in $SCRIPTS
> -do
> -    source $f
> +for sh in /etc/profile.d/*.sh ; do
> +    [ -r "$sh" ] && . "$sh"
>  done
>  
>  test -x "$matrixgui" || exit 0
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

