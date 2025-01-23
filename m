Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A00A7C0218B
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 21:20:43 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.22595.1737667236774467607
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 23 Jan 2025 13:20:37 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 38D0340C86;
	Thu, 23 Jan 2025 21:20:36 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ycY8znDb_YD8; Thu, 23 Jan 2025 21:20:36 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E9E6940ACD;
	Thu, 23 Jan 2025 21:20:31 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id ADFDF16418F; Thu, 23 Jan 2025 16:20:31 -0500 (EST)
Date: Thu, 23 Jan 2025 16:20:31 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: detheridge@ti.com
Cc: rs@ti.com, meta-arago@lists.yoctoproject.org, reatmon@ti.com,
	denys@konsulko.com
Subject: Re: [meta-arago][oe-layersetup][PATCH] configs: scarthgap update
 meta-browser layer sha
Message-ID: <20250123212031.GZ21836@denix.org>
References: <20250123201215.2812931-1-detheridge@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250123201215.2812931-1-detheridge@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 23 Jan 2025 21:20:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15749

A more generic question:

There are now multiple configs with meta-browser and meta-selinux listed:

* arago-scarthgap: both meta-browser and meta-selinux are disabled
* arago-scarthgap-chromium: meta-browser is enabled, meta-selinux is disabled
* arago-scarthgap-selinux: meta-browser is disabled, meta-selinux is enabled

Since there are now separate configs, should they be cleaned up and layers 
that are disabled or unused removed from them? That way when you need to bump 
say meta-browser, you just need to update one config, not all 3.


Moreover, why only scarthgap is being updated? Are there any changes to the 
master configs?


