Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 3B71952970
	for <meta-arago@arago-project.org>;
	Fri, 21 Jun 2019 22:05:59 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5LM5GQU097792
	for <meta-arago@arago-project.org>; Fri, 21 Jun 2019 17:05:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561154717;
	bh=mDZZ24raHfOZLmvU7WgZjb4T9Mqns9RLeEB0gRypY60=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=h+ShY3bYwnhPA3uIeVp9DNDsuoVh0+ikiOvVSCMngin/JuuWFbfUTMkea75JfdSeO
	G+Ffsi2ZB9tDvGvDzDFDvn6HwZ1X5p5OAipOwNsDzxpNVuar9uNulcLpIv7Wfp9hvB
	/p+QLtp4VuiI1mkwNZYLs8UwTn3U3RfbJF6/IGMc=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5LM5GjC122086
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 21 Jun 2019 17:05:16 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 21 Jun 2019 17:05:16 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 21 Jun 2019 17:05:16 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5LM5Ggw087648;
	Fri, 21 Jun 2019 17:05:16 -0500
Date: Fri, 21 Jun 2019 18:05:16 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Djordje Senicic <x0157990@ti.com>
Message-ID: <20190621220516.GP4849@beryl>
References: <20190621104017.31121-1-x0157990@ti.com>
MIME-Version: 1.0
In-Reply-To: <20190621104017.31121-1-x0157990@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [thud/master][PATCH] demo-glow: Add makefile for demo-glow example application
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
X-List-Received-Date: Fri, 21 Jun 2019 22:06:00 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

This will break bisectabilty...

On Fri, Jun 21, 2019 at 06:40:17AM -0400, Djordje Senicic wrote:
> Signed-off-by: Djordje Senicic <x0157990@ti.com>
> ---
>  .../ti-tisdk-makefile/Makefile_demo-glow      | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_demo-glow
> 
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_demo-glow b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_demo-glow
> new file mode 100644
> index 00000000..96ede6af
> --- /dev/null
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_demo-glow
> @@ -0,0 +1,19 @@
> +# barcode-roi build targets
> +
> +demo-glow:
> +	@echo =============================
> +	@echo    Building Demo GLOW
> +	@echo =============================
> +	@cd example-applications; cd `find . -name "*demo-glow*"`; make -f Makefile.build release
> +
> +demo-glow_clean:
> +	@echo =============================
> +	@echo    Cleaning Demo GLOW
> +	@echo =============================
> +	@cd example-applications; cd `find . -name "*demo-glow*"`; make -f Makefile.build clean
> +
> +demo-glow_install:
> +	@echo ================================================
> +	@echo   Installing Demo Glow - Release version
> +	@echo ================================================
> +	@cd example-applications; cd `find . -name "*demo-glow*"`; make -f Makefile.build install
> -- 
> 2.17.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

