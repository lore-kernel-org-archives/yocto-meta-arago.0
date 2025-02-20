Return-Path: <jcormier@criticallink.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FD29C021B1
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 16:58:37 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.1948.1740070710869387292
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 20 Feb 2025 08:58:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=OikuksOX;
 spf=pass (domain: criticallink.com, ip: 209.85.167.53, mailfrom: jcormier@criticallink.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-546210287c1so1322416e87.2
        for <meta-arago@lists.yoctoproject.org>; Thu, 20 Feb 2025 08:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1740070709; x=1740675509; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5eg0ios4gE8fFW4s+MSSIIn/Oq2dCXl299EYKQtlTiw=;
        b=OikuksOXsLFo8x0GjakcNX3H1K028AwR9BTFL3OQifvOoP+n7KHWjyZz2Wr+UIdhA8
         utZGo7Ac7VE8fPDwbW3M1eUX60LjCjYTfIQNZmSaD/KCLuMBLPmGC4T4FXuxPQxUPWCt
         PF90VUC4uw9msMuK/aAvDNQNlJxPwsJLg9OwL7oskODqRjlwlFfv/oGrfRm/oH2Z0XjQ
         t1ZDRHISD5zVZ3Kcuf9LwS061ybTYa6Badvi2Zd4f3ODJdIELFi0UMNP2U08pbXIl4ut
         PcuKLJ0S9KXueCt4ST5/gmAgM/WdqXNQd0RvDH1j9DQnVk7+JNrZx0OGkD/Ie2IGRTfj
         pgyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740070709; x=1740675509;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5eg0ios4gE8fFW4s+MSSIIn/Oq2dCXl299EYKQtlTiw=;
        b=Sz4x7FZXuyn1j3vQaJp/zVb8VaE/XpLvRssfR2igxW3E+1BtgtEZ9SCAaB5a74ppbh
         gyoxFbD+UOaMtsgpAkk/TpbklZFptLkKhp+eUoTlX8K+r7euT9cloS44AB/0J/g9UQvr
         nLtDWETeD5qVufe/X3pWnZVjf01rwCT1PmVamLp/dKvRLDA21pFJz0u2oc5oSSx0eM3G
         VrpkgxFz8K5F1nS+3okK6dJITK2ZmoJTO1IfwXalfjchjiZMltAJwO/LVSKUuSJvrrVG
         tBk6cEap4lMBccdgV9VsahnbB7YOfdW21G2x+rzQ9IqUtW6Rcynw2er6+CT0KnVGZrWP
         rbdQ==
X-Gm-Message-State: AOJu0Yyqjfm1lCQYL9+Gh2ehrqHwsibDqpNXEcgKHBo3NFoAV4xD4R9B
	aesWH7DqYwiB0/rUqOH9p8vQ7ItetyyVTz6VrjpDMACO3cd1RyboB7da/HU+L/PUrk5Py5b54bg
	YrXwt9L7v2dW7poJz+gjfim9axEgG/bY1HTWL
X-Gm-Gg: ASbGncvgtN8dTpDNijlcz8Kq/yQTPwgyhXSZTiuNA5w27NUFQeYzDIGD2YlPcQ0O6/o
	MVwF4mjOEaAEMdzCKcGuNzb17COnBZj8xGPPxdKgWgHMokYTxm9XQUtMHIckPlA4tR30bK8A=
X-Google-Smtp-Source: AGHT+IElZrOhiLxCR+wknmGsOdrrjaI+A17tgIKJummQXuBchSS0bW3HnymDdpE4UqMQm/DbLciszkhQ7vz5Oy1T2Bk=
X-Received: by 2002:a05:6512:114e:b0:545:b9a:b4b4 with SMTP id
 2adb3069b0e04-5452fe8fd01mr8881692e87.52.1740070708438; Thu, 20 Feb 2025
 08:58:28 -0800 (PST)
MIME-Version: 1.0
References: <20241219163417.4155600-1-c-shilwant@ti.com>
In-Reply-To: <20241219163417.4155600-1-c-shilwant@ti.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Thu, 20 Feb 2025 11:58:16 -0500
X-Gm-Features: AWEUYZmzIznXd6nmhHxS4PyDrNhZPN0Y2bRz100pBDdCncyc3xeC5hnf26siFUM
Message-ID: <CADL8D3b7x9ou1uBcVqwYLUwM2sA-ucLx80NPRMG_tBf3cepGvA@mail.gmail.com>
Subject: Re: [meta-arago][oe-layersetup][master][PATCH] processor-sdk: Add new
 configs for Sitara SDK 10.1 Release
To: c-shilwant@ti.com
Cc: meta-arago@lists.yoctoproject.org, Denys <denis@denix.org>, 
	Ryan Eatmon <reatmon@ti.com>
Content-Type: multipart/alternative; boundary="0000000000007604a4062e95c8d2"
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 20 Feb 2025 16:58:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15869

--0000000000007604a4062e95c8d2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

After build processor-sdk-scarthgap-chromium-10.01.10.04-config, I noticed
the downloads directory has moved to the build/downloads folder, instead of
being at the top of the build directory.  Was this intentional?  I suspect
it probably happened when everything was converted to xml configs. But the
commit doesn't mention that as a known side effect.

commit aea8e0f53cb05e2d80056b3568f3376741c90853
Author: Ryan Eatmon <reatmon@ti.com>
Date:   Thu Oct 10 11:43:57 2024 -0500

    Initial conversion of new XML configs
...
-DL_DIR =3D "${OEBASE}/downloads"
+DL_DIR =3D "${TOPDIR}/downloads"
...
-SSTATE_DIR =3D "${OEBASE}/build/sstate-cache"
+SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"

SSTATE_DIR was also updated and it still looks to be put in the same place
as ever...

On Thu, Dec 19, 2024 at 11:34=E2=80=AFAM Chirag Shilwant via lists.yoctopro=
ject.org
<c-shilwant=3Dti.com@lists.yoctoproject.org> wrote:

> - Add processor-sdk-scarthgap-10.01.10.04-config used for
> building AM62SIP & AM64x.
>
> - Add processor-sdk-scarthgap-chromium-10.01.10.04-config
> used for building AM62P, AM62x, AM62LP & Beagleplay.
>
> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> ---
>  ...ssor-sdk-scarthgap-10.01.10.04-config.json | 136 ++++++++++++++
>  ...scarthgap-chromium-10.01.10.04-config.json | 158 ++++++++++++++++
>  .../bblayers.conf.sample                      |  32 ++++
>  .../conf-notes.txt                            |  22 +++
>  .../conf-summary.txt                          |   1 +
>  .../local.conf.sample                         | 175 ++++++++++++++++++
>  .../bblayers.conf.sample                      |  34 ++++
>  .../conf-notes.txt                            |  22 +++
>  .../conf-summary.txt                          |   1 +
>  .../local.conf.sample                         | 175 ++++++++++++++++++
>  ...essor-sdk-scarthgap-10.01.10.04-config.txt |  17 ++
>  ...-scarthgap-chromium-10.01.10.04-config.txt |  19 ++
>  ...essor-sdk-scarthgap-10.01.10.04-config.yml |  74 ++++++++
>  ...-scarthgap-chromium-10.01.10.04-config.yml |  86 +++++++++
>  ...essor-sdk-scarthgap-10.01.10.04-config.xml |  66 +++++++
>  ...-scarthgap-chromium-10.01.10.04-config.xml |  74 ++++++++
>  16 files changed, 1092 insertions(+)
>  create mode 100644
> bitbake-setup/processor-sdk_processor-sdk-scarthgap-10.01.10.04-config.js=
on
>  create mode 100644
> bitbake-setup/processor-sdk_processor-sdk-scarthgap-chromium-10.01.10.04-=
config.json
>  create mode 100644
> conf/templates/processor-sdk_processor-sdk-scarthgap-10.01.10.04-config/b=
blayers.conf.sample
>  create mode 100644
> conf/templates/processor-sdk_processor-sdk-scarthgap-10.01.10.04-config/c=
onf-notes.txt
>  create mode 100644
> conf/templates/processor-sdk_processor-sdk-scarthgap-10.01.10.04-config/c=
onf-summary.txt
>  create mode 100644
> conf/templates/processor-sdk_processor-sdk-scarthgap-10.01.10.04-config/l=
ocal.conf.sample
>  create mode 100644
> conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.01.10.04=
-config/bblayers.conf.sample
>  create mode 100644
> conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.01.10.04=
-config/conf-notes.txt
>  create mode 100644
> conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.01.10.04=
-config/conf-summary.txt
>  create mode 100644
> conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.01.10.04=
-config/local.conf.sample
>  create mode 100644
> configs/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.txt
>  create mode 100644
> configs/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-config=
.txt
>  create mode 100644
> kas/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.yml
>  create mode 100644
> kas/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-config.yml
>  create mode 100644
> src/configs/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.xml
>  create mode 100644
> src/configs/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-co=
nfig.xml
>
> diff --git
> a/bitbake-setup/processor-sdk_processor-sdk-scarthgap-10.01.10.04-config.=
json
> b/bitbake-setup/processor-sdk_processor-sdk-scarthgap-10.01.10.04-config.=
json
> new file mode 100644
> index 0000000..f70e760
> --- /dev/null
> +++
> b/bitbake-setup/processor-sdk_processor-sdk-scarthgap-10.01.10.04-config.=
json
> @@ -0,0 +1,136 @@
> +{
> +  "version": "1.0",
> +  "description": "TI Processor SDK v10.01.10.04",
> +  "sources": {
> +    "oe-layersetup": {
> +      "git-remote": {
> +        "remotes": {
> +          "origin": {
> +            "uri": "
> https://git.ti.com/git/arago-project/oe-layersetup.git"
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
> +    "meta-qt5": {
> +      "git-remote": {
> +        "remotes": {
> +          "origin": {
> +            "uri": "https://github.com/meta-qt5/meta-qt5.git"
> +          }
> +        },
> +        "rev": "scarthgap"
> +      },
> +      "path": "meta-qt5"
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
> +  "configuration": {
> +    "bitbake-setup": {
> +      "default": {
> +        "description": "Default build configuration",
> +         "template":
> "oe-layersetup-processor-sdk_processor-sdk-scarthgap-10.01.10.04-config",
> +         "targets": [ "bitbake -k tisdk-default-image" ]
> +      }
> +    }
> +  }
> +}
> diff --git
> a/bitbake-setup/processor-sdk_processor-sdk-scarthgap-chromium-10.01.10.0=
4-config.json
> b/bitbake-setup/processor-sdk_processor-sdk-scarthgap-chromium-10.01.10.0=
4-config.json
> new file mode 100644
> index 0000000..fa0a0bd
> --- /dev/null
> +++
> b/bitbake-setup/processor-sdk_processor-sdk-scarthgap-chromium-10.01.10.0=
4-config.json
> @@ -0,0 +1,158 @@
> +{
> +  "version": "1.0",
> +  "description": "TI Processor SDK vchromium-10.01.10.04",
> +  "sources": {
> +    "oe-layersetup": {
> +      "git-remote": {
> +        "remotes": {
> +          "origin": {
> +            "uri": "
> https://git.ti.com/git/arago-project/oe-layersetup.git"
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
> +    "meta-qt5": {
> +      "git-remote": {
> +        "remotes": {
> +          "origin": {
> +            "uri": "https://github.com/meta-qt5/meta-qt5.git"
> +          }
> +        },
> +        "rev": "scarthgap"
> +      },
> +      "path": "meta-qt5"
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
> +    "meta-edgeai": {
> +      "git-remote": {
> +        "remotes": {
> +          "origin": {
> +            "uri": "https://git.ti.com/git/edgeai/meta-edgeai.git"
> +          }
> +        },
> +        "rev": "scarthgap"
> +      },
> +      "path": "meta-edgeai"
> +    }
> +  },
> +  "configuration": {
> +    "bitbake-setup": {
> +      "default": {
> +        "description": "Default build configuration",
> +         "template":
> "oe-layersetup-processor-sdk_processor-sdk-scarthgap-chromium-10.01.10.04=
-config",
> +         "targets": [ "bitbake -k tisdk-default-image" ]
> +      }
> +    }
> +  }
> +}
> diff --git
> a/conf/templates/processor-sdk_processor-sdk-scarthgap-10.01.10.04-config=
/bblayers.conf.sample
> b/conf/templates/processor-sdk_processor-sdk-scarthgap-10.01.10.04-config=
/bblayers.conf.sample
> new file mode 100644
> index 0000000..10bcf2d
> --- /dev/null
> +++
> b/conf/templates/processor-sdk_processor-sdk-scarthgap-10.01.10.04-config=
/bblayers.conf.sample
> @@ -0,0 +1,32 @@
> +# This template file was created by taking the
> oe-core/meta/conf/bblayers.conf
> +# file and removing the BBLAYERS section at the end.
> +
> +# LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf
> +# changes incompatibly
> +LCONF_VERSION =3D "5"
> +
> +BBPATH =3D "${TOPDIR}"
> +BBFILES ?=3D ""
> +
> +BBLAYERS ?=3D " \
> +    ##OEROOT##/../meta-tisdk
> +    ##OEROOT##/../meta-arago/meta-arago-distro
> +    ##OEROOT##/../meta-arago/meta-arago-extras
> +    ##OEROOT##/../meta-arago/meta-arago-demos
> +    ##OEROOT##/../meta-arago/meta-arago-test
> +    ##OEROOT##/../meta-qt5
> +    ##OEROOT##/../meta-virtualization
> +    ##OEROOT##/../meta-openembedded/meta-networking
> +    ##OEROOT##/../meta-openembedded/meta-python
> +    ##OEROOT##/../meta-openembedded/meta-oe
> +    ##OEROOT##/../meta-openembedded/meta-gnome
> +    ##OEROOT##/../meta-openembedded/meta-filesystems
> +    ##OEROOT##/../meta-openembedded/meta-multimedia
> +    ##OEROOT##/../meta-ti/meta-ti-extras
> +    ##OEROOT##/../meta-ti/meta-ti-bsp
> +    ##OEROOT##/../meta-arm/meta-arm
> +    ##OEROOT##/../meta-arm/meta-arm-toolchain
> +    ##OEROOT##/../meta-clang
> +    ##OEROOT##/../oe-core/meta
> +    ##OEROOT##/../oe-layersetup
> +"
> diff --git
> a/conf/templates/processor-sdk_processor-sdk-scarthgap-10.01.10.04-config=
/conf-notes.txt
> b/conf/templates/processor-sdk_processor-sdk-scarthgap-10.01.10.04-config=
/conf-notes.txt
> new file mode 100644
> index 0000000..1880460
> --- /dev/null
> +++
> b/conf/templates/processor-sdk_processor-sdk-scarthgap-10.01.10.04-config=
/conf-notes.txt
> @@ -0,0 +1,22 @@
> +
> +### Shell environment set up for builds. ###
> +
> +You can now run 'bitbake <target>'
> +
> +If you have not set MACHINE in your local.conf you can run
> +'MACHINE=3Dxxxxx bitbake <target>'
> +
> +Common targets are:
> +    tisdk-default-image
> +    tisdk-base-image
> +    tisdk-bootstrap-base-image
> +    tisdk-bootstrap-image
> +    tisdk-thinlinux-image
> +    tisdk-tiny-image
> +
> +You can also run generated qemu images with a command like 'runqemu
> qemux86-64'.
> +
> +Other commonly useful commands are:
> + - 'devtool' and 'recipetool' handle common recipe tasks
> + - 'bitbake-layers' handles common layer tasks
> + - 'oe-pkgdata-util' handles common target package tasks
> diff --git
> a/conf/templates/processor-sdk_processor-sdk-scarthgap-10.01.10.04-config=
/conf-summary.txt
> b/conf/templates/processor-sdk_processor-sdk-scarthgap-10.01.10.04-config=
/conf-summary.txt
> new file mode 100644
> index 0000000..5e1739a
> --- /dev/null
> +++
> b/conf/templates/processor-sdk_processor-sdk-scarthgap-10.01.10.04-config=
/conf-summary.txt
> @@ -0,0 +1 @@
> +TI Processor SDK v10.01.10.04
> diff --git
> a/conf/templates/processor-sdk_processor-sdk-scarthgap-10.01.10.04-config=
/local.conf.sample
> b/conf/templates/processor-sdk_processor-sdk-scarthgap-10.01.10.04-config=
/local.conf.sample
> new file mode 100644
> index 0000000..7575b4b
> --- /dev/null
> +++
> b/conf/templates/processor-sdk_processor-sdk-scarthgap-10.01.10.04-config=
/local.conf.sample
> @@ -0,0 +1,175 @@
> +# CONF_VERSION is increased each time build/conf/ changes incompatibly
> +CONF_VERSION =3D "2"
> +
> +#
> +# Where to place downloads
> +#
> +# During a first build the system will download many different source co=
de
> +# tarballs from various upstream projects. This can take a while,
> particularly
> +# if your network connection is slow. These are all stored in DL_DIR. Wh=
en
> +# wiping and rebuilding you can preserve this directory to speed up this
> part
> +# of subsequent builds. This directory is safe to share between multiple
> builds
> +# on the same machine too.
> +DL_DIR =3D "${TOPDIR}/downloads"
> +
> +#
> +# Where to place shared-state files
> +#
> +# BitBake has the capability to accelerate builds based on previously
> built
> +# output. This is done using "shared state" files which can be thought o=
f
> as
> +# cache objects and this option determines where those files are placed.
> +#
> +# You can wipe out TMPDIR leaving this directory intact and the build
> would
> +# regenerate from these files if no changes were made to the
> configuration.
> +# If changes were made to the configuration, only shared state files
> where the
> +# state was still valid would be used (done using checksums).
> +SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> +
> +#
> +# Shared-state files from other locations
> +#
> +# As mentioned above, shared state files are prebuilt cache data objects
> which
> +# can be used to accelerate build time. This variable can be used to
> configure
> +# the system to search other mirror locations for these objects before i=
t
> +# builds the data itself.
> +#
> +# This can be a filesystem directory, or a remote url such as http or ft=
p.
> +# These would contain the sstate-cache results from previous builds
> (possibly
> +# from other machines). This variable works like fetcher
> MIRRORS/PREMIRRORS
> +# and points to the cache locations to check for the shared objects.
> +#SSTATE_MIRRORS ?=3D "\
> +#file://.* http://someserver.tld/share/sstate/ \n \
> +#file://.* file:///some/local/dir/sstate/"
> +
> +#
> +# Where to place the build output
> +#
> +# This option specifies where the bulk of the building work should be
> done and
> +# where BitBake should place its temporary files and output. Keep in min=
d
> that
> +# this includes the extraction and compilation of many applications and
> the toolchain
> +# which can use Gigabytes of hard disk space.
> +TMPDIR =3D "${TOPDIR}/arago-tmp"
> +
> +# By default, DEPLOY_DIR is inside TMPDIR, but can be changed here to be
> outside
> +#DEPLOY_DIR =3D "${TOPDIR}/deploy"
> +
> +#
> +# Machine Selection
> +#
> +# You need to select a specific machine to target the build with. There
> are a selection
> +# of emulated machines available which can boot and run in the QEMU
> emulator:
> +#
> +#MACHINE ?=3D "arago"
> +
> +#
> +# Package Management configuration
> +#
> +# This variable lists which packaging formats to enable. Multiple packag=
e
> backends
> +# can be enabled at once and the first item listed in the variable will
> be used
> +# to generate the root filesystems.
> +# Options are:
> +#  - 'package_deb' for debian style deb files
> +#  - 'package_ipk' for ipk files are used by opkg (a debian style
> embedded package manager)
> +#  - 'package_rpm' for rpm style packages
> +# E.g.: PACKAGE_CLASSES ?=3D "package_rpm package_deb package_ipk"
> +# We default to ipk:
> +PACKAGE_CLASSES ?=3D "package_ipk"
> +
> +#
> +# SDK/ADT target architecture
> +#
> +# This variable specified the architecture to build SDK/ADT items for an=
d
> means
> +# you can build the SDK packages for architectures other than the machin=
e
> you are
> +# running the build on (i.e. building i686 packages on an x86_64 host._
> +# Supported values are i686 and x86_64
> +SDKMACHINE ?=3D "x86_64"
> +
> +#
> +# Extra image configuration defaults
> +#
> +# The EXTRA_IMAGE_FEATURES variable allows extra packages to be added to
> the generated
> +# images. Some of these options are added to certain image types
> automatically. The
> +# variable can contain the following options:
> +#  "dbg-pkgs"       - add -dbg packages for all installed packages
> +#                     (adds symbol information for debugging/profiling)
> +#  "dev-pkgs"       - add -dev packages for all installed packages
> +#                     (useful if you want to develop against libs in the
> image)
> +#  "tools-sdk"      - add development tools (gcc, make, pkgconfig etc.)
> +#  "tools-debug"    - add debugging tools (gdb, strace)
> +#  "tools-profile"  - add profiling tools (oprofile, exmap, lttng
> valgrind (x86 only))
> +#  "tools-testapps" - add useful testing tools (ts_print, aplay, arecord
> etc.)
> +#  "debug-tweaks"   - make an image suitable for development
> +#                     e.g. ssh root access has a blank password
> +# There are other application targets that can be used here too, see
> +# meta/classes/image.bbclass and meta/classes/core-image.bbclass for mor=
e
> details.
> +# We default to enabling the debugging tweaks.
> +EXTRA_IMAGE_FEATURES =3D "debug-tweaks"
> +
> +#
> +# Additional image features
> +#
> +# The following is a list of additional classes to use when building
> images which
> +# enable extra features. Some available options which can be included in
> this variable
> +# are:
> +#   - 'buildstats' collect build statistics
> +#   - 'image-swab' to perform host system intrusion detection
> +# NOTE: mklibs also needs to be explicitly enabled for a given image, se=
e
> local.conf.extended
> +USER_CLASSES ?=3D "buildstats"
> +
> +# By default disable interactive patch resolution (tasks will just fail
> instead):
> +PATCHRESOLVE =3D "noop"
> +
> +# By default the machine configuration file sets the IMAGE_FSTYPES.  But
> if you
> +# would like to add additional file system types you can uncomment the
> +# following line and add the additional IMAGE_FSTYPES you want created
> +# as part of the build flow.  Some common types are listed below and you
> +# can remove the ones you do not want.
> +# IMAGE_FSTYPES +=3D "jffs2 cramfs ext2.gz ext3.gz squashfs ubi tar.gz
> tar.bz2 cpio"
> +
> +#
> +# Parallelism Options
> +#
> +# These two options control how much parallelism BitBake should use. The
> first
> +# option determines how many tasks bitbake should run in parallel:
> +#
> +# BB_NUMBER_THREADS ?=3D "1"
> +#
> +# The second option controls how many processes make should run in
> parallel when
> +# running compile tasks:
> +#
> +# PARALLEL_MAKE ?=3D "-j 1"
> +#
> +# For a quad-core machine, BB_NUMBER_THREADS =3D "4", PARALLEL_MAKE =3D =
"-j
> 4" would
> +# be appropriate for example
> +#
> +# NOTE: By default, bitbake will choose the number of processeors on you=
r
> host
> +# so you should not need to set this unless you are wanting to lower the
> number
> +# allowed.
> +#
> +
> +DISTRO   =3D "arago"
> +
> +# Set terminal types by default it expects gnome-terminal
> +# but we chose xterm
> +TERMCMD =3D "${XTERM_TERMCMD}"
> +TERMCMDRUN =3D "${XTERM_TERMCMDRUN}"
> +
> +# Don't generate the mirror tarball for SCM repos, the snapshot is enoug=
h
> +BB_GENERATE_MIRROR_TARBALLS =3D "0"
> +
> +# Uncomment this to remove work directory after packaging to save disk
> space
> +#INHERIT +=3D "rm_work"
> +
> +# Keep one set of images by default
> +RM_OLD_IMAGE =3D "1"
> +
> +# Enable local PR service for binary feeds
> +PRSERV_HOST =3D "localhost:0"
> +
> +# Enable hash equiv server
> +BB_SIGNATURE_HANDLER =3D "OEEquivHash"
> +BB_HASHSERVE =3D "auto"
> +
> +# It is recommended to activate "buildhistory" for testing the PR servic=
e
> +INHERIT +=3D "buildhistory"
> +BUILDHISTORY_COMMIT =3D "1"
> diff --git
> a/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.01.10.=
04-config/bblayers.conf.sample
> b/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.01.10.=
04-config/bblayers.conf.sample
> new file mode 100644
> index 0000000..55a10df
> --- /dev/null
> +++
> b/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.01.10.=
04-config/bblayers.conf.sample
> @@ -0,0 +1,34 @@
> +# This template file was created by taking the
> oe-core/meta/conf/bblayers.conf
> +# file and removing the BBLAYERS section at the end.
> +
> +# LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf
> +# changes incompatibly
> +LCONF_VERSION =3D "5"
> +
> +BBPATH =3D "${TOPDIR}"
> +BBFILES ?=3D ""
> +
> +BBLAYERS ?=3D " \
> +    ##OEROOT##/../meta-tisdk
> +    ##OEROOT##/../meta-arago/meta-arago-distro
> +    ##OEROOT##/../meta-arago/meta-arago-extras
> +    ##OEROOT##/../meta-arago/meta-arago-demos
> +    ##OEROOT##/../meta-arago/meta-arago-test
> +    ##OEROOT##/../meta-browser/meta-chromium
> +    ##OEROOT##/../meta-qt5
> +    ##OEROOT##/../meta-virtualization
> +    ##OEROOT##/../meta-openembedded/meta-networking
> +    ##OEROOT##/../meta-openembedded/meta-python
> +    ##OEROOT##/../meta-openembedded/meta-oe
> +    ##OEROOT##/../meta-openembedded/meta-gnome
> +    ##OEROOT##/../meta-openembedded/meta-filesystems
> +    ##OEROOT##/../meta-openembedded/meta-multimedia
> +    ##OEROOT##/../meta-ti/meta-ti-extras
> +    ##OEROOT##/../meta-ti/meta-ti-bsp
> +    ##OEROOT##/../meta-arm/meta-arm
> +    ##OEROOT##/../meta-arm/meta-arm-toolchain
> +    ##OEROOT##/../meta-clang
> +    ##OEROOT##/../oe-core/meta
> +    ##OEROOT##/../meta-edgeai
> +    ##OEROOT##/../oe-layersetup
> +"
> diff --git
> a/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.01.10.=
04-config/conf-notes.txt
> b/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.01.10.=
04-config/conf-notes.txt
> new file mode 100644
> index 0000000..1880460
> --- /dev/null
> +++
> b/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.01.10.=
04-config/conf-notes.txt
> @@ -0,0 +1,22 @@
> +
> +### Shell environment set up for builds. ###
> +
> +You can now run 'bitbake <target>'
> +
> +If you have not set MACHINE in your local.conf you can run
> +'MACHINE=3Dxxxxx bitbake <target>'
> +
> +Common targets are:
> +    tisdk-default-image
> +    tisdk-base-image
> +    tisdk-bootstrap-base-image
> +    tisdk-bootstrap-image
> +    tisdk-thinlinux-image
> +    tisdk-tiny-image
> +
> +You can also run generated qemu images with a command like 'runqemu
> qemux86-64'.
> +
> +Other commonly useful commands are:
> + - 'devtool' and 'recipetool' handle common recipe tasks
> + - 'bitbake-layers' handles common layer tasks
> + - 'oe-pkgdata-util' handles common target package tasks
> diff --git
> a/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.01.10.=
04-config/conf-summary.txt
> b/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.01.10.=
04-config/conf-summary.txt
> new file mode 100644
> index 0000000..18049f6
> --- /dev/null
> +++
> b/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.01.10.=
04-config/conf-summary.txt
> @@ -0,0 +1 @@
> +TI Processor SDK vchromium-10.01.10.04
> diff --git
> a/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.01.10.=
04-config/local.conf.sample
> b/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.01.10.=
04-config/local.conf.sample
> new file mode 100644
> index 0000000..7575b4b
> --- /dev/null
> +++
> b/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.01.10.=
04-config/local.conf.sample
> @@ -0,0 +1,175 @@
> +# CONF_VERSION is increased each time build/conf/ changes incompatibly
> +CONF_VERSION =3D "2"
> +
> +#
> +# Where to place downloads
> +#
> +# During a first build the system will download many different source co=
de
> +# tarballs from various upstream projects. This can take a while,
> particularly
> +# if your network connection is slow. These are all stored in DL_DIR. Wh=
en
> +# wiping and rebuilding you can preserve this directory to speed up this
> part
> +# of subsequent builds. This directory is safe to share between multiple
> builds
> +# on the same machine too.
> +DL_DIR =3D "${TOPDIR}/downloads"
> +
> +#
> +# Where to place shared-state files
> +#
> +# BitBake has the capability to accelerate builds based on previously
> built
> +# output. This is done using "shared state" files which can be thought o=
f
> as
> +# cache objects and this option determines where those files are placed.
> +#
> +# You can wipe out TMPDIR leaving this directory intact and the build
> would
> +# regenerate from these files if no changes were made to the
> configuration.
> +# If changes were made to the configuration, only shared state files
> where the
> +# state was still valid would be used (done using checksums).
> +SSTATE_DIR =3D "${TOPDIR}/build/sstate-cache"
> +
> +#
> +# Shared-state files from other locations
> +#
> +# As mentioned above, shared state files are prebuilt cache data objects
> which
> +# can be used to accelerate build time. This variable can be used to
> configure
> +# the system to search other mirror locations for these objects before i=
t
> +# builds the data itself.
> +#
> +# This can be a filesystem directory, or a remote url such as http or ft=
p.
> +# These would contain the sstate-cache results from previous builds
> (possibly
> +# from other machines). This variable works like fetcher
> MIRRORS/PREMIRRORS
> +# and points to the cache locations to check for the shared objects.
> +#SSTATE_MIRRORS ?=3D "\
> +#file://.* http://someserver.tld/share/sstate/ \n \
> +#file://.* file:///some/local/dir/sstate/"
> +
> +#
> +# Where to place the build output
> +#
> +# This option specifies where the bulk of the building work should be
> done and
> +# where BitBake should place its temporary files and output. Keep in min=
d
> that
> +# this includes the extraction and compilation of many applications and
> the toolchain
> +# which can use Gigabytes of hard disk space.
> +TMPDIR =3D "${TOPDIR}/arago-tmp"
> +
> +# By default, DEPLOY_DIR is inside TMPDIR, but can be changed here to be
> outside
> +#DEPLOY_DIR =3D "${TOPDIR}/deploy"
> +
> +#
> +# Machine Selection
> +#
> +# You need to select a specific machine to target the build with. There
> are a selection
> +# of emulated machines available which can boot and run in the QEMU
> emulator:
> +#
> +#MACHINE ?=3D "arago"
> +
> +#
> +# Package Management configuration
> +#
> +# This variable lists which packaging formats to enable. Multiple packag=
e
> backends
> +# can be enabled at once and the first item listed in the variable will
> be used
> +# to generate the root filesystems.
> +# Options are:
> +#  - 'package_deb' for debian style deb files
> +#  - 'package_ipk' for ipk files are used by opkg (a debian style
> embedded package manager)
> +#  - 'package_rpm' for rpm style packages
> +# E.g.: PACKAGE_CLASSES ?=3D "package_rpm package_deb package_ipk"
> +# We default to ipk:
> +PACKAGE_CLASSES ?=3D "package_ipk"
> +
> +#
> +# SDK/ADT target architecture
> +#
> +# This variable specified the architecture to build SDK/ADT items for an=
d
> means
> +# you can build the SDK packages for architectures other than the machin=
e
> you are
> +# running the build on (i.e. building i686 packages on an x86_64 host._
> +# Supported values are i686 and x86_64
> +SDKMACHINE ?=3D "x86_64"
> +
> +#
> +# Extra image configuration defaults
> +#
> +# The EXTRA_IMAGE_FEATURES variable allows extra packages to be added to
> the generated
> +# images. Some of these options are added to certain image types
> automatically. The
> +# variable can contain the following options:
> +#  "dbg-pkgs"       - add -dbg packages for all installed packages
> +#                     (adds symbol information for debugging/profiling)
> +#  "dev-pkgs"       - add -dev packages for all installed packages
> +#                     (useful if you want to develop against libs in the
> image)
> +#  "tools-sdk"      - add development tools (gcc, make, pkgconfig etc.)
> +#  "tools-debug"    - add debugging tools (gdb, strace)
> +#  "tools-profile"  - add profiling tools (oprofile, exmap, lttng
> valgrind (x86 only))
> +#  "tools-testapps" - add useful testing tools (ts_print, aplay, arecord
> etc.)
> +#  "debug-tweaks"   - make an image suitable for development
> +#                     e.g. ssh root access has a blank password
> +# There are other application targets that can be used here too, see
> +# meta/classes/image.bbclass and meta/classes/core-image.bbclass for mor=
e
> details.
> +# We default to enabling the debugging tweaks.
> +EXTRA_IMAGE_FEATURES =3D "debug-tweaks"
> +
> +#
> +# Additional image features
> +#
> +# The following is a list of additional classes to use when building
> images which
> +# enable extra features. Some available options which can be included in
> this variable
> +# are:
> +#   - 'buildstats' collect build statistics
> +#   - 'image-swab' to perform host system intrusion detection
> +# NOTE: mklibs also needs to be explicitly enabled for a given image, se=
e
> local.conf.extended
> +USER_CLASSES ?=3D "buildstats"
> +
> +# By default disable interactive patch resolution (tasks will just fail
> instead):
> +PATCHRESOLVE =3D "noop"
> +
> +# By default the machine configuration file sets the IMAGE_FSTYPES.  But
> if you
> +# would like to add additional file system types you can uncomment the
> +# following line and add the additional IMAGE_FSTYPES you want created
> +# as part of the build flow.  Some common types are listed below and you
> +# can remove the ones you do not want.
> +# IMAGE_FSTYPES +=3D "jffs2 cramfs ext2.gz ext3.gz squashfs ubi tar.gz
> tar.bz2 cpio"
> +
> +#
> +# Parallelism Options
> +#
> +# These two options control how much parallelism BitBake should use. The
> first
> +# option determines how many tasks bitbake should run in parallel:
> +#
> +# BB_NUMBER_THREADS ?=3D "1"
> +#
> +# The second option controls how many processes make should run in
> parallel when
> +# running compile tasks:
> +#
> +# PARALLEL_MAKE ?=3D "-j 1"
> +#
> +# For a quad-core machine, BB_NUMBER_THREADS =3D "4", PARALLEL_MAKE =3D =
"-j
> 4" would
> +# be appropriate for example
> +#
> +# NOTE: By default, bitbake will choose the number of processeors on you=
r
> host
> +# so you should not need to set this unless you are wanting to lower the
> number
> +# allowed.
> +#
> +
> +DISTRO   =3D "arago"
> +
> +# Set terminal types by default it expects gnome-terminal
> +# but we chose xterm
> +TERMCMD =3D "${XTERM_TERMCMD}"
> +TERMCMDRUN =3D "${XTERM_TERMCMDRUN}"
> +
> +# Don't generate the mirror tarball for SCM repos, the snapshot is enoug=
h
> +BB_GENERATE_MIRROR_TARBALLS =3D "0"
> +
> +# Uncomment this to remove work directory after packaging to save disk
> space
> +#INHERIT +=3D "rm_work"
> +
> +# Keep one set of images by default
> +RM_OLD_IMAGE =3D "1"
> +
> +# Enable local PR service for binary feeds
> +PRSERV_HOST =3D "localhost:0"
> +
> +# Enable hash equiv server
> +BB_SIGNATURE_HANDLER =3D "OEEquivHash"
> +BB_HASHSERVE =3D "auto"
> +
> +# It is recommended to activate "buildhistory" for testing the PR servic=
e
> +INHERIT +=3D "buildhistory"
> +BUILDHISTORY_COMMIT =3D "1"
> diff --git
> a/configs/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.txt
> b/configs/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.txt
> new file mode 100644
> index 0000000..b1281e5
> --- /dev/null
> +++ b/configs/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.tx=
t
> @@ -0,0 +1,17 @@
> +# This file takes repo entries in the format
> +# repo name,repo uri,repo branch,repo
> commit[,layers=3Dlayer1:layer2...:layern]
> +
> +bitbake,
> https://git.openembedded.org/bitbake,2.8,6c2641f7a9e92c1b82e306f59ddd3c12=
49c52cbf
>
> +meta-tisdk,https://github.com/TexasInstruments/meta-tisdk.git,scarthgap,=
10.01.10.04,layers=3D
>
> +meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,10.01.10,la=
yers=3Dmeta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
>
> +meta-qt5,https://github.com/meta-qt5/meta-qt5.git,scarthgap,eb828418264a=
49b8d00035cb3d7b12fcea3be801,layers=3D
>
> +meta-virtualization,https://git.yoctoproject.org/meta-virtualization,sca=
rthgap,450941a1b6df96285691e8c23d4f332d3c88a994,layers=3D
>
> +meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthg=
ap,b8d1a14f7f3b76457c36752202ea7ae5881b6654,layers=3Dmeta-networking:meta-p=
ython:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
>
> +meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,10.01.10,layers=
=3Dmeta-ti-extras:meta-ti-bsp
>
> +meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,7088279c0ab00c7=
dabefdd4544951b4746b48476,layers=3Dmeta-arm:meta-arm-toolchain
>
> +meta-clang,https://github.com/kraj/meta-clang,scarthgap,9fbfa9db33131abd=
f3870a94f00199eb53e276e5,layers=3D
>
> +oe-core,https://git.openembedded.org/openembedded-core,scarthgap,dac630a=
b5ee7aa6c5c7c294093adbd11b116c765,layers=3Dmeta
> <https://git.openembedded.org/bitbake,2.8,6c2641f7a9e92c1b82e306f59ddd3c1=
249c52cbf+meta-tisdk,https://github.com/TexasInstruments/meta-tisdk.git,sca=
rthgap,10.01.10.04,layers=3D+meta-arago,https://git.yoctoproject.org/meta-a=
rago,scarthgap,10.01.10,layers=3Dmeta-arago-distro:meta-arago-extras:meta-a=
rago-demos:meta-arago-test+meta-qt5,https://github.com/meta-qt5/meta-qt5.gi=
t,scarthgap,eb828418264a49b8d00035cb3d7b12fcea3be801,layers=3D+meta-virtual=
ization,https://git.yoctoproject.org/meta-virtualization,scarthgap,450941a1=
b6df96285691e8c23d4f332d3c88a994,layers=3D+meta-openembedded,https://git.op=
enembedded.org/meta-openembedded,scarthgap,b8d1a14f7f3b76457c36752202ea7ae5=
881b6654,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-files=
ystems:meta-multimedia+meta-ti,https://git.yoctoproject.org/meta-ti,scarthg=
ap,10.01.10,layers=3Dmeta-ti-extras:meta-ti-bsp+meta-arm,https://git.yoctop=
roject.org/meta-arm,scarthgap,7088279c0ab00c7dabefdd4544951b4746b48476,laye=
rs=3Dmeta-arm:meta-arm-toolchain+meta-clang,https://github.com/kraj/meta-cl=
ang,scarthgap,9fbfa9db33131abdf3870a94f00199eb53e276e5,layers=3D+oe-core,ht=
tps://git.openembedded.org/openembedded-core,scarthgap,dac630ab5ee7aa6c5c7c=
294093adbd11b116c765,layers=3Dmeta>
> +
> +OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
> +OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.sample
> +BITBAKE_INCLUSIVE_VARS=3Dyes
> diff --git
> a/configs/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-conf=
ig.txt
> b/configs/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-conf=
ig.txt
> new file mode 100644
> index 0000000..5372ca8
> --- /dev/null
> +++
> b/configs/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-conf=
ig.txt
> @@ -0,0 +1,19 @@
> +# This file takes repo entries in the format
> +# repo name,repo uri,repo branch,repo
> commit[,layers=3Dlayer1:layer2...:layern]
> +
> +bitbake,
> https://git.openembedded.org/bitbake,2.8,6c2641f7a9e92c1b82e306f59ddd3c12=
49c52cbf
>
> +meta-tisdk,https://github.com/TexasInstruments/meta-tisdk.git,scarthgap,=
10.01.10.04,layers=3D
>
> +meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,10.01.10,la=
yers=3Dmeta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
>
> +meta-browser,https://github.com/OSSystems/meta-browser.git,master,1ed225=
4d72a4c25879014c98be287a7e3e22904c,layers=3Dmeta-chromium
>
> +meta-qt5,https://github.com/meta-qt5/meta-qt5.git,scarthgap,eb828418264a=
49b8d00035cb3d7b12fcea3be801,layers=3D
>
> +meta-virtualization,https://git.yoctoproject.org/meta-virtualization,sca=
rthgap,450941a1b6df96285691e8c23d4f332d3c88a994,layers=3D
>
> +meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthg=
ap,b8d1a14f7f3b76457c36752202ea7ae5881b6654,layers=3Dmeta-networking:meta-p=
ython:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
>
> +meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,10.01.10,layers=
=3Dmeta-ti-extras:meta-ti-bsp
>
> +meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,7088279c0ab00c7=
dabefdd4544951b4746b48476,layers=3Dmeta-arm:meta-arm-toolchain
>
> +meta-clang,https://github.com/kraj/meta-clang,scarthgap,9fbfa9db33131abd=
f3870a94f00199eb53e276e5,layers=3D
>
> +oe-core,https://git.openembedded.org/openembedded-core,scarthgap,dac630a=
b5ee7aa6c5c7c294093adbd11b116c765,layers=3Dmeta
>
> +meta-edgeai,https://git.ti.com/git/edgeai/meta-edgeai.git,scarthgap,10.0=
1.10.04,layers=3D
> <https://git.openembedded.org/bitbake,2.8,6c2641f7a9e92c1b82e306f59ddd3c1=
249c52cbf+meta-tisdk,https://github.com/TexasInstruments/meta-tisdk.git,sca=
rthgap,10.01.10.04,layers=3D+meta-arago,https://git.yoctoproject.org/meta-a=
rago,scarthgap,10.01.10,layers=3Dmeta-arago-distro:meta-arago-extras:meta-a=
rago-demos:meta-arago-test+meta-browser,https://github.com/OSSystems/meta-b=
rowser.git,master,1ed2254d72a4c25879014c98be287a7e3e22904c,layers=3Dmeta-ch=
romium+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,scarthgap,eb828418=
264a49b8d00035cb3d7b12fcea3be801,layers=3D+meta-virtualization,https://git.=
yoctoproject.org/meta-virtualization,scarthgap,450941a1b6df96285691e8c23d4f=
332d3c88a994,layers=3D+meta-openembedded,https://git.openembedded.org/meta-=
openembedded,scarthgap,b8d1a14f7f3b76457c36752202ea7ae5881b6654,layers=3Dme=
ta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimed=
ia+meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,10.01.10,layers=
=3Dmeta-ti-extras:meta-ti-bsp+meta-arm,https://git.yoctoproject.org/meta-ar=
m,scarthgap,7088279c0ab00c7dabefdd4544951b4746b48476,layers=3Dmeta-arm:meta=
-arm-toolchain+meta-clang,https://github.com/kraj/meta-clang,scarthgap,9fbf=
a9db33131abdf3870a94f00199eb53e276e5,layers=3D+oe-core,https://git.openembe=
dded.org/openembedded-core,scarthgap,dac630ab5ee7aa6c5c7c294093adbd11b116c7=
65,layers=3Dmeta+meta-edgeai,https://git.ti.com/git/edgeai/meta-edgeai.git,=
scarthgap,10.01.10.04,layers=3D>
> +
> +OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
> +OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.sample
> +BITBAKE_INCLUSIVE_VARS=3Dyes
> diff --git
> a/kas/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.yml
> b/kas/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.yml
> new file mode 100644
> index 0000000..2dc2f5c
> --- /dev/null
> +++ b/kas/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.yml
> @@ -0,0 +1,74 @@
> +header:
> +  version: 17
> +  includes:
> +    - ../templates/bblayers.conf.yml
> +    - ../templates/local-arago64-v2.conf.yml
> +
> +target: tisdk-default-image
> +
> +repos:
> +  meta-tisdk:
> +    url: "https://github.com/TexasInstruments/meta-tisdk.git"
> +    branch: "scarthgap"
> +    commit: "10.01.10.04"
> +
> +  meta-arago:
> +    url: "https://git.yoctoproject.org/meta-arago"
> +    branch: "scarthgap"
> +    commit: "10.01.10"
> +    layers:
> +      meta-arago-distro:
> +      meta-arago-extras:
> +      meta-arago-demos:
> +      meta-arago-test:
> +
> +  meta-qt5:
> +    url: "https://github.com/meta-qt5/meta-qt5.git"
> +    branch: "scarthgap"
> +    commit: "eb828418264a49b8d00035cb3d7b12fcea3be801"
> +
> +  meta-virtualization:
> +    url: "https://git.yoctoproject.org/meta-virtualization"
> +    branch: "scarthgap"
> +    commit: "450941a1b6df96285691e8c23d4f332d3c88a994"
> +
> +  meta-openembedded:
> +    url: "https://git.openembedded.org/meta-openembedded"
> +    branch: "scarthgap"
> +    commit: "b8d1a14f7f3b76457c36752202ea7ae5881b6654"
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
> +    branch: "scarthgap"
> +    commit: "10.01.10"
> +    layers:
> +      meta-ti-extras:
> +      meta-ti-bsp:
> +
> +  meta-arm:
> +    url: "https://git.yoctoproject.org/meta-arm"
> +    branch: "scarthgap"
> +    commit: "7088279c0ab00c7dabefdd4544951b4746b48476"
> +    layers:
> +      meta-arm:
> +      meta-arm-toolchain:
> +
> +  meta-clang:
> +    url: "https://github.com/kraj/meta-clang"
> +    branch: "scarthgap"
> +    commit: "9fbfa9db33131abdf3870a94f00199eb53e276e5"
> +
> +  oe-core:
> +    url: "https://git.openembedded.org/openembedded-core"
> +    branch: "scarthgap"
> +    commit: "dac630ab5ee7aa6c5c7c294093adbd11b116c765"
> +    layers:
> +      meta:
> +
> diff --git
> a/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-config.y=
ml
> b/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-config.y=
ml
> new file mode 100644
> index 0000000..351d9ea
> --- /dev/null
> +++
> b/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-config.y=
ml
> @@ -0,0 +1,86 @@
> +header:
> +  version: 17
> +  includes:
> +    - ../templates/bblayers.conf.yml
> +    - ../templates/local-arago64-v2.conf.yml
> +
> +target: tisdk-default-image
> +
> +repos:
> +  meta-tisdk:
> +    url: "https://github.com/TexasInstruments/meta-tisdk.git"
> +    branch: "scarthgap"
> +    commit: "10.01.10.04"
> +
> +  meta-arago:
> +    url: "https://git.yoctoproject.org/meta-arago"
> +    branch: "scarthgap"
> +    commit: "10.01.10"
> +    layers:
> +      meta-arago-distro:
> +      meta-arago-extras:
> +      meta-arago-demos:
> +      meta-arago-test:
> +
> +  meta-browser:
> +    url: "https://github.com/OSSystems/meta-browser.git"
> +    branch: "master"
> +    commit: "1ed2254d72a4c25879014c98be287a7e3e22904c"
> +    layers:
> +      meta-chromium:
> +
> +  meta-qt5:
> +    url: "https://github.com/meta-qt5/meta-qt5.git"
> +    branch: "scarthgap"
> +    commit: "eb828418264a49b8d00035cb3d7b12fcea3be801"
> +
> +  meta-virtualization:
> +    url: "https://git.yoctoproject.org/meta-virtualization"
> +    branch: "scarthgap"
> +    commit: "450941a1b6df96285691e8c23d4f332d3c88a994"
> +
> +  meta-openembedded:
> +    url: "https://git.openembedded.org/meta-openembedded"
> +    branch: "scarthgap"
> +    commit: "b8d1a14f7f3b76457c36752202ea7ae5881b6654"
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
> +    branch: "scarthgap"
> +    commit: "10.01.10"
> +    layers:
> +      meta-ti-extras:
> +      meta-ti-bsp:
> +
> +  meta-arm:
> +    url: "https://git.yoctoproject.org/meta-arm"
> +    branch: "scarthgap"
> +    commit: "7088279c0ab00c7dabefdd4544951b4746b48476"
> +    layers:
> +      meta-arm:
> +      meta-arm-toolchain:
> +
> +  meta-clang:
> +    url: "https://github.com/kraj/meta-clang"
> +    branch: "scarthgap"
> +    commit: "9fbfa9db33131abdf3870a94f00199eb53e276e5"
> +
> +  oe-core:
> +    url: "https://git.openembedded.org/openembedded-core"
> +    branch: "scarthgap"
> +    commit: "dac630ab5ee7aa6c5c7c294093adbd11b116c765"
> +    layers:
> +      meta:
> +
> +  meta-edgeai:
> +    url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
> +    branch: "scarthgap"
> +    commit: "10.01.10.04"
> +
> diff --git
> a/src/configs/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.xm=
l
> b/src/configs/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.xm=
l
> new file mode 100644
> index 0000000..9ee86f2
> --- /dev/null
> +++
> b/src/configs/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.xm=
l
> @@ -0,0 +1,66 @@
> +<?xml version=3D'1.0'?>
> +<config>
> +    <description>TI Processor SDK v10.01.10.04</description>
> +
> +    <xi:include href=3D'../../common/targets_arago.xml' xmlns:xi=3D'
> http://www.w3.org/2001/XInclude'/>
> +    <xi:include href=3D'../../templates/bblayers.conf.xml' xmlns:xi=3D'
> http://www.w3.org/2001/XInclude'/>
> +    <xi:include href=3D'../../templates/local-arago64-v2.conf.xml'
> xmlns:xi=3D'http://www.w3.org/2001/XInclude'/>
> +
> +    <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'2.8'
> commit=3D'6c2641f7a9e92c1b82e306f59ddd3c1249c52cbf'/>
> +
> +    <repos>
> +        <repo name=3D'meta-tisdk' url=3D'
> https://github.com/TexasInstruments/meta-tisdk.git' branch=3D'scarthgap'
> commit=3D'10.01.10.04'>
> +            <layers/>
> +        </repo>
> +        <repo name=3D'meta-arago' url=3D'
> https://git.yoctoproject.org/meta-arago' branch=3D'scarthgap'
> commit=3D'10.01.10'>
> +            <layers>
> +                <layer>meta-arago-distro</layer>
> +                <layer>meta-arago-extras</layer>
> +                <layer>meta-arago-demos</layer>
> +                <layer>meta-arago-test</layer>
> +            </layers>
> +        </repo>
> +        <repo name=3D'meta-qt5' url=3D'
> https://github.com/meta-qt5/meta-qt5.git' branch=3D'scarthgap'
> commit=3D'eb828418264a49b8d00035cb3d7b12fcea3be801'>
> +            <layers/>
> +        </repo>
> +        <repo name=3D'meta-virtualization' url=3D'
> https://git.yoctoproject.org/meta-virtualization' branch=3D'scarthgap'
> commit=3D'450941a1b6df96285691e8c23d4f332d3c88a994'>
> +            <layers/>
> +        </repo>
> +        <repo name=3D'meta-openembedded' url=3D'
> https://git.openembedded.org/meta-openembedded' branch=3D'scarthgap'
> commit=3D'b8d1a14f7f3b76457c36752202ea7ae5881b6654'>
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
> branch=3D'scarthgap' commit=3D'10.01.10'>
> +            <layers>
> +                <layer>meta-ti-extras</layer>
> +                <layer>meta-ti-bsp</layer>
> +            </layers>
> +        </repo>
> +        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta=
-arm'
> branch=3D'scarthgap' commit=3D'7088279c0ab00c7dabefdd4544951b4746b48476'>
> +            <layers>
> +                <layer>meta-arm</layer>
> +                <layer>meta-arm-toolchain</layer>
> +            </layers>
> +        </repo>
> +        <repo name=3D'meta-clang' url=3D'https://github.com/kraj/meta-cl=
ang'
> branch=3D'scarthgap' commit=3D'9fbfa9db33131abdf3870a94f00199eb53e276e5'>
> +            <layers/>
> +        </repo>
> +        <repo name=3D'oe-core' url=3D'
> https://git.openembedded.org/openembedded-core' branch=3D'scarthgap'
> commit=3D'dac630ab5ee7aa6c5c7c294093adbd11b116c765'>
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
> a/src/configs/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-=
config.xml
> b/src/configs/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-=
config.xml
> new file mode 100644
> index 0000000..5a9df9e
> --- /dev/null
> +++
> b/src/configs/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-=
config.xml
> @@ -0,0 +1,74 @@
> +<?xml version=3D'1.0'?>
> +<config>
> +    <description>TI Processor SDK vchromium-10.01.10.04</description>
> +
> +    <xi:include href=3D'../../common/targets_arago.xml' xmlns:xi=3D'
> http://www.w3.org/2001/XInclude'/>
> +    <xi:include href=3D'../../templates/bblayers.conf.xml' xmlns:xi=3D'
> http://www.w3.org/2001/XInclude'/>
> +    <xi:include href=3D'../../templates/local-arago64-v2.conf.xml'
> xmlns:xi=3D'http://www.w3.org/2001/XInclude'/>
> +
> +    <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'2.8'
> commit=3D'6c2641f7a9e92c1b82e306f59ddd3c1249c52cbf'/>
> +
> +    <repos>
> +        <repo name=3D'meta-tisdk' url=3D'
> https://github.com/TexasInstruments/meta-tisdk.git' branch=3D'scarthgap'
> commit=3D'10.01.10.04'>
> +            <layers/>
> +        </repo>
> +        <repo name=3D'meta-arago' url=3D'
> https://git.yoctoproject.org/meta-arago' branch=3D'scarthgap'
> commit=3D'10.01.10'>
> +            <layers>
> +                <layer>meta-arago-distro</layer>
> +                <layer>meta-arago-extras</layer>
> +                <layer>meta-arago-demos</layer>
> +                <layer>meta-arago-test</layer>
> +            </layers>
> +        </repo>
> +        <repo name=3D'meta-browser' url=3D'
> https://github.com/OSSystems/meta-browser.git' branch=3D'master'
> commit=3D'1ed2254d72a4c25879014c98be287a7e3e22904c'>
> +            <layers>
> +                <layer>meta-chromium</layer>
> +            </layers>
> +        </repo>
> +        <repo name=3D'meta-qt5' url=3D'
> https://github.com/meta-qt5/meta-qt5.git' branch=3D'scarthgap'
> commit=3D'eb828418264a49b8d00035cb3d7b12fcea3be801'>
> +            <layers/>
> +        </repo>
> +        <repo name=3D'meta-virtualization' url=3D'
> https://git.yoctoproject.org/meta-virtualization' branch=3D'scarthgap'
> commit=3D'450941a1b6df96285691e8c23d4f332d3c88a994'>
> +            <layers/>
> +        </repo>
> +        <repo name=3D'meta-openembedded' url=3D'
> https://git.openembedded.org/meta-openembedded' branch=3D'scarthgap'
> commit=3D'b8d1a14f7f3b76457c36752202ea7ae5881b6654'>
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
> branch=3D'scarthgap' commit=3D'10.01.10'>
> +            <layers>
> +                <layer>meta-ti-extras</layer>
> +                <layer>meta-ti-bsp</layer>
> +            </layers>
> +        </repo>
> +        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta=
-arm'
> branch=3D'scarthgap' commit=3D'7088279c0ab00c7dabefdd4544951b4746b48476'>
> +            <layers>
> +                <layer>meta-arm</layer>
> +                <layer>meta-arm-toolchain</layer>
> +            </layers>
> +        </repo>
> +        <repo name=3D'meta-clang' url=3D'https://github.com/kraj/meta-cl=
ang'
> branch=3D'scarthgap' commit=3D'9fbfa9db33131abdf3870a94f00199eb53e276e5'>
> +            <layers/>
> +        </repo>
> +        <repo name=3D'oe-core' url=3D'
> https://git.openembedded.org/openembedded-core' branch=3D'scarthgap'
> commit=3D'dac630ab5ee7aa6c5c7c294093adbd11b116c765'>
> +            <layers>
> +                <layer>meta</layer>
> +            </layers>
> +        </repo>
> +        <repo name=3D'meta-edgeai' url=3D'
> https://git.ti.com/git/edgeai/meta-edgeai.git' branch=3D'scarthgap'
> commit=3D'10.01.10.04'>
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
> --
> 2.34.1
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15673):
> https://lists.yoctoproject.org/g/meta-arago/message/15673
> Mute This Topic: https://lists.yoctoproject.org/mt/110200559/7902621
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub [
> jcormier@criticallink.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
>

--=20
Jonathan Cormier
Senior Software Engineer

Voice:  315.425.4045 x222

http://www.CriticalLink.com <http://www.criticallink.com/>
6712 Brooklawn Parkway, Syracuse, NY 13211
<https://twitter.com/Critical_Link>

--0000000000007604a4062e95c8d2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>After build processor-sdk-scarthgap-chromium-10.01.10=
.04-config, I noticed the downloads directory has moved to the build/downlo=
ads folder, instead of being at the top of the build directory.=C2=A0 Was t=
his intentional?=C2=A0 I suspect it probably happened when everything was c=
onverted to xml configs. But the commit doesn&#39;t mention that as a known=
 side effect.<br></div><div><br></div><div style=3D"margin-left:40px">commi=
t aea8e0f53cb05e2d80056b3568f3376741c90853<br>Author: Ryan Eatmon &lt;<a hr=
ef=3D"mailto:reatmon@ti.com">reatmon@ti.com</a>&gt;<br>Date: =C2=A0 Thu Oct=
 10 11:43:57 2024 -0500<br><br>=C2=A0 =C2=A0 Initial conversion of new XML =
configs</div><div style=3D"margin-left:40px">...</div><div style=3D"margin-=
left:40px">-DL_DIR =3D &quot;${OEBASE}/downloads&quot;<br>+DL_DIR =3D &quot=
;${TOPDIR}/downloads&quot;</div><div style=3D"margin-left:40px">...</div><d=
iv style=3D"margin-left:40px">-SSTATE_DIR =3D &quot;${OEBASE}/build/sstate-=
cache&quot;<br>+SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;</di=
v><div><br></div><div>SSTATE_DIR was also updated and it still looks to be =
put in the same place as ever...<br></div><br><div class=3D"gmail_quote gma=
il_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 19, 2=
024 at 11:34=E2=80=AFAM Chirag Shilwant via <a href=3D"http://lists.yoctopr=
oject.org">lists.yoctoproject.org</a> &lt;c-shilwant=3D<a href=3D"mailto:ti=
.com@lists.yoctoproject.org">ti.com@lists.yoctoproject.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">- Add processor-s=
dk-scarthgap-10.01.10.04-config used for<br>
building AM62SIP &amp; AM64x.<br>
<br>
- Add processor-sdk-scarthgap-chromium-10.01.10.04-config<br>
used for building AM62P, AM62x, AM62LP &amp; Beagleplay.<br>
<br>
Signed-off-by: Chirag Shilwant &lt;<a href=3D"mailto:c-shilwant@ti.com" tar=
get=3D"_blank">c-shilwant@ti.com</a>&gt;<br>
---<br>
=C2=A0...ssor-sdk-scarthgap-10.01.10.04-config.json | 136 ++++++++++++++<br=
>
=C2=A0...scarthgap-chromium-10.01.10.04-config.json | 158 ++++++++++++++++<=
br>
=C2=A0.../bblayers.conf.sample=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 32 ++++<br>
=C2=A0.../conf-notes.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 22 +++<br>
=C2=A0.../conf-summary.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0.../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 175 ++++++++++++++++++<br>
=C2=A0.../bblayers.conf.sample=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 34 ++++<br>
=C2=A0.../conf-notes.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 22 +++<br>
=C2=A0.../conf-summary.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0.../local.conf.sample=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 175 ++++++++++++++++++<br>
=C2=A0...essor-sdk-scarthgap-10.01.10.04-config.txt |=C2=A0 17 ++<br>
=C2=A0...-scarthgap-chromium-10.01.10.04-config.txt |=C2=A0 19 ++<br>
=C2=A0...essor-sdk-scarthgap-10.01.10.04-config.yml |=C2=A0 74 ++++++++<br>
=C2=A0...-scarthgap-chromium-10.01.10.04-config.yml |=C2=A0 86 +++++++++<br=
>
=C2=A0...essor-sdk-scarthgap-10.01.10.04-config.xml |=C2=A0 66 +++++++<br>
=C2=A0...-scarthgap-chromium-10.01.10.04-config.xml |=C2=A0 74 ++++++++<br>
=C2=A016 files changed, 1092 insertions(+)<br>
=C2=A0create mode 100644 bitbake-setup/processor-sdk_processor-sdk-scarthga=
p-10.01.10.04-config.json<br>
=C2=A0create mode 100644 bitbake-setup/processor-sdk_processor-sdk-scarthga=
p-chromium-10.01.10.04-config.json<br>
=C2=A0create mode 100644 conf/templates/processor-sdk_processor-sdk-scarthg=
ap-10.01.10.04-config/bblayers.conf.sample<br>
=C2=A0create mode 100644 conf/templates/processor-sdk_processor-sdk-scarthg=
ap-10.01.10.04-config/conf-notes.txt<br>
=C2=A0create mode 100644 conf/templates/processor-sdk_processor-sdk-scarthg=
ap-10.01.10.04-config/conf-summary.txt<br>
=C2=A0create mode 100644 conf/templates/processor-sdk_processor-sdk-scarthg=
ap-10.01.10.04-config/local.conf.sample<br>
=C2=A0create mode 100644 conf/templates/processor-sdk_processor-sdk-scarthg=
ap-chromium-10.01.10.04-config/bblayers.conf.sample<br>
=C2=A0create mode 100644 conf/templates/processor-sdk_processor-sdk-scarthg=
ap-chromium-10.01.10.04-config/conf-notes.txt<br>
=C2=A0create mode 100644 conf/templates/processor-sdk_processor-sdk-scarthg=
ap-chromium-10.01.10.04-config/conf-summary.txt<br>
=C2=A0create mode 100644 conf/templates/processor-sdk_processor-sdk-scarthg=
ap-chromium-10.01.10.04-config/local.conf.sample<br>
=C2=A0create mode 100644 configs/processor-sdk/processor-sdk-scarthgap-10.0=
1.10.04-config.txt<br>
=C2=A0create mode 100644 configs/processor-sdk/processor-sdk-scarthgap-chro=
mium-10.01.10.04-config.txt<br>
=C2=A0create mode 100644 kas/processor-sdk/processor-sdk-scarthgap-10.01.10=
.04-config.yml<br>
=C2=A0create mode 100644 kas/processor-sdk/processor-sdk-scarthgap-chromium=
-10.01.10.04-config.yml<br>
=C2=A0create mode 100644 src/configs/processor-sdk/processor-sdk-scarthgap-=
10.01.10.04-config.xml<br>
=C2=A0create mode 100644 src/configs/processor-sdk/processor-sdk-scarthgap-=
chromium-10.01.10.04-config.xml<br>
<br>
diff --git a/bitbake-setup/processor-sdk_processor-sdk-scarthgap-10.01.10.0=
4-config.json b/bitbake-setup/processor-sdk_processor-sdk-scarthgap-10.01.1=
0.04-config.json<br>
new file mode 100644<br>
index 0000000..f70e760<br>
--- /dev/null<br>
+++ b/bitbake-setup/processor-sdk_processor-sdk-scarthgap-10.01.10.04-confi=
g.json<br>
@@ -0,0 +1,136 @@<br>
+{<br>
+=C2=A0 &quot;version&quot;: &quot;1.0&quot;,<br>
+=C2=A0 &quot;description&quot;: &quot;TI Processor SDK v10.01.10.04&quot;,=
<br>
+=C2=A0 &quot;sources&quot;: {<br>
+=C2=A0 =C2=A0 &quot;oe-layersetup&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;git-remote&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;remotes&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;origin&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;uri&quot;: &quot;<a href=
=3D"https://git.ti.com/git/arago-project/oe-layersetup.git" rel=3D"noreferr=
er" target=3D"_blank">https://git.ti.com/git/arago-project/oe-layersetup.gi=
t</a>&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rev&quot;: &quot;master&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;path&quot;: &quot;oe-layersetup&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;bitbake&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;git-remote&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;remotes&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;origin&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;uri&quot;: &quot;<a href=
=3D"https://git.openembedded.org/bitbake" rel=3D"noreferrer" target=3D"_bla=
nk">https://git.openembedded.org/bitbake</a>&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rev&quot;: &quot;2.8&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;path&quot;: &quot;bitbake&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;meta-tisdk&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;git-remote&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;remotes&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;origin&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;uri&quot;: &quot;<a href=
=3D"https://github.com/TexasInstruments/meta-tisdk.git" rel=3D"noreferrer" =
target=3D"_blank">https://github.com/TexasInstruments/meta-tisdk.git</a>&qu=
ot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rev&quot;: &quot;scarthgap&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;path&quot;: &quot;meta-tisdk&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;meta-arago&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;git-remote&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;remotes&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;origin&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;uri&quot;: &quot;<a href=
=3D"https://git.yoctoproject.org/meta-arago" rel=3D"noreferrer" target=3D"_=
blank">https://git.yoctoproject.org/meta-arago</a>&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rev&quot;: &quot;scarthgap&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;path&quot;: &quot;meta-arago&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;meta-qt5&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;git-remote&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;remotes&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;origin&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;uri&quot;: &quot;<a href=
=3D"https://github.com/meta-qt5/meta-qt5.git" rel=3D"noreferrer" target=3D"=
_blank">https://github.com/meta-qt5/meta-qt5.git</a>&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rev&quot;: &quot;scarthgap&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;path&quot;: &quot;meta-qt5&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;meta-virtualization&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;git-remote&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;remotes&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;origin&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;uri&quot;: &quot;<a href=
=3D"https://git.yoctoproject.org/meta-virtualization" rel=3D"noreferrer" ta=
rget=3D"_blank">https://git.yoctoproject.org/meta-virtualization</a>&quot;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rev&quot;: &quot;scarthgap&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;path&quot;: &quot;meta-virtualization&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;meta-openembedded&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;git-remote&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;remotes&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;origin&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;uri&quot;: &quot;<a href=
=3D"https://git.openembedded.org/meta-openembedded" rel=3D"noreferrer" targ=
et=3D"_blank">https://git.openembedded.org/meta-openembedded</a>&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rev&quot;: &quot;scarthgap&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;path&quot;: &quot;meta-openembedded&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;meta-ti&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;git-remote&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;remotes&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;origin&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;uri&quot;: &quot;<a href=
=3D"https://git.yoctoproject.org/meta-ti" rel=3D"noreferrer" target=3D"_bla=
nk">https://git.yoctoproject.org/meta-ti</a>&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rev&quot;: &quot;scarthgap&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;path&quot;: &quot;meta-ti&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;meta-arm&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;git-remote&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;remotes&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;origin&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;uri&quot;: &quot;<a href=
=3D"https://git.yoctoproject.org/meta-arm" rel=3D"noreferrer" target=3D"_bl=
ank">https://git.yoctoproject.org/meta-arm</a>&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rev&quot;: &quot;scarthgap&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;path&quot;: &quot;meta-arm&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;meta-clang&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;git-remote&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;remotes&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;origin&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;uri&quot;: &quot;<a href=
=3D"https://github.com/kraj/meta-clang" rel=3D"noreferrer" target=3D"_blank=
">https://github.com/kraj/meta-clang</a>&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rev&quot;: &quot;scarthgap&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;path&quot;: &quot;meta-clang&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;oe-core&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;git-remote&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;remotes&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;origin&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;uri&quot;: &quot;<a href=
=3D"https://git.openembedded.org/openembedded-core" rel=3D"noreferrer" targ=
et=3D"_blank">https://git.openembedded.org/openembedded-core</a>&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rev&quot;: &quot;scarthgap&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;path&quot;: &quot;oe-core&quot;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 },<br>
+=C2=A0 &quot;configuration&quot;: {<br>
+=C2=A0 =C2=A0 &quot;bitbake-setup&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;default&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;description&quot;: &quot;Default build c=
onfiguration&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;template&quot;: &quot;oe-layersetu=
p-processor-sdk_processor-sdk-scarthgap-10.01.10.04-config&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;targets&quot;: [ &quot;bitbake -k =
tisdk-default-image&quot; ]<br>
+=C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 }<br>
+}<br>
diff --git a/bitbake-setup/processor-sdk_processor-sdk-scarthgap-chromium-1=
0.01.10.04-config.json b/bitbake-setup/processor-sdk_processor-sdk-scarthga=
p-chromium-10.01.10.04-config.json<br>
new file mode 100644<br>
index 0000000..fa0a0bd<br>
--- /dev/null<br>
+++ b/bitbake-setup/processor-sdk_processor-sdk-scarthgap-chromium-10.01.10=
.04-config.json<br>
@@ -0,0 +1,158 @@<br>
+{<br>
+=C2=A0 &quot;version&quot;: &quot;1.0&quot;,<br>
+=C2=A0 &quot;description&quot;: &quot;TI Processor SDK vchromium-10.01.10.=
04&quot;,<br>
+=C2=A0 &quot;sources&quot;: {<br>
+=C2=A0 =C2=A0 &quot;oe-layersetup&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;git-remote&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;remotes&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;origin&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;uri&quot;: &quot;<a href=
=3D"https://git.ti.com/git/arago-project/oe-layersetup.git" rel=3D"noreferr=
er" target=3D"_blank">https://git.ti.com/git/arago-project/oe-layersetup.gi=
t</a>&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rev&quot;: &quot;master&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;path&quot;: &quot;oe-layersetup&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;bitbake&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;git-remote&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;remotes&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;origin&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;uri&quot;: &quot;<a href=
=3D"https://git.openembedded.org/bitbake" rel=3D"noreferrer" target=3D"_bla=
nk">https://git.openembedded.org/bitbake</a>&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rev&quot;: &quot;2.8&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;path&quot;: &quot;bitbake&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;meta-tisdk&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;git-remote&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;remotes&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;origin&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;uri&quot;: &quot;<a href=
=3D"https://github.com/TexasInstruments/meta-tisdk.git" rel=3D"noreferrer" =
target=3D"_blank">https://github.com/TexasInstruments/meta-tisdk.git</a>&qu=
ot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rev&quot;: &quot;scarthgap&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;path&quot;: &quot;meta-tisdk&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;meta-arago&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;git-remote&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;remotes&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;origin&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;uri&quot;: &quot;<a href=
=3D"https://git.yoctoproject.org/meta-arago" rel=3D"noreferrer" target=3D"_=
blank">https://git.yoctoproject.org/meta-arago</a>&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rev&quot;: &quot;scarthgap&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;path&quot;: &quot;meta-arago&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;meta-browser&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;git-remote&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;remotes&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;origin&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;uri&quot;: &quot;<a href=
=3D"https://github.com/OSSystems/meta-browser.git" rel=3D"noreferrer" targe=
t=3D"_blank">https://github.com/OSSystems/meta-browser.git</a>&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rev&quot;: &quot;master&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;path&quot;: &quot;meta-browser&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;meta-qt5&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;git-remote&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;remotes&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;origin&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;uri&quot;: &quot;<a href=
=3D"https://github.com/meta-qt5/meta-qt5.git" rel=3D"noreferrer" target=3D"=
_blank">https://github.com/meta-qt5/meta-qt5.git</a>&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rev&quot;: &quot;scarthgap&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;path&quot;: &quot;meta-qt5&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;meta-virtualization&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;git-remote&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;remotes&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;origin&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;uri&quot;: &quot;<a href=
=3D"https://git.yoctoproject.org/meta-virtualization" rel=3D"noreferrer" ta=
rget=3D"_blank">https://git.yoctoproject.org/meta-virtualization</a>&quot;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rev&quot;: &quot;scarthgap&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;path&quot;: &quot;meta-virtualization&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;meta-openembedded&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;git-remote&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;remotes&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;origin&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;uri&quot;: &quot;<a href=
=3D"https://git.openembedded.org/meta-openembedded" rel=3D"noreferrer" targ=
et=3D"_blank">https://git.openembedded.org/meta-openembedded</a>&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rev&quot;: &quot;scarthgap&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;path&quot;: &quot;meta-openembedded&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;meta-ti&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;git-remote&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;remotes&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;origin&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;uri&quot;: &quot;<a href=
=3D"https://git.yoctoproject.org/meta-ti" rel=3D"noreferrer" target=3D"_bla=
nk">https://git.yoctoproject.org/meta-ti</a>&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rev&quot;: &quot;scarthgap&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;path&quot;: &quot;meta-ti&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;meta-arm&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;git-remote&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;remotes&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;origin&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;uri&quot;: &quot;<a href=
=3D"https://git.yoctoproject.org/meta-arm" rel=3D"noreferrer" target=3D"_bl=
ank">https://git.yoctoproject.org/meta-arm</a>&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rev&quot;: &quot;scarthgap&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;path&quot;: &quot;meta-arm&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;meta-clang&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;git-remote&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;remotes&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;origin&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;uri&quot;: &quot;<a href=
=3D"https://github.com/kraj/meta-clang" rel=3D"noreferrer" target=3D"_blank=
">https://github.com/kraj/meta-clang</a>&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rev&quot;: &quot;scarthgap&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;path&quot;: &quot;meta-clang&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;oe-core&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;git-remote&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;remotes&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;origin&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;uri&quot;: &quot;<a href=
=3D"https://git.openembedded.org/openembedded-core" rel=3D"noreferrer" targ=
et=3D"_blank">https://git.openembedded.org/openembedded-core</a>&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rev&quot;: &quot;scarthgap&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;path&quot;: &quot;oe-core&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 &quot;meta-edgeai&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;git-remote&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;remotes&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;origin&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;uri&quot;: &quot;<a href=
=3D"https://git.ti.com/git/edgeai/meta-edgeai.git" rel=3D"noreferrer" targe=
t=3D"_blank">https://git.ti.com/git/edgeai/meta-edgeai.git</a>&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rev&quot;: &quot;scarthgap&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;path&quot;: &quot;meta-edgeai&quot;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 },<br>
+=C2=A0 &quot;configuration&quot;: {<br>
+=C2=A0 =C2=A0 &quot;bitbake-setup&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;default&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;description&quot;: &quot;Default build c=
onfiguration&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;template&quot;: &quot;oe-layersetu=
p-processor-sdk_processor-sdk-scarthgap-chromium-10.01.10.04-config&quot;,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;targets&quot;: [ &quot;bitbake -k =
tisdk-default-image&quot; ]<br>
+=C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 }<br>
+}<br>
diff --git a/conf/templates/processor-sdk_processor-sdk-scarthgap-10.01.10.=
04-config/bblayers.conf.sample b/conf/templates/processor-sdk_processor-sdk=
-scarthgap-10.01.10.04-config/bblayers.conf.sample<br>
new file mode 100644<br>
index 0000000..10bcf2d<br>
--- /dev/null<br>
+++ b/conf/templates/processor-sdk_processor-sdk-scarthgap-10.01.10.04-conf=
ig/bblayers.conf.sample<br>
@@ -0,0 +1,32 @@<br>
+# This template file was created by taking the oe-core/meta/conf/bblayers.=
conf<br>
+# file and removing the BBLAYERS section at the end.<br>
+<br>
+# LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf<br>
+# changes incompatibly<br>
+LCONF_VERSION =3D &quot;5&quot;<br>
+<br>
+BBPATH =3D &quot;${TOPDIR}&quot;<br>
+BBFILES ?=3D &quot;&quot;<br>
+<br>
+BBLAYERS ?=3D &quot; \<br>
+=C2=A0 =C2=A0 ##OEROOT##/../meta-tisdk<br>
+=C2=A0 =C2=A0 ##OEROOT##/../meta-arago/meta-arago-distro<br>
+=C2=A0 =C2=A0 ##OEROOT##/../meta-arago/meta-arago-extras<br>
+=C2=A0 =C2=A0 ##OEROOT##/../meta-arago/meta-arago-demos<br>
+=C2=A0 =C2=A0 ##OEROOT##/../meta-arago/meta-arago-test<br>
+=C2=A0 =C2=A0 ##OEROOT##/../meta-qt5<br>
+=C2=A0 =C2=A0 ##OEROOT##/../meta-virtualization<br>
+=C2=A0 =C2=A0 ##OEROOT##/../meta-openembedded/meta-networking<br>
+=C2=A0 =C2=A0 ##OEROOT##/../meta-openembedded/meta-python<br>
+=C2=A0 =C2=A0 ##OEROOT##/../meta-openembedded/meta-oe<br>
+=C2=A0 =C2=A0 ##OEROOT##/../meta-openembedded/meta-gnome<br>
+=C2=A0 =C2=A0 ##OEROOT##/../meta-openembedded/meta-filesystems<br>
+=C2=A0 =C2=A0 ##OEROOT##/../meta-openembedded/meta-multimedia<br>
+=C2=A0 =C2=A0 ##OEROOT##/../meta-ti/meta-ti-extras<br>
+=C2=A0 =C2=A0 ##OEROOT##/../meta-ti/meta-ti-bsp<br>
+=C2=A0 =C2=A0 ##OEROOT##/../meta-arm/meta-arm<br>
+=C2=A0 =C2=A0 ##OEROOT##/../meta-arm/meta-arm-toolchain<br>
+=C2=A0 =C2=A0 ##OEROOT##/../meta-clang<br>
+=C2=A0 =C2=A0 ##OEROOT##/../oe-core/meta<br>
+=C2=A0 =C2=A0 ##OEROOT##/../oe-layersetup<br>
+&quot;<br>
diff --git a/conf/templates/processor-sdk_processor-sdk-scarthgap-10.01.10.=
04-config/conf-notes.txt b/conf/templates/processor-sdk_processor-sdk-scart=
hgap-10.01.10.04-config/conf-notes.txt<br>
new file mode 100644<br>
index 0000000..1880460<br>
--- /dev/null<br>
+++ b/conf/templates/processor-sdk_processor-sdk-scarthgap-10.01.10.04-conf=
ig/conf-notes.txt<br>
@@ -0,0 +1,22 @@<br>
+<br>
+### Shell environment set up for builds. ###<br>
+<br>
+You can now run &#39;bitbake &lt;target&gt;&#39;<br>
+<br>
+If you have not set MACHINE in your local.conf you can run<br>
+&#39;MACHINE=3Dxxxxx bitbake &lt;target&gt;&#39;<br>
+<br>
+Common targets are:<br>
+=C2=A0 =C2=A0 tisdk-default-image<br>
+=C2=A0 =C2=A0 tisdk-base-image<br>
+=C2=A0 =C2=A0 tisdk-bootstrap-base-image<br>
+=C2=A0 =C2=A0 tisdk-bootstrap-image<br>
+=C2=A0 =C2=A0 tisdk-thinlinux-image<br>
+=C2=A0 =C2=A0 tisdk-tiny-image<br>
+<br>
+You can also run generated qemu images with a command like &#39;runqemu qe=
mux86-64&#39;.<br>
+<br>
+Other commonly useful commands are:<br>
+ - &#39;devtool&#39; and &#39;recipetool&#39; handle common recipe tasks<b=
r>
+ - &#39;bitbake-layers&#39; handles common layer tasks<br>
+ - &#39;oe-pkgdata-util&#39; handles common target package tasks<br>
diff --git a/conf/templates/processor-sdk_processor-sdk-scarthgap-10.01.10.=
04-config/conf-summary.txt b/conf/templates/processor-sdk_processor-sdk-sca=
rthgap-10.01.10.04-config/conf-summary.txt<br>
new file mode 100644<br>
index 0000000..5e1739a<br>
--- /dev/null<br>
+++ b/conf/templates/processor-sdk_processor-sdk-scarthgap-10.01.10.04-conf=
ig/conf-summary.txt<br>
@@ -0,0 +1 @@<br>
+TI Processor SDK v10.01.10.04<br>
diff --git a/conf/templates/processor-sdk_processor-sdk-scarthgap-10.01.10.=
04-config/local.conf.sample b/conf/templates/processor-sdk_processor-sdk-sc=
arthgap-10.01.10.04-config/local.conf.sample<br>
new file mode 100644<br>
index 0000000..7575b4b<br>
--- /dev/null<br>
+++ b/conf/templates/processor-sdk_processor-sdk-scarthgap-10.01.10.04-conf=
ig/local.conf.sample<br>
@@ -0,0 +1,175 @@<br>
+# CONF_VERSION is increased each time build/conf/ changes incompatibly<br>
+CONF_VERSION =3D &quot;2&quot;<br>
+<br>
+#<br>
+# Where to place downloads<br>
+#<br>
+# During a first build the system will download many different source code=
<br>
+# tarballs from various upstream projects. This can take a while, particul=
arly<br>
+# if your network connection is slow. These are all stored in DL_DIR. When=
<br>
+# wiping and rebuilding you can preserve this directory to speed up this p=
art<br>
+# of subsequent builds. This directory is safe to share between multiple b=
uilds<br>
+# on the same machine too.<br>
+DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
+<br>
+#<br>
+# Where to place shared-state files<br>
+#<br>
+# BitBake has the capability to accelerate builds based on previously buil=
t<br>
+# output. This is done using &quot;shared state&quot; files which can be t=
hought of as<br>
+# cache objects and this option determines where those files are placed.<b=
r>
+#<br>
+# You can wipe out TMPDIR leaving this directory intact and the build woul=
d<br>
+# regenerate from these files if no changes were made to the configuration=
.<br>
+# If changes were made to the configuration, only shared state files where=
 the<br>
+# state was still valid would be used (done using checksums).<br>
+SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
+<br>
+#<br>
+# Shared-state files from other locations<br>
+#<br>
+# As mentioned above, shared state files are prebuilt cache data objects w=
hich<br>
+# can be used to accelerate build time. This variable can be used to confi=
gure<br>
+# the system to search other mirror locations for these objects before it<=
br>
+# builds the data itself.<br>
+#<br>
+# This can be a filesystem directory, or a remote url such as http or ftp.=
<br>
+# These would contain the sstate-cache results from previous builds (possi=
bly<br>
+# from other machines). This variable works like fetcher MIRRORS/PREMIRROR=
S<br>
+# and points to the cache locations to check for the shared objects.<br>
+#SSTATE_MIRRORS ?=3D &quot;\<br>
+#file://.* <a href=3D"http://someserver.tld/share/sstate/" rel=3D"noreferr=
er" target=3D"_blank">http://someserver.tld/share/sstate/</a> \n \<br>
+#file://.* file:///some/local/dir/sstate/&quot;<br>
+<br>
+#<br>
+# Where to place the build output<br>
+#<br>
+# This option specifies where the bulk of the building work should be done=
 and<br>
+# where BitBake should place its temporary files and output. Keep in mind =
that<br>
+# this includes the extraction and compilation of many applications and th=
e toolchain<br>
+# which can use Gigabytes of hard disk space.<br>
+TMPDIR =3D &quot;${TOPDIR}/arago-tmp&quot;<br>
+<br>
+# By default, DEPLOY_DIR is inside TMPDIR, but can be changed here to be o=
utside<br>
+#DEPLOY_DIR =3D &quot;${TOPDIR}/deploy&quot;<br>
+<br>
+#<br>
+# Machine Selection<br>
+#<br>
+# You need to select a specific machine to target the build with. There ar=
e a selection<br>
+# of emulated machines available which can boot and run in the QEMU emulat=
or:<br>
+#<br>
+#MACHINE ?=3D &quot;arago&quot;<br>
+<br>
+#<br>
+# Package Management configuration<br>
+#<br>
+# This variable lists which packaging formats to enable. Multiple package =
backends<br>
+# can be enabled at once and the first item listed in the variable will be=
 used<br>
+# to generate the root filesystems.<br>
+# Options are:<br>
+#=C2=A0 - &#39;package_deb&#39; for debian style deb files<br>
+#=C2=A0 - &#39;package_ipk&#39; for ipk files are used by opkg (a debian s=
tyle embedded package manager)<br>
+#=C2=A0 - &#39;package_rpm&#39; for rpm style packages<br>
+# E.g.: PACKAGE_CLASSES ?=3D &quot;package_rpm package_deb package_ipk&quo=
t;<br>
+# We default to ipk:<br>
+PACKAGE_CLASSES ?=3D &quot;package_ipk&quot;<br>
+<br>
+#<br>
+# SDK/ADT target architecture<br>
+#<br>
+# This variable specified the architecture to build SDK/ADT items for and =
means<br>
+# you can build the SDK packages for architectures other than the machine =
you are<br>
+# running the build on (i.e. building i686 packages on an x86_64 host._<br=
>
+# Supported values are i686 and x86_64<br>
+SDKMACHINE ?=3D &quot;x86_64&quot;<br>
+<br>
+#<br>
+# Extra image configuration defaults<br>
+#<br>
+# The EXTRA_IMAGE_FEATURES variable allows extra packages to be added to t=
he generated<br>
+# images. Some of these options are added to certain image types automatic=
ally. The<br>
+# variable can contain the following options:<br>
+#=C2=A0 &quot;dbg-pkgs&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0- add -dbg packages=
 for all installed packages<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(adds symbol information for debugging/profiling)<br>
+#=C2=A0 &quot;dev-pkgs&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0- add -dev packages=
 for all installed packages<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(useful if you want to develop against libs in the image)<br>
+#=C2=A0 &quot;tools-sdk&quot;=C2=A0 =C2=A0 =C2=A0 - add development tools =
(gcc, make, pkgconfig etc.)<br>
+#=C2=A0 &quot;tools-debug&quot;=C2=A0 =C2=A0 - add debugging tools (gdb, s=
trace)<br>
+#=C2=A0 &quot;tools-profile&quot;=C2=A0 - add profiling tools (oprofile, e=
xmap, lttng valgrind (x86 only))<br>
+#=C2=A0 &quot;tools-testapps&quot; - add useful testing tools (ts_print, a=
play, arecord etc.)<br>
+#=C2=A0 &quot;debug-tweaks&quot;=C2=A0 =C2=A0- make an image suitable for =
development<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0e.g. ssh root access has a blank password<br>
+# There are other application targets that can be used here too, see<br>
+# meta/classes/image.bbclass and meta/classes/core-image.bbclass for more =
details.<br>
+# We default to enabling the debugging tweaks.<br>
+EXTRA_IMAGE_FEATURES =3D &quot;debug-tweaks&quot;<br>
+<br>
+#<br>
+# Additional image features<br>
+#<br>
+# The following is a list of additional classes to use when building image=
s which<br>
+# enable extra features. Some available options which can be included in t=
his variable<br>
+# are:<br>
+#=C2=A0 =C2=A0- &#39;buildstats&#39; collect build statistics<br>
+#=C2=A0 =C2=A0- &#39;image-swab&#39; to perform host system intrusion dete=
ction<br>
+# NOTE: mklibs also needs to be explicitly enabled for a given image, see =
local.conf.extended<br>
+USER_CLASSES ?=3D &quot;buildstats&quot;<br>
+<br>
+# By default disable interactive patch resolution (tasks will just fail in=
stead):<br>
+PATCHRESOLVE =3D &quot;noop&quot;<br>
+<br>
+# By default the machine configuration file sets the IMAGE_FSTYPES.=C2=A0 =
But if you<br>
+# would like to add additional file system types you can uncomment the<br>
+# following line and add the additional IMAGE_FSTYPES you want created<br>
+# as part of the build flow.=C2=A0 Some common types are listed below and =
you<br>
+# can remove the ones you do not want.<br>
+# IMAGE_FSTYPES +=3D &quot;jffs2 cramfs ext2.gz ext3.gz squashfs ubi tar.g=
z tar.bz2 cpio&quot;<br>
+<br>
+#<br>
+# Parallelism Options<br>
+#<br>
+# These two options control how much parallelism BitBake should use. The f=
irst<br>
+# option determines how many tasks bitbake should run in parallel:<br>
+#<br>
+# BB_NUMBER_THREADS ?=3D &quot;1&quot;<br>
+#<br>
+# The second option controls how many processes make should run in paralle=
l when<br>
+# running compile tasks:<br>
+#<br>
+# PARALLEL_MAKE ?=3D &quot;-j 1&quot;<br>
+#<br>
+# For a quad-core machine, BB_NUMBER_THREADS =3D &quot;4&quot;, PARALLEL_M=
AKE =3D &quot;-j 4&quot; would<br>
+# be appropriate for example<br>
+#<br>
+# NOTE: By default, bitbake will choose the number of processeors on your =
host<br>
+# so you should not need to set this unless you are wanting to lower the n=
umber<br>
+# allowed.<br>
+#<br>
+<br>
+DISTRO=C2=A0 =C2=A0=3D &quot;arago&quot;<br>
+<br>
+# Set terminal types by default it expects gnome-terminal<br>
+# but we chose xterm<br>
+TERMCMD =3D &quot;${XTERM_TERMCMD}&quot;<br>
+TERMCMDRUN =3D &quot;${XTERM_TERMCMDRUN}&quot;<br>
+<br>
+# Don&#39;t generate the mirror tarball for SCM repos, the snapshot is eno=
ugh<br>
+BB_GENERATE_MIRROR_TARBALLS =3D &quot;0&quot;<br>
+<br>
+# Uncomment this to remove work directory after packaging to save disk spa=
ce<br>
+#INHERIT +=3D &quot;rm_work&quot;<br>
+<br>
+# Keep one set of images by default<br>
+RM_OLD_IMAGE =3D &quot;1&quot;<br>
+<br>
+# Enable local PR service for binary feeds<br>
+PRSERV_HOST =3D &quot;localhost:0&quot;<br>
+<br>
+# Enable hash equiv server<br>
+BB_SIGNATURE_HANDLER =3D &quot;OEEquivHash&quot;<br>
+BB_HASHSERVE =3D &quot;auto&quot;<br>
+<br>
+# It is recommended to activate &quot;buildhistory&quot; for testing the P=
R service<br>
+INHERIT +=3D &quot;buildhistory&quot;<br>
+BUILDHISTORY_COMMIT =3D &quot;1&quot;<br>
diff --git a/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-=
10.01.10.04-config/bblayers.conf.sample b/conf/templates/processor-sdk_proc=
essor-sdk-scarthgap-chromium-10.01.10.04-config/bblayers.conf.sample<br>
new file mode 100644<br>
index 0000000..55a10df<br>
--- /dev/null<br>
+++ b/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.01.1=
0.04-config/bblayers.conf.sample<br>
@@ -0,0 +1,34 @@<br>
+# This template file was created by taking the oe-core/meta/conf/bblayers.=
conf<br>
+# file and removing the BBLAYERS section at the end.<br>
+<br>
+# LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf<br>
+# changes incompatibly<br>
+LCONF_VERSION =3D &quot;5&quot;<br>
+<br>
+BBPATH =3D &quot;${TOPDIR}&quot;<br>
+BBFILES ?=3D &quot;&quot;<br>
+<br>
+BBLAYERS ?=3D &quot; \<br>
+=C2=A0 =C2=A0 ##OEROOT##/../meta-tisdk<br>
+=C2=A0 =C2=A0 ##OEROOT##/../meta-arago/meta-arago-distro<br>
+=C2=A0 =C2=A0 ##OEROOT##/../meta-arago/meta-arago-extras<br>
+=C2=A0 =C2=A0 ##OEROOT##/../meta-arago/meta-arago-demos<br>
+=C2=A0 =C2=A0 ##OEROOT##/../meta-arago/meta-arago-test<br>
+=C2=A0 =C2=A0 ##OEROOT##/../meta-browser/meta-chromium<br>
+=C2=A0 =C2=A0 ##OEROOT##/../meta-qt5<br>
+=C2=A0 =C2=A0 ##OEROOT##/../meta-virtualization<br>
+=C2=A0 =C2=A0 ##OEROOT##/../meta-openembedded/meta-networking<br>
+=C2=A0 =C2=A0 ##OEROOT##/../meta-openembedded/meta-python<br>
+=C2=A0 =C2=A0 ##OEROOT##/../meta-openembedded/meta-oe<br>
+=C2=A0 =C2=A0 ##OEROOT##/../meta-openembedded/meta-gnome<br>
+=C2=A0 =C2=A0 ##OEROOT##/../meta-openembedded/meta-filesystems<br>
+=C2=A0 =C2=A0 ##OEROOT##/../meta-openembedded/meta-multimedia<br>
+=C2=A0 =C2=A0 ##OEROOT##/../meta-ti/meta-ti-extras<br>
+=C2=A0 =C2=A0 ##OEROOT##/../meta-ti/meta-ti-bsp<br>
+=C2=A0 =C2=A0 ##OEROOT##/../meta-arm/meta-arm<br>
+=C2=A0 =C2=A0 ##OEROOT##/../meta-arm/meta-arm-toolchain<br>
+=C2=A0 =C2=A0 ##OEROOT##/../meta-clang<br>
+=C2=A0 =C2=A0 ##OEROOT##/../oe-core/meta<br>
+=C2=A0 =C2=A0 ##OEROOT##/../meta-edgeai<br>
+=C2=A0 =C2=A0 ##OEROOT##/../oe-layersetup<br>
+&quot;<br>
diff --git a/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-=
10.01.10.04-config/conf-notes.txt b/conf/templates/processor-sdk_processor-=
sdk-scarthgap-chromium-10.01.10.04-config/conf-notes.txt<br>
new file mode 100644<br>
index 0000000..1880460<br>
--- /dev/null<br>
+++ b/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.01.1=
0.04-config/conf-notes.txt<br>
@@ -0,0 +1,22 @@<br>
+<br>
+### Shell environment set up for builds. ###<br>
+<br>
+You can now run &#39;bitbake &lt;target&gt;&#39;<br>
+<br>
+If you have not set MACHINE in your local.conf you can run<br>
+&#39;MACHINE=3Dxxxxx bitbake &lt;target&gt;&#39;<br>
+<br>
+Common targets are:<br>
+=C2=A0 =C2=A0 tisdk-default-image<br>
+=C2=A0 =C2=A0 tisdk-base-image<br>
+=C2=A0 =C2=A0 tisdk-bootstrap-base-image<br>
+=C2=A0 =C2=A0 tisdk-bootstrap-image<br>
+=C2=A0 =C2=A0 tisdk-thinlinux-image<br>
+=C2=A0 =C2=A0 tisdk-tiny-image<br>
+<br>
+You can also run generated qemu images with a command like &#39;runqemu qe=
mux86-64&#39;.<br>
+<br>
+Other commonly useful commands are:<br>
+ - &#39;devtool&#39; and &#39;recipetool&#39; handle common recipe tasks<b=
r>
+ - &#39;bitbake-layers&#39; handles common layer tasks<br>
+ - &#39;oe-pkgdata-util&#39; handles common target package tasks<br>
diff --git a/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-=
10.01.10.04-config/conf-summary.txt b/conf/templates/processor-sdk_processo=
r-sdk-scarthgap-chromium-10.01.10.04-config/conf-summary.txt<br>
new file mode 100644<br>
index 0000000..18049f6<br>
--- /dev/null<br>
+++ b/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.01.1=
0.04-config/conf-summary.txt<br>
@@ -0,0 +1 @@<br>
+TI Processor SDK vchromium-10.01.10.04<br>
diff --git a/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-=
10.01.10.04-config/local.conf.sample b/conf/templates/processor-sdk_process=
or-sdk-scarthgap-chromium-10.01.10.04-config/local.conf.sample<br>
new file mode 100644<br>
index 0000000..7575b4b<br>
--- /dev/null<br>
+++ b/conf/templates/processor-sdk_processor-sdk-scarthgap-chromium-10.01.1=
0.04-config/local.conf.sample<br>
@@ -0,0 +1,175 @@<br>
+# CONF_VERSION is increased each time build/conf/ changes incompatibly<br>
+CONF_VERSION =3D &quot;2&quot;<br>
+<br>
+#<br>
+# Where to place downloads<br>
+#<br>
+# During a first build the system will download many different source code=
<br>
+# tarballs from various upstream projects. This can take a while, particul=
arly<br>
+# if your network connection is slow. These are all stored in DL_DIR. When=
<br>
+# wiping and rebuilding you can preserve this directory to speed up this p=
art<br>
+# of subsequent builds. This directory is safe to share between multiple b=
uilds<br>
+# on the same machine too.<br>
+DL_DIR =3D &quot;${TOPDIR}/downloads&quot;<br>
+<br>
+#<br>
+# Where to place shared-state files<br>
+#<br>
+# BitBake has the capability to accelerate builds based on previously buil=
t<br>
+# output. This is done using &quot;shared state&quot; files which can be t=
hought of as<br>
+# cache objects and this option determines where those files are placed.<b=
r>
+#<br>
+# You can wipe out TMPDIR leaving this directory intact and the build woul=
d<br>
+# regenerate from these files if no changes were made to the configuration=
.<br>
+# If changes were made to the configuration, only shared state files where=
 the<br>
+# state was still valid would be used (done using checksums).<br>
+SSTATE_DIR =3D &quot;${TOPDIR}/build/sstate-cache&quot;<br>
+<br>
+#<br>
+# Shared-state files from other locations<br>
+#<br>
+# As mentioned above, shared state files are prebuilt cache data objects w=
hich<br>
+# can be used to accelerate build time. This variable can be used to confi=
gure<br>
+# the system to search other mirror locations for these objects before it<=
br>
+# builds the data itself.<br>
+#<br>
+# This can be a filesystem directory, or a remote url such as http or ftp.=
<br>
+# These would contain the sstate-cache results from previous builds (possi=
bly<br>
+# from other machines). This variable works like fetcher MIRRORS/PREMIRROR=
S<br>
+# and points to the cache locations to check for the shared objects.<br>
+#SSTATE_MIRRORS ?=3D &quot;\<br>
+#file://.* <a href=3D"http://someserver.tld/share/sstate/" rel=3D"noreferr=
er" target=3D"_blank">http://someserver.tld/share/sstate/</a> \n \<br>
+#file://.* file:///some/local/dir/sstate/&quot;<br>
+<br>
+#<br>
+# Where to place the build output<br>
+#<br>
+# This option specifies where the bulk of the building work should be done=
 and<br>
+# where BitBake should place its temporary files and output. Keep in mind =
that<br>
+# this includes the extraction and compilation of many applications and th=
e toolchain<br>
+# which can use Gigabytes of hard disk space.<br>
+TMPDIR =3D &quot;${TOPDIR}/arago-tmp&quot;<br>
+<br>
+# By default, DEPLOY_DIR is inside TMPDIR, but can be changed here to be o=
utside<br>
+#DEPLOY_DIR =3D &quot;${TOPDIR}/deploy&quot;<br>
+<br>
+#<br>
+# Machine Selection<br>
+#<br>
+# You need to select a specific machine to target the build with. There ar=
e a selection<br>
+# of emulated machines available which can boot and run in the QEMU emulat=
or:<br>
+#<br>
+#MACHINE ?=3D &quot;arago&quot;<br>
+<br>
+#<br>
+# Package Management configuration<br>
+#<br>
+# This variable lists which packaging formats to enable. Multiple package =
backends<br>
+# can be enabled at once and the first item listed in the variable will be=
 used<br>
+# to generate the root filesystems.<br>
+# Options are:<br>
+#=C2=A0 - &#39;package_deb&#39; for debian style deb files<br>
+#=C2=A0 - &#39;package_ipk&#39; for ipk files are used by opkg (a debian s=
tyle embedded package manager)<br>
+#=C2=A0 - &#39;package_rpm&#39; for rpm style packages<br>
+# E.g.: PACKAGE_CLASSES ?=3D &quot;package_rpm package_deb package_ipk&quo=
t;<br>
+# We default to ipk:<br>
+PACKAGE_CLASSES ?=3D &quot;package_ipk&quot;<br>
+<br>
+#<br>
+# SDK/ADT target architecture<br>
+#<br>
+# This variable specified the architecture to build SDK/ADT items for and =
means<br>
+# you can build the SDK packages for architectures other than the machine =
you are<br>
+# running the build on (i.e. building i686 packages on an x86_64 host._<br=
>
+# Supported values are i686 and x86_64<br>
+SDKMACHINE ?=3D &quot;x86_64&quot;<br>
+<br>
+#<br>
+# Extra image configuration defaults<br>
+#<br>
+# The EXTRA_IMAGE_FEATURES variable allows extra packages to be added to t=
he generated<br>
+# images. Some of these options are added to certain image types automatic=
ally. The<br>
+# variable can contain the following options:<br>
+#=C2=A0 &quot;dbg-pkgs&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0- add -dbg packages=
 for all installed packages<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(adds symbol information for debugging/profiling)<br>
