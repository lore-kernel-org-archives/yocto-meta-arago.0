Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BB49E9D40A
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 16:25:38 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24541.1770222335393354708
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 04 Feb 2026 08:25:36 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 92FD540C85;
	Wed,  4 Feb 2026 16:25:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bs1BnOPT_hCw; Wed,  4 Feb 2026 16:25:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 48E9040B13;
	Wed,  4 Feb 2026 16:25:31 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A0B3C178505; Wed,  4 Feb 2026 11:25:30 -0500 (EST)
Date: Wed, 4 Feb 2026 11:25:30 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: j-sahu@ti.com
Cc: meta-arago@lists.yoctoproject.org, Ryan Eatmon <reatmon@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [meta-arago][master][PATCH v2] pulseaudio-service: Add systemd
 service for system-wide audio daemon
Message-ID: <20260204162530.GZ11121@denix.org>
References: <20260204160813.2393421-1-j-sahu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204160813.2393421-1-j-sahu@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 04 Feb 2026 16:25:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17080

On Wed, Feb 04, 2026 at 09:38:13PM +0530, Jeevan via lists.yoctoproject.org wrote:
> Add a systemd service to run PulseAudio in system mode where multiple
> applications need audio access without user sessions. Depends on
> pulseaudio-server to ensure audio/pulse groups exist.
> 
> Enable this service by default to provide system-wide audio for all
> applications.
> 
> Signed-off-by: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
> ---
> Changes in v2: Add SUMMARY, PV and PR.
> 
>  .../pulseaudio/files/pulseaudio.service       | 11 ++++++
>  .../pulseaudio/pulseaudio-service.bb          | 39 +++++++++++++++++++
>  2 files changed, 50 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-multimedia/pulseaudio/files/pulseaudio.service
>  create mode 100644 meta-arago-extras/recipes-multimedia/pulseaudio/pulseaudio-service.bb
> 
> diff --git a/meta-arago-extras/recipes-multimedia/pulseaudio/files/pulseaudio.service b/meta-arago-extras/recipes-multimedia/pulseaudio/files/pulseaudio.service
> new file mode 100644
> index 00000000..1d3ac435
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/pulseaudio/files/pulseaudio.service
> @@ -0,0 +1,11 @@
> +[Unit]
> +Description=PulseAudio Sound System
> +After=alsa-restore.service
> +
> +[Service]
> +BusName=org.pulseaudio.Server
> +ExecStart=/usr/bin/pulseaudio --system
> +Restart=always
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/meta-arago-extras/recipes-multimedia/pulseaudio/pulseaudio-service.bb b/meta-arago-extras/recipes-multimedia/pulseaudio/pulseaudio-service.bb
> new file mode 100644
> index 00000000..5ce849fc
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/pulseaudio/pulseaudio-service.bb
> @@ -0,0 +1,39 @@
> +SUMMARY = "PulseAudio systemd service for system-wide audio"
> +DESCRIPTION = "Systemd service to run PulseAudio in system mode for embedded systems"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> +
> +PV = "1.0"
> +PR = "r0"

These days PR is managed automatically, so it is advised against tweaking it 
manually.


> +inherit ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}
> +inherit useradd
> +
> +DEPENDS = "pulseaudio"
> +
> +# Ensure pulseaudio-server is installed to create audio group
> +RDEPENDS:${PN} = "pulseaudio-server"
> +
> +SRC_URI = "\
> +    file://pulseaudio.service \
> +"
> +
> +S = "${UNPACKDIR}"
> +
> +SYSTEMD_PACKAGES = "${PN}"
> +SYSTEMD_SERVICE:${PN} = "pulseaudio.service"
> +SYSTEMD_AUTO_ENABLE:${PN} = "disable"
> +
> +FILES:${PN} = " \
> +    ${systemd_system_unitdir}/pulseaudio.service \
> +"
> +
> +USERADD_PACKAGES = "${PN}"
> +GROUPMEMS_PARAM:${PN} = "--add root --group audio"
> +
> +do_install() {
> +    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> +        install -d ${D}${systemd_system_unitdir}
> +        install -m 0644 ${S}/pulseaudio.service ${D}${systemd_system_unitdir}/
> +    fi
> +}
> -- 
> 2.34.1

