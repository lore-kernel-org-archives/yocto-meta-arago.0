Return-Path: <denys@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 37A725299D
	for <meta-arago@arago-project.org>;
	Mon, 28 Aug 2017 19:29:46 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7SJTjmA024763
	for <meta-arago@arago-project.org>; Mon, 28 Aug 2017 14:29:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1503948586;
	bh=7kNsPUoaBlQEVKFWpribcmYPCI7i3FAmnmCUQXbQTzk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Wwumjwoahy5zbNP/pxdoSo5Xpogqp1g/YsrqcW6WlP0DVSObL8CVTGpQx2ggy54ZW
	wuwNGjWXR9r9OOOc6GTRGKDYGR05kulD6chPGHfNuap8V2fZnIkZ+7MLJSj5NmofMK
	d8fEWNKi5PzAZJbsuKgtsURGwxfUAIBIJYyK97pM=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7SJTjhG014256
	for <meta-arago@arago-project.org>; Mon, 28 Aug 2017 14:29:45 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 28 Aug 2017 14:29:45 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 28 Aug 2017 14:29:45 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7SJTjXg028459;
	Mon, 28 Aug 2017 14:29:45 -0500
Date: Mon, 28 Aug 2017 15:29:41 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Eric Ruei <e-ruei1@ti.com>
Message-ID: <20170828192941.GP4311@edge>
References: <1503948203-51821-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
In-Reply-To: <1503948203-51821-1-git-send-email-e-ruei1@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [matrix-gui-v2-apps][PATCH] qt5_browser: replace webkit-based demo browser with webengine-based one
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
X-List-Received-Date: Mon, 28 Aug 2017 19:29:47 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Looks good to me!


Eric,

Do you have more patches pending to finally make the switch? Thanks.


On Mon, Aug 28, 2017 at 03:23:23PM -0400, Eric Ruei wrote:
> Replace webkit-based demo browser because webkit is obsolete and will be
> removed soon.
> 
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>  qt5_apps/qt5_browser/qt5_browser.desktop | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qt5_apps/qt5_browser/qt5_browser.desktop b/qt5_apps/qt5_browser/qt5_browser.desktop
> index 2f6636f..a5d3953 100644
> --- a/qt5_apps/qt5_browser/qt5_browser.desktop
> +++ b/qt5_apps/qt5_browser/qt5_browser.desktop
> @@ -4,7 +4,7 @@
>  Name=Browser
>  GenericName=Demo App
>  Icon=/usr/share/matrix-gui-2.0/apps/images/web-icon.png
> -Exec=/usr/share/qt5/examples/webkitwidgets/browser/browser http://www.ti.com
> +Exec=/usr/share/qt5/examples/webenginewidgets/demobrowser/demobrowser http://www.ti.com
>  Type=Application
>  ProgramType=gui
>  Categories=Qt5
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

