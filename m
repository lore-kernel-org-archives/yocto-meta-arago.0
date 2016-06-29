Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id D263C52A96
	for <meta-arago@arago-project.org>;
	Wed, 29 Jun 2016 13:52:55 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u5TDplbe010018
	for <meta-arago@arago-project.org>; Wed, 29 Jun 2016 08:51:47 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5TDqt7h022124
	for <meta-arago@arago-project.org>; Wed, 29 Jun 2016 08:52:55 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 29 Jun 2016 08:52:55 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5TDqtVX006414;
	Wed, 29 Jun 2016 08:52:55 -0500
Date: Wed, 29 Jun 2016 09:52:54 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20160629135254.GA24597@edge>
References: <1467040331-32223-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
In-Reply-To: <1467040331-32223-1-git-send-email-a0393906@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH V2 1/3] gstreamer1.0-plugins-bad: Upgrade to 1.6.3
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
X-List-Received-Date: Wed, 29 Jun 2016 13:52:56 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks! I'll give it a try later today.


On Mon, Jun 27, 2016 at 08:42:09PM +0530, Karthik Ramanan wrote:
> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  .../gstreamer1.0-plugins-bad_1.6.3.bbappend        | 42 ++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
> 
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
> new file mode 100644
> index 0000000..fbc614a
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
> @@ -0,0 +1,42 @@
> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> +
> +PACKAGECONFIG = "faad"
> +
> +# gstreamer is now also included on Keystone, be mindful of any Graphics dependencies
> +PACKAGECONFIG_append_omap-a15 = " ${@bb.utils.contains('DISTRO_FEATURES','wayland','wayland','',d)}"
> +PACKAGECONFIG_append_ti43x = " ${@bb.utils.contains('DISTRO_FEATURES','wayland','wayland','',d)}"
> +PACKAGECONFIG_append_ti33x = " ${@bb.utils.contains('DISTRO_FEATURES','wayland','wayland','',d)}"
> +
> +DEPENDS_append_omap-a15 = " \
> +    libdce \
> +    libdrm \
> +"
> +
> +DEPENDS_append_ti43x = " \
> +    libdrm \
> +"
> +
> +DEPENDS_append_ti33x = " \
> +    libdrm \
> +"
> +
> +SRC_URI_append_ti43x = " \
> +"
> +
> +SRC_URI_append_ti33x = " \
> +"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +BRANCH ?= "master"
> +
> +SRC_URI = "git://git.ti.com/glsdk/gstreamer1-0-plugins-bad.git;protocol=git;branch=${BRANCH} \
> +          "
> +
> +S = "${WORKDIR}/git"
> +
> +SRCREV = "6c0aa1c20dae00ecfe8b4ca382274db3ea42f1e0"
> +SRCREV_ti43x = "d0160ca810be30bf2b2e7681f5047933402efb52"
> +SRCREV_ti33x = "d0160ca810be30bf2b2e7681f5047933402efb52"
> +
> +PR = "r11"
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

