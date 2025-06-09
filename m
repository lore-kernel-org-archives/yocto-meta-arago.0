Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B868C5B552
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 11:18:35 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.56815.1749467906425793533
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 09 Jun 2025 04:18:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=NzyOf0bq;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: c-shilwant@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 559BIPqe1974529;
	Mon, 9 Jun 2025 06:18:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749467905;
	bh=HRicbnSmCSCow8LGs+wF+Ew9VQLf5FQdDXw4bXJoAtM=;
	h=Date:Subject:To:References:From:CC:In-Reply-To;
	b=NzyOf0bqA0GKygJO3qZcQoF5syULA8iz48if6seZdg617dpI7STAlFUROD9bsl7PR
	 HuyfHJc7XcZCv0wEKo+enqEwxQR7KsBdSyvRAYRaI50X/SdX7bHuTPrGnx9xbTIluZ
	 HgdvKhnYybxS1e3JeJFOab+HuqNvgKlgGhTe78iA=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 559BIPjK1337037
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 9 Jun 2025 06:18:25 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 9
 Jun 2025 06:18:24 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 9 Jun 2025 06:18:24 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 559BIMEm1179431;
	Mon, 9 Jun 2025 06:18:22 -0500
Message-ID: <a7ea22ba-4779-46a0-9ce5-cb3ab2477e1d@ti.com>
Date: Mon, 9 Jun 2025 16:48:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [oe-layersetup][master][PATCH 2/2]
 configs/arago-scarthgap-*: Add meta-lts-mixins scarthgap/rust
To: <meta-arago@lists.yoctoproject.org>
References: <20250604150250.6187-1-reatmon@ti.com>
 <20250604150250.6187-2-reatmon@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>, <reatmon@ti.com>,
        Andrew Davis <afd@ti.com>, <j-sahu@ti.com>
In-Reply-To: <20250604150250.6187-2-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 09 Jun 2025 11:18:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16258

Hi Ryan,

On 04/06/25 20:32, Ryan Eatmon via lists.yoctoproject.org wrote:
> We are needing the latest version of rust for our Chromium builds, start
> using the mixin layer to pull it in.


If the intention was to pull in meta-lts-mixins only for chromium builds
then shouldn't we enable it only in those configs where meta-browser
is enabled?

Most of the configs like arago-scarthgap-next-config, 
arago-scarthgap-config,
arago-scarthgap-selinux-config, etc where this patch enabled meta-lts-mixins
have meta-browser commented out (i.e disabledby default)

--
Chirag