+#=C2=A0 &quot;dev-pkgs&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0- add -dev packages=
 for all installed packages<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(useful if you want to develop against libs in the image)<br>
+#=C2=A0 &quot;tools-sdk&quot;=C2=A0 =C2=A0 =C2=A0 - add development tools =
(gcc, make, pkgconfig etc.)<br>
+#=C2=A0 &quot;tools-debug&quot;=C2=A0 =C2=A0 - add debugging tools (gdb, s=
trace)<br>
+#=C2=A0 &quot;tools-profile&quot;=C2=A0 - add profiling tools (oprofile, e=
xmap, lttng valgrind (x86 only))<br>
+#=C2=A0 &quot;tools-testapps&quot; - add useful testing tools (ts_print, a=
play, arecord etc.)<br>
+#=C2=A0 &quot;debug-tweaks&quot;=C2=A0 =C2=A0- make an image suitable for =
development<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0e.g. ssh root access has a blank password<br>
+# There are other application targets that can be used here too, see<br>
+# meta/classes/image.bbclass and meta/classes/core-image.bbclass for more =
details.<br>
+# We default to enabling the debugging tweaks.<br>
+EXTRA_IMAGE_FEATURES =3D &quot;debug-tweaks&quot;<br>
+<br>
+#<br>
+# Additional image features<br>
+#<br>
+# The following is a list of additional classes to use when building image=
s which<br>
+# enable extra features. Some available options which can be included in t=
his variable<br>
+# are:<br>
+#=C2=A0 =C2=A0- &#39;buildstats&#39; collect build statistics<br>
+#=C2=A0 =C2=A0- &#39;image-swab&#39; to perform host system intrusion dete=
ction<br>
+# NOTE: mklibs also needs to be explicitly enabled for a given image, see =
local.conf.extended<br>
+USER_CLASSES ?=3D &quot;buildstats&quot;<br>
+<br>
+# By default disable interactive patch resolution (tasks will just fail in=
stead):<br>
+PATCHRESOLVE =3D &quot;noop&quot;<br>
+<br>
+# By default the machine configuration file sets the IMAGE_FSTYPES.=C2=A0 =
But if you<br>
+# would like to add additional file system types you can uncomment the<br>
+# following line and add the additional IMAGE_FSTYPES you want created<br>
+# as part of the build flow.=C2=A0 Some common types are listed below and =
you<br>
+# can remove the ones you do not want.<br>
+# IMAGE_FSTYPES +=3D &quot;jffs2 cramfs ext2.gz ext3.gz squashfs ubi tar.g=
z tar.bz2 cpio&quot;<br>
+<br>
+#<br>
+# Parallelism Options<br>
+#<br>
+# These two options control how much parallelism BitBake should use. The f=
irst<br>
+# option determines how many tasks bitbake should run in parallel:<br>
+#<br>
+# BB_NUMBER_THREADS ?=3D &quot;1&quot;<br>
+#<br>
+# The second option controls how many processes make should run in paralle=
l when<br>
+# running compile tasks:<br>
+#<br>
+# PARALLEL_MAKE ?=3D &quot;-j 1&quot;<br>
+#<br>
+# For a quad-core machine, BB_NUMBER_THREADS =3D &quot;4&quot;, PARALLEL_M=
AKE =3D &quot;-j 4&quot; would<br>
+# be appropriate for example<br>
+#<br>
+# NOTE: By default, bitbake will choose the number of processeors on your =
host<br>
+# so you should not need to set this unless you are wanting to lower the n=
umber<br>
+# allowed.<br>
+#<br>
+<br>
+DISTRO=C2=A0 =C2=A0=3D &quot;arago&quot;<br>
+<br>
+# Set terminal types by default it expects gnome-terminal<br>
+# but we chose xterm<br>
+TERMCMD =3D &quot;${XTERM_TERMCMD}&quot;<br>
+TERMCMDRUN =3D &quot;${XTERM_TERMCMDRUN}&quot;<br>
+<br>
+# Don&#39;t generate the mirror tarball for SCM repos, the snapshot is eno=
ugh<br>
+BB_GENERATE_MIRROR_TARBALLS =3D &quot;0&quot;<br>
+<br>
+# Uncomment this to remove work directory after packaging to save disk spa=
ce<br>
+#INHERIT +=3D &quot;rm_work&quot;<br>
+<br>
+# Keep one set of images by default<br>
+RM_OLD_IMAGE =3D &quot;1&quot;<br>
+<br>
+# Enable local PR service for binary feeds<br>
+PRSERV_HOST =3D &quot;localhost:0&quot;<br>
+<br>
+# Enable hash equiv server<br>
+BB_SIGNATURE_HANDLER =3D &quot;OEEquivHash&quot;<br>
+BB_HASHSERVE =3D &quot;auto&quot;<br>
+<br>
+# It is recommended to activate &quot;buildhistory&quot; for testing the P=
R service<br>
+INHERIT +=3D &quot;buildhistory&quot;<br>
+BUILDHISTORY_COMMIT =3D &quot;1&quot;<br>
diff --git a/configs/processor-sdk/processor-sdk-scarthgap-10.01.10.04-conf=
ig.txt b/configs/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.t=
xt<br>
new file mode 100644<br>
index 0000000..b1281e5<br>
--- /dev/null<br>
+++ b/configs/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.txt<=
br>
@@ -0,0 +1,17 @@<br>
+# This file takes repo entries in the format<br>
+# repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:la=
yern]<br>
+<br>
+bitbake,<a href=3D"https://git.openembedded.org/bitbake,2.8,6c2641f7a9e92c=
1b82e306f59ddd3c1249c52cbf+meta-tisdk,https://github.com/TexasInstruments/m=
eta-tisdk.git,scarthgap,10.01.10.04,layers=3D+meta-arago,https://git.yoctop=
roject.org/meta-arago,scarthgap,10.01.10,layers=3Dmeta-arago-distro:meta-ar=
ago-extras:meta-arago-demos:meta-arago-test+meta-qt5,https://github.com/met=
a-qt5/meta-qt5.git,scarthgap,eb828418264a49b8d00035cb3d7b12fcea3be801,layer=
s=3D+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,s=
carthgap,450941a1b6df96285691e8c23d4f332d3c88a994,layers=3D+meta-openembedd=
ed,https://git.openembedded.org/meta-openembedded,scarthgap,b8d1a14f7f3b764=
57c36752202ea7ae5881b6654,layers=3Dmeta-networking:meta-python:meta-oe:meta=
-gnome:meta-filesystems:meta-multimedia+meta-ti,https://git.yoctoproject.or=
g/meta-ti,scarthgap,10.01.10,layers=3Dmeta-ti-extras:meta-ti-bsp+meta-arm,h=
ttps://git.yoctoproject.org/meta-arm,scarthgap,7088279c0ab00c7dabefdd454495=
1b4746b48476,layers=3Dmeta-arm:meta-arm-toolchain+meta-clang,https://github=
.com/kraj/meta-clang,scarthgap,9fbfa9db33131abdf3870a94f00199eb53e276e5,lay=
ers=3D+oe-core,https://git.openembedded.org/openembedded-core,scarthgap,dac=
630ab5ee7aa6c5c7c294093adbd11b116c765,layers=3Dmeta" rel=3D"noreferrer" tar=
get=3D"_blank">https://git.openembedded.org/bitbake,2.8,6c2641f7a9e92c1b82e=
306f59ddd3c1249c52cbf<br>
+meta-tisdk,https://github.com/TexasInstruments/meta-tisdk.git,scarthgap,10=
.01.10.04,layers=3D<br>
+meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,10.01.10,laye=
rs=3Dmeta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test<b=
r>
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,scarthgap,eb828418264a49=
b8d00035cb3d7b12fcea3be801,layers=3D<br>
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scart=
hgap,450941a1b6df96285691e8c23d4f332d3c88a994,layers=3D<br>
+meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap=
,b8d1a14f7f3b76457c36752202ea7ae5881b6654,layers=3Dmeta-networking:meta-pyt=
hon:meta-oe:meta-gnome:meta-filesystems:meta-multimedia<br>
+meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,10.01.10,layers=3Dm=
eta-ti-extras:meta-ti-bsp<br>
+meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,7088279c0ab00c7da=
befdd4544951b4746b48476,layers=3Dmeta-arm:meta-arm-toolchain<br>
+meta-clang,https://github.com/kraj/meta-clang,scarthgap,9fbfa9db33131abdf3=
870a94f00199eb53e276e5,layers=3D<br>
+oe-core,https://git.openembedded.org/openembedded-core,scarthgap,dac630ab5=
ee7aa6c5c7c294093adbd11b116c765,layers=3Dmeta</a><br>
+<br>
+OECORELAYERCONF=3D./sample-files/bblayers.conf.sample<br>
+OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.sample<br>
+BITBAKE_INCLUSIVE_VARS=3Dyes<br>
diff --git a/configs/processor-sdk/processor-sdk-scarthgap-chromium-10.01.1=
0.04-config.txt b/configs/processor-sdk/processor-sdk-scarthgap-chromium-10=
.01.10.04-config.txt<br>
new file mode 100644<br>
index 0000000..5372ca8<br>
--- /dev/null<br>
+++ b/configs/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-co=
nfig.txt<br>
@@ -0,0 +1,19 @@<br>
+# This file takes repo entries in the format<br>
+# repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:la=
yern]<br>
+<br>
+bitbake,<a href=3D"https://git.openembedded.org/bitbake,2.8,6c2641f7a9e92c=
1b82e306f59ddd3c1249c52cbf+meta-tisdk,https://github.com/TexasInstruments/m=
eta-tisdk.git,scarthgap,10.01.10.04,layers=3D+meta-arago,https://git.yoctop=
roject.org/meta-arago,scarthgap,10.01.10,layers=3Dmeta-arago-distro:meta-ar=
ago-extras:meta-arago-demos:meta-arago-test+meta-browser,https://github.com=
/OSSystems/meta-browser.git,master,1ed2254d72a4c25879014c98be287a7e3e22904c=
,layers=3Dmeta-chromium+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,s=
carthgap,eb828418264a49b8d00035cb3d7b12fcea3be801,layers=3D+meta-virtualiza=
tion,https://git.yoctoproject.org/meta-virtualization,scarthgap,450941a1b6d=
f96285691e8c23d4f332d3c88a994,layers=3D+meta-openembedded,https://git.opene=
mbedded.org/meta-openembedded,scarthgap,b8d1a14f7f3b76457c36752202ea7ae5881=
b6654,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesyst=
ems:meta-multimedia+meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,=
10.01.10,layers=3Dmeta-ti-extras:meta-ti-bsp+meta-arm,https://git.yoctoproj=
ect.org/meta-arm,scarthgap,7088279c0ab00c7dabefdd4544951b4746b48476,layers=
=3Dmeta-arm:meta-arm-toolchain+meta-clang,https://github.com/kraj/meta-clan=
g,scarthgap,9fbfa9db33131abdf3870a94f00199eb53e276e5,layers=3D+oe-core,http=
s://git.openembedded.org/openembedded-core,scarthgap,dac630ab5ee7aa6c5c7c29=
4093adbd11b116c765,layers=3Dmeta+meta-edgeai,https://git.ti.com/git/edgeai/=
meta-edgeai.git,scarthgap,10.01.10.04,layers=3D" rel=3D"noreferrer" target=
=3D"_blank">https://git.openembedded.org/bitbake,2.8,6c2641f7a9e92c1b82e306=
f59ddd3c1249c52cbf<br>
+meta-tisdk,https://github.com/TexasInstruments/meta-tisdk.git,scarthgap,10=
.01.10.04,layers=3D<br>
+meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,10.01.10,laye=
rs=3Dmeta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test<b=
r>
+meta-browser,https://github.com/OSSystems/meta-browser.git,master,1ed2254d=
72a4c25879014c98be287a7e3e22904c,layers=3Dmeta-chromium<br>
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,scarthgap,eb828418264a49=
b8d00035cb3d7b12fcea3be801,layers=3D<br>
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scart=
hgap,450941a1b6df96285691e8c23d4f332d3c88a994,layers=3D<br>
+meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap=
,b8d1a14f7f3b76457c36752202ea7ae5881b6654,layers=3Dmeta-networking:meta-pyt=
hon:meta-oe:meta-gnome:meta-filesystems:meta-multimedia<br>
+meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,10.01.10,layers=3Dm=
eta-ti-extras:meta-ti-bsp<br>
+meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,7088279c0ab00c7da=
befdd4544951b4746b48476,layers=3Dmeta-arm:meta-arm-toolchain<br>
+meta-clang,https://github.com/kraj/meta-clang,scarthgap,9fbfa9db33131abdf3=
870a94f00199eb53e276e5,layers=3D<br>
+oe-core,https://git.openembedded.org/openembedded-core,scarthgap,dac630ab5=
ee7aa6c5c7c294093adbd11b116c765,layers=3Dmeta<br>
+meta-edgeai,https://git.ti.com/git/edgeai/meta-edgeai.git,scarthgap,10.01.=
10.04,layers=3D</a><br>
+<br>
+OECORELAYERCONF=3D./sample-files/bblayers.conf.sample<br>
+OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.sample<br>
+BITBAKE_INCLUSIVE_VARS=3Dyes<br>
diff --git a/kas/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.y=
ml b/kas/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.yml<br>
new file mode 100644<br>
index 0000000..2dc2f5c<br>
--- /dev/null<br>
+++ b/kas/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.yml<br>
@@ -0,0 +1,74 @@<br>
+header:<br>
+=C2=A0 version: 17<br>
+=C2=A0 includes:<br>
+=C2=A0 =C2=A0 - ../templates/bblayers.conf.yml<br>
+=C2=A0 =C2=A0 - ../templates/local-arago64-v2.conf.yml<br>
+<br>
+target: tisdk-default-image<br>
+<br>
+repos:<br>
+=C2=A0 meta-tisdk:<br>
+=C2=A0 =C2=A0 url: &quot;<a href=3D"https://github.com/TexasInstruments/me=
ta-tisdk.git" rel=3D"noreferrer" target=3D"_blank">https://github.com/Texas=
Instruments/meta-tisdk.git</a>&quot;<br>
+=C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
+=C2=A0 =C2=A0 commit: &quot;10.01.10.04&quot;<br>
+<br>
+=C2=A0 meta-arago:<br>
+=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject.org/meta-arag=
o" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproject.org/meta-a=
rago</a>&quot;<br>
+=C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
+=C2=A0 =C2=A0 commit: &quot;10.01.10&quot;<br>
+=C2=A0 =C2=A0 layers:<br>
+=C2=A0 =C2=A0 =C2=A0 meta-arago-distro:<br>
+=C2=A0 =C2=A0 =C2=A0 meta-arago-extras:<br>
+=C2=A0 =C2=A0 =C2=A0 meta-arago-demos:<br>
+=C2=A0 =C2=A0 =C2=A0 meta-arago-test:<br>
+<br>
+=C2=A0 meta-qt5:<br>
+=C2=A0 =C2=A0 url: &quot;<a href=3D"https://github.com/meta-qt5/meta-qt5.g=
it" rel=3D"noreferrer" target=3D"_blank">https://github.com/meta-qt5/meta-q=
t5.git</a>&quot;<br>
+=C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
+=C2=A0 =C2=A0 commit: &quot;eb828418264a49b8d00035cb3d7b12fcea3be801&quot;=
<br>
+<br>
+=C2=A0 meta-virtualization:<br>
+=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject.org/meta-virt=
ualization" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproject.o=
rg/meta-virtualization</a>&quot;<br>
+=C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
+=C2=A0 =C2=A0 commit: &quot;450941a1b6df96285691e8c23d4f332d3c88a994&quot;=
<br>
+<br>
+=C2=A0 meta-openembedded:<br>
+=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/meta-open=
embedded" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org=
/meta-openembedded</a>&quot;<br>
+=C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
+=C2=A0 =C2=A0 commit: &quot;b8d1a14f7f3b76457c36752202ea7ae5881b6654&quot;=
<br>
+=C2=A0 =C2=A0 layers:<br>
+=C2=A0 =C2=A0 =C2=A0 meta-networking:<br>
+=C2=A0 =C2=A0 =C2=A0 meta-python:<br>
+=C2=A0 =C2=A0 =C2=A0 meta-oe:<br>
+=C2=A0 =C2=A0 =C2=A0 meta-gnome:<br>
+=C2=A0 =C2=A0 =C2=A0 meta-filesystems:<br>
+=C2=A0 =C2=A0 =C2=A0 meta-multimedia:<br>
+<br>
+=C2=A0 meta-ti:<br>
+=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject.org/meta-ti" =
rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproject.org/meta-ti</=
a>&quot;<br>
+=C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
+=C2=A0 =C2=A0 commit: &quot;10.01.10&quot;<br>
+=C2=A0 =C2=A0 layers:<br>
+=C2=A0 =C2=A0 =C2=A0 meta-ti-extras:<br>
+=C2=A0 =C2=A0 =C2=A0 meta-ti-bsp:<br>
+<br>
+=C2=A0 meta-arm:<br>
+=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject.org/meta-arm"=
 rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproject.org/meta-arm=
