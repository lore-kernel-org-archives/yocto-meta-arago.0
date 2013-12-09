Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id CFBCF529CB
	for <meta-arago@arago-project.org>;
	Mon,  9 Dec 2013 22:33:50 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id rB9MXogE005631
	for <meta-arago@arago-project.org>; Mon, 9 Dec 2013 16:33:50 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB9MXn7r016478
	for <meta-arago@arago-project.org>; Mon, 9 Dec 2013 16:33:50 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 9 Dec 2013 16:33:49 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB9MXnMU021009	for
	<meta-arago@arago-project.org>; Mon, 9 Dec 2013 16:33:49 -0600
Date: Mon, 9 Dec 2013 17:33:49 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20131209223349.GC24180@edge>
References: <1386614832-12313-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1386614832-12313-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 1/2] ltp-ddt: temporary disable AUTOREV and lock SRCREV for release
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
X-List-Received-Date: Mon, 09 Dec 2013 22:33:51 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

So, these 2 patches should go into ti2013.10.x branch, which will be used for 
the upcoming ti2013.10.00 release (and/or any following point releases)

And, BTW, 2013.10 signifies the quarter, not the month of the release, so it's 
still current in December... :)

-- 
Denys


On Mon, Dec 09, 2013 at 01:47:11PM -0500, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
> index 9fcc92f..eab32c0 100644
> --- a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
> +++ b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
> @@ -1,9 +1,12 @@
> -PR_append = "-arago3+gitr${SRCPV}"
> +PR_append = "-arago4+gitr${SRCPV}"
>  
>  RDEPENDS_${PN} += "linaro-pm-qa-utils"
>  
>  # Auto rev so we pick up the latest changes
> -SRCREV = "${AUTOREV}"
> +#SRCREV = "${AUTOREV}"
> +
> +# Temporary disable AUTOREV for release
> +SRCREV = "1a37c1b3cdcc34fcd34bc5df03e338ee074822d6"
>  
>  FILES_${PN}-dbg += " \
>  	${LTPROOT}/testcases/realtime/*/*/.debug \
> -- 
> 1.8.3.2
> 

