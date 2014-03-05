Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 770415208C
	for <meta-arago@arago-project.org>;
	Wed,  5 Mar 2014 03:06:38 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s2536aBo002692
	for <meta-arago@arago-project.org>; Tue, 4 Mar 2014 21:06:36 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s2536a5R011305
	for <meta-arago@arago-project.org>; Tue, 4 Mar 2014 21:06:36 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 4 Mar 2014 21:06:36 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s2536aKi013627;
	Tue, 4 Mar 2014 21:06:36 -0600
Date: Tue, 4 Mar 2014 22:06:36 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20140305030635.GT22125@edge>
References: <1393802295-7212-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1393802295-7212-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] arago.conf: Update preferred version of binutils to 2.23.1
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
X-List-Received-Date: Wed, 05 Mar 2014 03:06:39 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

What are you strying to fix here? Moreover, arago.conf is not the right place 
for that...


On Sun, Mar 02, 2014 at 06:18:15PM -0500, Sam Nelson wrote:
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> 
> ---
> - 2.23.1 is available in oe-core/meta/recipes-devtools/binutils/binutils_2.23.1.bb
> ---
> ---
>  meta-arago-distro/conf/distro/arago.conf |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> index 76254f2..a789e89 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -70,3 +70,5 @@ LICENSE_FLAGS_WHITELIST = "commercial_gst-ffmpeg"
>  PACKAGE_ARCH := "${TUNE_PKGARCH}-${PREFERRED_VERSION_linux-libc-headers}"
>  # Need to include the new PACKAGE_ARCH to the PACKAGE_ARCHS variable
>  PACKAGE_ARCHS += "${TUNE_PKGARCH}-${PREFERRED_VERSION_linux-libc-headers}"
> +
> +PREFERRED_VERSION_binutils = "2.23.1"
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

