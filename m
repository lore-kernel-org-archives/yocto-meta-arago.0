Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 1F580529A7
	for <meta-arago@arago-project.org>;
	Mon,  4 May 2015 16:43:23 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t44GhMu1005696;
	Mon, 4 May 2015 11:43:22 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t44GhLbw005710;
	Mon, 4 May 2015 11:43:21 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 4 May 2015 11:43:20 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t44GhKX1010961;
	Mon, 4 May 2015 11:43:20 -0500
Date: Mon, 4 May 2015 12:43:20 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20150504164319.GD8462@edge>
References: <1430509560-4046-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1430509560-4046-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] gstreamer1.0-plugins-bad: only enable wayland flag conditionally on dra7xx
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
X-List-Received-Date: Mon, 04 May 2015 16:43:23 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Jake,

Do you see any issues or have any comments with this?


On Fri, May 01, 2015 at 03:46:00PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../gstreamer1.0-plugins-bad_1.2.3.bbappend        |    6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
> index d49da02..f2a38df 100644
> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
> @@ -1,6 +1,8 @@
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>  
> -PACKAGECONFIG = "faad ${@base_contains('DISTRO_FEATURES','wayland','wayland','',d)}"
> +PACKAGECONFIG = "faad"
> +
> +PACKAGECONFIG_append_dra7xx = " ${@base_contains('DISTRO_FEATURES','wayland','wayland','',d)}"
>  
>  DEPENDS_append_dra7xx = " \
>      libdce \
> @@ -16,4 +18,4 @@ SRC_URI_append = " \
>          file://0006-GstDRMBufferPool-support-fix.patch \
>  "
>  
> -PR_append = "-arago1"
> +PR_append = "-arago2"
> -- 
> 1.7.9.5
> 

