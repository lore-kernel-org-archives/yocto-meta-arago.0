Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 45D6252A59
	for <meta-arago@arago-project.org>;
	Fri, 14 Aug 2015 14:53:32 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t7EErVpI008988
	for <meta-arago@arago-project.org>; Fri, 14 Aug 2015 09:53:31 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7EErV9Y008622
	for <meta-arago@arago-project.org>; Fri, 14 Aug 2015 09:53:31 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 14 Aug 2015 09:53:31 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7EErVbB021478;
	Fri, 14 Aug 2015 09:53:31 -0500
Date: Fri, 14 Aug 2015 10:53:15 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150814145315.GE30560@edge>
References: <1439472317-17399-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1439472317-17399-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [tisdk-build-scripts][PATCH 1/2] package-sdks: Remove assumption of TISDK_VERSION from webgen.mak path
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
X-List-Received-Date: Fri, 14 Aug 2015 14:53:32 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

What's the reason for the change?


On Thu, Aug 13, 2015 at 09:25:16AM -0400, Jacob Stiffler wrote:
> * The same effect can be obtained though the config.
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  lib/oesdk/package-sdks | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/oesdk/package-sdks b/lib/oesdk/package-sdks
> index 31a44b6..498ee79 100644
> --- a/lib/oesdk/package-sdks
> +++ b/lib/oesdk/package-sdks
> @@ -304,7 +304,7 @@ generate_webgen_page() {
>      m="$1"
>  
>      
> -    webgen_make="$WEBGEN_MAK_ROOT/$TISDK_VERSION/$m/webgen.mak"
> +    webgen_make="$WEBGEN_MAK_ROOT/$m/webgen.mak"
>  
>      if [ ! -e $webgen_make ]
>      then
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

