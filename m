Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by arago-project.org (Postfix) with ESMTP id 18C5752981
	for <meta-arago@arago-project.org>;
	Tue, 14 May 2013 18:36:23 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MMS001CGX0MX760@vms173003.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 14 May 2013 13:36:22 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 02E8420087; Tue,
	14 May 2013 14:36:21 -0400 (EDT)
Date: Tue, 14 May 2013 14:36:21 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-id: <20130514183621.GH31835@denix.org>
References: <1368400388-28708-1-git-send-email-fcooper@ti.com>
MIME-version: 1.0
In-reply-to: <1368400388-28708-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 1/3 v2] ltp-ddt-legacy-1.0: Add ltp-ddt recipe that supports 3.2 or older kernels
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
X-List-Received-Date: Tue, 14 May 2013 18:36:23 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Ok, entire set looks good. I'll push it later. Thanks.

-- 
Denys


On Sun, May 12, 2013 at 06:13:06PM -0500, Franklin S. Cooper Jr wrote:
> * Ltp-ddt master is now targeting 3.8+ kernels.
> * This recipe points to the v3.2 branch meant for legacy kernels.
> ---
> Changes since v2:
> Split patch into small patches
> Add package to R_* variables
>  
> .../conf/distro/include/arago-prefs.inc            |    3 +++
>  .../recipes-devtools/ltp-ddt/ltp-ddt-legacy_1.0.bb |   14 ++++++++++++++
>  2 files changed, 17 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt-legacy_1.0.bb
> 
> diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> index 6f60a5e..611ae6e 100644
> --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> @@ -1,3 +1,6 @@
> +# Use the latest version of ltp-ddt for kernel versions 3.8+
> +PREFERRED_PROVIDER_ltp-ddt = "ltp-ddt"
> +
>  PREFERRED_PROVIDER_virtual/gettext = "gettext"
>  
>  ARAGO_QT_PROVIDER = "${@base_contains('MACHINE_FEATURES','sgx','qt4-embedded-gles','qt4-embedded',d)}"
> diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt-legacy_1.0.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt-legacy_1.0.bb
> new file mode 100644
> index 0000000..af5aa1b
> --- /dev/null
> +++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt-legacy_1.0.bb
> @@ -0,0 +1,14 @@
> +# The master branch is now 3.2+ kernels.
> +# This recipe is meant to use the v3.2 that supports 3.2 and older kernels.
> +
> +require recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb
> +
> +PROVIDES += "ltp-ddt"
> +RPROVIDES_${PN} += "ltp-ddt"
> +RREPLACES_${PN} += "ltp-ddt"
> +RCONFLICTS_${PN} += "ltp-ddt"
> +
> +PR := "${PR}.0"
> +
> +SRCREV = "1973c7e79f2ad1b595d5d1687db828f3f3998387"
> +BRANCH = "v3.2"
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

