Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id B3987529AA
	for <meta-arago@arago-project.org>;
	Mon, 22 Oct 2012 14:29:02 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9MET2PJ029360
	for <meta-arago@arago-project.org>; Mon, 22 Oct 2012 09:29:02 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9MET2Ae007309
	for <meta-arago@arago-project.org>; Mon, 22 Oct 2012 09:29:02 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 22 Oct 2012 09:29:01 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q9MET1PQ000737;
	Mon, 22 Oct 2012 09:29:01 -0500
Date: Mon, 22 Oct 2012 10:29:01 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Chase Maupin <Chase.Maupin@ti.com>
Message-ID: <20121022142901.GI30921@edge>
References: <1350915617-32674-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
In-Reply-To: <1350915617-32674-1-git-send-email-Chase.Maupin@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] arago: set PREFERRED_PROVIDER for jpeg
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
X-List-Received-Date: Mon, 22 Oct 2012 14:29:02 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Oct 22, 2012 at 09:20:17AM -0500, Chase Maupin wrote:
> * Set the PREFERRED_PROVIDER for jpeg for armv5te devices and
>   libjpeg-turbo for all other devices.
> * The avoids the multiple providers error which causes the build
>   to return a non-zero return value.
> 
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>

Acked-by: Denys Dmytriyenko <denys@ti.com>

> ---
>  meta-arago-distro/conf/distro/arago.conf |    6 ++++++
>  1 files changed, 6 insertions(+), 0 deletions(-)
> 
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> index dbb9671..17270a0 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -45,6 +45,12 @@ PREFERRED_VERSION_hostap-daemon = "0.7.3+0.8.0-rc-ti"
>  # Pin down udev version from oe-core, as meta-oe pulls in newer systemd-enhanced version
>  PREFERRED_VERSION_udev = "164"
>  
> +# Set the PREFERRED_PROVIDER for jpeg functionality based on the MACHINE
> +# architecture.  For armv7a devices libjpeg-turbo should be used to take
> +# advantage of the SIMD instructions.
> +PREFERRED_PROVIDER_jpeg = "libjpeg-turbo"
> +PREFERRED_PROVIDER_jpeg_armv5te = "jpeg"
> +
>  # Disable polkit's systemd configuration from meta-oe
>  POLKITAUTH = ""
>  
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

