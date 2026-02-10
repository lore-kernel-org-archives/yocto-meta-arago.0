Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABDFDEB26F9
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 18:42:21 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.426.1770748934290528400
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 10 Feb 2026 10:42:14 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A512440C79;
	Tue, 10 Feb 2026 18:42:08 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bUm2tJWiJddf; Tue, 10 Feb 2026 18:42:08 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 33C16407DA;
	Tue, 10 Feb 2026 18:42:01 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id DAB3C178775; Tue, 10 Feb 2026 13:42:00 -0500 (EST)
Date: Tue, 10 Feb 2026 13:42:00 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Paresh Bhagat <p-bhagat@ti.com>
Cc: meta-arago@lists.yoctoproject.org, reatmon@ti.com, praneeth@ti.com,
	v-singh1@ti.com, y-hegde@ti.com, khasim@ti.com, j-sahu@ti.com
Subject: Re: [master][RFC PATCH v2 2/3] recipes-multimedia: Add wireplumber
 audio configuration
Message-ID: <20260210184200.GH11121@denix.org>
References: <20260210155201.3029549-1-p-bhagat@ti.com>
 <20260210155201.3029549-3-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210155201.3029549-3-p-bhagat@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 10 Feb 2026 18:42:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17101

On Tue, Feb 10, 2026 at 09:22:00PM +0530, Paresh Bhagat wrote:
> - Add set-audio-defaults.sh script for audio setup
> - Add set-audio-defaults.service systemd service
> - Add wireplumber_%.bbappend recipe extension
> 
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>  .../wireplumber/set-audio-defaults.service    | 14 +++++++++
>  .../wireplumber/set-audio-defaults.sh         | 30 +++++++++++++++++++
>  .../wireplumber/wireplumber_%.bbappend        | 27 +++++++++++++++++
>  3 files changed, 71 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.service
>  create mode 100755 meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.sh
>  create mode 100644 meta-arago-distro/recipes-multimedia/wireplumber/wireplumber_%.bbappend
> 
> diff --git a/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.service b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.service
> new file mode 100644
> index 00000000..b3874542
> --- /dev/null
> +++ b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.service
> @@ -0,0 +1,14 @@
> +[Unit]
> +Description=Set PipeWire Default Audio Devices
> +After=wireplumber.service
> +Requires=wireplumber.service
> +
> +[Service]
> +Type=oneshot
> +ExecStart=/usr/bin/set-audio-defaults.sh
> +StandardOutput=append:/var/log/set-audio-defaults-output.log
> +StandardError=append:/var/log/set-audio-defaults-error.log
> +RemainAfterExit=yes
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.sh b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.sh
> new file mode 100755
> index 00000000..83b89225
> --- /dev/null
> +++ b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.sh
> @@ -0,0 +1,30 @@
> +#!/bin/bash

You might want to consider making this script POSIX compatible avoiding any 
bashisms, if any, to not require bash as a dependency - it is GPLv3 and not 
everyone will be willing to add it to their product...


> +
> +# Wait for WirePlumber to be ready
> +for i in {1..30}; do
> +    wpctl status &>/dev/null && break
> +    sleep 1
> +done
> +
> +# Additional delay for nodes to appear
> +sleep 2
> +
> +# Find audio sink ID
> +SINK_ID=$(pw-cli info alsa_audio_sink 2>/dev/null | head -n 1 | awk '{print $2}')
> +if [[ -n "$SINK_ID" ]]; then
> +    wpctl set-default "$SINK_ID"
> +    echo "Set default sink to ID: $SINK_ID (alsa_audio_sink)"
> +else
> +    echo "Could not find alsa_audio_sink"
> +fi
> +
> +# Find audio source ID
> +SOURCE_ID=$(pw-cli info alsa_audio_source 2>/dev/null | head -n 1 | awk '{print $2}')
> +if [[ -n "$SOURCE_ID" ]]; then
> +    wpctl set-default "$SOURCE_ID"
> +    echo "Set default source to ID: $SOURCE_ID (alsa_audio_source)"
> +else
> +    echo "Could not find alsa_audio_source"
> +fi
> +
> +echo "Done"
> diff --git a/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber_%.bbappend b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber_%.bbappend
> new file mode 100644
> index 00000000..9a697aa1
> --- /dev/null
> +++ b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber_%.bbappend

Same comment about guarding the bbappend of an upstream recipe.


> @@ -0,0 +1,27 @@
> +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
> +
> +SRC_URI += " \
> +    file://set-audio-defaults.sh \
> +    file://set-audio-defaults.service \
> +"
> +
> +inherit systemd
> +
> +do_install:append() {
> +    # Install the script
> +    install -d ${D}${bindir}
> +    install -m 0755 ${WORKDIR}/sources/set-audio-defaults.sh ${D}${bindir}/

Same comment about UNPACKDIR


> +    # Install the systemd service file
> +    install -d ${D}${systemd_system_unitdir}
> +    install -m 0644 ${WORKDIR}/sources/set-audio-defaults.service ${D}${systemd_system_unitdir}/

And here


> +}
> +
> +RDEPENDS:${PN} += "bash"
> +SYSTEMD_PACKAGES = "${PN}"
> +SYSTEMD_SERVICE:${PN} = "set-audio-defaults.service"
> +SYSTEMD_AUTO_ENABLE:${PN} = "enable"
> +
> +FILES:${PN} += " \
> +    ${bindir} \
> +"
> -- 
> 2.34.1

