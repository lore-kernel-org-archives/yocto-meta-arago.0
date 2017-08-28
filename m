Return-Path: <denys@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id F162152AB0
	for <meta-arago@arago-project.org>;
	Mon, 28 Aug 2017 13:17:34 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7SDHYAi022968;
	Mon, 28 Aug 2017 08:17:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1503926254;
	bh=uJ9NZsFrKZoqTS+HMYddc6iReFhBbJC6qZXrKIIJOko=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=YqkN2KWunF39Be/TtUg7+XEXBnQvW4R/DmXqL0e2UOn/M2deOhHtK7RUEtr8y7bbc
	pS2zk2RkJKAgSL8htqegvjhXxwdhMr7+ka3ch8fleFcd8V2Dlh+etCmzBI12+Y3/yl
	QzfnAHXDw+YK+jYl23qst7IQsQmPZSvqQY4LMtYM=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7SDHYwR006792;
	Mon, 28 Aug 2017 08:17:34 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 28 Aug 2017 08:17:34 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 28 Aug 2017 08:17:34 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7SDHY1J032570;
	Mon, 28 Aug 2017 08:17:34 -0500
Date: Mon, 28 Aug 2017 09:17:30 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Message-ID: <20170828131730.GH4311@edge>
References: <1503919436-29891-1-git-send-email-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1503919436-29891-1-git-send-email-ankur.tyagi85@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [master][PATCH] qt_env: Update Qt environment variables for ti33x
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
X-List-Received-Date: Mon, 28 Aug 2017 13:17:35 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Not sure if it was sent by mistake, but no, this won't be accepted.

On Mon, Aug 28, 2017 at 11:23:56PM +1200, Ankur Tyagi wrote:
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
> index 8f47083..b804fe2 100644
> --- a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
> +++ b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
> @@ -1,5 +1,6 @@
>  #!/bin/sh
>  
>  ### QT Environment Variables ###
> -export QT_QPA_GENERIC_PLUGINS=Auto
> -export QT_QPA_EVDEV_TOUCHSCREEN_PARAMETERS="rotate=180"
> +export QT_QPA_GENERIC_PLUGINS=tslib
> +export QT_QPA_EGLFS_TSLIB=1
> +export QT_QPA_EGLFS_DISABLE_INPUT=1
> -- 
> 2.7.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

