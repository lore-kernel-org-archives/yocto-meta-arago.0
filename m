Return-Path: <denys@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 37C8352AF9
	for <meta-arago@arago-project.org>;
	Tue,  7 Feb 2017 17:38:04 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v17Hc3g5002371
	for <meta-arago@arago-project.org>; Tue, 7 Feb 2017 11:38:03 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v17Hc33S009952
	for <meta-arago@arago-project.org>; Tue, 7 Feb 2017 11:38:03 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 7 Feb 2017 11:38:02 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v17Hc36c001406;
	Tue, 7 Feb 2017 11:38:03 -0600
Date: Tue, 7 Feb 2017 12:38:02 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Pooja Prajod <a0132412@ti.com>
Message-ID: <20170207173802.GQ25590@edge>
References: <1486463187-89615-1-git-send-email-a0132412@ti.com>
MIME-Version: 1.0
In-Reply-To: <1486463187-89615-1-git-send-email-a0132412@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago krogoth] gstreamer: Update gst-bad recipe
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
X-List-Received-Date: Tue, 07 Feb 2017 17:38:04 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks. Is it also needed for morty and gst 1.8.3?

On Tue, Feb 07, 2017 at 03:56:27PM +0530, Pooja Prajod wrote:
> Updated gst-bad recipe to pick
> * gstwaylandsink: Fix same process looping issue
> 
> Signed-off-by: Pooja Prajod <a0132412@ti.com>
> ---
>  .../gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend                 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
> index 7ceb1b3..b5ccebf 100644
> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
> @@ -37,7 +37,7 @@ SRC_URI = "git://git.ti.com/glsdk/gstreamer1-0-plugins-bad.git;protocol=git;bran
>  
>  S = "${WORKDIR}/git"
>  
> -SRCREV_omap-a15 = "07050013051af00828be115eb7bce0fc08abb79f"
> +SRCREV_omap-a15 = "eb41f1c8fde05f87587c83d157835e3b2d19a298"
>  SRCREV = "d0160ca810be30bf2b2e7681f5047933402efb52"
>  
> -PR = "r24"
> +PR = "r25"
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