</a>&quot;<br>
+=C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
+=C2=A0 =C2=A0 commit: &quot;7088279c0ab00c7dabefdd4544951b4746b48476&quot;=
<br>
+=C2=A0 =C2=A0 layers:<br>
+=C2=A0 =C2=A0 =C2=A0 meta-arm:<br>
+=C2=A0 =C2=A0 =C2=A0 meta-arm-toolchain:<br>
+<br>
+=C2=A0 meta-clang:<br>
+=C2=A0 =C2=A0 url: &quot;<a href=3D"https://github.com/kraj/meta-clang" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/kraj/meta-clang</a>&q=
uot;<br>
+=C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
+=C2=A0 =C2=A0 commit: &quot;9fbfa9db33131abdf3870a94f00199eb53e276e5&quot;=
<br>
+<br>
+=C2=A0 oe-core:<br>
+=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/openembed=
ded-core" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org=
/openembedded-core</a>&quot;<br>
+=C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
+=C2=A0 =C2=A0 commit: &quot;dac630ab5ee7aa6c5c7c294093adbd11b116c765&quot;=
<br>
+=C2=A0 =C2=A0 layers:<br>
+=C2=A0 =C2=A0 =C2=A0 meta:<br>
+<br>
diff --git a/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04=
-config.yml b/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.0=
4-config.yml<br>
new file mode 100644<br>
index 0000000..351d9ea<br>
--- /dev/null<br>
+++ b/kas/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.04-config=
.yml<br>
@@ -0,0 +1,86 @@<br>
+header:<br>
+=C2=A0 version: 17<br>
+=C2=A0 includes:<br>
+=C2=A0 =C2=A0 - ../templates/bblayers.conf.yml<br>
+=C2=A0 =C2=A0 - ../templates/local-arago64-v2.conf.yml<br>
+<br>
+target: tisdk-default-image<br>
+<br>
+repos:<br>
+=C2=A0 meta-tisdk:<br>
+=C2=A0 =C2=A0 url: &quot;<a href=3D"https://github.com/TexasInstruments/me=
ta-tisdk.git" rel=3D"noreferrer" target=3D"_blank">https://github.com/Texas=
Instruments/meta-tisdk.git</a>&quot;<br>
+=C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
+=C2=A0 =C2=A0 commit: &quot;10.01.10.04&quot;<br>
+<br>
+=C2=A0 meta-arago:<br>
+=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject.org/meta-arag=
o" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproject.org/meta-a=
rago</a>&quot;<br>
+=C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
+=C2=A0 =C2=A0 commit: &quot;10.01.10&quot;<br>
+=C2=A0 =C2=A0 layers:<br>
+=C2=A0 =C2=A0 =C2=A0 meta-arago-distro:<br>
+=C2=A0 =C2=A0 =C2=A0 meta-arago-extras:<br>
+=C2=A0 =C2=A0 =C2=A0 meta-arago-demos:<br>
+=C2=A0 =C2=A0 =C2=A0 meta-arago-test:<br>
+<br>
+=C2=A0 meta-browser:<br>
+=C2=A0 =C2=A0 url: &quot;<a href=3D"https://github.com/OSSystems/meta-brow=
ser.git" rel=3D"noreferrer" target=3D"_blank">https://github.com/OSSystems/=
meta-browser.git</a>&quot;<br>
+=C2=A0 =C2=A0 branch: &quot;master&quot;<br>
+=C2=A0 =C2=A0 commit: &quot;1ed2254d72a4c25879014c98be287a7e3e22904c&quot;=
<br>
+=C2=A0 =C2=A0 layers:<br>
+=C2=A0 =C2=A0 =C2=A0 meta-chromium:<br>
+<br>
+=C2=A0 meta-qt5:<br>
+=C2=A0 =C2=A0 url: &quot;<a href=3D"https://github.com/meta-qt5/meta-qt5.g=
it" rel=3D"noreferrer" target=3D"_blank">https://github.com/meta-qt5/meta-q=
t5.git</a>&quot;<br>
+=C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
+=C2=A0 =C2=A0 commit: &quot;eb828418264a49b8d00035cb3d7b12fcea3be801&quot;=
<br>
+<br>
+=C2=A0 meta-virtualization:<br>
+=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject.org/meta-virt=
ualization" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproject.o=
rg/meta-virtualization</a>&quot;<br>
+=C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
+=C2=A0 =C2=A0 commit: &quot;450941a1b6df96285691e8c23d4f332d3c88a994&quot;=
<br>
+<br>
+=C2=A0 meta-openembedded:<br>
+=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/meta-open=
embedded" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org=
/meta-openembedded</a>&quot;<br>
+=C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
+=C2=A0 =C2=A0 commit: &quot;b8d1a14f7f3b76457c36752202ea7ae5881b6654&quot;=
<br>
+=C2=A0 =C2=A0 layers:<br>
+=C2=A0 =C2=A0 =C2=A0 meta-networking:<br>
+=C2=A0 =C2=A0 =C2=A0 meta-python:<br>
+=C2=A0 =C2=A0 =C2=A0 meta-oe:<br>
+=C2=A0 =C2=A0 =C2=A0 meta-gnome:<br>
+=C2=A0 =C2=A0 =C2=A0 meta-filesystems:<br>
+=C2=A0 =C2=A0 =C2=A0 meta-multimedia:<br>
+<br>
+=C2=A0 meta-ti:<br>
+=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject.org/meta-ti" =
rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproject.org/meta-ti</=
a>&quot;<br>
+=C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
+=C2=A0 =C2=A0 commit: &quot;10.01.10&quot;<br>
+=C2=A0 =C2=A0 layers:<br>
+=C2=A0 =C2=A0 =C2=A0 meta-ti-extras:<br>
+=C2=A0 =C2=A0 =C2=A0 meta-ti-bsp:<br>
+<br>
+=C2=A0 meta-arm:<br>
+=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.yoctoproject.org/meta-arm"=
 rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproject.org/meta-arm=
