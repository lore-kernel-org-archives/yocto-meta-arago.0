Return-Path: <j-sahu@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97D60CCD185
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 14:07:57 +0000 (UTC)
Subject: Re: [oe-layersetup][master][PATCH] processor-sdk: Add new configs for Sitara SDK 11.01.16.13 Release
To: meta-arago@lists.yoctoproject.org
From: "Jeevan" <j-sahu@ti.com>
X-Originating-Location: IN (103.146.116.10)
X-Originating-Platform: Linux Firefox 143
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 09 Oct 2025 07:07:51 -0700
References: <20251009061919.136075-1-j-sahu@ti.com>
In-Reply-To: <20251009061919.136075-1-j-sahu@ti.com>
Message-ID: <26452.1760018871036161494@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 09 Oct 2025 14:07:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16676

On Thu, Oct  9, 2025 at 11:49 AM, Jeevan wrote:

>

Sent v2 with modified commit message. Please ignore this

> - These configs are based on AM62P SR 1.2 and AM62L SR 1.1 revisions.
>=20
> - Add the configs processor-sdk-scarthgap-chromium-11.01.16.13-
> config, processor-sdk-scarthgap-11.01.16.13-config and
> processor-sdk-scarthgap-selinux-11.01.16.13-config for AM62P
>=20
> - Add processor-sdk-scarthgap-nonqt-11.01.16.13-config for AM62L
>=20
> Signed-off-by: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
> ---
>  ...sdk-scarthgap-11.01.16.13-config.conf.json | 158 ++++++++++++++++
>  ...hgap-chromium-11.01.16.13-config.conf.json | 169 ++++++++++++++++++
>  ...arthgap-nonqt-11.01.16.13-config.conf.json | 147 +++++++++++++++
>  ...thgap-selinux-11.01.16.13-config.conf.json | 169 ++++++++++++++++++
>  ...-scarthgap-selinux-11.01.16.13-config.conf |   4 +
>  ...essor-sdk-scarthgap-11.01.16.13-config.txt |  19 ++
>  ...-scarthgap-chromium-11.01.16.13-config.txt |  20 +++
>  ...sdk-scarthgap-nonqt-11.01.16.13-config.txt |  17 ++
>  ...k-scarthgap-selinux-11.01.16.13-config.txt |  21 +++
>  ...essor-sdk-scarthgap-11.01.16.13-config.yml |  89 +++++++++
>  ...-scarthgap-chromium-11.01.16.13-config.yml |  96 ++++++++++
>  ...sdk-scarthgap-nonqt-11.01.16.13-config.yml |  84 +++++++++
>  ...k-scarthgap-selinux-11.01.16.13-config.yml |  98 ++++++++++
>  ...essor-sdk-scarthgap-11.01.16.13-config.xml |  79 ++++++++
>  ...-scarthgap-chromium-11.01.16.13-config.xml |  84 +++++++++
>  ...sdk-scarthgap-nonqt-11.01.16.13-config.xml |  70 ++++++++
>  ...k-scarthgap-selinux-11.01.16.13-config.xml |  80 +++++++++
>  17 files changed, 1404 insertions(+)
>  create mode 100644
> bitbake-setup/processor-sdk/processor-sdk-scarthgap-11.01.16.13-config.co=
nf.json
>  create mode 100644
> bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-11.01.16.13-=
config.conf.json
>  create mode 100644
> bitbake-setup/processor-sdk/processor-sdk-scarthgap-nonqt-11.01.16.13-con=
fig.conf.json
>  create mode 100644
> bitbake-setup/processor-sdk/processor-sdk-scarthgap-selinux-11.01.16.13-c=
onfig.conf.json
>  create mode 100644
> conf/fragments/localconf/configs/processor-sdk/processor-sdk-scarthgap-se=
linux-11.01.16.13-config.conf
>  create mode 100644
> configs/processor-sdk/processor-sdk-scarthgap-11.01.16.13-config.txt
>  create mode 100644
> configs/processor-sdk/processor-sdk-scarthgap-chromium-11.01.16.13-config=
.txt
>  create mode 100644
> configs/processor-sdk/processor-sdk-scarthgap-nonqt-11.01.16.13-config.tx=
t
>  create mode 100644
> configs/processor-sdk/processor-sdk-scarthgap-selinux-11.01.16.13-config.=
txt
>  create mode 100644
> kas/processor-sdk/processor-sdk-scarthgap-11.01.16.13-config.yml
>  create mode 100644
> kas/processor-sdk/processor-sdk-scarthgap-chromium-11.01.16.13-config.yml
>  create mode 100644
> kas/processor-sdk/processor-sdk-scarthgap-nonqt-11.01.16.13-config.yml
>  create mode 100644
> kas/processor-sdk/processor-sdk-scarthgap-selinux-11.01.16.13-config.yml
>  create mode 100644
> src/configs/processor-sdk/processor-sdk-scarthgap-11.01.16.13-config.xml
>  create mode 100644
> src/configs/processor-sdk/processor-sdk-scarthgap-chromium-11.01.16.13-co=
nfig.xml
>  create mode 100644
> src/configs/processor-sdk/processor-sdk-scarthgap-nonqt-11.01.16.13-confi=
g.xml
>  create mode 100644
> src/configs/processor-sdk/processor-sdk-scarthgap-selinux-11.01.16.13-con=
fig.xml
>=20
> diff --git
> b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-11.01.16.13-config.=
conf.json
> new file mode 100644
> index 0000000..41e0786
> --- /dev/null
> +++
> b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-11.01.16.13-config.=
conf.json
> @@ -0,0 +1,158 @@
> +{
> +  "version": "1.0",
> +  "description": "TI Processor SDK v11.01.16.13",
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
> +    "meta-qt6": {
> +      "git-remote": {
> +        "remotes": {
> +          "origin": {
> +            "uri": "https://code.qt.io/yocto/meta-qt6.git"
> +          }
> +        },
> +        "rev": "6.9"
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
,"meta-qt6","meta-virtualization","meta-openembedded/meta-networking","meta=
-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/m=
eta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-mul=
timedia","meta-lts-mixins","meta-ti/meta-ti-extras","meta-ti/meta-beagle","=
meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","met=
a-clang","oe-core/meta","oe-layersetup"
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
> b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-11.01.16.1=
3-config.conf.json
> new file mode 100644
> index 0000000..9601571
> --- /dev/null
> +++
> b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-11.01.16.1=
3-config.conf.json
> @@ -0,0 +1,169 @@
> +{
> +  "version": "1.0",
> +  "description": "TI Processor SDK vchromium-11.01.16.13",
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
> +    "meta-browser": {
> +      "git-remote": {
> +        "remotes": {
> +          "origin": {
> +            "uri": "https://github.com/OSSystems/meta-browser.git"
> +          }
> +        },
> +        "rev": "master"
> +      },
> +      "path": "meta-browser"
> +    },
> +    "meta-qt6": {
> +      "git-remote": {
> +        "remotes": {
> +          "origin": {
> +            "uri": "https://code.qt.io/yocto/meta-qt6.git"
> +          }
> +        },
> +        "rev": "6.9"
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
,"meta-browser/meta-chromium","meta-qt6","meta-virtualization","meta-openem=
bedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/=
meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems=
","meta-openembedded/meta-multimedia","meta-lts-mixins","meta-ti/meta-ti-ex=
tras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta=
-arm/meta-arm-toolchain","meta-clang","oe-core/meta","oe-layersetup"
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
> b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-nonqt-11.01.16.13-c=
onfig.conf.json
> new file mode 100644
> index 0000000..82caf40
> --- /dev/null
> +++
> b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-nonqt-11.01.16.13-c=
onfig.conf.json
> @@ -0,0 +1,147 @@
> +{
> +  "version": "1.0",
> +  "description": "TI Processor SDK vnonqt-11.01.16.13",
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
e-core/meta","oe-layersetup"
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
> b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-selinux-11.01.16.13=
-config.conf.json
> new file mode 100644
> index 0000000..f0ab178
> --- /dev/null
> +++
> b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-selinux-11.01.16.13=
-config.conf.json
> @@ -0,0 +1,169 @@
> +{
> +  "version": "1.0",
> +  "description": "TI Processor SDK vselinux-11.01.16.13",
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
> +    "meta-selinux": {
> +      "git-remote": {
> +        "remotes": {
> +          "origin": {
> +            "uri": "https://git.yoctoproject.org/meta-selinux"
> +          }
> +        },
> +        "rev": "scarthgap"
> +      },
> +      "path": "meta-selinux"
> +    },
> +    "meta-qt6": {
> +      "git-remote": {
> +        "remotes": {
> +          "origin": {
> +            "uri": "https://code.qt.io/yocto/meta-qt6.git"
> +          }
> +        },
> +        "rev": "6.9"
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
,"meta-selinux","meta-qt6","meta-virtualization","meta-openembedded/meta-ne=
tworking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta=
-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openem=
bedded/meta-multimedia","meta-lts-mixins","meta-ti/meta-ti-extras","meta-ti=
/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-=
toolchain","meta-clang","oe-core/meta","oe-layersetup"
> ],
> +        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2",
> "oe-layersetup/localconf/configs/processor-sdk/processor-sdk-scarthgap-se=
linux-11.01.16.13-config.conf"
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
> b/conf/fragments/localconf/configs/processor-sdk/processor-sdk-scarthgap-=
selinux-11.01.16.13-config.conf
> new file mode 100644
> index 0000000..d9adc91
> --- /dev/null
> +++
> b/conf/fragments/localconf/configs/processor-sdk/processor-sdk-scarthgap-=
selinux-11.01.16.13-config.conf
> @@ -0,0 +1,4 @@
> +BB_CONF_FRAGMENT_SUMMARY =3D "Config specific overrides for
> processor-sdk/processor-sdk-scarthgap-selinux-11.01.16.13-config"
> +BB_CONF_FRAGMENT_DESCRIPTION =3D "Config specific overrides for
> processor-sdk/processor-sdk-scarthgap-selinux-11.01.16.13-config"
> +
> +DISTRO_FEATURES:append =3D " acl xattr pam selinux"
> diff --git
> a/configs/processor-sdk/processor-sdk-scarthgap-11.01.16.13-config.txt
> b/configs/processor-sdk/processor-sdk-scarthgap-11.01.16.13-config.txt
> new file mode 100644
> index 0000000..4d2fb3f
> --- /dev/null
> +++ b/configs/processor-sdk/processor-sdk-scarthgap-11.01.16.13-config.tx=
t
> @@ -0,0 +1,19 @@
> +# This file takes repo entries in the format
> +# repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:=
layern]
> +
> +bitbake,https://git.openembedded.org/bitbake,2.8,1c9ec1ffde75809de34c10d=
3ec2b40d84d258cb4
> +meta-tisdk,https://github.com/TexasInstruments/meta-tisdk.git,scarthgap,=
11.01.16.13,layers=3Dmeta-ti-foundational:meta-ti-ml
> +meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,11.01.16,la=
yers=3Dmeta-arago-distro:meta-arago-extras:meta-arago-test
> +meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,c7d71f4cece4d1fe3110c=
945b9bd40ca82960e05,layers=3D
> +meta-virtualization,https://git.yoctoproject.org/meta-virtualization,sca=
rthgap,af1db2042caf8021d767dce1b26c08b59b96f3d1,layers=3D
> +meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthg=
ap,e621da947048842109db1b4fd3917a02e0501aa2,layers=3Dmeta-networking:meta-p=
ython:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
> +meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/r=
ust,a8046d5ec53b1856169ac795aa87cb0d5db84c04,layers=3D
> +meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,11.01.16,layers=
=3Dmeta-ti-extras:meta-beagle:meta-ti-bsp
> +meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,0f1e7bf92c89759=
f0ab74cfa5be4ee47b092ad46,layers=3Dmeta-arm:meta-arm-toolchain
> +meta-clang,https://github.com/kraj/meta-clang,scarthgap,057ee563305e9484=
b29d02347aeafdadc5ea28ed,layers=3D
> +#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,scarthgap=
,828139cbee2285c5be983990eb00982b4870081e,layers=3D.:meta-flutter-apps
> +oe-core,https://git.openembedded.org/openembedded-core,scarthgap,4cf131e=
bd157b79226533b5a5074691dd0e1a4ab,layers=3Dmeta
> +
> +OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
> +OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.sample
> +BITBAKE_INCLUSIVE_VARS=3Dyes
> diff --git
> b/configs/processor-sdk/processor-sdk-scarthgap-chromium-11.01.16.13-conf=
ig.txt
> new file mode 100644
> index 0000000..f7f73b8
> --- /dev/null
> +++
> b/configs/processor-sdk/processor-sdk-scarthgap-chromium-11.01.16.13-conf=
ig.txt
> @@ -0,0 +1,20 @@
> +# This file takes repo entries in the format
> +# repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:=
layern]
> +
> +bitbake,https://git.openembedded.org/bitbake,2.8,1c9ec1ffde75809de34c10d=
3ec2b40d84d258cb4
> +meta-tisdk,https://github.com/TexasInstruments/meta-tisdk.git,scarthgap,=
11.01.16.13,layers=3Dmeta-ti-foundational:meta-ti-ml
> +meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,11.01.16,la=
yers=3Dmeta-arago-distro:meta-arago-extras:meta-arago-test
> +meta-browser,https://github.com/OSSystems/meta-browser.git,master,27ca52=
f635a31f5f9762813a8527dd31323549b7,layers=3Dmeta-chromium
> +meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,c7d71f4cece4d1fe3110c=
945b9bd40ca82960e05,layers=3D
> +meta-virtualization,https://git.yoctoproject.org/meta-virtualization,sca=
rthgap,af1db2042caf8021d767dce1b26c08b59b96f3d1,layers=3D
> +meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthg=
ap,e621da947048842109db1b4fd3917a02e0501aa2,layers=3Dmeta-networking:meta-p=
ython:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
> +meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/r=
ust,a8046d5ec53b1856169ac795aa87cb0d5db84c04,layers=3D
> +meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,11.01.16,layers=
=3Dmeta-ti-extras:meta-beagle:meta-ti-bsp
> +meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,0f1e7bf92c89759=
f0ab74cfa5be4ee47b092ad46,layers=3Dmeta-arm:meta-arm-toolchain
> +meta-clang,https://github.com/kraj/meta-clang,scarthgap,057ee563305e9484=
b29d02347aeafdadc5ea28ed,layers=3D
> +#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,scarthgap=
,828139cbee2285c5be983990eb00982b4870081e,layers=3D.:meta-flutter-apps
> +oe-core,https://git.openembedded.org/openembedded-core,scarthgap,4cf131e=
bd157b79226533b5a5074691dd0e1a4ab,layers=3Dmeta
> +
> +OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
> +OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.sample
> +BITBAKE_INCLUSIVE_VARS=3Dyes
> diff --git
> a/configs/processor-sdk/processor-sdk-scarthgap-nonqt-11.01.16.13-config.=
txt
> b/configs/processor-sdk/processor-sdk-scarthgap-nonqt-11.01.16.13-config.=
txt
> new file mode 100644
> index 0000000..ca53c2d
> --- /dev/null
> +++
> b/configs/processor-sdk/processor-sdk-scarthgap-nonqt-11.01.16.13-config.=
txt
> @@ -0,0 +1,17 @@
> +# This file takes repo entries in the format
> +# repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:=
layern]
> +
> +bitbake,https://git.openembedded.org/bitbake,2.8,1c9ec1ffde75809de34c10d=
3ec2b40d84d258cb4
> +meta-tisdk,https://github.com/TexasInstruments/meta-tisdk.git,scarthgap,=
11.01.16.13,layers=3Dmeta-ti-foundational:meta-ti-ml
> +meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,11.01.16,la=
yers=3Dmeta-arago-distro:meta-arago-extras:meta-arago-test
> +meta-virtualization,https://git.yoctoproject.org/meta-virtualization,sca=
rthgap,af1db2042caf8021d767dce1b26c08b59b96f3d1,layers=3D
> +meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthg=
ap,e621da947048842109db1b4fd3917a02e0501aa2,layers=3Dmeta-networking:meta-p=
ython:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
> +meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/r=
ust,a8046d5ec53b1856169ac795aa87cb0d5db84c04,layers=3D
> +meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,11.01.16,layers=
=3Dmeta-ti-extras:meta-beagle:meta-ti-bsp
> +meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,0f1e7bf92c89759=
f0ab74cfa5be4ee47b092ad46,layers=3Dmeta-arm:meta-arm-toolchain
> +meta-clang,https://github.com/kraj/meta-clang,scarthgap,057ee563305e9484=
b29d02347aeafdadc5ea28ed,layers=3D
> +oe-core,https://git.openembedded.org/openembedded-core,scarthgap,4cf131e=
bd157b79226533b5a5074691dd0e1a4ab,layers=3Dmeta
> +
> +OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
> +OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.sample
> +BITBAKE_INCLUSIVE_VARS=3Dyes
> diff --git
> a/configs/processor-sdk/processor-sdk-scarthgap-selinux-11.01.16.13-confi=
g.txt
> b/configs/processor-sdk/processor-sdk-scarthgap-selinux-11.01.16.13-confi=
g.txt
> new file mode 100644
> index 0000000..78be761
> --- /dev/null
> +++
> b/configs/processor-sdk/processor-sdk-scarthgap-selinux-11.01.16.13-confi=
g.txt
> @@ -0,0 +1,21 @@
> +# This file takes repo entries in the format
> +# repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:=
layern]
> +
> +bitbake,https://git.openembedded.org/bitbake,2.8,1c9ec1ffde75809de34c10d=
3ec2b40d84d258cb4
> +meta-tisdk,https://github.com/TexasInstruments/meta-tisdk.git,scarthgap,=
11.01.16.13,layers=3Dmeta-ti-foundational:meta-ti-ml
> +meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,11.01.16,la=
yers=3Dmeta-arago-distro:meta-arago-extras:meta-arago-test
> +meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,c999577=
d7ab4b1b54fff61ab15c46a6f9e242d0d,layers=3D
> +meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,c7d71f4cece4d1fe3110c=
945b9bd40ca82960e05,layers=3D
> +meta-virtualization,https://git.yoctoproject.org/meta-virtualization,sca=
rthgap,af1db2042caf8021d767dce1b26c08b59b96f3d1,layers=3D
> +meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthg=
ap,e621da947048842109db1b4fd3917a02e0501aa2,layers=3Dmeta-networking:meta-p=
ython:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
> +meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/r=
ust,a8046d5ec53b1856169ac795aa87cb0d5db84c04,layers=3D
> +meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,11.01.16,layers=
=3Dmeta-ti-extras:meta-beagle:meta-ti-bsp
> +meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,0f1e7bf92c89759=
f0ab74cfa5be4ee47b092ad46,layers=3Dmeta-arm:meta-arm-toolchain
> +meta-clang,https://github.com/kraj/meta-clang,scarthgap,057ee563305e9484=
b29d02347aeafdadc5ea28ed,layers=3D
> +oe-core,https://git.openembedded.org/openembedded-core,scarthgap,4cf131e=
bd157b79226533b5a5074691dd0e1a4ab,layers=3Dmeta
> +
> +OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
> +OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.sample
> +BITBAKE_INCLUSIVE_VARS=3Dyes
> +
> +LOCALCONF:DISTRO_FEATURES:append =3D " acl xattr pam selinux"
> diff --git a/kas/processor-sdk/processor-sdk-scarthgap-11.01.16.13-config=
.yml
> b/kas/processor-sdk/processor-sdk-scarthgap-11.01.16.13-config.yml
> new file mode 100644
> index 0000000..f475f4e
> --- /dev/null
> +++ b/kas/processor-sdk/processor-sdk-scarthgap-11.01.16.13-config.yml
> @@ -0,0 +1,89 @@
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
> +    commit: "1c9ec1ffde75809de34c10d3ec2b40d84d258cb4"
> +    layers:
> +      .: disabled
> +
> +  meta-tisdk:
> +    url: "https://github.com/TexasInstruments/meta-tisdk.git"
> +    branch: "scarthgap"
> +    commit: "11.01.16.13"
> +    layers:
> +      meta-ti-foundational:
> +      meta-ti-ml:
> +
> +  meta-arago:
> +    url: "https://git.yoctoproject.org/meta-arago"
> +    branch: "scarthgap"
> +    commit: "11.01.16"
> +    layers:
> +      meta-arago-distro:
> +      meta-arago-extras:
> +      meta-arago-test:
> +
> +  meta-qt6:
> +    url: "https://code.qt.io/yocto/meta-qt6.git"
> +    branch: "6.9"
> +    commit: "c7d71f4cece4d1fe3110c945b9bd40ca82960e05"
> +
> +  meta-virtualization:
> +    url: "https://git.yoctoproject.org/meta-virtualization"
> +    branch: "scarthgap"
> +    commit: "af1db2042caf8021d767dce1b26c08b59b96f3d1"
> +
> +  meta-openembedded:
> +    url: "https://git.openembedded.org/meta-openembedded"
> +    branch: "scarthgap"
> +    commit: "e621da947048842109db1b4fd3917a02e0501aa2"
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
> +    commit: "11.01.16"
> +    layers:
> +      meta-ti-extras:
> +      meta-beagle:
> +      meta-ti-bsp:
> +
> +  meta-arm:
> +    url: "https://git.yoctoproject.org/meta-arm"
> +    branch: "scarthgap"
> +    commit: "0f1e7bf92c89759f0ab74cfa5be4ee47b092ad46"
> +    layers:
> +      meta-arm:
> +      meta-arm-toolchain:
> +
> +  meta-clang:
> +    url: "https://github.com/kraj/meta-clang"
> +    branch: "scarthgap"
> +    commit: "057ee563305e9484b29d02347aeafdadc5ea28ed"
> +
> +  oe-core:
> +    url: "https://git.openembedded.org/openembedded-core"
> +    branch: "scarthgap"
> +    commit: "4cf131ebd157b79226533b5a5074691dd0e1a4ab"
> +    layers:
> +      meta:
> diff --git
> a/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.01.16.13-config.y=
ml
> b/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.01.16.13-config.y=
ml
> new file mode 100644
> index 0000000..040fa89
> --- /dev/null
> +++
> b/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.01.16.13-config.y=
ml
> @@ -0,0 +1,96 @@
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
> +    commit: "1c9ec1ffde75809de34c10d3ec2b40d84d258cb4"
> +    layers:
> +      .: disabled
> +
> +  meta-tisdk:
> +    url: "https://github.com/TexasInstruments/meta-tisdk.git"
> +    branch: "scarthgap"
> +    commit: "11.01.16.13"
> +    layers:
> +      meta-ti-foundational:
> +      meta-ti-ml:
> +
> +  meta-arago:
> +    url: "https://git.yoctoproject.org/meta-arago"
> +    branch: "scarthgap"
> +    commit: "11.01.16"
> +    layers:
> +      meta-arago-distro:
> +      meta-arago-extras:
> +      meta-arago-test:
> +
> +  meta-browser:
> +    url: "https://github.com/OSSystems/meta-browser.git"
> +    branch: "master"
> +    commit: "27ca52f635a31f5f9762813a8527dd31323549b7"
> +    layers:
> +      meta-chromium:
> +
> +  meta-qt6:
> +    url: "https://code.qt.io/yocto/meta-qt6.git"
> +    branch: "6.9"
> +    commit: "c7d71f4cece4d1fe3110c945b9bd40ca82960e05"
> +
> +  meta-virtualization:
> +    url: "https://git.yoctoproject.org/meta-virtualization"
> +    branch: "scarthgap"
> +    commit: "af1db2042caf8021d767dce1b26c08b59b96f3d1"
> +
> +  meta-openembedded:
> +    url: "https://git.openembedded.org/meta-openembedded"
> +    branch: "scarthgap"
> +    commit: "e621da947048842109db1b4fd3917a02e0501aa2"
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
> +    commit: "11.01.16"
> +    layers:
> +      meta-ti-extras:
> +      meta-beagle:
> +      meta-ti-bsp:
> +
> +  meta-arm:
> +    url: "https://git.yoctoproject.org/meta-arm"
> +    branch: "scarthgap"
> +    commit: "0f1e7bf92c89759f0ab74cfa5be4ee47b092ad46"
> +    layers:
> +      meta-arm:
> +      meta-arm-toolchain:
> +
> +  meta-clang:
> +    url: "https://github.com/kraj/meta-clang"
> +    branch: "scarthgap"
> +    commit: "057ee563305e9484b29d02347aeafdadc5ea28ed"
> +
> +  oe-core:
> +    url: "https://git.openembedded.org/openembedded-core"
> +    branch: "scarthgap"
> +    commit: "4cf131ebd157b79226533b5a5074691dd0e1a4ab"
> +    layers:
> +      meta:
> diff --git
> a/kas/processor-sdk/processor-sdk-scarthgap-nonqt-11.01.16.13-config.yml
> b/kas/processor-sdk/processor-sdk-scarthgap-nonqt-11.01.16.13-config.yml
> new file mode 100644
> index 0000000..390f461
> --- /dev/null
> +++ b/kas/processor-sdk/processor-sdk-scarthgap-nonqt-11.01.16.13-config.=
yml
> @@ -0,0 +1,84 @@
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
> +    commit: "1c9ec1ffde75809de34c10d3ec2b40d84d258cb4"
> +    layers:
> +      .: disabled
> +
> +  meta-tisdk:
> +    url: "https://github.com/TexasInstruments/meta-tisdk.git"
> +    branch: "scarthgap"
> +    commit: "11.01.16.13"
> +    layers:
> +      meta-ti-foundational:
> +      meta-ti-ml:
> +
> +  meta-arago:
> +    url: "https://git.yoctoproject.org/meta-arago"
> +    branch: "scarthgap"
> +    commit: "11.01.16"
> +    layers:
> +      meta-arago-distro:
> +      meta-arago-extras:
> +      meta-arago-test:
> +
> +  meta-virtualization:
> +    url: "https://git.yoctoproject.org/meta-virtualization"
> +    branch: "scarthgap"
> +    commit: "af1db2042caf8021d767dce1b26c08b59b96f3d1"
> +
> +  meta-openembedded:
> +    url: "https://git.openembedded.org/meta-openembedded"
> +    branch: "scarthgap"
> +    commit: "e621da947048842109db1b4fd3917a02e0501aa2"
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
> +    commit: "11.01.16"
> +    layers:
> +      meta-ti-extras:
> +      meta-beagle:
> +      meta-ti-bsp:
> +
> +  meta-arm:
> +    url: "https://git.yoctoproject.org/meta-arm"
> +    branch: "scarthgap"
> +    commit: "0f1e7bf92c89759f0ab74cfa5be4ee47b092ad46"
> +    layers:
> +      meta-arm:
> +      meta-arm-toolchain:
> +
> +  meta-clang:
> +    url: "https://github.com/kraj/meta-clang"
> +    branch: "scarthgap"
> +    commit: "057ee563305e9484b29d02347aeafdadc5ea28ed"
> +
> +  oe-core:
> +    url: "https://git.openembedded.org/openembedded-core"
> +    branch: "scarthgap"
> +    commit: "4cf131ebd157b79226533b5a5074691dd0e1a4ab"
> +    layers:
> +      meta:
> diff --git
> a/kas/processor-sdk/processor-sdk-scarthgap-selinux-11.01.16.13-config.ym=
l
> b/kas/processor-sdk/processor-sdk-scarthgap-selinux-11.01.16.13-config.ym=
l
> new file mode 100644
> index 0000000..47fd67c
> --- /dev/null
> +++ b/kas/processor-sdk/processor-sdk-scarthgap-selinux-11.01.16.13-confi=
g.yml
> @@ -0,0 +1,98 @@
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
> +    commit: "1c9ec1ffde75809de34c10d3ec2b40d84d258cb4"
> +    layers:
> +      .: disabled
> +
> +  meta-tisdk:
> +    url: "https://github.com/TexasInstruments/meta-tisdk.git"
> +    branch: "scarthgap"
> +    commit: "11.01.16.13"
> +    layers:
> +      meta-ti-foundational:
> +      meta-ti-ml:
> +
> +  meta-arago:
> +    url: "https://git.yoctoproject.org/meta-arago"
> +    branch: "scarthgap"
> +    commit: "11.01.16"
> +    layers:
> +      meta-arago-distro:
> +      meta-arago-extras:
> +      meta-arago-test:
> +
> +  meta-selinux:
> +    url: "https://git.yoctoproject.org/meta-selinux"
> +    branch: "scarthgap"
> +    commit: "c999577d7ab4b1b54fff61ab15c46a6f9e242d0d"
> +
> +  meta-qt6:
> +    url: "https://code.qt.io/yocto/meta-qt6.git"
> +    branch: "6.9"
> +    commit: "c7d71f4cece4d1fe3110c945b9bd40ca82960e05"
> +
> +  meta-virtualization:
> +    url: "https://git.yoctoproject.org/meta-virtualization"
> +    branch: "scarthgap"
> +    commit: "af1db2042caf8021d767dce1b26c08b59b96f3d1"
> +
> +  meta-openembedded:
> +    url: "https://git.openembedded.org/meta-openembedded"
> +    branch: "scarthgap"
> +    commit: "e621da947048842109db1b4fd3917a02e0501aa2"
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
> +    commit: "11.01.16"
> +    layers:
> +      meta-ti-extras:
> +      meta-beagle:
> +      meta-ti-bsp:
> +
> +  meta-arm:
> +    url: "https://git.yoctoproject.org/meta-arm"
> +    branch: "scarthgap"
> +    commit: "0f1e7bf92c89759f0ab74cfa5be4ee47b092ad46"
> +    layers:
> +      meta-arm:
> +      meta-arm-toolchain:
> +
> +  meta-clang:
> +    url: "https://github.com/kraj/meta-clang"
> +    branch: "scarthgap"
> +    commit: "057ee563305e9484b29d02347aeafdadc5ea28ed"
> +
> +  oe-core:
> +    url: "https://git.openembedded.org/openembedded-core"
> +    branch: "scarthgap"
> +    commit: "4cf131ebd157b79226533b5a5074691dd0e1a4ab"
> +    layers:
> +      meta:
> +
> +local_conf_header:
> +  oe-layersetup-local-conf-config-specific: |
> +    DISTRO_FEATURES:append =3D " acl xattr pam selinux"
> diff --git
> a/src/configs/processor-sdk/processor-sdk-scarthgap-11.01.16.13-config.xm=
l
> b/src/configs/processor-sdk/processor-sdk-scarthgap-11.01.16.13-config.xm=
l
> new file mode 100644
> index 0000000..2594ec7
> --- /dev/null
> +++ b/src/configs/processor-sdk/processor-sdk-scarthgap-11.01.16.13-confi=
g.xml
> @@ -0,0 +1,79 @@
> +<?xml version=3D'1.0'?>
> +<config>
> +    <description>TI Processor SDK v11.01.16.13</description>
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
> commit=3D'1c9ec1ffde75809de34c10d3ec2b40d84d258cb4'/>
> +
> +    <repos>
> +        <repo name=3D'meta-tisdk'
> url=3D'https://github.com/TexasInstruments/meta-tisdk.git' branch=3D'scar=
thgap'
> commit=3D'11.01.16.13'>
> +            <layers>
> +                <layer>meta-ti-foundational</layer>
> +                <layer>meta-ti-ml</layer>
> +            </layers>
> +        </repo>
> +        <repo name=3D'meta-arago' url=3D'https://git.yoctoproject.org/me=
ta-arago'
> branch=3D'scarthgap' commit=3D'11.01.16'>
> +            <layers>
> +                <layer>meta-arago-distro</layer>
> +                <layer>meta-arago-extras</layer>
> +                <layer>meta-arago-test</layer>
> +            </layers>
> +        </repo>
> +        <repo name=3D'meta-qt6' url=3D'https://code.qt.io/yocto/meta-qt6=
.git'
> branch=3D'6.9' commit=3D'c7d71f4cece4d1fe3110c945b9bd40ca82960e05'>
> +            <layers/>
> +        </repo>
> +        <repo name=3D'meta-virtualization'
> url=3D'https://git.yoctoproject.org/meta-virtualization' branch=3D'scarth=
gap'
> commit=3D'af1db2042caf8021d767dce1b26c08b59b96f3d1'>
> +            <layers/>
> +        </repo>
> +        <repo name=3D'meta-openembedded'
> url=3D'https://git.openembedded.org/meta-openembedded' branch=3D'scarthga=
p'
> commit=3D'e621da947048842109db1b4fd3917a02e0501aa2'>
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
> branch=3D'scarthgap' commit=3D'11.01.16'>
> +            <layers>
> +                <layer>meta-ti-extras</layer>
> +                <layer>meta-beagle</layer>
> +                <layer>meta-ti-bsp</layer>
> +            </layers>
> +        </repo>
> +        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta=
-arm'
> branch=3D'scarthgap' commit=3D'0f1e7bf92c89759f0ab74cfa5be4ee47b092ad46'>
> +            <layers>
> +                <layer>meta-arm</layer>
> +                <layer>meta-arm-toolchain</layer>
> +            </layers>
> +        </repo>
> +        <repo name=3D'meta-clang' url=3D'https://github.com/kraj/meta-cl=
ang'
> branch=3D'scarthgap' commit=3D'057ee563305e9484b29d02347aeafdadc5ea28ed'>
> +            <layers/>
> +        </repo>
> +        <repo name=3D'meta-flutter'
> url=3D'https://github.com/meta-flutter/meta-flutter.git' branch=3D'scarth=
gap'
> commit=3D'828139cbee2285c5be983990eb00982b4870081e' disabled=3D'true'>
> +            <layers>
> +                <layer>.</layer>
> +                <layer>meta-flutter-apps</layer>
> +            </layers>
> +        </repo>
> +        <repo name=3D'oe-core'
> url=3D'https://git.openembedded.org/openembedded-core' branch=3D'scarthga=
p'
> commit=3D'4cf131ebd157b79226533b5a5074691dd0e1a4ab'>
> +            <layers>
> +                <layer>meta</layer>
> +            </layers>
> +        </repo>
> +    </repos>
> +
> +    <tools>
> +        <tool type=3D'oe-layersetup'>
> +            <var name=3D'BITBAKE_INCLUSIVE_VARS' value=3D'yes'/>
> +        </tool>
> +    </tools>
> +</config>
> diff --git
> b/src/configs/processor-sdk/processor-sdk-scarthgap-chromium-11.01.16.13-=
config.xml
> new file mode 100644
> index 0000000..226bd38
> --- /dev/null
> +++
> b/src/configs/processor-sdk/processor-sdk-scarthgap-chromium-11.01.16.13-=
config.xml
> @@ -0,0 +1,84 @@
> +<?xml version=3D'1.0'?>
> +<config>
> +    <description>TI Processor SDK vchromium-11.01.16.13</description>
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
> commit=3D'1c9ec1ffde75809de34c10d3ec2b40d84d258cb4'/>
> +
> +    <repos>
> +        <repo name=3D'meta-tisdk'
> url=3D'https://github.com/TexasInstruments/meta-tisdk.git' branch=3D'scar=
thgap'
> commit=3D'11.01.16.13'>
> +            <layers>
> +                <layer>meta-ti-foundational</layer>
> +                <layer>meta-ti-ml</layer>
> +            </layers>
> +        </repo>
> +        <repo name=3D'meta-arago' url=3D'https://git.yoctoproject.org/me=
ta-arago'
> branch=3D'scarthgap' commit=3D'11.01.16'>
> +            <layers>
> +                <layer>meta-arago-distro</layer>
> +                <layer>meta-arago-extras</layer>
> +                <layer>meta-arago-test</layer>
> +            </layers>
> +        </repo>
> +        <repo name=3D'meta-browser'
> url=3D'https://github.com/OSSystems/meta-browser.git' branch=3D'master'
> commit=3D'27ca52f635a31f5f9762813a8527dd31323549b7'>
> +            <layers>
> +                <layer>meta-chromium</layer>
> +            </layers>
> +        </repo>
> +        <repo name=3D'meta-qt6' url=3D'https://code.qt.io/yocto/meta-qt6=
.git'
> branch=3D'6.9' commit=3D'c7d71f4cece4d1fe3110c945b9bd40ca82960e05'>
> +            <layers/>
> +        </repo>
> +        <repo name=3D'meta-virtualization'
> url=3D'https://git.yoctoproject.org/meta-virtualization' branch=3D'scarth=
gap'
> commit=3D'af1db2042caf8021d767dce1b26c08b59b96f3d1'>
> +            <layers/>
> +        </repo>
> +        <repo name=3D'meta-openembedded'
> url=3D'https://git.openembedded.org/meta-openembedded' branch=3D'scarthga=
p'
> commit=3D'e621da947048842109db1b4fd3917a02e0501aa2'>
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
> branch=3D'scarthgap' commit=3D'11.01.16'>
> +            <layers>
> +                <layer>meta-ti-extras</layer>
> +                <layer>meta-beagle</layer>
> +                <layer>meta-ti-bsp</layer>
> +            </layers>
> +        </repo>
> +        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta=
-arm'
> branch=3D'scarthgap' commit=3D'0f1e7bf92c89759f0ab74cfa5be4ee47b092ad46'>
> +            <layers>
> +                <layer>meta-arm</layer>
> +                <layer>meta-arm-toolchain</layer>
> +            </layers>
> +        </repo>
> +        <repo name=3D'meta-clang' url=3D'https://github.com/kraj/meta-cl=
ang'
> branch=3D'scarthgap' commit=3D'057ee563305e9484b29d02347aeafdadc5ea28ed'>
> +            <layers/>
> +        </repo>
> +        <repo name=3D'meta-flutter'
> url=3D'https://github.com/meta-flutter/meta-flutter.git' branch=3D'scarth=
gap'
> commit=3D'828139cbee2285c5be983990eb00982b4870081e' disabled=3D'true'>
> +            <layers>
> +                <layer>.</layer>
> +                <layer>meta-flutter-apps</layer>
> +            </layers>
> +        </repo>
> +        <repo name=3D'oe-core'
> url=3D'https://git.openembedded.org/openembedded-core' branch=3D'scarthga=
p'
> commit=3D'4cf131ebd157b79226533b5a5074691dd0e1a4ab'>
> +            <layers>
> +                <layer>meta</layer>
> +            </layers>
> +        </repo>
> +    </repos>
> +
> +    <tools>
> +        <tool type=3D'oe-layersetup'>
> +            <var name=3D'BITBAKE_INCLUSIVE_VARS' value=3D'yes'/>
> +        </tool>
> +    </tools>
> +</config>
> diff --git
> b/src/configs/processor-sdk/processor-sdk-scarthgap-nonqt-11.01.16.13-con=
fig.xml
> new file mode 100644
> index 0000000..7d4dc18
> --- /dev/null
> +++
> b/src/configs/processor-sdk/processor-sdk-scarthgap-nonqt-11.01.16.13-con=
fig.xml
> @@ -0,0 +1,70 @@
> +<?xml version=3D'1.0'?>
> +<config>
> +    <description>TI Processor SDK vnonqt-11.01.16.13</description>
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
> commit=3D'1c9ec1ffde75809de34c10d3ec2b40d84d258cb4'/>
> +
> +    <repos>
> +        <repo name=3D'meta-tisdk'
> url=3D'https://github.com/TexasInstruments/meta-tisdk.git' branch=3D'scar=
thgap'
> commit=3D'11.01.16.13'>
> +            <layers>
> +                <layer>meta-ti-foundational</layer>
> +                <layer>meta-ti-ml</layer>
> +            </layers>
> +        </repo>
> +        <repo name=3D'meta-arago' url=3D'https://git.yoctoproject.org/me=
ta-arago'
> branch=3D'scarthgap' commit=3D'11.01.16'>
> +            <layers>
> +                <layer>meta-arago-distro</layer>
> +                <layer>meta-arago-extras</layer>
> +                <layer>meta-arago-test</layer>
> +            </layers>
> +        </repo>
> +        <repo name=3D'meta-virtualization'
> url=3D'https://git.yoctoproject.org/meta-virtualization' branch=3D'scarth=
gap'
> commit=3D'af1db2042caf8021d767dce1b26c08b59b96f3d1'>
> +            <layers/>
> +        </repo>
> +        <repo name=3D'meta-openembedded'
> url=3D'https://git.openembedded.org/meta-openembedded' branch=3D'scarthga=
p'
> commit=3D'e621da947048842109db1b4fd3917a02e0501aa2'>
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
> branch=3D'scarthgap' commit=3D'11.01.16'>
> +            <layers>
> +                <layer>meta-ti-extras</layer>
> +                <layer>meta-beagle</layer>
> +                <layer>meta-ti-bsp</layer>
> +            </layers>
> +        </repo>
> +        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta=
-arm'
> branch=3D'scarthgap' commit=3D'0f1e7bf92c89759f0ab74cfa5be4ee47b092ad46'>
> +            <layers>
> +                <layer>meta-arm</layer>
> +                <layer>meta-arm-toolchain</layer>
> +            </layers>
> +        </repo>
> +        <repo name=3D'meta-clang' url=3D'https://github.com/kraj/meta-cl=
ang'
> branch=3D'scarthgap' commit=3D'057ee563305e9484b29d02347aeafdadc5ea28ed'>
> +            <layers/>
> +        </repo>
> +        <repo name=3D'oe-core'
> url=3D'https://git.openembedded.org/openembedded-core' branch=3D'scarthga=
p'
> commit=3D'4cf131ebd157b79226533b5a5074691dd0e1a4ab'>
> +            <layers>
> +                <layer>meta</layer>
> +            </layers>
> +        </repo>
> +    </repos>
> +
> +    <tools>
> +        <tool type=3D'oe-layersetup'>
> +            <var name=3D'BITBAKE_INCLUSIVE_VARS' value=3D'yes'/>
> +        </tool>
> +    </tools>
> +</config>
> diff --git
> b/src/configs/processor-sdk/processor-sdk-scarthgap-selinux-11.01.16.13-c=
onfig.xml
> new file mode 100644
> index 0000000..69b8c4b
> --- /dev/null
> +++
> b/src/configs/processor-sdk/processor-sdk-scarthgap-selinux-11.01.16.13-c=
onfig.xml
> @@ -0,0 +1,80 @@
> +<?xml version=3D'1.0'?>
> +<config>
> +    <description>TI Processor SDK vselinux-11.01.16.13</description>
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
> commit=3D'1c9ec1ffde75809de34c10d3ec2b40d84d258cb4'/>
> +
> +    <repos>
> +        <repo name=3D'meta-tisdk'
> url=3D'https://github.com/TexasInstruments/meta-tisdk.git' branch=3D'scar=
thgap'
> commit=3D'11.01.16.13'>
> +            <layers>
> +                <layer>meta-ti-foundational</layer>
> +                <layer>meta-ti-ml</layer>
> +            </layers>
> +        </repo>
> +        <repo name=3D'meta-arago' url=3D'https://git.yoctoproject.org/me=
ta-arago'
> branch=3D'scarthgap' commit=3D'11.01.16'>
> +            <layers>
> +                <layer>meta-arago-distro</layer>
> +                <layer>meta-arago-extras</layer>
> +                <layer>meta-arago-test</layer>
> +            </layers>
> +        </repo>
> +        <repo name=3D'meta-selinux'
> url=3D'https://git.yoctoproject.org/meta-selinux' branch=3D'scarthgap'
> commit=3D'c999577d7ab4b1b54fff61ab15c46a6f9e242d0d'>
> +            <layers/>
> +        </repo>
> +        <repo name=3D'meta-qt6' url=3D'https://code.qt.io/yocto/meta-qt6=
.git'
> branch=3D'6.9' commit=3D'c7d71f4cece4d1fe3110c945b9bd40ca82960e05'>
> +            <layers/>
> +        </repo>
> +        <repo name=3D'meta-virtualization'
> url=3D'https://git.yoctoproject.org/meta-virtualization' branch=3D'scarth=
gap'
> commit=3D'af1db2042caf8021d767dce1b26c08b59b96f3d1'>
> +            <layers/>
> +        </repo>
> +        <repo name=3D'meta-openembedded'
> url=3D'https://git.openembedded.org/meta-openembedded' branch=3D'scarthga=
p'
> commit=3D'e621da947048842109db1b4fd3917a02e0501aa2'>
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
> branch=3D'scarthgap' commit=3D'11.01.16'>
> +            <layers>
> +                <layer>meta-ti-extras</layer>
> +                <layer>meta-beagle</layer>
> +                <layer>meta-ti-bsp</layer>
> +            </layers>
> +        </repo>
> +        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta=
-arm'
> branch=3D'scarthgap' commit=3D'0f1e7bf92c89759f0ab74cfa5be4ee47b092ad46'>
> +            <layers>
> +                <layer>meta-arm</layer>
> +                <layer>meta-arm-toolchain</layer>
> +            </layers>
> +        </repo>
> +        <repo name=3D'meta-clang' url=3D'https://github.com/kraj/meta-cl=
ang'
> branch=3D'scarthgap' commit=3D'057ee563305e9484b29d02347aeafdadc5ea28ed'>
> +            <layers/>
> +        </repo>
> +        <repo name=3D'oe-core'
> url=3D'https://git.openembedded.org/openembedded-core' branch=3D'scarthga=
p'
> commit=3D'4cf131ebd157b79226533b5a5074691dd0e1a4ab'>
> +            <layers>
> +                <layer>meta</layer>
> +            </layers>
> +        </repo>
> +    </repos>
> +
> +    <local-conf>
> +        <line>DISTRO_FEATURES:append =3D " acl xattr pam selinux"</line>
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