>    This was tested on the
> scarthgap-wip branches and we are now rolling this out for all other
> scarthgap branches.
>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   bitbake-setup/arago-scarthgap-10x-config.json         | 11 +++++++++++
>   bitbake-setup/arago-scarthgap-10x-next-config.json    | 11 +++++++++++
>   bitbake-setup/arago-scarthgap-chromium-config.json    | 11 +++++++++++
>   bitbake-setup/arago-scarthgap-config.json             | 11 +++++++++++
>   bitbake-setup/arago-scarthgap-next-config.json        | 11 +++++++++++
>   bitbake-setup/arago-scarthgap-selinux-config.json     | 11 +++++++++++
>   .../arago-scarthgap-10x-config/bblayers.conf.sample   |  1 +
>   .../bblayers.conf.sample                              |  1 +
>   .../bblayers.conf.sample                              |  1 +
>   .../arago-scarthgap-config/bblayers.conf.sample       |  1 +
>   .../arago-scarthgap-next-config/bblayers.conf.sample  |  1 +
>   .../bblayers.conf.sample                              |  1 +
>   configs/arago-scarthgap-10x-config.txt                |  1 +
>   configs/arago-scarthgap-10x-next-config.txt           |  1 +
>   configs/arago-scarthgap-chromium-config.txt           |  1 +
>   configs/arago-scarthgap-config.txt                    |  1 +
>   configs/arago-scarthgap-next-config.txt               |  1 +
>   configs/arago-scarthgap-selinux-config.txt            |  1 +
>   kas/arago-scarthgap-10x-config.yml                    |  4 ++++
>   kas/arago-scarthgap-10x-next-config.yml               |  4 ++++
>   kas/arago-scarthgap-chromium-config.yml               |  4 ++++
>   kas/arago-scarthgap-config.yml                        |  4 ++++
>   kas/arago-scarthgap-next-config.yml                   |  4 ++++
>   kas/arago-scarthgap-selinux-config.yml                |  4 ++++
>   src/configs/arago-scarthgap-10x-config.xml            |  3 +++
>   src/configs/arago-scarthgap-10x-next-config.xml       |  3 +++
>   src/configs/arago-scarthgap-chromium-config.xml       |  3 +++
>   src/configs/arago-scarthgap-config.xml                |  3 +++
>   src/configs/arago-scarthgap-next-config.xml           |  3 +++
>   src/configs/arago-scarthgap-selinux-config.xml        |  3 +++
>   30 files changed, 120 insertions(+)
>
> diff --git a/bitbake-setup/arago-scarthgap-10x-config.json b/bitbake-setup/arago-scarthgap-10x-config.json
> index c5388a9..fc9279b 100644
> --- a/bitbake-setup/arago-scarthgap-10x-config.json
> +++ b/bitbake-setup/arago-scarthgap-10x-config.json
> @@ -68,6 +68,17 @@
>         },
>         "path": "meta-openembedded"
>       },
> +    "meta-lts-mixins": {
> +      "git-remote": {
> +        "remotes": {
> +          "origin": {
> +            "uri": "https://git.yoctoproject.org/meta-lts-mixins"
> +          }
> +        },
> +        "rev": "scarthgap/rust"
> +      },
> +      "path": "meta-lts-mixins"
> +    },
>       "meta-ti": {
>         "git-remote": {
>           "remotes": {
> diff --git a/bitbake-setup/arago-scarthgap-10x-next-config.json b/bitbake-setup/arago-scarthgap-10x-next-config.json
> index de5a5c3..f4fe3d8 100644
> --- a/bitbake-setup/arago-scarthgap-10x-next-config.json
> +++ b/bitbake-setup/arago-scarthgap-10x-next-config.json
> @@ -68,6 +68,17 @@
>         },
>         "path": "meta-openembedded"
>       },
> +    "meta-lts-mixins": {
> +      "git-remote": {
> +        "remotes": {
> +          "origin": {
> +            "uri": "https://git.yoctoproject.org/meta-lts-mixins"
> +          }
> +        },
> +        "rev": "scarthgap/rust"
> +      },
> +      "path": "meta-lts-mixins"
> +    },
>       "meta-ti": {
>         "git-remote": {
>           "remotes": {
> diff --git a/bitbake-setup/arago-scarthgap-chromium-config.json b/bitbake-setup/arago-scarthgap-chromium-config.json
> index a0fb0d3..9ba4585 100644
> --- a/bitbake-setup/arago-scarthgap-chromium-config.json
> +++ b/bitbake-setup/arago-scarthgap-chromium-config.json
> @@ -79,6 +79,17 @@
>         },
>         "path": "meta-openembedded"
>       },
> +    "meta-lts-mixins": {
> +      "git-remote": {
> +        "remotes": {
> +          "origin": {
> +            "uri": "https://git.yoctoproject.org/meta-lts-mixins"
> +          }
> +        },
> +        "rev": "scarthgap/rust"
> +      },
> +      "path": "meta-lts-mixins"
> +    },
>       "meta-ti": {
>         "git-remote": {
>           "remotes": {
> diff --git a/bitbake-setup/arago-scarthgap-config.json b/bitbake-setup/arago-scarthgap-config.json
> index 18af746..9e8067b 100644
> --- a/bitbake-setup/arago-scarthgap-config.json
> +++ b/bitbake-setup/arago-scarthgap-config.json
> @@ -68,6 +68,17 @@
>         },
>         "path": "meta-openembedded"
>       },
> +    "meta-lts-mixins": {
> +      "git-remote": {
> +        "remotes": {
> +          "origin": {
> +            "uri": "https://git.yoctoproject.org/meta-lts-mixins"
> +          }
> +        },
> +        "rev": "scarthgap/rust"
> +      },
> +      "path": "meta-lts-mixins"
> +    },
>       "meta-ti": {
>         "git-remote": {
>           "remotes": {
> diff --git a/bitbake-setup/arago-scarthgap-next-config.json b/bitbake-setup/arago-scarthgap-next-config.json
> index f6d48e6..fbee1d2 100644
> --- a/bitbake-setup/arago-scarthgap-next-config.json
> +++ b/bitbake-setup/arago-scarthgap-next-config.json
> @@ -68,6 +68,17 @@
>         },
>         "path": "meta-openembedded"
>       },
> +    "meta-lts-mixins": {
> +      "git-remote": {
> +        "remotes": {
> +          "origin": {
> +            "uri": "https://git.yoctoproject.org/meta-lts-mixins"
> +          }
> +        },
> +        "rev": "scarthgap/rust"
> +      },
> +      "path": "meta-lts-mixins"
> +    },
>       "meta-ti": {
>         "git-remote": {
>           "remotes": {
> diff --git a/bitbake-setup/arago-scarthgap-selinux-config.json b/bitbake-setup/arago-scarthgap-selinux-config.json
> index 918aa42..ac5b4c4 100644
> --- a/bitbake-setup/arago-scarthgap-selinux-config.json
> +++ b/bitbake-setup/arago-scarthgap-selinux-config.json
> @@ -79,6 +79,17 @@
>         },
>         "path": "meta-openembedded"
>       },
> +    "meta-lts-mixins": {
> +      "git-remote": {
> +        "remotes": {
> +          "origin": {
> +            "uri": "https://git.yoctoproject.org/meta-lts-mixins"
> +          }
> +        },
> +        "rev": "scarthgap/rust"
> +      },
> +      "path": "meta-lts-mixins"
> +    },
>       "meta-ti": {
>         "git-remote": {
>           "remotes": {
> diff --git a/conf/templates/arago-scarthgap-10x-config/bblayers.conf.sample b/conf/templates/arago-scarthgap-10x-config/bblayers.conf.sample
> index 4f26d30..641ea97 100644
> --- a/conf/templates/arago-scarthgap-10x-config/bblayers.conf.sample
> +++ b/conf/templates/arago-scarthgap-10x-config/bblayers.conf.sample
> @@ -20,6 +20,7 @@ BBLAYERS ?= " \
>       ##OEROOT##/../meta-openembedded/meta-gnome
>       ##OEROOT##/../meta-openembedded/meta-filesystems
>       ##OEROOT##/../meta-openembedded/meta-multimedia
> +    ##OEROOT##/../meta-lts-mixins
>       ##OEROOT##/../meta-ti/meta-ti-extras
>       ##OEROOT##/../meta-ti/meta-beagle
>       ##OEROOT##/../meta-ti/meta-ti-bsp
> diff --git a/conf/templates/arago-scarthgap-10x-next-config/bblayers.conf.sample b/conf/templates/arago-scarthgap-10x-next-config/bblayers.conf.sample
> index 4f26d30..641ea97 100644
> --- a/conf/templates/arago-scarthgap-10x-next-config/bblayers.conf.sample
> +++ b/conf/templates/arago-scarthgap-10x-next-config/bblayers.conf.sample
> @@ -20,6 +20,7 @@ BBLAYERS ?= " \
>       ##OEROOT##/../meta-openembedded/meta-gnome
>       ##OEROOT##/../meta-openembedded/meta-filesystems
>       ##OEROOT##/../meta-openembedded/meta-multimedia
> +    ##OEROOT##/../meta-lts-mixins
>       ##OEROOT##/../meta-ti/meta-ti-extras
>       ##OEROOT##/../meta-ti/meta-beagle
>       ##OEROOT##/../meta-ti/meta-ti-bsp
> diff --git a/conf/templates/arago-scarthgap-chromium-config/bblayers.conf.sample b/conf/templates/arago-scarthgap-chromium-config/bblayers.conf.sample
> index 80b4c62..0c16c84 100644
> --- a/conf/templates/arago-scarthgap-chromium-config/bblayers.conf.sample
> +++ b/conf/templates/arago-scarthgap-chromium-config/bblayers.conf.sample
> @@ -21,6 +21,7 @@ BBLAYERS ?= " \
>       ##OEROOT##/../meta-openembedded/meta-gnome
>       ##OEROOT##/../meta-openembedded/meta-filesystems
>       ##OEROOT##/../meta-openembedded/meta-multimedia
> +    ##OEROOT##/../meta-lts-mixins
>       ##OEROOT##/../meta-ti/meta-ti-extras
>       ##OEROOT##/../meta-ti/meta-beagle
>       ##OEROOT##/../meta-ti/meta-ti-bsp
> diff --git a/conf/templates/arago-scarthgap-config/bblayers.conf.sample b/conf/templates/arago-scarthgap-config/bblayers.conf.sample
> index 4f26d30..641ea97 100644
> --- a/conf/templates/arago-scarthgap-config/bblayers.conf.sample
> +++ b/conf/templates/arago-scarthgap-config/bblayers.conf.sample
> @@ -20,6 +20,7 @@ BBLAYERS ?= " \
>       ##OEROOT##/../meta-openembedded/meta-gnome
>       ##OEROOT##/../meta-openembedded/meta-filesystems
>       ##OEROOT##/../meta-openembedded/meta-multimedia
> +    ##OEROOT##/../meta-lts-mixins
>       ##OEROOT##/../meta-ti/meta-ti-extras
>       ##OEROOT##/../meta-ti/meta-beagle
>       ##OEROOT##/../meta-ti/meta-ti-bsp
> diff --git a/conf/templates/arago-scarthgap-next-config/bblayers.conf.sample b/conf/templates/arago-scarthgap-next-config/bblayers.conf.sample
> index 4f26d30..641ea97 100644
> --- a/conf/templates/arago-scarthgap-next-config/bblayers.conf.sample
> +++ b/conf/templates/arago-scarthgap-next-config/bblayers.conf.sample
> @@ -20,6 +20,7 @@ BBLAYERS ?= " \
>       ##OEROOT##/../meta-openembedded/meta-gnome
>       ##OEROOT##/../meta-openembedded/meta-filesystems
>       ##OEROOT##/../meta-openembedded/meta-multimedia
> +    ##OEROOT##/../meta-lts-mixins
>       ##OEROOT##/../meta-ti/meta-ti-extras
>       ##OEROOT##/../meta-ti/meta-beagle
>       ##OEROOT##/../meta-ti/meta-ti-bsp
> diff --git a/conf/templates/arago-scarthgap-selinux-config/bblayers.conf.sample b/conf/templates/arago-scarthgap-selinux-config/bblayers.conf.sample
> index 12aeae1..e3101b4 100644
> --- a/conf/templates/arago-scarthgap-selinux-config/bblayers.conf.sample
> +++ b/conf/templates/arago-scarthgap-selinux-config/bblayers.conf.sample
> @@ -21,6 +21,7 @@ BBLAYERS ?= " \
>       ##OEROOT##/../meta-openembedded/meta-gnome
>       ##OEROOT##/../meta-openembedded/meta-filesystems
>       ##OEROOT##/../meta-openembedded/meta-multimedia
> +    ##OEROOT##/../meta-lts-mixins
>       ##OEROOT##/../meta-ti/meta-ti-extras
>       ##OEROOT##/../meta-ti/meta-beagle
>       ##OEROOT##/../meta-ti/meta-ti-bsp
> diff --git a/configs/arago-scarthgap-10x-config.txt b/configs/arago-scarthgap-10x-config.txt
> index c557ac2..7e52f8a 100644
> --- a/configs/arago-scarthgap-10x-config.txt
> +++ b/configs/arago-scarthgap-10x-config.txt
> @@ -8,6 +8,7 @@ meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,HEAD,layers=meta-ar
>   meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,HEAD,layers=
>   meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
>   meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
> +meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/rust,HEAD,layers=
>   meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
>   meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,HEAD,layers=meta-arm:meta-arm-toolchain
>   meta-clang,https://github.com/kraj/meta-clang,scarthgap,HEAD,layers=
> diff --git a/configs/arago-scarthgap-10x-next-config.txt b/configs/arago-scarthgap-10x-next-config.txt
> index c085e95..22432ec 100644
> --- a/configs/arago-scarthgap-10x-next-config.txt
> +++ b/configs/arago-scarthgap-10x-next-config.txt
> @@ -16,6 +16,7 @@ meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap-next,HEAD,layers=me
>   meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,HEAD,layers=
>   meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
>   meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
> +meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/rust,HEAD,layers=
>   meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap-next,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
>   meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,HEAD,layers=meta-arm:meta-arm-toolchain
>   meta-clang,https://github.com/kraj/meta-clang,scarthgap,HEAD,layers=
> diff --git a/configs/arago-scarthgap-chromium-config.txt b/configs/arago-scarthgap-chromium-config.txt
> index 1d4cbd0..ae873e8 100644
> --- a/configs/arago-scarthgap-chromium-config.txt
> +++ b/configs/arago-scarthgap-chromium-config.txt
> @@ -8,6 +8,7 @@ meta-browser,https://github.com/OSSystems/meta-browser.git,master,68e8cbf51ac46c
>   meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,HEAD,layers=
>   meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
>   meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
> +meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/rust,HEAD,layers=
>   meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
>   meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,HEAD,layers=meta-arm:meta-arm-toolchain
>   meta-clang,https://github.com/kraj/meta-clang,scarthgap,HEAD,layers=
> diff --git a/configs/arago-scarthgap-config.txt b/configs/arago-scarthgap-config.txt
> index 32fc5f4..1474e02 100644
> --- a/configs/arago-scarthgap-config.txt
> +++ b/configs/arago-scarthgap-config.txt
> @@ -8,6 +8,7 @@ meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,HEAD,layers=meta-ar
>   meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,HEAD,layers=
>   meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
>   meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
> +meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/rust,HEAD,layers=
>   meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
>   meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,HEAD,layers=meta-arm:meta-arm-toolchain
>   meta-clang,https://github.com/kraj/meta-clang,scarthgap,HEAD,layers=
> diff --git a/configs/arago-scarthgap-next-config.txt b/configs/arago-scarthgap-next-config.txt
> index 9b33933..46476f8 100644
> --- a/configs/arago-scarthgap-next-config.txt
> +++ b/configs/arago-scarthgap-next-config.txt
> @@ -16,6 +16,7 @@ meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap-next,HEAD,layers=me
>   meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,HEAD,layers=
>   meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
>   meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
> +meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/rust,HEAD,layers=
>   meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap-next,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
>   meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,HEAD,layers=meta-arm:meta-arm-toolchain
>   meta-clang,https://github.com/kraj/meta-clang,scarthgap,HEAD,layers=
> diff --git a/configs/arago-scarthgap-selinux-config.txt b/configs/arago-scarthgap-selinux-config.txt
> index 681be86..198df7c 100644
> --- a/configs/arago-scarthgap-selinux-config.txt
> +++ b/configs/arago-scarthgap-selinux-config.txt
> @@ -8,6 +8,7 @@ meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,HEAD,layers=
>   meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,HEAD,layers=
>   meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
>   meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
> +meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/rust,HEAD,layers=
>   meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
>   meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,HEAD,layers=meta-arm:meta-arm-toolchain
>   meta-clang,https://github.com/kraj/meta-clang,scarthgap,HEAD,layers=
> diff --git a/kas/arago-scarthgap-10x-config.yml b/kas/arago-scarthgap-10x-config.yml
> index 6e87ac4..8ddd524 100644
> --- a/kas/arago-scarthgap-10x-config.yml
> +++ b/kas/arago-scarthgap-10x-config.yml
> @@ -34,6 +34,10 @@ repos:
>         meta-filesystems:
>         meta-multimedia:
>   
> +  meta-lts-mixins:
> +    url: "https://git.yoctoproject.org/meta-lts-mixins"
> +    branch: "scarthgap/rust"
> +
>     meta-ti:
>       url: "https://git.yoctoproject.org/meta-ti"
>       branch: "scarthgap"
> diff --git a/kas/arago-scarthgap-10x-next-config.yml b/kas/arago-scarthgap-10x-next-config.yml
> index 4b08ed2..0972ecf 100644
> --- a/kas/arago-scarthgap-10x-next-config.yml
> +++ b/kas/arago-scarthgap-10x-next-config.yml
> @@ -34,6 +34,10 @@ repos:
>         meta-filesystems:
>         meta-multimedia:
>   
> +  meta-lts-mixins:
> +    url: "https://git.yoctoproject.org/meta-lts-mixins"
> +    branch: "scarthgap/rust"
> +
>     meta-ti:
>       url: "https://git.yoctoproject.org/meta-ti"
>       branch: "scarthgap-next"
> diff --git a/kas/arago-scarthgap-chromium-config.yml b/kas/arago-scarthgap-chromium-config.yml
> index 1cad9d5..a929eda 100644
> --- a/kas/arago-scarthgap-chromium-config.yml
> +++ b/kas/arago-scarthgap-chromium-config.yml
> @@ -41,6 +41,10 @@ repos:
>         meta-filesystems:
>         meta-multimedia:
>   
> +  meta-lts-mixins:
> +    url: "https://git.yoctoproject.org/meta-lts-mixins"
> +    branch: "scarthgap/rust"
> +
>     meta-ti:
>       url: "https://git.yoctoproject.org/meta-ti"
>       branch: "scarthgap"
> diff --git a/kas/arago-scarthgap-config.yml b/kas/arago-scarthgap-config.yml
> index 9d79113..ed1ae10 100644
> --- a/kas/arago-scarthgap-config.yml
> +++ b/kas/arago-scarthgap-config.yml
> @@ -34,6 +34,10 @@ repos:
>         meta-filesystems:
>         meta-multimedia:
>   
> +  meta-lts-mixins:
> +    url: "https://git.yoctoproject.org/meta-lts-mixins"
> +    branch: "scarthgap/rust"
> +
>     meta-ti:
>       url: "https://git.yoctoproject.org/meta-ti"
>       branch: "scarthgap"
> diff --git a/kas/arago-scarthgap-next-config.yml b/kas/arago-scarthgap-next-config.yml
> index 974d9ab..05828c1 100644
> --- a/kas/arago-scarthgap-next-config.yml
> +++ b/kas/arago-scarthgap-next-config.yml
> @@ -34,6 +34,10 @@ repos:
>         meta-filesystems:
>         meta-multimedia:
>   
> +  meta-lts-mixins:
> +    url: "https://git.yoctoproject.org/meta-lts-mixins"
> +    branch: "scarthgap/rust"
> +
>     meta-ti:
>       url: "https://git.yoctoproject.org/meta-ti"
>       branch: "scarthgap-next"
> diff --git a/kas/arago-scarthgap-selinux-config.yml b/kas/arago-scarthgap-selinux-config.yml
> index 717a55b..ec61271 100644
> --- a/kas/arago-scarthgap-selinux-config.yml
> +++ b/kas/arago-scarthgap-selinux-config.yml
> @@ -38,6 +38,10 @@ repos:
>         meta-filesystems:
>         meta-multimedia:
>   
> +  meta-lts-mixins:
> +    url: "https://git.yoctoproject.org/meta-lts-mixins"
> +    branch: "scarthgap/rust"
> +
>     meta-ti:
>       url: "https://git.yoctoproject.org/meta-ti"
>       branch: "scarthgap"
> diff --git a/src/configs/arago-scarthgap-10x-config.xml b/src/configs/arago-scarthgap-10x-config.xml
> index 03c8cd2..ead78e2 100644
> --- a/src/configs/arago-scarthgap-10x-config.xml
> +++ b/src/configs/arago-scarthgap-10x-config.xml
> @@ -40,6 +40,9 @@
>                   <layer>meta-multimedia</layer>
>               </layers>
>           </repo>
> +        <repo name='meta-lts-mixins' url='https://git.yoctoproject.org/meta-lts-mixins' branch='scarthgap/rust' commit='HEAD'>
> +            <layers/>
> +        </repo>
>           <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='scarthgap' commit='HEAD'>
>               <layers>
>                   <layer>meta-ti-extras</layer>
> diff --git a/src/configs/arago-scarthgap-10x-next-config.xml b/src/configs/arago-scarthgap-10x-next-config.xml
> index 2ed7497..1d55f7e 100644
> --- a/src/configs/arago-scarthgap-10x-next-config.xml
> +++ b/src/configs/arago-scarthgap-10x-next-config.xml
> @@ -41,6 +41,9 @@
>                   <layer>meta-multimedia</layer>
>               </layers>
>           </repo>
> +        <repo name='meta-lts-mixins' url='https://git.yoctoproject.org/meta-lts-mixins' branch='scarthgap/rust' commit='HEAD'>
> +            <layers/>
> +        </repo>
>           <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='scarthgap-next' commit='HEAD'>
>               <layers>
>                   <layer>meta-ti-extras</layer>
> diff --git a/src/configs/arago-scarthgap-chromium-config.xml b/src/configs/arago-scarthgap-chromium-config.xml
> index f81380c..ba7c95e 100644
> --- a/src/configs/arago-scarthgap-chromium-config.xml
> +++ b/src/configs/arago-scarthgap-chromium-config.xml
> @@ -40,6 +40,9 @@
>                   <layer>meta-multimedia</layer>
>               </layers>
>           </repo>
> +        <repo name='meta-lts-mixins' url='https://git.yoctoproject.org/meta-lts-mixins' branch='scarthgap/rust' commit='HEAD'>
> +            <layers/>
> +        </repo>
>           <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='scarthgap' commit='HEAD'>
>               <layers>
>                   <layer>meta-ti-extras</layer>
> diff --git a/src/configs/arago-scarthgap-config.xml b/src/configs/arago-scarthgap-config.xml
> index a1381e1..ee9425f 100644
> --- a/src/configs/arago-scarthgap-config.xml
> +++ b/src/configs/arago-scarthgap-config.xml
> @@ -40,6 +40,9 @@
>                   <layer>meta-multimedia</layer>
>               </layers>
>           </repo>
> +        <repo name='meta-lts-mixins' url='https://git.yoctoproject.org/meta-lts-mixins' branch='scarthgap/rust' commit='HEAD'>
> +            <layers/>
> +        </repo>
>           <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='scarthgap' commit='HEAD'>
>               <layers>
>                   <layer>meta-ti-extras</layer>
> diff --git a/src/configs/arago-scarthgap-next-config.xml b/src/configs/arago-scarthgap-next-config.xml
> index 803e397..f080066 100644
> --- a/src/configs/arago-scarthgap-next-config.xml
> +++ b/src/configs/arago-scarthgap-next-config.xml
> @@ -41,6 +41,9 @@
>                   <layer>meta-multimedia</layer>
>               </layers>
>           </repo>
> +        <repo name='meta-lts-mixins' url='https://git.yoctoproject.org/meta-lts-mixins' branch='scarthgap/rust' commit='HEAD'>
> +            <layers/>
> +        </repo>
>           <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='scarthgap-next' commit='HEAD'>
>               <layers>
>                   <layer>meta-ti-extras</layer>
> diff --git a/src/configs/arago-scarthgap-selinux-config.xml b/src/configs/arago-scarthgap-selinux-config.xml
> index 42fde7c..990cb2a 100644
> --- a/src/configs/arago-scarthgap-selinux-config.xml
> +++ b/src/configs/arago-scarthgap-selinux-config.xml
> @@ -40,6 +40,9 @@
>                   <layer>meta-multimedia</layer>
>               </layers>
>           </repo>
> +        <repo name='meta-lts-mixins' url='https://git.yoctoproject.org/meta-lts-mixins' branch='scarthgap/rust' commit='HEAD'>
> +            <layers/>
> +        </repo>
>           <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='scarthgap' commit='HEAD'>
>               <layers>
>                   <layer>meta-ti-extras</layer>

