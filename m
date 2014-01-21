Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 3B2E1529AD
	for <meta-arago@arago-project.org>;
	Tue, 21 Jan 2014 15:55:31 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0LFtUAe005813
	for <meta-arago@arago-project.org>; Tue, 21 Jan 2014 09:55:30 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0LFtUwA002924
	for <meta-arago@arago-project.org>; Tue, 21 Jan 2014 09:55:30 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 21 Jan 2014 09:55:30 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0LFtUuX003129;
	Tue, 21 Jan 2014 09:55:30 -0600
Date: Tue, 21 Jan 2014 10:55:29 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Chase Maupin <Chase.Maupin@ti.com>
Message-ID: <20140121155529.GA30525@edge>
References: <1390324458-29919-1-git-send-email-Chase.Maupin@ti.com>
	<1390324458-29919-2-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
In-Reply-To: <1390324458-29919-2-git-send-email-Chase.Maupin@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 2/3] package-group-tisdk-matrix: add ts-calibrate-init
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
X-List-Received-Date: Tue, 21 Jan 2014 15:55:31 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jan 21, 2014 at 11:14:17AM -0600, Chase Maupin wrote:
> * Add the ts-calibrate-init package for everything except dra7xx
>   which does not require calibration for its touchscreen.
> 
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  .../packagegroup-arago-tisdk-matrix.bb             |   10 ++++++++--
>  1 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> index 220d77f..8a717ba 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Task to include Matrix v2"
>  LICENSE = "MIT"
> -PR = "r26"
> +PR = "r27"
>  
>  inherit packagegroup
>  
> @@ -49,6 +49,7 @@ MATRIX_APPS_append_omap3 = "        \
>      matrix-multimedia-demo-h264dec      \
>      matrix-multimedia-demo-mpeg4aacdec   \
>      matrix-multimedia-demo-mpeg4dec     \
> +    ts-calibrate-init \
>  "
>  
>  MATRIX_APPS_append_ti33x = "        \
> @@ -65,6 +66,7 @@ MATRIX_APPS_append_ti33x = "        \
>      matrix-gui-clocks               \
>                                      \
>      matrix-gui-wifi-demos           \
> +    ts-calibrate-init \
>  "
>  
>  MATRIX_APPS_append_ti43x = "        \
> @@ -78,8 +80,12 @@ MATRIX_APPS_append_ti43x = "        \
>      matrix-gui-generic-pm           \
>      matrix-gui-pm-demos-suspend     \
>      matrix-gui-clocks               \
> -                                    \
>      matrix-gui-wifi-demos           \
> +    ts-calibrate-init \
> +"
> +
> +MATRIX_APPS_append_omap5-evm = "     \
> +    ts-calibrate-init \

OMAP5 uEVM doesn't have touchscreen, does it?


>  "
>  
>  MATRIX_APPS_append_omap-a15 = "     \
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

