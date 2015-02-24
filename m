Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 44C50529D9
	for <meta-arago@arago-project.org>;
	Tue, 24 Feb 2015 21:13:18 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1OLDHLV024722
	for <meta-arago@arago-project.org>; Tue, 24 Feb 2015 15:13:17 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1OLDGDo020906
	for <meta-arago@arago-project.org>; Tue, 24 Feb 2015 15:13:16 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 24 Feb 2015 15:13:16 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1OLDGvw003395;
	Tue, 24 Feb 2015 15:13:16 -0600
Date: Tue, 24 Feb 2015 16:13:15 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20150224211315.GE4338@edge>
References: <1423823436-21007-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
In-Reply-To: <1423823436-21007-1-git-send-email-a0393906@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [RFC PATCH - USB DRD] udev: Add rules for DRD usecase
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
X-List-Received-Date: Tue, 24 Feb 2015 21:13:18 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Feb 13, 2015 at 04:00:36PM +0530, Karthik Ramanan wrote:
> For the DRD usecase when switching from host to device mode
> some commands have to be executed manually. These script
> additions facilatate this to happen automatically.

The patch seems fine, but why do you add an extra line at the end of every 
file?


> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  .../recipes-core/udev/udev/local.rules             |    2 ++
>  .../recipes-core/udev/udev/usb1-rules.sh           |    4 ++++
>  .../recipes-core/udev/udev/usb2-rules.sh           |    4 ++++
>  .../recipes-core/udev/udev_182.bbappend            |   14 +++++++++++++-
>  4 files changed, 23 insertions(+), 1 deletion(-)
>  create mode 100755 meta-arago-distro/recipes-core/udev/udev/usb1-rules.sh
>  create mode 100755 meta-arago-distro/recipes-core/udev/udev/usb2-rules.sh
> 
> diff --git a/meta-arago-distro/recipes-core/udev/udev/local.rules b/meta-arago-distro/recipes-core/udev/udev/local.rules
> index 45c3a46..689e093 100644
> --- a/meta-arago-distro/recipes-core/udev/udev/local.rules
> +++ b/meta-arago-distro/recipes-core/udev/udev/local.rules
> @@ -22,3 +22,5 @@ SUBSYSTEM=="input", KERNEL=="event[0-9]*", ENV{ID_INPUT_TOUCHSCREEN}=="1", SYMLI
>  # Auto-mount any SD cards
>  ACTION=="add", KERNEL=="mmcblk[0-9]p[0-9]", SUBSYSTEM=="block", RUN+="/etc/udev/scripts/mount.sh"
>  ACTION=="remove", KERNEL=="mmcblk[0-9]p[0-9]", SUBSYSTEM=="block", RUN+="/etc/udev/scripts/mount.sh"
> +ACTION=="add", DEVPATH=="/devices/44000000\.ocp/48880000\.omap_dwc3_1/48890000\.usb/udc*", RUN+="/usr/bin/usb1-rules.sh"
> +ACTION=="add", DEVPATH=="/devices/44000000\.ocp/488c0000\.omap_dwc3_2/488d0000\.usb/udc*", RUN+="/usr/bin/usb2-rules.sh"
> diff --git a/meta-arago-distro/recipes-core/udev/udev/usb1-rules.sh b/meta-arago-distro/recipes-core/udev/udev/usb1-rules.sh
> new file mode 100755
> index 0000000..8a49cf1
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/udev/udev/usb1-rules.sh
> @@ -0,0 +1,4 @@
> +#!bin/sh
> +/sbin/modprobe g_ncm -r
> +/sbin/modprobe g_ncm
> +
> diff --git a/meta-arago-distro/recipes-core/udev/udev/usb2-rules.sh b/meta-arago-distro/recipes-core/udev/udev/usb2-rules.sh
> new file mode 100755
> index 0000000..38a8894
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/udev/udev/usb2-rules.sh
> @@ -0,0 +1,4 @@
> +#!bin/sh
> +/sbin/modprobe g_zero -r
> +/sbin/modprobe g_zero
> +
> diff --git a/meta-arago-distro/recipes-core/udev/udev_182.bbappend b/meta-arago-distro/recipes-core/udev/udev_182.bbappend
> index 838cce8..684f501 100644
> --- a/meta-arago-distro/recipes-core/udev/udev_182.bbappend
> +++ b/meta-arago-distro/recipes-core/udev/udev_182.bbappend
> @@ -5,4 +5,16 @@
>  # look for files in this layer first
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>  
> -PR_append = "-arago2"
> +PR_append = "-arago3"
> +
> +SRC_URI_append = " \
> +                  file://usb1-rules.sh \
> +                  file://usb2-rules.sh"
> +
> +do_install_append() {
> +    install -d ${D}/${bindir}
> +
> +    install -m 0755 ${WORKDIR}/usb1-rules.sh ${D}${bindir}/usb1-rules.sh
> +    install -m 0755 ${WORKDIR}/usb2-rules.sh ${D}${bindir}/usb2-rules.sh
> +}
> +
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

