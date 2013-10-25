Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 8D7265297F
	for <meta-arago@arago-project.org>;
	Fri, 25 Oct 2013 10:34:42 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9PAYfN0032333
	for <meta-arago@arago-project.org>; Fri, 25 Oct 2013 05:34:41 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9PAYf1r016379
	for <meta-arago@arago-project.org>; Fri, 25 Oct 2013 05:34:41 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 25 Oct 2013 05:34:41 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9PAYe3E010995;
	Fri, 25 Oct 2013 05:34:41 -0500
Date: Fri, 25 Oct 2013 06:34:40 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Mrinmayee Hingolikar <mrinmayee@ti.com>
Message-ID: <20131025103440.GB13772@edge>
References: <20131025093335.GA20172@ti.com>
MIME-Version: 1.0
In-Reply-To: <20131025093335.GA20172@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 0/5] GStreamer multimedia framework and plugins recipes
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
X-List-Received-Date: Fri, 25 Oct 2013 10:34:43 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Oct 25, 2013 at 03:03:35PM +0530, Mrinmayee Hingolikar wrote:
> This patch-set adds GStreamer framework and its plugins:
> base, good, bad and ugly.
> 
> The development trees for all of these components are mainitained at 
> git.ti.com and they are based on top of the Freedesktop releases.

Why? How large is the patchset on top of upstream?


> Mrinmayee Hingolikar (5):
>   multimedia: Add GStreamer multimedia framework.
>   multimedia: GStreamer base plugins
>   multimedia: GStreamer good plugins
>   multimedia: GStreamer bad plugins
>   multimedia: GStreamer ugly plugins.
> 
>  .../gstreamer/gst-plugins-bad_0.10.23.bbappend     |   25 ++++++++++++++++++++
>  .../gstreamer/gst-plugins-base_0.10.36.bbappend    |   22 +++++++++++++++++
>  .../gstreamer/gst-plugins-good_0.10.31.bbappend    |   20 ++++++++++++++++
>  .../gstreamer/gst-plugins-ugly_0.10.18.bb          |   23 ++++++++++++++++++
>  .../gstreamer/gstreamer_0.10.36.bbappend           |   16 +++++++++++++
>  5 files changed, 106 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
>  create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bbappend
>  create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bbappend
>  create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.18.bb
>  create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer_0.10.36.bbappend
> 
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

