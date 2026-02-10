Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3D59EB26F8
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 18:36:31 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.323.1770748586543854370
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 10 Feb 2026 10:36:27 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A68C0407DA;
	Tue, 10 Feb 2026 18:36:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7HzjkMO61PLV; Tue, 10 Feb 2026 18:36:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3EFAB40C79;
	Tue, 10 Feb 2026 18:36:05 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 5D117178775; Tue, 10 Feb 2026 13:36:04 -0500 (EST)
Date: Tue, 10 Feb 2026 13:36:04 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Paresh Bhagat <p-bhagat@ti.com>
Cc: meta-arago@lists.yoctoproject.org, reatmon@ti.com, praneeth@ti.com,
	v-singh1@ti.com, y-hegde@ti.com, khasim@ti.com, j-sahu@ti.com
Subject: Re: [master][RFC PATCH v2 1/3] recipes-multimedia: Add pipewire
 configuration files
Message-ID: <20260210183604.GG11121@denix.org>
References: <20260210155201.3029549-1-p-bhagat@ti.com>
 <20260210155201.3029549-2-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210155201.3029549-2-p-bhagat@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 10 Feb 2026 18:36:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17100

On Tue, Feb 10, 2026 at 09:21:59PM +0530, Paresh Bhagat wrote:
> - Add 90-pipewire-sink.conf and 91-pipewire-source.conf for stereo AM62*
>   audio playback and capture.
> - Add 90-pipewire-sink.conf and 91-pipewire-source.conf for 8 channel
>   audio playback and capture.
> - Add pipewire_%.bbappend recipe extension
> 
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>  .../pipewire/pipewire/90-pipewire-sink.conf   | 19 +++++++++++++++++++
>  .../pipewire/pipewire/91-pipewire-source.conf | 19 +++++++++++++++++++
>  .../am62dxx-evm/90-pipewire-sink.conf         | 19 +++++++++++++++++++
>  .../am62dxx-evm/91-pipewire-source.conf       | 19 +++++++++++++++++++
>  .../pipewire/pipewire_%.bbappend              | 17 +++++++++++++++++
>  5 files changed, 93 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/90-pipewire-sink.conf
>  create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/91-pipewire-source.conf
>  create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf
>  create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf
>  create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire_%.bbappend
> 
> diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire/90-pipewire-sink.conf b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/90-pipewire-sink.conf
> new file mode 100644
> index 00000000..72562018
> --- /dev/null
> +++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/90-pipewire-sink.conf
> @@ -0,0 +1,19 @@
> +# Pipeeire sink configuration for AM62x, AM62A, AM62P and other AM62 variants (excluding AM62D).
> +
> +context.objects = [
> +    {
> +        factory = adapter
> +        args = {
> +            factory.name     = api.alsa.pcm.sink
> +            node.name        = "alsa_audio_sink"
> +            node.description = "Generic Audio Output"
> +            media.class      = "Audio/Sink"
> +
> +            api.alsa.path = "hw:0,0"
> +            api.alsa.disable-mmap = true
> +
> +            audio.channels = 2
> +            audio.position = [ FL FR ]
> +        }
> +    }
> +]
> diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire/91-pipewire-source.conf b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/91-pipewire-source.conf
> new file mode 100644
> index 00000000..2079746e
> --- /dev/null
> +++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/91-pipewire-source.conf
> @@ -0,0 +1,19 @@
> +# Pipewire source configuration for AM62x, AM62A, AM62P and other AM62 variants (excluding AM62D).
> +
> +context.objects = [
> +    {
> +        factory = adapter
> +        args = {
> +            factory.name     = api.alsa.pcm.source
> +            node.name        = "alsa_audio_source"
> +            node.description = "Generic Audio Capture"
> +            media.class      = "Audio/Source"
> +
> +            api.alsa.path = "hw:0,0"
> +            api.alsa.disable-mmap = true
> +
> +            audio.channels = 2
> +            audio.position = [ FL FR ]
> +        }
> +    }
> +]
> diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf
> new file mode 100644
> index 00000000..9251a2d3
> --- /dev/null
> +++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf

Should the file be inside am62dxx/ instead of am62dxx-evm/ to apply to all 
AM62D machines, not just the EVM?


> @@ -0,0 +1,19 @@
> +# Pipewire source configuration for AM62D.
> +
> +context.objects = [
> +    {
> +        factory = adapter
> +        args = {
> +            factory.name     = api.alsa.pcm.sink
> +            node.name        = "alsa_audio_sink"
> +            node.description = "Multi-DAC 8ch Output"
> +            media.class      = "Audio/Sink"
> +
> +            api.alsa.path = "hw:0,0"
> +            api.alsa.disable-mmap = true
> +
> +            audio.channels = 8
> +            audio.position = [ FL FR FC LFE RL RR SL SR ]
> +        }
> +    }
> +]
> diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf
> new file mode 100644
> index 00000000..36112dc5
> --- /dev/null
> +++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf

Same comment.


> @@ -0,0 +1,19 @@
> +# Pipewire source configuration for AM62D.
> +
> +context.objects = [
> +    {
> +        factory = adapter
> +        args = {
> +            factory.name     = api.alsa.pcm.source
> +            node.name        = "alsa_audio_source"
> +            node.description = "ALSA 8ch Capture"
> +            media.class      = "Audio/Source"
> +
> +            api.alsa.path = "hw:0,0"
> +            api.alsa.disable-mmap = true
> +
> +            audio.channels = 8
> +            audio.position = [ FL FR FC LFE RL RR SL SR ]
> +        }
> +    }
> +]
> diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire_%.bbappend b/meta-arago-distro/recipes-multimedia/pipewire/pipewire_%.bbappend
> new file mode 100644
> index 00000000..fdce686c
> --- /dev/null
> +++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire_%.bbappend

Any bbappend for upstream recipes should be properly guarded for YP Compat.


> @@ -0,0 +1,17 @@
> +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
> +
> +SRC_URI:append = " \
> +    file://90-pipewire-sink.conf \
> +    file://91-pipewire-source.conf \
> +"
> +
> +do_install:append() {
> +    install -d ${D}${sysconfdir}/pipewire/pipewire.conf.d
> +    install -m 0644 ${WORKDIR}/sources/90-pipewire-sink.conf ${D}${sysconfdir}/pipewire/pipewire.conf.d/
> +    install -m 0644 ${WORKDIR}/sources/91-pipewire-source.conf ${D}${sysconfdir}/pipewire/pipewire.conf.d/

In master, please use ${UNPACKDIR} instead of ${WORKDIR}/sources


> +}
> +
> +FILES:${PN} += " ${sysconfdir}"
> +
> +PACKAGECONFIG:append:pn-pipewire = " pipewire-jack"
> +PACKAGECONFIG:remove:pn-pipewire = "jack"

This syntax I gave you in the beginning was meant for the arago.conf global 
distro configuration, where you need to specify :pn-pipewire - if you are 
making these changes locally in this bbappend, then you don't need the package 
specifying override...


