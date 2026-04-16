Return-Path: <j-sahu@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BABB0F8A145
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 08:29:56 +0000 (UTC)
Subject: Re: [oe-layersetup][master][PATCH] processor-sdk: Add luks config for Sitara SDK 12.00.00 Release
To: meta-arago@lists.yoctoproject.org
From: "Jeevan" <j-sahu@ti.com>
X-Originating-Location: IN (103.146.116.9)
X-Originating-Platform: Linux Firefox 148
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 16 Apr 2026 01:29:54 -0700
References: <20260414135825.1225171-1-s-tripathi1@ti.com>
In-Reply-To: <20260414135825.1225171-1-s-tripathi1@ti.com>
Message-ID: <1451444.1776328194063598786@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 16 Apr 2026 08:29:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17469

On Tue, Apr 14, 2026 at 07:29 PM, Shiva Tripathi wrote:

>
> Add processor-sdk-master-luks-12.00.00.07.04-config used for building
> SDK with the luks disk encryption, supported for AM62x, AM62P, AM62L
> and AM64x.
>=20
> Signed-off-by: Shiva Tripathi <s-tripathi1@ti.com>
> ---
>  ...aster-luks-12.00.00.07.04-config.conf.json | 136 ++++++++++++++++++
>  ...sdk-master-luks-12.00.00.07.04-config.conf |   4 +
>  ...-sdk-master-luks-12.00.00.07.04-config.txt |  21 +++
>  ...-sdk-master-luks-12.00.00.07.04-config.yml |  91 ++++++++++++
>  ...-sdk-master-luks-12.00.00.07.04-config.xml |  84 +++++++++++
>  5 files changed, 336 insertions(+)
>  create mode 100644
> bitbake-setup/processor-sdk/processor-sdk-master-luks-12.00.00.07.04-conf=
ig.conf.json
>  create mode 100644
> conf/fragments/localconf/configs/processor-sdk/processor-sdk-master-luks-=
12.00.00.07.04-config.conf
>  create mode 100644
> configs/processor-sdk/processor-sdk-master-luks-12.00.00.07.04-config.txt
>  create mode 100644
> kas/processor-sdk/processor-sdk-master-luks-12.00.00.07.04-config.yml
>  create mode 100644
> src/configs/processor-sdk/processor-sdk-master-luks-12.00.00.07.04-config=
.xml
>=20
> diff --git
> b/bitbake-setup/processor-sdk/processor-sdk-master-luks-12.00.00.07.04-co=
nfig.conf.json
> new file mode 100644
> index 0000000..efed2cb
> --- /dev/null
> +++
> b/bitbake-setup/processor-sdk/processor-sdk-master-luks-12.00.00.07.04-co=
nfig.conf.json
> @@ -0,0 +1,136 @@
> +{
> +  "version": "1.0",
> +  "description": "TI Processor SDK vmaster-luks-12.00.00.07.04",
> +  "sources": {
> +    "oe-layersetup": {
> +      "git-remote": {
> +        "remotes": {
> +          "origin": {
> +            "uri": "https://git.ti.com/git/arago-project/oe-layersetup.g=
it"
> +          }
> +        },
> +        "rev": "master"
> +      },
> +      "path": "oe-layersetup"
> +    },
> +    "bitbake": {
> +      "git-remote": {
> +        "remotes": {
> +          "origin": {
> +            "uri": "https://git.openembedded.org/bitbake"
> +          }
> +        },
> +        "rev": "master"
> +      },
> +      "path": "bitbake"
> +    },
> +    "meta-arago": {
> +      "git-remote": {
> +        "remotes": {
> +          "origin": {
> +            "uri": "https://git.yoctoproject.org/meta-arago"
> +          }
> +        },
> +        "rev": "master"
> +      },
> +      "path": "meta-arago"
> +    },
> +    "meta-security": {
> +      "git-remote": {
> +        "remotes": {
> +          "origin": {
> +            "uri": "https://git.yoctoproject.org/meta-security"
> +          }
> +        },
> +        "rev": "master"
> +      },
> +      "path": "meta-security"
> +    },
> +    "meta-qt6": {
> +      "git-remote": {
> +        "remotes": {
> +          "origin": {
> +            "uri": "https://code.qt.io/yocto/meta-qt6.git"
> +          }
> +        },
> +        "rev": "dev"
> +      },
> +      "path": "meta-qt6"
> +    },
> +    "meta-virtualization": {
> +      "git-remote": {
> +        "remotes": {
> +          "origin": {
> +            "uri": "https://git.yoctoproject.org/meta-virtualization"
> +          }
> +        },
> +        "rev": "master"
> +      },
> +      "path": "meta-virtualization"
> +    },
> +    "meta-openembedded": {
> +      "git-remote": {
> +        "remotes": {
> +          "origin": {
> +            "uri": "https://git.openembedded.org/meta-openembedded"
> +          }
> +        },
> +        "rev": "master"
> +      },
> +      "path": "meta-openembedded"
> +    },
> +    "meta-ti": {
> +      "git-remote": {
> +        "remotes": {
> +          "origin": {
> +            "uri": "https://git.yoctoproject.org/meta-ti"
> +          }
> +        },
> +        "rev": "master"
> +      },
> +      "path": "meta-ti"
> +    },
> +    "meta-arm": {
> +      "git-remote": {
> +        "remotes": {
> +          "origin": {
> +            "uri": "https://git.yoctoproject.org/meta-arm"
> +          }
> +        },
> +        "rev": "master"
> +      },
> +      "path": "meta-arm"
> +    },
> +    "oe-core": {
> +      "git-remote": {
> +        "remotes": {
> +          "origin": {
> +            "uri": "https://git.openembedded.org/openembedded-core"
> +          }
> +        },
> +        "rev": "master"
> +      },
> +      "path": "oe-core"
> +    }
> +  },
> +  "bitbake-setup": {
> +    "configurations": [
> +      {
> +        "name": "arago",
> +        "description": "TI Arago distro build",
> +        "bb-layers": [
> "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago=
/meta-arago-test","meta-security/meta-tpm","meta-qt6","meta-virtualization"=
,"meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-=
openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/met=
a-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-extras"=
,"meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/=
meta-arm-toolchain","oe-core/meta","oe-layersetup"
> ],
> +        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v3",
> "oe-layersetup/localconf/configs/processor-sdk/processor-sdk-master-luks-=
12.00.00.07.04-config.conf"
> ],
> +        "oe-fragments-one-of": {
> +          "machine": {
> +            "description": "Available target machines",
> +            "options": [
> "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machin=
e/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62=
xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-ev=
m","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machi=
ne/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-s=
k","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/bea=
glebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley=
-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721=
e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","mach=
ine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s=
4-hs-evm","machine/j722s-evm","machine/pocketbeagle2"
> ]
> +          },
> +          "distro": {
> +            "description": "Available distributions",
> +            "options": [ "distro/arago" ]
> +          }
> +        }
> +      }
> +    ]
> +  }
> +}
> diff --git
> b/conf/fragments/localconf/configs/processor-sdk/processor-sdk-master-luk=
s-12.00.00.07.04-config.conf
> new file mode 100644
> index 0000000..21aae5d
> --- /dev/null
> +++
> b/conf/fragments/localconf/configs/processor-sdk/processor-sdk-master-luk=
s-12.00.00.07.04-config.conf
> @@ -0,0 +1,4 @@
> +BB_CONF_FRAGMENT_SUMMARY =3D "Config specific overrides for
> processor-sdk/processor-sdk-master-luks-12.00.00.07.04-config"
> +BB_CONF_FRAGMENT_DESCRIPTION =3D "Config specific overrides for
> processor-sdk/processor-sdk-master-luks-12.00.00.07.04-config"
> +
> +DISTRO_FEATURES:append =3D " tpm luks"
> diff --git
> a/configs/processor-sdk/processor-sdk-master-luks-12.00.00.07.04-config.t=
xt
> b/configs/processor-sdk/processor-sdk-master-luks-12.00.00.07.04-config.t=
xt
> new file mode 100644
> index 0000000..b62f018
> --- /dev/null
> +++
> b/configs/processor-sdk/processor-sdk-master-luks-12.00.00.07.04-config.t=
xt

