Return-Path: <paul.barker@konsulko.com>
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
	[209.85.167.177])
	by arago-project.org (Postfix) with ESMTPS id B665E52994
	for <meta-arago@arago-project.org>;
	Tue, 18 Feb 2020 15:40:03 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id z2so20492765oih.6
	for <meta-arago@arago-project.org>;
	Tue, 18 Feb 2020 07:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=mime-version:from:date:message-id:subject:to;
	bh=Oa2X5NZnu78fPaVvM4DvPOalysvTFWq1UPZSjLRZCNE=;
	b=cFGXiuGYkkqB2VYvjtNkyabqUJTQczMMmsPbwIG1iVdw2BrFXRUgH9/TEEqRSHQz0D
	NjVKXSNaO8NG4utDQUDZAqL0KxEbwrZIsUt/lUEX66ksUBJIZ/m62QqZAIpf/NyOSO93
	hZSOy9cKd2qJpMveB9zUAAlyjZWORftR1bI9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=Oa2X5NZnu78fPaVvM4DvPOalysvTFWq1UPZSjLRZCNE=;
	b=TxCcNaSJyPFztGM+NzjRQC9K5AxIp2Qb3HZUAV6CmTTe6gKbm7ChABSZJUoE3CfsK3
	hKfnL/BPEJZfa+GLxSatMZGZDDCi5eYI4LJ+S5AVi4CmcyeYRBekzAd25IlorvgSu2P1
	/ZQqwyquNzCz+mqUR5Tjd+l0yXIHmh2lAmgsPxOTIywBdF05bTyjYZKoErr0RjbGAErd
	jV6PJIZVZ0+JHWS63ykCId5Qfia81a2BJ/yDgjE+BYycJjIMoBiuKjXmsGi4aVEuNeRl
	V6xOjHompA+yHhcuds+lh+mRojdK4c/+ScRQYNYI/dPoAkp5pKklI5J5XPuRg/JCj2de
	XFBw==
X-Gm-Message-State: APjAAAUca89YQQvzXnoTJDsvG7EGxEZSA9sLkzjpWfGQm+5CDQVNCJvu
	1o1cXpl1Fz42A8z1ITyZevImvZN1lVxGexgJPUtR/5v3U6Btmxfx
X-Google-Smtp-Source: APXvYqzfepU2Ri3zl9jh/PnWTeoUQtao8cKYiO6iiJFGopkD4yMbFCK+tU+J/rorQ5n23FmXPLvpCiBkq0JVgP/nA/U=
X-Received: by 2002:a54:4e8d:: with SMTP id c13mr1585406oiy.27.1582040285056; 
	Tue, 18 Feb 2020 07:38:05 -0800 (PST)
MIME-Version: 1.0
From: Paul Barker <pbarker@konsulko.com>
Date: Tue, 18 Feb 2020 15:37:54 +0000
Message-ID: <CAM9ZRVsu3xHM4AS=8=Ver_j75inMAefZCH3231J6r6d1upg_tA@mail.gmail.com>
To: meta-arago@arago-project.org
Subject: SDK support in Arago with ARM toolchain
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
X-List-Received-Date: Tue, 18 Feb 2020 15:40:04 -0000
Content-Type: text/plain; charset="UTF-8"

Hi all,

I'm currently seeing several failures when trying to run `bitbake
tisdk-rootfs-image -c populate_sdk` with the Arago distro and the
external ARM toolchain enabled. Is this expected to be supported?

I'm currently hacking on a few of the conf files and recipes to try to
get this to build so it'd be good to know if this is tested upstream.

FYI I'm building from the ti2019.06 tag of meta-arago & meta-ti with
appropriate commits of other layers:

Build Configuration:
BB_VERSION           = "1.40.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "ubuntu-18.04"
TARGET_SYS           = "arm-linux-gnueabi"
MACHINE              = "bbe"
DISTRO               = "arago"
DISTRO_VERSION       = "2019.11"
TUNE_FEATURES        = "arm armv7a vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 = "thud:e68991ceb5933f7d03b96697e8a0ba0829feb320"
meta-oe
meta-python
meta-networking      = "thud:446bd615fd7cb9bc7a159fe5c2019ed08d1a7a93"
meta-linaro-toolchain
meta-optee           = "HEAD:615ea7561b844a3867cee4299d83d605c10b02ab"
meta-arago-distro
meta-arago-extras    = "HEAD:59ed26d26e1658e138ad4191126ba1de2d6e96d0"
meta-ti              = "HEAD:aa7bc18ca835e1ab6520790fc5e21ba54b792c55"
meta-sancloud
meta-sancloud-arago  = "thud:f91b336cc0b0a8be17940559fc8a433813429b76"
meta-rtlwifi         = "HEAD:3d920444e433ceddecb7809da0ebab278d57e1ef"
meta-browser         = "HEAD:7d701505fa99cacea5dd3791a2cb4e06b974226b"
meta-qt5             = "thud:1520d5b2b2beec5e1c3209d3178219e93ef08bca"
meta-rust            = "HEAD:9487b089ea4779c2b494b17b9254219226efa539"

Thanks,
Paul