</a>&quot;<br>
+=C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
+=C2=A0 =C2=A0 commit: &quot;7088279c0ab00c7dabefdd4544951b4746b48476&quot;=
<br>
+=C2=A0 =C2=A0 layers:<br>
+=C2=A0 =C2=A0 =C2=A0 meta-arm:<br>
+=C2=A0 =C2=A0 =C2=A0 meta-arm-toolchain:<br>
+<br>
+=C2=A0 meta-clang:<br>
+=C2=A0 =C2=A0 url: &quot;<a href=3D"https://github.com/kraj/meta-clang" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/kraj/meta-clang</a>&q=
uot;<br>
+=C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
+=C2=A0 =C2=A0 commit: &quot;9fbfa9db33131abdf3870a94f00199eb53e276e5&quot;=
<br>
+<br>
+=C2=A0 oe-core:<br>
+=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.openembedded.org/openembed=
ded-core" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org=
/openembedded-core</a>&quot;<br>
+=C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
+=C2=A0 =C2=A0 commit: &quot;dac630ab5ee7aa6c5c7c294093adbd11b116c765&quot;=
<br>
+=C2=A0 =C2=A0 layers:<br>
+=C2=A0 =C2=A0 =C2=A0 meta:<br>
+<br>
+=C2=A0 meta-edgeai:<br>
+=C2=A0 =C2=A0 url: &quot;<a href=3D"https://git.ti.com/git/edgeai/meta-edg=
eai.git" rel=3D"noreferrer" target=3D"_blank">https://git.ti.com/git/edgeai=
/meta-edgeai.git</a>&quot;<br>
+=C2=A0 =C2=A0 branch: &quot;scarthgap&quot;<br>
+=C2=A0 =C2=A0 commit: &quot;10.01.10.04&quot;<br>
+<br>
diff --git a/src/configs/processor-sdk/processor-sdk-scarthgap-10.01.10.04-=
config.xml b/src/configs/processor-sdk/processor-sdk-scarthgap-10.01.10.04-=
config.xml<br>
new file mode 100644<br>
index 0000000..9ee86f2<br>
--- /dev/null<br>
+++ b/src/configs/processor-sdk/processor-sdk-scarthgap-10.01.10.04-config.=
xml<br>
@@ -0,0 +1,66 @@<br>
+&lt;?xml version=3D&#39;1.0&#39;?&gt;<br>
+&lt;config&gt;<br>
+=C2=A0 =C2=A0 &lt;description&gt;TI Processor SDK v10.01.10.04&lt;/descrip=
tion&gt;<br>
+<br>
+=C2=A0 =C2=A0 &lt;xi:include href=3D&#39;../../common/targets_arago.xml&#3=
9; xmlns:xi=3D&#39;<a href=3D"http://www.w3.org/2001/XInclude&#39;/" rel=3D=
"noreferrer" target=3D"_blank">http://www.w3.org/2001/XInclude&#39;/</a>&gt=
;<br>
+=C2=A0 =C2=A0 &lt;xi:include href=3D&#39;../../templates/bblayers.conf.xml=
&#39; xmlns:xi=3D&#39;<a href=3D"http://www.w3.org/2001/XInclude&#39;/" rel=
=3D"noreferrer" target=3D"_blank">http://www.w3.org/2001/XInclude&#39;/</a>=
&gt;<br>
+=C2=A0 =C2=A0 &lt;xi:include href=3D&#39;../../templates/local-arago64-v2.=
conf.xml&#39; xmlns:xi=3D&#39;<a href=3D"http://www.w3.org/2001/XInclude&#3=
9;/" rel=3D"noreferrer" target=3D"_blank">http://www.w3.org/2001/XInclude&#=
39;/</a>&gt;<br>
+<br>
+=C2=A0 =C2=A0 &lt;bitbake url=3D&#39;<a href=3D"https://git.openembedded.o=
rg/bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.o=
rg/bitbake</a>&#39; branch=3D&#39;2.8&#39; commit=3D&#39;6c2641f7a9e92c1b82=
e306f59ddd3c1249c52cbf&#39;/&gt;<br>
+<br>
+=C2=A0 =C2=A0 &lt;repos&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;repo name=3D&#39;meta-tisdk&#39; url=3D&#3=
9;<a href=3D"https://github.com/TexasInstruments/meta-tisdk.git" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/TexasInstruments/meta-tisdk.g=
it</a>&#39; branch=3D&#39;scarthgap&#39; commit=3D&#39;10.01.10.04&#39;&gt;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;layers/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/repo&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;repo name=3D&#39;meta-arago&#39; url=3D&#3=
9;<a href=3D"https://git.yoctoproject.org/meta-arago" rel=3D"noreferrer" ta=
rget=3D"_blank">https://git.yoctoproject.org/meta-arago</a>&#39; branch=3D&=
#39;scarthgap&#39; commit=3D&#39;10.01.10&#39;&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;layers&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;layer&gt;meta-=
arago-distro&lt;/layer&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;layer&gt;meta-=
arago-extras&lt;/layer&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;layer&gt;meta-=
arago-demos&lt;/layer&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;layer&gt;meta-=
arago-test&lt;/layer&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/layers&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/repo&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;repo name=3D&#39;meta-qt5&#39; url=3D&#39;=
<a href=3D"https://github.com/meta-qt5/meta-qt5.git" rel=3D"noreferrer" tar=
get=3D"_blank">https://github.com/meta-qt5/meta-qt5.git</a>&#39; branch=3D&=
#39;scarthgap&#39; commit=3D&#39;eb828418264a49b8d00035cb3d7b12fcea3be801&#=
39;&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;layers/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/repo&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;repo name=3D&#39;meta-virtualization&#39; =
url=3D&#39;<a href=3D"https://git.yoctoproject.org/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://git.yoctoproject.org/meta-virtual=
ization</a>&#39; branch=3D&#39;scarthgap&#39; commit=3D&#39;450941a1b6df962=
85691e8c23d4f332d3c88a994&#39;&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;layers/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/repo&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;repo name=3D&#39;meta-openembedded&#39; ur=
l=3D&#39;<a href=3D"https://git.openembedded.org/meta-openembedded" rel=3D"=
noreferrer" target=3D"_blank">https://git.openembedded.org/meta-openembedde=
d</a>&#39; branch=3D&#39;scarthgap&#39; commit=3D&#39;b8d1a14f7f3b76457c367=
52202ea7ae5881b6654&#39;&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;layers&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;layer&gt;meta-=
networking&lt;/layer&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;layer&gt;meta-=
python&lt;/layer&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;layer&gt;meta-=
oe&lt;/layer&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;layer&gt;meta-=
gnome&lt;/layer&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;layer&gt;meta-=
filesystems&lt;/layer&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;layer&gt;meta-=
multimedia&lt;/layer&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/layers&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/repo&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;repo name=3D&#39;meta-ti&#39; url=3D&#39;<=
a href=3D"https://git.yoctoproject.org/meta-ti" rel=3D"noreferrer" target=
=3D"_blank">https://git.yoctoproject.org/meta-ti</a>&#39; branch=3D&#39;sca=
rthgap&#39; commit=3D&#39;10.01.10&#39;&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;layers&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;layer&gt;meta-=
ti-extras&lt;/layer&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;layer&gt;meta-=
ti-bsp&lt;/layer&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/layers&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/repo&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;repo name=3D&#39;meta-arm&#39; url=3D&#39;=
<a href=3D"https://git.yoctoproject.org/meta-arm" rel=3D"noreferrer" target=
=3D"_blank">https://git.yoctoproject.org/meta-arm</a>&#39; branch=3D&#39;sc=
arthgap&#39; commit=3D&#39;7088279c0ab00c7dabefdd4544951b4746b48476&#39;&gt=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;layers&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;layer&gt;meta-=
arm&lt;/layer&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;layer&gt;meta-=
arm-toolchain&lt;/layer&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/layers&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/repo&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;repo name=3D&#39;meta-clang&#39; url=3D&#3=
9;<a href=3D"https://github.com/kraj/meta-clang" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/kraj/meta-clang</a>&#39; branch=3D&#39;scart=
hgap&#39; commit=3D&#39;9fbfa9db33131abdf3870a94f00199eb53e276e5&#39;&gt;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;layers/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/repo&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;repo name=3D&#39;oe-core&#39; url=3D&#39;<=
a href=3D"https://git.openembedded.org/openembedded-core" rel=3D"noreferrer=
" target=3D"_blank">https://git.openembedded.org/openembedded-core</a>&#39;=
 branch=3D&#39;scarthgap&#39; commit=3D&#39;dac630ab5ee7aa6c5c7c294093adbd1=
