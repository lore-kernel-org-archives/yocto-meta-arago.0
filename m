Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 331CF52998
	for <meta-arago@arago-project.org>;
	Thu, 30 Jan 2014 19:26:49 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0UJQmu8002046
	for <meta-arago@arago-project.org>; Thu, 30 Jan 2014 13:26:48 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0UJQma8001888
	for <meta-arago@arago-project.org>; Thu, 30 Jan 2014 13:26:48 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 30 Jan 2014 13:26:48 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0UJQm3S005456;
	Thu, 30 Jan 2014 13:26:48 -0600
Date: Thu, 30 Jan 2014 14:26:47 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Chase Maupin <chase.maupin@ti.com>
Message-ID: <20140130192647.GE6814@edge>
References: <1391106857-17112-1-git-send-email-chase.maupin@ti.com>
MIME-Version: 1.0
In-Reply-To: <1391106857-17112-1-git-send-email-chase.maupin@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 00/11] Dora Updates
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
X-List-Received-Date: Thu, 30 Jan 2014 19:26:49 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Jan 30, 2014 at 12:34:06PM -0600, Chase Maupin wrote:
> All,
> 
> The following patches are my preliminary Dora updates for meta-arago
> to get the process started.

Thanks! I already have some of these fixes in my local work trees from playing 
with Dora release myself, but I will gladly accept the entire set!

What's been holding me back lately, though, is the realization that I may 
drown in the amount of branches, once we start actively developing on Dora, 
w/o dropping Dylan that is still the base for many of our current releases. 
So, meta-ti now has 3 active branches (since yesterday) - master, dora and 
dylan. Similar with meta-arago, plus the current maintenance ti2013.12.x 
branch. So I was hoping to wait at least after the 2013.12.01 release or at 
least the code freeze...

-- 
Denys


> Chase Maupin (11):
>   qt4-embedded-gles: Update to 4.8.5 version
>   matrix-gui-apps-image: remove duplicate inclusion
>   matrix-gui-submenus: remove duplicate inclusion
>   eglibc-initial: remove duplicate include
>   arago-prefs: update linux-libc-headers version
>   libav: update bbappend to latest version
>   arago.conf: Add libav to LICENSE_FLAGS_WHITELIST
>   update nativesdk-linux-libc-headers version
>   libnl: Update PREFERRED_VERSION to latest
>   Update bbappends for Dora
>   bc: remove bbappend for Dora release
> 
>  meta-arago-distro/conf/distro/arago.conf           |    2 +-
>  .../conf/distro/include/arago-prefs.inc            |   14 +++++-----
>  .../conf/distro/include/toolchain-gcc.inc          |    2 +-
>  .../conf/distro/include/toolchain-linaro.inc       |    4 +--
>  ...enssh_6.1p1.bbappend => openssh_6.2p2.bbappend} |    3 +++
>  ...box_1.20.2.bbappend => busybox_1.21.1.bbappend} |    0
>  .../{dbus_1.6.8.bbappend => dbus_1.6.10.bbappend}  |    0
>  ..._2012.55.bbappend => dropbear_2013.58.bbappend} |    2 ++
>  .../recipes-extended/bc/bc/bc-1.06-fixes-1.patch   |   27 --------------------
>  .../recipes-extended/bc/bc_1.06.bbappend           |    7 -----
>  ...pe_2.4.11.bbappend => freetype_2.4.12.bbappend} |    0
>  .../{libav_0.8.4.bbappend => libav_0.8.8.bbappend} |    4 ++-
>  ...eaudio_3.0.bbappend => pulseaudio_4.0.bbappend} |    0
>  ...bbappend => nativesdk-qt4-tools_4.8.5.bbappend} |    0
>  ...4.bbappend => qt4-embedded-gles_4.8.5.bbappend} |    0
>  ..._4.8.4.bbappend => qt4-embedded_4.8.5.bbappend} |    0
>  .../{curl_7.29.0.bbappend => curl_7.32.0.bbappend} |    0
>  .../conf/distro/include/tcmode-external-arago.inc  |    2 +-
>  .../recipes-core/eglibc/eglibc-initial.inc         |    2 --
>  .../matrix/matrix-gui-apps-images_2.0.bb           |    1 -
>  .../recipes-core/matrix/matrix-gui-submenus_2.0.bb |    1 -
>  ...ed-gles_4.8.4.bb => qt4-embedded-gles_4.8.5.bb} |    0
>  22 files changed, 20 insertions(+), 51 deletions(-)
>  rename meta-arago-distro/recipes-connectivity/openssh/{openssh_6.1p1.bbappend => openssh_6.2p2.bbappend} (91%)
>  rename meta-arago-distro/recipes-core/busybox/{busybox_1.20.2.bbappend => busybox_1.21.1.bbappend} (100%)
>  rename meta-arago-distro/recipes-core/dbus/{dbus_1.6.8.bbappend => dbus_1.6.10.bbappend} (100%)
>  rename meta-arago-distro/recipes-core/dropbear/{dropbear_2012.55.bbappend => dropbear_2013.58.bbappend} (92%)
>  delete mode 100644 meta-arago-distro/recipes-extended/bc/bc/bc-1.06-fixes-1.patch
>  delete mode 100644 meta-arago-distro/recipes-extended/bc/bc_1.06.bbappend
>  rename meta-arago-distro/recipes-graphics/freetype/{freetype_2.4.11.bbappend => freetype_2.4.12.bbappend} (100%)
>  rename meta-arago-distro/recipes-multimedia/libav/{libav_0.8.4.bbappend => libav_0.8.8.bbappend} (92%)
>  rename meta-arago-distro/recipes-multimedia/pulseaudio/{pulseaudio_3.0.bbappend => pulseaudio_4.0.bbappend} (100%)
>  rename meta-arago-distro/recipes-qt/qt4/{nativesdk-qt4-tools_4.8.4.bbappend => nativesdk-qt4-tools_4.8.5.bbappend} (100%)
>  rename meta-arago-distro/recipes-qt/qt4/{qt4-embedded-gles_4.8.4.bbappend => qt4-embedded-gles_4.8.5.bbappend} (100%)
>  rename meta-arago-distro/recipes-qt/qt4/{qt4-embedded_4.8.4.bbappend => qt4-embedded_4.8.5.bbappend} (100%)
>  rename meta-arago-distro/recipes-support/curl/{curl_7.29.0.bbappend => curl_7.32.0.bbappend} (100%)
>  rename meta-arago-extras/recipes-qt/qt4/{qt4-embedded-gles_4.8.4.bb => qt4-embedded-gles_4.8.5.bb} (100%)
> 
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

