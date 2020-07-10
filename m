Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 5BA7F529BC
	for <meta-arago@arago-project.org>;
	Fri, 10 Jul 2020 18:20:45 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06AII5JP060546
	for <meta-arago@arago-project.org>; Fri, 10 Jul 2020 13:18:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1594405085;
	bh=J/rdU4JY+acqrE0nR9rPNrj08fJHDve+H/C0AyKkaX4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=rE5rDTh1cH4AxN9oYFK5wf9uCW79QxKEwN2Sgg+YQkx4hxmMp4jb7+BL4hpXgLtQP
	or3HArRn06Rh+SNVzcf6VB0rfrwQfTB9jCcUW+HDYYzWF0qStsD2Xd+OZGKpkrX2yD
	ESByk1quaf6rWM0EwKIQwsZSVGCPRzTJo8Zj1IiM=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06AII4Sd040702
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 10 Jul 2020 13:18:05 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Fri, 10 Jul 2020 13:18:04 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Fri, 10 Jul 2020 13:18:04 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06AII4Jl042545;
	Fri, 10 Jul 2020 13:18:04 -0500
Date: Fri, 10 Jul 2020 14:18:04 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Gowtham Tammana <g-tammana@ti.com>
Message-ID: <20200710181804.GA12263@beryl>
References: <20200604000622.4119-1-g-tammana@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200604000622.4119-1-g-tammana@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [dunfell][PATCH] wayland-ivi-extension: Update patch to weston-8
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
X-List-Received-Date: Fri, 10 Jul 2020 18:20:45 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Gowtham,

Looks like you renmaed the patch, but didn't update the recipe for the new 
name:
http://arago-project.org/git/?p=meta-arago.git;a=blob;f=meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_2.2.0.bb;hb=HEAD
It now gives a warning about not being able to locate the patch.

Denys


On Wed, Jun 03, 2020 at 07:06:22PM -0500, Gowtham Tammana wrote:
> dunfell uses weston-8, update the ivi-id-agent dependencies patch to
> use libweston-desktop-8.
> 
> Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
> ---
>  ...i-id-agent-update-dependencies-to-build-on-weston-8.patch} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/{03-ivi-id-agent-update-dependencies-to-build-on-weston-7.patch => 03-ivi-id-agent-update-dependencies-to-build-on-weston-8.patch} (94%)
> 
> diff --git a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/03-ivi-id-agent-update-dependencies-to-build-on-weston-7.patch b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/03-ivi-id-agent-update-dependencies-to-build-on-weston-8.patch
> similarity index 94%
> rename from meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/03-ivi-id-agent-update-dependencies-to-build-on-weston-7.patch
> rename to meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/03-ivi-id-agent-update-dependencies-to-build-on-weston-8.patch
> index 1b5f64e4..1b18d9bf 100644
> --- a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/03-ivi-id-agent-update-dependencies-to-build-on-weston-7.patch
> +++ b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/03-ivi-id-agent-update-dependencies-to-build-on-weston-8.patch
> @@ -1,7 +1,7 @@
>  From b99082adfaf250b15f03345cdf1b433fb1575581 Mon Sep 17 00:00:00 2001
>  From: Rajendraprasad K J <KarammelJayakumar.Rajendraprasad@in.bosch.com>
>  Date: Mon, 6 Jan 2020 06:45:54 -0500
> -Subject: [PATCH] ivi-id-agent: update dependencies to build on weston 7
> +Subject: [PATCH] ivi-id-agent: update dependencies to build on weston 8
>  
>  upgrade libweston-desktop version.
>  
> @@ -22,7 +22,7 @@ index 3e604a5..ff47808 100644
>   pkg_check_modules(WESTON weston>=6.0.0 REQUIRED)
>   pkg_check_modules(PIXMAN pixman-1 REQUIRED)
>  -pkg_check_modules(LIBWESTON_DESKTOP libweston-desktop-6 REQUIRED)
> -+pkg_check_modules(LIBWESTON_DESKTOP libweston-desktop-7 REQUIRED)
> ++pkg_check_modules(LIBWESTON_DESKTOP libweston-desktop-8 REQUIRED)
>   
>   find_package(Threads REQUIRED)
>   
> -- 
> 2.26.2
> 

