Return-Path: <denys@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id A707952980
	for <meta-arago@arago-project.org>;
	Fri, 10 Mar 2017 18:32:25 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2AIWPOO018741
	for <meta-arago@arago-project.org>; Fri, 10 Mar 2017 12:32:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489170745;
	bh=FJpZ7S7SW97rXUE7LWZQwwtteDrPCR+T2oX4S3xg9o4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=peTN21c/nYGwOlvXO4AJJ0Tv4bJhdrk2FnQ8bqlO7yZAh6aUaBZQ4HUyHkY6LZJao
	qsgfXQG5nx+4Qkb4FZbas/6jfV5lcOHvb+70aIPLLsewOmTDtIwdwBOB+sFAneCjRU
	jZ+Dev6pdiQWdmobhSIJ9fp4An5zaeqB0rCvKeRA=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2AIWPed008401
	for <meta-arago@arago-project.org>; Fri, 10 Mar 2017 12:32:25 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 10 Mar 2017 12:32:24 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2AIWPhU004848;
	Fri, 10 Mar 2017 12:32:25 -0600
Date: Fri, 10 Mar 2017 13:32:24 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <yan-liu@ti.com>
Message-ID: <20170310183224.GS578@edge>
References: <1489170314-21971-1-git-send-email-yan-liu@ti.com>
MIME-Version: 1.0
In-Reply-To: <1489170314-21971-1-git-send-email-yan-liu@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: ltp-ddt: Update to latest ltp-ddt
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
X-List-Received-Date: Fri, 10 Mar 2017 18:32:26 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ok, I'll take it. But FYI, you are missing [PATCH] in the subject for some 
reason. And in this case, it's v2, so should be [PATCH v2]...


On Fri, Mar 10, 2017 at 01:25:14PM -0500, yan-liu@ti.com wrote:
> From: Yan Liu <yan-liu@ti.com>
> 
> Signed-off-by: Yan Liu <yan-liu@ti.com>
> ---
>  .../recipes-devtools/ltp-ddt/ltp-ddt_20170116.bb   |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170116.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170116.bb
> index 2d78fa8..75e298f 100644
> --- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170116.bb
> +++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170116.bb
> @@ -4,7 +4,7 @@ SECTION = "console/utils"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>  
> -PR = "r11"
> +PR = "r12"
>  PV_append = "+git${SRCPV}"
>  
>  PROVIDES += "ltp"
> @@ -14,7 +14,7 @@ RDEPENDS_${PN} += "pm-qa serialcheck"
>  
>  inherit autotools-brokensep
>  
> -SRCREV = "7b43afae8b931541388b0a7e6f65d7ceb6d01b3e"
> +SRCREV = "127c5f715a6bc149189cc4ba84f97cc3d7857c8f"
>  BRANCH ?= "master"
>  
>  SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH}"
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

