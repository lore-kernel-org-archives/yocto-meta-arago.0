Return-Path: <j-sahu@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F5D2C982CF
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 12:17:02 +0000 (UTC)
Subject: Re: [master/wrynose][PATCH v2 2/4] recipes-multimedia: Add PipeWire bbappend, service and config files
To: meta-arago@lists.yoctoproject.org
From: "Jeevan" <j-sahu@ti.com>
X-Originating-Location: Bengaluru, Karnataka, IN (103.146.116.10)
X-Originating-Platform: Linux Chrome 152
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 17 Sep 2026 05:16:59 -0700
References: <20260916160547.1287287-1-p-bhagat@ti.com> <20260916160547.1287287-3-p-bhagat@ti.com>
In-Reply-To: <20260916160547.1287287-3-p-bhagat@ti.com>
Message-ID: <681846.1789647419422393550@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 17 Sep 2026 12:17:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17684

On Wed, Sep 16, 2026 at 09:37 PM, Paresh Bhagat wrote:

>
> Extend the PipeWire recipe to add platform-specific ALSA configuration
> and service file. Service file added to start PipeWire as a system
> service with proper socket dependency.
>=20
> Add sink and source configuration for 8-channel audio playback and
> capture on the AM62D2EVM as the default configuration is 2-channel.
>=20
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>  .../pipewire/pipewire-arago.inc               | 28 +++++++++++++++++++
>  .../am62dxx-evm/90-pipewire-sink.conf         | 17 +++++++++++
>  .../am62dxx-evm/91-pipewire-source.conf       | 17 +++++++++++
>  .../pipewire/pipewire/pipewire.service        | 26 +++++++++++++++++
>  .../pipewire/pipewire_%.bbappend              |  4 +++
>  5 files changed, 92 insertions(+)
>  create mode 100644
> meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago.inc
>  create mode 100644
> meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pip=
ewire-sink.conf
>  create mode 100644
> meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pip=
ewire-source.conf
>  create mode 100644
> meta-arago-distro/recipes-multimedia/pipewire/pipewire/pipewire.service
>  create mode 100644
> meta-arago-distro/recipes-multimedia/pipewire/pipewire_%.bbappend
>=20
> diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago=
.inc
> b/meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago.inc
> new file mode 100644
> index 00000000..6545c364
> --- /dev/null
> +++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago.inc
> @@ -0,0 +1,28 @@
> +PR:append =3D ".arago1"
> +
> +FILESEXTRAPATHS:prepend :=3D "${THISDIR}/pipewire:"
> +SRC_URI:append =3D " file://pipewire.service"
> +
> +# AM62D-specific config files
> +SRC_URI:append:am62dxx-evm =3D " \
> +    file://90-pipewire-sink.conf \
> +    file://91-pipewire-source.conf \
> +"

Is it okay to have AM62D-specific PipeWire and WirePlumber configuration fi=
les, scripts, and services
in meta-arago or set somewhere else? Ryan/Denys any thoughts?
My recommendation would be to have a more generic/runtime-detectable config=
s that is device agnostic.


> +
> +do_install:append() {
> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false=
',
> d)}; then
> +        install -d ${D}${systemd_system_unitdir}
> +        install -m 0644 ${UNPACKDIR}/pipewire.service
> ${D}${systemd_system_unitdir}/
> +    fi
> +}
> +
> +do_install:append:am62dxx-evm() {
> +    install -d ${D}${sysconfdir}/pipewire/pipewire.conf.d
> +    install -m 0644 ${UNPACKDIR}/90-pipewire-sink.conf
> ${D}${sysconfdir}/pipewire/pipewire.conf.d/
> +    install -m 0644 ${UNPACKDIR}/91-pipewire-source.conf
> ${D}${sysconfdir}/pipewire/pipewire.conf.d/
> +}
> +
> +FILES:${PN} +=3D " ${sysconfdir}"
> +
> +PACKAGECONFIG:append =3D " pipewire-jack"
> +PACKAGECONFIG:remove =3D "jack"
> diff --git
> b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-p=
ipewire-sink.conf
> new file mode 100644
> index 00000000..f22ed291
> --- /dev/null
> +++
> b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-p=
ipewire-sink.conf
> @@ -0,0 +1,17 @@
> +# PipeWire source configuration for AM62D.
> +
> +context.objects =3D [
> +    {
> +        factory =3D adapter
> +        args =3D {
> +            factory.name           =3D api.alsa.pcm.sink
> +            node.name              =3D "alsa_audio_sink"
> +            node.description       =3D "Audio Output"
> +            media.class            =3D "Audio/Sink"
> +            api.alsa.path          =3D "hw:AM62D2EVM,0"
> +            audio.rate             =3D 48000
> +            audio.channels         =3D 8
> +            audio.position         =3D [ FL FR FC LFE RL RR SL SR ]
> +        }
> +    }
> +]
> diff --git
> b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-p=
ipewire-source.conf
> new file mode 100644
> index 00000000..ac7635de
> --- /dev/null
> +++
> b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-p=
ipewire-source.conf
> @@ -0,0 +1,17 @@
> +# PipeWire source configuration for AM62D.
> +
> +context.objects =3D [
> +    {
> +        factory =3D adapter
> +        args =3D {
> +            factory.name           =3D api.alsa.pcm.source
> +            node.name              =3D "alsa_audio_source"
> +            node.description       =3D "Audio Input"
> +            media.class            =3D "Audio/Source"
> +            api.alsa.path          =3D "hw:AM62D2EVM,0"
> +            audio.rate             =3D 48000
> +            audio.channels         =3D 8
> +            audio.position         =3D [ FL FR FC LFE RL RR SL SR ]
> +        }
> +    }
> +]
> diff --git
> a/meta-arago-distro/recipes-multimedia/pipewire/pipewire/pipewire.service
> b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/pipewire.service
> new file mode 100644
> index 00000000..c26bf93f
> --- /dev/null
> +++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/pipewire.ser=
vice
> @@ -0,0 +1,26 @@
> +[Unit]
> +Description=3DPipeWire Multimedia Service
> +# Ensure kernel modules are loaded and udev has finished device processi=
ng
> +After=3Dsystemd-modules-load.service systemd-udev-settle.service
> +
> +Requires=3Dpipewire.socket
> +
> +[Service]
> +LockPersonality=3Dyes
> +MemoryDenyWriteExecute=3Dyes
> +NoNewPrivileges=3Dyes
> +SystemCallArchitectures=3Dnative
> +SystemCallFilter=3D@system-service
> +Type=3Dsimple
> +AmbientCapabilities=3DCAP_SYS_NICE
> +ExecStart=3D/usr/bin/pipewire
> +Restart=3Don-failure
> +RestartSec=3D2
> +RuntimeDirectory=3Dpipewire
> +RuntimeDirectoryPreserve=3Dyes
> +User=3Dpipewire
> +Environment=3DPIPEWIRE_RUNTIME_DIR=3D%t/pipewire
> +
> +[Install]
> +Also=3Dpipewire.socket pipewire-manager.socket
> +WantedBy=3Ddefault.target
> \ No newline at end of file
> diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire_%.bba=
ppend
> b/meta-arago-distro/recipes-multimedia/pipewire/pipewire_%.bbappend
> new file mode 100644
> index 00000000..dc32422b
> --- /dev/null
> +++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire_%.bbappend
> @@ -0,0 +1,4 @@
> +PIPEWIRE_ARAGO =3D ""
> +PIPEWIRE_ARAGO:arago =3D "pipewire-arago.inc"
> +
> +require ${PIPEWIRE_ARAGO}
> --=20
> 2.34.1
>=20
>

