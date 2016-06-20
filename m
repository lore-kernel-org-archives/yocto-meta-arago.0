Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by arago-project.org (Postfix) with ESMTPS id 4308D5299F
	for <meta-arago@arago-project.org>;
	Mon, 20 Jun 2016 21:09:31 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u5KL9VD9026821
	for <meta-arago@arago-project.org>; Mon, 20 Jun 2016 16:09:31 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5KL9Uxl026351
	for <meta-arago@arago-project.org>; Mon, 20 Jun 2016 16:09:31 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 20 Jun 2016 16:09:29 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5KL9Tnt028179;
	Mon, 20 Jun 2016 16:09:29 -0500
Date: Mon, 20 Jun 2016 17:09:29 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20160620210929.GE2177@edge>
References: <1465821936-2658-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
In-Reply-To: <1465821936-2658-1-git-send-email-a0393906@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 1/3] gstreamer1.0-plugins-bad: Upgrade to 1.6.3
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
X-List-Received-Date: Mon, 20 Jun 2016 21:09:31 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jun 13, 2016 at 06:15:34PM +0530, Karthik Ramanan wrote:
> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  .../gstreamer1.0-plugins-bad_1.6.3.bbappend        | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
> 
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
> new file mode 100644
> index 0000000..79d4aa9
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
> @@ -0,0 +1,23 @@
> +PACKAGECONFIG = "faad"
> +
> +PACKAGECONFIG_append_omap-a15 = " ${@base_contains('DISTRO_FEATURES','wayland','wayland','',d)}"
> +
> +DEPENDS_append_omap-a15 = " \
> +    libdce \
> +    libdrm \
> +"

What about am3 and am4 support?


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
> +
> +PR = "r11"
> +
> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

What's the need for this? ^^^

-- 
Denys

