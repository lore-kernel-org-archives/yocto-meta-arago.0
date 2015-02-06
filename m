Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 8AB2052A72
	for <meta-arago@arago-project.org>;
	Fri,  6 Feb 2015 18:59:51 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t16IxonS031462
	for <meta-arago@arago-project.org>; Fri, 6 Feb 2015 12:59:50 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t16Ixnjg023985
	for <meta-arago@arago-project.org>; Fri, 6 Feb 2015 12:59:49 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 6 Feb 2015 12:59:49 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t16IxnOi010512;
	Fri, 6 Feb 2015 12:59:49 -0600
Date: Fri, 6 Feb 2015 13:59:48 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20150206185948.GA12366@edge>
References: <1423248896-20699-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1423248896-20699-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] branding-mcsdk: Adding MCSDK branding include file
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
X-List-Received-Date: Fri, 06 Feb 2015 18:59:51 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Feb 06, 2015 at 01:54:56PM -0500, Sam Nelson wrote:
> - To control preferred version and providers for MCSDK
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  .../conf/distro/include/branding-mcsdk.inc         |   20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 meta-arago-distro/conf/distro/include/branding-mcsdk.inc
> 
> diff --git a/meta-arago-distro/conf/distro/include/branding-mcsdk.inc b/meta-arago-distro/conf/distro/include/branding-mcsdk.inc
> new file mode 100644
> index 0000000..d023b67
> --- /dev/null
> +++ b/meta-arago-distro/conf/distro/include/branding-mcsdk.inc
> @@ -0,0 +1,20 @@
> +# MCSDK branding configuration
> +
> +# Use the MCSDK supported versions
> +PREFERRED_VERSION_libnl = "3.2.24"
> +
> +DISTRO_FEATURES += "x11 opengl"

I assume x11 is to make Java happy? I don't think you have x11 env...


> +# Java preferences.
> +#PREFERRED_VERSION_openjdk-7-jre = "25b30-2.3.12"
> +PREFERRED_VERSION_icedtea7-native = "2.1.3"
> +PREFERRED_PROVIDER_openjdk-7-jre = "openjdk-7-jre"
> +
> +PREFERRED_PROVIDER_virtual/java-initial = "cacao-initial"
> +
> +PREFERRED_PROVIDER_virtual/java-native = "jamvm-native"
> +PREFERRED_PROVIDER_virtual/javac-native = "ecj-bootstrap-native"
> +
> +PREFERRED_PROVIDER_jpeg-native = "jpeg-native"
> +#PREFERRED_PROVIDER_jpeg-native = "libjpeg-turbo-native"
> +PREFERRED_PROVIDER_glibc-gconv-iso8859-1 = "nativesdk-eglibc-locale"
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

