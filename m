Return-Path: <j-sahu@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E98B9C9EC97
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 10:15:50 +0000 (UTC)
Subject: Re: [oe-layersetup][master][PATCH] processor-sdk: Add Sitara SDK 11.02.08.02 EVSE release configs
To: meta-arago@lists.yoctoproject.org
From: "Jeevan" <j-sahu@ti.com>
X-Originating-Location: IN (103.146.116.10)
X-Originating-Platform: Linux Firefox 146
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 13 Jan 2026 02:15:41 -0800
References: <20260113092444.e4h3w7p2qjvl3qxu@yogi-work-pc.dhcp.ti.com>
In-Reply-To: <20260113092444.e4h3w7p2qjvl3qxu@yogi-work-pc.dhcp.ti.com>
Message-ID: <575011.1768299341918856557@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 13 Jan 2026 10:15:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16952

On Tue, Jan 13, 2026 at 02:54 PM, Yogesh Hegde wrote:

>
> - Add processor-sdk-scarthgap-evse-11.02.08.02-config used for
> building EVSE (EV Charging) image for AM62L platform.
>=20

Looks like 11.02.08.02 tag and the commit SHA for meta-tisdk are not matchi=
ng.
Tag the necessary commit SHA with a newer tag and use that for meta-tisdk c=
onfig.