1b116c765&#39;&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;layers&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;layer&gt;meta&=
lt;/layer&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/layers&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/repo&gt;<br>
+=C2=A0 =C2=A0 &lt;/repos&gt;<br>
+<br>
+=C2=A0 =C2=A0 &lt;tools&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;tool type=3D&#39;oe-layersetup&#39;&gt;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;var name=3D&#39;BITBAKE_INCL=
USIVE_VARS&#39; value=3D&#39;yes&#39;/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/tool&gt;<br>
+=C2=A0 =C2=A0 &lt;/tools&gt;<br>
+&lt;/config&gt;<br>
diff --git a/src/configs/processor-sdk/processor-sdk-scarthgap-chromium-10.=
01.10.04-config.xml b/src/configs/processor-sdk/processor-sdk-scarthgap-chr=
omium-10.01.10.04-config.xml<br>
new file mode 100644<br>
index 0000000..5a9df9e<br>
--- /dev/null<br>
+++ b/src/configs/processor-sdk/processor-sdk-scarthgap-chromium-10.01.10.0=
4-config.xml<br>
@@ -0,0 +1,74 @@<br>
+&lt;?xml version=3D&#39;1.0&#39;?&gt;<br>
+&lt;config&gt;<br>
+=C2=A0 =C2=A0 &lt;description&gt;TI Processor SDK vchromium-10.01.10.04&lt=
;/description&gt;<br>
+<br>
+=C2=A0 =C2=A0 &lt;xi:include href=3D&#39;../../common/targets_arago.xml&#3=
9; xmlns:xi=3D&#39;<a href=3D"http://www.w3.org/2001/XInclude&#39;/" rel=3D=
"noreferrer" target=3D"_blank">http://www.w3.org/2001/XInclude&#39;/</a>&gt=
;<br>
+=C2=A0 =C2=A0 &lt;xi:include href=3D&#39;../../templates/bblayers.conf.xml=
&#39; xmlns:xi=3D&#39;<a href=3D"http://www.w3.org/2001/XInclude&#39;/" rel=
=3D"noreferrer" target=3D"_blank">http://www.w3.org/2001/XInclude&#39;/</a>=
&gt;<br>
+=C2=A0 =C2=A0 &lt;xi:include href=3D&#39;../../templates/local-arago64-v2.=
conf.xml&#39; xmlns:xi=3D&#39;<a href=3D"http://www.w3.org/2001/XInclude&#3=
9;/" rel=3D"noreferrer" target=3D"_blank">http://www.w3.org/2001/XInclude&#=
39;/</a>&gt;<br>
+<br>
+=C2=A0 =C2=A0 &lt;bitbake url=3D&#39;<a href=3D"https://git.openembedded.o=
rg/bitbake" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.o=
rg/bitbake</a>&#39; branch=3D&#39;2.8&#39; commit=3D&#39;6c2641f7a9e92c1b82=
e306f59ddd3c1249c52cbf&#39;/&gt;<br>
+<br>
+=C2=A0 =C2=A0 &lt;repos&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;repo name=3D&#39;meta-tisdk&#39; url=3D&#3=
9;<a href=3D"https://github.com/TexasInstruments/meta-tisdk.git" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/TexasInstruments/meta-tisdk.g=
it</a>&#39; branch=3D&#39;scarthgap&#39; commit=3D&#39;10.01.10.04&#39;&gt;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;layers/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/repo&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;repo name=3D&#39;meta-arago&#39; url=3D&#3=
9;<a href=3D"https://git.yoctoproject.org/meta-arago" rel=3D"noreferrer" ta=
rget=3D"_blank">https://git.yoctoproject.org/meta-arago</a>&#39; branch=3D&=
#39;scarthgap&#39; commit=3D&#39;10.01.10&#39;&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;layers&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;layer&gt;meta-=
arago-distro&lt;/layer&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;layer&gt;meta-=
arago-extras&lt;/layer&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;layer&gt;meta-=
arago-demos&lt;/layer&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;layer&gt;meta-=
arago-test&lt;/layer&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/layers&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/repo&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;repo name=3D&#39;meta-browser&#39; url=3D&=
#39;<a href=3D"https://github.com/OSSystems/meta-browser.git" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/OSSystems/meta-browser.git</a>&#=
39; branch=3D&#39;master&#39; commit=3D&#39;1ed2254d72a4c25879014c98be287a7=
e3e22904c&#39;&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;layers&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;layer&gt;meta-=
chromium&lt;/layer&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/layers&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/repo&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;repo name=3D&#39;meta-qt5&#39; url=3D&#39;=
<a href=3D"https://github.com/meta-qt5/meta-qt5.git" rel=3D"noreferrer" tar=
get=3D"_blank">https://github.com/meta-qt5/meta-qt5.git</a>&#39; branch=3D&=
#39;scarthgap&#39; commit=3D&#39;eb828418264a49b8d00035cb3d7b12fcea3be801&#=
39;&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;layers/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/repo&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;repo name=3D&#39;meta-virtualization&#39; =
url=3D&#39;<a href=3D"https://git.yoctoproject.org/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://git.yoctoproject.org/meta-virtual=
ization</a>&#39; branch=3D&#39;scarthgap&#39; commit=3D&#39;450941a1b6df962=
85691e8c23d4f332d3c88a994&#39;&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;layers/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/repo&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;repo name=3D&#39;meta-openembedded&#39; ur=
l=3D&#39;<a href=3D"https://git.openembedded.org/meta-openembedded" rel=3D"=
noreferrer" target=3D"_blank">https://git.openembedded.org/meta-openembedde=
d</a>&#39; branch=3D&#39;scarthgap&#39; commit=3D&#39;b8d1a14f7f3b76457c367=
52202ea7ae5881b6654&#39;&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;layers&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;layer&gt;meta-=
networking&lt;/layer&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;layer&gt;meta-=
python&lt;/layer&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;layer&gt;meta-=
oe&lt;/layer&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;layer&gt;meta-=
gnome&lt;/layer&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;layer&gt;meta-=
filesystems&lt;/layer&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;layer&gt;meta-=
multimedia&lt;/layer&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/layers&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/repo&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;repo name=3D&#39;meta-ti&#39; url=3D&#39;<=
a href=3D"https://git.yoctoproject.org/meta-ti" rel=3D"noreferrer" target=
=3D"_blank">https://git.yoctoproject.org/meta-ti</a>&#39; branch=3D&#39;sca=
rthgap&#39; commit=3D&#39;10.01.10&#39;&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;layers&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;layer&gt;meta-=
ti-extras&lt;/layer&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;layer&gt;meta-=
ti-bsp&lt;/layer&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/layers&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/repo&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;repo name=3D&#39;meta-arm&#39; url=3D&#39;=
<a href=3D"https://git.yoctoproject.org/meta-arm" rel=3D"noreferrer" target=
=3D"_blank">https://git.yoctoproject.org/meta-arm</a>&#39; branch=3D&#39;sc=
arthgap&#39; commit=3D&#39;7088279c0ab00c7dabefdd4544951b4746b48476&#39;&gt=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;layers&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;layer&gt;meta-=
arm&lt;/layer&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;layer&gt;meta-=
arm-toolchain&lt;/layer&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/layers&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/repo&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;repo name=3D&#39;meta-clang&#39; url=3D&#3=
9;<a href=3D"https://github.com/kraj/meta-clang" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/kraj/meta-clang</a>&#39; branch=3D&#39;scart=
hgap&#39; commit=3D&#39;9fbfa9db33131abdf3870a94f00199eb53e276e5&#39;&gt;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;layers/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/repo&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;repo name=3D&#39;oe-core&#39; url=3D&#39;<=
a href=3D"https://git.openembedded.org/openembedded-core" rel=3D"noreferrer=
" target=3D"_blank">https://git.openembedded.org/openembedded-core</a>&#39;=
 branch=3D&#39;scarthgap&#39; commit=3D&#39;dac630ab5ee7aa6c5c7c294093adbd1=
