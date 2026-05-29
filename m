Return-Path: <romain.naour@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5091ECD6E4A
	for <webhook@archiver.kernel.org>; Fri, 29 May 2026 12:33:16 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9210.1780057992034905612
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 29 May 2026 05:33:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=pUJKJRxs;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: romain.naour@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45eea68dd6fso889706f8f.2
        for <meta-arago@lists.yoctoproject.org>; Fri, 29 May 2026 05:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1780057990; x=1780662790; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TJplqCxnDw+5nWnqQvz80ivPTd2skxY4zkZToAFNs3w=;
        b=pUJKJRxsR4tDhzEeGIZRTOq+Z1sudg49ub+2zv6Q2d4ztgSvizOFuS+pbDCtE7HOKt
         keHVIHr/4SSIsfEnthG1iuOCTg5vTMZ5OuBcrcKZ3zBzII1QL30Q+jQUeIkLCALEyjI5
         Sm26J9L7IwJotHV4YJGMF1rtbqiFMiNvmj1u8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780057990; x=1780662790;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TJplqCxnDw+5nWnqQvz80ivPTd2skxY4zkZToAFNs3w=;
        b=Fg9kdM4f6tJeJiFw/m6Wi2iy/Q189e29ckRwjcB3TVBwiVkF6CoxR56/nYB2dszhiG
         UyjAKVBqJrlaXueZim/WU6rAYJt2WfV0P5oUf6t7v9kQOhqrhfJe6Y6Lv7U+v73B1G+l
         3la8fbSsHvrQgKPgMskazVBS1WxebiR/XEvsrtx88P95SkihHdYuXZsq86f8HHv1v/8p
         mncDmGZFjqlaOdkzTFhL63Jk9OzJCxLKos/b/XFL2RFn2Q32K1nyrBXD2nKOVqw2k27D
         Tmruf7m9D4Yzwh7uSL48B6RMCRfr4uGLcS1hxYOsBTMVfLvVVdIMTD7mt2ctoXp+3sCG
         MnkQ==
X-Forwarded-Encrypted: i=1; AFNElJ8av1vdYiNj7x9FwwuBZhZDv7XFjaBhC39/G1X7ZUe/bOV0aiwkmMrqH50vBhkB6X5iCKRNtDcAvhW3@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yxb+iHfFUUKGQVr7MClrSbOCwToTRlv8BmjeRG4XUgLkKP0cSWs
	32ZAydLwVHW0jCgbhi6qCoCi3VNFePHH4E0xXvXyrkMzjW0td0MpJkcObXRBv0O4hwU=
X-Gm-Gg: Acq92OHIRqiRQNC2eWzTH44bOA9SQZ3RrXEliP0aPs70rIHzCuZEONQGa6TuHVvMEEL
	5OPgiZKm5vQV0aeSbVm+s+2t/Z26P2c7wnMg/a61KX12+wP7a25zOmIMkimg1cYbEZkIJS1dkwD
	GRp5mLLDDbA327+vadUklV6ndeVxcWdhEyQN+rYeUDe2fcvRyl6hSYwBDMjm9YbYXL0Y/DNXnMo
	bamPgQJP9YvXY1hJVN/9lADenSQieNctrvKsq2VBo9QUp2InUB5uwmIqMWmEMZgezmrcFwhVE5/
	okZLPZX4Ddf4ZM97267GOjXtkAa9xJwy99tqURmGnATBlepIe+OpuDr5MPmGzuTvC1U1yMbtI1X
	7zCuRNyKIYJDd9jXR+FosIk7WEFPNzBn2lMbfYGl+X8Ut2Ird3qHT/acpVm55cS+gs7c1FAE/aU
	VkhHwHsP/eJe478yk7MtnUE1K2ubOESTwnIam1JUYTv/qtwx4orhjNJ+r7HRAaIUrV4HdPiHiFA
	YoYj8y9xh5vHUTqOhxmooEKtdJ7h3PGzzi1hWGtgiuKdbr+Kx5XSVjlMXvJIi/nxdor0mJ3T35G
