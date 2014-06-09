Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 7367F52A88
	for <meta-arago@arago-project.org>;
	Mon,  9 Jun 2014 13:31:52 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s59DVpbt004324;
	Mon, 9 Jun 2014 08:31:51 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s59DVpGf008138;
	Mon, 9 Jun 2014 08:31:51 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 9 Jun 2014 08:31:50 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s59DVoPQ011202;
	Mon, 9 Jun 2014 08:31:50 -0500
Date: Mon, 9 Jun 2014 09:31:50 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Timur Aydin <ta@taydin.org>
Message-ID: <20140609133150.GG18034@edge>
References: <5394CB3C.5090408@taydin.org>
MIME-Version: 1.0
In-Reply-To: <5394CB3C.5090408@taydin.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] mpd: Fix download URL
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
X-List-Received-Date: Mon, 09 Jun 2014 13:31:53 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sun, Jun 08, 2014 at 11:44:44PM +0300, Timur Aydin wrote:
> diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bb
> b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bb

There is no mpd recipe in meta-arago. It resides in meta-multimedia layer of 
meta-openembedded repository. Please send this patch to the corresponding 
mailing list. Thanks.


> index 6f2a912..1bc609f 100644
> --- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bb
> +++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bb
> @@ -5,10 +5,10 @@ HOMEPAGE ="http://sourceforge.net/projects/musicpd"
> 
>  DEPENDS = "alsa-lib libsamplerate0 libsndfile1 libvorbis libogg faad2
> ffmpeg curl sqlite bzip2 pulseaudio"
> 
> -PR = "r4"
> +PR = "r5"
> 
>  SRC_URI = " \
> -    ${SOURCEFORGE_MIRROR}/musicpd/${PN}/${PV}/${PN}-${PV}.tar.bz2 \
> +    http://www.musicpd.org/download/mpd/0.17/${PN}-${PV}.tar.bz2 \
>      file://mpd.conf.in \
>  "
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