If sending under processor-sdk, can you add meta-tisdk layer as well.=20

[0]: https://git.ti.com/cgit/arago-project/oe-layersetup/tree/configs/proce=
ssor-sdk/processor-sdk-master-12.00.00.07.04-config.txt#n5

> @@ -0,0 +1,21 @@
> +# This file takes repo entries in the format
> +# repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:=
layern]
> +
> +bitbake,https://git.openembedded.org/bitbake,master,05a0ca339a6fee75f797=
9c3ee95fc91b2bd9b92f
> +meta-arago,https://git.yoctoproject.org/meta-arago,master,12.00.00.07,la=
yers=3Dmeta-arago-distro:meta-arago-extras:meta-arago-test
> +#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,45=
0ea5b3eb5b84c58e71e956c17a23ce1f2335fd,layers=3D.:meta-flutter-apps
> +#meta-browser,https://github.com/OSSystems/meta-browser.git,master,e252b=
51fd261a4cb05be932f0143ac444693a1ea,layers=3Dmeta-chromium
> +#meta-selinux,https://git.yoctoproject.org/meta-selinux,master,50803c3dd=
3d42bfe060b96a094c01d9075e37f41,layers=3D
> +meta-security,https://git.yoctoproject.org/meta-security,master,8028c573=
db6923525c2918724f2bd36d4a420e0b,layers=3Dmeta-tpm
> +meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,f7961b2828fe5eba250d3=
968bf1d135a2d28dcf8,layers=3D
> +meta-virtualization,https://git.yoctoproject.org/meta-virtualization,mas=
ter,b8968685998a052e5bed0f68a546be800c6849ed,layers=3D
> +meta-openembedded,https://git.openembedded.org/meta-openembedded,master,=
b5bb24b356d8200e2f4b088bc052eb668502ce33,layers=3Dmeta-networking:meta-pyth=
on:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
> +meta-ti,https://git.yoctoproject.org/meta-ti,master,12.00.00.07,layers=
=3Dmeta-ti-extras:meta-beagle:meta-ti-bsp
> +meta-arm,https://git.yoctoproject.org/meta-arm,master,37d31f41a8d5c47b13=
26cd0ae48b0032eb6d5e88,layers=3Dmeta-arm:meta-arm-toolchain
> +oe-core,https://git.openembedded.org/openembedded-core,master,ec113301d7=
3271d08bf4193c2509a34ad12385b6,layers=3Dmeta
> +
> +OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
> +OECORELOCALCONF=3D./sample-files/local-arago64-v3.conf.sample
> +BITBAKE_INCLUSIVE_VARS=3Dyes
> +
> +LOCALCONF:DISTRO_FEATURES:append =3D " tpm luks"
> diff --git
> a/kas/processor-sdk/processor-sdk-master-luks-12.00.00.07.04-config.yml
> b/kas/processor-sdk/processor-sdk-master-luks-12.00.00.07.04-config.yml
> new file mode 100644
> index 0000000..5a3d2be
> --- /dev/null
> +++ b/kas/processor-sdk/processor-sdk-master-luks-12.00.00.07.04-config.y=
ml
> @@ -0,0 +1,91 @@
> +---
> +header:
> +  version: 17
> +  includes:
> +    - kas/templates/bblayers.conf.yml
> +    - kas/templates/local-arago64-v3.conf.yml
> +
> +target: tisdk-default-image
> +
> +repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "master"
> +    commit: "05a0ca339a6fee75f7979c3ee95fc91b2bd9b92f"
> +    path: "sources/bitbake"
> +    layers:
> +      .: disabled
> +
> +  meta-arago:
> +    url: "https://git.yoctoproject.org/meta-arago"
> +    branch: "master"
> +    commit: "12.00.00.07"
> +    path: "sources/meta-arago"
> +    layers:
> +      meta-arago-distro:
> +      meta-arago-extras:
> +      meta-arago-test:
> +
> +  meta-security:
> +    url: "https://git.yoctoproject.org/meta-security"
> +    branch: "master"
> +    commit: "8028c573db6923525c2918724f2bd36d4a420e0b"
> +    path: "sources/meta-security"
> +    layers:
> +      meta-tpm:
> +
> +  meta-qt6:
> +    url: "https://code.qt.io/yocto/meta-qt6.git"
> +    branch: "dev"
> +    commit: "f7961b2828fe5eba250d3968bf1d135a2d28dcf8"
> +    path: "sources/meta-qt6"
> +
> +  meta-virtualization:
> +    url: "https://git.yoctoproject.org/meta-virtualization"
> +    branch: "master"
> +    commit: "b8968685998a052e5bed0f68a546be800c6849ed"
> +    path: "sources/meta-virtualization"
> +
> +  meta-openembedded:
> +    url: "https://git.openembedded.org/meta-openembedded"
> +    branch: "master"
> +    commit: "b5bb24b356d8200e2f4b088bc052eb668502ce33"
> +    path: "sources/meta-openembedded"
> +    layers:
> +      meta-networking:
> +      meta-python:
> +      meta-oe:
> +      meta-gnome:
> +      meta-filesystems:
> +      meta-multimedia:
> +
> +  meta-ti:
> +    url: "https://git.yoctoproject.org/meta-ti"
> +    branch: "master"
> +    commit: "12.00.00.07"
> +    path: "sources/meta-ti"
> +    layers:
> +      meta-ti-extras:
> +      meta-beagle:
> +      meta-ti-bsp:
> +
> +  meta-arm:
> +    url: "https://git.yoctoproject.org/meta-arm"
> +    branch: "master"
> +    commit: "37d31f41a8d5c47b1326cd0ae48b0032eb6d5e88"
> +    path: "sources/meta-arm"
> +    layers:
> +      meta-arm:
> +      meta-arm-toolchain:
> +
> +  oe-core:
> +    url: "https://git.openembedded.org/openembedded-core"
> +    branch: "master"
> +    commit: "ec113301d73271d08bf4193c2509a34ad12385b6"
> +    path: "sources/oe-core"
> +    layers:
> +      meta:
> +
> +local_conf_header:
> +  oe-layersetup-local-conf-config-specific: |
> +    DISTRO_FEATURES:append =3D " tpm luks"
> diff --git
> b/src/configs/processor-sdk/processor-sdk-master-luks-12.00.00.07.04-conf=
ig.xml
> new file mode 100644
> index 0000000..32da111
> --- /dev/null
> +++
> b/src/configs/processor-sdk/processor-sdk-master-luks-12.00.00.07.04-conf=
ig.xml
> @@ -0,0 +1,84 @@
> +<?xml version=3D'1.0'?>
> +<config>
> +    <description>TI Processor SDK vmaster-luks-12.00.00.07.04</descripti=
on>
> +
> +    <xi:include href=3D'../../common/distro_arago.xml'
> xmlns:xi=3D'http://www.w3.org/2001/XInclude'/>
> +    <xi:include href=3D'../../common/machines.xml'
> xmlns:xi=3D'http://www.w3.org/2001/XInclude'/>
> +    <xi:include href=3D'../../templates/bblayers.conf.xml'
> xmlns:xi=3D'http://www.w3.org/2001/XInclude'/>
> +    <xi:include href=3D'../../templates/local-arago64-v3.conf.xml'
> xmlns:xi=3D'http://www.w3.org/2001/XInclude'/>
> +
> +    <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'mast=
er'
> commit=3D'05a0ca339a6fee75f7979c3ee95fc91b2bd9b92f'/>
> +
> +    <repos>
> +        <repo name=3D'meta-arago' url=3D'https://git.yoctoproject.org/me=
ta-arago'
> branch=3D'master' commit=3D'12.00.00.07'>
> +            <layers>
> +                <layer>meta-arago-distro</layer>
> +                <layer>meta-arago-extras</layer>
> +                <layer>meta-arago-test</layer>
> +            </layers>
> +        </repo>
> +        <repo name=3D'meta-flutter'
> url=3D'https://github.com/meta-flutter/meta-flutter.git' branch=3D'master=
'
> commit=3D'450ea5b3eb5b84c58e71e956c17a23ce1f2335fd' disabled=3D'true'>
> +            <layers>
> +                <layer>.</layer>
> +                <layer>meta-flutter-apps</layer>
> +            </layers>
> +        </repo>
> +        <repo name=3D'meta-browser'
> url=3D'https://github.com/OSSystems/meta-browser.git' branch=3D'master'
> commit=3D'e252b51fd261a4cb05be932f0143ac444693a1ea' disabled=3D'true'>
> +            <layers>
> +                <layer>meta-chromium</layer>
> +            </layers>
> +        </repo>
> +        <repo name=3D'meta-selinux'
> url=3D'https://git.yoctoproject.org/meta-selinux' branch=3D'master'
> commit=3D'50803c3dd3d42bfe060b96a094c01d9075e37f41' disabled=3D'true'>
> +            <layers/>
> +        </repo>
> +        <repo name=3D'meta-security'
> url=3D'https://git.yoctoproject.org/meta-security' branch=3D'master'
> commit=3D'8028c573db6923525c2918724f2bd36d4a420e0b'>
> +            <layers>
> +                <layer>meta-tpm</layer>
> +            </layers>
> +        </repo>
> +        <repo name=3D'meta-qt6' url=3D'https://code.qt.io/yocto/meta-qt6=
.git'
> branch=3D'dev' commit=3D'f7961b2828fe5eba250d3968bf1d135a2d28dcf8'>
> +            <layers/>
> +        </repo>
> +        <repo name=3D'meta-virtualization'
> url=3D'https://git.yoctoproject.org/meta-virtualization' branch=3D'master=
'
> commit=3D'b8968685998a052e5bed0f68a546be800c6849ed'>
> +            <layers/>
> +        </repo>
> +        <repo name=3D'meta-openembedded'
> url=3D'https://git.openembedded.org/meta-openembedded' branch=3D'master'
> commit=3D'b5bb24b356d8200e2f4b088bc052eb668502ce33'>
> +            <layers>
> +                <layer>meta-networking</layer>
> +                <layer>meta-python</layer>
> +                <layer>meta-oe</layer>
> +                <layer>meta-gnome</layer>
> +                <layer>meta-filesystems</layer>
> +                <layer>meta-multimedia</layer>
> +            </layers>
> +        </repo>
> +        <repo name=3D'meta-ti' url=3D'https://git.yoctoproject.org/meta-=
ti'
> branch=3D'master' commit=3D'12.00.00.07'>
> +            <layers>
> +                <layer>meta-ti-extras</layer>
> +                <layer>meta-beagle</layer>
> +                <layer>meta-ti-bsp</layer>
> +            </layers>
> +        </repo>
> +        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta=
-arm'
> branch=3D'master' commit=3D'37d31f41a8d5c47b1326cd0ae48b0032eb6d5e88'>
> +            <layers>
> +                <layer>meta-arm</layer>
> +                <layer>meta-arm-toolchain</layer>
> +            </layers>
> +        </repo>
> +        <repo name=3D'oe-core'
> url=3D'https://git.openembedded.org/openembedded-core' branch=3D'master'
> commit=3D'ec113301d73271d08bf4193c2509a34ad12385b6'>
> +            <layers>
> +                <layer>meta</layer>
> +            </layers>
> +        </repo>
> +    </repos>
> +
> +    <local-conf>
> +        <line>DISTRO_FEATURES:append =3D " tpm luks"</line>
> +    </local-conf>
> +
> +    <tools>
> +        <tool type=3D'oe-layersetup'>
> +            <var name=3D'BITBAKE_INCLUSIVE_VARS' value=3D'yes'/>
> +        </tool>
> +    </tools>
> +</config>
> --=20
> 2.34.1
>=20
>