On Thu, Jan 23, 2025 at 02:12:15PM -0600, Etheridge, Darren via lists.yoctoproject.org wrote:
> Update the various Scarthgap config files to point the meta-browser layer at the
> correct sha for Chromium 130.0.6723.91.
> 
> Signed-off-by: Darren Etheridge <detheridge@ti.com>
> ---
>  configs/arago-scarthgap-chromium-config.txt     | 2 +-
>  configs/arago-scarthgap-config.txt              | 2 +-
>  configs/arago-scarthgap-next-config.txt         | 2 +-
>  configs/arago-scarthgap-selinux-config.txt      | 2 +-
>  configs/arago-scarthgap-wip-config.txt          | 2 +-
>  kas/arago-scarthgap-chromium-config.yml         | 2 +-
>  src/configs/arago-scarthgap-chromium-config.xml | 2 +-
>  src/configs/arago-scarthgap-config.xml          | 2 +-
>  src/configs/arago-scarthgap-next-config.xml     | 2 +-
>  src/configs/arago-scarthgap-selinux-config.xml  | 2 +-
>  src/configs/arago-scarthgap-wip-config.xml      | 2 +-
>  11 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/configs/arago-scarthgap-chromium-config.txt b/configs/arago-scarthgap-chromium-config.txt
> index 9a1bd08..61d0bdb 100644
> --- a/configs/arago-scarthgap-chromium-config.txt
> +++ b/configs/arago-scarthgap-chromium-config.txt
> @@ -3,7 +3,7 @@
>  
>  bitbake,https://git.openembedded.org/bitbake,2.8,HEAD
>  meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
> -meta-browser,https://github.com/OSSystems/meta-browser.git,master,1ed2254d72a4c25879014c98be287a7e3e22904c,layers=meta-chromium
> +meta-browser,https://github.com/OSSystems/meta-browser.git,master,68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4,layers=meta-chromium
>  #meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,HEAD,layers=
>  meta-qt5,https://github.com/meta-qt5/meta-qt5.git,scarthgap,HEAD,layers=
>  meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
> diff --git a/configs/arago-scarthgap-config.txt b/configs/arago-scarthgap-config.txt
> index 3275f35..5c7adcb 100644
> --- a/configs/arago-scarthgap-config.txt
> +++ b/configs/arago-scarthgap-config.txt
> @@ -3,7 +3,7 @@
>  
>  bitbake,https://git.openembedded.org/bitbake,2.8,HEAD
>  meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
> -#meta-browser,https://github.com/OSSystems/meta-browser.git,master,1ed2254d72a4c25879014c98be287a7e3e22904c,layers=meta-chromium
> +#meta-browser,https://github.com/OSSystems/meta-browser.git,master,68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4,layers=meta-chromium
>  #meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,HEAD,layers=
>  meta-qt5,https://github.com/meta-qt5/meta-qt5.git,scarthgap,HEAD,layers=
>  meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
> diff --git a/configs/arago-scarthgap-next-config.txt b/configs/arago-scarthgap-next-config.txt
> index 58e8f96..8e96289 100644
> --- a/configs/arago-scarthgap-next-config.txt
> +++ b/configs/arago-scarthgap-next-config.txt
> @@ -11,7 +11,7 @@ MOTD: NOTE:
>  
>  bitbake,https://git.openembedded.org/bitbake,2.8,HEAD
>  meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap-next,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
> -#meta-browser,https://github.com/OSSystems/meta-browser.git,master,1ed2254d72a4c25879014c98be287a7e3e22904c,layers=meta-chromium
> +#meta-browser,https://github.com/OSSystems/meta-browser.git,master,68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4,layers=meta-chromium
>  #meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,HEAD,layers=
>  meta-qt5,https://github.com/meta-qt5/meta-qt5.git,scarthgap,HEAD,layers=
>  meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
> diff --git a/configs/arago-scarthgap-selinux-config.txt b/configs/arago-scarthgap-selinux-config.txt
> index 17dc6a4..79a1136 100644
> --- a/configs/arago-scarthgap-selinux-config.txt
> +++ b/configs/arago-scarthgap-selinux-config.txt
> @@ -3,7 +3,7 @@
>  
>  bitbake,https://git.openembedded.org/bitbake,2.8,HEAD
>  meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
> -#meta-browser,https://github.com/OSSystems/meta-browser.git,master,1ed2254d72a4c25879014c98be287a7e3e22904c,layers=meta-chromium
> +#meta-browser,https://github.com/OSSystems/meta-browser.git,master,68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4,layers=meta-chromium
>  meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,HEAD,layers=
>  meta-qt5,https://github.com/meta-qt5/meta-qt5.git,scarthgap,HEAD,layers=
>  meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
> diff --git a/configs/arago-scarthgap-wip-config.txt b/configs/arago-scarthgap-wip-config.txt
> index 8dd69c8..4cc4556 100644
> --- a/configs/arago-scarthgap-wip-config.txt
> +++ b/configs/arago-scarthgap-wip-config.txt
> @@ -3,7 +3,7 @@
>  
>  bitbake,https://git.openembedded.org/bitbake,2.8,HEAD
>  meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap-wip,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
> -#meta-browser,https://github.com/OSSystems/meta-browser.git,master,1ed2254d72a4c25879014c98be287a7e3e22904c,layers=meta-chromium
> +#meta-browser,https://github.com/OSSystems/meta-browser.git,master,68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4,layers=meta-chromium
>  #meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,HEAD,layers=
>  meta-qt5,https://github.com/meta-qt5/meta-qt5.git,scarthgap,HEAD,layers=
>  meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
> diff --git a/kas/arago-scarthgap-chromium-config.yml b/kas/arago-scarthgap-chromium-config.yml
> index 35e9e36..a6d5a51 100644
> --- a/kas/arago-scarthgap-chromium-config.yml
> +++ b/kas/arago-scarthgap-chromium-config.yml
> @@ -19,7 +19,7 @@ repos:
>    meta-browser:
>      url: "https://github.com/OSSystems/meta-browser.git"
>      branch: "master"
> -    commit: "1ed2254d72a4c25879014c98be287a7e3e22904c"
> +    commit: "68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4"
>      layers:
>        meta-chromium:
>  
> diff --git a/src/configs/arago-scarthgap-chromium-config.xml b/src/configs/arago-scarthgap-chromium-config.xml
> index 6ccf049..739ab88 100644
> --- a/src/configs/arago-scarthgap-chromium-config.xml
> +++ b/src/configs/arago-scarthgap-chromium-config.xml
> @@ -17,7 +17,7 @@
>                  <layer>meta-arago-test</layer>
>              </layers>
>          </repo>
> -        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='1ed2254d72a4c25879014c98be287a7e3e22904c'>
> +        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4'>
>              <layers>
>                  <layer>meta-chromium</layer>
>              </layers>
> diff --git a/src/configs/arago-scarthgap-config.xml b/src/configs/arago-scarthgap-config.xml
> index 5efd7cc..dc960b4 100644
> --- a/src/configs/arago-scarthgap-config.xml
> +++ b/src/configs/arago-scarthgap-config.xml
> @@ -17,7 +17,7 @@
>                  <layer>meta-arago-test</layer>
>              </layers>
>          </repo>
> -        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='1ed2254d72a4c25879014c98be287a7e3e22904c' disabled='true'>
> +        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4' disabled='true'>
>              <layers>
>                  <layer>meta-chromium</layer>
>              </layers>
> diff --git a/src/configs/arago-scarthgap-next-config.xml b/src/configs/arago-scarthgap-next-config.xml
> index f31c917..b8c096d 100644
> --- a/src/configs/arago-scarthgap-next-config.xml
> +++ b/src/configs/arago-scarthgap-next-config.xml
> @@ -18,7 +18,7 @@
>                  <layer>meta-arago-test</layer>
>              </layers>
>          </repo>
> -        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='1ed2254d72a4c25879014c98be287a7e3e22904c' disabled='true'>
> +        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4' disabled='true'>
>              <layers>
>                  <layer>meta-chromium</layer>
>              </layers>
> diff --git a/src/configs/arago-scarthgap-selinux-config.xml b/src/configs/arago-scarthgap-selinux-config.xml
> index f0d8f14..e580d4c 100644
> --- a/src/configs/arago-scarthgap-selinux-config.xml
> +++ b/src/configs/arago-scarthgap-selinux-config.xml
> @@ -17,7 +17,7 @@
>                  <layer>meta-arago-test</layer>
>              </layers>
>          </repo>
> -        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='1ed2254d72a4c25879014c98be287a7e3e22904c' disabled='true'>
> +        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4' disabled='true'>
>              <layers>
>                  <layer>meta-chromium</layer>
>              </layers>
> diff --git a/src/configs/arago-scarthgap-wip-config.xml b/src/configs/arago-scarthgap-wip-config.xml
> index 667bf89..d330ef2 100644
> --- a/src/configs/arago-scarthgap-wip-config.xml
> +++ b/src/configs/arago-scarthgap-wip-config.xml
> @@ -17,7 +17,7 @@
>                  <layer>meta-arago-test</layer>
>              </layers>
>          </repo>
> -        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='1ed2254d72a4c25879014c98be287a7e3e22904c' disabled='true'>
> +        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4' disabled='true'>
>              <layers>
>                  <layer>meta-chromium</layer>
>              </layers>
> -- 
> 2.34.1

