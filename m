Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 1C0AA5298D
	for <meta-arago@arago-project.org>;
	Wed,  3 Dec 2014 01:45:28 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id sB31jQui030573
	for <meta-arago@arago-project.org>; Tue, 2 Dec 2014 19:45:26 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id sB31jQV1030496
	for <meta-arago@arago-project.org>; Tue, 2 Dec 2014 19:45:26 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 2 Dec 2014 19:45:26 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id sB31jQik023708;
	Tue, 2 Dec 2014 19:45:26 -0600
Date: Tue, 2 Dec 2014 20:45:25 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20141203014525.GI5113@edge>
References: <1416990689-13265-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
In-Reply-To: <1416990689-13265-1-git-send-email-a0393906@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [for master PATCH] gstreamer: Add missing FILES_PN to populate rootfs
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
X-List-Received-Date: Wed, 03 Dec 2014 01:45:29 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Nov 26, 2014 at 02:01:28PM +0530, Karthik Ramanan wrote:
> All the libraries and binaries from GST, base-plugins,
> good-plugins and bad-plugins need to be populated into
> the target filesystem.

NAK - this is not the correct way to do what you explain here!

The code I've added to this .inc file splits out all the libraries and plugins 
into individual packages, similar to how it's done in the upstream gstreamer 
recipes:

http://arago-project.org/git/?p=meta-arago.git;a=commitdiff;h=75b485f1208f605dd7da70bf61b0a078c9c863a8


You need to list necessary library packages in the corresponding packagegroup 
to be added to the target filesystem. Or, alternatively, you can pull a "meta" 
package that lists all produced libraries and plugins. packagegroup-arago-gst 
does that already - it includes all gst-plugins-*-meta and that should already 
be set to point to the corresponding "mm-accel" packages with necessary 
PREFERRED_PROVIDER statements in arago-prefs.inc


Moreover, I don't see any files not being packaged, which would need to be 
picked up by your below FILES_* statement. The only warning I see from bitbake 
as related to gstreamer, are:

WARNING: QA Issue: gst-plugins-ducati: Files/directories were installed but not shipped
  /usr/lib/gstreamer-0.10/.debug
  /usr/lib/gstreamer-0.10/.debug/libgstducati.so
WARNING: QA Issue: gst-plugins-vpe: Files/directories were installed but not shipped
  /usr/lib/gstreamer-0.10/.debug
  /usr/lib/gstreamer-0.10/.debug/libgstvpe.so
  /usr/lib/gstreamer-0.10/.debug/libgstperf.so


So, the question would be - what are you trying to fix here?

-- 
Denys


> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  .../gstreamer/gst-plugins-package-mm-accel.inc     |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-package-mm-accel.inc b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-package-mm-accel.inc
> index a1c81f3..68f643c 100644
> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-package-mm-accel.inc
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-package-mm-accel.inc
> @@ -15,3 +15,5 @@ python split_gstreamer10_packages () {
>      do_split_packages(d, gst_libdir, 'libgst(.*)\.la$', d.expand('${PN}-%s-dev'), 'GStreamer plugin for %s (development files)', extra_depends=d.expand('${PN}-dev'))
>      do_split_packages(d, gst_libdir, 'libgst(.*)\.a$', d.expand('${PN}-%s-staticdev'), 'GStreamer plugin for %s (static development files)', extra_depends=d.expand('${PN}-staticdev'))
>  }
> +
> +FILES_${PN} += "${libdir}/gstreamer-0.10/*"
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

