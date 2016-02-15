Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 965BB52982
	for <meta-arago@arago-project.org>;
	Mon, 15 Feb 2016 18:56:15 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1FIuFj2027526
	for <meta-arago@arago-project.org>; Mon, 15 Feb 2016 12:56:15 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1FIuEGd014611
	for <meta-arago@arago-project.org>; Mon, 15 Feb 2016 12:56:15 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 15 Feb 2016 12:56:14 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1FIuEen021335;
	Mon, 15 Feb 2016 12:56:14 -0600
Date: Mon, 15 Feb 2016 13:55:58 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20160215185558.GF31480@edge>
References: <1455561794-2206-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1455561794-2206-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 1/2] arago.conf: Remove qtwayland from opencv PACKAGECONFIG for keystone
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
X-List-Received-Date: Mon, 15 Feb 2016 18:56:15 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

This alters package configuration based on machine/soc w/o making the package 
machine-specific, resulting in a conflict or package rebuild and checksum 
mismatch...

-- 
Denys


On Mon, Feb 15, 2016 at 01:43:13PM -0500, Jacob Stiffler wrote:
> * keystone machines do not have a display, hence they do not support
>   wayland
> * opencv adds qtwayland support since wayland is in DISTRO_FEATURES
> * Remove qtwayland from opencv PACKAGECONFIG for keystone machines
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  meta-arago-distro/conf/distro/arago.conf | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> index 325e112..38c7887 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -58,6 +58,9 @@ PACKAGECONFIG_append_pn-qtmultimedia  = " gstreamer"
>  # Prefer OpenSSL over GnuTLS for curl due to TSU exemptions
>  PACKAGECONFIG_pn-curl = "${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6", "", d)} ssl zlib"
>  
> +# Remove qtwayland from openvcv PACKAGECONFIG for keystone
> +PACKAGECONFIG_remove_pn-opencv_keystone = "qtwayland"
> +
>  # Enable UI and scripting for perf
>  PERF_FEATURES_ENABLE ?= "perf-scripting perf-tui"
>  
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

