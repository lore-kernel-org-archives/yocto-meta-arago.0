Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE8E6C4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 00:47:15 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.88627.1701737234543940108
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 04 Dec 2023 16:47:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=wI2EGKr9;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3B50lAFW120831;
	Mon, 4 Dec 2023 18:47:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1701737230;
	bh=+e9TONxqsZ07bJWrqZezip85+tqIXmS9PmwmRb7GdHg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=wI2EGKr9jj1KlaRy1WAvNGJj6NI03x1bm/B2bUjHqjvfbmJDHJU3QEreXuVwqYMbS
	 t2glET0dRYj82ZXPDcrLvswRQTq9pUjrPgHqBbERy+wMUup9oPXcxX3ByoTArQRu70
	 ktLe6F6MJKuQaRw204q6a1N4V/CsZhH8FDMeM3YM=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3B50lAPG000396
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 4 Dec 2023 18:47:10 -0600
Received: from flwvowa02.ent.ti.com (10.64.41.53) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 4
 Dec 2023 18:47:09 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by flwvowa02.ent.ti.com
 (10.64.41.53) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2507.34; Mon, 4 Dec
 2023 18:47:09 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 4 Dec 2023 18:47:09 -0600
Received: from [10.249.36.163] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3B50l9Ua012544;
	Mon, 4 Dec 2023 18:47:09 -0600
Message-ID: <a5b86d29-3c5b-4abd-943f-650347d43393@ti.com>
Date: Mon, 4 Dec 2023 18:47:08 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [master/kirkstone][PATCH] weston-init: provide a
 custom beaglebone weston.ini file
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, <meta-arago@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20231201205006.3991-1-denis@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20231201205006.3991-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 05 Dec 2023 00:47:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15030

On 12/1/23 2:50 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> AM335x has some display/graphics hardware limitations and moreover
> BeagleBone Black only has external HDMI output, hence add a custom
> weston.ini that sets core/gbm-format=rgb565 and output/name=HDMI-A-1
> to work out of the box. The rest of the .ini file is unmodified from
> the generic one.
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---

Acked-by: Andrew Davis <afd@ti.com>

>   .../wayland/weston-init/beaglebone/weston.ini | 85 +++++++++++++++++++
>   1 file changed, 85 insertions(+)
>   create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-init/beaglebone/weston.ini
> 
> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init/beaglebone/weston.ini b/meta-arago-distro/recipes-graphics/wayland/weston-init/beaglebone/weston.ini
> new file mode 100644
> index 00000000..9fd9851d
> --- /dev/null
> +++ b/meta-arago-distro/recipes-graphics/wayland/weston-init/beaglebone/weston.ini
> @@ -0,0 +1,85 @@
> +# configuration file for Weston
> +
> +[core]
> +idle-time=0
> +#modules=xwayland.so,cms-colord.so
> +#shell=desktop-shell.so
> +gbm-format=rgb565
> +require-input=false
> +
> +[shell]
> +locking=false
> +animation=zoom
> +panel-position=top
> +startup-animation=fade
> +#background-image=/usr/share/backgrounds/gnome/Aqua.jpg
> +#background-color=0xff002244
> +#background-type=tile
> +#clock-format=minutes
> +#panel-color=0x90ff0000
> +#locking=true
> +#animation=zoom
> +#startup-animation=fade
> +#binding-modifier=ctrl
> +#num-workspaces=6
> +#cursor-theme=whiteglass
> +#cursor-size=24
> +
> +#lockscreen-icon=/usr/share/icons/gnome/256x256/actions/lock.png
> +#lockscreen=/usr/share/backgrounds/gnome/Garden.jpg
> +#homescreen=/usr/share/backgrounds/gnome/Blinds.jpg
> +#animation=fade
> +
> +#[launcher]
> +#icon=/usr/share/icons/gnome/24x24/apps/utilities-terminal.png
> +#path=/usr/bin/gnome-terminal
> +
> +#[launcher]
> +#icon=/usr/share/icons/gnome/24x24/apps/utilities-terminal.png
> +#path=/usr/bin/weston-terminal
> +
> +#[launcher]
> +#icon=/usr/share/icons/hicolor/24x24/apps/google-chrome.png
> +#path=/usr/bin/google-chrome
> +
> +#[launcher]
> +#icon=/usr/share/icons/gnome/24x24/apps/arts.png
> +#path=/build/weston-0lEgCh/weston-1.11.0/weston-flower
> +
> +#[input-method]
> +#path=/usr/libexec/weston-keyboard
> +
> +[output]
> +name=HDMI-A-1
> +#mode=1680x1050
> +#transform=90
> +#icc_profile=/usr/share/color/icc/colord/Bluish.icc
> +
> +#[output]
> +#name=VGA1
> +#mode=173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
> +#transform=flipped
> +
> +#[output]
> +#name=X1
> +#mode=1024x768
> +#transform=flipped-90
> +
> +[libinput]
> +touchscreen_calibrator=true
> +#enable_tap=true
> +
> +#[touchpad]
> +#constant_accel_factor = 50
> +#min_accel_factor = 0.16
> +#max_accel_factor = 1.0
> +
> +[screen-share]
> +command=/usr/bin/weston --backend=rdp-backend.so --shell=fullscreen-shell.so --no-clients-resize
> +
> +#[xwayland]
> +#path=/usr/bin/Xwayland
> +
> +[autolaunch]
> +# launch the calibrator on startup if a touchscreen is detected
> +path=/usr/bin/weston-launch-calibrator

