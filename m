Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 530D352099
	for <meta-arago@arago-project.org>;
	Mon, 20 Apr 2015 18:41:24 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3KIfNSN010058
	for <meta-arago@arago-project.org>; Mon, 20 Apr 2015 13:41:23 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3KIfMsX009337
	for <meta-arago@arago-project.org>; Mon, 20 Apr 2015 13:41:22 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 20 Apr 2015 13:41:22 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3KIfMcE006112;
	Mon, 20 Apr 2015 13:41:22 -0500
Date: Mon, 20 Apr 2015 14:41:21 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20150420184121.GA23723@edge>
References: <1429302346-9926-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1429302346-9926-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] ltp-ddt: Skip mv of kernel files if no files found
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
X-List-Received-Date: Mon, 20 Apr 2015 18:41:24 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Apr 17, 2015 at 04:25:46PM -0400, Sam Nelson wrote:
> - Install was failing if there are no modules for certain platforms
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  .../recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb      |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
> index 68e1a3c..609b344 100644
> --- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
> +++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
> @@ -87,7 +87,7 @@ do_install() {
>      oe_runmake install
>      install -d ${D}${datadir}
>      install -d ${D}${kmoddir}
> -    mv ${D}${LTPROOT}/testcases/bin/ddt/*.ko ${D}${kmoddir}
> +    find ${D}${LTPROOT}/testcases/bin/ddt/*.ko && mv ${D}${LTPROOT}/testcases/bin/ddt/*.ko ${D}${kmoddir}

Should probably do "mv || true" instead...


>  }
>  
>  # do_make_scripts should be a separate task for the lock to work
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

