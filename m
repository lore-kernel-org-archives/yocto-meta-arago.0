Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by arago-project.org (Postfix) with ESMTPS id 9CDA552AB6
	for <meta-arago@arago-project.org>;
	Mon,  1 Aug 2016 16:36:32 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u71GaVR7014384
	for <meta-arago@arago-project.org>; Mon, 1 Aug 2016 11:36:31 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u71GaVxx031899
	for <meta-arago@arago-project.org>; Mon, 1 Aug 2016 11:36:31 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 1 Aug 2016 11:36:30 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u71GaUv4007430;
	Mon, 1 Aug 2016 11:36:30 -0500
Date: Mon, 1 Aug 2016 12:36:30 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20160801163630.GA3677@edge>
References: <1470069037-21648-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1470069037-21648-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] gstreamer1.0-plugins-bad: fix compilation for k2 machines
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
X-List-Received-Date: Mon, 01 Aug 2016 16:36:32 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Aug 01, 2016 at 12:30:37PM -0400, Jacob Stiffler wrote:
> * Previously, the SRCREV was set to a commit compatible with only
>   dra7xx and overridden to a generic commit for select machines.
> * Now set SRCREV to the generic commit, and override for dra7xx.

omap-a15?

Should we keep distinguishing OMAP5 from DRA7?


> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  .../gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend              | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
> index bb69168..44a1b8a 100644
> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
> @@ -35,8 +35,7 @@ SRC_URI = "git://git.ti.com/glsdk/gstreamer1-0-plugins-bad.git;protocol=git;bran
>  
>  S = "${WORKDIR}/git"
>  
> -SRCREV = "f0694b5fcec997036ef7df4d382b28e833c8ebfd"
> -SRCREV_ti43x = "d0160ca810be30bf2b2e7681f5047933402efb52"
> -SRCREV_ti33x = "d0160ca810be30bf2b2e7681f5047933402efb52"
> +SRCREV_dra7xx = "f0694b5fcec997036ef7df4d382b28e833c8ebfd"
> +SRCREV = "d0160ca810be30bf2b2e7681f5047933402efb52"
>  
> -PR = "r20"
> +PR = "r21"
> -- 
> 2.7.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

