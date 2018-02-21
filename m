Return-Path: <denys@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 89AEF5298F
	for <meta-arago@arago-project.org>;
	Wed, 21 Feb 2018 01:44:07 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w1L1hg4E011060
	for <meta-arago@arago-project.org>; Tue, 20 Feb 2018 19:43:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1519177422;
	bh=7k2y6bxUWLMm7gBAkH7VDh0m9C0tRDw/4f1yTJQ3GV4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=htzqJqEIi8MdPNQ4vHhZSEamqbUezGd02mWH2VMbk/UflCan/OrXGDh3Mkz1k4MUB
	rV29WX6fjwjH8kVj465la9T6hu4wfJMgAhOJ51/gZ55ESGjeepJf0DxLktpI+KPxru
	r4N2Tn8QC1Rir7n7UzhEfHXLQ2CZHfhc+nVTDMqo=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1L1hfGK004419
	for <meta-arago@arago-project.org>; Tue, 20 Feb 2018 19:43:42 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 20 Feb 2018 19:43:41 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 20 Feb 2018 19:43:41 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1L1hfFc028690;
	Tue, 20 Feb 2018 19:43:41 -0600
Date: Tue, 20 Feb 2018 20:43:41 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Djordje Senicic <x0157990@ti.com>
Message-ID: <20180221014341.GJ12117@edge>
References: <1519173405-4505-1-git-send-email-x0157990@ti.com>
MIME-Version: 1.0
In-Reply-To: <1519173405-4505-1-git-send-email-x0157990@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org, d-senicic1@ti.com
Subject: Re: [meta-processor-sdk] [PATCH] opencv: Fix OpenCL linking with unused DSP library
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
X-List-Received-Date: Wed, 21 Feb 2018 01:44:08 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Will this be submitted upstream to meta-arago proper?


On Tue, Feb 20, 2018 at 07:36:45PM -0500, Djordje Senicic wrote:
> Signed-off-by: Djordje Senicic <x0157990@ti.com>
> ---
>  meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend b/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend
> index bf33a2e..3915c4d 100644
> --- a/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend
> +++ b/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend
> @@ -11,7 +11,7 @@ SRC_URI_append += "\
>       file://setupEnv.sh \
>  "
>  
> -SRCREV_opencv = "4458601eb2766461f2f9da0d2527ff25ecb20284"
> +SRCREV_opencv = "9b88e8c746e531a1b4cc61e5235e4e747c319945"
>  
>  DEPENDS_remove_keystone = "qtbase"
>  
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