> Signed-off-by: Yogesh Hegde <y-hegde@ti.com>
> ---
>  ...carthgap-evse-11.02.08.02-config.conf.json | 169 ++++++++++++++++++
>  ...-sdk-scarthgap-evse-11.02.08.02-config.txt |  23 +++
>  ...-sdk-scarthgap-evse-11.02.08.02-config.yml |  94 ++++++++++
>  ...-sdk-scarthgap-evse-11.02.08.02-config.xml |  93 ++++++++++
>  4 files changed, 379 insertions(+)
>  create mode 100644
> bitbake-setup/processor-sdk/processor-sdk-scarthgap-evse-11.02.08.02-conf=
ig.conf.json
>  create mode 100644
> configs/processor-sdk/processor-sdk-scarthgap-evse-11.02.08.02-config.txt
>  create mode 100644
> kas/processor-sdk/processor-sdk-scarthgap-evse-11.02.08.02-config.yml
>  create mode 100644
> src/configs/processor-sdk/processor-sdk-scarthgap-evse-11.02.08.02-config=
.xml
>=20
> diff --git
> b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-evse-11.02.08.02-co=
nfig.conf.json
> new file mode 100644
> index 0000000..d614b37
> --- /dev/null
> +++
> b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-evse-11.02.08.02-co=
nfig.conf.json
> @@ -0,0 +1,169 @@
> +{
> +  "version": "1.0",
> +  "description": "TI Processor SDK vevse-11.02.08.02",
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
> +        "rev": "2.8"
> +      },
> +      "path": "bitbake"
> +    },
> +    "meta-tisdk": {
> +      "git-remote": {
> +        "remotes": {
> +          "origin": {
> +            "uri": "https://github.com/TexasInstruments/meta-tisdk.git"
> +          }
> +        },
> +        "rev": "scarthgap"
> +      },
> +      "path": "meta-tisdk"
> +    },
> +    "meta-arago": {
> +      "git-remote": {
> +        "remotes": {
> +          "origin": {
> +            "uri": "https://git.yoctoproject.org/meta-arago"
> +          }
> +        },
> +        "rev": "scarthgap"
> +      },
> +      "path": "meta-arago"
> +    },
> +    "meta-virtualization": {
> +      "git-remote": {
> +        "remotes": {
> +          "origin": {
> +            "uri": "https://git.yoctoproject.org/meta-virtualization"
> +          }
> +        },
> +        "rev": "scarthgap"
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
> +        "rev": "scarthgap"
> +      },
> +      "path": "meta-openembedded"
> +    },
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
> +    "meta-ti": {
> +      "git-remote": {
> +        "remotes": {
> +          "origin": {
> +            "uri": "https://git.yoctoproject.org/meta-ti"
> +          }
> +        },
> +        "rev": "scarthgap"
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
> +        "rev": "scarthgap"
> +      },
> +      "path": "meta-arm"
> +    },
> +    "meta-clang": {
> +      "git-remote": {
> +        "remotes": {
> +          "origin": {
> +            "uri": "https://github.com/kraj/meta-clang"
> +          }
> +        },
> +        "rev": "scarthgap"
> +      },
> +      "path": "meta-clang"
> +    },
> +    "oe-core": {
> +      "git-remote": {
> +        "remotes": {
> +          "origin": {
> +            "uri": "https://git.openembedded.org/openembedded-core"
> +          }
> +        },
> +        "rev": "scarthgap"
> +      },
> +      "path": "oe-core"
> +    },
> +    "meta-everest": {
> +      "git-remote": {
> +        "remotes": {
> +          "origin": {
> +            "uri": "https://github.com/EVerest/meta-everest"
> +          }
> +        },
> +        "rev": "scarthgap"
> +      },
> +      "path": "meta-everest"
> +    },
> +    "meta-lumissil-greenphy": {
> +      "git-remote": {
> +        "remotes": {
> +          "origin": {
> +            "uri": "https://github.com/phytec/meta-lumissil-greenphy.git=
"
> +          }
> +        },
> +        "rev": "scarthgap"
> +      },
> +      "path": "meta-lumissil-greenphy"
> +    }
> +  },
> +  "bitbake-setup": {
> +    "configurations": [
> +      {
> +        "name": "arago",
> +        "description": "TI Arago distro build",
> +        "bb-layers": [
> "meta-tisdk/meta-ti-foundational","meta-tisdk/meta-ti-ml","meta-arago/met=
a-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-test"=
,"meta-virtualization","meta-openembedded/meta-networking","meta-openembedd=
ed/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome",=
"meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","m=
eta-lts-mixins","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/met=
a-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","o=
e-core/meta","meta-everest","meta-lumissil-greenphy","oe-layersetup"
> ],
> +        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
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
> a/configs/processor-sdk/processor-sdk-scarthgap-evse-11.02.08.02-config.t=
xt
> b/configs/processor-sdk/processor-sdk-scarthgap-evse-11.02.08.02-config.t=
xt
> new file mode 100644
> index 0000000..869c29a
> --- /dev/null
> +++
> b/configs/processor-sdk/processor-sdk-scarthgap-evse-11.02.08.02-config.t=
xt
> @@ -0,0 +1,23 @@
> +# This file takes repo entries in the format
> +# repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:=
layern]
> +
> +bitbake,https://git.openembedded.org/bitbake,2.8,8dcf084522b9c66a6639b5f=
117f554fde9b6b45a
> +meta-tisdk,https://github.com/TexasInstruments/meta-tisdk.git,scarthgap,=
078b37b05e191a0e69ddbe74b402e0f1b29e6b30,layers=3Dmeta-ti-foundational:meta=
-ti-ml
> +meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,11.02.08,la=
yers=3Dmeta-arago-distro:meta-arago-extras:meta-arago-test
> +#meta-browser,https://github.com/OSSystems/meta-browser.git,master,27ca5=
2f635a31f5f9762813a8527dd31323549b7,layers=3Dmeta-chromium
> +#meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,21d19b=
89b47b9e9b3f1a347b29d95541cfb0dd3e,layers=3D
> +#meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,c7d71f4cece4d1fe3110=
c945b9bd40ca82960e05,layers=3D
> +meta-virtualization,https://git.yoctoproject.org/meta-virtualization,sca=
rthgap,17ac21e7d7f6f40a87618b22278b63bcfa14dbf2,layers=3D
> +meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthg=
ap,89a01c3d9ad1f8fce6aeb4dd0e694cfa28d42099,layers=3Dmeta-networking:meta-p=
ython:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
> +meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/r=
ust,a8046d5ec53b1856169ac795aa87cb0d5db84c04,layers=3D
> +meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,11.02.08,layers=
=3Dmeta-ti-extras:meta-beagle:meta-ti-bsp
> +meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,a81c19915b5b9e7=
1ed394032e9a50fd06919e1cd,layers=3Dmeta-arm:meta-arm-toolchain
> +meta-clang,https://github.com/kraj/meta-clang,scarthgap,731488911f55ebfe=
746068512b426351192f82f2,layers=3D
> +#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,scarthgap=
,21d19b89b47b9e9b3f1a347b29d95541cfb0dd3e,layers=3D.:meta-flutter-apps
> +oe-core,https://git.openembedded.org/openembedded-core,scarthgap,1fbd9ed=
dbdf0da062df0510cabff6f6ee33d5752,layers=3Dmeta
> +meta-everest,https://github.com/EVerest/meta-everest,scarthgap,5e7d982af=
2cf3b5f155648cc0bfdf82e07cab9f6,layers=3D
> +meta-lumissil-greenphy,https://github.com/phytec/meta-lumissil-greenphy.=
git,scarthgap,3af7953a60337b95ef782e03f794ab797c38151e,layers=3D
> +
> +OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
> +OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.sample
> +BITBAKE_INCLUSIVE_VARS=3Dyes
> diff --git
> a/kas/processor-sdk/processor-sdk-scarthgap-evse-11.02.08.02-config.yml
> b/kas/processor-sdk/processor-sdk-scarthgap-evse-11.02.08.02-config.yml
> new file mode 100644
> index 0000000..2a9d943
> --- /dev/null
> +++ b/kas/processor-sdk/processor-sdk-scarthgap-evse-11.02.08.02-config.y=
ml
> @@ -0,0 +1,94 @@
> +---
> +header:
> +  version: 17
> +  includes:
> +    - ../templates/bblayers.conf.yml
> +    - ../templates/local-arago64-v2.conf.yml
> +
> +target: tisdk-default-image
> +
> +repos:
> +  bitbake:
> +    url: "https://git.openembedded.org/bitbake"
> +    branch: "2.8"
> +    commit: "8dcf084522b9c66a6639b5f117f554fde9b6b45a"
> +    layers:
> +      .: disabled
> +
> +  meta-tisdk:
> +    url: "https://github.com/TexasInstruments/meta-tisdk.git"
> +    branch: "scarthgap"
> +    commit: "078b37b05e191a0e69ddbe74b402e0f1b29e6b30"
> +    layers:
> +      meta-ti-foundational:
> +      meta-ti-ml:
> +
> +  meta-arago:
> +    url: "https://git.yoctoproject.org/meta-arago"
> +    branch: "scarthgap"
> +    commit: "11.02.08"
> +    layers:
> +      meta-arago-distro:
> +      meta-arago-extras:
> +      meta-arago-test:
> +
> +  meta-virtualization:
> +    url: "https://git.yoctoproject.org/meta-virtualization"
> +    branch: "scarthgap"
> +    commit: "17ac21e7d7f6f40a87618b22278b63bcfa14dbf2"
> +
> +  meta-openembedded:
> +    url: "https://git.openembedded.org/meta-openembedded"
> +    branch: "scarthgap"
> +    commit: "89a01c3d9ad1f8fce6aeb4dd0e694cfa28d42099"
> +    layers:
> +      meta-networking:
> +      meta-python:
> +      meta-oe:
> +      meta-gnome:
> +      meta-filesystems:
> +      meta-multimedia:
> +
> +  meta-lts-mixins:
> +    url: "https://git.yoctoproject.org/meta-lts-mixins"
> +    branch: "scarthgap/rust"
> +    commit: "a8046d5ec53b1856169ac795aa87cb0d5db84c04"
> +
> +  meta-ti:
> +    url: "https://git.yoctoproject.org/meta-ti"
> +    branch: "scarthgap"
> +    commit: "11.02.08"
> +    layers:
> +      meta-ti-extras:
> +      meta-beagle:
> +      meta-ti-bsp:
> +
> +  meta-arm:
> +    url: "https://git.yoctoproject.org/meta-arm"
> +    branch: "scarthgap"
> +    commit: "a81c19915b5b9e71ed394032e9a50fd06919e1cd"
> +    layers:
> +      meta-arm:
> +      meta-arm-toolchain:
> +
> +  meta-clang:
> +    url: "https://github.com/kraj/meta-clang"
> +    branch: "scarthgap"
> +    commit: "731488911f55ebfe746068512b426351192f82f2"
> +
> +  oe-core:
> +    url: "https://git.openembedded.org/openembedded-core"
> +    branch: "scarthgap"
> +    commit: "1fbd9eddbdf0da062df0510cabff6f6ee33d5752"
> +    layers:
> +      meta:
> +
> +  meta-everest:
> +    url: "https://github.com/EVerest/meta-everest"
> +    branch: "scarthgap"
> +    commit: "5e7d982af2cf3b5f155648cc0bfdf82e07cab9f6"
> +
> +  meta-lumissil-greenphy:
> +    url: "https://github.com/phytec/meta-lumissil-greenphy.git"
> +    branch: "scarthgap"
> +    commit: "3af7953a60337b95ef782e03f794ab797c38151e"
> diff --git
> b/src/configs/processor-sdk/processor-sdk-scarthgap-evse-11.02.08.02-conf=
ig.xml
> new file mode 100644
> index 0000000..7ef7e25
> --- /dev/null
> +++
> b/src/configs/processor-sdk/processor-sdk-scarthgap-evse-11.02.08.02-conf=
ig.xml
> @@ -0,0 +1,93 @@
> +<?xml version=3D'1.0'?>
> +<config>
> +    <description>TI Processor SDK vevse-11.02.08.02</description>
> +
> +    <xi:include href=3D'../../common/distro_arago.xml'
> xmlns:xi=3D'http://www.w3.org/2001/XInclude'/>
> +    <xi:include href=3D'../../common/machines.xml'
> xmlns:xi=3D'http://www.w3.org/2001/XInclude'/>
> +    <xi:include href=3D'../../templates/bblayers.conf.xml'
> xmlns:xi=3D'http://www.w3.org/2001/XInclude'/>
> +    <xi:include href=3D'../../templates/local-arago64-v2.conf.xml'
> xmlns:xi=3D'http://www.w3.org/2001/XInclude'/>
> +
> +    <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'2.8'
> commit=3D'8dcf084522b9c66a6639b5f117f554fde9b6b45a'/>
> +
> +    <repos>
> +        <repo name=3D'meta-tisdk'
> url=3D'https://github.com/TexasInstruments/meta-tisdk.git' branch=3D'scar=
thgap'
> commit=3D'078b37b05e191a0e69ddbe74b402e0f1b29e6b30'>
> +            <layers>
> +                <layer>meta-ti-foundational</layer>
> +                <layer>meta-ti-ml</layer>
> +            </layers>
> +        </repo>
> +        <repo name=3D'meta-arago' url=3D'https://git.yoctoproject.org/me=
ta-arago'
> branch=3D'scarthgap' commit=3D'11.02.08'>
> +            <layers>
> +                <layer>meta-arago-distro</layer>
> +                <layer>meta-arago-extras</layer>
> +                <layer>meta-arago-test</layer>
> +            </layers>
> +        </repo>
> +        <repo name=3D'meta-browser'
> url=3D'https://github.com/OSSystems/meta-browser.git' branch=3D'master'
> commit=3D'27ca52f635a31f5f9762813a8527dd31323549b7' disabled=3D'true'>
> +            <layers>
> +                <layer>meta-chromium</layer>
> +            </layers>
> +        </repo>
> +        <repo name=3D'meta-selinux'
> url=3D'https://git.yoctoproject.org/meta-selinux' branch=3D'scarthgap'
> commit=3D'21d19b89b47b9e9b3f1a347b29d95541cfb0dd3e' disabled=3D'true'>
> +            <layers/>
> +        </repo>
> +        <repo name=3D'meta-qt6' url=3D'https://code.qt.io/yocto/meta-qt6=
.git'
> branch=3D'6.9' commit=3D'c7d71f4cece4d1fe3110c945b9bd40ca82960e05'
> disabled=3D'true'>
> +            <layers/>
> +        </repo>
> +        <repo name=3D'meta-virtualization'
> url=3D'https://git.yoctoproject.org/meta-virtualization' branch=3D'scarth=
gap'
> commit=3D'17ac21e7d7f6f40a87618b22278b63bcfa14dbf2'>
> +            <layers/>
> +        </repo>
> +        <repo name=3D'meta-openembedded'
> url=3D'https://git.openembedded.org/meta-openembedded' branch=3D'scarthga=
p'
> commit=3D'89a01c3d9ad1f8fce6aeb4dd0e694cfa28d42099'>
> +            <layers>
> +                <layer>meta-networking</layer>
> +                <layer>meta-python</layer>
> +                <layer>meta-oe</layer>
> +                <layer>meta-gnome</layer>
> +                <layer>meta-filesystems</layer>
> +                <layer>meta-multimedia</layer>
> +            </layers>
> +        </repo>
> +        <repo name=3D'meta-lts-mixins'
> url=3D'https://git.yoctoproject.org/meta-lts-mixins' branch=3D'scarthgap/=
rust'
> commit=3D'a8046d5ec53b1856169ac795aa87cb0d5db84c04'>
> +            <layers/>
> +        </repo>
> +        <repo name=3D'meta-ti' url=3D'https://git.yoctoproject.org/meta-=
ti'
> branch=3D'scarthgap' commit=3D'11.02.08'>
> +            <layers>
> +                <layer>meta-ti-extras</layer>
> +                <layer>meta-beagle</layer>
> +                <layer>meta-ti-bsp</layer>
> +            </layers>
> +        </repo>
> +        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta=
-arm'
> branch=3D'scarthgap' commit=3D'a81c19915b5b9e71ed394032e9a50fd06919e1cd'>
> +            <layers>
> +                <layer>meta-arm</layer>
> +                <layer>meta-arm-toolchain</layer>
> +            </layers>
> +        </repo>
> +        <repo name=3D'meta-clang' url=3D'https://github.com/kraj/meta-cl=
ang'
> branch=3D'scarthgap' commit=3D'731488911f55ebfe746068512b426351192f82f2'>
> +            <layers/>
> +        </repo>
> +        <repo name=3D'meta-flutter'
> url=3D'https://github.com/meta-flutter/meta-flutter.git' branch=3D'scarth=
gap'
> commit=3D'21d19b89b47b9e9b3f1a347b29d95541cfb0dd3e' disabled=3D'true'>
> +            <layers>
> +                <layer>.</layer>
> +                <layer>meta-flutter-apps</layer>
> +            </layers>
> +        </repo>
> +        <repo name=3D'oe-core'
> url=3D'https://git.openembedded.org/openembedded-core' branch=3D'scarthga=
p'
> commit=3D'1fbd9eddbdf0da062df0510cabff6f6ee33d5752'>
> +            <layers>
> +                <layer>meta</layer>
> +            </layers>
> +        </repo>
> +        <repo name=3D'meta-everest'
> url=3D'https://github.com/EVerest/meta-everest' branch=3D'scarthgap'
> commit=3D'5e7d982af2cf3b5f155648cc0bfdf82e07cab9f6'>
> +            <layers/>
> +        </repo>
> +        <repo name=3D'meta-lumissil-greenphy'
> url=3D'https://github.com/phytec/meta-lumissil-greenphy.git' branch=3D'sc=
arthgap'
> commit=3D'3af7953a60337b95ef782e03f794ab797c38151e'>
> +            <layers/>
> +        </repo>
> +    </repos>
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

