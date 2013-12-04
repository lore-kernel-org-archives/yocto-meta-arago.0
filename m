Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id F2F3A52AB2
	for <meta-arago@arago-project.org>;
	Wed,  4 Dec 2013 19:56:07 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id rB4Ju770006450
	for <meta-arago@arago-project.org>; Wed, 4 Dec 2013 13:56:07 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB4Ju7aE006745
	for <meta-arago@arago-project.org>; Wed, 4 Dec 2013 13:56:07 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 4 Dec 2013 13:56:07 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB4Ju6vM002038;
	Wed, 4 Dec 2013 13:56:07 -0600
Date: Wed, 4 Dec 2013 14:56:06 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Chase Maupin <Chase.Maupin@ti.com>
Message-ID: <20131204195606.GX690@edge>
References: <1386190787-11630-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
In-Reply-To: <1386190787-11630-1-git-send-email-Chase.Maupin@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] ltp-ddt: add RDEPENDS for linaro-pm-qa-utils
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
X-List-Received-Date: Wed, 04 Dec 2013 19:56:08 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ack.

On Wed, Dec 04, 2013 at 02:59:47PM -0600, Chase Maupin wrote:
> * The latest ltp-ddt sources have thermal test scripts that
>   require the utils found in the linaro-pm-qa-utils package.
> * Add an RDEPENDS to make sure those utilities will be in place.
> 
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  .../ltp-ddt/ltp-ddt_0.0.4.bbappend                 |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
> index b9248f8..9fcc92f 100644
> --- a/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
> +++ b/meta-arago-distro/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bbappend
> @@ -1,4 +1,6 @@
> -PR_append = "-arago2+gitr${SRCPV}"
> +PR_append = "-arago3+gitr${SRCPV}"
> +
> +RDEPENDS_${PN} += "linaro-pm-qa-utils"
>  
>  # Auto rev so we pick up the latest changes
>  SRCREV = "${AUTOREV}"
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

