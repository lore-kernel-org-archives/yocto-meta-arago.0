Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 1CD3952960
	for <meta-arago@arago-project.org>;
	Fri, 20 Sep 2019 18:19:06 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8KIHvvY025462
	for <meta-arago@arago-project.org>; Fri, 20 Sep 2019 13:17:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569003477;
	bh=lwKDd+B01yBZgI/cl/epP8jSdu6dvb7sdvkmcB4nnuA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=PT2ki3B58WrGXz2O4lG+b5MvC6b9FyxZlG0xRkj042GbuEsI/ZjERWA6pvZmah4rS
	PRhQiS6XSIgAHjhEQ6AnFK1Xnbx6jmMiAsxueJE/MKefIKZls61+Fl4Knl0kDlp2Hk
	/+YDIoTa1iuWdKSWt1kKT+lAFHldYvYSWg0J9zdQ=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8KIHv4s020523
	for <meta-arago@arago-project.org>; Fri, 20 Sep 2019 13:17:57 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 20 Sep 2019 13:17:53 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 20 Sep 2019 13:17:53 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8KIHvVr034858;
	Fri, 20 Sep 2019 13:17:57 -0500
Date: Fri, 20 Sep 2019 14:17:57 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20190920181757.GI5351@beryl>
References: <1568985365-31665-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1568985365-31665-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [master/thud/ti2019.03][PATCH] meta-toolchain-arago-qte: add quotes to vars
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
X-List-Received-Date: Fri, 20 Sep 2019 18:19:06 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

BTW, do we also need to pass --sysroot parameter for qmake CC vars, like is 
done for main CC vars here:
http://arago-project.org/git/?p=meta-arago.git;a=commitdiff;h=4e87564c39e214a61cbf0088ecf1a3f5a3f01bd5


On Fri, Sep 20, 2019 at 09:16:05AM -0400, Jacob Stiffler wrote:
> * Add quotes around values which may contain spaces
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  .../recipes-core/meta/meta-toolchain-arago-qte.bb              | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
> index b03b639..d313939 100644
> --- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
> +++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
> @@ -5,7 +5,7 @@ TOOLCHAIN_SUFFIX ?= "-qte-sdk"
>  
>  require meta-toolchain-arago.bb
>  
> -PR = "r19"
> +PR = "r20"
>  
>  # There could be qt5, qt4e and qt4x11 providers, but we don't support qt4x11 for now
>  QT_DIR_NAME = "${@oe.utils.conditional('QT_PROVIDER', 'qt5', '', 'qtopia', d)}"
> @@ -19,10 +19,10 @@ toolchain_create_sdk_env_script_append() {
>  	echo 'export OE_QMAKE_CFLAGS="$CFLAGS"' >> $script
>  	echo 'export OE_QMAKE_CXXFLAGS="$CXXFLAGS"' >> $script
>  	echo 'export OE_QMAKE_LDFLAGS="$LDFLAGS"' >> $script
> -	echo 'export OE_QMAKE_CC=$CC' >> $script
> -	echo 'export OE_QMAKE_CXX=$CXX' >> $script
> -	echo 'export OE_QMAKE_LINK=$CXX' >> $script
> -	echo 'export OE_QMAKE_AR=$AR' >> $script
> +	echo 'export OE_QMAKE_CC="$CC"' >> $script
> +	echo 'export OE_QMAKE_CXX="$CXX"' >> $script
> +	echo 'export OE_QMAKE_LINK="$CXX"' >> $script
> +	echo 'export OE_QMAKE_AR="$AR"' >> $script
>  	echo 'export OE_QMAKE_PREFIX_QT=${prefix}' >> $script
>  	echo 'export OE_QMAKE_LIBDIR_QT=${libdir}' >> $script
>  	echo 'export OE_QMAKE_INCDIR_QT=${includedir}/${QT_DIR_NAME}' >> $script
> -- 
> 2.7.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

