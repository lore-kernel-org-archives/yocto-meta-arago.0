Return-Path: <denys@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id AA2A05296D
	for <meta-arago@arago-project.org>;
	Tue, 28 Mar 2017 21:43:55 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2SLht7K000304
	for <meta-arago@arago-project.org>; Tue, 28 Mar 2017 16:43:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1490737435;
	bh=i9iZFk8wdbeyzcss/9UtvERyUJt4ac9BeHaWVLeQOOY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=s68DSZ4M9TWA29F5M1g0IQac/y5ICk7UuQyxJHUcMszIr4lUG1ZbMXfs+pzwueWwp
	Dm5VSTwKkBXeRehoFgf1gzn6OfIdweaOzM/9XX7MZaKAY5TJuOf9wMJf0k0Vj3SjvX
	o0M36Acg4JBkJMvWJpYoqz8pWt6H6i41V0N3hxB0=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2SLhtY6023946
	for <meta-arago@arago-project.org>; Tue, 28 Mar 2017 16:43:55 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 28 Mar 2017 16:43:54 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2SLhtJj021866;
	Tue, 28 Mar 2017 16:43:55 -0500
Date: Tue, 28 Mar 2017 17:43:54 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Eric Ruei <e-ruei1@ti.com>
Message-ID: <20170328214354.GN29187@edge>
References: <1490649301-28680-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
In-Reply-To: <1490649301-28680-1-git-send-email-e-ruei1@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [krogoth][PATCH] glsdk-example-apps: Include fix for HDMI testcases
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
X-List-Received-Date: Tue, 28 Mar 2017 21:43:55 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Same question as kmscube

On Mon, Mar 27, 2017 at 05:15:01PM -0400, Eric Ruei wrote:
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>  .../recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb           | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
> index 94c1362..fc1ff46 100644
> --- a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
> +++ b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
> @@ -14,7 +14,7 @@ inherit autotools pkgconfig
>  SRC_URI = "git://git.ti.com/glsdk/example-applications.git;protocol=git \
>  	 "
>  
> -SRCREV="8384727bef3368b95b690dd50e6735c9344a8590"
> +SRCREV="f7562ecf76c559972205d7faaa3b50bdb43de238"
>  
>  PR = "r47"
>  
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