X-Received: by 2002:a05:6000:461b:b0:45e:e3ea:1101 with SMTP id ffacd0b85a97d-45ef143df69mr5458865f8f.17.1780057990362;
        Fri, 29 May 2026 05:33:10 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a? (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr. [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354cf0dsm3314264f8f.17.2026.05.29.05.33.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 05:33:10 -0700 (PDT)
Message-ID: <10cfefe3-5340-4fd2-8bb3-5d92e9dc1011@smile.fr>
Date: Fri, 29 May 2026 14:33:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap][PATCH RFC 0/4] Add support for SWUpdate
To: Anshul Dalal <anshuld@ti.com>, meta-arago@lists.yoctoproject.org
Cc: vigneshr@ti.com, denys@konsulko.com, reatmon@ti.com,
 Alban MOIZAN <alban.moizan@smile.fr>
References: <20251202111603.1616989-1-anshuld@ti.com>
Content-Language: en-US
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20251202111603.1616989-1-anshuld@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 29 May 2026 12:33:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17541

Hello Anshul, All,

Le 02/12/2025 à 12:15, Anshul Dalal a écrit :
> Hi all,
> 
> This RFC adds support for SWUpdate[1] to meta-arago, this provides us with OTA
> updates with A/B redundancy for the rootfs.

Do you have some recommendation when an upgrade should include a TI firmwares
updates (TI SCI, DM)? On the rootfs we can have some remoteproc firmwares built
with a specific TI SDK version that imply a specific TI SCI/DM firmware version
being used.

What if we want to update the system with OTA? It seems we have to update u-boot
too.

Example:
The system is running with a Yocto kirkstone based image and we want to deploy a
new Scarthgap based image. The kirkstone image will provide a DSP firmware build
with the TI SDK 09.02.00.05 while the Scarthgap image will provide a DSP
firmware build with the TI SDK 11.02.00.06.

On meta-ti kirkstone I had a regression with a DSP firmware at runtime due to a
ti-linux-fw version bump: https://lists.yoctoproject.org/g/meta-ti/message/19322
(It was probably due to an IPC/mailbox change between TI SDK 9 and 10).

The K3 bootflow that is already complex doesn't seems to expect using A/B
redundancy for the bootloader. One of the "safer" solution would to flash the
eMMC with a new image after booting with an SD card.

Best regards,
Romain

> 
> For now the support is enabled for eMMC boot only based on the 'ti-swupdate'
> override. The below steps can be used to test this RFC on an AM62x EVM:
> 
>  1. Add 'meta-swupdate' layer[2] to the SDK sources directory.
> 
>  2. Since the bootloader side changes have not been merged to ti-u-boot yet,
>     make use of the 'swupdate' branch from my own U-Boot fork[3].
> 
>  3. Enable 'swupdate' support by setting the 'ti-swupdate' override in
>     local.conf as follows:
> 
>       DISTROOVERRIDES:append = ":ti-swupdate"
> 
>  4. Flash the U-Boot binaries to the correct offsets on boot0 partition as
>     per the docs[4] and run 'env save' on first boot to save the environment to
>     eMMC's hw partition.
> 
> Regards,
> Anshul
> 
> [1]: https://swupdate.org/
> [2]: https://github.com/sbabic/meta-swupdate
> [3]: https://github.com/ArchUsr64/u-boot/tree/swupdate
> [4]: https://software-dl.ti.com/processor-sdk-linux-rt/esd/AM62X/latest/exports/docs/linux/How_to_Guides/Target/How_to_emmc_boot.html#how-to-emmc-boot
> 
> Anshul Dalal (4):
>   swupdate: add systemd service to rootfs
>   swupdate: add creation of update image
>   swupdate: add bootloader support
>   swupdate: enable authentication for update image
> 
>  meta-arago-distro/conf/distro/arago.conf      |  3 ++
>  .../images/files/sw-description               | 46 +++++++++++++++++++
>  .../recipes-swupdate/images/update-image.bb   | 27 +++++++++++
>  .../libubootenv/files/fw_env.config           |  5 ++
>  .../libubootenv/libubootenv_%.bbappend        | 10 ++++
>  .../recipes-swupdate/swupdate/files/defconfig | 12 +++++
>  .../swupdate/files/swupdate.cfg               | 13 ++++++
>  .../swupdate/files/swupdate.sh                | 15 ++++++
>  .../swupdate/swupdate_%.bbappend              | 35 ++++++++++++++
>  .../wic/sdimage-2part-swupdate.wks            |  6 +++
>  10 files changed, 172 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-swupdate/images/files/sw-description
>  create mode 100644 meta-arago-distro/recipes-swupdate/images/update-image.bb
>  create mode 100644 meta-arago-distro/recipes-swupdate/libubootenv/files/fw_env.config
>  create mode 100644 meta-arago-distro/recipes-swupdate/libubootenv/libubootenv_%.bbappend
>  create mode 100644 meta-arago-distro/recipes-swupdate/swupdate/files/defconfig
>  create mode 100644 meta-arago-distro/recipes-swupdate/swupdate/files/swupdate.cfg
>  create mode 100644 meta-arago-distro/recipes-swupdate/swupdate/files/swupdate.sh
>  create mode 100644 meta-arago-distro/recipes-swupdate/swupdate/swupdate_%.bbappend
>  create mode 100644 meta-arago-distro/wic/sdimage-2part-swupdate.wks