1b116c765&#39;&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;layers&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;layer&gt;meta&=
lt;/layer&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/layers&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/repo&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;repo name=3D&#39;meta-edgeai&#39; url=3D&#=
39;<a href=3D"https://git.ti.com/git/edgeai/meta-edgeai.git" rel=3D"norefer=
rer" target=3D"_blank">https://git.ti.com/git/edgeai/meta-edgeai.git</a>&#3=
9; branch=3D&#39;scarthgap&#39; commit=3D&#39;10.01.10.04&#39;&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;layers/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/repo&gt;<br>
+=C2=A0 =C2=A0 &lt;/repos&gt;<br>
+<br>
+=C2=A0 =C2=A0 &lt;tools&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;tool type=3D&#39;oe-layersetup&#39;&gt;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;var name=3D&#39;BITBAKE_INCL=
USIVE_VARS&#39; value=3D&#39;yes&#39;/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/tool&gt;<br>
+=C2=A0 =C2=A0 &lt;/tools&gt;<br>
+&lt;/config&gt;<br>
-- <br>
2.34.1<br>
<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#15673): <a href=3D"https://lists.yoctoproject.org/g/met=
a-arago/message/15673" rel=3D"noreferrer" target=3D"_blank">https://lists.y=
octoproject.org/g/meta-arago/message/15673</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/110200559/790=
2621" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/110200559/7902621</a><br>
Group Owner: <a href=3D"mailto:meta-arago%2Bowner@lists.yoctoproject.org" t=
arget=3D"_blank">meta-arago+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-arago/unsub" =
rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/meta-=
arago/unsub</a> [<a href=3D"mailto:jcormier@criticallink.com" target=3D"_bl=
ank">jcormier@criticallink.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D=
"ltr"><div><div dir=3D"ltr"><div>Jonathan Cormier<br>Senior Software Engine=
er<div><div><div><div><br></div><div><div><font color=3D"#000000">Voice:=C2=
=A0=C2=A0<a value=3D"+13154254045">315.425.4045</a>=C2=A0x222</font></div><=
div><div><div style=3D"color:rgb(32,33,36)"><div><div><img src=3D"https://c=
i3.googleusercontent.com/mail-sig/AIorK4yQnmPDndAobohgnFohw9o8lcMLmEVCOkbl-=
k9wp4xfgM_Qz53XJlRK_dxYVNdYFLq8DCe6bY4Zl_a0"><br></div><div><div><a href=3D=
"http://www.criticallink.com/" target=3D"_blank">http://www.CriticalLink.co=
m</a></div></div></div><div>6712 Brooklawn Parkway,=C2=A0Syracuse, NY 13211=
 <font color=3D"#1155cc"><font color=3D"#1155cc"><a href=3D"https://twitter=
.com/Critical_Link" target=3D"_blank"><img alt=3D"" src=3D"https://docs.goo=
gle.com/uc?export=3Ddownload&amp;id=3D0B2vNSnu-aYu6cU1yWERrLXE0SnM&amp;revi=
d=3D0B2vNSnu-aYu6b1YrZW1SM0hueVhVS0pPWm1IOXFSc0I3ay9jPQ"></a></font></font>=
</div></div></div></div></div></div></div></div></div></div></div></div></d=
iv></div></div></div></div></div></div></div>

--0000000000007604a4062e95c8d2--

